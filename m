Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 096D44B3676
	for <lists+linux-media@lfdr.de>; Sat, 12 Feb 2022 17:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbiBLQc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Feb 2022 11:32:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237382AbiBLQc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Feb 2022 11:32:28 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6A7197
        for <linux-media@vger.kernel.org>; Sat, 12 Feb 2022 08:32:22 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BC668101C5D; Sat, 12 Feb 2022 16:32:19 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Subject: [PATCH 1/2] media: rc-core: split IR timeout into rawir timeout and keyup delay
Date:   Sat, 12 Feb 2022 16:32:18 +0000
Message-Id: <f12316e88ac50bd6a7cc389150a759a44f355f32.1644683294.git.sean@mess.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1644683294.git.sean@mess.org>
References: <cover.1644683294.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are two timeouts relevant for IR processing:

 - The rawir_timeout specifies how long an IR space or gap has to be
   before it is converted to an IR timeout. This signals the end of an
   message.

 - The timeout for a key up event. When an keypress has been decoded a
   key down event is generated. After some time a key up event is sent,
   unless the original IR is repeated (if the user holds the button
   down), and then the key up is event is delayed. This delay should be
   what possible delay the driver or device has for decoding, for
   example is the device is polled.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/hid/hid-picolcd_cir.c               |  3 ++-
 drivers/media/cec/core/cec-core.c           |  2 +-
 drivers/media/cec/platform/seco/seco-cec.c  |  2 +-
 drivers/media/pci/cx88/cx88-input.c         |  3 ++-
 drivers/media/pci/saa7134/saa7134-input.c   |  3 ++-
 drivers/media/pci/smipcie/smipcie-ir.c      |  3 ++-
 drivers/media/rc/ene_ir.c                   | 11 ++++++-----
 drivers/media/rc/fintek-cir.c               |  3 ++-
 drivers/media/rc/gpio-ir-recv.c             |  3 ++-
 drivers/media/rc/igorplugusb.c              |  5 +++--
 drivers/media/rc/iguanair.c                 |  2 +-
 drivers/media/rc/ir-hix5hd2.c               |  3 ++-
 drivers/media/rc/ir-mce_kbd-decoder.c       |  2 +-
 drivers/media/rc/ir_toy.c                   |  3 ++-
 drivers/media/rc/ite-cir.c                  |  3 ++-
 drivers/media/rc/lirc_dev.c                 |  6 +++---
 drivers/media/rc/mceusb.c                   |  9 +++++----
 drivers/media/rc/meson-ir.c                 |  3 ++-
 drivers/media/rc/mtk-cir.c                  |  3 ++-
 drivers/media/rc/nuvoton-cir.c              |  3 ++-
 drivers/media/rc/rc-ir-raw.c                | 10 +++++-----
 drivers/media/rc/rc-loopback.c              |  5 +++--
 drivers/media/rc/rc-main.c                  |  8 +++++---
 drivers/media/rc/redrat3.c                  |  5 +++--
 drivers/media/rc/serial_ir.c                |  7 ++++---
 drivers/media/rc/st_rc.c                    |  8 ++++++--
 drivers/media/rc/streamzap.c                |  5 +++--
 drivers/media/rc/sunxi-cir.c                |  7 ++++---
 drivers/media/rc/ttusbir.c                  |  3 ++-
 drivers/media/rc/winbond-cir.c              |  3 ++-
 drivers/media/rc/xbox_remote.c              |  2 +-
 drivers/media/usb/dvb-usb-v2/dvb_usb.h      |  3 ++-
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c |  3 ++-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c     |  3 ++-
 include/media/rc-core.h                     | 11 +++++++----
 35 files changed, 96 insertions(+), 62 deletions(-)

diff --git a/drivers/hid/hid-picolcd_cir.c b/drivers/hid/hid-picolcd_cir.c
index d6faa0e00f95a..d8181c890e6ab 100644
--- a/drivers/hid/hid-picolcd_cir.c
+++ b/drivers/hid/hid-picolcd_cir.c
@@ -114,7 +114,8 @@ int picolcd_init_cir(struct picolcd_data *data, struct hid_report *report)
 	rdev->dev.parent       = &data->hdev->dev;
 	rdev->driver_name      = PICOLCD_NAME;
 	rdev->map_name         = RC_MAP_RC6_MCE;
-	rdev->timeout          = MS_TO_US(100);
+	rdev->rawir_timeout    = MS_TO_US(100);
+	rdev->keyup_delay      = MS_TO_US(100);
 	rdev->rx_resolution    = 1;
 
 	ret = rc_register_device(rdev);
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index a3ab6a43fb14a..0247bbe4c97e1 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -312,7 +312,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	adap->rc->allowed_protocols = RC_PROTO_BIT_CEC;
 	adap->rc->priv = adap;
 	adap->rc->map_name = RC_MAP_CEC;
-	adap->rc->timeout = MS_TO_US(550);
+	adap->rc->keyup_delay = MS_TO_US(550);
 #endif
 	return adap;
 }
diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index ae138cc253fde..e1176f67f89a5 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -369,7 +369,7 @@ static int secocec_ir_probe(void *priv)
 	cec->ir->allowed_protocols = RC_PROTO_BIT_RC5;
 	cec->ir->priv = cec;
 	cec->ir->map_name = RC_MAP_HAUPPAUGE;
-	cec->ir->timeout = MS_TO_US(100);
+	cec->ir->keyup_delay = MS_TO_US(100);
 
 	/* Clear the status register */
 	status = smb_rd16(SECOCEC_STATUS_REG_1, &val);
diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
index ce0ef0b8186f5..8325865149623 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -479,7 +479,8 @@ int cx88_ir_init(struct cx88_core *core, struct pci_dev *pci)
 	dev->scancode_mask = hardware_mask;
 
 	if (ir->sampling) {
-		dev->timeout = MS_TO_US(10); /* 10 ms */
+		dev->rawir_timeout = MS_TO_US(10); /* 10 ms */
+		dev->keyup_delay = MS_TO_US(10); /* 10 ms */
 	} else {
 		dev->driver_type = RC_DRIVER_SCANCODE;
 		dev->allowed_protocols = rc_proto;
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 8610eb473b39e..cda6be9633110 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -812,7 +812,8 @@ int saa7134_input_init1(struct saa7134_dev *dev)
 	rc->map_name = ir_codes;
 	rc->driver_name = MODULE_NAME;
 	rc->min_timeout = 1;
-	rc->timeout = IR_DEFAULT_TIMEOUT;
+	rc->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	rc->keyup_delay = IR_DEFAULT_TIMEOUT;
 	rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 
 	err = rc_register_device(rc);
diff --git a/drivers/media/pci/smipcie/smipcie-ir.c b/drivers/media/pci/smipcie/smipcie-ir.c
index c0604d9c70119..c50b8fc727294 100644
--- a/drivers/media/pci/smipcie/smipcie-ir.c
+++ b/drivers/media/pci/smipcie/smipcie-ir.c
@@ -156,7 +156,8 @@ int smi_ir_init(struct smi_dev *dev)
 	rc_dev->dev.parent = &dev->pci_dev->dev;
 
 	rc_dev->map_name = dev->info->rc_map;
-	rc_dev->timeout = SMI_SAMPLE_PERIOD * SMI_SAMPLE_IDLEMIN;
+	rc_dev->rawir_timeout = SMI_SAMPLE_PERIOD * SMI_SAMPLE_IDLEMIN;
+	rc_dev->keyup_delay = SMI_SAMPLE_PERIOD * SMI_SAMPLE_IDLEMIN;
 	rc_dev->rx_resolution = SMI_SAMPLE_PERIOD;
 
 	ir->rc_dev = rc_dev;
diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index e09270916fbca..dd0ef832ca9d7 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -454,10 +454,10 @@ static void ene_rx_setup(struct ene_device *dev)
 	if (dev->hw_learning_and_tx_capable)
 		dev->rdev->tx_resolution = sample_period;
 
-	if (dev->rdev->timeout > dev->rdev->max_timeout)
-		dev->rdev->timeout = dev->rdev->max_timeout;
-	if (dev->rdev->timeout < dev->rdev->min_timeout)
-		dev->rdev->timeout = dev->rdev->min_timeout;
+	if (dev->rdev->rawir_timeout > dev->rdev->max_timeout)
+		dev->rdev->rawir_timeout = dev->rdev->max_timeout;
+	if (dev->rdev->rawir_timeout < dev->rdev->min_timeout)
+		dev->rdev->rawir_timeout = dev->rdev->min_timeout;
 }
 
 /* Enable the device for receive */
@@ -818,7 +818,8 @@ static void ene_setup_default_settings(struct ene_device *dev)
 	dev->learning_mode_enabled = learning_mode_force;
 
 	/* Set reasonable default timeout */
-	dev->rdev->timeout = MS_TO_US(150);
+	dev->rdev->rawir_timeout = MS_TO_US(150);
+	dev->rdev->keyup_delay = MS_TO_US(150);
 }
 
 /* Upload all hardware settings at once. Used at load and resume time */
diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index 3fb0968efd57d..e9f18a68ef457 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -524,7 +524,8 @@ static int fintek_probe(struct pnp_dev *pdev, const struct pnp_device_id *dev_id
 	rdev->dev.parent = &pdev->dev;
 	rdev->driver_name = FINTEK_DRIVER_NAME;
 	rdev->map_name = RC_MAP_RC6_MCE;
-	rdev->timeout = 1000;
+	rdev->rawir_timeout = 1000;
+	rdev->keyup_delay = 1000;
 	/* rx resolution is hardwired to 50us atm, 1, 25, 100 also possible */
 	rdev->rx_resolution = CIR_SAMPLE_PERIOD;
 
diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 22e524b69806a..9474fd21b11bb 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -99,7 +99,8 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 	rcdev->dev.parent = dev;
 	rcdev->driver_name = KBUILD_MODNAME;
 	rcdev->min_timeout = 1;
-	rcdev->timeout = IR_DEFAULT_TIMEOUT;
+	rcdev->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	rcdev->keyup_delay = MS_TO_US(40);
 	rcdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rcdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rcdev->map_name = of_get_property(np, "linux,rc-map-name", NULL);
diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index b40dbf5001869..d42ea8ed75a28 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -81,7 +81,7 @@ static void igorplugusb_irdata(struct igorplugusb *ir, unsigned len)
 		} while (i != start);
 
 		/* add a trailing space */
-		rawir.duration = ir->rc->timeout;
+		rawir.duration = ir->rc->rawir_timeout;
 		rawir.pulse = false;
 		ir_raw_event_store_with_filter(ir->rc, &rawir);
 
@@ -204,7 +204,8 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	rc->priv = ir;
 	rc->driver_name = DRIVER_NAME;
 	rc->map_name = RC_MAP_HAUPPAUGE;
-	rc->timeout = MS_TO_US(100);
+	rc->rawir_timeout = MS_TO_US(100);
+	rc->keyup_delay = MS_TO_US(100);
 	rc->rx_resolution = 85;
 
 	ir->rc = rc;
diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index c9cb8277723f4..f434e8037035e 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -461,7 +461,7 @@ static int iguanair_probe(struct usb_interface *intf,
 	rc->driver_name = KBUILD_MODNAME;
 	rc->map_name = RC_MAP_RC6_MCE;
 	rc->min_timeout = 1;
-	rc->timeout = IR_DEFAULT_TIMEOUT;
+	rc->rawir_timeout = IR_DEFAULT_TIMEOUT;
 	rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rc->rx_resolution = RX_RESOLUTION;
 
diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 4ff954b11dc77..a499f98d2163f 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -310,7 +310,8 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	rdev->input_id.product = 0x0001;
 	rdev->input_id.version = 0x0100;
 	rdev->rx_resolution = 10;
-	rdev->timeout = IR_CFG_SYMBOL_MAXWIDTH * 10;
+	rdev->rawir_timeout = IR_CFG_SYMBOL_MAXWIDTH * 10;
+	rdev->keyup_delay = IR_CFG_SYMBOL_MAXWIDTH * 10;
 
 	ret = rc_register_device(rdev);
 	if (ret < 0)
diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index 66e8feb9a569a..0f93960021004 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -320,7 +320,7 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct ir_raw_event ev)
 				data->body);
 			spin_lock(&data->keylock);
 			if (scancode) {
-				delay = usecs_to_jiffies(dev->timeout) +
+				delay = usecs_to_jiffies(dev->keyup_delay) +
 					msecs_to_jiffies(100);
 				mod_timer(&data->rx_timeout, jiffies + delay);
 			} else {
diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index 1968067092594..5407db98a9626 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -489,7 +489,8 @@ static int irtoy_probe(struct usb_interface *intf,
 	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->map_name = RC_MAP_RC6_MCE;
 	rc->rx_resolution = UNIT_US;
-	rc->timeout = IR_DEFAULT_TIMEOUT;
+	rc->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	rc->keyup_delay = IR_DEFAULT_TIMEOUT;
 
 	/*
 	 * end of transmission is detected by absence of a usb packet
diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index fcfadd7ea31cf..dc2a66781f47e 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1377,7 +1377,8 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	/* FIFO threshold is 17 bytes, so 17 * 8 samples minimum */
 	rdev->min_timeout = 17 * 8 * ITE_BAUDRATE_DIVISOR *
 			    sample_period / 1000;
-	rdev->timeout = IR_DEFAULT_TIMEOUT;
+	rdev->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	rdev->keyup_delay = IR_DEFAULT_TIMEOUT;
 	rdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rdev->rx_resolution = ITE_BAUDRATE_DIVISOR * sample_period / 1000;
 	rdev->tx_resolution = ITE_BAUDRATE_DIVISOR * sample_period / 1000;
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 765375bda0c6e..e7eff7eef687f 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -545,15 +545,15 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			else if (dev->s_timeout)
 				ret = dev->s_timeout(dev, val);
 			else
-				dev->timeout = val;
+				dev->rawir_timeout = val;
 		}
 		break;
 
 	case LIRC_GET_REC_TIMEOUT:
-		if (!dev->timeout)
+		if (!dev->rawir_timeout)
 			ret = -ENOTTY;
 		else
-			val = dev->timeout;
+			val = dev->rawir_timeout;
 		break;
 
 	case LIRC_SET_REC_TIMEOUT_REPORTS:
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 2dc810f5a73f7..9adfc5856ff11 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1203,7 +1203,7 @@ static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_in)
 	switch (subcmd) {
 	/* 2-byte return value commands */
 	case MCE_RSP_EQIRTIMEOUT:
-		ir->rc->timeout = (*hi << 8 | *lo) * MCE_TIME_UNIT;
+		ir->rc->rawir_timeout = (*hi << 8 | *lo) * MCE_TIME_UNIT;
 		break;
 	case MCE_RSP_EQIRNUMPORTS:
 		ir->num_txports = *hi;
@@ -1335,7 +1335,7 @@ static void mceusb_process_ir_data(struct mceusb_dev *ir, int buf_len)
 			} else {
 				struct ir_raw_event ev = {
 					.timeout = 1,
-					.duration = ir->rc->timeout
+					.duration = ir->rc->rawir_timeout
 				};
 
 				if (ir_raw_event_store_with_filter(ir->rc,
@@ -1615,7 +1615,8 @@ static struct rc_dev *mceusb_init_rc_dev(struct mceusb_dev *ir)
 	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->rx_resolution = MCE_TIME_UNIT;
 	rc->min_timeout = MCE_TIME_UNIT;
-	rc->timeout = MS_TO_US(100);
+	rc->rawir_timeout = MS_TO_US(100);
+	rc->keyup_delay = MS_TO_US(100);
 	if (!mceusb_model[ir->model].broken_irtimeout) {
 		rc->s_timeout = mceusb_set_timeout;
 		rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
@@ -1624,7 +1625,7 @@ static struct rc_dev *mceusb_init_rc_dev(struct mceusb_dev *ir)
 		 * If we can't set the timeout using CMD_SETIRTIMEOUT, we can
 		 * rely on software timeouts for timeouts < 100ms.
 		 */
-		rc->max_timeout = rc->timeout;
+		rc->max_timeout = rc->rawir_timeout;
 	}
 	if (!ir->flags.no_tx) {
 		rc->s_tx_mask = mceusb_set_tx_mask;
diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 4b769111f78e3..9f02b94909956 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -133,7 +133,8 @@ static int meson_ir_probe(struct platform_device *pdev)
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	ir->rc->rx_resolution = MESON_TRATE;
 	ir->rc->min_timeout = 1;
-	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
+	ir->rc->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	ir->rc->keyup_delay = IR_DEFAULT_TIMEOUT;
 	ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	ir->rc->driver_name = DRIVER_NAME;
 
diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 27b7412d02a56..df42092fa7bd3 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -343,7 +343,8 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	ir->rc->driver_name = MTK_IR_DEV;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	ir->rc->rx_resolution = MTK_IR_SAMPLE;
-	ir->rc->timeout = MTK_MAX_SAMPLES * (MTK_IR_SAMPLE + 1);
+	ir->rc->rawir_timeout = MTK_MAX_SAMPLES * (MTK_IR_SAMPLE + 1);
+	ir->rc->keyup_delay = MTK_MAX_SAMPLES * (MTK_IR_SAMPLE + 1);
 
 	ret = devm_rc_register_device(dev, ir->rc);
 	if (ret) {
diff --git a/drivers/media/rc/nuvoton-cir.c b/drivers/media/rc/nuvoton-cir.c
index 2214d41ef5794..29147a084407c 100644
--- a/drivers/media/rc/nuvoton-cir.c
+++ b/drivers/media/rc/nuvoton-cir.c
@@ -998,7 +998,8 @@ static int nvt_probe(struct pnp_dev *pdev, const struct pnp_device_id *dev_id)
 	rdev->input_id.version = nvt->chip_minor;
 	rdev->driver_name = NVT_DRIVER_NAME;
 	rdev->map_name = RC_MAP_RC6_MCE;
-	rdev->timeout = MS_TO_US(100);
+	rdev->rawir_timeout = MS_TO_US(100);
+	rdev->keyup_delay = MS_TO_US(100);
 	/* rx resolution is hardwired to 50us atm, 1, 25, 100 also possible */
 	rdev->rx_resolution = CIR_SAMPLE_PERIOD;
 #if 0
diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index 16e33d7eaaa2d..b10f575d4ba2f 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -185,8 +185,8 @@ int ir_raw_event_store_with_filter(struct rc_dev *dev, struct ir_raw_event *ev)
 	}
 
 	/* Enter idle mode if necessary */
-	if (!ev->pulse && dev->timeout &&
-	    dev->raw->this_ev.duration >= dev->timeout)
+	if (!ev->pulse && dev->rawir_timeout &&
+	    dev->raw->this_ev.duration >= dev->rawir_timeout)
 		ir_raw_event_set_idle(dev, true);
 
 	return 1;
@@ -283,7 +283,7 @@ static int change_protocol(struct rc_dev *dev, u64 *rc_proto)
 	if (dev->s_timeout)
 		dev->s_timeout(dev, timeout);
 	else
-		dev->timeout = timeout;
+		dev->rawir_timeout = timeout;
 
 	return 0;
 }
@@ -559,7 +559,7 @@ static void ir_raw_edge_handle(struct timer_list *t)
 
 	spin_lock_irqsave(&dev->raw->edge_spinlock, flags);
 	interval = ktime_sub(ktime_get(), dev->raw->last_event);
-	if (ktime_to_us(interval) >= dev->timeout) {
+	if (ktime_to_us(interval) >= dev->rawir_timeout) {
 		struct ir_raw_event ev = {
 			.timeout = true,
 			.duration = ktime_to_us(interval)
@@ -568,7 +568,7 @@ static void ir_raw_edge_handle(struct timer_list *t)
 		ir_raw_event_store(dev, &ev);
 	} else {
 		mod_timer(&dev->raw->edge_handle,
-			  jiffies + usecs_to_jiffies(dev->timeout -
+			  jiffies + usecs_to_jiffies(dev->rawir_timeout -
 						     ktime_to_us(interval)));
 	}
 	spin_unlock_irqrestore(&dev->raw->edge_spinlock, flags);
diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index b356041c5c00e..b8812350ce49c 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -129,7 +129,7 @@ static int loop_tx_ir(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 
 	/* Fake a silence long enough to cause us to go idle */
 	rawir.pulse = false;
-	rawir.duration = dev->timeout;
+	rawir.duration = dev->rawir_timeout;
 	ir_raw_event_store_with_filter(dev, &rawir);
 
 	ir_raw_event_handle(dev);
@@ -226,7 +226,8 @@ static int __init loop_init(void)
 	rc->allowed_protocols	= RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->allowed_wakeup_protocols = RC_PROTO_BIT_ALL_IR_ENCODER;
 	rc->encode_wakeup	= true;
-	rc->timeout		= IR_DEFAULT_TIMEOUT;
+	rc->rawir_timeout	= IR_DEFAULT_TIMEOUT;
+	rc->keyup_delay		= IR_DEFAULT_TIMEOUT;
 	rc->min_timeout		= 1;
 	rc->max_timeout		= IR_MAX_TIMEOUT;
 	rc->rx_resolution	= 1;
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index b90438a71c800..f27f6b383816c 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -737,7 +737,7 @@ static unsigned int repeat_period(int protocol)
 void rc_repeat(struct rc_dev *dev)
 {
 	unsigned long flags;
-	unsigned int timeout = usecs_to_jiffies(dev->timeout) +
+	unsigned int timeout = usecs_to_jiffies(dev->keyup_delay) +
 		msecs_to_jiffies(repeat_period(dev->last_protocol));
 	struct lirc_scancode sc = {
 		.scancode = dev->last_scancode, .rc_proto = dev->last_protocol,
@@ -855,7 +855,8 @@ void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
 	ir_do_keydown(dev, protocol, scancode, keycode, toggle);
 
 	if (dev->keypressed) {
-		dev->keyup_jiffies = jiffies + usecs_to_jiffies(dev->timeout) +
+		dev->keyup_jiffies = jiffies +
+			usecs_to_jiffies(dev->keyup_delay) +
 			msecs_to_jiffies(repeat_period(protocol));
 		mod_timer(&dev->timer_keyup, dev->keyup_jiffies);
 	}
@@ -1715,7 +1716,8 @@ struct rc_dev *rc_allocate_device(enum rc_driver_type type)
 		dev->input_dev->setkeycode = ir_setkeycode;
 		input_set_drvdata(dev->input_dev, dev);
 
-		dev->timeout = IR_DEFAULT_TIMEOUT;
+		dev->rawir_timeout = IR_DEFAULT_TIMEOUT;
+		dev->keyup_delay = IR_DEFAULT_TIMEOUT;
 		timer_setup(&dev->timer_keyup, ir_timer_keyup, 0);
 		timer_setup(&dev->timer_repeat, ir_timer_repeat, 0);
 
diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index cb22316b3f002..51f9fce1df569 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -381,7 +381,7 @@ static void redrat3_process_ir_data(struct redrat3_dev *rr3)
 	/* add a trailing space */
 	rawir.pulse = false;
 	rawir.timeout = true;
-	rawir.duration = rr3->rc->timeout;
+	rawir.duration = rr3->rc->rawir_timeout;
 	dev_dbg(dev, "storing trailing timeout with duration %d\n",
 							rawir.duration);
 	ir_raw_event_store_with_filter(rr3->rc, &rawir);
@@ -948,7 +948,8 @@ static struct rc_dev *redrat3_init_rc_dev(struct redrat3_dev *rr3)
 	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->min_timeout = MS_TO_US(RR3_RX_MIN_TIMEOUT);
 	rc->max_timeout = MS_TO_US(RR3_RX_MAX_TIMEOUT);
-	rc->timeout = redrat3_get_timeout(rr3);
+	rc->rawir_timeout = redrat3_get_timeout(rr3);
+	rc->keyup_delay = rc->rawir_timeout;
 	rc->s_timeout = redrat3_set_timeout;
 	rc->tx_ir = redrat3_transmit_ir;
 	rc->s_tx_carrier = redrat3_set_tx_carrier;
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index 96ae0294ac102..cd211bc14b33a 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -385,7 +385,7 @@ static irqreturn_t serial_ir_irq_handler(int i, void *blah)
 	} while (!(sinp(UART_IIR) & UART_IIR_NO_INT)); /* still pending ? */
 
 	mod_timer(&serial_ir.timeout_timer,
-		  jiffies + usecs_to_jiffies(serial_ir.rcdev->timeout));
+		  jiffies + usecs_to_jiffies(serial_ir.rcdev->rawir_timeout));
 
 	ir_raw_event_handle(serial_ir.rcdev);
 
@@ -466,7 +466,7 @@ static void serial_ir_timeout(struct timer_list *unused)
 {
 	struct ir_raw_event ev = {
 		.timeout = true,
-		.duration = serial_ir.rcdev->timeout
+		.duration = serial_ir.rcdev->rawir_timeout
 	};
 	ir_raw_event_store_with_filter(serial_ir.rcdev, &ev);
 	ir_raw_event_handle(serial_ir.rcdev);
@@ -526,7 +526,8 @@ static int serial_ir_probe(struct platform_device *dev)
 	rcdev->driver_name = KBUILD_MODNAME;
 	rcdev->map_name = RC_MAP_RC6_MCE;
 	rcdev->min_timeout = 1;
-	rcdev->timeout = IR_DEFAULT_TIMEOUT;
+	rcdev->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	rcdev->keyup_delay = IR_DEFAULT_TIMEOUT;
 	rcdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rcdev->rx_resolution = 250;
 
diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
index 19e987a048ccb..041024191cb9c 100644
--- a/drivers/media/rc/st_rc.c
+++ b/drivers/media/rc/st_rc.c
@@ -63,7 +63,10 @@ struct st_rc_device {
 
 static void st_rc_send_lirc_timeout(struct rc_dev *rdev)
 {
-	struct ir_raw_event ev = { .timeout = true, .duration = rdev->timeout };
+	struct ir_raw_event ev = {
+		.timeout = true,
+		.duration = rdev->rawir_timeout
+	};
 	ir_raw_event_store(rdev, &ev);
 }
 
@@ -299,7 +302,8 @@ static int st_rc_probe(struct platform_device *pdev)
 	rdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* rx sampling rate is 10Mhz */
 	rdev->rx_resolution = 100;
-	rdev->timeout = MAX_SYMB_TIME;
+	rdev->rawir_timeout = MAX_SYMB_TIME;
+	rdev->keyup_delay = MAX_SYMB_TIME;
 	rdev->priv = rc_dev;
 	rdev->open = st_rc_open;
 	rdev->close = st_rc_close;
diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 16ba85d7c090c..563e49e0f1415 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -198,7 +198,7 @@ static void streamzap_callback(struct urb *urb)
 			if (sz->buf_in[i] == SZ_TIMEOUT) {
 				struct ir_raw_event rawir = {
 					.pulse = false,
-					.duration = sz->rdev->timeout
+					.duration = sz->rdev->rawir_timeout
 				};
 				sz_push(sz, rawir);
 			} else {
@@ -334,7 +334,8 @@ static int streamzap_probe(struct usb_interface *intf,
 
 	sz->decoder_state = PulseSpace;
 	/* FIXME: don't yet have a way to set this */
-	sz->rdev->timeout = SZ_TIMEOUT * SZ_RESOLUTION;
+	sz->rdev->rawir_timeout = SZ_TIMEOUT * SZ_RESOLUTION;
+	sz->rdev->keyup_delay = SZ_TIMEOUT * SZ_RESOLUTION;
 	#if 0
 	/* not yet supported, depends on patches from maxim */
 	/* see also: LIRC_GET_REC_RESOLUTION and LIRC_SET_REC_TIMEOUT */
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index b631a81e58bb1..14503bf50b020 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -164,7 +164,7 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
 	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
 	       ir->base + SUNXI_IR_CIR_REG);
 
-	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ithr);
+	rc_dev->rawir_timeout = sunxi_ithr_to_usec(base_clk, ithr);
 
 	return 0;
 }
@@ -195,7 +195,7 @@ static int sunxi_ir_hw_init(struct device *dev)
 	writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
 
 	/* Set noise threshold and idle threshold */
-	sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
+	sunxi_ir_set_timeout(ir->rc, ir->rc->rawir_timeout);
 
 	/* Invert Input Signal */
 	writel(REG_RXCTL_RPPI, ir->base + SUNXI_IR_RXCTL_REG);
@@ -324,7 +324,8 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* Frequency after IR internal divider with sample period in us */
 	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
-	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
+	ir->rc->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	ir->rc->keyup_delay = IR_DEFAULT_TIMEOUT;
 	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
 	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
 	ir->rc->s_timeout = sunxi_ir_set_timeout;
diff --git a/drivers/media/rc/ttusbir.c b/drivers/media/rc/ttusbir.c
index 629787d53ee1c..d7e37e11fba04 100644
--- a/drivers/media/rc/ttusbir.c
+++ b/drivers/media/rc/ttusbir.c
@@ -307,7 +307,8 @@ static int ttusbir_probe(struct usb_interface *intf,
 	rc->driver_name = DRIVER_NAME;
 	rc->map_name = RC_MAP_TT_1500;
 	rc->min_timeout = 1;
-	rc->timeout = IR_DEFAULT_TIMEOUT;
+	rc->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	rc->keyup_delay = IR_DEFAULT_TIMEOUT;
 	rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 
 	/*
diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
index 25884a79985c8..718d711fc75a4 100644
--- a/drivers/media/rc/winbond-cir.c
+++ b/drivers/media/rc/winbond-cir.c
@@ -1071,7 +1071,8 @@ wbcir_probe(struct pnp_dev *device, const struct pnp_device_id *dev_id)
 	data->dev->priv = data;
 	data->dev->dev.parent = &device->dev;
 	data->dev->min_timeout = 1;
-	data->dev->timeout = IR_DEFAULT_TIMEOUT;
+	data->dev->rawir_timeout = IR_DEFAULT_TIMEOUT;
+	data->dev->keyup_delay = IR_DEFAULT_TIMEOUT;
 	data->dev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	data->dev->rx_resolution = 2;
 	data->dev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
diff --git a/drivers/media/rc/xbox_remote.c b/drivers/media/rc/xbox_remote.c
index 98d0b43608ad6..9dba3ff0dc2e0 100644
--- a/drivers/media/rc/xbox_remote.c
+++ b/drivers/media/rc/xbox_remote.c
@@ -157,7 +157,7 @@ static void xbox_remote_rc_init(struct xbox_remote *xbox_remote)
 	rdev->device_name = xbox_remote->rc_name;
 	rdev->input_phys = xbox_remote->rc_phys;
 
-	rdev->timeout = MS_TO_US(10);
+	rdev->keyup_delay = MS_TO_US(10);
 
 	usb_to_input_id(xbox_remote->udev, &rdev->input_id);
 	rdev->dev.parent = &xbox_remote->interface->dev;
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb.h b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
index 288c15a7d72be..b69ab5e6ab421 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb.h
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
@@ -132,7 +132,8 @@ struct dvb_usb_rc {
 	unsigned int interval;
 	enum rc_driver_type driver_type;
 	bool bulk_mode;
-	int timeout;
+	u32 rawir_timeout;
+	u32 keyup_delay;
 };
 
 /**
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index f1c79f351ec8d..c3be2b8eaef73 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -150,7 +150,8 @@ static int dvb_usbv2_remote_init(struct dvb_usb_device *d)
 	dev->map_name = d->rc.map_name;
 	dev->allowed_protocols = d->rc.allowed_protos;
 	dev->change_protocol = d->rc.change_protocol;
-	dev->timeout = d->rc.timeout;
+	dev->rawir_timeout = d->rc.rawir_timeout;
+	dev->keyup_delay = d->rc.keyup_delay;
 	dev->priv = d;
 
 	ret = rc_register_device(dev);
diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 795a012d40200..60e5153fcb24c 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1809,7 +1809,8 @@ static int rtl2832u_get_rc_config(struct dvb_usb_device *d,
 	rc->query = rtl2832u_rc_query;
 	rc->interval = 200;
 	/* we program idle len to 0xc0, set timeout to one less */
-	rc->timeout = 0xbf * 51;
+	rc->rawir_timeout = 0xbf * 51;
+	rc->keyup_delay = MS_TO_US(210);
 
 	return 0;
 }
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 803349599c272..e7316891a7ac3 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -123,9 +123,11 @@ struct lirc_fh {
  * @last_protocol: protocol of last keypress
  * @last_scancode: scancode of last keypress
  * @last_toggle: toggle value of last command
- * @timeout: optional time after which device stops sending data
- * @min_timeout: minimum timeout supported by device
- * @max_timeout: maximum timeout supported by device
+ * @rawir_timeout: length space to convert into IR timeout
+ * @keyup_delay: timeout before keyup event. This should be the maximum
+ *	delay between reading IR events.
+ * @min_timeout: minimum rawir timeout supported by device
+ * @max_timeout: maximum rawir timeout supported by device
  * @rx_resolution : resolution (in us) of input sampler
  * @tx_resolution: resolution (in us) of output sampler
  * @lirc_dev: lirc device
@@ -190,7 +192,8 @@ struct rc_dev {
 	enum rc_proto			last_protocol;
 	u64				last_scancode;
 	u8				last_toggle;
-	u32				timeout;
+	u32				rawir_timeout;
+	u32				keyup_delay;
 	u32				min_timeout;
 	u32				max_timeout;
 	u32				rx_resolution;
-- 
2.34.1

