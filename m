Return-Path: <linux-media+bounces-10943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E69B48BD894
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B45FCB20D98
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51AE8489;
	Tue,  7 May 2024 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="WqD9Rdzi"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92FD8BF9
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041534; cv=none; b=rlFEh7G6xcw7+NR+LwywksHBDdWM3yGKa3muZGX58weWitZiZ8rSd1jKgB3xAkMy1AxwMmQXyTzVuUH1XNljHK3rwE3kqGaSpbJ0fG/txZXf1iGS2DWjgYZXqJ07rfA37cf/X3S3GC5bsY3SPSGF9hIY8JlSiaBT5+SxBOSAvfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041534; c=relaxed/simple;
	bh=oYd7/xKkj5/NJBGe5dv4q6raW9hKtWNAfH1kYEl3HDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rbimAPE/i1s7pg7OiMdkLvHMKgWvMGkY/CzLyP1ldTkyP4uYw4sdr3GkfTHDBqONR25HK1YwLynkDBfMMk7CRA83EYtCF7K+fYJb7iDQK+QQUPHlA51d5vTckpFpmBZPHAyRZm+HeoQ9zK8Dg3DNlt/sr09xEAxfK2A2FIU/hWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=WqD9Rdzi; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041528; x=1715646328; i=herdler@nurfuerspam.de;
	bh=ibJsf4/JZYC6N5lngSg4ZienRaShK6MMgvw7S3wSqWU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WqD9RdzipKdQbRiCSW8zmIc+hr8bs6wsQHPZ2dH7Td1MzDmpFUnpn02Lt8o4w2yw
	 TkEGKG7r07BcZze8Txex5R7fmn0h51dT65wZ/lSBWX78C5rEso0iKYdnZnIilwjWR
	 MT/eon+MfCmw1lfti8d5LZBOSLwYA75TYyGPIvOlXHDin6qICiZWXEgZCMdFAt7uK
	 +67E1j98pFDz3X+fN8sYHyze4nBDRwBlI5rpo/1S99nEMZQ7ZZYjCLuTFws/dSos9
	 hsr8V78e9PL4P5ICtKsvzVxcM8hMnVRizKxXH9KEnH7JRjdd9HmiW5Yaa42MUGgc0
	 v0RAMeRfGCqsoxKLdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIMfc-1rrz1I2yge-00ELb9; Tue, 07
 May 2024 02:25:28 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 14/21] media: av7110: coding style fixes: assignments
Date: Tue,  7 May 2024 02:24:53 +0200
Message-Id: <20240507002500.81867-15-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:8jg9ASVQc6wiVdUiIhC5esytv3nlJtAMoIeE+mlc/9m2VS46YaA
 awrPLsYYCZOjOqhuJttF9pGT5DqTHLVu3u7a/Z1+PnAQjdZBFtrVabeEWYvazlDtEXM2YVq
 UWK88v8YsT9uvx4pe6+8c7DDguV69JWb5kWhQlapoqL5Wkhk7THPv0IG00iWxpwYQJAW+2/
 9QkwdXp3XD4iFF8N80ZXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hjRQJsiLzOU=;hIq7eG1aujNwlhwtdBNIjI7rbOb
 7KlDHMuuPSTaqBsW7KThToT1UCQr/1jInoe7GDpo09h7Es9OvlbY7QqsyxXhpOtwsGDLJfIbb
 dcxz4yx/1hIYcrqasQtB5EvV9JJLk8PW8Wi6I9YnL+S+lKQFTLpj/4rXRWwT55vFDU6p0LImz
 S85ln9W4Ia4Xo/2Up6tyyjoImi9KlDBsWMsdoDNsx5r8GmdZB1axJDcatYblPcm6rEwbQl8sE
 SCy/Ich6jviZXkrdQS4ajabboqMxBPITt/zwE8P1kXCmrCdk6o8YANGrxebT1yQC57GcYRb3B
 4qwYEDh/Twct3R6nWHlYgt2oPDZD6pa61ESmNcKCKR1uJigTFzn0NN4P3VCZWun4kaMS9SrxC
 KCu1LbgfjwrJXnMLd2gj7sDFyXKmHaBs2dAfd+mn/5NUvegyJ8FjKKu6IF9hZjXYoGcvU1gIg
 bp+3i9G803xHy1+u4S/zwRtw8GYgdT+5ARsXyhqUz7QCb5n0Oo/Q42sbTLeXbUz6LnkYZ4cI3
 aTRCF0R4sNpndV7D76ZjnMcyx1bykbu9Vn+ByVIT26232zcXbyybzVqUIQj6LMSruPMXLz0Dg
 KPmwBSRE9TUTRjc3fJicbxoKXvPDYfQ8zkxUvfbBydiT+AdHWMo+oY8B5QK+sp32a3Te6uKHp
 ozSKMR8Mxz7HIIrmBgW4EmQL88t/sVoCmLE/c/HXeaelEYvHVcObx0fCGdOL9TXbpGAlBBih3
 I8nB/8aGn29w4DxygXfpN+f88Zeh0O6q4eU6GOT5pViLGtKCZnY6qARzpLFWRK14/7luIL0Ls
 px0VP4/AUC0peBHu7LPdXhxS7gpKLfpKIZGIU1QkCgqC4=

This patch fixes the following checkpatch errors:

ERROR:ASSIGN_IN_IF: do not use assignment in if condition
CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c       | 30 ++++++++++++++++-----
 drivers/staging/media/av7110/av7110_av.c    | 18 ++++++++-----
 drivers/staging/media/av7110/av7110_hw.c    |  6 +++--
 drivers/staging/media/av7110/av7110_ipack.c |  3 ++-
 drivers/staging/media/av7110/dvb_filter.c   |  3 ++-
 5 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index 78d708ffc..fac774dc6 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -709,7 +709,11 @@ static inline int SetPIDs(struct av7110 *av7110, u16 =
vpid, u16 apid, u16 ttpid,

 	if (vpid =3D=3D 0x1fff || apid =3D=3D 0x1fff ||
 	    ttpid =3D=3D 0x1fff || subpid =3D=3D 0x1fff || pcrpid =3D=3D 0x1fff)=
 {
-		vpid =3D apid =3D ttpid =3D subpid =3D pcrpid =3D 0;
+		vpid =3D 0;
+		apid =3D 0;
+		ttpid =3D 0;
+		subpid =3D 0;
+		pcrpid =3D 0;
 		av7110->pids[DMX_PES_VIDEO] =3D 0;
 		av7110->pids[DMX_PES_AUDIO] =3D 0;
 		av7110->pids[DMX_PES_TELETEXT] =3D 0;
@@ -855,7 +859,11 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *=
dvbdmxfeed)

 	dprintk(4, "%p\n", av7110);

-	npids[0] =3D npids[1] =3D npids[2] =3D npids[3] =3D npids[4] =3D 0xffff;
+	npids[0] =3D 0xffff;
+	npids[1] =3D 0xffff;
+	npids[2] =3D 0xffff;
+	npids[3] =3D 0xffff;
+	npids[4] =3D 0xffff;
 	i =3D dvbdmxfeed->pes_type;
 	npids[i] =3D (pid[i] & 0x8000) ? 0 : pid[i];
 	if ((i =3D=3D 2) && npids[i] && (dvbdmxfeed->ts_type & TS_PACKET)) {
@@ -907,7 +915,11 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *d=
vbdmxfeed)
 		if (!av7110->playing)
 			dvbdmx->playing =3D 0;
 	}
-	npids[0] =3D npids[1] =3D npids[2] =3D npids[3] =3D npids[4] =3D 0xffff;
+	npids[0] =3D 0xffff;
+	npids[1] =3D 0xffff;
+	npids[2] =3D 0xffff;
+	npids[3] =3D 0xffff;
+	npids[4] =3D 0xffff;
 	i =3D dvbdmxfeed->pes_type;
 	switch (i) {
 	case 2: //teletext
@@ -1407,10 +1419,13 @@ u8 i2c_readreg(struct av7110 *av7110, u8 id, u8 re=
g)

 	msgs[0].flags =3D 0;
 	msgs[1].flags =3D I2C_M_RD;
-	msgs[0].addr =3D msgs[1].addr =3D id / 2;
+	msgs[0].addr =3D id / 2;
+	msgs[1].addr =3D id / 2;
 	mm1[0] =3D reg;
-	msgs[0].len =3D 1; msgs[1].len =3D 1;
-	msgs[0].buf =3D mm1; msgs[1].buf =3D mm2;
+	msgs[0].len =3D 1;
+	msgs[1].len =3D 1;
+	msgs[0].buf =3D mm1;
+	msgs[1].buf =3D mm2;
 	i2c_transfer(&av7110->i2c_adap, msgs, 2);

 	return mm2[0];
@@ -1511,7 +1526,8 @@ static int get_firmware(struct av7110 *av7110)

 	memcpy(av7110->bin_fw, fw->data, fw->size);
 	av7110->size_fw =3D fw->size;
-	if ((ret =3D check_firmware(av7110)))
+	ret =3D check_firmware(av7110);
+	if (ret)
 		vfree(av7110->bin_fw);

 	release_firmware(fw);
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index 35af0cd6d..3e0db8e9a 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -81,8 +81,10 @@ int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 =
*buf, size_t len)

 	if (!(dvbdmxfeed->ts_type & TS_PACKET))
 		return 0;
-	if (buf[3] =3D=3D 0xe0)	 // video PES do not have a length in TS
-		buf[4] =3D buf[5] =3D 0;
+	if (buf[3] =3D=3D 0xe0) {	 // video PES do not have a length in TS
+		buf[4] =3D 0;
+		buf[5] =3D 0;
+	}
 	if (dvbdmxfeed->ts_type & TS_PAYLOAD_ONLY)
 		return dvbdmxfeed->cb.ts(buf, len, NULL, 0,
 					 &dvbdmxfeed->feed.ts, NULL);
@@ -282,7 +284,8 @@ int av7110_set_volume(struct av7110 *av7110, unsigned =
int volleft,
 			volleft =3D 0x3f;
 		if (volright > 0x3f)
 			volright =3D 0x3f;
-		if ((err =3D SendDAC(av7110, 3, 0x80 + volleft)))
+		err =3D SendDAC(av7110, 3, 0x80 + volleft);
+		if (err)
 			return err;
 		return SendDAC(av7110, 4, volright);

@@ -1513,7 +1516,8 @@ static int dvb_video_open(struct inode *inode, struc=
t file *file)

 	dprintk(2, "av7110:%p, \n", av7110);

-	if ((err =3D dvb_generic_open(inode, file)) < 0)
+	err =3D dvb_generic_open(inode, file);
+	if (err < 0)
 		return err;

 	if ((file->f_flags & O_ACCMODE) !=3D O_RDONLY) {
@@ -1524,7 +1528,8 @@ static int dvb_video_open(struct inode *inode, struc=
t file *file)
 		av7110->videostate.stream_source =3D VIDEO_SOURCE_DEMUX;

 		/*  empty event queue */
-		av7110->video_events.eventr =3D av7110->video_events.eventw =3D 0;
+		av7110->video_events.eventr =3D 0;
+		av7110->video_events.eventw =3D 0;
 	}

 	return 0;
@@ -1631,7 +1636,8 @@ int av7110_av_register(struct av7110 *av7110)

 	init_waitqueue_head(&av7110->video_events.wait_queue);
 	spin_lock_init(&av7110->video_events.lock);
-	av7110->video_events.eventw =3D av7110->video_events.eventr =3D 0;
+	av7110->video_events.eventw =3D 0;
+	av7110->video_events.eventr =3D 0;
 	av7110->video_events.overflow =3D 0;
 	memset(&av7110->video_size, 0, sizeof(video_size_t));

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index d775dd632..52290a500 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -219,7 +219,8 @@ int av7110_bootarm(struct av7110 *av7110)
 	/* FIXME: Why does Nexus CA require 2x iwdebi for first init? */
 	iwdebi(av7110, DEBISWAP, DPRAM_BASE, 0x76543210, 4);

-	if ((ret=3Dirdebi(av7110, DEBINOSWAP, DPRAM_BASE, 0, 4)) !=3D 0x10325476=
) {
+	ret =3D irdebi(av7110, DEBINOSWAP, DPRAM_BASE, 0, 4);
+	if (ret !=3D 0x10325476) {
 		printk(KERN_ERR "dvb-ttpci: debi test in av7110_bootarm() failed: %08x =
!=3D %08x (check your BIOS 'Plug&Play OS' settings)\n",
 		       ret, 0x10325476);
 		return -1;
@@ -547,7 +548,8 @@ int av7110_fw_request(struct av7110 *av7110, u16 *requ=
est_buf,
 	if (mutex_lock_interruptible(&av7110->dcomlock))
 		return -ERESTARTSYS;

-	if ((err =3D __av7110_send_fw_cmd(av7110, request_buf, request_buf_len))=
 < 0) {
+	err =3D __av7110_send_fw_cmd(av7110, request_buf, request_buf_len);
+	if (err < 0) {
 		mutex_unlock(&av7110->dcomlock);
 		printk(KERN_ERR "dvb-ttpci: av7110_fw_request error %d\n", err);
 		return err;
diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging=
/media/av7110/av7110_ipack.c
index c18a9f586..c41a233e1 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -22,7 +22,8 @@ void av7110_ipack_reset(struct ipack *p)
 int av7110_ipack_init(struct ipack *p, int size,
 		      void (*func)(u8 *buf, int size, void *priv))
 {
-	if (!(p->buf =3D vmalloc(size))) {
+	p->buf =3D vmalloc(size);
+	if (!p->buf) {
 		printk(KERN_WARNING "Couldn't allocate memory for ipack\n");
 		return -ENOMEM;
 	}
diff --git a/drivers/staging/media/av7110/dvb_filter.c b/drivers/staging/m=
edia/av7110/dvb_filter.c
index f92faae44..71c1d9629 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.c
+++ b/drivers/staging/media/av7110/dvb_filter.c
@@ -99,7 +99,8 @@ int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts, un=
signed char *pes,
 	while (len >=3D 184) {
 		buf[3] =3D 0x10 | ((p2ts->cc++) & 0x0f);
 		memcpy(buf + 4, pes, 184);
-		if ((ret=3Dp2ts->cb(p2ts->priv, buf)))
+		ret =3D p2ts->cb(p2ts->priv, buf);
+		if (ret)
 			return ret;
 		len -=3D 184; pes +=3D 184;
 		buf[1] &=3D ~0x40;
=2D-
2.34.0


