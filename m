Return-Path: <linux-media+bounces-10957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEDB8BD8A4
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 608A01C22D6F
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302F4A55;
	Tue,  7 May 2024 00:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="jH0NtW//"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F404637
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041652; cv=none; b=sUEyZhgP5wuU4uU6Oj94NiIKan6zAY/zPo2nuY2oTLTqTxbUBusHYPS1ore8rN5LZq66fmRF0avakOqTSzoiiEPa2Oa2Qcf8TRDXrs4R+Dq6sDD83L2PxZjRKXR1LpVn3AOl+S+7hMKQ2xcvzQc1IosBsABC+GvZG1fnsaCzHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041652; c=relaxed/simple;
	bh=SyqoDwNGNrIGEQWoG0OIj1Cac28KK3yDWZ1A5DYEv5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NEwac/2VFQeY+bvtSIe8xp5iyfgBRLDaCqrFxbNVRB45KEAG9qvGGf5nwE2wg5ZtgeH8Zlt5frQeTgkX9Kylpx4N8qOIJsHdcJ1N9YhTiBM8IgE/8I/dv2P8bfHnOVO6O+aEP8xJAEWKMVI4GV0+er1xcnjicsnG/GtJTT2a6i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=jH0NtW//; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041646; x=1715646446; i=herdler@nurfuerspam.de;
	bh=/QkeTg2W/HIoi/Ho2pxuRzt18vx+lypVYLn56WdQsSw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jH0NtW//FIB21fP501ZdAVt8RatgEvO08P4V3Wa0S2VLTu4eGnvbIH4chYSQLvWA
	 mbPFiueh25/Do8fhP3UjsLuF+hFfiAYdUU+Dv3ZyEBF8mtokxj4EjzS3cQMoMXtkh
	 W2Z6lSRdQwl6upnFte5bsgB0wRmnoXmFq0O0/uMBKeIzNBoLaCQj2EjD97o3iwKC2
	 h8PQDz+7ByZ4ej+bZZonYpee5FW37VdeNc1f8OX0/Y32AOtXkG7ewumXO2KvoCbiF
	 QBLj66mXkfK4ytDlcxD11QwjoF7B3Q1g5nTrCPrpbuYBkT1huCCcPUr6uT/7H/hV0
	 8uAakVR+8KZMAtFnww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQeU-1rwx8F36oA-008t1L; Tue, 07
 May 2024 02:27:25 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 20/21] media: av7110: coding style fixes: logging
Date: Tue,  7 May 2024 02:24:59 +0200
Message-Id: <20240507002500.81867-21-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HFPoBtw6UIvWabBQinJaTPL2wXd5BLrVtyjZhurE89u6NLwFKXo
 RbynpyXxKqgIShBEyVqYhgKZ8TXQs9dbnmr7sPCaKakrpD7x0Oa/wBqQb1JqPbLmbIH+XTB
 26OLX9MBD3nzSXV7REv79UlyLMwYpUHBNcg/vLcjypiS2u1Ru0mhL4G64rvuMPDoC2Em6Fc
 951H3FqEay+E2bbKK4i8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Yiwc8VDee+E=;HdoxaEjuQjz13YZWvgOc5Nziw0s
 2yxCPLqEffrwkSuKwXazKTLal1qo/WrTTIpYeCK6zDDk/BMpVW7fB6ge1BAuvPxfSSTimOoKS
 cGcH2NFug+cv5FgunE+IvkKnefE1UL+eBDfiEcjJ28lwq/eOcHKLol90E2UnlQ6AZWO/E2auH
 AkoPkOqHC+vcOsvwgtE5ThnwxjslBsMCoQZssHSfIWXU3Lci4bJNW54yV9tWcVbp7oVhBVYSX
 V1wAC8C8cl/jXlYKDyEay0KSjV38ToJCNir46RjjO0T3ffZzlOJC1P3eTtwcZ+NZhZ41P5/xq
 LQE/0wGDNl/hnjT6eKSlEW+s8QiwLDKtpJpSNPpMaydyy2nKj0S9XUexUrXAIb8DZki5wqTHb
 DZjrPBF0yjVXv9gpaVjG+KHRQhU1+6w5tjuk7rYj416f3atzrUM4/hYF8LnRrKw0FtHQipMZI
 Wv8J/oDhrxMaXACpFaooPbnMczHa4neEwTDWYGjNs1ZLrN5Uw6co4mgq6jcGC00hiHJ6jx9TT
 /En9WGx68lK3sqD9w6X/6iD8YYpvhP6aKL86WXiNMsxiUuL9rMDXvcjcwu41RKdFufThKWpX1
 FYhFzLNJnING1npY7VMjkSY95SRZ28W8vdUOa5YtuiUs3YOlTDq7bn3l64SrllsljNfKyqwu1
 Zwiu6RzB+Z4ou/axb2Wfnb2o5raQqeevqWIxHVohxJPJKK9eA52ixuoYSeXBEqnY6vCT+aO6f
 QbOgFd5KHEbn8s0HI5qRYT6ldSyzjmAXhKU7gQCXfimA4dxwnp48An2m2BUp6RWdTkkECC3xn
 W9LUu8UsLJNi1mHynLwQGHEQZo/W2Jttql0ohA79lOz0w=

This patch fixes the following checkpatch warnings:

CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'level' may be better as '(leve=
l)' to avoid precedence issues
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'av7110_bootarm', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'av7110_diseqc_send', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'av7110_fw_cmd', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'av7110_fw_query', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'av7110_fw_request', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'av7110_osd_cmd', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'av7110_send_ci_cmd', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'av7110_send_fw_cmd', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'gpioirq', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'load_dram', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'ReleaseBitmap', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'vpeirq', this function's name, in a string
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'WriteText', this function's name, in a string
WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasib=
le
WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev=
, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_dbg([subsystem]dev,=
 ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_err([subsystem]dev,=
 ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_info([subsystem]dev=
, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_warn([subsystem]dev=
, ... then dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> fa=
cility level
WARNING:TRACING_LOGGING: Unnecessary ftrace-like logging - prefer using ft=
race

There where different logging styles in this drivers.
Convert everything to the recommend pr_* macros.

Log messages should mostly be unchanged by this patch.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c     | 130 ++++++++++------------
 drivers/staging/media/av7110/av7110.h     |  10 +-
 drivers/staging/media/av7110/av7110_av.c  |  52 ++++-----
 drivers/staging/media/av7110/av7110_ca.c  |  12 +-
 drivers/staging/media/av7110/av7110_hw.c  | 116 +++++++++----------
 drivers/staging/media/av7110/av7110_ir.c  |   3 +-
 drivers/staging/media/av7110/av7110_v4l.c |  10 +-
 drivers/staging/media/av7110/dvb_filter.c |  11 +-
 8 files changed, 157 insertions(+), 187 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index 30e2e6e65..728b3892a 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -119,27 +119,27 @@ static void init_av7110_av(struct av7110 *av7110)
 	av7110->adac_type =3D DVB_ADAC_TI;
 	ret =3D av7110_set_volume(av7110, av7110->mixer.volume_left, av7110->mix=
er.volume_right);
 	if (ret < 0)
-		printk("dvb-ttpci:cannot set internal volume to maximum:%d\n",ret);
+		pr_err("cannot set internal volume to maximum:%d\n", ret);

 	ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
 			    1, (u16)av7110->display_ar);
 	if (ret < 0)
-		printk("dvb-ttpci: unable to set aspect ratio\n");
+		pr_err("unable to set aspect ratio\n");
 	ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
 			    1, av7110->display_panscan);
 	if (ret < 0)
-		printk("dvb-ttpci: unable to set pan scan\n");
+		pr_err("unable to set pan scan\n");

 	ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 2, wss_c=
fg_4_3);
 	if (ret < 0)
-		printk("dvb-ttpci: unable to configure 4:3 wss\n");
+		pr_err("unable to configure 4:3 wss\n");
 	ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 3, wss_c=
fg_16_9);
 	if (ret < 0)
-		printk("dvb-ttpci: unable to configure 16:9 wss\n");
+		pr_err("unable to configure 16:9 wss\n");

 	ret =3D av7710_set_video_mode(av7110, vidmode);
 	if (ret < 0)
-		printk("dvb-ttpci:cannot set video mode:%d\n",ret);
+		pr_err("cannot set video mode:%d\n", ret);

 	/* handle different card types */
 	/* remaining inits according to card and frontend type */
@@ -148,8 +148,7 @@ static void init_av7110_av(struct av7110 *av7110)
 	if (dev->pci->subsystem_vendor =3D=3D 0x13c2 && dev->pci->subsystem_devi=
ce =3D=3D 0x000a)
 		av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, ADSwitch, 1, 0); // SPDIF on
 	if (i2c_writereg(av7110, 0x20, 0x00, 0x00) =3D=3D 1) {
-		printk ("dvb-ttpci: Crystal audio DAC @ card %d detected\n",
-			av7110->dvb_adapter.num);
+		pr_info("Crystal audio DAC @ card %d detected\n", av7110->dvb_adapter.n=
um);
 		av7110->adac_type =3D DVB_ADAC_CRYSTAL;
 		i2c_writereg(av7110, 0x20, 0x01, 0xd2);
 		i2c_writereg(av7110, 0x20, 0x02, 0x49);
@@ -162,23 +161,21 @@ static void init_av7110_av(struct av7110 *av7110)
 	} else if (av7110_init_analog_module(av7110) =3D=3D 0) {
 		/* done. */
 	} else if (dev->pci->subsystem_vendor =3D=3D 0x110a) {
-		printk("dvb-ttpci: DVB-C w/o analog module @ card %d detected\n",
-			av7110->dvb_adapter.num);
+		pr_info("DVB-C w/o analog module @ card %d detected\n", av7110->dvb_ada=
pter.num);
 		av7110->adac_type =3D DVB_ADAC_NONE;
 	} else {
 		av7110->adac_type =3D adac;
-		printk("dvb-ttpci: adac type set to %d @ card %d\n",
-			av7110->adac_type, av7110->dvb_adapter.num);
+		pr_info("adac type set to %d @ card %d\n", av7110->adac_type, av7110->d=
vb_adapter.num);
 	}

 	if (av7110->adac_type =3D=3D DVB_ADAC_NONE || av7110->adac_type =3D=3D D=
VB_ADAC_MSP34x0) {
 		// switch DVB SCART on
 		ret =3D av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, MainSwitch, 1, 0);
 		if (ret < 0)
-			printk("dvb-ttpci:cannot switch on SCART(Main):%d\n",ret);
+			pr_err("cannot switch on SCART(Main):%d\n", ret);
 		ret =3D av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, ADSwitch, 1, 1);
 		if (ret < 0)
-			printk("dvb-ttpci:cannot switch on SCART(AD):%d\n",ret);
+			pr_err("cannot switch on SCART(AD):%d\n", ret);
 		if (rgb_on &&
 		    ((av7110->dev->pci->subsystem_vendor =3D=3D 0x110a) ||
 		     (av7110->dev->pci->subsystem_vendor =3D=3D 0x13c2)) &&
@@ -193,12 +190,12 @@ static void init_av7110_av(struct av7110 *av7110)

 	ret =3D av7110_set_volume(av7110, av7110->mixer.volume_left, av7110->mix=
er.volume_right);
 	if (ret < 0)
-		printk("dvb-ttpci:cannot set volume :%d\n",ret);
+		pr_err("cannot set volume :%d\n", ret);
 }

 static void recover_arm(struct av7110 *av7110)
 {
-	dprintk(4, "%p\n",av7110);
+	dprintk(4, "%p\n", av7110);

 	av7110_bootarm(av7110);
 	msleep(100);
@@ -230,7 +227,7 @@ static int arm_thread(void *data)
 	u16 newloops =3D 0;
 	int timeout;

-	dprintk(4, "%p\n",av7110);
+	dprintk(4, "%p\n", av7110);

 	for (;;) {
 		timeout =3D wait_event_interruptible_timeout(av7110->arm_wait,
@@ -250,8 +247,7 @@ static int arm_thread(void *data)
 		mutex_unlock(&av7110->dcomlock);

 		if (newloops =3D=3D av7110->arm_loops || av7110->arm_errors > 3) {
-			printk(KERN_ERR "dvb-ttpci: ARM crashed @ card %d\n",
-			       av7110->dvb_adapter.num);
+			pr_err("ARM crashed @ card %d\n", av7110->dvb_adapter.num);

 			recover_arm(av7110);

@@ -325,7 +321,7 @@ static inline void print_time(char *s)
 	struct timespec64 ts;

 	ktime_get_real_ts64(&ts);
-	printk("%s: %lld.%09ld\n", s, (s64)ts.tv_sec, ts.tv_nsec);
+	pr_info("%s(): %lld.%09ld\n", s, (s64)ts.tv_sec, ts.tv_nsec);
 #endif
 }

@@ -336,7 +332,7 @@ static inline void start_debi_dma(struct av7110 *av711=
0, int dir,
 {
 	dprintk(8, "%c %08lx %u\n", dir =3D=3D DEBI_READ ? 'R' : 'W', addr, len)=
;
 	if (saa7146_wait_for_debi_done(av7110->dev, 0)) {
-		printk(KERN_ERR "%s: saa7146_wait_for_debi_done timed out\n", __func__)=
;
+		pr_err("%s(): saa7146_wait_for_debi_done timed out\n", __func__);
 		return;
 	}

@@ -361,9 +357,8 @@ static void debiirq(struct tasklet_struct *t)
 	dprintk(4, "type 0x%04x\n", type);

 	if (type =3D=3D -1) {
-		printk("DEBI irq oops @ %ld, psr:0x%08x, ssr:0x%08x\n",
-		       jiffies, saa7146_read(av7110->dev, PSR),
-		       saa7146_read(av7110->dev, SSR));
+		pr_err("DEBI irq oops @ %ld, psr:0x%08x, ssr:0x%08x\n", jiffies,
+		       saa7146_read(av7110->dev, PSR), saa7146_read(av7110->dev, SSR));
 		goto debi_done;
 	}
 	av7110->debitype =3D -1;
@@ -424,7 +419,7 @@ static void debiirq(struct tasklet_struct *t)

 	case DATA_DEBUG_MESSAGE:
 		((s8 *)av7110->debi_virt)[Reserved_SIZE - 1] =3D 0;
-		printk("%s\n", (s8 *) av7110->debi_virt);
+		pr_info("%s\n", (s8 *)av7110->debi_virt);
 		xfer =3D RX_BUFF;
 		break;

@@ -460,12 +455,11 @@ static void gpioirq(struct tasklet_struct *t)

 	if (av7110->debitype !=3D -1)
 		/* we shouldn't get any irq while a debi xfer is running */
-		printk("dvb-ttpci: GPIO0 irq oops @ %ld, psr:0x%08x, ssr:0x%08x\n",
-		       jiffies, saa7146_read(av7110->dev, PSR),
-		       saa7146_read(av7110->dev, SSR));
+		pr_err("GPIO0 irq oops @ %ld, psr:0x%08x, ssr:0x%08x\n", jiffies,
+		       saa7146_read(av7110->dev, PSR), saa7146_read(av7110->dev, SSR));

 	if (saa7146_wait_for_debi_done(av7110->dev, 0)) {
-		printk(KERN_ERR "%s: saa7146_wait_for_debi_done timed out\n", __func__)=
;
+		pr_err("%s(): saa7146_wait_for_debi_done timed out\n", __func__);
 		BUG(); /* maybe we should try resetting the debi? */
 	}

@@ -657,7 +651,7 @@ static void gpioirq(struct tasklet_struct *t)
 		break;

 	default:
-		printk("dvb-ttpci: gpioirq unknown type=3D%d len=3D%d\n",
+		pr_err("%s(): unknown irq: type=3D%d len=3D%d\n", __func__,
 		       av7110->debitype, av7110->debilen);
 		break;
 	}
@@ -798,9 +792,8 @@ static int StartHWFilter(struct dvb_demux_filter *dvbd=
mxfilter)

 	ret =3D av7110_fw_request(av7110, buf, 20, &handle, 1);
 	if (ret !=3D 0 || handle >=3D 32) {
-		printk(KERN_ERR "dvb-ttpci: %s error  buf %04x %04x %04x %04x  ret %d  =
handle %04x\n",
-				__func__, buf[0], buf[1], buf[2], buf[3],
-				ret, handle);
+		pr_err("%s(): error  buf %04x %04x %04x %04x  ret %d  handle %04x\n",
+		       __func__, buf[0], buf[1], buf[2], buf[3], ret, handle);
 		dvbdmxfilter->hw_handle =3D 0xffff;
 		if (!ret)
 			ret =3D -1;
@@ -828,8 +821,8 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdm=
xfilter)

 	handle =3D dvbdmxfilter->hw_handle;
 	if (handle >=3D 32) {
-		printk("%s tried to stop invalid filter %04x, filter type =3D %x\n",
-				__func__, handle, dvbdmxfilter->type);
+		pr_err("%s(): tried to stop invalid filter %04x, filter type =3D %x\n",
+		       __func__, handle, dvbdmxfilter->type);
 		return -EINVAL;
 	}

@@ -840,9 +833,8 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdm=
xfilter)
 	buf[2] =3D handle;
 	ret =3D av7110_fw_request(av7110, buf, 3, answ, 2);
 	if (ret !=3D 0 || answ[1] !=3D handle) {
-		printk(KERN_ERR "dvb-ttpci: %s error  cmd %04x %04x %04x  ret %x  resp =
%04x %04x  pid %d\n",
-				__func__, buf[0], buf[1], buf[2], ret,
-				answ[0], answ[1], dvbdmxfilter->feed->pid);
+		pr_err("%s(): error  cmd %04x %04x %04x  ret %x  resp %04x %04x  pid %d=
\n", __func__,
+		       buf[0], buf[1], buf[2], ret, answ[0], answ[1], dvbdmxfilter->fee=
d->pid);
 		if (!ret)
 			ret =3D -1;
 	}
@@ -1117,11 +1109,10 @@ static int dvb_get_stc(struct dmx_demux *demux, un=
signed int num,

 	ret =3D av7110_fw_request(av7110, &tag, 0, fwstc, 4);
 	if (ret) {
-		printk(KERN_ERR "%s: av7110_fw_request error\n", __func__);
+		pr_err("%s(): av7110_fw_request error\n", __func__);
 		return ret;
 	}
-	dprintk(2, "fwstc =3D %04hx %04hx %04hx %04hx\n",
-		fwstc[0], fwstc[1], fwstc[2], fwstc[3]);
+	dprintk(2, "fwstc =3D %04hx %04hx %04hx %04hx\n", fwstc[0], fwstc[1], fw=
stc[2], fwstc[3]);

 	*stc =3D	(((uint64_t)((fwstc[3] & 0x8000) >> 15)) << 32) |
 		(((uint64_t)fwstc[1]) << 16) | ((uint64_t)fwstc[0]);
@@ -1250,11 +1241,10 @@ static void vpeirq(struct tasklet_struct *t)
 	dma_sync_sg_for_cpu(&budget->dev->pci->dev, budget->pt.slist,
 			    budget->pt.nents, DMA_FROM_DEVICE);

-#if 0
+#ifdef RPS_DEBUG
 	/* track rps1 activity */
-	printk("vpeirq: %02x Event Counter 1 0x%04x\n",
-	       mem[olddma],
-	       saa7146_read(budget->dev, EC1R) & 0x3fff);
+	pr_info("%s(): %02x Event Counter 1 0x%04x\n", __func__, mem[olddma],
+		saa7146_read(budget->dev, EC1R) & 0x3fff);
 #endif

 	if (newdma > olddma) {
@@ -1355,7 +1345,7 @@ static int av7110_register(struct av7110 *av7110)
 		dvb_dmxdev_init(&av7110->dmxdev1, &av7110->dvb_adapter);

 		dvb_net_init(&av7110->dvb_adapter, &av7110->dvb_net1, &dvbdemux1->dmx);
-		printk("dvb-ttpci: additional demux1 for budget-patch registered\n");
+		pr_info("additional demux1 for budget-patch registered\n");
 	}
 	return 0;
 }
@@ -1444,7 +1434,7 @@ static int check_firmware(struct av7110 *av7110)
 	ptr =3D av7110->bin_fw;
 	if (ptr[0] !=3D 'A' || ptr[1] !=3D 'V' ||
 	    ptr[2] !=3D 'F' || ptr[3] !=3D 'W') {
-		printk("dvb-ttpci: this is not an av7110 firmware\n");
+		pr_err("this is not an av7110 firmware\n");
 		return -EINVAL;
 	}
 	ptr +=3D 4;
@@ -1455,11 +1445,11 @@ static int check_firmware(struct av7110 *av7110)
 	len =3D get_unaligned_be32(ptr);
 	ptr +=3D 4;
 	if (len >=3D 512) {
-		printk("dvb-ttpci: dpram file is way too big.\n");
+		pr_err("dpram file is way too big.\n");
 		return -EINVAL;
 	}
 	if (crc !=3D crc32_le(0, ptr, len)) {
-		printk("dvb-ttpci: crc32 of dpram file does not match.\n");
+		pr_err("crc32 of dpram file does not match.\n");
 		return -EINVAL;
 	}
 	av7110->bin_dpram =3D ptr;
@@ -1474,11 +1464,11 @@ static int check_firmware(struct av7110 *av7110)

 	if (len <=3D 200000 || len >=3D 300000 ||
 	    len > ((av7110->bin_fw + av7110->size_fw) - ptr)) {
-		printk("dvb-ttpci: root file has strange size (%d). aborting.\n", len);
+		pr_err("root file has strange size (%d). aborting.\n", len);
 		return -EINVAL;
 	}
 	if (crc !=3D crc32_le(0, ptr, len)) {
-		printk("dvb-ttpci: crc32 of root file does not match.\n");
+		pr_err("crc32 of root file does not match.\n");
 		return -EINVAL;
 	}
 	av7110->bin_root =3D ptr;
@@ -1500,18 +1490,17 @@ static int get_firmware(struct av7110 *av7110)
 	ret =3D request_firmware(&fw, "dvb-ttpci-01.fw", &av7110->dev->pci->dev)=
;
 	if (ret) {
 		if (ret =3D=3D -ENOENT) {
-			printk(KERN_ERR "dvb-ttpci: could not load firmware, file not found: d=
vb-ttpci-01.fw\n");
-			printk(KERN_ERR "dvb-ttpci: usually this should be in /usr/lib/hotplug=
/firmware or /lib/firmware\n");
-			printk(KERN_ERR "dvb-ttpci: and can be downloaded from https://linuxtv=
.org/download/dvb/firmware/\n");
+			pr_err("could not load firmware, file not found: dvb-ttpci-01.fw\n");
+			pr_err("usually this should be in /usr/lib/hotplug/firmware or /lib/fi=
rmware\n");
+			pr_err("and can be downloaded from https://linuxtv.org/download/dvb/fi=
rmware/\n");
 		} else {
-			printk(KERN_ERR "dvb-ttpci: cannot request firmware (error %i)\n",
-			       ret);
+			pr_err("cannot request firmware (error %i)\n", ret);
 		}
 		return -EINVAL;
 	}

 	if (fw->size <=3D 200000) {
-		printk("dvb-ttpci: this firmware is way too small.\n");
+		pr_err("this firmware is way too small.\n");
 		release_firmware(fw);
 		return -EINVAL;
 	}
@@ -1827,7 +1816,7 @@ static int nexusca_stv0297_tuner_set_params(struct d=
vb_frontend *fe)
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 	if (i2c_transfer(&av7110->i2c_adap, &msg, 1) !=3D 1) {
-		printk("nexusca: pll transfer failed!\n");
+		pr_err("nexusca: pll transfer failed!\n");
 		return -EIO;
 	}

@@ -2234,7 +2223,7 @@ static int frontend_init(struct av7110 *av7110)
 				av7110->fe->tuner_priv =3D &av7110->i2c_adap;

 				if (!dvb_attach(lnbp21_attach, av7110->fe, &av7110->i2c_adap, 0, 0)) =
{
-					printk("dvb-ttpci: LNBP21 not found!\n");
+					pr_err("LNBP21 not found!\n");
 					if (av7110->fe->ops.release)
 						av7110->fe->ops.release(av7110->fe);
 					av7110->fe =3D NULL;
@@ -2250,11 +2239,9 @@ static int frontend_init(struct av7110 *av7110)
 	if (!av7110->fe) {
 		/* FIXME: propagate the failure code from the lower layers */
 		ret =3D -ENOMEM;
-		printk("dvb-ttpci: A frontend driver was not found for device [%04x:%04=
x] subsystem [%04x:%04x]\n",
-		       av7110->dev->pci->vendor,
-		       av7110->dev->pci->device,
-		       av7110->dev->pci->subsystem_vendor,
-		       av7110->dev->pci->subsystem_device);
+		pr_err("A frontend driver was not found for device [%04x:%04x] subsyste=
m [%04x:%04x]\n",
+		       av7110->dev->pci->vendor, av7110->dev->pci->device,
+		       av7110->dev->pci->subsystem_vendor, av7110->dev->pci->subsystem_=
device);
 	} else {
 		FE_FUNC_OVERRIDE(av7110->fe->ops.init, av7110->fe_init, av7110_fe_init)=
;
 		FE_FUNC_OVERRIDE(av7110->fe->ops.read_status, av7110->fe_read_status, a=
v7110_fe_read_status);
@@ -2268,7 +2255,7 @@ static int frontend_init(struct av7110 *av7110)

 		ret =3D dvb_register_frontend(&av7110->dvb_adapter, av7110->fe);
 		if (ret < 0) {
-			printk("av7110: Frontend registration failed!\n");
+			pr_err("av7110: Frontend registration failed!\n");
 			dvb_frontend_detach(av7110->fe);
 			av7110->fe =3D NULL;
 		}
@@ -2427,12 +2414,12 @@ static int av7110_attach(struct saa7146_dev *dev,
 		 */
 		if ((saa7146_read(dev, GPIO_CTRL) & 0x10000000) =3D=3D 0) {
 			budgetpatch =3D 1;
-			printk("dvb-ttpci: BUDGET-PATCH DETECTED.\n");
+			pr_info("BUDGET-PATCH DETECTED.\n");
 		}
 		/* Disable RPS1 */
 		saa7146_write(dev, MC1, (MASK_29));
 #if RPS_IRQ
-		printk("dvb-ttpci: Event Counter 1 0x%04x\n", saa7146_read(dev, EC1R) &=
 0x3fff );
+		pr_info("Event Counter 1 0x%04x\n", saa7146_read(dev, EC1R) & 0x3fff);
 #endif
 	}

@@ -2487,7 +2474,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 	}

 	if (av7110->full_ts) {
-		printk(KERN_INFO "dvb-ttpci: full-ts mode enabled for saa7146 port B\n"=
);
+		pr_info("full-ts mode enabled for saa7146 port B\n");
 		spin_lock_init(&av7110->feedlock1);
 		av7110->grabbing =3D saa7146_vmalloc_build_pgtable(pdev, length,
 								 &av7110->pt);
@@ -2663,9 +2650,8 @@ static int av7110_attach(struct saa7146_dev *dev,
 		goto err_stop_arm_9;

 	if (FW_VERSION(av7110->arm_app) < 0x2501)
-		printk(KERN_WARNING
-		       "dvb-ttpci: Warning, firmware version 0x%04x is too old. System =
might be unstable!\n",
-		       FW_VERSION(av7110->arm_app));
+		pr_warn("Warning, firmware version 0x%04x is too old. System might be u=
nstable!\n",
+			FW_VERSION(av7110->arm_app));

 	thread =3D kthread_run(arm_thread, (void *)av7110, "arm_mon");
 	if (IS_ERR(thread)) {
@@ -2702,7 +2688,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 #if IS_ENABLED(CONFIG_DVB_AV7110_IR)
 	av7110_ir_init(av7110);
 #endif
-	printk(KERN_INFO "dvb-ttpci: found av7110-%d.\n", av7110_num);
+	pr_info("found av7110-%d.\n", av7110_num);
 	av7110_num++;
 out:
 	return ret;
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media=
/av7110/av7110.h
index 3f6b88f0f..403dbbba5 100644
=2D-- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -40,10 +40,14 @@

 extern int av7110_debug;

+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #define dprintk(level, fmt, arg...) do {				\
-	if (level & av7110_debug)					\
-		printk(KERN_DEBUG KBUILD_MODNAME ": %s(): " fmt,	\
-		       __func__, ##arg);				\
+	if ((level) & av7110_debug)					\
+		pr_info("%s(): " fmt, __func__, ##arg);			\
 } while (0)

 #define MAXFILT 32
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index a408e10fb..2993ac43c 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -151,7 +151,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av=
)
 {
 	int ret =3D 0;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (av7110->rec_mode)
 		return -EBUSY;
@@ -186,7 +186,7 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 {
 	int ret =3D 0;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
 		return 0;
@@ -245,14 +245,14 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffe=
r *buf, int dlen)
 		    ((sync & ~0x1f) =3D=3D 0x000001c0) ||
 		    (sync =3D=3D 0x000001bd))
 			break;
-		printk("resync\n");
+		pr_info("resync\n");
 		DVB_RINGBUFFER_SKIP(buf, 1);
 	}
 	blen =3D  DVB_RINGBUFFER_PEEK(buf, 4) << 8;
 	blen |=3D DVB_RINGBUFFER_PEEK(buf, 5);
 	blen +=3D 6;
 	if (len < blen || blen > dlen) {
-		//printk("buffer empty - avail %d blen %u dlen %d\n", len, blen, dlen);
+		//pr_info("buffer empty - avail %d blen %u dlen %d\n", len, blen, dlen)=
;
 		wake_up(&buf->queue);
 		return -1;
 	}
@@ -271,7 +271,7 @@ int av7110_set_volume(struct av7110 *av7110, unsigned =
int volleft,
 	unsigned int vol, val, balance =3D 0;
 	int err;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	av7110->mixer.volume_left =3D volleft;
 	av7110->mixer.volume_right =3D volright;
@@ -323,7 +323,7 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7=
110_video_mode mode)
 {
 	int ret;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);

@@ -357,7 +357,7 @@ static int get_video_format(struct av7110 *av7110, u8 =
*buf, int count)
 	u8 *p;
 	int ret =3D 0;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (av7110->sinfo)
 		return 0;
@@ -410,7 +410,7 @@ static void play_video_cb(u8 *buf, int count, void *pr=
iv)
 {
 	struct av7110 *av7110 =3D (struct av7110 *)priv;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if ((buf[3] & 0xe0) =3D=3D 0xe0) {
 		get_video_format(av7110, buf, count);
@@ -424,7 +424,7 @@ static void play_audio_cb(u8 *buf, int count, void *pr=
iv)
 {
 	struct av7110 *av7110 =3D (struct av7110 *)priv;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	aux_ring_buffer_write(&av7110->aout, buf, count);
 }
@@ -438,7 +438,7 @@ static ssize_t ts_play(struct av7110 *av7110, const ch=
ar __user *buf,
 	u8 *kb;
 	unsigned long todo =3D count;

-	dprintk(2, "%s: type %d cnt %lu\n", __func__, type, count);
+	dprintk(2, "type %d cnt %lu\n", type, count);

 	rb =3D (type) ? &av7110->avout : &av7110->aout;
 	kb =3D av7110->kbuf[type];
@@ -474,7 +474,7 @@ static ssize_t dvb_play(struct av7110 *av7110, const c=
har __user *buf,
 {
 	unsigned long todo =3D count, n;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (!av7110->kbuf[type])
 		return -ENOBUFS;
@@ -508,7 +508,7 @@ static ssize_t dvb_play_kernel(struct av7110 *av7110, =
const u8 *buf,
 {
 	unsigned long todo =3D count, n;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (!av7110->kbuf[type])
 		return -ENOBUFS;
@@ -539,7 +539,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const =
char __user *buf,
 {
 	unsigned long todo =3D count, n;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (!av7110->kbuf[type])
 		return -ENOBUFS;
@@ -841,7 +841,7 @@ int av7110_write_to_decoder(struct dvb_demux_feed *fee=
d, const u8 *buf, size_t l
 	struct dvb_demux *demux =3D feed->demux;
 	struct av7110 *av7110 =3D demux->priv;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (av7110->full_ts && demux->dmx.frontend->source !=3D DMX_MEMORY_FE)
 		return 0;
@@ -928,7 +928,7 @@ static __poll_t dvb_video_poll(struct file *file, poll=
_table *wait)
 	struct av7110 *av7110 =3D dvbdev->priv;
 	__poll_t mask =3D 0;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if ((file->f_flags & O_ACCMODE) !=3D O_RDONLY)
 		poll_wait(file, &av7110->avout.queue, wait);
@@ -958,7 +958,7 @@ static ssize_t dvb_video_write(struct file *file, cons=
t char __user *buf,
 	struct av7110 *av7110 =3D dvbdev->priv;
 	unsigned char c;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if ((file->f_flags & O_ACCMODE) =3D=3D O_RDONLY)
 		return -EPERM;
@@ -980,7 +980,7 @@ static __poll_t dvb_audio_poll(struct file *file, poll=
_table *wait)
 	struct av7110 *av7110 =3D dvbdev->priv;
 	__poll_t mask =3D 0;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	poll_wait(file, &av7110->aout.queue, wait);

@@ -1002,10 +1002,10 @@ static ssize_t dvb_audio_write(struct file *file, =
const char __user *buf,
 	struct av7110 *av7110 =3D dvbdev->priv;
 	unsigned char c;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (av7110->audiostate.stream_source !=3D AUDIO_SOURCE_MEMORY) {
-		printk(KERN_ERR "not audio source memory\n");
+		pr_err("not audio source memory\n");
 		return -EPERM;
 	}

@@ -1027,7 +1027,7 @@ static int play_iframe(struct av7110 *av7110, char _=
_user *buf, unsigned int len
 	int progressive =3D 0;
 	int match =3D 0;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (len =3D=3D 0)
 		return 0;
@@ -1134,7 +1134,7 @@ static int dvb_video_ioctl(struct file *file,
 	unsigned long arg =3D (unsigned long)parg;
 	int ret =3D 0;

-	dprintk(1, "av7110:%p, cmd=3D%04x\n", av7110,cmd);
+	dprintk(1, "av7110:%p, cmd=3D%04x\n", av7110, cmd);

 	if ((file->f_flags & O_ACCMODE) =3D=3D O_RDONLY) {
 		if (cmd !=3D VIDEO_GET_STATUS && cmd !=3D VIDEO_GET_EVENT &&
@@ -1366,7 +1366,7 @@ static int dvb_audio_ioctl(struct file *file,
 	unsigned long arg =3D (unsigned long)parg;
 	int ret =3D 0;

-	dprintk(1, "av7110:%p, cmd=3D%04x\n", av7110,cmd);
+	dprintk(1, "av7110:%p, cmd=3D%04x\n", av7110, cmd);

 	if (((file->f_flags & O_ACCMODE) =3D=3D O_RDONLY) &&
 	    (cmd !=3D AUDIO_GET_STATUS))
@@ -1514,7 +1514,7 @@ static int dvb_video_open(struct inode *inode, struc=
t file *file)
 	struct av7110 *av7110 =3D dvbdev->priv;
 	int err;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	err =3D dvb_generic_open(inode, file);
 	if (err < 0)
@@ -1540,7 +1540,7 @@ static int dvb_video_release(struct inode *inode, st=
ruct file *file)
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct av7110 *av7110 =3D dvbdev->priv;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if ((file->f_flags & O_ACCMODE) !=3D O_RDONLY)
 		av7110_av_stop(av7110, RP_VIDEO);
@@ -1554,7 +1554,7 @@ static int dvb_audio_open(struct inode *inode, struc=
t file *file)
 	struct av7110 *av7110 =3D dvbdev->priv;
 	int err =3D dvb_generic_open(inode, file);

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	if (err < 0)
 		return err;
@@ -1568,7 +1568,7 @@ static int dvb_audio_release(struct inode *inode, st=
ruct file *file)
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct av7110 *av7110 =3D dvbdev->priv;

-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p\n", av7110);

 	av7110_av_stop(av7110, RP_AUDIO);
 	return dvb_generic_release(inode, file);
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/me=
dia/av7110/av7110_ca.c
index c28e41d42..6ce212c64 100644
=2D-- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -26,7 +26,7 @@

 void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 {
-	dprintk(8, "av7110:%p\n",av7110);
+	dprintk(8, "av7110:%p\n", av7110);

 	if (len < 3)
 		return;
@@ -199,7 +199,7 @@ static int dvb_ca_open(struct inode *inode, struct fil=
e *file)
 	struct av7110 *av7110 =3D dvbdev->priv;
 	int err =3D dvb_generic_open(inode, file);

-	dprintk(8, "av7110:%p\n",av7110);
+	dprintk(8, "av7110:%p\n", av7110);

 	if (err < 0)
 		return err;
@@ -215,7 +215,7 @@ static __poll_t dvb_ca_poll(struct file *file, poll_ta=
ble *wait)
 	struct dvb_ringbuffer *wbuf =3D &av7110->ci_wbuffer;
 	__poll_t mask =3D 0;

-	dprintk(8, "av7110:%p\n",av7110);
+	dprintk(8, "av7110:%p\n", av7110);

 	poll_wait(file, &rbuf->queue, wait);
 	poll_wait(file, &wbuf->queue, wait);
@@ -236,7 +236,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned in=
t cmd, void *parg)
 	unsigned long arg =3D (unsigned long)parg;
 	int ret =3D 0;

-	dprintk(8, "av7110:%p\n",av7110);
+	dprintk(8, "av7110:%p\n", av7110);

 	if (mutex_lock_interruptible(&av7110->ioctl_mutex))
 		return -ERESTARTSYS;
@@ -322,7 +322,7 @@ static ssize_t dvb_ca_write(struct file *file, const c=
har __user *buf,
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct av7110 *av7110 =3D dvbdev->priv;

-	dprintk(8, "av7110:%p\n",av7110);
+	dprintk(8, "av7110:%p\n", av7110);
 	return ci_ll_write(&av7110->ci_wbuffer, file, buf, count, ppos);
 }

@@ -332,7 +332,7 @@ static ssize_t dvb_ca_read(struct file *file, char __u=
ser *buf,
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct av7110 *av7110 =3D dvbdev->priv;

-	dprintk(8, "av7110:%p\n",av7110);
+	dprintk(8, "av7110:%p\n", av7110);
 	return ci_ll_read(&av7110->ci_rbuffer, file, buf, count, ppos);
 }

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index 5a4de3e3e..bf8e6dca4 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -48,11 +48,11 @@ int av7110_debiwrite(struct av7110 *av7110, u32 config=
,
 	struct saa7146_dev *dev =3D av7110->dev;

 	if (count > 32764) {
-		printk("%s: invalid count %d\n", __func__, count);
+		pr_err("%s(): invalid count %d\n", __func__, count);
 		return -1;
 	}
 	if (saa7146_wait_for_debi_done(av7110->dev, 0) < 0) {
-		printk("%s: wait_for_debi_done failed\n", __func__);
+		pr_err("%s(): wait_for_debi_done failed\n", __func__);
 		return -1;
 	}
 	saa7146_write(dev, DEBI_CONFIG, config);
@@ -71,11 +71,11 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config,=
 int addr, unsigned int co
 	u32 result =3D 0;

 	if (count > 32764) {
-		printk("%s: invalid count %d\n", __func__, count);
+		pr_err("%s(): invalid count %d\n", __func__, count);
 		return 0;
 	}
 	if (saa7146_wait_for_debi_done(av7110->dev, 0) < 0) {
-		printk("%s: wait_for_debi_done #1 failed\n", __func__);
+		pr_err("%s(): wait_for_debi_done #1 failed\n", __func__);
 		return 0;
 	}
 	saa7146_write(dev, DEBI_AD, av7110->debi_bus);
@@ -86,7 +86,7 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config, i=
nt addr, unsigned int co
 	if (count > 4)
 		return count;
 	if (saa7146_wait_for_debi_done(av7110->dev, 0) < 0) {
-		printk("%s: wait_for_debi_done #2 failed\n", __func__);
+		pr_err("%s(): wait_for_debi_done #2 failed\n", __func__);
 		return 0;
 	}

@@ -146,7 +146,7 @@ static int load_dram(struct av7110 *av7110, u32 *data,=
 int len)

 	for (i =3D 0; i < blocks; i++) {
 		if (waitdebi(av7110, AV7110_BOOT_STATE, BOOTSTATE_BUFFER_EMPTY) < 0) {
-			printk(KERN_ERR "dvb-ttpci: load_dram(): timeout at block %d\n", i);
+			pr_err("%s(): timeout at block %d\n", __func__, i);
 			return -ETIMEDOUT;
 		}
 		dprintk(4, "writing DRAM block %d\n", i);
@@ -161,7 +161,7 @@ static int load_dram(struct av7110 *av7110, u32 *data,=
 int len)

 	if (rest > 0) {
 		if (waitdebi(av7110, AV7110_BOOT_STATE, BOOTSTATE_BUFFER_EMPTY) < 0) {
-			printk(KERN_ERR "dvb-ttpci: load_dram(): timeout at last block\n");
+			pr_err("%s(): timeout at last block\n", __func__);
 			return -ETIMEDOUT;
 		}
 		if (rest > 4)
@@ -176,13 +176,13 @@ static int load_dram(struct av7110 *av7110, u32 *dat=
a, int len)
 		iwdebi(av7110, DEBINOSWAP, AV7110_BOOT_STATE, BOOTSTATE_BUFFER_FULL, 2)=
;
 	}
 	if (waitdebi(av7110, AV7110_BOOT_STATE, BOOTSTATE_BUFFER_EMPTY) < 0) {
-		printk(KERN_ERR "dvb-ttpci: load_dram(): timeout after last block\n");
+		pr_err("%s(): timeout after last block\n", __func__);
 		return -ETIMEDOUT;
 	}
 	iwdebi(av7110, DEBINOSWAP, AV7110_BOOT_SIZE, 0, 2);
 	iwdebi(av7110, DEBINOSWAP, AV7110_BOOT_STATE, BOOTSTATE_BUFFER_FULL, 2);
 	if (waitdebi(av7110, AV7110_BOOT_STATE, BOOTSTATE_AV7110_BOOT_COMPLETE) =
< 0) {
-		printk(KERN_ERR "dvb-ttpci: load_dram(): final handshake timeout\n");
+		pr_err("%s(): final handshake timeout\n", __func__);
 		return -ETIMEDOUT;
 	}
 	return 0;
@@ -221,8 +221,8 @@ int av7110_bootarm(struct av7110 *av7110)

 	ret =3D irdebi(av7110, DEBINOSWAP, DPRAM_BASE, 0, 4);
 	if (ret !=3D 0x10325476) {
-		printk(KERN_ERR "dvb-ttpci: debi test in av7110_bootarm() failed: %08x =
!=3D %08x (check your BIOS 'Plug&Play OS' settings)\n",
-		       ret, 0x10325476);
+		pr_err("debi test in %s() failed: %08x !=3D %08x (check your BIOS 'Plug=
&Play OS' settings)\n",
+		       __func__, ret, 0x10325476);
 		return -1;
 	}
 	for (i =3D 0; i < 8192; i +=3D 4)
@@ -237,8 +237,7 @@ int av7110_bootarm(struct av7110 *av7110)

 	ret =3D request_firmware(&fw, fw_name, &dev->pci->dev);
 	if (ret) {
-		printk(KERN_ERR "dvb-ttpci: Failed to load firmware \"%s\"\n",
-			fw_name);
+		pr_err("Failed to load firmware \"%s\"\n", fw_name);
 		return ret;
 	}

@@ -247,7 +246,7 @@ int av7110_bootarm(struct av7110 *av7110)
 	iwdebi(av7110, DEBINOSWAP, AV7110_BOOT_STATE, BOOTSTATE_BUFFER_FULL, 2);

 	if (saa7146_wait_for_debi_done(av7110->dev, 1)) {
-		printk(KERN_ERR "dvb-ttpci: av7110_bootarm(): saa7146_wait_for_debi_don=
e() timed out\n");
+		pr_err("%s(): saa7146_wait_for_debi_done() timed out\n", __func__);
 		return -ETIMEDOUT;
 	}
 	saa7146_setgpio(dev, RESET_LINE, SAA7146_GPIO_OUTHI);
@@ -255,7 +254,7 @@ int av7110_bootarm(struct av7110 *av7110)

 	dprintk(1, "load dram code\n");
 	if (load_dram(av7110, (u32 *)av7110->bin_root, av7110->size_root) < 0) {
-		printk(KERN_ERR "dvb-ttpci: av7110_bootarm(): load_dram() failed\n");
+		pr_err("%s(): load_dram() failed\n", __func__);
 		return -1;
 	}

@@ -266,7 +265,7 @@ int av7110_bootarm(struct av7110 *av7110)
 	mwdebi(av7110, DEBISWAB, DPRAM_BASE, av7110->bin_dpram, av7110->size_dpr=
am);

 	if (saa7146_wait_for_debi_done(av7110->dev, 1)) {
-		printk(KERN_ERR "dvb-ttpci: av7110_bootarm(): saa7146_wait_for_debi_don=
e() timed out after loading DRAM\n");
+		pr_err("%s(): saa7146_wait_for_debi_done() timed out after loading DRAM=
\n", __func__);
 		return -ETIMEDOUT;
 	}
 	saa7146_setgpio(dev, RESET_LINE, SAA7146_GPIO_OUTHI);
@@ -310,8 +309,7 @@ int av7110_wait_msgstate(struct av7110 *av7110, u16 fl=
ags)
 		if ((stat & flags) =3D=3D 0)
 			break;
 		if (err) {
-			printk(KERN_ERR "%s: timeout waiting for MSGSTATE %04x\n",
-				__func__, stat & flags);
+			pr_err("%s(): timeout waiting for MSGSTATE %04x\n", __func__, stat & f=
lags);
 			return -ETIMEDOUT;
 		}
 		msleep(1);
@@ -341,7 +339,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110,=
 u16 *buf, int length)
 		if (rdebi(av7110, DEBINOSWAP, COMMAND, 0, 2) =3D=3D 0)
 			break;
 		if (err) {
-			printk(KERN_ERR "dvb-ttpci: %s(): timeout waiting for COMMAND idle\n",=
 __func__);
+			pr_err("%s(): timeout waiting for COMMAND idle\n", __func__);
 			av7110->arm_errors++;
 			return -ETIMEDOUT;
 		}
@@ -358,7 +356,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110,=
 u16 *buf, int length)
 		if (rdebi(av7110, DEBINOSWAP, HANDSHAKE_REG, 0, 2) =3D=3D 0)
 			break;
 		if (err) {
-			printk(KERN_ERR "dvb-ttpci: %s(): timeout waiting for HANDSHAKE_REG\n"=
, __func__);
+			pr_err("%s(): timeout waiting for HANDSHAKE_REG\n", __func__);
 			return -ETIMEDOUT;
 		}
 		msleep(1);
@@ -397,15 +395,13 @@ static int __av7110_send_fw_cmd(struct av7110 *av711=
0, u16 *buf, int length)
 			err =3D time_after(jiffies, start + ARM_WAIT_FREE);
 			stat =3D rdebi(av7110, DEBINOSWAP, MSGSTATE, 0, 2);
 			if (stat & flags[0]) {
-				printk(KERN_ERR "%s: %s QUEUE overflow\n",
-					__func__, type);
+				pr_err("%s(): %s QUEUE overflow\n", __func__, type);
 				return -1;
 			}
 			if ((stat & flags[1]) =3D=3D 0)
 				break;
 			if (err) {
-				printk(KERN_ERR "%s: timeout waiting on busy %s QUEUE\n",
-					__func__, type);
+				pr_err("%s(): timeout waiting on busy %s QUEUE\n", __func__, type);
 				av7110->arm_errors++;
 				return -ETIMEDOUT;
 			}
@@ -433,7 +429,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110,=
 u16 *buf, int length)
 		if (rdebi(av7110, DEBINOSWAP, COMMAND, 0, 2) =3D=3D 0)
 			break;
 		if (err) {
-			printk(KERN_ERR "dvb-ttpci: %s(): timeout waiting for COMMAND %d to co=
mplete\n",
+			pr_err("%s(): timeout waiting for COMMAND %d to complete\n",
 			       __func__, (buf[0] >> 8) & 0xff);
 			return -ETIMEDOUT;
 		}
@@ -442,10 +438,10 @@ static int __av7110_send_fw_cmd(struct av7110 *av711=
0, u16 *buf, int length)

 	stat =3D rdebi(av7110, DEBINOSWAP, MSGSTATE, 0, 2);
 	if (stat & GPMQOver) {
-		printk(KERN_ERR "dvb-ttpci: %s(): GPMQOver\n", __func__);
+		pr_err("%s(): GPMQOver\n", __func__);
 		return -ENOSPC;
 	} else if (stat & OSDQOver) {
-		printk(KERN_ERR "dvb-ttpci: %s(): OSDQOver\n", __func__);
+		pr_err("%s(): OSDQOver\n", __func__);
 		return -ENOSPC;
 	}
 #endif
@@ -469,8 +465,7 @@ static int av7110_send_fw_cmd(struct av7110 *av7110, u=
16 *buf, int length)
 	ret =3D __av7110_send_fw_cmd(av7110, buf, length);
 	mutex_unlock(&av7110->dcomlock);
 	if (ret && ret !=3D -ERESTARTSYS)
-		printk(KERN_ERR "dvb-ttpci: %s(): av7110_send_fw_cmd error %d\n",
-		       __func__, ret);
+		pr_err("%s(): error %d\n", __func__, ret);
 	return ret;
 }

@@ -483,9 +478,7 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int=
 com, int num, ...)
 //	dprintk(4, "%p\n", av7110);

 	if (2 + num > ARRAY_SIZE(buf)) {
-		printk(KERN_WARNING
-		       "%s: %s len=3D%d is too big!\n",
-		       KBUILD_MODNAME, __func__, num);
+		pr_warn("%s(): len=3D%d is too big!\n", __func__, num);
 		return -EINVAL;
 	}

@@ -501,7 +494,7 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int=
 com, int num, ...)

 	ret =3D av7110_send_fw_cmd(av7110, buf, num + 2);
 	if (ret && ret !=3D -ERESTARTSYS)
-		printk(KERN_ERR "dvb-ttpci: av7110_fw_cmd error %d\n", ret);
+		pr_err("%s(): error %d\n", __func__, ret);
 	return ret;
 }

@@ -523,7 +516,7 @@ int av7110_send_ci_cmd(struct av7110 *av7110, u8 subco=
m, u8 *buf, u8 len)

 	ret =3D av7110_send_fw_cmd(av7110, cmd, 18);
 	if (ret && ret !=3D -ERESTARTSYS)
-		printk(KERN_ERR "dvb-ttpci: av7110_send_ci_cmd error %d\n", ret);
+		pr_err("%s(): error %d\n", __func__, ret);
 	return ret;
 }
 #endif  /*  0  */
@@ -551,7 +544,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *requ=
est_buf,
 	err =3D __av7110_send_fw_cmd(av7110, request_buf, request_buf_len);
 	if (err < 0) {
 		mutex_unlock(&av7110->dcomlock);
-		printk(KERN_ERR "dvb-ttpci: av7110_fw_request error %d\n", err);
+		pr_err("%s(): error %d\n", __func__, err);
 		return err;
 	}

@@ -561,7 +554,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *requ=
est_buf,
 		if (rdebi(av7110, DEBINOSWAP, COMMAND, 0, 2) =3D=3D 0)
 			break;
 		if (err) {
-			printk(KERN_ERR "%s: timeout waiting for COMMAND to complete\n", __fun=
c__);
+			pr_err("%s(): timeout waiting for COMMAND to complete\n", __func__);
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
@@ -577,7 +570,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *requ=
est_buf,
 		if (rdebi(av7110, DEBINOSWAP, HANDSHAKE_REG, 0, 2) =3D=3D 0)
 			break;
 		if (err) {
-			printk(KERN_ERR "%s: timeout waiting for HANDSHAKE_REG\n", __func__);
+			pr_err("%s(): timeout waiting for HANDSHAKE_REG\n", __func__);
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
@@ -588,11 +581,11 @@ int av7110_fw_request(struct av7110 *av7110, u16 *re=
quest_buf,
 #ifdef COM_DEBUG
 	stat =3D rdebi(av7110, DEBINOSWAP, MSGSTATE, 0, 2);
 	if (stat & GPMQOver) {
-		printk(KERN_ERR "%s: GPMQOver\n", __func__);
+		pr_err("%s(): GPMQOver\n", __func__);
 		mutex_unlock(&av7110->dcomlock);
 		return -1;
 	} else if (stat & OSDQOver) {
-		printk(KERN_ERR "%s: OSDQOver\n", __func__);
+		pr_err("%s(): OSDQOver\n", __func__);
 		mutex_unlock(&av7110->dcomlock);
 		return -1;
 	}
@@ -611,7 +604,7 @@ static int av7110_fw_query(struct av7110 *av7110, u16 =
tag, u16 *buf, s16 length)

 	ret =3D av7110_fw_request(av7110, &tag, 0, buf, length);
 	if (ret)
-		printk(KERN_ERR "dvb-ttpci: av7110_fw_query error %d\n", ret);
+		pr_err("%s(): error %d\n", __func__, ret);
 	return ret;
 }

@@ -628,8 +621,7 @@ int av7110_firmversion(struct av7110 *av7110)
 	dprintk(4, "%p\n", av7110);

 	if (av7110_fw_query(av7110, tag, buf, 16)) {
-		printk("dvb-ttpci: failed to boot firmware @ card %d\n",
-		       av7110->dvb_adapter.num);
+		pr_err("failed to boot firmware @ card %d\n", av7110->dvb_adapter.num);
 		return -EIO;
 	}

@@ -639,17 +631,17 @@ int av7110_firmversion(struct av7110 *av7110)
 	av7110->arm_app =3D (buf[6] << 16) + buf[7];
 	av7110->avtype =3D (buf[8] << 16) + buf[9];

-	printk("dvb-ttpci: info @ card %d: firm %08x, rtsl %08x, vid %08x, app %=
08x\n",
-	       av7110->dvb_adapter.num, av7110->arm_fw,
-	       av7110->arm_rtsl, av7110->arm_vid, av7110->arm_app);
+	pr_info("info @ card %d: firm %08x, rtsl %08x, vid %08x, app %08x\n",
+		av7110->dvb_adapter.num, av7110->arm_fw,
+		av7110->arm_rtsl, av7110->arm_vid, av7110->arm_app);

 	/* print firmware capabilities */
 	if (FW_CI_LL_SUPPORT(av7110->arm_app))
-		printk("dvb-ttpci: firmware @ card %d supports CI link layer interface\=
n",
-		       av7110->dvb_adapter.num);
+		pr_info("firmware @ card %d supports CI link layer interface\n",
+			av7110->dvb_adapter.num);
 	else
-		printk("dvb-ttpci: no firmware support for CI link layer interface @ ca=
rd %d\n",
-		       av7110->dvb_adapter.num);
+		pr_info("no firmware support for CI link layer interface @ card %d\n",
+			av7110->dvb_adapter.num);

 	return 0;
 }
@@ -678,7 +670,7 @@ int av7110_diseqc_send(struct av7110 *av7110, int len,=
 u8 *msg, unsigned long bu

 	ret =3D av7110_send_fw_cmd(av7110, buf, 18);
 	if (ret && ret !=3D -ERESTARTSYS)
-		printk(KERN_ERR "dvb-ttpci: av7110_diseqc_send error %d\n", ret);
+		pr_err("%s(): error %d\n", __func__, ret);
 	return ret;
 }

@@ -723,8 +715,7 @@ static int FlushText(struct av7110 *av7110)
 		if (rdebi(av7110, DEBINOSWAP, BUFF1_BASE, 0, 2) =3D=3D 0)
 			break;
 		if (err) {
-			printk(KERN_ERR "dvb-ttpci: %s(): timeout waiting for BUFF1_BASE =3D=
=3D 0\n",
-			       __func__);
+			pr_err("%s(): timeout waiting for BUFF1_BASE =3D=3D 0\n", __func__);
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
@@ -750,8 +741,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u1=
6 x, u16 y, char *buf)
 		if (rdebi(av7110, DEBINOSWAP, BUFF1_BASE, 0, 2) =3D=3D 0)
 			break;
 		if (ret) {
-			printk(KERN_ERR "dvb-ttpci: %s: timeout waiting for BUFF1_BASE =3D=3D =
0\n",
-			       __func__);
+			pr_err("%s(): timeout waiting for BUFF1_BASE =3D=3D 0\n", __func__);
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
@@ -764,8 +754,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u1=
6 x, u16 y, char *buf)
 		if (rdebi(av7110, DEBINOSWAP, HANDSHAKE_REG, 0, 2) =3D=3D 0)
 			break;
 		if (ret) {
-			printk(KERN_ERR "dvb-ttpci: %s: timeout waiting for HANDSHAKE_REG\n",
-			       __func__);
+			pr_err("%s(): timeout waiting for HANDSHAKE_REG\n", __func__);
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
@@ -780,7 +769,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u1=
6 x, u16 y, char *buf)
 	ret =3D __av7110_send_fw_cmd(av7110, cbuf, 5);
 	mutex_unlock(&av7110->dcomlock);
 	if (ret && ret !=3D -ERESTARTSYS)
-		printk(KERN_ERR "dvb-ttpci: WriteText error %d\n", ret);
+		pr_err("%s(): error %d\n", __func__, ret);
 	return ret;
 }

@@ -839,8 +828,7 @@ static inline int WaitUntilBmpLoaded(struct av7110 *av=
7110)
 	int ret =3D wait_event_timeout(av7110->bmpq,
 				av7110->bmp_state !=3D BMP_LOADING, 10 * HZ);
 	if (ret =3D=3D 0) {
-		printk("dvb-ttpci: warning: timeout waiting in LoadBitmap: %d, %d\n",
-		       ret, av7110->bmp_state);
+		pr_warn("warning: timeout waiting in LoadBitmap: %d, %d\n", ret, av7110=
->bmp_state);
 		av7110->bmp_state =3D BMP_NONE;
 		return -ETIMEDOUT;
 	}
@@ -897,7 +885,7 @@ static inline int LoadBitmap(struct av7110 *av7110,
 		}
 	}
 	av7110->bmplen +=3D 1024;
-	dprintk(4, "av7110_fw_cmd: LoadBmp size %d\n", av7110->bmplen);
+	dprintk(4, "av7110_fw_cmd(): LoadBmp size %d\n", av7110->bmplen);
 	ret =3D av7110_fw_cmd(av7110, COMTYPE_OSD, LoadBmp, 3, format, dx, dy);
 	if (!ret)
 		ret =3D WaitUntilBmpLoaded(av7110);
@@ -918,7 +906,7 @@ static inline int ReleaseBitmap(struct av7110 *av7110)
 	if (av7110->bmp_state !=3D BMP_LOADED && FW_VERSION(av7110->arm_app) < 0=
x261e)
 		return -1;
 	if (av7110->bmp_state =3D=3D BMP_LOADING)
-		dprintk(1,"ReleaseBitmap called while BMP_LOADING\n");
+		dprintk(1, "%s called while BMP_LOADING\n", __func__);
 	av7110->bmp_state =3D BMP_NONE;
 	return av7110_fw_cmd(av7110, COMTYPE_OSD, ReleaseBmp, 0);
 }
@@ -1033,7 +1021,7 @@ static int OSDSetBlock(struct av7110 *av7110, int x0=
, int y0,
 	if (!rc)
 		rc =3D release_rc;
 	if (rc)
-		dprintk(1,"returns %d\n",rc);
+		dprintk(1, "returns %d\n", rc);
 	return rc;
 }

@@ -1180,9 +1168,9 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)

 	mutex_unlock(&av7110->osd_mutex);
 	if (ret =3D=3D -ERESTARTSYS)
-		dprintk(1, "av7110_osd_cmd(%d) returns with -ERESTARTSYS\n",dc->cmd);
+		dprintk(1, "%s(%d) returns with -ERESTARTSYS\n", __func__, dc->cmd);
 	else if (ret)
-		dprintk(1, "av7110_osd_cmd(%d) returns with %d\n",dc->cmd,ret);
+		dprintk(1, "%s(%d) returns with %d\n", __func__, dc->cmd, ret);

 	return ret;
 }
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/me=
dia/av7110/av7110_ir.c
index a851ba328..68b3979ba 100644
=2D-- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -59,8 +59,7 @@ void av7110_ir_handler(struct av7110 *av7110, u32 ircom)
 			proto =3D RC_PROTO_RC5;
 			break;
 		default:
-			dprintk(2, "unknown ir config %d\n",
-				av7110->ir.ir_config);
+			dprintk(2, "unknown ir config %d\n", av7110->ir.ir_config);
 			return;
 		}

diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index d13f1afec..04e659243 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -42,8 +42,7 @@ int msp_writereg(struct av7110 *av7110, u8 dev, u16 reg,=
 u16 val)
 	}

 	if (i2c_transfer(&av7110->i2c_adap, &msgs, 1) !=3D 1) {
-		dprintk(1, "dvb-ttpci: failed @ card %d, %u =3D %u\n",
-		       av7110->dvb_adapter.num, reg, val);
+		dprintk(1, "failed @ card %d, %u =3D %u\n", av7110->dvb_adapter.num, re=
g, val);
 		return -EIO;
 	}
 	return 0;
@@ -72,8 +71,7 @@ static int msp_readreg(struct av7110 *av7110, u8 dev, u1=
6 reg, u16 *val)
 	}

 	if (i2c_transfer(&av7110->i2c_adap, &msgs[0], 2) !=3D 2) {
-		dprintk(1, "dvb-ttpci: failed @ card %d, %u\n",
-		       av7110->dvb_adapter.num, reg);
+		dprintk(1, "failed @ card %d, %u\n", av7110->dvb_adapter.num, reg);
 		return -EIO;
 	}
 	*val =3D (msg2[0] << 8) | msg2[1];
@@ -617,7 +615,7 @@ static ssize_t av7110_vbi_write(struct file *file, con=
st char __user *data, size
 	struct v4l2_sliced_vbi_data d;
 	int rc;

-	dprintk(2, "%s\n", __func__);
+	dprintk(2, "\n");
 	if (FW_VERSION(av7110->arm_app) < 0x2623 || !av7110->wssMode || count !=
=3D sizeof(d))
 		return -EINVAL;
 	if (copy_from_user(&d, data, count))
@@ -718,7 +716,7 @@ int av7110_init_analog_module(struct av7110 *av7110)
 	msleep(100); // the probing above resets the msp...
 	msp_readreg(av7110, MSP_RD_DSP, 0x001e, &version1);
 	msp_readreg(av7110, MSP_RD_DSP, 0x001f, &version2);
-	dprintk(1, "dvb-ttpci: @ card %d MSP34xx version 0x%04x 0x%04x\n",
+	dprintk(1, "@ card %d MSP34xx version 0x%04x 0x%04x\n",
 		av7110->dvb_adapter.num, version1, version2);
 	msp_writereg(av7110, MSP_WR_DSP, 0x0013, 0x0c00);
 	msp_writereg(av7110, MSP_WR_DSP, 0x0000, 0x7f00); // loudspeaker + headp=
hone
diff --git a/drivers/staging/media/av7110/dvb_filter.c b/drivers/staging/m=
edia/av7110/dvb_filter.c
index 71c1d9629..9eafbb82b 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.c
+++ b/drivers/staging/media/av7110/dvb_filter.c
@@ -39,8 +39,6 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct d=
vb_audio_info *ai, int p

 	if (!found)
 		return -1;
-	if (pr)
-		printk(KERN_DEBUG "Audiostream: AC3");

 	ai->off =3D c;
 	if (c + 5 >=3D count)
@@ -52,21 +50,18 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct=
 dvb_audio_info *ai, int p
 	frame =3D (headr[2] & 0x3f);
 	ai->bit_rate =3D ac3_bitrates[frame >> 1] * 1000;

-	if (pr)
-		printk(KERN_CONT "  BRate: %d kb/s", (int) ai->bit_rate/1000);
-
 	ai->frequency =3D (headr[2] & 0xc0) >> 6;
 	fr =3D (headr[2] & 0xc0) >> 6;
 	ai->frequency =3D freq[fr] * 100;
-	if (pr)
-		printk(KERN_CONT "  Freq: %d Hz\n", (int) ai->frequency);

 	ai->framesize =3D ac3_frames[fr][frame >> 1];
 	if ((frame & 1) && (fr =3D=3D 1))
 		ai->framesize++;
 	ai->framesize =3D ai->framesize << 1;
+
 	if (pr)
-		printk(KERN_DEBUG "  Framesize %d\n", (int) ai->framesize);
+		pr_info("Audiostream: AC3, BRate: %d kb/s, Freq: %d Hz, Framesize %d\n"=
,
+			(int)ai->bit_rate / 1000, (int)ai->frequency, (int)ai->framesize);

 	return 0;
 }
=2D-
2.34.0


