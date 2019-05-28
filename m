Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7382D11E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 23:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfE1VnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 17:43:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44288 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfE1VnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 17:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WxFsHJgdMJt0gst35MyrJJ7HARk9Qbt02CLD8D3yil0=; b=PRewOkf565/Y9H1oMxbPls15f
        jY+V/rqhMX3U3ZESixZyhPpPWbo8wuZpTVre8zY1JHjuZr2PMTXaMT6R5nbmQ+YGmFE5UF7JOxTbl
        HX/33iLPd5//Gm0mgJNKS+LgjDYD2mTovPWFHeh5N5/dvugmiTWNuCj9aQM9JVRJjZKaTXImbjIK9
        OnjWK0QMacnAlramRj6sETw5vBSwvpZ3NLfwLxZD4A8QcmULTaGS9UQ9MK1g84KxxdokY/b4QFMVd
        bXfraftRgNuJfJPnpkT/Xhf0JypLru70qv+2kNQj4XuDMhRW+x9ZmGM6PlnfQ9W36dxljOiotfw5h
        Vd6NK1kDw==;
Received: from [187.58.202.19] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVjsF-0000Gc-LF; Tue, 28 May 2019 21:43:16 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hVjs2-000AYf-SI; Tue, 28 May 2019 17:42:58 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Cody P Schafer <dev@codyps.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/2] media: cx25840: Address several coding style issues
Date:   Tue, 28 May 2019 17:42:56 -0400
Message-Id: <373dc495b36ae4a96af0bf042303954eec493fd3.1559079754.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we did a major change on this file, let's take the moment
to cleanup several coding style issues on it.

This patch was partially done with the help of two tools:

	./scripts/checkpatch.pl --fix-inplace --strict
	astyle --indent=tab=8 --style=linux

But manually adjusted in order to fit our style.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 915 +++++++++++++++--------
 drivers/media/i2c/cx25840/cx25840-core.h |  15 +-
 include/media/drv-intf/cx25840.h         |  33 +-
 3 files changed, 619 insertions(+), 344 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 371ac6bb265a..98241da3965f 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -35,7 +35,6 @@
  * GNU General Public License for more details.
  */
 
-
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -76,17 +75,17 @@ MODULE_LICENSE("GPL");
 
 static int cx25840_debug;
 
-module_param_named(debug,cx25840_debug, int, 0644);
+module_param_named(debug, cx25840_debug, int, 0644);
 
 MODULE_PARM_DESC(debug, "Debugging messages [0=Off (default) 1=On]");
 
-
 /* ----------------------------------------------------------------------- */
 static void cx23888_std_setup(struct i2c_client *client);
 
 int cx25840_write(struct i2c_client *client, u16 addr, u8 value)
 {
 	u8 buffer[3];
+
 	buffer[0] = addr >> 8;
 	buffer[1] = addr & 0xff;
 	buffer[2] = value;
@@ -96,6 +95,7 @@ int cx25840_write(struct i2c_client *client, u16 addr, u8 value)
 int cx25840_write4(struct i2c_client *client, u16 addr, u32 value)
 {
 	u8 buffer[6];
+
 	buffer[0] = addr >> 8;
 	buffer[1] = addr & 0xff;
 	buffer[2] = value & 0xff;
@@ -105,7 +105,7 @@ int cx25840_write4(struct i2c_client *client, u16 addr, u32 value)
 	return i2c_master_send(client, buffer, 6);
 }
 
-u8 cx25840_read(struct i2c_client * client, u16 addr)
+u8 cx25840_read(struct i2c_client *client, u16 addr)
 {
 	struct i2c_msg msgs[2];
 	u8 tx_buf[2], rx_buf[1];
@@ -116,13 +116,13 @@ u8 cx25840_read(struct i2c_client * client, u16 addr)
 	msgs[0].addr = client->addr;
 	msgs[0].flags = 0;
 	msgs[0].len = 2;
-	msgs[0].buf = (char *) tx_buf;
+	msgs[0].buf = (char *)tx_buf;
 
 	/* Read data from register */
 	msgs[1].addr = client->addr;
 	msgs[1].flags = I2C_M_RD;
 	msgs[1].len = 1;
-	msgs[1].buf = (char *) rx_buf;
+	msgs[1].buf = (char *)rx_buf;
 
 	if (i2c_transfer(client->adapter, msgs, 2) < 2)
 		return 0;
@@ -130,7 +130,7 @@ u8 cx25840_read(struct i2c_client * client, u16 addr)
 	return rx_buf[0];
 }
 
-u32 cx25840_read4(struct i2c_client * client, u16 addr)
+u32 cx25840_read4(struct i2c_client *client, u16 addr)
 {
 	struct i2c_msg msgs[2];
 	u8 tx_buf[2], rx_buf[4];
@@ -141,22 +141,22 @@ u32 cx25840_read4(struct i2c_client * client, u16 addr)
 	msgs[0].addr = client->addr;
 	msgs[0].flags = 0;
 	msgs[0].len = 2;
-	msgs[0].buf = (char *) tx_buf;
+	msgs[0].buf = (char *)tx_buf;
 
 	/* Read data from registers */
 	msgs[1].addr = client->addr;
 	msgs[1].flags = I2C_M_RD;
 	msgs[1].len = 4;
-	msgs[1].buf = (char *) rx_buf;
+	msgs[1].buf = (char *)rx_buf;
 
 	if (i2c_transfer(client->adapter, msgs, 2) < 2)
 		return 0;
 
 	return (rx_buf[3] << 24) | (rx_buf[2] << 16) | (rx_buf[1] << 8) |
-		rx_buf[0];
+	        rx_buf[0];
 }
 
-int cx25840_and_or(struct i2c_client *client, u16 addr, unsigned and_mask,
+int cx25840_and_or(struct i2c_client *client, u16 addr, unsigned int and_mask,
 		   u8 or_value)
 {
 	return cx25840_write(client, addr,
@@ -174,13 +174,14 @@ int cx25840_and_or4(struct i2c_client *client, u16 addr, u32 and_mask,
 
 /* ----------------------------------------------------------------------- */
 
-static int set_input(struct i2c_client *client, enum cx25840_video_input vid_input,
-						enum cx25840_audio_input aud_input);
+static int set_input(struct i2c_client *client,
+		     enum cx25840_video_input vid_input,
+		     enum cx25840_audio_input aud_input);
 
 /* ----------------------------------------------------------------------- */
 
 static int cx23885_s_io_pin_config(struct v4l2_subdev *sd, size_t n,
-				      struct v4l2_subdev_io_pin_config *p)
+				   struct v4l2_subdev_io_pin_config *p)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int i;
@@ -411,7 +412,6 @@ static int cx25840_s_io_pin_config(struct v4l2_subdev *sd, size_t n,
 		if (strength != CX25840_PIN_DRIVE_SLOW &&
 		    strength != CX25840_PIN_DRIVE_MEDIUM &&
 		    strength != CX25840_PIN_DRIVE_FAST) {
-
 			v4l_err(client,
 				"invalid drive speed for pin %u (%u), assuming fast\n",
 				(unsigned int)p[i].pin,
@@ -531,7 +531,7 @@ static int cx25840_s_io_pin_config(struct v4l2_subdev *sd, size_t n,
 }
 
 static int common_s_io_pin_config(struct v4l2_subdev *sd, size_t n,
-				      struct v4l2_subdev_io_pin_config *pincfg)
+				  struct v4l2_subdev_io_pin_config *pincfg)
 {
 	struct cx25840_state *state = to_state(sd);
 
@@ -546,8 +546,10 @@ static int common_s_io_pin_config(struct v4l2_subdev *sd, size_t n,
 
 static void init_dll1(struct i2c_client *client)
 {
-	/* This is the Hauppauge sequence used to
-	 * initialize the Delay Lock Loop 1 (ADC DLL). */
+	/*
+	 * This is the Hauppauge sequence used to
+	 * initialize the Delay Lock Loop 1 (ADC DLL).
+	 */
 	cx25840_write(client, 0x159, 0x23);
 	cx25840_write(client, 0x15a, 0x87);
 	cx25840_write(client, 0x15b, 0x06);
@@ -562,8 +564,10 @@ static void init_dll1(struct i2c_client *client)
 
 static void init_dll2(struct i2c_client *client)
 {
-	/* This is the Hauppauge sequence used to
-	 * initialize the Delay Lock Loop 2 (ADC DLL). */
+	/*
+	 * This is the Hauppauge sequence used to
+	 * initialize the Delay Lock Loop 2 (ADC DLL).
+	 */
 	cx25840_write(client, 0x15d, 0xe3);
 	cx25840_write(client, 0x15e, 0x86);
 	cx25840_write(client, 0x15f, 0x06);
@@ -575,7 +579,11 @@ static void init_dll2(struct i2c_client *client)
 
 static void cx25836_initialize(struct i2c_client *client)
 {
-	/* reset configuration is described on page 3-77 of the CX25836 datasheet */
+	/*
+	 *reset configuration is described on page 3-77
+	 * of the CX25836 datasheet
+	 */
+
 	/* 2. */
 	cx25840_and_or(client, 0x000, ~0x01, 0x01);
 	cx25840_and_or(client, 0x000, ~0x01, 0x00);
@@ -601,6 +609,7 @@ static void cx25836_initialize(struct i2c_client *client)
 static void cx25840_work_handler(struct work_struct *work)
 {
 	struct cx25840_state *state = container_of(work, struct cx25840_state, fw_work);
+
 	cx25840_loadfw(state->c);
 	wake_up(&state->fw_wait);
 }
@@ -699,8 +708,10 @@ static void cx25840_initialize(struct i2c_client *client)
 	/* datasheet startup in numbered steps, refer to page 3-77 */
 	/* 2. */
 	cx25840_and_or(client, 0x803, ~0x10, 0x00);
-	/* The default of this register should be 4, but I get 0 instead.
-	 * Set this register to 4 manually. */
+	/*
+	 * The default of this register should be 4, but I get 0 instead.
+	 * Set this register to 4 manually.
+	 */
 	cx25840_write(client, 0x000, 0x04);
 	/* 3. */
 	init_dll1(client);
@@ -710,10 +721,12 @@ static void cx25840_initialize(struct i2c_client *client)
 	cx25840_write(client, 0x13c, 0x01);
 	cx25840_write(client, 0x13c, 0x00);
 	/* 5. */
-	/* Do the firmware load in a work handler to prevent.
-	   Otherwise the kernel is blocked waiting for the
-	   bit-banging i2c interface to finish uploading the
-	   firmware. */
+	/*
+	 * Do the firmware load in a work handler to prevent.
+	 * Otherwise the kernel is blocked waiting for the
+	 * bit-banging i2c interface to finish uploading the
+	 * firmware.
+	 */
 	INIT_WORK(&state->fw_work, cx25840_work_handler);
 	init_waitqueue_head(&state->fw_wait);
 	q = create_singlethread_workqueue("cx25840_fw");
@@ -945,10 +958,12 @@ static void cx23885_initialize(struct i2c_client *client)
 	cx25840_write(client, 0x160, 0x1d);
 	cx25840_write(client, 0x164, 0x00);
 
-	/* Do the firmware load in a work handler to prevent.
-	   Otherwise the kernel is blocked waiting for the
-	   bit-banging i2c interface to finish uploading the
-	   firmware. */
+	/*
+	 * Do the firmware load in a work handler to prevent.
+	 * Otherwise the kernel is blocked waiting for the
+	 * bit-banging i2c interface to finish uploading the
+	 * firmware.
+	 */
 	INIT_WORK(&state->fw_work, cx25840_work_handler);
 	init_waitqueue_head(&state->fw_wait);
 	q = create_singlethread_workqueue("cx25840_fw");
@@ -960,7 +975,8 @@ static void cx23885_initialize(struct i2c_client *client)
 		destroy_workqueue(q);
 	}
 
-	/* Call the cx23888 specific std setup func, we no longer rely on
+	/*
+	 * Call the cx23888 specific std setup func, we no longer rely on
 	 * the generic cx24840 func.
 	 */
 	if (is_cx23888(state))
@@ -982,7 +998,9 @@ static void cx23885_initialize(struct i2c_client *client)
 	cx25840_write(client, CX25840_AUD_INT_STAT_REG, 0xff);
 
 	/* CC raw enable */
-	/*  - VIP 1.1 control codes - 10bit, blue field enable.
+
+	/*
+	 *  - VIP 1.1 control codes - 10bit, blue field enable.
 	 *  - enable raw data during vertical blanking.
 	 *  - enable ancillary Data insertion for 656 or VIP.
 	 */
@@ -1065,10 +1083,12 @@ static void cx231xx_initialize(struct i2c_client *client)
 	/* White crush, Chroma AGC & Chroma Killer enabled */
 	cx25840_write(client, 0x401, 0xe8);
 
-	/* Do the firmware load in a work handler to prevent.
-	   Otherwise the kernel is blocked waiting for the
-	   bit-banging i2c interface to finish uploading the
-	   firmware. */
+	/*
+	 * Do the firmware load in a work handler to prevent.
+	 * Otherwise the kernel is blocked waiting for the
+	 * bit-banging i2c interface to finish uploading the
+	 * firmware.
+	 */
 	INIT_WORK(&state->fw_work, cx25840_work_handler);
 	init_waitqueue_head(&state->fw_wait);
 	q = create_singlethread_workqueue("cx25840_fw");
@@ -1164,8 +1184,9 @@ void cx25840_std_setup(struct i2c_client *client)
 				vblank = 26;
 				vblank656 = 26;
 				burst = 0x5b;
-			} else
+			} else {
 				burst = 0x59;
+			}
 			luma_lpf = 2;
 			comb = 0x20;
 			sc = 688739;
@@ -1200,24 +1221,28 @@ void cx25840_std_setup(struct i2c_client *client)
 			int pll = (28636363L * ((((u64)pll_int) << 25L) + pll_frac)) >> 25L;
 
 			pll /= pll_post;
-			v4l_dbg(1, cx25840_debug, client, "PLL = %d.%06d MHz\n",
-					pll / 1000000, pll % 1000000);
-			v4l_dbg(1, cx25840_debug, client, "PLL/8 = %d.%06d MHz\n",
-					pll / 8000000, (pll / 8) % 1000000);
+			v4l_dbg(1, cx25840_debug, client,
+				"PLL = %d.%06d MHz\n",
+				pll / 1000000, pll % 1000000);
+			v4l_dbg(1, cx25840_debug, client,
+				"PLL/8 = %d.%06d MHz\n",
+				pll / 8000000, (pll / 8) % 1000000);
 
 			fin = ((u64)src_decimation * pll) >> 12;
 			v4l_dbg(1, cx25840_debug, client,
-					"ADC Sampling freq = %d.%06d MHz\n",
-					fin / 1000000, fin % 1000000);
+				"ADC Sampling freq = %d.%06d MHz\n",
+				fin / 1000000, fin % 1000000);
 
 			fsc = (((u64)sc) * pll) >> 24L;
 			v4l_dbg(1, cx25840_debug, client,
-					"Chroma sub-carrier freq = %d.%06d MHz\n",
-					fsc / 1000000, fsc % 1000000);
+				"Chroma sub-carrier freq = %d.%06d MHz\n",
+				fsc / 1000000, fsc % 1000000);
 
-			v4l_dbg(1, cx25840_debug, client, "hblank %i, hactive %i, vblank %i, vactive %i, vblank656 %i, src_dec %i, burst 0x%02x, luma_lpf %i, uv_lpf %i, comb 0x%02x, sc 0x%06x\n",
+			v4l_dbg(1, cx25840_debug, client,
+				"hblank %i, hactive %i, vblank %i, vactive %i, vblank656 %i, src_dec %i, burst 0x%02x, luma_lpf %i, uv_lpf %i, comb 0x%02x, sc 0x%06x\n",
 				hblank, hactive, vblank, vactive, vblank656,
-				src_decimation, burst, luma_lpf, uv_lpf, comb, sc);
+				src_decimation, burst, luma_lpf, uv_lpf,
+				comb, sc);
 		}
 	}
 
@@ -1272,10 +1297,10 @@ static void input_change(struct i2c_client *client)
 	/* Follow step 8c and 8d of section 3.16 in the cx25840 datasheet */
 	if (std & V4L2_STD_SECAM) {
 		cx25840_write(client, 0x402, 0);
-	}
-	else {
+	} else {
 		cx25840_write(client, 0x402, 0x04);
-		cx25840_write(client, 0x49f, (std & V4L2_STD_NTSC) ? 0x14 : 0x11);
+		cx25840_write(client, 0x49f,
+			      (std & V4L2_STD_NTSC) ? 0x14 : 0x11);
 	}
 	cx25840_and_or(client, 0x401, ~0x60, 0);
 	cx25840_and_or(client, 0x401, ~0x60, 0x60);
@@ -1289,13 +1314,14 @@ static void input_change(struct i2c_client *client)
 	if (state->radio) {
 		cx25840_write(client, 0x808, 0xf9);
 		cx25840_write(client, 0x80b, 0x00);
-	}
-	else if (std & V4L2_STD_525_60) {
-		/* Certain Hauppauge PVR150 models have a hardware bug
-		   that causes audio to drop out. For these models the
-		   audio standard must be set explicitly.
-		   To be precise: it affects cards with tuner models
-		   85, 99 and 112 (model numbers from tveeprom). */
+	} else if (std & V4L2_STD_525_60) {
+		/*
+		 * Certain Hauppauge PVR150 models have a hardware bug
+		 * that causes audio to drop out. For these models the
+		 * audio standard must be set explicitly.
+		 * To be precise: it affects cards with tuner models
+		 * 85, 99 and 112 (model numbers from tveeprom).
+		 */
 		int hw_fix = state->pvr150_workaround;
 
 		if (std == V4L2_STD_NTSC_M_JP) {
@@ -1312,35 +1338,40 @@ static void input_change(struct i2c_client *client)
 	} else if (std & V4L2_STD_PAL) {
 		/* Autodetect audio standard and audio system */
 		cx25840_write(client, 0x808, 0xff);
-		/* Since system PAL-L is pretty much non-existent and
-		   not used by any public broadcast network, force
-		   6.5 MHz carrier to be interpreted as System DK,
-		   this avoids DK audio detection instability */
+		/*
+		 * Since system PAL-L is pretty much non-existent and
+		 * not used by any public broadcast network, force
+		 * 6.5 MHz carrier to be interpreted as System DK,
+		 * this avoids DK audio detection instability
+		 */
 		cx25840_write(client, 0x80b, 0x00);
 	} else if (std & V4L2_STD_SECAM) {
 		/* Autodetect audio standard and audio system */
 		cx25840_write(client, 0x808, 0xff);
-		/* If only one of SECAM-DK / SECAM-L is required, then force
-		  6.5MHz carrier, else autodetect it */
+		/*
+		 * If only one of SECAM-DK / SECAM-L is required, then force
+		 * 6.5MHz carrier, else autodetect it
+		 */
 		if ((std & V4L2_STD_SECAM_DK) &&
 		    !(std & (V4L2_STD_SECAM_L | V4L2_STD_SECAM_LC))) {
 			/* 6.5 MHz carrier to be interpreted as System DK */
 			cx25840_write(client, 0x80b, 0x00);
-	       } else if (!(std & V4L2_STD_SECAM_DK) &&
-			  (std & (V4L2_STD_SECAM_L | V4L2_STD_SECAM_LC))) {
+		} else if (!(std & V4L2_STD_SECAM_DK) &&
+			   (std & (V4L2_STD_SECAM_L | V4L2_STD_SECAM_LC))) {
 			/* 6.5 MHz carrier to be interpreted as System L */
 			cx25840_write(client, 0x80b, 0x08);
-	       } else {
+		} else {
 			/* 6.5 MHz carrier to be autodetected */
 			cx25840_write(client, 0x80b, 0x10);
-	       }
+		}
 	}
 
 	cx25840_and_or(client, 0x810, ~0x01, 0);
 }
 
-static int set_input(struct i2c_client *client, enum cx25840_video_input vid_input,
-						enum cx25840_audio_input aud_input)
+static int set_input(struct i2c_client *client,
+		     enum cx25840_video_input vid_input,
+		     enum cx25840_audio_input aud_input)
 {
 	struct cx25840_state *state = to_state(i2c_get_clientdata(client));
 	u8 is_composite = (vid_input >= CX25840_COMPOSITE1 &&
@@ -1365,7 +1396,7 @@ static int set_input(struct i2c_client *client, enum cx25840_video_input vid_inp
 			vid_input);
 		reg = vid_input & 0xff;
 		is_composite = !is_component &&
-			((vid_input & CX25840_SVIDEO_ON) != CX25840_SVIDEO_ON);
+			       ((vid_input & CX25840_SVIDEO_ON) != CX25840_SVIDEO_ON);
 
 		v4l_dbg(1, cx25840_debug, client, "mux cfg 0x%x comp=%d\n",
 			reg, is_composite);
@@ -1373,8 +1404,10 @@ static int set_input(struct i2c_client *client, enum cx25840_video_input vid_inp
 		reg = 0xf0 + (vid_input - CX25840_COMPOSITE1);
 	} else {
 		if ((vid_input & ~0xff0) ||
-		    luma < CX25840_SVIDEO_LUMA1 || luma > CX25840_SVIDEO_LUMA8 ||
-		    chroma < CX25840_SVIDEO_CHROMA4 || chroma > CX25840_SVIDEO_CHROMA8) {
+		    luma < CX25840_SVIDEO_LUMA1 ||
+		    luma > CX25840_SVIDEO_LUMA8 ||
+		    chroma < CX25840_SVIDEO_CHROMA4 ||
+		    chroma > CX25840_SVIDEO_CHROMA8) {
 			v4l_err(client, "0x%04x is not a valid video input!\n",
 				vid_input);
 			return -EINVAL;
@@ -1398,12 +1431,24 @@ static int set_input(struct i2c_client *client, enum cx25840_video_input vid_inp
 		case CX25840_AUDIO_SERIAL:
 			/* do nothing, use serial audio input */
 			break;
-		case CX25840_AUDIO4: reg &= ~0x30; break;
-		case CX25840_AUDIO5: reg &= ~0x30; reg |= 0x10; break;
-		case CX25840_AUDIO6: reg &= ~0x30; reg |= 0x20; break;
-		case CX25840_AUDIO7: reg &= ~0xc0; break;
-		case CX25840_AUDIO8: reg &= ~0xc0; reg |= 0x40; break;
-
+		case CX25840_AUDIO4:
+			reg &= ~0x30;
+			break;
+		case CX25840_AUDIO5:
+			reg &= ~0x30;
+			reg |= 0x10;
+			break;
+		case CX25840_AUDIO6:
+			reg &= ~0x30;
+			reg |= 0x20;
+			break;
+		case CX25840_AUDIO7:
+			reg &= ~0xc0;
+			break;
+		case CX25840_AUDIO8:
+			reg &= ~0xc0;
+			reg |= 0x40;
+			break;
 		default:
 			v4l_err(client, "0x%04x is not a valid audio input!\n",
 				aud_input);
@@ -1420,7 +1465,6 @@ static int set_input(struct i2c_client *client, enum cx25840_video_input vid_inp
 		cx25840_and_or(client, 0x401, ~0x6, is_composite ? 0 : 0x02);
 
 	if (is_cx2388x(state)) {
-
 		/* Enable or disable the DIF for tuner use */
 		if (is_dif) {
 			cx25840_and_or(client, 0x102, ~0x80, 0x80);
@@ -1451,15 +1495,23 @@ static int set_input(struct i2c_client *client, enum cx25840_video_input vid_inp
 			cx25840_write4(client, 0x410, 0xffff0dbf);
 			cx25840_write4(client, 0x414, 0x00137d03);
 
-			cx25840_write4(client, state->vbi_regs_offset + 0x42c, 0x42600000);
-			cx25840_write4(client, state->vbi_regs_offset + 0x430, 0x0000039b);
-			cx25840_write4(client, state->vbi_regs_offset + 0x438, 0x00000000);
+			cx25840_write4(client, state->vbi_regs_offset + 0x42c,
+				       0x42600000);
+			cx25840_write4(client, state->vbi_regs_offset + 0x430,
+				       0x0000039b);
+			cx25840_write4(client, state->vbi_regs_offset + 0x438,
+				       0x00000000);
 
-			cx25840_write4(client, state->vbi_regs_offset + 0x440, 0xF8E3E824);
-			cx25840_write4(client, state->vbi_regs_offset + 0x444, 0x401040dc);
-			cx25840_write4(client, state->vbi_regs_offset + 0x448, 0xcd3f02a0);
-			cx25840_write4(client, state->vbi_regs_offset + 0x44c, 0x161f1000);
-			cx25840_write4(client, state->vbi_regs_offset + 0x450, 0x00000802);
+			cx25840_write4(client, state->vbi_regs_offset + 0x440,
+				       0xF8E3E824);
+			cx25840_write4(client, state->vbi_regs_offset + 0x444,
+				       0x401040dc);
+			cx25840_write4(client, state->vbi_regs_offset + 0x448,
+				       0xcd3f02a0);
+			cx25840_write4(client, state->vbi_regs_offset + 0x44c,
+				       0x161f1000);
+			cx25840_write4(client, state->vbi_regs_offset + 0x450,
+				       0x00000802);
 
 			cx25840_write4(client, 0x91c, 0x01000000);
 			cx25840_write4(client, 0x8e0, 0x03063870);
@@ -1526,8 +1578,9 @@ static int set_input(struct i2c_client *client, enum cx25840_video_input vid_inp
 			 * Only one of the two will be in use.
 			 */
 			cx25840_write4(client, AFE_CTRL, val);
-		} else
+		} else {
 			cx25840_and_or(client, 0x102, ~0x2, 0);
+		}
 	}
 
 	state->vid_input = vid_input;
@@ -1566,29 +1619,32 @@ static int set_input(struct i2c_client *client, enum cx25840_video_input vid_inp
 		cx25840_write(client, 0x919, 0x01);
 	}
 
-	if (is_cx2388x(state) && ((aud_input == CX25840_AUDIO7) ||
-		(aud_input == CX25840_AUDIO6))) {
+	if (is_cx2388x(state) &&
+	    ((aud_input == CX25840_AUDIO7) || (aud_input == CX25840_AUDIO6))) {
 		/* Configure audio from LR1 or LR2 input */
 		cx25840_write4(client, 0x910, 0);
 		cx25840_write4(client, 0x8d0, 0x63073);
-	} else
-	if (is_cx2388x(state) && (aud_input == CX25840_AUDIO8)) {
+	} else if (is_cx2388x(state) && (aud_input == CX25840_AUDIO8)) {
 		/* Configure audio from tuner/sif input */
 		cx25840_write4(client, 0x910, 0x12b000c9);
 		cx25840_write4(client, 0x8d0, 0x1f063870);
 	}
 
 	if (is_cx23888(state)) {
-		/* HVR1850 */
-		/* AUD_IO_CTRL - I2S Input, Parallel1*/
-		/*  - Channel 1 src - Parallel1 (Merlin out) */
-		/*  - Channel 2 src - Parallel2 (Merlin out) */
-		/*  - Channel 3 src - Parallel3 (Merlin AC97 out) */
-		/*  - I2S source and dir - Merlin, output */
+		/*
+		 * HVR1850
+		 *
+		 * AUD_IO_CTRL - I2S Input, Parallel1
+		 *  - Channel 1 src - Parallel1 (Merlin out)
+		 *  - Channel 2 src - Parallel2 (Merlin out)
+		 *  - Channel 3 src - Parallel3 (Merlin AC97 out)
+		 *  - I2S source and dir - Merlin, output
+		 */
 		cx25840_write4(client, 0x124, 0x100);
 
 		if (!is_dif) {
-			/* Stop microcontroller if we don't need it
+			/*
+			 * Stop microcontroller if we don't need it
 			 * to avoid audio popping on svideo/composite use.
 			 */
 			cx25840_and_or(client, 0x803, ~0x10, 0x00);
@@ -1630,11 +1686,14 @@ static int set_v4lstd(struct i2c_client *client)
 			fmt = 0xc;
 	}
 
-	v4l_dbg(1, cx25840_debug, client, "changing video std to fmt %i\n",fmt);
+	v4l_dbg(1, cx25840_debug, client,
+		"changing video std to fmt %i\n", fmt);
 
-	/* Follow step 9 of section 3.16 in the cx25840 datasheet.
-	   Without this PAL may display a vertical ghosting effect.
-	   This happens for example with the Yuan MPC622. */
+	/*
+	 * Follow step 9 of section 3.16 in the cx25840 datasheet.
+	 * Without this PAL may display a vertical ghosting effect.
+	 * This happens for example with the Yuan MPC622.
+	 */
 	if (fmt >= 4 && fmt < 8) {
 		/* Set format to NTSC-M */
 		cx25840_and_or(client, 0x400, ~0xf, 1);
@@ -1696,15 +1755,15 @@ static int cx25840_s_ctrl(struct v4l2_ctrl *ctrl)
 /* ----------------------------------------------------------------------- */
 
 static int cx25840_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
-		struct v4l2_subdev_format *format)
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct cx25840_state *state = to_state(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u32 HSC, VSC, Vsrc, Hsrc, Vadd;
+	u32 hsc, vsc, v_src, h_src, v_add;
 	int filter;
-	int is_50Hz = !(state->std & V4L2_STD_525_60);
+	int is_50hz = !(state->std & V4L2_STD_525_60);
 
 	if (format->pad || fmt->code != MEDIA_BUS_FMT_FIXED)
 		return -EINVAL;
@@ -1713,23 +1772,23 @@ static int cx25840_set_fmt(struct v4l2_subdev *sd,
 	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
 
 	if (is_cx23888(state)) {
-		Vsrc = (cx25840_read(client, 0x42a) & 0x3f) << 4;
-		Vsrc |= (cx25840_read(client, 0x429) & 0xf0) >> 4;
+		v_src = (cx25840_read(client, 0x42a) & 0x3f) << 4;
+		v_src |= (cx25840_read(client, 0x429) & 0xf0) >> 4;
 	} else {
-		Vsrc = (cx25840_read(client, 0x476) & 0x3f) << 4;
-		Vsrc |= (cx25840_read(client, 0x475) & 0xf0) >> 4;
+		v_src = (cx25840_read(client, 0x476) & 0x3f) << 4;
+		v_src |= (cx25840_read(client, 0x475) & 0xf0) >> 4;
 	}
 
 	if (is_cx23888(state)) {
-		Hsrc = (cx25840_read(client, 0x426) & 0x3f) << 4;
-		Hsrc |= (cx25840_read(client, 0x425) & 0xf0) >> 4;
+		h_src = (cx25840_read(client, 0x426) & 0x3f) << 4;
+		h_src |= (cx25840_read(client, 0x425) & 0xf0) >> 4;
 	} else {
-		Hsrc = (cx25840_read(client, 0x472) & 0x3f) << 4;
-		Hsrc |= (cx25840_read(client, 0x471) & 0xf0) >> 4;
+		h_src = (cx25840_read(client, 0x472) & 0x3f) << 4;
+		h_src |= (cx25840_read(client, 0x471) & 0xf0) >> 4;
 	}
 
 	if (!state->generic_mode) {
-		Vadd = is_50Hz ? 4 : 7;
+		v_add = is_50hz ? 4 : 7;
 
 		/*
 		 * cx23888 in 525-line mode is programmed for 486 active lines
@@ -1738,16 +1797,17 @@ static int cx25840_set_fmt(struct v4l2_subdev *sd,
 		 * See reg 0x428 bits [21:12] in cx23888_std_setup() vs
 		 * vactive in cx25840_std_setup().
 		 */
-		if (is_cx23888(state) && !is_50Hz)
-			Vadd--;
-	} else
-		Vadd = 0;
+		if (is_cx23888(state) && !is_50hz)
+			v_add--;
+	} else {
+		v_add = 0;
+	}
 
-	if (Hsrc == 0 ||
-	    Vsrc <= Vadd) {
+	if (h_src == 0 ||
+	    v_src <= v_add) {
 		v4l_err(client,
 			"chip reported picture size (%u x %u) is far too small\n",
-			(unsigned int)Hsrc, (unsigned int)Vsrc);
+			(unsigned int)h_src, (unsigned int)v_src);
 		/*
 		 * that's the best we can do since the output picture
 		 * size is completely unknown in this case
@@ -1755,20 +1815,20 @@ static int cx25840_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	fmt->width = clamp(fmt->width, (Hsrc + 15) / 16, Hsrc);
+	fmt->width = clamp(fmt->width, (h_src + 15) / 16, h_src);
 
-	if (Vadd * 8 >= Vsrc)
-		fmt->height = clamp(fmt->height, (u32)1, Vsrc - Vadd);
+	if (v_add * 8 >= v_src)
+		fmt->height = clamp(fmt->height, (u32)1, v_src - v_add);
 	else
-		fmt->height = clamp(fmt->height, (Vsrc - Vadd * 8 + 7) / 8,
-				    Vsrc - Vadd);
+		fmt->height = clamp(fmt->height, (v_src - v_add * 8 + 7) / 8,
+				    v_src - v_add);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
-	HSC = (Hsrc * (1 << 20)) / fmt->width - (1 << 20);
-	VSC = (1 << 16) - (Vsrc * (1 << 9) / (fmt->height + Vadd) - (1 << 9));
-	VSC &= 0x1fff;
+	hsc = (h_src * (1 << 20)) / fmt->width - (1 << 20);
+	vsc = (1 << 16) - (v_src * (1 << 9) / (fmt->height + v_add) - (1 << 9));
+	vsc &= 0x1fff;
 
 	if (fmt->width >= 385)
 		filter = 0;
@@ -1782,20 +1842,20 @@ static int cx25840_set_fmt(struct v4l2_subdev *sd,
 	v4l_dbg(1, cx25840_debug, client,
 		"decoder set size %u x %u with scale %x x %x\n",
 		(unsigned int)fmt->width, (unsigned int)fmt->height,
-		(unsigned int)HSC, (unsigned int)VSC);
+		(unsigned int)hsc, (unsigned int)vsc);
 
-	/* HSCALE=HSC */
+	/* HSCALE=hsc */
 	if (is_cx23888(state)) {
-		cx25840_write4(client, 0x434, HSC | (1 << 24));
-		/* VSCALE=VSC VS_INTRLACE=1 VFILT=filter */
-		cx25840_write4(client, 0x438, VSC | (1 << 19) | (filter << 16));
+		cx25840_write4(client, 0x434, hsc | (1 << 24));
+		/* VSCALE=vsc VS_INTRLACE=1 VFILT=filter */
+		cx25840_write4(client, 0x438, vsc | (1 << 19) | (filter << 16));
 	} else {
-		cx25840_write(client, 0x418, HSC & 0xff);
-		cx25840_write(client, 0x419, (HSC >> 8) & 0xff);
-		cx25840_write(client, 0x41a, HSC >> 16);
-		/* VSCALE=VSC */
-		cx25840_write(client, 0x41c, VSC & 0xff);
-		cx25840_write(client, 0x41d, VSC >> 8);
+		cx25840_write(client, 0x418, hsc & 0xff);
+		cx25840_write(client, 0x419, (hsc >> 8) & 0xff);
+		cx25840_write(client, 0x41a, hsc >> 16);
+		/* VSCALE=vsc */
+		cx25840_write(client, 0x41c, vsc & 0xff);
+		cx25840_write(client, 0x41d, vsc >> 8);
 		/* VS_INTRLACE=1 VFILT=filter */
 		cx25840_write(client, 0x41e, 0x8 | filter);
 	}
@@ -1822,23 +1882,25 @@ static void log_video_status(struct i2c_client *client)
 	int vid_input = state->vid_input;
 
 	v4l_info(client, "Video signal:              %spresent\n",
-		    (gen_stat2 & 0x20) ? "" : "not ");
+		 (gen_stat2 & 0x20) ? "" : "not ");
 	v4l_info(client, "Detected format:           %s\n",
-		    fmt_strs[gen_stat1 & 0xf]);
+		 fmt_strs[gen_stat1 & 0xf]);
 
 	v4l_info(client, "Specified standard:        %s\n",
-		    vidfmt_sel ? fmt_strs[vidfmt_sel] : "automatic detection");
+		 vidfmt_sel ? fmt_strs[vidfmt_sel] : "automatic detection");
 
 	if (vid_input >= CX25840_COMPOSITE1 &&
 	    vid_input <= CX25840_COMPOSITE8) {
 		v4l_info(client, "Specified video input:     Composite %d\n",
-			vid_input - CX25840_COMPOSITE1 + 1);
+			 vid_input - CX25840_COMPOSITE1 + 1);
 	} else {
-		v4l_info(client, "Specified video input:     S-Video (Luma In%d, Chroma In%d)\n",
-			(vid_input & 0xf0) >> 4, (vid_input & 0xf00) >> 8);
+		v4l_info(client,
+			 "Specified video input:     S-Video (Luma In%d, Chroma In%d)\n",
+			 (vid_input & 0xf0) >> 4, (vid_input & 0xf00) >> 8);
 	}
 
-	v4l_info(client, "Specified audioclock freq: %d Hz\n", state->audclk_freq);
+	v4l_info(client, "Specified audioclock freq: %d Hz\n",
+		 state->audclk_freq);
 }
 
 /* ----------------------------------------------------------------------- */
@@ -1857,138 +1919,315 @@ static void log_audio_status(struct i2c_client *client)
 	char *p;
 
 	switch (mod_det_stat0) {
-	case 0x00: p = "mono"; break;
-	case 0x01: p = "stereo"; break;
-	case 0x02: p = "dual"; break;
-	case 0x04: p = "tri"; break;
-	case 0x10: p = "mono with SAP"; break;
-	case 0x11: p = "stereo with SAP"; break;
-	case 0x12: p = "dual with SAP"; break;
-	case 0x14: p = "tri with SAP"; break;
-	case 0xfe: p = "forced mode"; break;
-	default: p = "not defined";
+	case 0x00:
+		p = "mono";
+		break;
+	case 0x01:
+		p = "stereo";
+		break;
+	case 0x02:
+		p = "dual";
+		break;
+	case 0x04:
+		p = "tri";
+		break;
+	case 0x10:
+		p = "mono with SAP";
+		break;
+	case 0x11:
+		p = "stereo with SAP";
+		break;
+	case 0x12:
+		p = "dual with SAP";
+		break;
+	case 0x14:
+		p = "tri with SAP";
+		break;
+	case 0xfe:
+		p = "forced mode";
+		break;
+	default:
+		p = "not defined";
 	}
 	v4l_info(client, "Detected audio mode:       %s\n", p);
 
 	switch (mod_det_stat1) {
-	case 0x00: p = "not defined"; break;
-	case 0x01: p = "EIAJ"; break;
-	case 0x02: p = "A2-M"; break;
-	case 0x03: p = "A2-BG"; break;
-	case 0x04: p = "A2-DK1"; break;
-	case 0x05: p = "A2-DK2"; break;
-	case 0x06: p = "A2-DK3"; break;
-	case 0x07: p = "A1 (6.0 MHz FM Mono)"; break;
-	case 0x08: p = "AM-L"; break;
-	case 0x09: p = "NICAM-BG"; break;
-	case 0x0a: p = "NICAM-DK"; break;
-	case 0x0b: p = "NICAM-I"; break;
-	case 0x0c: p = "NICAM-L"; break;
-	case 0x0d: p = "BTSC/EIAJ/A2-M Mono (4.5 MHz FMMono)"; break;
-	case 0x0e: p = "IF FM Radio"; break;
-	case 0x0f: p = "BTSC"; break;
-	case 0x10: p = "high-deviation FM"; break;
-	case 0x11: p = "very high-deviation FM"; break;
-	case 0xfd: p = "unknown audio standard"; break;
-	case 0xfe: p = "forced audio standard"; break;
-	case 0xff: p = "no detected audio standard"; break;
-	default: p = "not defined";
+	case 0x00:
+		p = "not defined";
+		break;
+	case 0x01:
+		p = "EIAJ";
+		break;
+	case 0x02:
+		p = "A2-M";
+		break;
+	case 0x03:
+		p = "A2-BG";
+		break;
+	case 0x04:
+		p = "A2-DK1";
+		break;
+	case 0x05:
+		p = "A2-DK2";
+		break;
+	case 0x06:
+		p = "A2-DK3";
+		break;
+	case 0x07:
+		p = "A1 (6.0 MHz FM Mono)";
+		break;
+	case 0x08:
+		p = "AM-L";
+		break;
+	case 0x09:
+		p = "NICAM-BG";
+		break;
+	case 0x0a:
+		p = "NICAM-DK";
+		break;
+	case 0x0b:
+		p = "NICAM-I";
+		break;
+	case 0x0c:
+		p = "NICAM-L";
+		break;
+	case 0x0d:
+		p = "BTSC/EIAJ/A2-M Mono (4.5 MHz FMMono)";
+		break;
+	case 0x0e:
+		p = "IF FM Radio";
+		break;
+	case 0x0f:
+		p = "BTSC";
+		break;
+	case 0x10:
+		p = "high-deviation FM";
+		break;
+	case 0x11:
+		p = "very high-deviation FM";
+		break;
+	case 0xfd:
+		p = "unknown audio standard";
+		break;
+	case 0xfe:
+		p = "forced audio standard";
+		break;
+	case 0xff:
+		p = "no detected audio standard";
+		break;
+	default:
+		p = "not defined";
 	}
 	v4l_info(client, "Detected audio standard:   %s\n", p);
 	v4l_info(client, "Audio microcontroller:     %s\n",
-		    (download_ctl & 0x10) ?
-				((mute_ctl & 0x2) ? "detecting" : "running") : "stopped");
+		 (download_ctl & 0x10) ?
+		 ((mute_ctl & 0x2) ? "detecting" : "running") : "stopped");
 
 	switch (audio_config >> 4) {
-	case 0x00: p = "undefined"; break;
-	case 0x01: p = "BTSC"; break;
-	case 0x02: p = "EIAJ"; break;
-	case 0x03: p = "A2-M"; break;
-	case 0x04: p = "A2-BG"; break;
-	case 0x05: p = "A2-DK1"; break;
-	case 0x06: p = "A2-DK2"; break;
-	case 0x07: p = "A2-DK3"; break;
-	case 0x08: p = "A1 (6.0 MHz FM Mono)"; break;
-	case 0x09: p = "AM-L"; break;
-	case 0x0a: p = "NICAM-BG"; break;
-	case 0x0b: p = "NICAM-DK"; break;
-	case 0x0c: p = "NICAM-I"; break;
-	case 0x0d: p = "NICAM-L"; break;
-	case 0x0e: p = "FM radio"; break;
-	case 0x0f: p = "automatic detection"; break;
-	default: p = "undefined";
+	case 0x00:
+		p = "undefined";
+		break;
+	case 0x01:
+		p = "BTSC";
+		break;
+	case 0x02:
+		p = "EIAJ";
+		break;
+	case 0x03:
+		p = "A2-M";
+		break;
+	case 0x04:
+		p = "A2-BG";
+		break;
+	case 0x05:
+		p = "A2-DK1";
+		break;
+	case 0x06:
+		p = "A2-DK2";
+		break;
+	case 0x07:
+		p = "A2-DK3";
+		break;
+	case 0x08:
+		p = "A1 (6.0 MHz FM Mono)";
+		break;
+	case 0x09:
+		p = "AM-L";
+		break;
+	case 0x0a:
+		p = "NICAM-BG";
+		break;
+	case 0x0b:
+		p = "NICAM-DK";
+		break;
+	case 0x0c:
+		p = "NICAM-I";
+		break;
+	case 0x0d:
+		p = "NICAM-L";
+		break;
+	case 0x0e:
+		p = "FM radio";
+		break;
+	case 0x0f:
+		p = "automatic detection";
+		break;
+	default:
+		p = "undefined";
 	}
 	v4l_info(client, "Configured audio standard: %s\n", p);
 
 	if ((audio_config >> 4) < 0xF) {
 		switch (audio_config & 0xF) {
-		case 0x00: p = "MONO1 (LANGUAGE A/Mono L+R channel for BTSC, EIAJ, A2)"; break;
-		case 0x01: p = "MONO2 (LANGUAGE B)"; break;
-		case 0x02: p = "MONO3 (STEREO forced MONO)"; break;
-		case 0x03: p = "MONO4 (NICAM ANALOG-Language C/Analog Fallback)"; break;
-		case 0x04: p = "STEREO"; break;
-		case 0x05: p = "DUAL1 (AB)"; break;
-		case 0x06: p = "DUAL2 (AC) (FM)"; break;
-		case 0x07: p = "DUAL3 (BC) (FM)"; break;
-		case 0x08: p = "DUAL4 (AC) (AM)"; break;
-		case 0x09: p = "DUAL5 (BC) (AM)"; break;
-		case 0x0a: p = "SAP"; break;
-		default: p = "undefined";
+		case 0x00:
+			p = "MONO1 (LANGUAGE A/Mono L+R channel for BTSC, EIAJ, A2)";
+			break;
+		case 0x01:
+			p = "MONO2 (LANGUAGE B)";
+			break;
+		case 0x02:
+			p = "MONO3 (STEREO forced MONO)";
+			break;
+		case 0x03:
+			p = "MONO4 (NICAM ANALOG-Language C/Analog Fallback)";
+			break;
+		case 0x04:
+			p = "STEREO";
+			break;
+		case 0x05:
+			p = "DUAL1 (AB)";
+			break;
+		case 0x06:
+			p = "DUAL2 (AC) (FM)";
+			break;
+		case 0x07:
+			p = "DUAL3 (BC) (FM)";
+			break;
+		case 0x08:
+			p = "DUAL4 (AC) (AM)";
+			break;
+		case 0x09:
+			p = "DUAL5 (BC) (AM)";
+			break;
+		case 0x0a:
+			p = "SAP";
+			break;
+		default:
+			p = "undefined";
 		}
 		v4l_info(client, "Configured audio mode:     %s\n", p);
 	} else {
 		switch (audio_config & 0xF) {
-		case 0x00: p = "BG"; break;
-		case 0x01: p = "DK1"; break;
-		case 0x02: p = "DK2"; break;
-		case 0x03: p = "DK3"; break;
-		case 0x04: p = "I"; break;
-		case 0x05: p = "L"; break;
-		case 0x06: p = "BTSC"; break;
-		case 0x07: p = "EIAJ"; break;
-		case 0x08: p = "A2-M"; break;
-		case 0x09: p = "FM Radio"; break;
-		case 0x0f: p = "automatic standard and mode detection"; break;
-		default: p = "undefined";
+		case 0x00:
+			p = "BG";
+			break;
+		case 0x01:
+			p = "DK1";
+			break;
+		case 0x02:
+			p = "DK2";
+			break;
+		case 0x03:
+			p = "DK3";
+			break;
+		case 0x04:
+			p = "I";
+			break;
+		case 0x05:
+			p = "L";
+			break;
+		case 0x06:
+			p = "BTSC";
+			break;
+		case 0x07:
+			p = "EIAJ";
+			break;
+		case 0x08:
+			p = "A2-M";
+			break;
+		case 0x09:
+			p = "FM Radio";
+			break;
+		case 0x0f:
+			p = "automatic standard and mode detection";
+			break;
+		default:
+			p = "undefined";
 		}
 		v4l_info(client, "Configured audio system:   %s\n", p);
 	}
 
 	if (aud_input) {
-		v4l_info(client, "Specified audio input:     Tuner (In%d)\n", aud_input);
+		v4l_info(client, "Specified audio input:     Tuner (In%d)\n",
+			 aud_input);
 	} else {
 		v4l_info(client, "Specified audio input:     External\n");
 	}
 
 	switch (pref_mode & 0xf) {
-	case 0: p = "mono/language A"; break;
-	case 1: p = "language B"; break;
-	case 2: p = "language C"; break;
-	case 3: p = "analog fallback"; break;
-	case 4: p = "stereo"; break;
-	case 5: p = "language AC"; break;
-	case 6: p = "language BC"; break;
-	case 7: p = "language AB"; break;
-	default: p = "undefined";
+	case 0:
+		p = "mono/language A";
+		break;
+	case 1:
+		p = "language B";
+		break;
+	case 2:
+		p = "language C";
+		break;
+	case 3:
+		p = "analog fallback";
+		break;
+	case 4:
+		p = "stereo";
+		break;
+	case 5:
+		p = "language AC";
+		break;
+	case 6:
+		p = "language BC";
+		break;
+	case 7:
+		p = "language AB";
+		break;
+	default:
+		p = "undefined";
 	}
 	v4l_info(client, "Preferred audio mode:      %s\n", p);
 
 	if ((audio_config & 0xf) == 0xf) {
 		switch ((afc0 >> 3) & 0x3) {
-		case 0: p = "system DK"; break;
-		case 1: p = "system L"; break;
-		case 2: p = "autodetect"; break;
-		default: p = "undefined";
+		case 0:
+			p = "system DK";
+			break;
+		case 1:
+			p = "system L";
+			break;
+		case 2:
+			p = "autodetect";
+			break;
+		default:
+			p = "undefined";
 		}
 		v4l_info(client, "Selected 65 MHz format:    %s\n", p);
 
 		switch (afc0 & 0x7) {
-		case 0: p = "chroma"; break;
-		case 1: p = "BTSC"; break;
-		case 2: p = "EIAJ"; break;
-		case 3: p = "A2-M"; break;
-		case 4: p = "autodetect"; break;
-		default: p = "undefined";
+		case 0:
+			p = "chroma";
+			break;
+		case 1:
+			p = "BTSC";
+			break;
+		case 2:
+			p = "EIAJ";
+			break;
+		case 3:
+			p = "A2-M";
+			break;
+		case 4:
+			p = "autodetect";
+			break;
+		default:
+			p = "undefined";
 		}
 		v4l_info(client, "Selected 45 MHz format:    %s\n", p);
 	}
@@ -2039,22 +2278,24 @@ static int cx25840_init(struct v4l2_subdev *sd, u32 val)
 	if (is_cx2584x(state)) {
 		/* set datasheet video output defaults */
 		state->vid_config = CX25840_VCONFIG_FMT_BT656 |
-			CX25840_VCONFIG_RES_8BIT |
-			CX25840_VCONFIG_VBIRAW_DISABLED |
-			CX25840_VCONFIG_ANCDATA_ENABLED |
-			CX25840_VCONFIG_TASKBIT_ONE |
-			CX25840_VCONFIG_ACTIVE_HORIZONTAL |
-			CX25840_VCONFIG_VALID_NORMAL |
-			CX25840_VCONFIG_HRESETW_NORMAL |
-			CX25840_VCONFIG_CLKGATE_NONE |
-			CX25840_VCONFIG_DCMODE_DWORDS |
-			CX25840_VCONFIG_IDID0S_NORMAL |
-			CX25840_VCONFIG_VIPCLAMP_DISABLED;
+				    CX25840_VCONFIG_RES_8BIT |
+				    CX25840_VCONFIG_VBIRAW_DISABLED |
+				    CX25840_VCONFIG_ANCDATA_ENABLED |
+				    CX25840_VCONFIG_TASKBIT_ONE |
+				    CX25840_VCONFIG_ACTIVE_HORIZONTAL |
+				    CX25840_VCONFIG_VALID_NORMAL |
+				    CX25840_VCONFIG_HRESETW_NORMAL |
+				    CX25840_VCONFIG_CLKGATE_NONE |
+				    CX25840_VCONFIG_DCMODE_DWORDS |
+				    CX25840_VCONFIG_IDID0S_NORMAL |
+				    CX25840_VCONFIG_VIPCLAMP_DISABLED;
 
 		/* add additional settings */
 		cx25840_vconfig_add(state, val);
-	} else /* TODO: generic mode needs to be developed for other chips */
+	} else {
+		/* TODO: generic mode needs to be developed for other chips */
 		WARN_ON(1);
+	}
 
 	return 0;
 }
@@ -2104,7 +2345,8 @@ static int cx25840_load_fw(struct v4l2_subdev *sd)
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int cx25840_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg)
+static int cx25840_g_register(struct v4l2_subdev *sd,
+			      struct v4l2_dbg_register *reg)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
@@ -2113,7 +2355,8 @@ static int cx25840_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *
 	return 0;
 }
 
-static int cx25840_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_register *reg)
+static int cx25840_s_register(struct v4l2_subdev *sd,
+			      const struct v4l2_dbg_register *reg)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
@@ -2132,7 +2375,7 @@ static int cx25840_s_audio_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 
 	v4l_dbg(1, cx25840_debug, client, "%s audio output\n",
-			enable ? "enable" : "disable");
+		enable ? "enable" : "disable");
 
 	if (enable) {
 		v = cx25840_read(client, 0x115) | 0x80;
@@ -2155,7 +2398,7 @@ static int cx25840_s_stream(struct v4l2_subdev *sd, int enable)
 	u8 v;
 
 	v4l_dbg(1, cx25840_debug, client, "%s video output\n",
-			enable ? "enable" : "disable");
+		enable ? "enable" : "disable");
 
 	/*
 	 * It's not clear what should be done for these devices.
@@ -2208,7 +2451,7 @@ static int cx25840_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 	};
 
 	u32 fmt = (cx25840_read4(client, 0x40c) >> 8) & 0xf;
-	*std = stds[ fmt ];
+	*std = stds[fmt];
 
 	v4l_dbg(1, cx25840_debug, client,
 		"querystd fmt = %x, v4l2_std_id = 0x%x\n",
@@ -2221,7 +2464,8 @@ static int cx25840_g_input_status(struct v4l2_subdev *sd, u32 *status)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
-	/* A limited function that checks for signal status and returns
+	/*
+	 * A limited function that checks for signal status and returns
 	 * the state.
 	 */
 
@@ -2289,7 +2533,8 @@ static int cx25840_s_audio_routing(struct v4l2_subdev *sd,
 	return set_input(client, state->vid_input, input);
 }
 
-static int cx25840_s_frequency(struct v4l2_subdev *sd, const struct v4l2_frequency *freq)
+static int cx25840_s_frequency(struct v4l2_subdev *sd,
+			       const struct v4l2_frequency *freq)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
@@ -2312,9 +2557,8 @@ static int cx25840_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
 	if (is_cx2583x(state))
 		return 0;
 
-	vt->capability |=
-		V4L2_TUNER_CAP_STEREO | V4L2_TUNER_CAP_LANG1 |
-		V4L2_TUNER_CAP_LANG2 | V4L2_TUNER_CAP_SAP;
+	vt->capability |= V4L2_TUNER_CAP_STEREO | V4L2_TUNER_CAP_LANG1 |
+			  V4L2_TUNER_CAP_LANG2 | V4L2_TUNER_CAP_SAP;
 
 	mode = cx25840_read(client, 0x804);
 
@@ -2344,33 +2588,41 @@ static int cx25840_s_tuner(struct v4l2_subdev *sd, const struct v4l2_tuner *vt)
 		return 0;
 
 	switch (vt->audmode) {
-		case V4L2_TUNER_MODE_MONO:
-			/* mono      -> mono
-			   stereo    -> mono
-			   bilingual -> lang1 */
-			cx25840_and_or(client, 0x809, ~0xf, 0x00);
-			break;
-		case V4L2_TUNER_MODE_STEREO:
-		case V4L2_TUNER_MODE_LANG1:
-			/* mono      -> mono
-			   stereo    -> stereo
-			   bilingual -> lang1 */
-			cx25840_and_or(client, 0x809, ~0xf, 0x04);
-			break;
-		case V4L2_TUNER_MODE_LANG1_LANG2:
-			/* mono      -> mono
-			   stereo    -> stereo
-			   bilingual -> lang1/lang2 */
-			cx25840_and_or(client, 0x809, ~0xf, 0x07);
-			break;
-		case V4L2_TUNER_MODE_LANG2:
-			/* mono      -> mono
-			   stereo    -> stereo
-			   bilingual -> lang2 */
-			cx25840_and_or(client, 0x809, ~0xf, 0x01);
-			break;
-		default:
-			return -EINVAL;
+	case V4L2_TUNER_MODE_MONO:
+		/*
+		 * mono      -> mono
+		 * stereo    -> mono
+		 * bilingual -> lang1
+		 */
+		cx25840_and_or(client, 0x809, ~0xf, 0x00);
+		break;
+	case V4L2_TUNER_MODE_STEREO:
+	case V4L2_TUNER_MODE_LANG1:
+		/*
+		 * mono      -> mono
+		 * stereo    -> stereo
+		 * bilingual -> lang1
+		 */
+		cx25840_and_or(client, 0x809, ~0xf, 0x04);
+		break;
+	case V4L2_TUNER_MODE_LANG1_LANG2:
+		/*
+		 * mono      -> mono
+		 * stereo    -> stereo
+		 * bilingual -> lang1/lang2
+		 */
+		cx25840_and_or(client, 0x809, ~0xf, 0x07);
+		break;
+	case V4L2_TUNER_MODE_LANG2:
+		/*
+		 * mono      -> mono
+		 * stereo    -> stereo
+		 * bilingual -> lang2
+		 */
+		cx25840_and_or(client, 0x809, ~0xf, 0x01);
+		break;
+	default:
+		return -EINVAL;
 	}
 	state->audmode = vt->audmode;
 	return 0;
@@ -5545,22 +5797,28 @@ static u32 get_cx2388x_ident(struct i2c_client *client)
 	/* Come out of digital power down */
 	cx25840_write(client, 0x000, 0);
 
-	/* Detecting whether the part is cx23885/7/8 is more
+	/*
+	 * Detecting whether the part is cx23885/7/8 is more
 	 * difficult than it needs to be. No ID register. Instead we
 	 * probe certain registers indicated in the datasheets to look
-	 * for specific defaults that differ between the silicon designs. */
+	 * for specific defaults that differ between the silicon designs.
+	 */
 
 	/* It's either 885/7 if the IR Tx Clk Divider register exists */
 	if (cx25840_read4(client, 0x204) & 0xffff) {
-		/* CX23885 returns bogus repetitive byte values for the DIF,
-		 * which doesn't exist for it. (Ex. 8a8a8a8a or 31313131) */
+		/*
+		 * CX23885 returns bogus repetitive byte values for the DIF,
+		 * which doesn't exist for it. (Ex. 8a8a8a8a or 31313131)
+		 */
 		ret = cx25840_read4(client, 0x300);
 		if (((ret & 0xffff0000) >> 16) == (ret & 0xffff)) {
 			/* No DIF */
 			ret = CX23885_AV;
 		} else {
-			/* CX23887 has a broken DIF, but the registers
-			 * appear valid (but unused), good enough to detect. */
+			/*
+			 * CX23887 has a broken DIF, but the registers
+			 * appear valid (but unused), good enough to detect.
+			 */
 			ret = CX23887_AV;
 		}
 	} else if (cx25840_read4(client, 0x300) & 0x0fffffff) {
@@ -5592,14 +5850,18 @@ static int cx25840_probe(struct i2c_client *client,
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
-	v4l_dbg(1, cx25840_debug, client, "detecting cx25840 client on address 0x%x\n", client->addr << 1);
+	v4l_dbg(1, cx25840_debug, client,
+		"detecting cx25840 client on address 0x%x\n",
+		client->addr << 1);
 
 	device_id = cx25840_read(client, 0x101) << 8;
 	device_id |= cx25840_read(client, 0x100);
 	v4l_dbg(1, cx25840_debug, client, "device_id = 0x%04x\n", device_id);
 
-	/* The high byte of the device ID should be
-	 * 0x83 for the cx2583x and 0x84 for the cx2584x */
+	/*
+	 * The high byte of the device ID should be
+	 * 0x83 for the cx2583x and 0x84 for the cx2584x
+	 */
 	if ((device_id & 0xff00) == 0x8300) {
 		id = CX25836 + ((device_id >> 4) & 0xf) - 6;
 	} else if ((device_id & 0xff00) == 0x8400) {
@@ -5613,7 +5875,8 @@ static int cx25840_probe(struct i2c_client *client,
 		v4l_err(client,
 			"likely a confused/unresponsive cx2388[578] A/V decoder found @ 0x%x (%s)\n",
 			client->addr << 1, client->adapter->name);
-		v4l_err(client, "A method to reset it from the cx25840 driver software is not known at this time\n");
+		v4l_err(client,
+			"A method to reset it from the cx25840 driver software is not known at this time\n");
 		return -ENODEV;
 	} else {
 		v4l_dbg(1, cx25840_debug, client, "cx25840 not found\n");
@@ -5621,7 +5884,7 @@ static int cx25840_probe(struct i2c_client *client,
 	}
 
 	state = devm_kzalloc(&client->dev, sizeof(*state), GFP_KERNEL);
-	if (state == NULL)
+	if (!state)
 		return -ENOMEM;
 
 	sd = &state->sd;
@@ -5648,7 +5911,7 @@ static int cx25840_probe(struct i2c_client *client,
 	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;
 
 	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(state->pads),
-				state->pads);
+				     state->pads);
 	if (ret < 0) {
 		v4l_info(client, "failed to initialize media entity!\n");
 		return ret;
@@ -5676,8 +5939,10 @@ static int cx25840_probe(struct i2c_client *client,
 	case CX25841:
 	case CX25842:
 	case CX25843:
-		/* Note: revision '(device_id & 0x0f) == 2' was never built. The
-		   marking skips from 0x1 == 22 to 0x3 == 23. */
+		/*
+		 * Note: revision '(device_id & 0x0f) == 2' was never built.
+		 * The marking skips from 0x1 == 22 to 0x3 == 23.
+		 */
 		v4l_info(client, "cx25%3x-2%x found @ 0x%x (%s)\n",
 			 (device_id & 0xfff0) >> 4,
 			 (device_id & 0x0f) < 3 ? (device_id & 0x0f) + 1
@@ -5705,13 +5970,13 @@ static int cx25840_probe(struct i2c_client *client,
 	state->std = V4L2_STD_NTSC_M;
 	v4l2_ctrl_handler_init(&state->hdl, 9);
 	v4l2_ctrl_new_std(&state->hdl, &cx25840_ctrl_ops,
-			V4L2_CID_BRIGHTNESS, 0, 255, 1, 128);
+			  V4L2_CID_BRIGHTNESS, 0, 255, 1, 128);
 	v4l2_ctrl_new_std(&state->hdl, &cx25840_ctrl_ops,
-			V4L2_CID_CONTRAST, 0, 127, 1, 64);
+			  V4L2_CID_CONTRAST, 0, 127, 1, 64);
 	v4l2_ctrl_new_std(&state->hdl, &cx25840_ctrl_ops,
-			V4L2_CID_SATURATION, 0, 127, 1, 64);
+			  V4L2_CID_SATURATION, 0, 127, 1, 64);
 	v4l2_ctrl_new_std(&state->hdl, &cx25840_ctrl_ops,
-			V4L2_CID_HUE, -128, 127, 1, 0);
+			  V4L2_CID_HUE, -128, 127, 1, 0);
 	if (!is_cx2583x(state)) {
 		default_volume = cx25840_read(client, 0x8d4);
 		/*
@@ -5723,8 +5988,7 @@ static int cx25840_probe(struct i2c_client *client,
 			/* Bottom out at -96 dB, v4l2 vol range 0x2e00-0x2fff */
 			default_volume = 228;
 			cx25840_write(client, 0x8d4, 228);
-		}
-		else if (default_volume < 20) {
+		} else if (default_volume < 20) {
 			/* Top out at + 8 dB, v4l2 vol range 0xfe00-0xffff */
 			default_volume = 20;
 			cx25840_write(client, 0x8d4, 20);
@@ -5732,20 +5996,23 @@ static int cx25840_probe(struct i2c_client *client,
 		default_volume = (((228 - default_volume) >> 1) + 23) << 9;
 
 		state->volume = v4l2_ctrl_new_std(&state->hdl,
-			&cx25840_audio_ctrl_ops, V4L2_CID_AUDIO_VOLUME,
-			0, 65535, 65535 / 100, default_volume);
+						  &cx25840_audio_ctrl_ops,
+						  V4L2_CID_AUDIO_VOLUME,
+						  0, 65535, 65535 / 100,
+						  default_volume);
 		state->mute = v4l2_ctrl_new_std(&state->hdl,
-			&cx25840_audio_ctrl_ops, V4L2_CID_AUDIO_MUTE,
-			0, 1, 1, 0);
+						&cx25840_audio_ctrl_ops,
+						V4L2_CID_AUDIO_MUTE,
+						0, 1, 1, 0);
 		v4l2_ctrl_new_std(&state->hdl, &cx25840_audio_ctrl_ops,
-			V4L2_CID_AUDIO_BALANCE,
-			0, 65535, 65535 / 100, 32768);
+				  V4L2_CID_AUDIO_BALANCE,
+				  0, 65535, 65535 / 100, 32768);
 		v4l2_ctrl_new_std(&state->hdl, &cx25840_audio_ctrl_ops,
-			V4L2_CID_AUDIO_BASS,
-			0, 65535, 65535 / 100, 32768);
+				  V4L2_CID_AUDIO_BASS,
+				  0, 65535, 65535 / 100, 32768);
 		v4l2_ctrl_new_std(&state->hdl, &cx25840_audio_ctrl_ops,
-			V4L2_CID_AUDIO_TREBLE,
-			0, 65535, 65535 / 100, 32768);
+				  V4L2_CID_AUDIO_TREBLE,
+				  0, 65535, 65535 / 100, 32768);
 	}
 	sd->ctrl_handler = &state->hdl;
 	if (state->hdl.error) {
diff --git a/drivers/media/i2c/cx25840/cx25840-core.h b/drivers/media/i2c/cx25840/cx25840-core.h
index 2ff7191ad232..079ad503b507 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.h
+++ b/drivers/media/i2c/cx25840/cx25840-core.h
@@ -16,7 +16,6 @@
 #ifndef _CX25840_CORE_H_
 #define _CX25840_CORE_H_
 
-
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -100,7 +99,7 @@ struct cx25840_state {
 	enum cx25840_model id;
 	u32 rev;
 	int is_initialized;
-	unsigned vbi_regs_offset;
+	unsigned int vbi_regs_offset;
 	wait_queue_head_t fw_wait;
 	struct work_struct fw_work;
 	struct cx25840_ir_state *ir_state;
@@ -166,7 +165,8 @@ int cx25840_write(struct i2c_client *client, u16 addr, u8 value);
 int cx25840_write4(struct i2c_client *client, u16 addr, u32 value);
 u8 cx25840_read(struct i2c_client *client, u16 addr);
 u32 cx25840_read4(struct i2c_client *client, u16 addr);
-int cx25840_and_or(struct i2c_client *client, u16 addr, unsigned mask, u8 value);
+int cx25840_and_or(struct i2c_client *client, u16 addr, unsigned int mask,
+		   u8 value);
 int cx25840_and_or4(struct i2c_client *client, u16 addr, u32 and_mask,
 		    u32 or_value);
 void cx25840_std_setup(struct i2c_client *client);
@@ -185,9 +185,12 @@ extern const struct v4l2_ctrl_ops cx25840_audio_ctrl_ops;
 /* ----------------------------------------------------------------------- */
 /* cx25850-vbi.c                                                           */
 int cx25840_s_raw_fmt(struct v4l2_subdev *sd, struct v4l2_vbi_format *fmt);
-int cx25840_s_sliced_fmt(struct v4l2_subdev *sd, struct v4l2_sliced_vbi_format *fmt);
-int cx25840_g_sliced_fmt(struct v4l2_subdev *sd, struct v4l2_sliced_vbi_format *fmt);
-int cx25840_decode_vbi_line(struct v4l2_subdev *sd, struct v4l2_decode_vbi_line *vbi);
+int cx25840_s_sliced_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_sliced_vbi_format *fmt);
+int cx25840_g_sliced_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_sliced_vbi_format *fmt);
+int cx25840_decode_vbi_line(struct v4l2_subdev *sd,
+			    struct v4l2_decode_vbi_line *vbi);
 
 /* ----------------------------------------------------------------------- */
 /* cx25850-ir.c                                                            */
diff --git a/include/media/drv-intf/cx25840.h b/include/media/drv-intf/cx25840.h
index ed8ee1c77a6c..ba69bc525382 100644
--- a/include/media/drv-intf/cx25840.h
+++ b/include/media/drv-intf/cx25840.h
@@ -1,10 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+
 /*
-    cx25840.h - definition for cx25840/1/2/3 inputs
-
-    Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
-
-*/
+ *   cx25840.h - definition for cx25840/1/2/3 inputs
+ *
+ *   Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+ */
 
 #ifndef _CX25840_H_
 #define _CX25840_H_
@@ -38,8 +38,10 @@ enum cx25840_video_input {
 	CX25840_COMPOSITE7,
 	CX25840_COMPOSITE8,
 
-	/* S-Video inputs consist of one luma input (In1-In8) ORed with one
-	   chroma input (In5-In8) */
+	/*
+	 * S-Video inputs consist of one luma input (In1-In8) ORed with one
+	 * chroma input (In5-In8)
+	 */
 	CX25840_SVIDEO_LUMA1 = 0x10,
 	CX25840_SVIDEO_LUMA2 = 0x20,
 	CX25840_SVIDEO_LUMA3 = 0x30,
@@ -243,13 +245,16 @@ enum cx23885_io_pad {
 	CX23885_PAD_GPIO16,
 };
 
-/* pvr150_workaround activates a workaround for a hardware bug that is
-   present in Hauppauge PVR-150 (and possibly PVR-500) cards that have
-   certain NTSC tuners (tveeprom tuner model numbers 85, 99 and 112). The
-   audio autodetect fails on some channels for these models and the workaround
-   is to select the audio standard explicitly. Many thanks to Hauppauge for
-   providing this information.
-   This platform data only needs to be supplied by the ivtv driver. */
+/*
+ * pvr150_workaround activates a workaround for a hardware bug that is
+ * present in Hauppauge PVR-150 (and possibly PVR-500) cards that have
+ * certain NTSC tuners (tveeprom tuner model numbers 85, 99 and 112). The
+ * audio autodetect fails on some channels for these models and the workaround
+ * is to select the audio standard explicitly. Many thanks to Hauppauge for
+ * providing this information.
+ *
+ * This platform data only needs to be supplied by the ivtv driver.
+ */
 struct cx25840_platform_data {
 	int pvr150_workaround;
 };
-- 
2.21.0

