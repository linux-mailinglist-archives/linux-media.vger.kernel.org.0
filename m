Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189EB663B0E
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 09:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjAJI3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 03:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjAJI3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 03:29:33 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEACD6391
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 00:29:31 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d3so12406846plr.10
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc3TFcmZGm8H/XiFqasVXIq5h4UoZWNhzI3uRfWhc20=;
        b=W6GhzZ9ZqX9b0qbZBkG3f/kAqT2DSjB7JraGeE5MRm7uLfrHoUl7iXvSyHwqNghwku
         T3/60IhSoulfHhP0yU3Y/jdUgiMVVaU4+J/zxRQ9+aetIJAd64/pj3cQ0rnVNvoM4ags
         2ECgPgUsc6W1OrLnmj+AxIDd9VswCqKPUN9dFd9+U1vu3hgl3+w9C5bMjYdmVhZy9Xpx
         qTMqi50EY26oD9k+OiAUbAp+V1lHSfkpjzzt2izwR724vx2D2LK/0hxP2lynVh572U69
         m7BdFaJUSVCxlHLKcKuH78LoBmNJYd0XdKfrv6jrWoySPFQI7SKftE01hpAYJVZavkOJ
         rXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc3TFcmZGm8H/XiFqasVXIq5h4UoZWNhzI3uRfWhc20=;
        b=l/uHaeHb9gWnV2Fx8HzuxCNW3B05v5VtEU4Mo9xPx6zqZBNbLhVOClT1q7+CTynUUl
         bEcbBPUH0SmXNlXr7XhGnt8YTO7cVv4jAfLc7ipoyuf6NmI4pDeDSBUiIjSlCzJF1/dN
         w+OZ69n7bL9cuLkk8/z8d50snBeUkGHAJ21i6Zhh1Wtejhcf72CYnc7yd0cIAvO/13hp
         Y6AdVhNFAKUGpxJoeMvb6NWg/aiYrmilO3O1DzF9rBitTCftl4gAn04SKYAF1uO/BUJn
         F3bK+afwApb0BBTxpww7DrD9sc1ZOmJK7p4SmkeMxj6OMiWnFBheWaNBoZmk/w0bumCi
         cMpg==
X-Gm-Message-State: AFqh2kol7R/jy2dSKP3xSQHF67BibPdIiQy5O/iFvEWjRzOW8e9nM9py
        a/C+r/Br+Aw6nn6M5OdPtC0=
X-Google-Smtp-Source: AMrXdXucVCMwh4Y6obwSp6deRb7Vv7o2UFGNfrCi21G7X3xtEGts89LOcLXMoj9tzKEExaKiu7z3gA==
X-Received: by 2002:a17:902:c94b:b0:189:76ef:e112 with SMTP id i11-20020a170902c94b00b0018976efe112mr90940589pla.41.1673339371084;
        Tue, 10 Jan 2023 00:29:31 -0800 (PST)
Received: from redsen-desktop625.kern.oss.ntt.co.jp ([222.151.198.97])
        by smtp.gmail.com with ESMTPSA id jj13-20020a170903048d00b001928d49bf84sm7419240plb.191.2023.01.10.00.29.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:29:30 -0800 (PST)
From:   Yui Washizu <yui.washidu@gmail.com>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     Yui Washizu <yui.washidu@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] staging: media/av7110: cleanup coding style in av7110.c
Date:   Tue, 10 Jan 2023 17:28:56 +0900
Message-Id: <1673339336-27571-1-git-send-email-yui.washidu@gmail.com>
X-Mailer: git-send-email 2.2.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix everything checkpatch.pl complained about in av7110.c

Signed-off-by: Yui Washizu <yui.washidu@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 183 +++++++++++++++++-----------------
 1 file changed, 91 insertions(+), 92 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index d74ee0e..24cf299 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -75,11 +75,11 @@ static int full_ts;
 module_param_named(debug, av7110_debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (bitmask, default 0)");
 module_param(vidmode, int, 0444);
-MODULE_PARM_DESC(vidmode,"analog video out: 0 off, 1 CVBS+RGB (default), 2 CVBS+YC, 3 YC");
+MODULE_PARM_DESC(vidmode, "analog video out: 0 off, 1 CVBS+RGB (default), 2 CVBS+YC, 3 YC");
 module_param(pids_off, int, 0444);
-MODULE_PARM_DESC(pids_off,"clear video/audio/PCR PID filters when demux is closed");
+MODULE_PARM_DESC(pids_off, "clear video/audio/PCR PID filters when demux is closed");
 module_param(adac, int, 0444);
-MODULE_PARM_DESC(adac,"audio DAC type: 0 TI, 1 CRYSTAL, 2 MSP (use if autodetection fails)");
+MODULE_PARM_DESC(adac, "audio DAC type: 0 TI, 1 CRYSTAL, 2 MSP (use if autodetection fails)");
 module_param(hw_sections, int, 0444);
 MODULE_PARM_DESC(hw_sections, "0 use software section filter, 1 use hardware");
 module_param(rgb_on, int, 0444);
@@ -123,7 +123,7 @@ static void init_av7110_av(struct av7110 *av7110)
 	av7110->adac_type = DVB_ADAC_TI;
 	ret = av7110_set_volume(av7110, av7110->mixer.volume_left, av7110->mixer.volume_right);
 	if (ret < 0)
-		printk("dvb-ttpci:cannot set internal volume to maximum:%d\n",ret);
+		printk("dvb-ttpci:cannot set internal volume to maximum:%d\n", ret);
 
 	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
 			    1, (u16) av7110->display_ar);
@@ -143,7 +143,7 @@ static void init_av7110_av(struct av7110 *av7110)
 
 	ret = av7710_set_video_mode(av7110, vidmode);
 	if (ret < 0)
-		printk("dvb-ttpci:cannot set video mode:%d\n",ret);
+		printk("dvb-ttpci:cannot set video mode:%d\n", ret);
 
 	/* handle different card types */
 	/* remaining inits according to card and frontend type */
@@ -160,18 +160,16 @@ static void init_av7110_av(struct av7110 *av7110)
 		i2c_writereg(av7110, 0x20, 0x03, 0x00);
 		i2c_writereg(av7110, 0x20, 0x04, 0x00);
 
-		/**
+		/*
 		 * some special handling for the Siemens DVB-C cards...
 		 */
 	} else if (0 == av7110_init_analog_module(av7110)) {
 		/* done. */
-	}
-	else if (dev->pci->subsystem_vendor == 0x110a) {
+	} else if (dev->pci->subsystem_vendor == 0x110a) {
 		printk("dvb-ttpci: DVB-C w/o analog module @ card %d detected\n",
 			av7110->dvb_adapter.num);
 		av7110->adac_type = DVB_ADAC_NONE;
-	}
-	else {
+	} else {
 		av7110->adac_type = adac;
 		printk("dvb-ttpci: adac type set to %d @ card %d\n",
 			av7110->adac_type, av7110->dvb_adapter.num);
@@ -181,10 +179,10 @@ static void init_av7110_av(struct av7110 *av7110)
 		// switch DVB SCART on
 		ret = av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, MainSwitch, 1, 0);
 		if (ret < 0)
-			printk("dvb-ttpci:cannot switch on SCART(Main):%d\n",ret);
+			printk("dvb-ttpci:cannot switch on SCART(Main):%d\n", ret);
 		ret = av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, ADSwitch, 1, 1);
 		if (ret < 0)
-			printk("dvb-ttpci:cannot switch on SCART(AD):%d\n",ret);
+			printk("dvb-ttpci:cannot switch on SCART(AD):%d\n", ret);
 		if (rgb_on &&
 		    ((av7110->dev->pci->subsystem_vendor == 0x110a) ||
 		     (av7110->dev->pci->subsystem_vendor == 0x13c2)) &&
@@ -199,12 +197,12 @@ static void init_av7110_av(struct av7110 *av7110)
 
 	ret = av7110_set_volume(av7110, av7110->mixer.volume_left, av7110->mixer.volume_right);
 	if (ret < 0)
-		printk("dvb-ttpci:cannot set volume :%d\n",ret);
+		printk("dvb-ttpci:cannot set volume :%d\n", ret);
 }
 
 static void recover_arm(struct av7110 *av7110)
 {
-	dprintk(4, "%p\n",av7110);
+	dprintk(4, "%p\n", av7110);
 
 	av7110_bootarm(av7110);
 	msleep(100);
@@ -236,7 +234,7 @@ static int arm_thread(void *data)
 	u16 newloops = 0;
 	int timeout;
 
-	dprintk(4, "%p\n",av7110);
+	dprintk(4, "%p\n", av7110);
 
 	for (;;) {
 		timeout = wait_event_interruptible_timeout(av7110->arm_wait,
@@ -429,7 +427,7 @@ static void debiirq(struct tasklet_struct *t)
 		break;
 
 	case DATA_DEBUG_MESSAGE:
-		((s8*)av7110->debi_virt)[Reserved_SIZE - 1] = 0;
+		((s8 *)av7110->debi_virt)[Reserved_SIZE - 1] = 0;
 		printk("%s\n", (s8 *) av7110->debi_virt);
 		xfer = RX_BUFF;
 		break;
@@ -510,8 +508,7 @@ static void gpioirq(struct tasklet_struct *t)
 		event.type = VIDEO_EVENT_SIZE_CHANGED;
 		event.u.size.w = av7110->video_size.w;
 		event.u.size.h = av7110->video_size.h;
-		switch ((h_ar >> 12) & 0xf)
-		{
+		switch ((h_ar >> 12) & 0xf) {
 		case 3:
 			av7110->video_size.aspect_ratio = VIDEO_FORMAT_16_9;
 			event.u.size.aspect_ratio = VIDEO_FORMAT_16_9;
@@ -583,7 +580,7 @@ static void gpioirq(struct tasklet_struct *t)
 			spin_unlock(&av7110->aout.lock);
 		}
 		if (len <= 0 && (av7110->debitype & 0x200)
-		    &&av7110->videostate.play_state != VIDEO_FREEZED) {
+		    && av7110->videostate.play_state != VIDEO_FREEZED) {
 			spin_lock(&av7110->avout.lock);
 			len = av7110_pes_play(av7110->debi_virt, &av7110->avout, 2048);
 			spin_unlock(&av7110->avout.lock);
@@ -884,8 +881,7 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 	}
 
 	if (dvbdmxfeed->pes_type < 2 && npids[0])
-		if (av7110->fe_synced)
-		{
+		if (av7110->fe_synced) {
 			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
 			if (ret)
 				return ret;
@@ -966,7 +962,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 					   !(demux->pids[1] & 0x8000)) {
 					       dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
 					       dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
-					       ret = av7110_av_start_play(av7110,RP_AV);
+					       ret = av7110_av_start_play(av7110, RP_AV);
 					       if (!ret)
 						       demux->playing = 1;
 					}
@@ -1039,7 +1035,7 @@ static int av7110_stop_feed(struct dvb_demux_feed *feed)
 	}
 
 	if (feed->type == DMX_TYPE_SEC) {
-		for (i = 0; i<demux->filternum; i++) {
+		for (i = 0; i < demux->filternum; i++) {
 			if (demux->filter[i].state == DMX_STATE_GO &&
 			    demux->filter[i].filter.parent == &feed->feed.sec) {
 				demux->filter[i].state = DMX_STATE_READY;
@@ -1141,7 +1137,7 @@ static int dvb_get_stc(struct dmx_demux *demux, unsigned int num,
 
 static int av7110_set_tone(struct dvb_frontend *fe, enum fe_sec_tone_mode tone)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	switch (tone) {
 	case SEC_TONE_ON:
@@ -1155,18 +1151,18 @@ static int av7110_set_tone(struct dvb_frontend *fe, enum fe_sec_tone_mode tone)
 	}
 }
 
-static int av7110_diseqc_send_master_cmd(struct dvb_frontend* fe,
-					 struct dvb_diseqc_master_cmd* cmd)
+static int av7110_diseqc_send_master_cmd(struct dvb_frontend *fe,
+					 struct dvb_diseqc_master_cmd *cmd)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	return av7110_diseqc_send(av7110, cmd->msg_len, cmd->msg, -1);
 }
 
-static int av7110_diseqc_send_burst(struct dvb_frontend* fe,
+static int av7110_diseqc_send_burst(struct dvb_frontend *fe,
 				    enum fe_sec_mini_cmd minicmd)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	return av7110_diseqc_send(av7110, 0, NULL, minicmd);
 }
@@ -1438,7 +1434,7 @@ u8 i2c_readreg(struct av7110 *av7110, u8 id, u8 reg)
  ****************************************************************************/
 
 
-static int check_firmware(struct av7110* av7110)
+static int check_firmware(struct av7110 *av7110)
 {
 	u32 crc = 0, len = 0;
 	unsigned char *ptr;
@@ -1480,7 +1476,7 @@ static int check_firmware(struct av7110* av7110)
 		printk("dvb-ttpci: root file has strange size (%d). aborting.\n", len);
 		return -EINVAL;
 	}
-	if( crc != crc32_le(0, ptr, len)) {
+	if (crc != crc32_le(0, ptr, len)) {
 		printk("dvb-ttpci: crc32 of root file does not match.\n");
 		return -EINVAL;
 	}
@@ -1489,12 +1485,12 @@ static int check_firmware(struct av7110* av7110)
 	return 0;
 }
 
-static void put_firmware(struct av7110* av7110)
+static void put_firmware(struct av7110 *av7110)
 {
 	vfree(av7110->bin_fw);
 }
 
-static int get_firmware(struct av7110* av7110)
+static int get_firmware(struct av7110 *av7110)
 {
 	int ret;
 	const struct firmware *fw;
@@ -1528,7 +1524,8 @@ static int get_firmware(struct av7110* av7110)
 
 	memcpy(av7110->bin_fw, fw->data, fw->size);
 	av7110->size_fw = fw->size;
-	if ((ret = check_firmware(av7110)))
+	ret = check_firmware(av7110);
+	if (ret)
 		vfree(av7110->bin_fw);
 
 	release_firmware(fw);
@@ -1538,7 +1535,7 @@ static int get_firmware(struct av7110* av7110)
 static int alps_bsrv2_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 	u8 pwr = 0;
 	u8 buf[4];
 	struct i2c_msg msg = { .addr = 0x61, .flags = 0, .buf = buf, .len = sizeof(buf) };
@@ -1581,7 +1578,7 @@ static struct ves1x93_config alps_bsrv2_config = {
 static int alps_tdbe2_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 	u32 div;
 	u8 data[4];
 	struct i2c_msg msg = { .addr = 0x62, .flags = 0, .buf = data, .len = sizeof(data) };
@@ -1613,7 +1610,7 @@ static struct ves1820_config alps_tdbe2_config = {
 static int grundig_29504_451_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 	u32 div;
 	u8 data[4];
 	struct i2c_msg msg = { .addr = 0x61, .flags = 0, .buf = data, .len = sizeof(data) };
@@ -1640,7 +1637,7 @@ static struct tda8083_config grundig_29504_451_config = {
 static int philips_cd1516_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 	u32 div;
 	u32 f = p->frequency;
 	u8 data[4];
@@ -1672,7 +1669,7 @@ static struct ves1820_config philips_cd1516_config = {
 static int alps_tdlb7_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 	u32 div, pwr;
 	u8 data[4];
 	struct i2c_msg msg = { .addr = 0x60, .flags = 0, .buf = data, .len = sizeof(data) };
@@ -1696,10 +1693,10 @@ static int alps_tdlb7_tuner_set_params(struct dvb_frontend *fe)
 	return 0;
 }
 
-static int alps_tdlb7_request_firmware(struct dvb_frontend* fe, const struct firmware **fw, char* name)
+static int alps_tdlb7_request_firmware(struct dvb_frontend *fe, const struct firmware **fw, char *name)
 {
 #if IS_ENABLED(CONFIG_DVB_SP8870)
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	return request_firmware(fw, name, &av7110->dev->pci->dev);
 #else
@@ -1810,7 +1807,7 @@ static u8 nexusca_stv0297_inittab[] = {
 static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 	u32 div;
 	u8 data[4];
 	struct i2c_msg msg = { .addr = 0x63, .flags = 0, .buf = data, .len = sizeof(data) };
@@ -1842,11 +1839,12 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 	}
 
 	// wait for PLL lock
-	for(i = 0; i < 20; i++) {
+	for (i = 0; i < 20; i++) {
 		if (fe->ops.i2c_gate_ctrl)
 			fe->ops.i2c_gate_ctrl(fe, 1);
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
-			if (data[0] & 0x40) break;
+			if (data[0] & 0x40)
+				break;
 		msleep(10);
 	}
 
@@ -1866,7 +1864,7 @@ static struct stv0297_config nexusca_stv0297_config = {
 static int grundig_29504_401_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 	u32 div;
 	u8 cfg, cpump, band_select;
 	u8 data[4];
@@ -1901,7 +1899,8 @@ static int grundig_29504_401_tuner_set_params(struct dvb_frontend *fe)
 
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&av7110->i2c_adap, &msg, 1) != 1) return -EIO;
+	if (i2c_transfer (&av7110->i2c_adap, &msg, 1) != 1)
+		return -EIO;
 	return 0;
 }
 
@@ -1954,7 +1953,7 @@ static int av7110_fe_lock_fix(struct av7110 *av7110, enum fe_status status)
 
 static int av7110_fe_set_frontend(struct dvb_frontend *fe)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	int ret = av7110_fe_lock_fix(av7110, 0);
 	if (!ret)
@@ -1963,9 +1962,9 @@ static int av7110_fe_set_frontend(struct dvb_frontend *fe)
 	return ret;
 }
 
-static int av7110_fe_init(struct dvb_frontend* fe)
+static int av7110_fe_init(struct dvb_frontend *fe)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	int ret = av7110_fe_lock_fix(av7110, 0);
 	if (!ret)
@@ -1976,7 +1975,7 @@ static int av7110_fe_init(struct dvb_frontend* fe)
 static int av7110_fe_read_status(struct dvb_frontend *fe,
 				 enum fe_status *status)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	/* call the real implementation */
 	int ret = av7110->fe_read_status(fe, status);
@@ -1986,9 +1985,9 @@ static int av7110_fe_read_status(struct dvb_frontend *fe,
 	return ret;
 }
 
-static int av7110_fe_diseqc_reset_overload(struct dvb_frontend* fe)
+static int av7110_fe_diseqc_reset_overload(struct dvb_frontend *fe)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	int ret = av7110_fe_lock_fix(av7110, 0);
 	if (!ret)
@@ -1996,10 +1995,10 @@ static int av7110_fe_diseqc_reset_overload(struct dvb_frontend* fe)
 	return ret;
 }
 
-static int av7110_fe_diseqc_send_master_cmd(struct dvb_frontend* fe,
-					    struct dvb_diseqc_master_cmd* cmd)
+static int av7110_fe_diseqc_send_master_cmd(struct dvb_frontend *fe,
+					    struct dvb_diseqc_master_cmd *cmd)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	int ret = av7110_fe_lock_fix(av7110, 0);
 	if (!ret) {
@@ -2012,7 +2011,7 @@ static int av7110_fe_diseqc_send_master_cmd(struct dvb_frontend* fe,
 static int av7110_fe_diseqc_send_burst(struct dvb_frontend *fe,
 				       enum fe_sec_mini_cmd minicmd)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	int ret = av7110_fe_lock_fix(av7110, 0);
 	if (!ret) {
@@ -2025,7 +2024,7 @@ static int av7110_fe_diseqc_send_burst(struct dvb_frontend *fe,
 static int av7110_fe_set_tone(struct dvb_frontend *fe,
 			      enum fe_sec_tone_mode tone)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	int ret = av7110_fe_lock_fix(av7110, 0);
 	if (!ret) {
@@ -2038,7 +2037,7 @@ static int av7110_fe_set_tone(struct dvb_frontend *fe,
 static int av7110_fe_set_voltage(struct dvb_frontend *fe,
 				 enum fe_sec_voltage voltage)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	int ret = av7110_fe_lock_fix(av7110, 0);
 	if (!ret) {
@@ -2048,9 +2047,9 @@ static int av7110_fe_set_voltage(struct dvb_frontend *fe,
 	return ret;
 }
 
-static int av7110_fe_dishnetwork_send_legacy_command(struct dvb_frontend* fe, unsigned long cmd)
+static int av7110_fe_dishnetwork_send_legacy_command(struct dvb_frontend *fe, unsigned long cmd)
 {
-	struct av7110* av7110 = fe->dvb->priv;
+	struct av7110 *av7110 = fe->dvb->priv;
 
 	int ret = av7110_fe_lock_fix(av7110, 0);
 	if (!ret)
@@ -2058,7 +2057,7 @@ static int av7110_fe_dishnetwork_send_legacy_command(struct dvb_frontend* fe, un
 	return ret;
 }
 
-static void dvb_s_recover(struct av7110* av7110)
+static void dvb_s_recover(struct av7110 *av7110)
 {
 	av7110_fe_init(av7110->fe);
 
@@ -2075,12 +2074,12 @@ static void dvb_s_recover(struct av7110* av7110)
 	av7110_fe_set_frontend(av7110->fe);
 }
 
-static u8 read_pwm(struct av7110* av7110)
+static u8 read_pwm(struct av7110 *av7110)
 {
 	u8 b = 0xff;
 	u8 pwm;
-	struct i2c_msg msg[] = { { .addr = 0x50,.flags = 0,.buf = &b,.len = 1 },
-				 { .addr = 0x50,.flags = I2C_M_RD,.buf = &pwm,.len = 1} };
+	struct i2c_msg msg[] = { { .addr = 0x50, .flags = 0, .buf = &b, .len = 1 },
+				 { .addr = 0x50, .flags = I2C_M_RD, .buf = &pwm, .len = 1} };
 
 	if ((i2c_transfer(&av7110->i2c_adap, msg, 2) != 2) || (pwm == 0xff))
 		pwm = 0x48;
@@ -2093,7 +2092,7 @@ static int frontend_init(struct av7110 *av7110)
 	int ret;
 
 	if (av7110->dev->pci->subsystem_vendor == 0x110a) {
-		switch(av7110->dev->pci->subsystem_device) {
+		switch (av7110->dev->pci->subsystem_device) {
 		case 0x0000: // Fujitsu/Siemens DVB-Cable (ves1820/Philips CD1516(??))
 			av7110->fe = dvb_attach(ves1820_attach, &philips_cd1516_config,
 						    &av7110->i2c_adap, read_pwm(av7110));
@@ -2104,7 +2103,7 @@ static int frontend_init(struct av7110 *av7110)
 		}
 
 	} else if (av7110->dev->pci->subsystem_vendor == 0x13c2) {
-		switch(av7110->dev->pci->subsystem_device) {
+		switch (av7110->dev->pci->subsystem_device) {
 		case 0x0000: // Hauppauge/TT WinTV DVB-S rev1.X
 		case 0x0003: // Hauppauge/TT WinTV Nexus-S Rev 2.X
 		case 0x1002: // Hauppauge/TT WinTV DVB-S rev1.3SE
@@ -2145,7 +2144,7 @@ static int frontend_init(struct av7110 *av7110)
 			}
 
 			/* Try DVB-C cards */
-			switch(av7110->dev->pci->subsystem_device) {
+			switch (av7110->dev->pci->subsystem_device) {
 			case 0x0000:
 				/* Siemens DVB-C (full-length card) VES1820/Philips CD1516 */
 				av7110->fe = dvb_attach(ves1820_attach, &philips_cd1516_config, &av7110->i2c_adap,
@@ -2344,7 +2343,7 @@ static int frontend_init(struct av7110 *av7110)
  * The same behaviour of missing VSYNC can be duplicated on budget
  * cards, by setting DD1_INIT trigger mode 7 in 3rd nibble.
  */
-static int av7110_attach(struct saa7146_dev* dev,
+static int av7110_attach(struct saa7146_dev *dev,
 			 struct saa7146_pci_extension_data *pci_ext)
 {
 	const int length = TS_WIDTH * TS_HEIGHT;
@@ -2417,14 +2416,14 @@ static int av7110_attach(struct saa7146_dev* dev,
 		 * use 0x03 to track RPS1 interrupts - increase by 1 every gpio3 is toggled
 		 * use 0x15 to track VPE  interrupts - increase by 1 every vpeirq() is called
 		 */
-		saa7146_write(dev, EC1SSR, (0x03<<2) | 3 );
+		saa7146_write(dev, EC1SSR, (0x03<<2) | 3);
 		/* set event counter 1 threshold to maximum allowed value        (rEC p55) */
-		saa7146_write(dev, ECT1R,  0x3fff );
+		saa7146_write(dev, ECT1R,  0x3fff);
 #endif
 		/* Set RPS1 Address register to point to RPS code               (r108 p42) */
 		saa7146_write(dev, RPS_ADDR1, dev->d_rps1.dma_handle);
 		/* Enable RPS1,                                                 (rFC p33) */
-		saa7146_write(dev, MC1, (MASK_13 | MASK_29 ));
+		saa7146_write(dev, MC1, (MASK_13 | MASK_29));
 
 		mdelay(10);
 		/* now send VSYNC_B to rps1 by rising GPIO3 */
@@ -2438,9 +2437,9 @@ static int av7110_attach(struct saa7146_dev* dev,
 			printk("dvb-ttpci: BUDGET-PATCH DETECTED.\n");
 		}
 		/* Disable RPS1 */
-		saa7146_write(dev, MC1, ( MASK_29 ));
+		saa7146_write(dev, MC1, (MASK_29));
 #if RPS_IRQ
-		printk("dvb-ttpci: Event Counter 1 0x%04x\n", saa7146_read(dev, EC1R) & 0x3fff );
+		printk("dvb-ttpci: Event Counter 1 0x%04x\n", saa7146_read(dev, EC1R) & 0x3fff);
 #endif
 	}
 
@@ -2451,7 +2450,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 		return -ENOMEM;
 	}
 
-	av7110->card_name = (char*) pci_ext->ext_priv;
+	av7110->card_name = (char *)pci_ext->ext_priv;
 	av7110->dev = dev;
 	dev->ext_priv = av7110;
 
@@ -2551,9 +2550,9 @@ static int av7110_attach(struct saa7146_dev* dev,
 		 * use 0x03 to track RPS1 interrupts - increase by 1 every gpio3 is toggled
 		 * use 0x15 to track VPE  interrupts - increase by 1 every vpeirq() is called
 		 */
-		saa7146_write(dev, EC1SSR, (0x03<<2) | 3 );
+		saa7146_write(dev, EC1SSR, (0x03<<2) | 3);
 		/* set event counter 1 threshold to maximum allowed value        (rEC p55) */
-		saa7146_write(dev, ECT1R,  0x3fff );
+		saa7146_write(dev, ECT1R,  0x3fff);
 #endif
 		/* Setup BUDGETPATCH MAIN RPS1 "program" (p35) */
 		count = 0;
@@ -2594,7 +2593,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 		 * then RPS_THRESH1 should be set to trigger
 		 * every TS_HEIGHT (512) lines.
 		 */
-		saa7146_write(dev, RPS_THRESH1, (TS_HEIGHT*1) | MASK_12 );
+		saa7146_write(dev, RPS_THRESH1, (TS_HEIGHT*1) | MASK_12);
 
 		/* Enable RPS1                                                  (rFC p33) */
 		saa7146_write(dev, MC1, (MASK_13 | MASK_29));
@@ -2669,7 +2668,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 	if (ret < 0)
 		goto err_stop_arm_9;
 
-	if (FW_VERSION(av7110->arm_app)<0x2501)
+	if (FW_VERSION(av7110->arm_app) < 0x2501)
 		printk(KERN_WARNING
 		       "dvb-ttpci: Warning, firmware version 0x%04x is too old. System might be unstable!\n",
 		       FW_VERSION(av7110->arm_app));
@@ -2744,7 +2743,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 	goto out;
 }
 
-static int av7110_detach(struct saa7146_dev* saa)
+static int av7110_detach(struct saa7146_dev *saa)
 {
 	struct av7110 *av7110 = saa->ext_priv;
 	dprintk(4, "%p\n", av7110);
@@ -2801,7 +2800,7 @@ static int av7110_detach(struct saa7146_dev* saa)
 }
 
 
-static void av7110_irq(struct saa7146_dev* dev, u32 *isr)
+static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
 {
 	struct av7110 *av7110 = dev->ext_priv;
 
@@ -2845,22 +2844,22 @@ static void av7110_irq(struct saa7146_dev* dev, u32 *isr)
 
 static struct saa7146_extension av7110_extension_driver;
 
-#define MAKE_AV7110_INFO(x_var,x_name) \
+#define MAKE_AV7110_INFO(x_var, x_name) \
 static struct saa7146_pci_extension_data x_var = { \
 	.ext_priv = x_name, \
 	.ext = &av7110_extension_driver }
 
-MAKE_AV7110_INFO(tts_1_X_fsc,"Technotrend/Hauppauge WinTV DVB-S rev1.X or Fujitsu Siemens DVB-C");
-MAKE_AV7110_INFO(ttt_1_X,    "Technotrend/Hauppauge WinTV DVB-T rev1.X");
-MAKE_AV7110_INFO(ttc_1_X,    "Technotrend/Hauppauge WinTV Nexus-CA rev1.X");
-MAKE_AV7110_INFO(ttc_2_X,    "Technotrend/Hauppauge WinTV DVB-C rev2.X");
-MAKE_AV7110_INFO(tts_2_X,    "Technotrend/Hauppauge WinTV Nexus-S rev2.X");
-MAKE_AV7110_INFO(tts_2_3,    "Technotrend/Hauppauge WinTV Nexus-S rev2.3");
-MAKE_AV7110_INFO(tts_1_3se,  "Technotrend/Hauppauge WinTV DVB-S rev1.3 SE");
-MAKE_AV7110_INFO(ttt,        "Technotrend/Hauppauge DVB-T");
-MAKE_AV7110_INFO(fsc,        "Fujitsu Siemens DVB-C");
-MAKE_AV7110_INFO(fss,        "Fujitsu Siemens DVB-S rev1.6");
-MAKE_AV7110_INFO(gxs_1_3,    "Galaxis DVB-S rev1.3");
+MAKE_AV7110_INFO(tts_1_X_fsc, "Technotrend/Hauppauge WinTV DVB-S rev1.X or Fujitsu Siemens DVB-C");
+MAKE_AV7110_INFO(ttt_1_X,     "Technotrend/Hauppauge WinTV DVB-T rev1.X");
+MAKE_AV7110_INFO(ttc_1_X,     "Technotrend/Hauppauge WinTV Nexus-CA rev1.X");
+MAKE_AV7110_INFO(ttc_2_X,     "Technotrend/Hauppauge WinTV DVB-C rev2.X");
+MAKE_AV7110_INFO(tts_2_X,     "Technotrend/Hauppauge WinTV Nexus-S rev2.X");
+MAKE_AV7110_INFO(tts_2_3,     "Technotrend/Hauppauge WinTV Nexus-S rev2.3");
+MAKE_AV7110_INFO(tts_1_3se,   "Technotrend/Hauppauge WinTV DVB-S rev1.3 SE");
+MAKE_AV7110_INFO(ttt,         "Technotrend/Hauppauge DVB-T");
+MAKE_AV7110_INFO(fsc,         "Fujitsu Siemens DVB-C");
+MAKE_AV7110_INFO(fss,         "Fujitsu Siemens DVB-S rev1.6");
+MAKE_AV7110_INFO(gxs_1_3,     "Galaxis DVB-S rev1.3");
 
 static const struct pci_device_id pci_tbl[] = {
 	MAKE_EXTENSION_PCI(fsc,         0x110a, 0x0000),
-- 
2.2.0

