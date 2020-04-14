Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB911A783E
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 12:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438200AbgDNKQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 06:16:21 -0400
Received: from gofer.mess.org ([88.97.38.141]:33535 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438130AbgDNKQI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 06:16:08 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C9BB011A002; Tue, 14 Apr 2020 11:16:06 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: dvb-usb: make dvb_usb_device_properties const
Date:   Tue, 14 Apr 2020 11:16:06 +0100
Message-Id: <20200414101606.5116-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes it possible to declare dvb_usb_device_properties const.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/a800.c             | 6 ++++--
 drivers/media/usb/dvb-usb/af9005.c           | 4 ++--
 drivers/media/usb/dvb-usb/az6027.c           | 4 ++--
 drivers/media/usb/dvb-usb/cxusb.c            | 4 ++--
 drivers/media/usb/dvb-usb/dib0700.h          | 6 ++++--
 drivers/media/usb/dvb-usb/dib0700_core.c     | 6 ++++--
 drivers/media/usb/dvb-usb/digitv.c           | 7 ++++---
 drivers/media/usb/dvb-usb/dvb-usb-common.h   | 2 +-
 drivers/media/usb/dvb-usb/dvb-usb-firmware.c | 2 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c     | 8 ++++----
 drivers/media/usb/dvb-usb/dvb-usb.h          | 8 ++++----
 drivers/media/usb/dvb-usb/dw2102.c           | 4 ++--
 drivers/media/usb/dvb-usb/m920x.c            | 4 ++--
 drivers/media/usb/dvb-usb/technisat-usb2.c   | 4 ++--
 drivers/media/usb/dvb-usb/ttusb2.c           | 7 ++++---
 15 files changed, 42 insertions(+), 34 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/a800.c b/drivers/media/usb/dvb-usb/a800.c
index 666213f5d5d8..770f3cad78df 100644
--- a/drivers/media/usb/dvb-usb/a800.c
+++ b/drivers/media/usb/dvb-usb/a800.c
@@ -27,8 +27,10 @@ static int a800_power_ctrl(struct dvb_usb_device *d, int onoff)
 }
 
 /* assure to put cold to 0 for iManufacturer == 1 */
-static int a800_identify_state(struct usb_device *udev, struct dvb_usb_device_properties *props,
-	struct dvb_usb_device_description **desc, int *cold)
+static int a800_identify_state(struct usb_device *udev,
+			       const struct dvb_usb_device_properties *props,
+			       const struct dvb_usb_device_description **desc,
+			       int *cold)
 {
 	*cold = udev->descriptor.iManufacturer != 1;
 	return 0;
diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
index 89b4b5d84cdf..7d4c9378e992 100644
--- a/drivers/media/usb/dvb-usb/af9005.c
+++ b/drivers/media/usb/dvb-usb/af9005.c
@@ -955,8 +955,8 @@ static int af9005_pid_filter(struct dvb_usb_adapter *adap, int index,
 }
 
 static int af9005_identify_state(struct usb_device *udev,
-				 struct dvb_usb_device_properties *props,
-				 struct dvb_usb_device_description **desc,
+				 const struct dvb_usb_device_properties *props,
+				 const struct dvb_usb_device_description **desc,
 				 int *cold)
 {
 	int ret;
diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 8de18da0c4bd..ba14e55adf25 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -1051,8 +1051,8 @@ static struct i2c_algorithm az6027_i2c_algo = {
 };
 
 static int az6027_identify_state(struct usb_device *udev,
-				 struct dvb_usb_device_properties *props,
-				 struct dvb_usb_device_description **desc,
+				 const struct dvb_usb_device_properties *props,
+				 const struct dvb_usb_device_description **desc,
 				 int *cold)
 {
 	u8 *b;
diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index c421b603be44..f89ef2054077 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -1358,8 +1358,8 @@ static int cxusb_mygica_d689_frontend_attach(struct dvb_usb_adapter *adap)
  * not, and forget a match if it turns out we selected the wrong device.
  */
 static int bluebird_fx2_identify_state(struct usb_device *udev,
-				       struct dvb_usb_device_properties *props,
-				       struct dvb_usb_device_description **desc,
+				       const struct dvb_usb_device_properties *props,
+				       const struct dvb_usb_device_description **desc,
 				       int *cold)
 {
 	int wascold = *cold;
diff --git a/drivers/media/usb/dvb-usb/dib0700.h b/drivers/media/usb/dvb-usb/dib0700.h
index ca4d3d2da969..db2263ec2123 100644
--- a/drivers/media/usb/dvb-usb/dib0700.h
+++ b/drivers/media/usb/dvb-usb/dib0700.h
@@ -61,8 +61,10 @@ extern int dib0700_download_firmware(struct usb_device *udev, const struct firmw
 extern int dib0700_rc_setup(struct dvb_usb_device *d, struct usb_interface *intf);
 extern int dib0700_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff);
 extern struct i2c_algorithm dib0700_i2c_algo;
-extern int dib0700_identify_state(struct usb_device *udev, struct dvb_usb_device_properties *props,
-			struct dvb_usb_device_description **desc, int *cold);
+extern int dib0700_identify_state(struct usb_device *udev,
+				  const struct dvb_usb_device_properties *props,
+				  const struct dvb_usb_device_description **desc,
+				  int *cold);
 extern int dib0700_change_protocol(struct rc_dev *dev, u64 *rc_proto);
 extern int dib0700_set_i2c_speed(struct dvb_usb_device *d, u16 scl_kHz);
 
diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index ef62dd6c5ae4..70219b3e8566 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -372,8 +372,10 @@ struct i2c_algorithm dib0700_i2c_algo = {
 	.functionality = dib0700_i2c_func,
 };
 
-int dib0700_identify_state(struct usb_device *udev, struct dvb_usb_device_properties *props,
-			struct dvb_usb_device_description **desc, int *cold)
+int dib0700_identify_state(struct usb_device *udev,
+			   const struct dvb_usb_device_properties *props,
+			   const struct dvb_usb_device_description **desc,
+			   int *cold)
 {
 	s16 ret;
 	u8 *b;
diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
index 131732619cc7..4da58a63f042 100644
--- a/drivers/media/usb/dvb-usb/digitv.c
+++ b/drivers/media/usb/dvb-usb/digitv.c
@@ -90,9 +90,10 @@ static struct i2c_algorithm digitv_i2c_algo = {
 };
 
 /* Callbacks for DVB USB */
-static int digitv_identify_state (struct usb_device *udev, struct
-		dvb_usb_device_properties *props, struct dvb_usb_device_description **desc,
-		int *cold)
+static int digitv_identify_state(struct usb_device *udev,
+				 const struct dvb_usb_device_properties *props,
+				 const struct dvb_usb_device_description **desc,
+				 int *cold)
 {
 	*cold = udev->descriptor.iManufacturer == 0 && udev->descriptor.iProduct == 0;
 	return 0;
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-common.h b/drivers/media/usb/dvb-usb/dvb-usb-common.h
index 8c51ac4493dd..f39a1b92dfb4 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-common.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb-common.h
@@ -26,7 +26,7 @@ extern int dvb_usb_disable_rc_polling;
 #define deb_uxfer(args...) dprintk(dvb_usb_debug,0x100,args)
 
 /* commonly used  methods */
-extern int dvb_usb_download_firmware(struct usb_device *, struct dvb_usb_device_properties *);
+extern int dvb_usb_download_firmware(struct usb_device *, const struct dvb_usb_device_properties *);
 
 extern int dvb_usb_device_power_ctrl(struct dvb_usb_device *d, int onoff);
 
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-firmware.c b/drivers/media/usb/dvb-usb/dvb-usb-firmware.c
index 42c207aacbb1..38a74793ea47 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-firmware.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-firmware.c
@@ -84,7 +84,7 @@ int usb_cypress_load_firmware(struct usb_device *udev, const struct firmware *fw
 }
 EXPORT_SYMBOL(usb_cypress_load_firmware);
 
-int dvb_usb_download_firmware(struct usb_device *udev, struct dvb_usb_device_properties *props)
+int dvb_usb_download_firmware(struct usb_device *udev, const struct dvb_usb_device_properties *props)
 {
 	int ret;
 	const struct firmware *fw = NULL;
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 16a0b4a359ea..4fbbe77e85e3 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -184,10 +184,10 @@ static int dvb_usb_init(struct dvb_usb_device *d, short *adapter_nums)
 }
 
 /* determine the name and the state of the just found USB device */
-static struct dvb_usb_device_description *dvb_usb_find_device(struct usb_device *udev, struct dvb_usb_device_properties *props, int *cold)
+static const struct dvb_usb_device_description *dvb_usb_find_device(struct usb_device *udev, const struct dvb_usb_device_properties *props, int *cold)
 {
 	int i, j;
-	struct dvb_usb_device_description *desc = NULL;
+	const struct dvb_usb_device_description *desc = NULL;
 
 	*cold = -1;
 
@@ -242,13 +242,13 @@ int dvb_usb_device_power_ctrl(struct dvb_usb_device *d, int onoff)
  * USB
  */
 int dvb_usb_device_init(struct usb_interface *intf,
-			struct dvb_usb_device_properties *props,
+			const struct dvb_usb_device_properties *props,
 			struct module *owner, struct dvb_usb_device **du,
 			short *adapter_nums)
 {
 	struct usb_device *udev = interface_to_usbdev(intf);
 	struct dvb_usb_device *d = NULL;
-	struct dvb_usb_device_description *desc = NULL;
+	const struct dvb_usb_device_description *desc = NULL;
 
 	int ret = -ENOMEM, cold = 0;
 
diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 2eb0e24e8943..39ec188a9f31 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -291,8 +291,8 @@ struct dvb_usb_device_properties {
 
 	int (*power_ctrl)       (struct dvb_usb_device *, int);
 	int (*read_mac_address) (struct dvb_usb_device *, u8 []);
-	int (*identify_state)   (struct usb_device *, struct dvb_usb_device_properties *,
-			struct dvb_usb_device_description **, int *);
+	int (*identify_state)   (struct usb_device *, const struct dvb_usb_device_properties *,
+			const struct dvb_usb_device_description **, int *);
 
 	struct {
 		enum dvb_usb_mode mode;	/* Drivers shouldn't touch on it */
@@ -436,7 +436,7 @@ struct dvb_usb_adapter {
  */
 struct dvb_usb_device {
 	struct dvb_usb_device_properties props;
-	struct dvb_usb_device_description *desc;
+	const struct dvb_usb_device_description *desc;
 
 	struct usb_device *udev;
 
@@ -473,7 +473,7 @@ struct dvb_usb_device {
 };
 
 extern int dvb_usb_device_init(struct usb_interface *,
-			       struct dvb_usb_device_properties *,
+			       const struct dvb_usb_device_properties *,
 			       struct module *, struct dvb_usb_device **,
 			       short *adapter_nums);
 extern void dvb_usb_device_exit(struct usb_interface *);
diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 1007366a295b..f255fb6d5f51 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -955,8 +955,8 @@ static int su3000_read_mac_address(struct dvb_usb_device *d, u8 mac[6])
 }
 
 static int su3000_identify_state(struct usb_device *udev,
-				 struct dvb_usb_device_properties *props,
-				 struct dvb_usb_device_description **desc,
+				 const struct dvb_usb_device_properties *props,
+				 const struct dvb_usb_device_description **desc,
 				 int *cold)
 {
 	info("%s", __func__);
diff --git a/drivers/media/usb/dvb-usb/m920x.c b/drivers/media/usb/dvb-usb/m920x.c
index d866a1990a7d..adef05309f0a 100644
--- a/drivers/media/usb/dvb-usb/m920x.c
+++ b/drivers/media/usb/dvb-usb/m920x.c
@@ -459,8 +459,8 @@ static int m920x_firmware_download(struct usb_device *udev, const struct firmwar
 
 /* Callbacks for DVB USB */
 static int m920x_identify_state(struct usb_device *udev,
-				struct dvb_usb_device_properties *props,
-				struct dvb_usb_device_description **desc,
+				const struct dvb_usb_device_properties *props,
+				const struct dvb_usb_device_description **desc,
 				int *cold)
 {
 	struct usb_host_interface *alt;
diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
index 676d233d46d5..f172120db2aa 100644
--- a/drivers/media/usb/dvb-usb/technisat-usb2.c
+++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
@@ -330,8 +330,8 @@ static void technisat_usb2_green_led_control(struct work_struct *work)
 
 /* method to find out whether the firmware has to be downloaded or not */
 static int technisat_usb2_identify_state(struct usb_device *udev,
-		struct dvb_usb_device_properties *props,
-		struct dvb_usb_device_description **desc, int *cold)
+		const struct dvb_usb_device_properties *props,
+		const struct dvb_usb_device_description **desc, int *cold)
 {
 	int ret;
 	u8 *version;
diff --git a/drivers/media/usb/dvb-usb/ttusb2.c b/drivers/media/usb/dvb-usb/ttusb2.c
index e12a5466b677..3e8cf263a69a 100644
--- a/drivers/media/usb/dvb-usb/ttusb2.c
+++ b/drivers/media/usb/dvb-usb/ttusb2.c
@@ -467,9 +467,10 @@ static int tt3650_rc_query(struct dvb_usb_device *d)
 
 
 /* Callbacks for DVB USB */
-static int ttusb2_identify_state (struct usb_device *udev, struct
-		dvb_usb_device_properties *props, struct dvb_usb_device_description **desc,
-		int *cold)
+static int ttusb2_identify_state(struct usb_device *udev,
+				 const struct dvb_usb_device_properties *props,
+				 const struct dvb_usb_device_description **desc,
+				 int *cold)
 {
 	*cold = udev->descriptor.iManufacturer == 0 && udev->descriptor.iProduct == 0;
 	return 0;
-- 
2.25.2

