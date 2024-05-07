Return-Path: <linux-media+bounces-10949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3548BD89A
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E5BB2365C
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15926B676;
	Tue,  7 May 2024 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="ED0bNFHU"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD58BF7
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041535; cv=none; b=Yg/QmAJuBkdMF5prX2zd775wGIP+HYihJ7uEwd69/RAAE6N7v55TOMP4GPzV65EIyUGJLXW0dbCXY7RVbAssmLrNZN9NUT8A2jjc9UKrFwckVrKJ1V4f4ll3CL02r0DdGKhRhwb29vHmKL7B5vfdG4H+Oteyop58o6GYOCeuwIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041535; c=relaxed/simple;
	bh=v45OWqV5yEDxQgmJE2f/DflJHeGFli7iJug9oFKB9W8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vB3r+vusrGyJB8NMyao/LOpBP+LA42ooC/RZKSIL4JpBatIOzH9vp63F3Cu143OyzhNCQKUTPVHNyVuuMh81YJeKEfaJF/U4eTF7MlyuQMSC+j9lV3+P11aDdZk40+LAN70hU6RTXq2YrdaxWFmyu5IWkMMRYVGq35VaC4IJvQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=ED0bNFHU; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041528; x=1715646328; i=herdler@nurfuerspam.de;
	bh=nhCF+aTc5d8JnBIHILH2twTN8PYiYO22ypw5UcWRh8c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ED0bNFHU7VEz+7993iuDcECzsgtlSA4iXk1cxQ6JJFz8BiTkOexHT7wu6XqGu0hB
	 T0uOVpkN677jqt2R2w83R1euCkRT50bmwhAikFdDtvg4K3WQMZuEWo/ek4kPQivh+
	 duwLnqx46qhA6IVsz6EBxGl391WdiBj2Ntdsocbbw1HxoR2wZtpI4IgLyM+cJiEMz
	 cQJB5ishcABOqxlatNiixTZ49jWnzPcpaPVJ0aiKzcxp0cnPhhS9K6Hbj0iR4VuhY
	 EemF37cDmFLan8nfjgPBwBBDPy8+bz4hXkDRgNKlYGN0J6VuQwCVYiLlDtM9cD9WX
	 eVO8snkzizRDlHH2xg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUYu-1sP7ud3obM-00psD5; Tue, 07
 May 2024 02:25:28 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 11/21] media: av7110: coding style fixes: whitespace (strict)
Date: Tue,  7 May 2024 02:24:50 +0200
Message-Id: <20240507002500.81867-12-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:/gqTgg29Nhazna0ZGVep/nDfbxBqIY5SgHc/lRlEt8Dm3lsoOJp
 SG03PkOOJJybgExqOFRn34TYkdehmAAJ29ssZlNm++84RLxDIZwf1Oz31j3D0vIGLsDgQ9y
 SY231wa6fxKIexAClw90wgscyxaEls0x4lRVAdCrDdLbuAkWiQEYrJl1rasg/zHFlidtP9J
 SEFt4yNWvDlitDvZ3BQKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CFde2i2n1R8=;rmxWbrLCQIhfxSo0DbIK+286zaz
 FB6m0Y4fTWKY8PNwVHCT0C/ntKgJ8gfx2AEfy4sMUuDzbE9H9lkmK9Ov9bS5lj0zNFis3fX6U
 mT2MTqHAhCAgNPASGKhBxUO/L89T1+aUKzO+Rlop1HbtXvnDYV0KcwM+FsLzzlQv/dYrfbOgd
 yF/Y1zR/v8wmkqEltUNd5wpFhxeyFBl924bhXceARQLZyV5VJyo9rapRB7SbUIAwxqafsO6Ru
 duA3y0zUPMhMHvY9l1d+FxoVYioAMoFhP+y+PYfFM2SlW1qa9hh5h9HhX/FyzHRxvyxKRsWaF
 ahliqihrdPgRg1CDotkwBu5bxSx1FyrAUKw2juXpcWFBY98nDVG6SzW28YxcVWYeQTmIttMM+
 +yrNnzlM/7J6aFTxmCvoBSaZchb9MtOvhQqNq7prny56U3/1KI0r9R7BSAqMxHrAlfm1Kpb3I
 BRpPzfIoTDpMJ25N7KuTRKfRvIh/1/UwtnhLYg6dSAK+izxQa5uFZFhC3mnpNcw/3DlvTl8T9
 EBU9QzlhCX9gwj25dV6o+L+PVi4VPPt8kcteXVqHGynoHLx6OAAvwxWopk3Mioioi+j+DkOJw
 Hd2cMJ8W5O5hhfAN3n/Te324Wt0mm5JzgInVoI18MgSZwy9OSH60qKK5qtfuT6UayxZrlhv8d
 9VMNdsEM2s8uvt7rzGdNdhW6kBRUjnGJ26bEPOzn60DnwOz/FPe995c8NyI+igzfK/MeqWDqR
 we6sBG/l0+622gjn34BxTUa952PRvuqiGJdrmrlD125QfAd7JRz5tZNm3UGx5j6Apbe1b+277
 lb47tgp6j4ctgLhIZIS6/PGbJtMECRh9l161N+T3jSEZc=

This patch fixes the following checkpatch warnings:

CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
CHECK:SPACING: No space is necessary after a cast
CHECK:SPACING: space preferred before that '|' (ctx:VxE)
CHECK:SPACING: spaces preferred around that '&' (ctx:VxV)
CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
CHECK:SPACING: spaces preferred around that '>>' (ctx:VxV)
CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)

Additional whitespace fixes found by "checkpatch.pl --strict".

Whitespace changes only.
"git diff -w" shows no changes.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c       | 60 ++++++++++-----------
 drivers/staging/media/av7110/av7110.h       |  8 +--
 drivers/staging/media/av7110/av7110_av.c    | 58 ++++++++++----------
 drivers/staging/media/av7110/av7110_av.h    |  2 +-
 drivers/staging/media/av7110/av7110_ca.c    | 12 ++---
 drivers/staging/media/av7110/av7110_hw.c    | 28 +++++-----
 drivers/staging/media/av7110/av7110_hw.h    | 16 +++---
 drivers/staging/media/av7110/av7110_ipack.c |  8 +--
 drivers/staging/media/av7110/av7110_v4l.c   | 14 ++---
 drivers/staging/media/av7110/dvb_filter.c   | 18 +++----
 drivers/staging/media/av7110/dvb_filter.h   |  4 +-
 11 files changed, 114 insertions(+), 114 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index 8a4e7bd82..27019e3f3 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -52,8 +52,8 @@

 #define TS_WIDTH  376
 #define TS_HEIGHT 512
-#define TS_BUFLEN (TS_WIDTH*TS_HEIGHT)
-#define TS_MAX_PACKETS (TS_BUFLEN/TS_SIZE)
+#define TS_BUFLEN (TS_WIDTH * TS_HEIGHT)
+#define TS_MAX_PACKETS (TS_BUFLEN / TS_SIZE)

 int av7110_debug;

@@ -122,7 +122,7 @@ static void init_av7110_av(struct av7110 *av7110)
 		printk("dvb-ttpci:cannot set internal volume to maximum:%d\n",ret);

 	ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
-			    1, (u16) av7110->display_ar);
+			    1, (u16)av7110->display_ar);
 	if (ret < 0)
 		printk("dvb-ttpci: unable to set aspect ratio\n");
 	ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
@@ -234,7 +234,7 @@ static int arm_thread(void *data)

 	for (;;) {
 		timeout =3D wait_event_interruptible_timeout(av7110->arm_wait,
-			kthread_should_stop(), 5 * HZ);
+							   kthread_should_stop(), 5 * HZ);

 		if (-ERESTARTSYS =3D=3D timeout || kthread_should_stop()) {
 			/* got signal or told to quit*/
@@ -371,7 +371,7 @@ static void debiirq(struct tasklet_struct *t)
 	switch (type & 0xff) {
 	case DATA_TS_RECORD:
 		dvb_dmx_swfilter_packets(&av7110->demux,
-					 (const u8 *) av7110->debi_virt,
+					 (const u8 *)av7110->debi_virt,
 					 av7110->debilen / 188);
 		xfer =3D RX_BUFF;
 		break;
@@ -379,7 +379,7 @@ static void debiirq(struct tasklet_struct *t)
 	case DATA_PES_RECORD:
 		if (av7110->demux.recording)
 			av7110_record_cb(&av7110->p2t[handle],
-					 (u8 *) av7110->debi_virt,
+					 (u8 *)av7110->debi_virt,
 					 av7110->debilen);
 		xfer =3D RX_BUFF;
 		break;
@@ -611,11 +611,11 @@ static void gpioirq(struct tasklet_struct *t)
 			len =3D 2 * 1024;
 		iwdebi(av7110, DEBINOSWAP, TX_LEN, len, 2);
 		iwdebi(av7110, DEBINOSWAP, IRQ_STATE_EXT, len, 2);
-		memcpy(av7110->debi_virt, av7110->bmpbuf+av7110->bmpp, len);
+		memcpy(av7110->debi_virt, av7110->bmpbuf + av7110->bmpp, len);
 		av7110->bmpp +=3D len;
 		av7110->bmplen -=3D len;
 		dprintk(8, "gpio DATA_BMP_LOAD DMA len %d\n", len);
-		start_debi_dma(av7110, DEBI_WRITE, DPRAM_BASE+txbuf, len);
+		start_debi_dma(av7110, DEBI_WRITE, DPRAM_BASE + txbuf, len);
 		spin_unlock(&av7110->debilock);
 		return;

@@ -633,7 +633,7 @@ static void gpioirq(struct tasklet_struct *t)
 	case DATA_TS_RECORD:
 	case DATA_PES_RECORD:
 		dprintk(8, "DMA: TS_REC etc.\n");
-		start_debi_dma(av7110, DEBI_READ, DPRAM_BASE+rxbuf, len);
+		start_debi_dma(av7110, DEBI_READ, DPRAM_BASE + rxbuf, len);
 		spin_unlock(&av7110->debilock);
 		return;

@@ -675,9 +675,9 @@ static int dvb_osd_ioctl(struct file *file,
 	dprintk(4, "%p\n", av7110);

 	if (cmd =3D=3D OSD_SEND_CMD)
-		return av7110_osd_cmd(av7110, (osd_cmd_t *) parg);
+		return av7110_osd_cmd(av7110, (osd_cmd_t *)parg);
 	if (cmd =3D=3D OSD_GET_CAPABILITY)
-		return av7110_osd_capability(av7110, (osd_cap_t *) parg);
+		return av7110_osd_capability(av7110, (osd_cap_t *)parg);

 	return -EINVAL;
 }
@@ -723,7 +723,7 @@ static inline int SetPIDs(struct av7110 *av7110, u16 v=
pid, u16 apid, u16 ttpid,
 }

 int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
-		u16 subpid, u16 pcrpid)
+	       u16 subpid, u16 pcrpid)
 {
 	int ret =3D 0;

@@ -856,7 +856,7 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *d=
vbdmxfeed)

 	npids[0] =3D npids[1] =3D npids[2] =3D npids[3] =3D npids[4] =3D 0xffff;
 	i =3D dvbdmxfeed->pes_type;
-	npids[i] =3D (pid[i]&0x8000) ? 0 : pid[i];
+	npids[i] =3D (pid[i] & 0x8000) ? 0 : pid[i];
 	if ((i =3D=3D 2) && npids[i] && (dvbdmxfeed->ts_type & TS_PACKET)) {
 		npids[i] =3D 0;
 		ret =3D ChangePIDs(av7110, npids[1], npids[0], npids[2], npids[3], npid=
s[4]);
@@ -919,7 +919,7 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dv=
bdmxfeed)
 	case 4:
 		if (!pids_off)
 			return 0;
-		npids[i] =3D (pid[i]&0x8000) ? 0 : pid[i];
+		npids[i] =3D (pid[i] & 0x8000) ? 0 : pid[i];
 		break;
 	}
 	if (!ret)
@@ -1111,8 +1111,8 @@ static int dvb_get_stc(struct dmx_demux *demux, unsi=
gned int num,
 	dprintk(2, "fwstc =3D %04hx %04hx %04hx %04hx\n",
 		fwstc[0], fwstc[1], fwstc[2], fwstc[3]);

-	*stc =3D	(((uint64_t) ((fwstc[3] & 0x8000) >> 15)) << 32) |
-		(((uint64_t)  fwstc[1]) << 16) | ((uint64_t) fwstc[0]);
+	*stc =3D	(((uint64_t)((fwstc[3] & 0x8000) >> 15)) << 32) |
+		(((uint64_t)fwstc[1]) << 16) | ((uint64_t)fwstc[0]);
 	*base =3D 1;

 	dprintk(4, "stc =3D %lu\n", (unsigned long)*stc);
@@ -1218,7 +1218,7 @@ static int budget_stop_feed(struct dvb_demux_feed *f=
eed)
 static void vpeirq(struct tasklet_struct *t)
 {
 	struct av7110 *budget =3D from_tasklet(budget, t, vpe_tasklet);
-	u8 *mem =3D (u8 *) (budget->grabbing);
+	u8 *mem =3D (u8 *)(budget->grabbing);
 	u32 olddma =3D budget->ttbp;
 	u32 newdma =3D saa7146_read(budget->dev, PCI_VDP3);
 	struct dvb_demux *demux =3D budget->full_ts ? &budget->demux : &budget->=
demux1;
@@ -1268,7 +1268,7 @@ static int av7110_register(struct av7110 *av7110)

 	av7110->registered =3D 1;

-	dvbdemux->priv =3D (void *) av7110;
+	dvbdemux->priv =3D (void *)av7110;

 	for (i =3D 0; i < 32; i++)
 		av7110->handle2filter[i] =3D NULL;
@@ -1323,7 +1323,7 @@ static int av7110_register(struct av7110 *av7110)
 		/* initialize software demux1 without its own frontend
 		 * demux1 hardware is connected to frontend0 of demux0
 		 */
-		dvbdemux1->priv =3D (void *) av7110;
+		dvbdemux1->priv =3D (void *)av7110;

 		dvbdemux1->filternum =3D 256;
 		dvbdemux1->feednum =3D 256;
@@ -1901,7 +1901,7 @@ static int av7110_fe_lock_fix(struct av7110 *av7110,=
 enum fe_status status)

 	if (synced) {
 		ret =3D SetPIDs(av7110, av7110->pids[DMX_PES_VIDEO],
-			av7110->pids[DMX_PES_AUDIO],
+			      av7110->pids[DMX_PES_AUDIO],
 			av7110->pids[DMX_PES_TELETEXT], 0,
 			av7110->pids[DMX_PES_PCR]);
 		if (!ret)
@@ -2075,7 +2075,7 @@ static int frontend_init(struct av7110 *av7110)
 		switch (av7110->dev->pci->subsystem_device) {
 		case 0x0000: // Fujitsu/Siemens DVB-Cable (ves1820/Philips CD1516(??))
 			av7110->fe =3D dvb_attach(ves1820_attach, &philips_cd1516_config,
-						    &av7110->i2c_adap, read_pwm(av7110));
+						&av7110->i2c_adap, read_pwm(av7110));
 			if (av7110->fe) {
 				av7110->fe->ops.tuner_ops.set_params =3D philips_cd1516_tuner_set_par=
ams;
 			}
@@ -2379,9 +2379,9 @@ static int av7110_attach(struct saa7146_dev *dev,
 		/* RPS1 timeout disable */
 		saa7146_write(dev, RPS_TOV1, 0);
 		WRITE_RPS1(CMD_PAUSE | EVT_VBI_B);
-		WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL>>2));
+		WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL >> 2));
 		WRITE_RPS1(GPIO3_MSK);
-		WRITE_RPS1(SAA7146_GPIO_OUTLO<<24);
+		WRITE_RPS1(SAA7146_GPIO_OUTLO << 24);
 #if RPS_IRQ
 		/* issue RPS1 interrupt to increment counter */
 		WRITE_RPS1(CMD_INTERRUPT);
@@ -2541,9 +2541,9 @@ static int av7110_attach(struct saa7146_dev *dev,
 		/* Wait Source Line Counter Threshold                           (p36) *=
/
 		WRITE_RPS1(CMD_PAUSE | EVT_HS);
 		/* Set GPIO3=3D1                                                  (p42)=
 */
-		WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL>>2));
+		WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL >> 2));
 		WRITE_RPS1(GPIO3_MSK);
-		WRITE_RPS1(SAA7146_GPIO_OUTHI<<24);
+		WRITE_RPS1(SAA7146_GPIO_OUTHI << 24);
 #if RPS_IRQ
 		/* issue RPS1 interrupt */
 		WRITE_RPS1(CMD_INTERRUPT);
@@ -2551,9 +2551,9 @@ static int av7110_attach(struct saa7146_dev *dev,
 		/* Wait reset Source Line Counter Threshold                     (p36) *=
/
 		WRITE_RPS1(CMD_PAUSE | RPS_INV | EVT_HS);
 		/* Set GPIO3=3D0                                                  (p42)=
 */
-		WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL>>2));
+		WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL >> 2));
 		WRITE_RPS1(GPIO3_MSK);
-		WRITE_RPS1(SAA7146_GPIO_OUTLO<<24);
+		WRITE_RPS1(SAA7146_GPIO_OUTLO << 24);
 #if RPS_IRQ
 		/* issue RPS1 interrupt */
 		WRITE_RPS1(CMD_INTERRUPT);
@@ -2623,7 +2623,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 	if (!av7110->debi_virt)
 		goto err_saa71466_vfree_4;

-	av7110->iobuf =3D vmalloc(AVOUTLEN+AOUTLEN+BMPLEN+4*IPACKS);
+	av7110->iobuf =3D vmalloc(AVOUTLEN + AOUTLEN + BMPLEN + 4 * IPACKS);
 	if (!av7110->iobuf)
 		goto err_pci_free_5;

@@ -2632,7 +2632,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 		goto err_iobuf_vfree_6;

 	/* init BMP buffer */
-	av7110->bmpbuf =3D av7110->iobuf+AVOUTLEN+AOUTLEN;
+	av7110->bmpbuf =3D av7110->iobuf + AVOUTLEN + AOUTLEN;
 	init_waitqueue_head(&av7110->bmpq);

 	ret =3D av7110_ca_init(av7110);
@@ -2653,7 +2653,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 		       "dvb-ttpci: Warning, firmware version 0x%04x is too old. System =
might be unstable!\n",
 		       FW_VERSION(av7110->arm_app));

-	thread =3D kthread_run(arm_thread, (void *) av7110, "arm_mon");
+	thread =3D kthread_run(arm_thread, (void *)av7110, "arm_mon");
 	if (IS_ERR(thread)) {
 		ret =3D PTR_ERR(thread);
 		goto err_stop_arm_9;
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media=
/av7110/av7110.h
index 2290300ae..1cfe13df6 100644
=2D-- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -119,11 +119,11 @@ struct av7110 {

 	void		       *iobuf;	 /* memory for all buffers */
 	struct dvb_ringbuffer	avout;   /* buffer for video or A/V mux */
-#define AVOUTLEN (128*1024)
+#define AVOUTLEN (128 * 1024)
 	struct dvb_ringbuffer	aout;    /* buffer for audio */
-#define AOUTLEN (64*1024)
+#define AOUTLEN (64 * 1024)
 	void		       *bmpbuf;
-#define BMPLEN (8*32768+1024)
+#define BMPLEN (8 * 32768 + 1024)

 	/* bitmap buffers and states */

@@ -281,7 +281,7 @@ struct av7110 {
 };

 extern int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpi=
d,
-		       u16 subpid, u16 pcrpid);
+		      u16 subpid, u16 pcrpid);

 void av7110_ir_handler(struct av7110 *av7110, u32 ircom);
 int av7110_set_ir_config(struct av7110 *av7110);
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index 56fa1f180..e031d6028 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -91,7 +91,7 @@ int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *=
buf, size_t len)

 static int dvb_filter_pes2ts_cb(void *priv, unsigned char *data)
 {
-	struct dvb_demux_feed *dvbdmxfeed =3D (struct dvb_demux_feed *) priv;
+	struct dvb_demux_feed *dvbdmxfeed =3D (struct dvb_demux_feed *)priv;

 	dvbdmxfeed->cb.ts(data, 188, NULL, 0,
 			  &dvbdmxfeed->feed.ts, NULL);
@@ -117,7 +117,7 @@ int av7110_av_start_record(struct av7110 *av7110, int =
av,
 		dvb_filter_pes2ts_init(&av7110->p2t[0],
 				       dvbdmx->pesfilter[0]->pid,
 				       dvb_filter_pes2ts_cb,
-				       (void *) dvbdmx->pesfilter[0]);
+				       (void *)dvbdmx->pesfilter[0]);
 		ret =3D av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, =
0);
 		break;

@@ -125,7 +125,7 @@ int av7110_av_start_record(struct av7110 *av7110, int =
av,
 		dvb_filter_pes2ts_init(&av7110->p2t[1],
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
-				       (void *) dvbdmx->pesfilter[1]);
+				       (void *)dvbdmx->pesfilter[1]);
 		ret =3D av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, =
0);
 		break;

@@ -133,11 +133,11 @@ int av7110_av_start_record(struct av7110 *av7110, in=
t av,
 		dvb_filter_pes2ts_init(&av7110->p2t[0],
 				       dvbdmx->pesfilter[0]->pid,
 				       dvb_filter_pes2ts_cb,
-				       (void *) dvbdmx->pesfilter[0]);
+				       (void *)dvbdmx->pesfilter[0]);
 		dvb_filter_pes2ts_init(&av7110->p2t[1],
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
-				       (void *) dvbdmx->pesfilter[1]);
+				       (void *)dvbdmx->pesfilter[1]);
 		ret =3D av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0)=
;
 		break;
 	}
@@ -254,10 +254,10 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffe=
r *buf, int dlen)
 		return -1;
 	}

-	dvb_ringbuffer_read(buf, dest, (size_t) blen);
+	dvb_ringbuffer_read(buf, dest, (size_t)blen);

 	dprintk(2, "pread=3D0x%08lx, pwrite=3D0x%08lx\n",
-	       (unsigned long) buf->pread, (unsigned long) buf->pwrite);
+		(unsigned long)buf->pread, (unsigned long)buf->pwrite);
 	wake_up(&buf->queue);
 	return blen;
 }
@@ -325,7 +325,7 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7=
110_video_mode mode)

 	if (!ret && !av7110->playing) {
 		ret =3D ChangePIDs(av7110, av7110->pids[DMX_PES_VIDEO],
-			   av7110->pids[DMX_PES_AUDIO],
+				 av7110->pids[DMX_PES_AUDIO],
 			   av7110->pids[DMX_PES_TELETEXT],
 			   0, av7110->pids[DMX_PES_PCR]);
 		if (!ret)
@@ -404,7 +404,7 @@ static inline long aux_ring_buffer_write(struct dvb_ri=
ngbuffer *rbuf,

 static void play_video_cb(u8 *buf, int count, void *priv)
 {
-	struct av7110 *av7110 =3D (struct av7110 *) priv;
+	struct av7110 *av7110 =3D (struct av7110 *)priv;

 	dprintk(2, "av7110:%p, \n", av7110);

@@ -417,7 +417,7 @@ static void play_video_cb(u8 *buf, int count, void *pr=
iv)

 static void play_audio_cb(u8 *buf, int count, void *priv)
 {
-	struct av7110 *av7110 =3D (struct av7110 *) priv;
+	struct av7110 *av7110 =3D (struct av7110 *)priv;

 	dprintk(2, "av7110:%p, \n", av7110);

@@ -499,7 +499,7 @@ static ssize_t dvb_play(struct av7110 *av7110, const c=
har __user *buf,
 }

 static ssize_t dvb_play_kernel(struct av7110 *av7110, const u8 *buf,
-			unsigned long count, int nonblock, int type)
+			       unsigned long count, int nonblock, int type)
 {
 	unsigned long todo =3D count, n;

@@ -546,8 +546,8 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const =
char __user *buf,
 			if (nonblock)
 				return count - todo;
 			if (wait_event_interruptible(av7110->aout.queue,
-					(dvb_ringbuffer_free(&av7110->aout) >=3D 20 * 1024)))
-				return count-todo;
+						     (dvb_ringbuffer_free(&av7110->aout) >=3D 20 * 1024)))
+				return count - todo;
 		}
 		n =3D todo;
 		if (n > IPACKS * 2)
@@ -688,7 +688,7 @@ void av7110_p2t_write(u8 const *buf, long int length, =
u16 pid, struct av7110_p2t
 	if (p->pos) {
 		c2 =3D find_pes_header(buf + c, length - c, &p->frags);
 		if (c2 >=3D 0 && c2 < (TS_SIZE - 4) - p->pos)
-			l =3D c2+c;
+			l =3D c2 + c;
 		else
 			l =3D (TS_SIZE - 4) - p->pos;
 		memcpy(p->pes + p->pos, buf, l);
@@ -765,7 +765,7 @@ static void p_to_t(u8 const *buf, long int length, u16=
 pid, u8 *counter,

 	pes_start =3D 0;
 	if (length > 3 &&
-	     buf[0] =3D=3D 0x00 && buf[1] =3D=3D 0x00 && buf[2] =3D=3D 0x01)
+	    buf[0] =3D=3D 0x00 && buf[1] =3D=3D 0x00 && buf[2] =3D=3D 0x01)
 		switch (buf[3]) {
 		case PROG_STREAM_MAP:
 		case PRIVATE_STREAM2:
@@ -1121,7 +1121,7 @@ static int dvb_video_ioctl(struct file *file,
 {
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct av7110 *av7110 =3D dvbdev->priv;
-	unsigned long arg =3D (unsigned long) parg;
+	unsigned long arg =3D (unsigned long)parg;
 	int ret =3D 0;

 	dprintk(1, "av7110:%p, cmd=3D%04x\n", av7110,cmd);
@@ -1143,7 +1143,7 @@ static int dvb_video_ioctl(struct file *file,
 			ret =3D av7110_av_stop(av7110, RP_VIDEO);
 		else
 			ret =3D vidcom(av7110, AV_VIDEO_CMD_STOP,
-			       av7110->videostate.video_blank ? 0 : 1);
+				     av7110->videostate.video_blank ? 0 : 1);
 		if (!ret)
 			av7110->trickmode =3D TRICK_NONE;
 		break;
@@ -1193,11 +1193,11 @@ static int dvb_video_ioctl(struct file *file,
 		break;

 	case VIDEO_SELECT_SOURCE:
-		av7110->videostate.stream_source =3D (video_stream_source_t) arg;
+		av7110->videostate.stream_source =3D (video_stream_source_t)arg;
 		break;

 	case VIDEO_SET_BLANK:
-		av7110->videostate.video_blank =3D (int) arg;
+		av7110->videostate.video_blank =3D (int)arg;
 		break;

 	case VIDEO_GET_STATUS:
@@ -1220,7 +1220,7 @@ static int dvb_video_ioctl(struct file *file,

 	case VIDEO_SET_DISPLAY_FORMAT:
 	{
-		video_displayformat_t format =3D (video_displayformat_t) arg;
+		video_displayformat_t format =3D (video_displayformat_t)arg;

 		switch (format) {
 		case VIDEO_PAN_SCAN:
@@ -1250,14 +1250,14 @@ static int dvb_video_ioctl(struct file *file,
 		}
 		av7110->display_ar =3D arg;
 		ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
-				    1, (u16) arg);
+				    1, (u16)arg);
 		break;

 #ifdef CONFIG_COMPAT
 	case VIDEO_STILLPICTURE32:
 	{
 		struct compat_video_still_picture *pic =3D
-			(struct compat_video_still_picture *) parg;
+			(struct compat_video_still_picture *)parg;
 		av7110->videostate.stream_source =3D VIDEO_SOURCE_MEMORY;
 		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
 		ret =3D play_iframe(av7110, compat_ptr(pic->iFrame),
@@ -1269,7 +1269,7 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_STILLPICTURE:
 	{
 		struct video_still_picture *pic =3D
-			(struct video_still_picture *) parg;
+			(struct video_still_picture *)parg;
 		av7110->videostate.stream_source =3D VIDEO_SOURCE_MEMORY;
 		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
 		ret =3D play_iframe(av7110, pic->iFrame, pic->size,
@@ -1291,7 +1291,7 @@ static int dvb_video_ioctl(struct file *file,
 		break;

 	case VIDEO_SLOWMOTION:
-		if (av7110->playing&RP_VIDEO) {
+		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode !=3D TRICK_SLOW)
 				ret =3D av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
 			if (!ret)
@@ -1353,7 +1353,7 @@ static int dvb_audio_ioctl(struct file *file,
 {
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct av7110 *av7110 =3D dvbdev->priv;
-	unsigned long arg =3D (unsigned long) parg;
+	unsigned long arg =3D (unsigned long)parg;
 	int ret =3D 0;

 	dprintk(1, "av7110:%p, cmd=3D%04x\n", av7110,cmd);
@@ -1398,19 +1398,19 @@ static int dvb_audio_ioctl(struct file *file,
 		break;

 	case AUDIO_SELECT_SOURCE:
-		av7110->audiostate.stream_source =3D (audio_stream_source_t) arg;
+		av7110->audiostate.stream_source =3D (audio_stream_source_t)arg;
 		break;

 	case AUDIO_SET_MUTE:
 	{
 		ret =3D audcom(av7110, arg ? AUDIO_CMD_MUTE : AUDIO_CMD_UNMUTE);
 		if (!ret)
-			av7110->audiostate.mute_state =3D (int) arg;
+			av7110->audiostate.mute_state =3D (int)arg;
 		break;
 	}

 	case AUDIO_SET_AV_SYNC:
-		av7110->audiostate.AV_sync_state =3D (int) arg;
+		av7110->audiostate.AV_sync_state =3D (int)arg;
 		ret =3D audcom(av7110, arg ? AUDIO_CMD_SYNC_ON : AUDIO_CMD_SYNC_OFF);
 		break;

@@ -1421,7 +1421,7 @@ static int dvb_audio_ioctl(struct file *file,
 		break;

 	case AUDIO_CHANNEL_SELECT:
-		av7110->audiostate.channel_select =3D (audio_channel_select_t) arg;
+		av7110->audiostate.channel_select =3D (audio_channel_select_t)arg;
 		switch (av7110->audiostate.channel_select) {
 		case AUDIO_STEREO:
 			ret =3D audcom(av7110, AUDIO_CMD_STEREO);
diff --git a/drivers/staging/media/av7110/av7110_av.h b/drivers/staging/me=
dia/av7110/av7110_av.h
index 56b0e14bb..ce0f9945d 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.h
+++ b/drivers/staging/media/av7110/av7110_av.h
@@ -15,7 +15,7 @@ extern int av7110_set_volume(struct av7110 *av7110, unsi=
gned int volleft,
 			     unsigned int volright);
 extern int av7110_av_stop(struct av7110 *av7110, int av);
 extern int av7110_av_start_record(struct av7110 *av7110, int av,
-			  struct dvb_demux_feed *dvbdmxfeed);
+				  struct dvb_demux_feed *dvbdmxfeed);
 extern int av7110_av_start_play(struct av7110 *av7110, int av);

 extern void dvb_video_add_event(struct av7110 *av7110, struct video_event=
 *event);
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/me=
dia/av7110/av7110_ca.c
index 93b888c70..682204a6f 100644
=2D-- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -232,7 +232,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned in=
t cmd, void *parg)
 {
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct av7110 *av7110 =3D dvbdev->priv;
-	unsigned long arg =3D (unsigned long) parg;
+	unsigned long arg =3D (unsigned long)parg;
 	int ret =3D 0;

 	dprintk(8, "av7110:%p\n",av7110);
@@ -298,11 +298,11 @@ static int dvb_ca_ioctl(struct file *file, unsigned =
int cmd, void *parg)
 			return -EINVAL;
 		}
 		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetDescr, 5,
-			      (descr->index<<8)|descr->parity,
-			      (descr->cw[0]<<8)|descr->cw[1],
-			      (descr->cw[2]<<8)|descr->cw[3],
-			      (descr->cw[4]<<8)|descr->cw[5],
-			      (descr->cw[6]<<8)|descr->cw[7]);
+			      (descr->index << 8) | descr->parity,
+			      (descr->cw[0] << 8) | descr->cw[1],
+			      (descr->cw[2] << 8) | descr->cw[3],
+			      (descr->cw[4] << 8) | descr->cw[5],
+			      (descr->cw[6] << 8) | descr->cw[7]);
 		break;
 	}

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index d3aa524f6..ef4090fb1 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -410,14 +410,14 @@ static int __av7110_send_fw_cmd(struct av7110 *av711=
0, u16 *buf, int length)
 	}

 	for (i =3D 2; i < length; i++)
-		wdebi(av7110, DEBINOSWAP, COMMAND + 2 * i, (u32) buf[i], 2);
+		wdebi(av7110, DEBINOSWAP, COMMAND + 2 * i, (u32)buf[i], 2);

 	if (length)
-		wdebi(av7110, DEBINOSWAP, COMMAND + 2, (u32) buf[1], 2);
+		wdebi(av7110, DEBINOSWAP, COMMAND + 2, (u32)buf[1], 2);
 	else
 		wdebi(av7110, DEBINOSWAP, COMMAND + 2, 0, 2);

-	wdebi(av7110, DEBINOSWAP, COMMAND, (u32) buf[0], 2);
+	wdebi(av7110, DEBINOSWAP, COMMAND, (u32)buf[0], 2);

 	if (FW_VERSION(av7110->arm_app) <=3D 0x261f)
 		wdebi(av7110, DEBINOSWAP, COM_IF_LOCK, 0x0000, 2);
@@ -685,14 +685,14 @@ static inline int SetColorBlend(struct av7110 *av711=
0, u8 windownr)
 }

 static inline int SetBlend_(struct av7110 *av7110, u8 windownr,
-		     enum av7110_osd_palette_type colordepth, u16 index, u8 blending)
+			    enum av7110_osd_palette_type colordepth, u16 index, u8 blending)
 {
 	return av7110_fw_cmd(av7110, COMTYPE_OSD, SetBlend, 4,
 			     windownr, colordepth, index, blending);
 }

 static inline int SetColor_(struct av7110 *av7110, u8 windownr,
-		     enum av7110_osd_palette_type colordepth, u16 index, u16 colorhi, u=
16 colorlo)
+			    enum av7110_osd_palette_type colordepth, u16 index, u16 colorhi, u=
16 colorlo)
 {
 	return av7110_fw_cmd(av7110, COMTYPE_OSD, SetColor, 5,
 			     windownr, colordepth, index, colorhi, colorlo);
@@ -832,7 +832,7 @@ static osd_raw_window_t bpp2bit[8] =3D {
 static inline int WaitUntilBmpLoaded(struct av7110 *av7110)
 {
 	int ret =3D wait_event_timeout(av7110->bmpq,
-				av7110->bmp_state !=3D BMP_LOADING, 10*HZ);
+				av7110->bmp_state !=3D BMP_LOADING, 10 * HZ);
 	if (ret =3D=3D 0) {
 		printk("dvb-ttpci: warning: timeout waiting in LoadBitmap: %d, %d\n",
 		       ret, av7110->bmp_state);
@@ -1046,7 +1046,7 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 	case OSD_Open:
 		av7110->osdbpp[av7110->osdwin] =3D (dc->color - 1) & 7;
 		ret =3D CreateOSDWindow(av7110, av7110->osdwin,
-				bpp2bit[av7110->osdbpp[av7110->osdwin]],
+				      bpp2bit[av7110->osdbpp[av7110->osdwin]],
 				dc->x1 - dc->x0 + 1, dc->y1 - dc->y0 + 1);
 		if (ret)
 			break;
@@ -1076,7 +1076,7 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 		if (FW_VERSION(av7110->arm_app) >=3D 0x2618)
 			ret =3D OSDSetPalette(av7110, dc->data, dc->color, dc->x0);
 		else {
-			int i, len =3D dc->x0-dc->color+1;
+			int i, len =3D dc->x0 - dc->color + 1;
 			u8 __user *colors =3D (u8 __user *)dc->data;
 			u8 r, g =3D 0, b =3D 0, blend =3D 0;

@@ -1097,7 +1097,7 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 		break;
 	case OSD_SetPixel:
 		ret =3D DrawLine(av7110, av7110->osdwin,
-			 dc->x0, dc->y0, 0, 0, dc->color);
+			       dc->x0, dc->y0, 0, 0, dc->color);
 		break;
 	case OSD_SetRow:
 		dc->y1 =3D dc->y0;
@@ -1107,15 +1107,15 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_=
t *dc)
 		break;
 	case OSD_FillRow:
 		ret =3D DrawBlock(av7110, av7110->osdwin, dc->x0, dc->y0,
-			  dc->x1-dc->x0+1, dc->y1, dc->color);
+				dc->x1 - dc->x0 + 1, dc->y1, dc->color);
 		break;
 	case OSD_FillBlock:
 		ret =3D DrawBlock(av7110, av7110->osdwin, dc->x0, dc->y0,
-			  dc->x1 - dc->x0 + 1, dc->y1 - dc->y0 + 1, dc->color);
+				dc->x1 - dc->x0 + 1, dc->y1 - dc->y0 + 1, dc->color);
 		break;
 	case OSD_Line:
 		ret =3D DrawLine(av7110, av7110->osdwin,
-			 dc->x0, dc->y0, dc->x1 - dc->x0, dc->y1 - dc->y0, dc->color);
+			       dc->x0, dc->y0, dc->x1 - dc->x0, dc->y1 - dc->y0, dc->color);
 		break;
 	case OSD_Text:
 	{
@@ -1129,7 +1129,7 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 		if (dc->x1 > 3)
 			dc->x1 =3D 3;
 		ret =3D SetFont(av7110, av7110->osdwin, dc->x1,
-			(u16) (dc->color & 0xffff), (u16) (dc->color >> 16));
+			      (u16)(dc->color & 0xffff), (u16)(dc->color >> 16));
 		if (!ret)
 			ret =3D FlushText(av7110);
 		if (!ret)
@@ -1159,7 +1159,7 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 		else
 			av7110->osdbpp[av7110->osdwin] =3D 0;
 		ret =3D CreateOSDWindow(av7110, av7110->osdwin, (osd_raw_window_t)dc->c=
olor,
-				dc->x1 - dc->x0 + 1, dc->y1 - dc->y0 + 1);
+				      dc->x1 - dc->x0 + 1, dc->y1 - dc->y0 + 1);
 		if (ret)
 			break;
 		if (!dc->data) {
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/me=
dia/av7110/av7110_hw.h
index 39488c2fc..3d0afae7f 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -11,7 +11,7 @@
 #define DEBISWAP   0x002e0000

 #define ARM_WAIT_FREE  (HZ)
-#define ARM_WAIT_SHAKE (HZ/5)
+#define ARM_WAIT_SHAKE (HZ / 5)
 #define ARM_WAIT_OSD (HZ)

 enum av7110_bootstate {
@@ -311,13 +311,13 @@ enum av7110_command_type {
 #define DATA_BUFF0_BASE	(DPRAM_BASE + 0x200)
 #define DATA_BUFF0_SIZE	0x0800

-#define DATA_BUFF1_BASE	(DATA_BUFF0_BASE+DATA_BUFF0_SIZE)
+#define DATA_BUFF1_BASE	(DATA_BUFF0_BASE + DATA_BUFF0_SIZE)
 #define DATA_BUFF1_SIZE	0x0800

-#define DATA_BUFF2_BASE	(DATA_BUFF1_BASE+DATA_BUFF1_SIZE)
+#define DATA_BUFF2_BASE	(DATA_BUFF1_BASE + DATA_BUFF1_SIZE)
 #define DATA_BUFF2_SIZE	0x0800

-#define DATA_BUFF3_BASE (DATA_BUFF2_BASE+DATA_BUFF2_SIZE)
+#define DATA_BUFF3_BASE (DATA_BUFF2_BASE + DATA_BUFF2_SIZE)
 #define DATA_BUFF3_SIZE 0x0400

 #define Reserved	(DPRAM_BASE + 0x1E00)
@@ -393,7 +393,7 @@ static inline u32 irdebi(struct av7110 *av7110, u32 co=
nfig, int addr, u32 val, u

 	res =3D av7110_debiread(av7110, config, addr, count);
 	if (count <=3D 4)
-		memcpy(av7110->debi_virt, (char *) &res, count);
+		memcpy(av7110->debi_virt, (char *)&res, count);
 	return res;
 }

@@ -456,14 +456,14 @@ static inline int av7710_set_video_mode(struct av711=
0 *av7110, int mode)
 static inline int vidcom(struct av7110 *av7110, u32 com, u32 arg)
 {
 	return av7110_fw_cmd(av7110, COMTYPE_MISC, AV7110_FW_VIDEO_COMMAND, 4,
-			     (com>>16), (com&0xffff),
-			     (arg>>16), (arg&0xffff));
+			     (com >> 16), (com & 0xffff),
+			     (arg >> 16), (arg & 0xffff));
 }

 static inline int audcom(struct av7110 *av7110, u32 com)
 {
 	return av7110_fw_cmd(av7110, COMTYPE_MISC, AV7110_FW_AUDIO_COMMAND, 2,
-			     (com>>16), (com&0xffff));
+			     (com >> 16), (com & 0xffff));
 }

 static inline int Set22K(struct av7110 *av7110, int state)
diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging=
/media/av7110/av7110_ipack.c
index ac00bff44..9fe18f470 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -59,7 +59,7 @@ static void send_ipack(struct ipack *p)
 			streamid =3D p->buf[off];
 			if ((streamid & 0xf8) =3D=3D 0x80) {
 				ai.off =3D 0;
-				ac3_off =3D ((p->buf[off + 2] << 8)|
+				ac3_off =3D ((p->buf[off + 2] << 8) |
 					   p->buf[off + 3]);
 				if (ac3_off < p->count)
 					f =3D dvb_filter_get_ac3info(p->buf + off + 3 + ac3_off,
@@ -124,12 +124,12 @@ static void write_ipack(struct ipack *p, const u8 *d=
ata, int count)
 	}

 	if (p->count + count < p->size) {
-		memcpy(p->buf+p->count, data, count);
+		memcpy(p->buf + p->count, data, count);
 		p->count +=3D count;
 	} else {
 		int rest =3D p->size - p->count;

-		memcpy(p->buf+p->count, data, rest);
+		memcpy(p->buf + p->count, data, rest);
 		p->count +=3D rest;
 		send_ipack(p);
 		if (count - rest > 0)
@@ -191,7 +191,7 @@ int av7110_ipack_instant_repack(const u8 *buf, int cou=
nt, struct ipack *p)
 			break;

 		case 4:
-			if (count-c > 1) {
+			if (count - c > 1) {
 				p->plen[0] =3D buf[c];
 				c++;
 				p->plen[1] =3D buf[c];
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index 202a05561..3090efb00 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -86,7 +86,7 @@ static struct v4l2_input inputs[4] =3D {
 		.type		=3D V4L2_INPUT_TYPE_CAMERA,
 		.audioset	=3D 1,
 		.tuner		=3D 0, /* ignored */
-		.std		=3D V4L2_STD_PAL_BG|V4L2_STD_NTSC_M,
+		.std		=3D V4L2_STD_PAL_BG | V4L2_STD_NTSC_M,
 		.status		=3D 0,
 		.capabilities	=3D V4L2_IN_CAP_STD,
 	}, {
@@ -95,7 +95,7 @@ static struct v4l2_input inputs[4] =3D {
 		.type		=3D V4L2_INPUT_TYPE_TUNER,
 		.audioset	=3D 1,
 		.tuner		=3D 0,
-		.std		=3D V4L2_STD_PAL_BG|V4L2_STD_NTSC_M,
+		.std		=3D V4L2_STD_PAL_BG | V4L2_STD_NTSC_M,
 		.status		=3D 0,
 		.capabilities	=3D V4L2_IN_CAP_STD,
 	}, {
@@ -104,7 +104,7 @@ static struct v4l2_input inputs[4] =3D {
 		.type		=3D V4L2_INPUT_TYPE_CAMERA,
 		.audioset	=3D 0,
 		.tuner		=3D 0,
-		.std		=3D V4L2_STD_PAL_BG|V4L2_STD_NTSC_M,
+		.std		=3D V4L2_STD_PAL_BG | V4L2_STD_NTSC_M,
 		.status		=3D 0,
 		.capabilities	=3D V4L2_IN_CAP_STD,
 	}, {
@@ -113,7 +113,7 @@ static struct v4l2_input inputs[4] =3D {
 		.type		=3D V4L2_INPUT_TYPE_CAMERA,
 		.audioset	=3D 0,
 		.tuner		=3D 0,
-		.std		=3D V4L2_STD_PAL_BG|V4L2_STD_NTSC_M,
+		.std		=3D V4L2_STD_PAL_BG | V4L2_STD_NTSC_M,
 		.status		=3D 0,
 		.capabilities	=3D V4L2_IN_CAP_STD,
 	}
@@ -529,7 +529,7 @@ static int vidioc_s_audio(struct file *file, void *fh,=
 const struct v4l2_audio *
 }

 static int vidioc_g_sliced_vbi_cap(struct file *file, void *fh,
-					struct v4l2_sliced_vbi_cap *cap)
+				   struct v4l2_sliced_vbi_cap *cap)
 {
 	struct saa7146_dev *dev =3D video_drvdata(file);
 	struct av7110 *av7110 =3D (struct av7110 *)dev->ext_priv;
@@ -545,7 +545,7 @@ static int vidioc_g_sliced_vbi_cap(struct file *file, =
void *fh,
 }

 static int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh,
-					struct v4l2_format *f)
+				       struct v4l2_format *f)
 {
 	struct saa7146_dev *dev =3D video_drvdata(file);
 	struct av7110 *av7110 =3D (struct av7110 *)dev->ext_priv;
@@ -584,7 +584,7 @@ static int vidioc_try_fmt_sliced_vbi_out(struct file *=
file, void *fh,
 }

 static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
-					struct v4l2_format *f)
+				       struct v4l2_format *f)
 {
 	struct saa7146_dev *dev =3D video_drvdata(file);
 	struct av7110 *av7110 =3D (struct av7110 *)dev->ext_priv;
diff --git a/drivers/staging/media/av7110/dvb_filter.c b/drivers/staging/m=
edia/av7110/dvb_filter.c
index 4c41682ff..515b4288b 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.c
+++ b/drivers/staging/media/av7110/dvb_filter.c
@@ -29,7 +29,7 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct d=
vb_audio_info *ai, int p
 	int fr =3D 0;

 	while (!found  && c < count) {
-		u8 *b =3D mbuf+c;
+		u8 *b =3D mbuf + c;

 		if (b[0] =3D=3D 0x0b &&  b[1] =3D=3D 0x77)
 			found =3D 1;
@@ -48,17 +48,17 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct=
 dvb_audio_info *ai, int p
 		return -1;

 	ai->layer =3D 0;  // 0 for AC3
-	headr =3D mbuf+c+2;
+	headr =3D mbuf + c + 2;

-	frame =3D (headr[2]&0x3f);
-	ai->bit_rate =3D ac3_bitrates[frame >> 1]*1000;
+	frame =3D (headr[2] & 0x3f);
+	ai->bit_rate =3D ac3_bitrates[frame >> 1] * 1000;

 	if (pr)
 		printk(KERN_CONT "  BRate: %d kb/s", (int) ai->bit_rate/1000);

 	ai->frequency =3D (headr[2] & 0xc0) >> 6;
 	fr =3D (headr[2] & 0xc0) >> 6;
-	ai->frequency =3D freq[fr]*100;
+	ai->frequency =3D freq[fr] * 100;
 	if (pr)
 		printk(KERN_CONT "  Freq: %d Hz\n", (int) ai->frequency);

@@ -99,7 +99,7 @@ int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts, un=
signed char *pes,
 		buf[1] &=3D ~0x40;
 	while (len >=3D 184) {
 		buf[3] =3D 0x10 | ((p2ts->cc++) & 0x0f);
-		memcpy(buf+4, pes, 184);
+		memcpy(buf + 4, pes, 184);
 		if ((ret=3Dp2ts->cb(p2ts->priv, buf)))
 			return ret;
 		len -=3D 184; pes +=3D 184;
@@ -111,10 +111,10 @@ int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts=
, unsigned char *pes,
 	rest =3D 183 - len;
 	if (rest) {
 		buf[5] =3D 0x00;
-		if (rest-1)
-			memset(buf+6, 0xff, rest-1);
+		if (rest - 1)
+			memset(buf + 6, 0xff, rest - 1);
 	}
 	buf[4] =3D rest;
-	memcpy(buf+5+rest, pes, len);
+	memcpy(buf + 5 + rest, pes, len);
 	return p2ts->cb(p2ts->priv, buf);
 }
diff --git a/drivers/staging/media/av7110/dvb_filter.h b/drivers/staging/m=
edia/av7110/dvb_filter.h
index 43a36d653..471b53058 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.h
+++ b/drivers/staging/media/av7110/dvb_filter.h
@@ -21,7 +21,7 @@

 #include <media/demux.h>

-typedef int (dvb_filter_pes2ts_cb_t) (void *, unsigned char *);
+typedef int (dvb_filter_pes2ts_cb_t)(void *, unsigned char *);

 struct dvb_filter_pes2ts {
 	unsigned char buf[188];
@@ -118,7 +118,7 @@ int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts, =
unsigned char *pes,
 #define SEAM_SPLICE    0x20

 #define MAX_PLENGTH 0xFFFF
-#define MMAX_PLENGTH (256*MAX_PLENGTH)
+#define MMAX_PLENGTH (256 * MAX_PLENGTH)

 #ifndef IPACKS
 #define IPACKS 2048
=2D-
2.34.0


