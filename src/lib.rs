use zed_extension_api as zed;

struct YarnSpinnerExtension;

impl zed::Extension for YarnSpinnerExtension {
    fn new() -> Self {
        YarnSpinnerExtension
    }
}

zed::register_extension!(YarnSpinnerExtension);
