Return-Path: <linux-media+bounces-10950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA51A8BD89B
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D341F24518
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E038BE4B;
	Tue,  7 May 2024 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="mjuyOFqA"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF158BFC
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041535; cv=none; b=dQMtbUYDPAT4tfoqi5gwzET67UADS5V+DEGJcvoquFNzbx5trnnLHpLBqw7f4hsM8fshQevs8FXh/5pVOm/dSAzdJTJ2Bm2SURJko9Z6UBoocZzQAW4spzjOzSd7zXh+z8thRRF5Bo0uKdwi4kqo+1WLBmvjSMXYKe0EYN7r6PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041535; c=relaxed/simple;
	bh=I8TxJjNCETSsBVpJ65jtjuybTu7nERT4l7UdDvUrI8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uihXH624DCcuAgORd2Goua0zu2SuB7BVDvdirmfNWN93aqepmmrHzM1KQYR/w9Y+FEz+kWL8/IgsMUPx/3H4WpWIEtdXNUlLW7mlbVkqzwSS5IUN0R6+ruMc/Bk7bF+xA+vhp9OWd0egAQZC/E0qpA+wRsmu6LcIWo+nF1R+9Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=mjuyOFqA; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041527; x=1715646327; i=herdler@nurfuerspam.de;
	bh=zV/qmPdsP2DbUbiQYAHvl2u+HAw/MXdAfBkPdoZElN0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mjuyOFqAcoP3jH+PzF+rV9OM8wr8lktja6nNPs5Gvy0HPcERwvWqqywauYcrptPy
	 hbfHkrvFl5/CG4M0GPz/5ic4j3lCq+UCu4ZWoF3BWIPdv8AKxwozfJo15lq5DHw0V
	 UfG/aj/MIM8oyYQWsKlj7iMfJSrE3mGpewU/09UdRmcBQHQRMiVRX2qz6tdAUNBmB
	 sciaZz0GeqzczMTvOGEnSWYVTGA14gb1oNP0BDkdWwr3VdVWke8Wq31KQV4SXttKr
	 X8nyd0+EwMyj2ioV0uUiKMhGR9Dp56yCz+oA2cSSKv1cj/sgULe7q9Ya5q50BYdME
	 3ciGtQeVDMgeEHaMrg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5eX-1sMURW0TBd-00J4XS; Tue, 07
 May 2024 02:25:27 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 08/21] media: av7110: coding style fixes: blank lines
Date: Tue,  7 May 2024 02:24:47 +0200
Message-Id: <20240507002500.81867-9-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:gSDx61GeCF+1Z5rI693OH3T82aZPNwR504882wb1/HH+//YOX4M
 ENQ0O6meB/l89hNWz6I01U+59kLon5kaIuL1Ea0+jtvZSsJgrhyP8rXq1iWNm2Lm3KO3VUE
 262KEz07Gpk00JB33g2N7N9EhrBMlg8TRjaOD7l9AjJFDCgKt5su39Ok5cHu+flEO3I7f4F
 RbjZGEJuUhIRBx27SzWnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cv+vcQ0sNpQ=;0SHcXsUFUKoOqisyGel2w+t5dxS
 CXGlAfc6Xkus5dQv/D6ZytO7f7WJ4pNh1sOSUllvSgiWFxUp23BvNhsFT/VztCiDcfD0h05BH
 cDYF17HWBdCgC3DcznBL+v5YZzIVkF/GGvDXEPihrjdMRifiChWpAgP3ug8dZ9H1RrGRXA9yI
 LLkK8bB3n5FgRLed/4UrqY/q48n/0jrPEihXr4g2F0ulgTeshGNflqbuanJbzKDMTCwTaFVpY
 fCXJf8eiCZdF/JBfEqjfuMXtuk0n+7MGbiWvCJENZNvLOuSF9CIv2nWt9EgzGPqpJBAV9pPkM
 M+AM9omVvvGBbhvXdFsNTMUjH/54YJ8PjppKWJa5I/WnLMflrFNS1EN/wf9seazworgSbLmwX
 t9F0h8+1iNlhS+owQHUl2ny87+ACyFOhpRjezinlQi9HjXIlfazFwFKmPSWaRhAJQU3nu8oRe
 dIdAlcde9hxXr3Z7VezUGfqcKNtSO11yhp1ON6qPXECjG2SOlcMpi3QncNx5sZPPhGFs1tonb
 CzxNVaK/xqi2ikcPwhuUcbGV7nHcz/njvohWELLZAi4KinZvIuJ+o2FyjSnWFojIhFE2QSbuV
 HpAaZxDKwTTue20mwYR/s1Zu3qloRJmfvaqan68O1MhCqd4vGoPweV7CFkgf79dnF+A2m0Dx/
 YCHOsmj6ZuZiolswN/ryn8i+Wg112pvP6hi3JuNTo1S+3w4Ee4V1pApN8G7Uyq2t2T/NmNKcd
 KZDI6q9XcTwtICHUOZX26lAcEJjnk2rq8/8pyCrjDl9tUsMQtCmIuWQPwNdxRIqB+D8g2Zb7x
 kiC8o4f8w4UY/6oi7D9FmOWali7ZQAdwwRn7HI8BvLbRM=

This patch fixes the following checkpatch warnings:

CHECK:LINE_SPACING: Please don't use multiple blank lines
CHECK:LINE_SPACING: Please use a blank line after function/struct/union/en=
um declarations
CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
WARNING:LINE_SPACING: Missing a blank line after declarations

Added or removed blank lines only.
"git diff --ignore-blank-lines" shows no changes.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c       | 55 ++++++---------------
 drivers/staging/media/av7110/av7110.h       | 10 ----
 drivers/staging/media/av7110/av7110_av.c    | 33 +++++--------
 drivers/staging/media/av7110/av7110_av.h    |  1 -
 drivers/staging/media/av7110/av7110_ca.c    |  4 --
 drivers/staging/media/av7110/av7110_hw.c    | 10 ++--
 drivers/staging/media/av7110/av7110_hw.h    | 12 -----
 drivers/staging/media/av7110/av7110_ipack.c | 11 +----
 drivers/staging/media/av7110/av7110_v4l.c   |  7 +--
 drivers/staging/media/av7110/dvb_filter.h   |  4 --
 10 files changed, 33 insertions(+), 114 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index eb1dc64bc..b19c27f6e 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -12,7 +12,6 @@
  * the project's page is at https://linuxtv.org
  */

-
 #include <linux/module.h>
 #include <linux/kmod.h>
 #include <linux/delay.h>
@@ -36,7 +35,6 @@
 #include <asm/unaligned.h>
 #include <asm/byteorder.h>

-
 #include <linux/dvb/frontend.h>

 #include <media/dvb_frontend.h>
@@ -57,7 +55,6 @@
 #define TS_BUFLEN (TS_WIDTH*TS_HEIGHT)
 #define TS_MAX_PACKETS (TS_BUFLEN/TS_SIZE)

-
 int av7110_debug;

 static int vidmode =3D CVBS_RGB_OUT;
@@ -113,7 +110,6 @@ static int av7110_num;
 	} \
 }

-
 static void init_av7110_av(struct av7110 *av7110)
 {
 	int ret;
@@ -273,7 +269,6 @@ static int arm_thread(void *data)
 	return 0;
 }

-
 /************************************************************************=
****
  * IRQ handling
  ************************************************************************=
****/
@@ -325,12 +320,12 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t =
buffer1_len,
 	}
 }

-
 //#define DEBUG_TIMING
 static inline void print_time(char *s)
 {
 #ifdef DEBUG_TIMING
 	struct timespec64 ts;
+
 	ktime_get_real_ts64(&ts);
 	printk("%s: %lld.%09ld\n", s, (s64)ts.tv_sec, ts.tv_nsec);
 #endif
@@ -376,7 +371,6 @@ static void debiirq(struct tasklet_struct *t)
 	av7110->debitype =3D -1;

 	switch (type & 0xff) {
-
 	case DATA_TS_RECORD:
 		dvb_dmx_swfilter_packets(&av7110->demux,
 					 (const u8 *) av7110->debi_virt,
@@ -410,6 +404,7 @@ static void debiirq(struct tasklet_struct *t)

 		if (data_0 < 2 && data[2] =3D=3D 0xff) {
 			int flags =3D 0;
+
 			if (data[5] > 0)
 				flags |=3D CA_CI_MODULE_PRESENT;
 			if (data[5] > 5)
@@ -489,7 +484,6 @@ static void gpioirq(struct tasklet_struct *t)
 	dprintk(8, "GPIO0 irq 0x%04x %d\n", av7110->debitype, av7110->debilen);

 	switch (av7110->debitype & 0xff) {
-
 	case DATA_TS_PLAY:
 	case DATA_PES_PLAY:
 		break;
@@ -674,7 +668,6 @@ static void gpioirq(struct tasklet_struct *t)
 	spin_unlock(&av7110->debilock);
 }

-
 #ifdef CONFIG_DVB_AV7110_OSD
 static int dvb_osd_ioctl(struct file *file,
 			 unsigned int cmd, void *parg)
@@ -692,7 +685,6 @@ static int dvb_osd_ioctl(struct file *file,
 	return -EINVAL;
 }

-
 static const struct file_operations dvb_osd_fops =3D {
 	.owner		=3D THIS_MODULE,
 	.unlocked_ioctl	=3D dvb_generic_ioctl,
@@ -710,7 +702,6 @@ static struct dvb_device dvbdev_osd =3D {
 };
 #endif /* CONFIG_DVB_AV7110_OSD */

-
 static inline int SetPIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 =
ttpid,
 			  u16 subpid, u16 pcrpid)
 {
@@ -738,6 +729,7 @@ int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 ap=
id, u16 ttpid,
 		u16 subpid, u16 pcrpid)
 {
 	int ret =3D 0;
+
 	dprintk(4, "%p\n", av7110);

 	if (mutex_lock_interruptible(&av7110->pid_mutex))
@@ -763,7 +755,6 @@ int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 ap=
id, u16 ttpid,
 	return ret;
 }

-
 /************************************************************************=
******
  * hardware filter functions
  ************************************************************************=
******/
@@ -856,7 +847,6 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdm=
xfilter)
 	return ret;
 }

-
 static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 {
 	struct dvb_demux *dvbdmx =3D dvbdmxfeed->demux;
@@ -1008,12 +998,12 @@ static int av7110_start_feed(struct dvb_demux_feed =
*feed)
 	return ret;
 }

-
 static int av7110_stop_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux =3D feed->demux;
 	struct av7110 *av7110 =3D demux->priv;
 	int i, rc, ret =3D 0;
+
 	dprintk(4, "%p\n", av7110);

 	if (feed->type =3D=3D DMX_TYPE_TS) {
@@ -1056,7 +1046,6 @@ static int av7110_stop_feed(struct dvb_demux_feed *f=
eed)
 	return ret;
 }

-
 static void restart_feeds(struct av7110 *av7110)
 {
 	struct dvb_demux *dvbdmx =3D &av7110->demux;
@@ -1135,12 +1124,10 @@ static int dvb_get_stc(struct dmx_demux *demux, un=
signed int num,
 	return 0;
 }

-
 /************************************************************************=
******
  * SEC device file operations
  ************************************************************************=
******/

-
 static int av7110_set_tone(struct dvb_frontend *fe, enum fe_sec_tone_mode=
 tone)
 {
 	struct av7110 *av7110 =3D fe->dvb->priv;
@@ -1365,7 +1352,6 @@ static int av7110_register(struct av7110 *av7110)
 	return 0;
 }

-
 static void dvb_unregister(struct av7110 *av7110)
 {
 	struct dvb_demux *dvbdemux =3D &av7110->demux;
@@ -1401,7 +1387,6 @@ static void dvb_unregister(struct av7110 *av7110)
 	av7110_ca_unregister(av7110);
 }

-
 /************************************************************************=
****
  * I2C client commands
  ************************************************************************=
****/
@@ -1439,7 +1424,6 @@ u8 i2c_readreg(struct av7110 *av7110, u8 id, u8 reg)
  * INITIALIZATION
  ************************************************************************=
****/

-
 static int check_firmware(struct av7110 *av7110)
 {
 	u32 crc =3D 0, len =3D 0;
@@ -1609,9 +1593,6 @@ static struct ves1820_config alps_tdbe2_config =3D {
 	.selagc =3D VES1820_SELAGC_SIGNAMPERR,
 };

-
-
-
 static int grundig_29504_451_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
@@ -1637,8 +1618,6 @@ static struct tda8083_config grundig_29504_451_confi=
g =3D {
 	.demod_address =3D 0x68,
 };

-
-
 static int philips_cd1516_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
@@ -1669,8 +1648,6 @@ static struct ves1820_config philips_cd1516_config =
=3D {
 	.selagc =3D VES1820_SELAGC_SIGNAMPERR,
 };

-
-
 static int alps_tdlb7_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
@@ -1710,12 +1687,10 @@ static int alps_tdlb7_request_firmware(struct dvb_=
frontend *fe, const struct fir
 }

 static const struct sp8870_config alps_tdlb7_config =3D {
-
 	.demod_address =3D 0x71,
 	.request_firmware =3D alps_tdlb7_request_firmware,
 };

-
 static u8 nexusca_stv0297_inittab[] =3D {
 	0x80, 0x01,
 	0x80, 0x00,
@@ -1856,15 +1831,12 @@ static int nexusca_stv0297_tuner_set_params(struct=
 dvb_frontend *fe)
 }

 static struct stv0297_config nexusca_stv0297_config =3D {
-
 	.demod_address =3D 0x1C,
 	.inittab =3D nexusca_stv0297_inittab,
 	.invert =3D 1,
 	.stop_during_read =3D 1,
 };

-
-
 static int grundig_29504_401_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
@@ -1911,8 +1883,6 @@ static struct l64781_config grundig_29504_401_config=
 =3D {
 	.demod_address =3D 0x55,
 };

-
-
 static int av7110_fe_lock_fix(struct av7110 *av7110, enum fe_status statu=
s)
 {
 	int ret =3D 0;
@@ -1959,6 +1929,7 @@ static int av7110_fe_set_frontend(struct dvb_fronten=
d *fe)
 	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
+
 	if (!ret)
 		ret =3D av7110->fe_set_frontend(fe);

@@ -1970,6 +1941,7 @@ static int av7110_fe_init(struct dvb_frontend *fe)
 	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
+
 	if (!ret)
 		ret =3D av7110->fe_init(fe);
 	return ret;
@@ -1982,6 +1954,7 @@ static int av7110_fe_read_status(struct dvb_frontend=
 *fe,

 	/* call the real implementation */
 	int ret =3D av7110->fe_read_status(fe, status);
+
 	if (!ret)
 		if (((*status ^ av7110->fe_status) & FE_HAS_LOCK) && (*status & FE_HAS_=
LOCK))
 			ret =3D av7110_fe_lock_fix(av7110, *status);
@@ -1993,6 +1966,7 @@ static int av7110_fe_diseqc_reset_overload(struct dv=
b_frontend *fe)
 	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
+
 	if (!ret)
 		ret =3D av7110->fe_diseqc_reset_overload(fe);
 	return ret;
@@ -2004,6 +1978,7 @@ static int av7110_fe_diseqc_send_master_cmd(struct d=
vb_frontend *fe,
 	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
+
 	if (!ret) {
 		av7110->saved_master_cmd =3D *cmd;
 		ret =3D av7110->fe_diseqc_send_master_cmd(fe, cmd);
@@ -2017,6 +1992,7 @@ static int av7110_fe_diseqc_send_burst(struct dvb_fr=
ontend *fe,
 	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
+
 	if (!ret) {
 		av7110->saved_minicmd =3D minicmd;
 		ret =3D av7110->fe_diseqc_send_burst(fe, minicmd);
@@ -2030,6 +2006,7 @@ static int av7110_fe_set_tone(struct dvb_frontend *f=
e,
 	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
+
 	if (!ret) {
 		av7110->saved_tone =3D tone;
 		ret =3D av7110->fe_set_tone(fe, tone);
@@ -2043,6 +2020,7 @@ static int av7110_fe_set_voltage(struct dvb_frontend=
 *fe,
 	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
+
 	if (!ret) {
 		av7110->saved_voltage =3D voltage;
 		ret =3D av7110->fe_set_voltage(fe, voltage);
@@ -2055,6 +2033,7 @@ static int av7110_fe_dishnetwork_send_legacy_command=
(struct dvb_frontend *fe, un
 	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
+
 	if (!ret)
 		ret =3D av7110->fe_dishnetwork_send_legacy_command(fe, cmd);
 	return ret;
@@ -2490,6 +2469,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 	/* check for full-ts flag in eeprom */
 	if (i2c_readreg(av7110, 0xaa, 0) =3D=3D 0x4f && i2c_readreg(av7110, 0xaa=
, 1) =3D=3D 0x45) {
 		u8 flags =3D i2c_readreg(av7110, 0xaa, 2);
+
 		if (flags !=3D 0xff && (flags & 0x01))
 			av7110->full_ts =3D true;
 	}
@@ -2645,7 +2625,6 @@ static int av7110_attach(struct saa7146_dev *dev,
 	if (!av7110->debi_virt)
 		goto err_saa71466_vfree_4;

-
 	av7110->iobuf =3D vmalloc(AVOUTLEN+AOUTLEN+BMPLEN+4*IPACKS);
 	if (!av7110->iobuf)
 		goto err_pci_free_5;
@@ -2749,6 +2728,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 static int av7110_detach(struct saa7146_dev *saa)
 {
 	struct av7110 *av7110 =3D saa->ext_priv;
+
 	dprintk(4, "%p\n", av7110);

 #if IS_ENABLED(CONFIG_DVB_AV7110_IR)
@@ -2802,7 +2782,6 @@ static int av7110_detach(struct saa7146_dev *saa)
 	return 0;
 }

-
 static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
 {
 	struct av7110 *av7110 =3D dev->ext_priv;
@@ -2844,7 +2823,6 @@ static void av7110_irq(struct saa7146_dev *dev, u32 =
*isr)
 		tasklet_schedule(&av7110->vpe_tasklet);
 }

-
 static struct saa7146_extension av7110_extension_driver;

 #define MAKE_AV7110_INFO(x_var,x_name) \
@@ -2887,7 +2865,6 @@ static const struct pci_device_id pci_tbl[] =3D {

 MODULE_DEVICE_TABLE(pci, pci_tbl);

-
 static struct saa7146_extension av7110_extension_driver =3D {
 	.name		=3D "av7110",
 	.flags		=3D SAA7146_USE_I2C_IRQ,
@@ -2901,13 +2878,11 @@ static struct saa7146_extension av7110_extension_d=
river =3D {
 	.irq_func	=3D av7110_irq,
 };

-
 static int __init av7110_init(void)
 {
 	return saa7146_register_extension(&av7110_extension_driver);
 }

-
 static void __exit av7110_exit(void)
 {
 	saa7146_unregister_extension(&av7110_extension_driver);
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media=
/av7110/av7110.h
index e251f989e..2290300ae 100644
=2D-- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -35,7 +35,6 @@

 #include <media/drv-intf/saa7146_vv.h>

-
 #define ANALOG_TUNER_VES1820 1
 #define ANALOG_TUNER_STV0297 2

@@ -76,7 +75,6 @@ struct dvb_video_events {
 	spinlock_t		  lock;
 };

-
 struct av7110;

 /* infrared remote control */
@@ -88,7 +86,6 @@ struct infrared {

 /* place to store all the necessary device information */
 struct av7110 {
-
 	/* devices */

 	struct dvb_device	dvb_dev;
@@ -118,7 +115,6 @@ struct av7110 {
 #define DVB_ADAC_MSP34x5  3
 #define DVB_ADAC_NONE	 -1

-
 	/* buffers */

 	void		       *iobuf;	 /* memory for all buffers */
@@ -139,7 +135,6 @@ struct av7110 {
 #define BMP_LOADED   2
 	wait_queue_head_t	bmpq;

-
 	/* DEBI and polled command interface */

 	spinlock_t		debilock;
@@ -147,7 +142,6 @@ struct av7110 {
 	volatile int		debitype;
 	volatile int		debilen;

-
 	/* Recording and playback flags */

 	int			rec_mode;
@@ -157,7 +151,6 @@ struct av7110 {
 #define RP_AUDIO 2
 #define RP_AV	 3

-
 	/* OSD */

 	int			osdwin;      /* currently active window */
@@ -213,7 +206,6 @@ struct av7110 {
 	int arm_errors;
 	int registered;

-
 	/* AV711X */

 	u32		    arm_fw;
@@ -288,7 +280,6 @@ struct av7110 {
 	int (*fe_set_frontend)(struct dvb_frontend *fe);
 };

-
 extern int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpi=
d,
 		       u16 subpid, u16 pcrpid);

@@ -307,7 +298,6 @@ extern int i2c_writereg(struct av7110 *av7110, u8 id, =
u8 reg, u8 val);
 extern u8 i2c_readreg(struct av7110 *av7110, u8 id, u8 reg);
 extern int msp_writereg(struct av7110 *av7110, u8 dev, u16 reg, u16 val);

-
 extern int av7110_init_analog_module(struct av7110 *av7110);
 extern int av7110_init_v4l(struct av7110 *av7110);
 extern int av7110_exit_v4l(struct av7110 *av7110);
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index 00dd6a7fe..96309a896 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -70,12 +70,10 @@
 #define PIECE_RATE	 0x40
 #define SEAM_SPLICE	 0x20

-
 static void p_to_t(u8 const *buf, long int length, u16 pid,
 		   u8 *counter, struct dvb_demux_feed *feed);
 static int write_ts_to_decoder(struct av7110 *av7110, int type, const u8 =
*buf, size_t len);

-
 int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *buf, size_t len)
 {
 	struct dvb_demux_feed *dvbdmxfeed =3D p2t->priv;
@@ -149,6 +147,7 @@ int av7110_av_start_record(struct av7110 *av7110, int =
av,
 int av7110_av_start_play(struct av7110 *av7110, int av)
 {
 	int ret =3D 0;
+
 	dprintk(2, "av7110:%p, \n", av7110);

 	if (av7110->rec_mode)
@@ -183,6 +182,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av=
)
 int av7110_av_stop(struct av7110 *av7110, int av)
 {
 	int ret =3D 0;
+
 	dprintk(2, "av7110:%p, \n", av7110);

 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
@@ -217,7 +217,6 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 	return ret;
 }

-
 int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen)
 {
 	int len;
@@ -263,7 +262,6 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer =
*buf, int dlen)
 	return blen;
 }

-
 int av7110_set_volume(struct av7110 *av7110, unsigned int volleft,
 		      unsigned int volright)
 {
@@ -320,6 +318,7 @@ int av7110_set_volume(struct av7110 *av7110, unsigned =
int volleft,
 int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode=
)
 {
 	int ret;
+
 	dprintk(2, "av7110:%p, \n", av7110);

 	ret =3D av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
@@ -335,7 +334,6 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7=
110_video_mode mode)
 	return ret;
 }

-
 static enum av7110_video_mode sw2mode[16] =3D {
 	AV7110_VIDEO_MODE_PAL, AV7110_VIDEO_MODE_NTSC,
 	AV7110_VIDEO_MODE_NTSC, AV7110_VIDEO_MODE_PAL,
@@ -377,7 +375,6 @@ static int get_video_format(struct av7110 *av7110, u8 =
*buf, int count)
 	return ret;
 }

-
 /************************************************************************=
****
  * I/O buffer management and control
  ************************************************************************=
****/
@@ -408,6 +405,7 @@ static inline long aux_ring_buffer_write(struct dvb_ri=
ngbuffer *rbuf,
 static void play_video_cb(u8 *buf, int count, void *priv)
 {
 	struct av7110 *av7110 =3D (struct av7110 *) priv;
+
 	dprintk(2, "av7110:%p, \n", av7110);

 	if ((buf[3] & 0xe0) =3D=3D 0xe0) {
@@ -420,12 +418,12 @@ static void play_video_cb(u8 *buf, int count, void *=
priv)
 static void play_audio_cb(u8 *buf, int count, void *priv)
 {
 	struct av7110 *av7110 =3D (struct av7110 *) priv;
+
 	dprintk(2, "av7110:%p, \n", av7110);

 	aux_ring_buffer_write(&av7110->aout, buf, count);
 }

-
 #define FREE_COND_TS (dvb_ringbuffer_free(rb) >=3D 4096)

 static ssize_t ts_play(struct av7110 *av7110, const char __user *buf,
@@ -463,7 +461,6 @@ static ssize_t ts_play(struct av7110 *av7110, const ch=
ar __user *buf,
 	return count - todo;
 }

-
 #define FREE_COND (dvb_ringbuffer_free(&av7110->avout) >=3D 20 * 1024 && =
\
 		   dvb_ringbuffer_free(&av7110->aout) >=3D 20 * 1024)

@@ -471,6 +468,7 @@ static ssize_t dvb_play(struct av7110 *av7110, const c=
har __user *buf,
 			unsigned long count, int nonblock, int type)
 {
 	unsigned long todo =3D count, n;
+
 	dprintk(2, "av7110:%p, \n", av7110);

 	if (!av7110->kbuf[type])
@@ -504,6 +502,7 @@ static ssize_t dvb_play_kernel(struct av7110 *av7110, =
const u8 *buf,
 			unsigned long count, int nonblock, int type)
 {
 	unsigned long todo =3D count, n;
+
 	dprintk(2, "av7110:%p, \n", av7110);

 	if (!av7110->kbuf[type])
@@ -534,6 +533,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const =
char __user *buf,
 			 unsigned long count, int nonblock, int type)
 {
 	unsigned long todo =3D count, n;
+
 	dprintk(2, "av7110:%p, \n", av7110);

 	if (!av7110->kbuf[type])
@@ -580,7 +580,6 @@ static void clear_p2t(struct av7110_p2t *p)
 	p->frags =3D 0;
 }

-
 static int find_pes_header(u8 const *buf, long int length, int *frags)
 {
 	int c =3D 0;
@@ -723,7 +722,6 @@ void av7110_p2t_write(u8 const *buf, long int length, =
u16 pid, struct av7110_p2t
 	}
 }

-
 static int write_ts_header2(u16 pid, u8 *counter, int pes_start, u8 *buf,=
 u8 length)
 {
 	int i;
@@ -758,7 +756,6 @@ static int write_ts_header2(u16 pid, u8 *counter, int =
pes_start, u8 *buf, u8 len
 	return c;
 }

-
 static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
 		   struct dvb_demux_feed *feed)
 {
@@ -806,7 +803,6 @@ static void p_to_t(u8 const *buf, long int length, u16=
 pid, u8 *counter,
 	}
 }

-
 static int write_ts_to_decoder(struct av7110 *av7110, int type, const u8 =
*buf, size_t len)
 {
 	struct ipack *ipack =3D &av7110->ipack[type];
@@ -833,7 +829,6 @@ static int write_ts_to_decoder(struct av7110 *av7110, =
int type, const u8 *buf, s
 	return 0;
 }

-
 int av7110_write_to_decoder(struct dvb_demux_feed *feed, const u8 *buf, s=
ize_t len)
 {
 	struct dvb_demux *demux =3D feed->demux;
@@ -860,8 +855,6 @@ int av7110_write_to_decoder(struct dvb_demux_feed *fee=
d, const u8 *buf, size_t l
 	return write_ts_to_decoder(av7110, feed->pes_type, buf, len);
 }

-
-
 /************************************************************************=
******
  * Video MPEG decoder events
  ************************************************************************=
******/
@@ -887,7 +880,6 @@ void dvb_video_add_event(struct av7110 *av7110, struct=
 video_event *event)
 	wake_up_interruptible(&events->wait_queue);
 }

-
 static int dvb_video_get_event (struct av7110 *av7110, struct video_event=
 *event, int flags)
 {
 	struct dvb_video_events *events =3D &av7110->video_events;
@@ -1039,6 +1031,7 @@ static int play_iframe(struct av7110 *av7110, char _=
_user *buf, unsigned int len
 	/* search in buf for instances of 00 00 01 b5 1? */
 	for (i =3D 0; i < len; i++) {
 		unsigned char c;
+
 		if (get_user(c, buf + i))
 			return -EFAULT;
 		if (match =3D=3D 5) {
@@ -1086,6 +1079,7 @@ struct compat_video_still_picture {
 	compat_uptr_t iFrame;
 	int32_t size;
 };
+
 #define VIDEO_STILLPICTURE32 _IOW('o', 30, struct compat_video_still_pict=
ure)

 struct compat_video_event {
@@ -1098,6 +1092,7 @@ struct compat_video_event {
 		unsigned char vsync_field;      /* unknown/odd/even/progressive */
 	} u;
 };
+
 #define VIDEO_GET_EVENT32 _IOR('o', 28, struct compat_video_event)

 static int dvb_compat_video_get_event(struct av7110 *av7110,
@@ -1223,6 +1218,7 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SET_DISPLAY_FORMAT:
 	{
 		video_displayformat_t format =3D (video_displayformat_t) arg;
+
 		switch (format) {
 		case VIDEO_PAN_SCAN:
 			av7110->display_panscan =3D VID_PAN_SCAN_PREF;
@@ -1483,6 +1479,7 @@ static int dvb_audio_ioctl(struct file *file,
 	case AUDIO_SET_MIXER:
 	{
 		struct audio_mixer *amix =3D (struct audio_mixer *)parg;
+
 		ret =3D av7110_set_volume(av7110, amix->volume_left, amix->volume_right=
);
 		break;
 	}
@@ -1498,7 +1495,6 @@ static int dvb_audio_ioctl(struct file *file,
 	return ret;
 }

-
 static int dvb_video_open(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev =3D file->private_data;
@@ -1564,8 +1560,6 @@ static int dvb_audio_release(struct inode *inode, st=
ruct file *file)
 	return dvb_generic_release(inode, file);
 }

-
-
 /************************************************************************=
******
  * driver registration
  ************************************************************************=
******/
@@ -1609,7 +1603,6 @@ static struct dvb_device dvbdev_audio =3D {
 	.kernel_ioctl	=3D dvb_audio_ioctl,
 };

-
 int av7110_av_register(struct av7110 *av7110)
 {
 	av7110->audiostate.AV_sync_state =3D 0;
diff --git a/drivers/staging/media/av7110/av7110_av.h b/drivers/staging/me=
dia/av7110/av7110_av.h
index 71bbd4391..56b0e14bb 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.h
+++ b/drivers/staging/media/av7110/av7110_av.h
@@ -28,5 +28,4 @@ extern void av7110_av_unregister(struct av7110 *av7110);
 extern int av7110_av_init(struct av7110 *av7110);
 extern void av7110_av_exit(struct av7110 *av7110);

-
 #endif /* _AV7110_AV_H_ */
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/me=
dia/av7110/av7110_ca.c
index 9ff5bd6f5..38a8f3f49 100644
=2D-- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -23,7 +23,6 @@
 #include "av7110_hw.h"
 #include "av7110_ca.h"

-
 void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 {
 	dprintk(8, "av7110:%p\n",av7110);
@@ -54,7 +53,6 @@ void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 	}
 }

-
 void ci_get_data(struct dvb_ringbuffer *cibuf, u8 *data, int len)
 {
 	if (dvb_ringbuffer_free(cibuf) < len + 2)
@@ -66,7 +64,6 @@ void ci_get_data(struct dvb_ringbuffer *cibuf, u8 *data,=
 int len)
 	wake_up_interruptible(&cibuf->queue);
 }

-
 /************************************************************************=
******
  * CI link layer file ops
  ************************************************************************=
******/
@@ -357,7 +354,6 @@ static struct dvb_device dvbdev_ca =3D {
 	.kernel_ioctl	=3D dvb_ca_ioctl,
 };

-
 int av7110_ca_register(struct av7110 *av7110)
 {
 	return dvb_register_device(&av7110->dvb_adapter, &av7110->ca_dev,
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index 714a4438b..d75c8947d 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -93,8 +93,6 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config, i=
nt addr, unsigned int co
 	return result;
 }

-
-
 /* av7110 ARM core boot stuff */
 #if 0
 void av7110_reset_arm(struct av7110 *av7110)
@@ -188,7 +186,6 @@ static int load_dram(struct av7110 *av7110, u32 *data,=
 int len)
 	return 0;
 }

-
 /* we cannot write av7110 DRAM directly, so load a bootloader into
  * the DPRAM which implements a simple boot protocol */
 int av7110_bootarm(struct av7110 *av7110)
@@ -609,13 +606,13 @@ int av7110_fw_request(struct av7110 *av7110, u16 *re=
quest_buf,
 static int av7110_fw_query(struct av7110 *av7110, u16 tag, u16 *buf, s16 =
length)
 {
 	int ret;
+
 	ret =3D av7110_fw_request(av7110, &tag, 0, buf, length);
 	if (ret)
 		printk(KERN_ERR "dvb-ttpci: av7110_fw_query error %d\n", ret);
 	return ret;
 }

-
 /************************************************************************=
****
  * Firmware commands
  ************************************************************************=
****/
@@ -655,7 +652,6 @@ int av7110_firmversion(struct av7110 *av7110)
 	return 0;
 }

-
 int av7110_diseqc_send(struct av7110 *av7110, int len, u8 *msg, unsigned =
long burst)
 {
 	int i, ret;
@@ -684,7 +680,6 @@ int av7110_diseqc_send(struct av7110 *av7110, int len,=
 u8 *msg, unsigned long bu
 	return ret;
 }

-
 #ifdef CONFIG_DVB_AV7110_OSD

 static inline int SetColorBlend(struct av7110 *av7110, u8 windownr)
@@ -829,10 +824,10 @@ static inline int CreateOSDWindow(struct av7110 *av7=
110, u8 windownr,
 			     windownr, disptype, width, height);
 }

-
 static enum av7110_osd_palette_type bpp2pal[8] =3D {
 	Pal1Bit, Pal2Bit, 0, Pal4Bit, 0, 0, 0, Pal8Bit
 };
+
 static osd_raw_window_t bpp2bit[8] =3D {
 	OSD_BITMAP1, OSD_BITMAP2, 0, OSD_BITMAP4, 0, 0, 0, OSD_BITMAP8
 };
@@ -1087,6 +1082,7 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 			int i, len =3D dc->x0-dc->color+1;
 			u8 __user *colors =3D (u8 __user *)dc->data;
 			u8 r, g =3D 0, b =3D 0, blend =3D 0;
+
 			ret =3D 0;
 			for (i =3D 0; i<len; i++) {
 				if (get_user(r, colors + i * 4) ||
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/me=
dia/av7110/av7110_hw.h
index 6380d8950..df13d55f7 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -14,7 +14,6 @@
 #define ARM_WAIT_SHAKE (HZ/5)
 #define ARM_WAIT_OSD (HZ)

-
 enum av7110_bootstate
 {
 	BOOTSTATE_BUFFER_EMPTY	=3D 0,
@@ -90,7 +89,6 @@ enum av7110_video_output_mode
 #define PBUFSIZE_16K  0x0700
 #define PBUFSIZE_32K  0x0800

-
 /* firmware command codes */
 enum av7110_osd_command {
 	WCreate,
@@ -289,7 +287,6 @@ enum av7110_command_type {
 #define CI_MSG_CA_PMT		 0xe0
 #define CI_MSG_ERROR		 0xf0

-
 /* base address of the dual ported RAM which serves as communication
  * area between PCI bus and av7110,
  * as seen by the DEBI bus of the saa7146 */
@@ -329,7 +326,6 @@ enum av7110_command_type {
 #define Reserved	(DPRAM_BASE + 0x1E00)
 #define Reserved_SIZE	0x1C0

-
 /* firmware status area */
 #define STATUS_BASE	(DPRAM_BASE + 0x1FC0)
 #define STATUS_LOOPS	(STATUS_BASE + 0x08)
@@ -362,8 +358,6 @@ enum av7110_command_type {
 #define DEBI_DONE_LINE		1
 #define ARM_IRQ_LINE		0

-
-
 extern int av7110_bootarm(struct av7110 *av7110);
 extern int av7110_firmversion(struct av7110 *av7110);
 #define FW_CI_LL_SUPPORT(arm_app) ((arm_app) & 0x80000000)
@@ -375,14 +369,12 @@ extern int av7110_fw_cmd(struct av7110 *av7110, int =
type, int com, int num, ...)
 extern int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,
 			     int request_buf_len, u16 *reply_buf, int reply_buf_len);

-
 /* DEBI (saa7146 data extension bus interface) access */
 extern int av7110_debiwrite(struct av7110 *av7110, u32 config,
 			    int addr, u32 val, unsigned int count);
 extern u32 av7110_debiread(struct av7110 *av7110, u32 config,
 			   int addr, unsigned int count);

-
 /* DEBI during interrupt */
 /* single word writes */
 static inline void iwdebi(struct av7110 *av7110, u32 config, int addr, u3=
2 val, unsigned int count)
@@ -482,15 +474,11 @@ static inline int Set22K(struct av7110 *av7110, int =
state)
 	return av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, (state ? ON22K : OFF22K),=
 0);
 }

-
 extern int av7110_diseqc_send(struct av7110 *av7110, int len, u8 *msg, un=
signed long burst);

-
 #ifdef CONFIG_DVB_AV7110_OSD
 extern int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t *dc);
 extern int av7110_osd_capability(struct av7110 *av7110, osd_cap_t *cap);
 #endif /* CONFIG_DVB_AV7110_OSD */

-
-
 #endif /* _AV7110_HW_H_ */
diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging=
/media/av7110/av7110_ipack.c
index 30330ed01..9a2b51d54 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -4,7 +4,6 @@
 #include <linux/string.h>	/* for memcpy() */
 #include <linux/vmalloc.h>

-
 void av7110_ipack_reset(struct ipack *p)
 {
 	p->found =3D 0;
@@ -20,7 +19,6 @@ void av7110_ipack_reset(struct ipack *p)
 	p->count =3D 0;
 }

-
 int av7110_ipack_init(struct ipack *p, int size,
 		      void (*func)(u8 *buf, int size, void *priv))
 {
@@ -35,13 +33,11 @@ int av7110_ipack_init(struct ipack *p, int size,
 	return 0;
 }

-
 void av7110_ipack_free(struct ipack *p)
 {
 	vfree(p->buf);
 }

-
 static void send_ipack(struct ipack *p)
 {
 	int off;
@@ -108,7 +104,6 @@ static void send_ipack(struct ipack *p)
 	}
 }

-
 void av7110_ipack_flush(struct ipack *p)
 {
 	if (p->plength !=3D MMAX_PLENGTH - 6 || p->found <=3D 6)
@@ -119,7 +114,6 @@ void av7110_ipack_flush(struct ipack *p)
 	av7110_ipack_reset(p);
 }

-
 static void write_ipack(struct ipack *p, const u8 *data, int count)
 {
 	u8 headr[3] =3D { 0x00, 0x00, 0x01 };
@@ -134,6 +128,7 @@ static void write_ipack(struct ipack *p, const u8 *dat=
a, int count)
 		p->count +=3D count;
 	} else {
 		int rest =3D p->size - p->count;
+
 		memcpy(p->buf+p->count, data, rest);
 		p->count +=3D rest;
 		send_ipack(p);
@@ -142,7 +137,6 @@ static void write_ipack(struct ipack *p, const u8 *dat=
a, int count)
 	}
 }

-
 int av7110_ipack_instant_repack (const u8 *buf, int count, struct ipack *=
p)
 {
 	int l;
@@ -284,7 +278,6 @@ int av7110_ipack_instant_repack (const u8 *buf, int co=
unt, struct ipack *p)
 			}

 			if (p->mpeg =3D=3D 1 && p->which < 2000) {
-
 				if (p->found =3D=3D 7) {
 					p->check =3D p->flag1;
 					p->hlength =3D 1;
@@ -368,7 +361,6 @@ int av7110_ipack_instant_repack (const u8 *buf, int co=
unt, struct ipack *p)
 					}
 					p->which =3D 2000;
 				}
-
 			}

 			while (c < count && p->found < p->plength + 6) {
@@ -382,7 +374,6 @@ int av7110_ipack_instant_repack (const u8 *buf, int co=
unt, struct ipack *p)
 			break;
 		}

-
 		if (p->done) {
 			if (p->found + count - c < p->plength + 6) {
 				p->found +=3D count - c;
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index 2c4707a60..3bf08cbcf 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -201,8 +201,6 @@ static int stv0297_set_tv_freq(struct saa7146_dev *dev=
, u32 freq)
 	return tuner_write(dev, 0x63, data);
 }

-
-
 static struct saa7146_standard analog_standard[];
 static struct saa7146_standard dvb_standard[];
 static struct saa7146_standard standard[];
@@ -341,6 +339,7 @@ static int vidioc_s_tuner(struct file *file, void *fh,=
 const struct v4l2_tuner *
 	struct saa7146_dev *dev =3D video_drvdata(file);
 	struct av7110 *av7110 =3D (struct av7110 *)dev->ext_priv;
 	u16 fm_matrix, src;
+
 	dprintk(2, "VIDIOC_S_TUNER: %d\n", t->index);

 	if (!av7110->analog_tuner_flags || av7110->current_input !=3D 1)
@@ -691,7 +690,6 @@ static u8 saa7113_init_regs[] =3D {
 	0xff
 };

-
 static struct saa7146_ext_vv av7110_vv_data_st;
 static struct saa7146_ext_vv av7110_vv_data_c;

@@ -863,8 +861,6 @@ int av7110_exit_v4l(struct av7110 *av7110)
 	return 0;
 }

-
-
 /* FIXME: these values are experimental values that look better than the
    values from the latest "official" driver -- at least for me... (MiHu) =
*/
 static struct saa7146_standard standard[] =3D {
@@ -927,7 +923,6 @@ static int std_callback(struct saa7146_dev *dev, struc=
t saa7146_standard *std)
 	return 0;
 }

-
 static struct saa7146_ext_vv av7110_vv_data_st =3D {
 	.inputs		=3D 1,
 	.audios		=3D 1,
diff --git a/drivers/staging/media/av7110/dvb_filter.h b/drivers/staging/m=
edia/av7110/dvb_filter.h
index 67a3c6333..928b33436 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.h
+++ b/drivers/staging/media/av7110/dvb_filter.h
@@ -36,7 +36,6 @@ void dvb_filter_pes2ts_init(struct dvb_filter_pes2ts *p2=
ts, unsigned short pid,
 int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts, unsigned char *pes,
 		      int len, int payload_start);

-
 #define PROG_STREAM_MAP  0xBC
 #define PRIVATE_STREAM1  0xBD
 #define PADDING_STREAM   0xBE
@@ -78,7 +77,6 @@ int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts, un=
signed char *pes,
 #define INIT_DISP_HORIZONTAL_SIZE   540
 #define INIT_DISP_VERTICAL_SIZE     576

-
 //flags2
 #define PTS_DTS_FLAGS    0xC0
 #define ESCR_FLAG        0x20
@@ -119,7 +117,6 @@ int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts, =
unsigned char *pes,
 #define PIECE_RATE     0x40
 #define SEAM_SPLICE    0x20

-
 #define MAX_PLENGTH 0xFFFF
 #define MMAX_PLENGTH (256*MAX_PLENGTH)

@@ -238,5 +235,4 @@ struct dvb_audio_info {

 int dvb_filter_get_ac3info(u8 *mbuf, int count, struct dvb_audio_info *ai=
, int pr);

-
 #endif
=2D-
2.34.0


