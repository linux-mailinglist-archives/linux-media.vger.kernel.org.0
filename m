Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06F2332603
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 14:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhCINEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 08:04:05 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:53579 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230046AbhCINDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 08:03:41 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Jc1Ql7ybNqY4WJc1TleOxt; Tue, 09 Mar 2021 14:03:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615295019; bh=4yOY9EZ3KDgZKonYO2ek9ThphIwfl57r8UqZJKAqmiM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UIoGjT0yBntOvKATo5CaVUXEWzFVF5rsA4Ww00EuGd0PTJ8WSdvGJlvbUfakII23v
         LhcWocL78VTKVLS4XV8yd4eD/LE71mdB28D8RyXFiEqAgF65XTXVU8Qg6GymTA9cEj
         C/3ut7PuxPt8DcAcqV4wXZbCpC6LKcuGc4NIqujU2Ds8InliqwMtnn6Od5NT7eXjH1
         +KW1BUfxKjH5PKy3RLETAE9wWMWnaSV5OZM+JatFeFlP9tFlkXAQXCCFgD9Y8GH2tB
         Gb1w1n4IAsfLAWOvAYYYvDy6IvOfiUE4ZakB+akKaoOa3HMcjIvhn2TIApG6eQFgPW
         XRclxmpg8Dbgw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sean Young <sean@mess.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/usb: fix kernel-doc header issues
Message-ID: <96fa4233-3d76-932c-2650-43903c30ee0c@xs4all.nl>
Date:   Tue, 9 Mar 2021 14:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG7Phchu7PQrf/F4OvsqnVImam+WRwipeRDuIS9kK7h+g3+4flNluRNhiZDgEatwd80zTzLwN/gb/V1feQH2GYM9WWVWHsS0hKYiTqWBND0y7POLHMR0
 49o1YrCfi856suqGxXkEnMpe0FL/1Tkl0pqgzrCP9g+UMwUXl6QDkBWfrTxwOkrftgG9VpPalboz4Ad7SWlBghFznppKD+bIlsQBkcVTapPbipK3PS5JpXbJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following kernel-doc warnings:

drivers/media/usb/dvb-usb-v2/dvb_usb.h:109: warning: cannot understand function prototype: 'struct dvb_usb_driver_info '
drivers/media/usb/dvb-usb-v2/dvb_usb.h:126: warning: cannot understand function prototype: 'struct dvb_usb_rc '
drivers/media/usb/dvb-usb-v2/dvb_usb.h:143: warning: cannot understand function prototype: 'struct usb_data_stream_properties '
drivers/media/usb/dvb-usb-v2/dvb_usb.h:170: warning: expecting prototype for properties of dvb usb device adapter(). Prototype was for
MAX_NO_OF_FE_PER_ADAP() instead
drivers/media/usb/dvb-usb-v2/dvb_usb.h:221: error: Cannot parse struct or union!
drivers/media/usb/dvb-usb-v2/dvb_usb.h:277: warning: expecting prototype for generic object of an usb stream(). Prototype was for
MAX_NO_URBS_FOR_DATA_STREAM() instead
drivers/media/usb/dvb-usb-v2/dvb_usb.h:319: warning: cannot understand function prototype: 'struct dvb_usb_adapter '
drivers/media/usb/dvb-usb-v2/dvb_usb.h:363: warning: cannot understand function prototype: 'struct dvb_usb_device '
drivers/media/usb/dvb-usb/dvb-usb.h:104: warning: cannot understand function prototype: 'struct usb_data_stream_properties '
drivers/media/usb/dvb-usb/dvb-usb.h:163: warning: expecting prototype for struct dvb_usb_adapter_properties. Prototype was for struct
dvb_usb_adapter_fe_properties instead
drivers/media/usb/dvb-usb/dvb-usb.h:205: warning: cannot understand function prototype: 'struct dvb_rc '
drivers/media/usb/dvb-usb/dvb-usb.h:227: warning: Enum value 'DVB_RC_LEGACY' not described in enum 'dvb_usb_mode'
drivers/media/usb/dvb-usb/dvb-usb.h:227: warning: Enum value 'DVB_RC_CORE' not described in enum 'dvb_usb_mode'
drivers/media/usb/dvb-usb/dvb-usb.h:271: error: Cannot parse struct or union!
drivers/media/usb/dvb-usb/dvb-usb.h:325: error: Cannot parse struct or union!
drivers/media/usb/dvb-usb/dvb-usb.h:385: warning: expecting prototype for struct dvb_usb_adapter. Prototype was for struct
dvb_usb_fe_adapter instead
drivers/media/usb/dvb-usb/dvb-usb.h:476: warning: Function parameter or member 'num_adapters_initialized' not described in 'dvb_usb_device'
drivers/media/usb/dvb-usb/dvb-usb.h:476: warning: Function parameter or member 'adapter' not described in 'dvb_usb_device'
drivers/media/usb/dvb-usb/dvb-usb.h:476: warning: Function parameter or member 'rc_phys' not described in 'dvb_usb_device'
drivers/media/usb/em28xx/em28xx.h:377: warning: cannot understand function prototype: 'enum em28xx_amux '

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Sean, please check the dvb changes: in quite a few places I had to guess
what the meaning of a field was.
---
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb.h b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
index 52bcc2d2efe5..288c15a7d72b 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb.h
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
@@ -100,7 +100,8 @@ struct dvb_usb_device;
 struct dvb_usb_adapter;

 /**
- * structure for carrying all needed data from the device driver to the general
+ * struct dvb_usb_driver_info - structure for carrying all needed data from the
+ *	device driver to the general
  * dvb usb routines
  * @name: device name
  * @rc_map: name of rc codes table
@@ -113,7 +114,7 @@ struct dvb_usb_driver_info {
 };

 /**
- * structure for remote controller configuration
+ * struct dvb_usb_rc - structure for remote controller configuration
  * @map_name: name of rc codes table
  * @allowed_protos: protocol(s) supported by the driver
  * @change_protocol: callback to change protocol
@@ -135,10 +136,11 @@ struct dvb_usb_rc {
 };

 /**
- * usb streaming configuration for adapter
+ * struct usb_data_stream_properties - usb streaming configuration for adapter
  * @type: urb type
  * @count: count of used urbs
  * @endpoint: stream usb endpoint number
+ * @u: union for @bulk and @isoc
  */
 struct usb_data_stream_properties {
 #define USB_BULK  1
@@ -160,15 +162,15 @@ struct usb_data_stream_properties {
 };

 /**
- * properties of dvb usb device adapter
+ * struct dvb_usb_adapter_properties - properties of dvb usb device adapter
  * @caps: adapter capabilities
  * @pid_filter_count: pid count of adapter pid-filter
  * @pid_filter_ctrl: called to enable/disable pid-filter
  * @pid_filter: called to set/unset pid for filtering
  * @stream: adapter usb stream configuration
  */
-#define MAX_NO_OF_FE_PER_ADAP 3
 struct dvb_usb_adapter_properties {
+#define MAX_NO_OF_FE_PER_ADAP 3
 #define DVB_USB_ADAP_HAS_PID_FILTER               0x01
 #define DVB_USB_ADAP_PID_FILTER_CAN_BE_TURNED_OFF 0x02
 #define DVB_USB_ADAP_NEED_PID_FILTERING           0x04
@@ -208,6 +210,7 @@ struct dvb_usb_adapter_properties {
  * @frontend_attach: called to attach the possible frontends
  * @frontend_detach: called to detach the possible frontends
  * @tuner_attach: called to attach the possible tuners
+ * @tuner_detach: called to detach the possible tuners
  * @frontend_ctrl: called to power on/off active frontend
  * @streaming_ctrl: called to start/stop the usb streaming of adapter
  * @init: called after adapters are created in order to finalize device
@@ -218,8 +221,8 @@ struct dvb_usb_adapter_properties {
  *  of the adapter just before streaming is started. input stream is transport
  *  stream from the demodulator and output stream is usb stream to host.
  */
-#define MAX_NO_OF_ADAPTER_PER_DEVICE 2
 struct dvb_usb_device_properties {
+#define MAX_NO_OF_ADAPTER_PER_DEVICE 2
 	const char *driver_name;
 	struct module *owner;
 	short *adapter_nr;
@@ -265,7 +268,12 @@ struct dvb_usb_device_properties {
 };

 /**
- * generic object of an usb stream
+ * struct usb_data_stream - generic object of an usb stream
+ * @udev: USB device
+ * @props: properties
+ * @state: state of the data stream
+ * @complete: complete callback
+ * @urb_list: list of URBs
  * @buf_num: number of buffer allocated
  * @buf_size: size of each buffer in buf_list
  * @buf_list: array containing all allocate buffers for streaming
@@ -273,9 +281,10 @@ struct dvb_usb_device_properties {
  *
  * @urbs_initialized: number of URBs initialized
  * @urbs_submitted: number of URBs submitted
+ * @user_priv: private pointer
  */
-#define MAX_NO_URBS_FOR_DATA_STREAM 10
 struct usb_data_stream {
+#define MAX_NO_URBS_FOR_DATA_STREAM 10
 	struct usb_device *udev;
 	struct usb_data_stream_properties props;

@@ -298,7 +307,7 @@ struct usb_data_stream {
 };

 /**
- * dvb adapter object on dvb usb device
+ * struct dvb_usb_adapter - dvb adapter object on dvb usb device
  * @props: pointer to adapter properties
  * @stream: adapter the usb data stream
  * @id: index of this adapter (starting with 0)
@@ -307,11 +316,12 @@ struct usb_data_stream {
  * @pid_filtering: is hardware pid_filtering used or not
  * @feed_count: current feed count
  * @max_feed_count: maimum feed count device can handle
+ * @active_fe: active frontend
+ * @state_bits: status bits
  * @dvb_adap: adapter dvb_adapter
  * @dmxdev: adapter dmxdev
  * @demux: adapter software demuxer
  * @dvb_net: adapter dvb_net interfaces
- * @sync_mutex: mutex used to sync control and streaming of the adapter
  * @fe: adapter frontends
  * @fe_init: rerouted frontend-init function
  * @fe_sleep: rerouted frontend-sleep function
@@ -343,7 +353,7 @@ struct dvb_usb_adapter {
 };

 /**
- * dvb usb device object
+ * struct dvb_usb_device - dvb usb device object
  * @props: device properties
  * @name: device name
  * @rc_map: name of rc codes table
@@ -355,7 +365,9 @@ struct dvb_usb_adapter {
  * @usb_mutex: mutex for usb control messages
  * @i2c_mutex: mutex for i2c-transfers
  * @i2c_adap: device's i2c-adapter
+ * @adapter: adapters
  * @rc_dev: rc device for the remote control
+ * @rc_phys: rc path
  * @rc_query_work: work for polling remote
  * @priv: private data of the actual driver (allocate by dvb usb, size defined
  *  in size_of_priv of dvb_usb_properties).
diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 741be0e69447..15f3cd733c89 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -95,7 +95,7 @@ struct dvb_usb_device;
 struct dvb_usb_adapter;
 struct usb_data_stream;

-/**
+/*
  * Properties of USB streaming - TODO this structure should be somewhere else
  * describes the kind of USB transfer used for data-streaming.
  *  (BULK or ISOC)
@@ -120,7 +120,7 @@ struct usb_data_stream_properties {
 };

 /**
- * struct dvb_usb_adapter_properties - properties of a dvb-usb-adapter.
+ * struct dvb_usb_adapter_fe_properties - properties of a dvb-usb-adapter.
  *    A DVB-USB-Adapter is basically a dvb_adapter which is present on a USB-device.
  * @caps: capabilities of the DVB USB device.
  * @pid_filter_count: number of PID filter position in the optional hardware
@@ -139,6 +139,7 @@ struct usb_data_stream_properties {
  * @tuner_attach: called to attach the correct tuner and to fill pll_addr,
  *  pll_desc and pll_init_buf of struct dvb_usb_device).
  * @stream: configuration of the USB streaming
+ * @size_of_priv: size of the priv memory in struct dvb_usb_adapter
  */
 struct dvb_usb_adapter_fe_properties {
 #define DVB_USB_ADAP_HAS_PID_FILTER               0x01
@@ -191,15 +192,17 @@ struct dvb_rc_legacy {
 };

 /**
- * struct dvb_rc properties of remote controller, using rc-core
+ * struct dvb_rc - properties of remote controller, using rc-core
  * @rc_codes: name of rc codes table
  * @protocol: type of protocol(s) currently used by the driver
  * @allowed_protos: protocol(s) supported by the driver
  * @driver_type: Used to point if a device supports raw mode
  * @change_protocol: callback to change protocol
+ * @module_name: module name
  * @rc_query: called to query an event event.
  * @rc_interval: time in ms between two queries.
  * @bulk_mode: device supports bulk mode for RC (disable polling mode)
+ * @scancode_mask: scancode mask
  */
 struct dvb_rc {
 	char *rc_codes;
@@ -219,6 +222,9 @@ struct dvb_rc {
  *		       based on rc-core
  * This is initialized/used only inside dvb-usb-remote.c.
  * It shouldn't be set by the drivers.
+ *
+ * @DVB_RC_LEGACY: legacy driver
+ * @DVB_RC_CORE: rc-core driver
  */
 enum dvb_usb_mode {
 	DVB_RC_LEGACY,
@@ -227,6 +233,7 @@ enum dvb_usb_mode {

 /**
  * struct dvb_usb_device_properties - properties of a dvb-usb-device
+ * @caps: capabilities
  * @usb_ctrl: which USB device-side controller is in use. Needed for firmware
  *  download.
  * @firmware: name of the firmware file.
@@ -243,6 +250,8 @@ enum dvb_usb_mode {
  * @priv_destroy: just like priv_init, only called before deallocating
  * the memory pointed by private field of struct dvb_usb_device.
  *
+ * @num_adapters: the number of adapters in @adapters
+ * @adapter: the adapters
  * @power_ctrl: called to enable/disable power of the device.
  * @read_mac_address: called to read the MAC address of the device.
  * @identify_state: called to determine the state (cold or warm), when it
@@ -267,9 +276,8 @@ enum dvb_usb_mode {
  * @devices: array of struct dvb_usb_device_description compatibles with these
  *  properties.
  */
-#define MAX_NO_OF_ADAPTER_PER_DEVICE 2
 struct dvb_usb_device_properties {
-
+#define MAX_NO_OF_ADAPTER_PER_DEVICE 2
 #define DVB_USB_IS_AN_I2C_ADAPTER            0x01
 	int caps;

@@ -313,6 +321,11 @@ struct dvb_usb_device_properties {

 /**
  * struct usb_data_stream - generic object of an USB stream
+ * @udev: the USB device
+ * @props: data stream properties
+ * @state: state of the stream
+ * @complete: complete callback
+ * @urb_list: list of URBs
  * @buf_num: number of buffer allocated.
  * @buf_size: size of each buffer in buf_list.
  * @buf_list: array containing all allocate buffers for streaming.
@@ -320,9 +333,10 @@ struct dvb_usb_device_properties {
  *
  * @urbs_initialized: number of URBs initialized.
  * @urbs_submitted: number of URBs submitted.
+ * @user_priv: for private use.
  */
-#define MAX_NO_URBS_FOR_DATA_STREAM 10
 struct usb_data_stream {
+#define MAX_NO_URBS_FOR_DATA_STREAM 10
 	struct usb_device                 *udev;
 	struct usb_data_stream_properties  props;

@@ -345,29 +359,15 @@ struct usb_data_stream {
 };

 /**
- * struct dvb_usb_adapter - a DVB adapter on a USB device
- * @id: index of this adapter (starting with 0).
- *
- * @feedcount: number of requested feeds (used for streaming-activation)
- * @pid_filtering: is hardware pid_filtering used or not.
- *
- * @pll_addr: I2C address of the tuner for programming
- * @pll_init: array containing the initialization buffer
- * @pll_desc: pointer to the appropriate struct dvb_pll_desc
- * @tuner_pass_ctrl: called to (de)activate tuner passthru of the demod or the board
- *
- * @dvb_adap: device's dvb_adapter.
- * @dmxdev: device's dmxdev.
- * @demux: device's software demuxer.
- * @dvb_net: device's dvb_net interfaces.
- * @dvb_frontend: device's frontend.
- * @max_feed_count: how many feeds can be handled simultaneously by this
- *  device
- *
+ * struct dvb_usb_fe_adapter - a DVB adapter on a USB device
+ * @fe: frontend
  * @fe_init:  rerouted frontend-init (wakeup) function.
  * @fe_sleep: rerouted frontend-sleep function.
- *
  * @stream: the usb data stream.
+ * @pid_filtering: is hardware pid_filtering used or not.
+ * @max_feed_count: how many feeds can be handled simultaneously by this
+ *  device
+ * @priv: private pointer
  */
 struct dvb_usb_fe_adapter {
 	struct dvb_frontend *fe;
@@ -383,6 +383,25 @@ struct dvb_usb_fe_adapter {
 	void *priv;
 };

+/**
+ * struct dvb_usb_adapter - a DVB adapter on a USB device
+ * @dev: DVB USB device pointer
+ * @props: properties
+ * @state: status
+ * @id: index of this adapter (starting with 0).
+ *
+ * @feedcount: number of requested feeds (used for streaming-activation)
+ *
+ * @dvb_adap: device's dvb_adapter.
+ * @dmxdev: device's dmxdev.
+ * @demux: device's software demuxer.
+ * @dvb_net: device's dvb_net interfaces.
+ *
+ * @fe_adap: frontend adapters
+ * @active_fe: active frontend
+ * @num_frontends_initialized: number of initialized frontends
+ * @priv: private pointer
+ */
 struct dvb_usb_adapter {
 	struct dvb_usb_device *dev;
 	struct dvb_usb_adapter_properties props;
@@ -427,8 +446,12 @@ struct dvb_usb_adapter {
  *
  * @i2c_adap: device's i2c_adapter if it uses I2CoverUSB
  *
+ * @num_adapters_initialized: number of initialized adapters
+ * @adapter: adapters
+ *
  * @rc_dev: rc device for the remote control (rc-core mode)
  * @input_dev: input device for the remote control (legacy mode)
+ * @rc_phys: rc device path
  * @rc_query_work: struct work_struct frequent rc queries
  * @last_event: last triggered event
  * @last_state: last state (no, pressed, repeat)
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 6648e11f1271..90dff693d7c5 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -335,7 +335,7 @@ enum em28xx_usb_audio_type {
 };

 /**
- * em28xx_amux - describes the type of audio input used by em28xx
+ * enum em28xx_amux - describes the type of audio input used by em28xx
  *
  * @EM28XX_AMUX_UNUSED:
  *	Used only on em28xx dev->map field, in order to mark an entry
