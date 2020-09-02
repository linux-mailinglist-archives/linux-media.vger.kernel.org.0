Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F83E25B0FD
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgIBQNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728304AbgIBQK5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:57 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03C6B2166E;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=Crii9zss/HZ1UcVRUShIpUPNP+IW9zZh29dqczIXem8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f+Y77m1KqKONqr7VRNPiLD8yGveoSH2QDvoVUyi6JnCM+lfu9C2B/13kDHwlC1ZBJ
         zGXSB9Bmu7vAMWypMd+6Ue6Y5sTiH/dJ9Jaqzu+jh3mn/mv0wXPcjUtHSzBxNFDIyg
         kf15GarNHar7fYwjZHT7NhtJ/LqCTLwuVg0nkVi0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAf-7g; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 22/38] media: dvb-ttusb-budget: cleanup printk logic
Date:   Wed,  2 Sep 2020 18:10:25 +0200
Message-Id: <b4a1cec5dd623a4637cb44c9c0850cd50385b26b.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of calling printk(), use pr_foo() macros.

While here, do some cleanup at the printed messages, as some
has __func__, while others have the module name (sometimes
spelled as "ttusb_dvb").

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/usb/ttusb-budget/dvb-ttusb-budget.c | 118 ++++++++----------
 1 file changed, 52 insertions(+), 66 deletions(-)

diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index 2582a62184fd..9e016b71aa91 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -5,6 +5,9 @@
  * Copyright (c) 2002 Holger Waechtler <holger@convergence.de>
  * Copyright (c) 2003 Felix Domke <tmbinc@elitedvb.net>
  */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
@@ -59,7 +62,12 @@ MODULE_PARM_DESC(debug, "Turn on/off debugging (default:off).");
 
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
-#define dprintk(x...) do { if (debug) printk(KERN_DEBUG x); } while (0)
+#define dprintk(fmt, arg...) do {					\
+	if (debug)							\
+		printk(KERN_DEBUG pr_fmt("%s: " fmt),			\
+		       __func__, ##arg);				\
+} while (0)
+
 
 #define ISO_BUF_COUNT      4
 #define FRAMES_PER_ISO_BUF 4
@@ -139,20 +147,19 @@ static int ttusb_cmd(struct ttusb *ttusb, u8 *data, int len, int len_result)
 		return -EAGAIN;
 
 	if (debug >= 3)
-		printk(KERN_DEBUG "> %*ph\n", len, data);
+		dprintk("> %*ph\n", len, data);
 
 	memcpy(data, ttusb->send_buf, len);
 
 	err = usb_bulk_msg(ttusb->dev, ttusb->bulk_out_pipe,
 			   ttusb->send_buf, len, &actual_len, 1000);
 	if (err != 0) {
-		dprintk("%s: usb_bulk_msg(send) failed, err == %i!\n",
-			__func__, err);
+		dprintk("usb_bulk_msg(send) failed, err == %i!\n", err);
 		goto err;
 	}
 	if (actual_len != len) {
 		err = -EIO;
-		dprintk("%s: only wrote %d of %d bytes\n", __func__,
+		dprintk("only wrote %d of %d bytes\n",
 			actual_len, len);
 		goto err;
 	}
@@ -161,14 +168,13 @@ static int ttusb_cmd(struct ttusb *ttusb, u8 *data, int len, int len_result)
 			   ttusb->last_result, MAX_RCV, &actual_len, 1000);
 
 	if (err != 0) {
-		printk("%s: failed, receive error %d\n", __func__,
-		       err);
+		pr_err("cmd xter failed, receive error %d\n", err);
 		goto err;
 	}
 
 	if (debug >= 3) {
 		actual_len = ttusb->last_result[3] + 4;
-		printk(KERN_DEBUG "< %*ph\n", actual_len, ttusb->last_result);
+		dprintk("< %*ph\n", actual_len, ttusb->last_result);
 	}
 
 	if (len_result)
@@ -212,9 +218,8 @@ static int ttusb_i2c_msg(struct ttusb *ttusb,
 	if (rcv_len > 0) {
 
 		if (err || b[0] != 0x55 || b[1] != id) {
-			dprintk
-			    ("%s: usb_bulk_msg(recv) failed, err == %i, id == %02x, b == ",
-			     __func__, err, id);
+			dprintk("usb_bulk_msg(recv) failed, err == %i, id == %02x, b == ",
+				err, id);
 			return -EREMOTEIO;
 		}
 
@@ -258,7 +263,7 @@ static int master_xfer(struct i2c_adapter* adapter, struct i2c_msg *msg, int num
 				    snd_buf, snd_len, rcv_buf, rcv_len);
 
 		if (err < rcv_len) {
-			dprintk("%s: i == %i\n", __func__, i);
+			dprintk("i == %i\n", i);
 			break;
 		}
 
@@ -278,7 +283,7 @@ static int ttusb_boot_dsp(struct ttusb *ttusb)
 	err = request_firmware(&fw, "ttusb-budget/dspbootcode.bin",
 			       &ttusb->dev->dev);
 	if (err) {
-		printk(KERN_ERR "ttusb-budget: failed to request firmware\n");
+		pr_err("failed to request firmware\n");
 		return err;
 	}
 
@@ -318,8 +323,7 @@ static int ttusb_boot_dsp(struct ttusb *ttusb)
       done:
 	release_firmware(fw);
 	if (err) {
-		dprintk("%s: usb_bulk_msg() failed, return value %i!\n",
-			__func__, err);
+		dprintk("usb_bulk_msg() failed, return value %i!\n", err);
 	}
 
 	return err;
@@ -413,18 +417,16 @@ static int ttusb_init_controller(struct ttusb *ttusb)
 			     sizeof(get_version), sizeof(get_version))))
 		return err;
 
-	dprintk("%s: stc-version: %c%c%c%c%c\n", __func__,
-		get_version[4], get_version[5], get_version[6],
-		get_version[7], get_version[8]);
+	dprintk("stc-version: %c%c%c%c%c\n", get_version[4], get_version[5],
+		get_version[6], get_version[7], get_version[8]);
 
 	if (memcmp(get_version + 4, "V 0.0", 5) &&
 	    memcmp(get_version + 4, "V 1.1", 5) &&
 	    memcmp(get_version + 4, "V 2.1", 5) &&
 	    memcmp(get_version + 4, "V 2.2", 5)) {
-		printk
-		    ("%s: unknown STC version %c%c%c%c%c, please report!\n",
-		     __func__, get_version[4], get_version[5],
-		     get_version[6], get_version[7], get_version[8]);
+		pr_err("unknown STC version %c%c%c%c%c, please report!\n",
+		       get_version[4], get_version[5],
+		       get_version[6], get_version[7], get_version[8]);
 	}
 
 	ttusb->revision = ((get_version[6] - '0') << 4) |
@@ -436,7 +438,7 @@ static int ttusb_init_controller(struct ttusb *ttusb)
 	if (err)
 		return err;
 
-	printk("%s: dsp-version: %c%c%c\n", __func__,
+	pr_info("dsp-version: %c%c%c\n",
 	       get_dsp_version[4], get_dsp_version[5], get_dsp_version[6]);
 	return 0;
 }
@@ -458,8 +460,7 @@ static int ttusb_send_diseqc(struct dvb_frontend* fe,
 
 	/* Diseqc */
 	if ((err = ttusb_cmd(ttusb, b, 4 + b[3], 0))) {
-		dprintk("%s: usb_bulk_msg() failed, return value %i!\n",
-			__func__, err);
+		dprintk("usb_bulk_msg() failed, return value %i!\n", err);
 	}
 
 	return err;
@@ -476,8 +477,7 @@ static int ttusb_update_lnb(struct ttusb *ttusb)
 
 	/* SetLNB */
 	if ((err = ttusb_cmd(ttusb, b, sizeof(b), 0))) {
-		dprintk("%s: usb_bulk_msg() failed, return value %i!\n",
-			__func__, err);
+		dprintk("usb_bulk_msg() failed, return value %i!\n", err);
 	}
 
 	return err;
@@ -511,8 +511,7 @@ static void ttusb_set_led_freq(struct ttusb *ttusb, u8 freq)
 
 	err = ttusb_cmd(ttusb, b, sizeof(b), 0);
 	if (err) {
-		dprintk("%s: usb_bulk_msg() failed, return value %i!\n",
-			__func__, err);
+		dprintk("usb_bulk_msg() failed, return value %i!\n", err);
 	}
 }
 #endif
@@ -536,7 +535,7 @@ static void ttusb_process_muxpack(struct ttusb *ttusb, const u8 * muxpack,
 	int i;
 
 	if (len < 4 || len & 0x1) {
-		pr_warn("%s: muxpack has invalid len %d\n", __func__, len);
+		pr_warn("muxpack has invalid len %d\n", len);
 		numinvalid++;
 		return;
 	}
@@ -544,8 +543,7 @@ static void ttusb_process_muxpack(struct ttusb *ttusb, const u8 * muxpack,
 	for (i = 0; i < len; i += 2)
 		csum ^= le16_to_cpup((__le16 *) (muxpack + i));
 	if (csum) {
-		printk("%s: muxpack with incorrect checksum, ignoring\n",
-		       __func__);
+		pr_warn("muxpack with incorrect checksum, ignoring\n");
 		numinvalid++;
 		return;
 	}
@@ -553,8 +551,8 @@ static void ttusb_process_muxpack(struct ttusb *ttusb, const u8 * muxpack,
 	cc = (muxpack[len - 4] << 8) | muxpack[len - 3];
 	cc &= 0x7FFF;
 	if ((cc != ttusb->cc) && (ttusb->cc != -1))
-		printk("%s: cc discontinuity (%d frames missing)\n",
-		       __func__, (cc - ttusb->cc) & 0x7FFF);
+		pr_warn("cc discontinuity (%d frames missing)\n",
+			(cc - ttusb->cc) & 0x7FFF);
 	ttusb->cc = (cc + 1) & 0x7FFF;
 	if (muxpack[0] & 0x80) {
 #ifdef TTUSB_HWSECTIONS
@@ -575,7 +573,7 @@ static void ttusb_process_muxpack(struct ttusb *ttusb, const u8 * muxpack,
 		    !!(ttusb->muxpack[1] & 1))
 			data++;
 #warning TODO: pusi
-		printk("cc: %04x\n", (data[0] << 8) | data[1]);
+		dprintk("cc: %04x\n", (data[0] << 8) | data[1]);
 #endif
 		numsec++;
 	} else if (muxpack[0] == 0x47) {
@@ -594,7 +592,7 @@ static void ttusb_process_muxpack(struct ttusb *ttusb, const u8 * muxpack,
 		dvb_dmx_swfilter_packets(&ttusb->dvb_demux, muxpack, 1);
 	} else if (muxpack[0] != 0) {
 		numinvalid++;
-		printk("illegal muxpack type %02x\n", muxpack[0]);
+		pr_err("illegal muxpack type %02x\n", muxpack[0]);
 	} else
 		numstuff++;
 }
@@ -604,7 +602,7 @@ static void ttusb_process_frame(struct ttusb *ttusb, u8 * data, int len)
 	int maxwork = 1024;
 	while (len) {
 		if (!(maxwork--)) {
-			printk("%s: too much work\n", __func__);
+			pr_err("too much work\n");
 			break;
 		}
 
@@ -618,10 +616,7 @@ static void ttusb_process_frame(struct ttusb *ttusb, u8 * data, int len)
 			else {
 				ttusb->mux_state = 0;
 				if (ttusb->insync) {
-					dprintk("%s: %02x\n",
-						__func__, data[-1]);
-					printk(KERN_INFO "%s: lost sync.\n",
-					       __func__);
+					pr_info("lost sync.\n");
 					ttusb->insync = 0;
 				}
 			}
@@ -677,10 +672,8 @@ static void ttusb_process_frame(struct ttusb *ttusb, u8 * data, int len)
 						    ttusb->muxpack[1] + 2 +
 						    4;
 					else {
-						dprintk
-						    ("%s: invalid state: first byte is %x\n",
-						     __func__,
-						     ttusb->muxpack[0]);
+						dprintk("invalid state: first byte is %x\n",
+							ttusb->muxpack[0]);
 						ttusb->mux_state = 0;
 					}
 				}
@@ -729,12 +722,6 @@ static void ttusb_iso_irq(struct urb *urb)
 	if (!ttusb->iso_streaming)
 		return;
 
-#if 0
-	printk("%s: status %d, errcount == %d, length == %i\n",
-	       __func__,
-	       urb->status, urb->error_count, urb->actual_length);
-#endif
-
 	if (!urb->status) {
 		for (i = 0; i < urb->number_of_packets; ++i) {
 			numpkt++;
@@ -807,7 +794,7 @@ static int ttusb_start_iso_xfer(struct ttusb *ttusb)
 	int i, j, err, buffer_offset = 0;
 
 	if (ttusb->iso_streaming) {
-		printk("%s: iso xfer already running!\n", __func__);
+		pr_err("iso xfer already running!\n");
 		return 0;
 	}
 
@@ -841,9 +828,8 @@ static int ttusb_start_iso_xfer(struct ttusb *ttusb)
 	for (i = 0; i < ISO_BUF_COUNT; i++) {
 		if ((err = usb_submit_urb(ttusb->iso_urb[i], GFP_ATOMIC))) {
 			ttusb_stop_iso_xfer(ttusb);
-			printk
-			    ("%s: failed urb submission (%i: err = %i)!\n",
-			     __func__, i, err);
+			pr_err("failed urb submission (%i: err = %i)!\n",
+			       i, err);
 			return err;
 		}
 	}
@@ -1403,7 +1389,7 @@ static int dvbc_philips_tdm1316l_tuner_set_params(struct dvb_frontend *fe)
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 	if (i2c_transfer(&ttusb->i2c_adap, &tuner_msg, 1) != 1) {
-		printk("dvb-ttusb-budget: dvbc_philips_tdm1316l_pll_set Error 1\n");
+		pr_err("dvbc_philips_tdm1316l_pll_set Error 1\n");
 		return -EIO;
 	}
 
@@ -1412,7 +1398,7 @@ static int dvbc_philips_tdm1316l_tuner_set_params(struct dvb_frontend *fe)
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 	if (i2c_transfer(&ttusb->i2c_adap, &tuner_msg, 1) != 1) {
-		printk("dvb-ttusb-budget: dvbc_philips_tdm1316l_pll_set Error 2\n");
+		pr_err("dvbc_philips_tdm1316l_pll_set Error 2\n");
 		return -EIO;
 	}
 
@@ -1589,12 +1575,12 @@ static void frontend_init(struct ttusb* ttusb)
 	}
 
 	if (ttusb->fe == NULL) {
-		printk("dvb-ttusb-budget: A frontend driver was not found for device [%04x:%04x]\n",
+		pr_err("no frontend driver found for device [%04x:%04x]\n",
 		       le16_to_cpu(ttusb->dev->descriptor.idVendor),
 		       le16_to_cpu(ttusb->dev->descriptor.idProduct));
 	} else {
 		if (dvb_register_frontend(&ttusb->adapter, ttusb->fe)) {
-			printk("dvb-ttusb-budget: Frontend registration failed!\n");
+			pr_err("Frontend registration failed!\n");
 			dvb_frontend_detach(ttusb->fe);
 			ttusb->fe = NULL;
 		}
@@ -1614,7 +1600,7 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 	struct ttusb *ttusb;
 	int result;
 
-	dprintk("%s: TTUSB DVB connected\n", __func__);
+	dprintk("TTUSB DVB connected\n");
 
 	udev = interface_to_usbdev(intf);
 
@@ -1636,14 +1622,14 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 
 	result = ttusb_alloc_iso_urbs(ttusb);
 	if (result < 0) {
-		dprintk("%s: ttusb_alloc_iso_urbs - failed\n", __func__);
+		dprintk("ttusb_alloc_iso_urbs - failed\n");
 		mutex_unlock(&ttusb->semi2c);
 		kfree(ttusb);
 		return result;
 	}
 
 	if (ttusb_init_controller(ttusb))
-		printk("ttusb_init_controller: error\n");
+		pr_err("ttusb_init_controller: error\n");
 
 	mutex_unlock(&ttusb->semi2c);
 
@@ -1688,7 +1674,7 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 
 	result = dvb_dmx_init(&ttusb->dvb_demux);
 	if (result < 0) {
-		printk("ttusb_dvb: dvb_dmx_init failed (errno = %d)\n", result);
+		pr_err("dvb_dmx_init failed (errno = %d)\n", result);
 		result = -ENODEV;
 		goto err_i2c_del_adapter;
 	}
@@ -1699,14 +1685,14 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 
 	result = dvb_dmxdev_init(&ttusb->dmxdev, &ttusb->adapter);
 	if (result < 0) {
-		printk("ttusb_dvb: dvb_dmxdev_init failed (errno = %d)\n",
+		pr_err("dvb_dmxdev_init failed (errno = %d)\n",
 		       result);
 		result = -ENODEV;
 		goto err_release_dmx;
 	}
 
 	if (dvb_net_init(&ttusb->adapter, &ttusb->dvbnet, &ttusb->dvb_demux.dmx)) {
-		printk("ttusb_dvb: dvb_net_init failed!\n");
+		pr_err("dvb_net_init failed!\n");
 		result = -ENODEV;
 		goto err_release_dmxdev;
 	}
@@ -1755,7 +1741,7 @@ static void ttusb_disconnect(struct usb_interface *intf)
 
 	kfree(ttusb);
 
-	dprintk("%s: TTUSB DVB disconnected\n", __func__);
+	dprintk("TTUSB DVB disconnected\n");
 }
 
 static const struct usb_device_id ttusb_table[] = {
-- 
2.26.2

