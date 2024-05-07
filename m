Return-Path: <linux-media+bounces-10944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 867258BD895
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96791C222C2
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FACF8BF9;
	Tue,  7 May 2024 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="e5dphBVy"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD70882B
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041534; cv=none; b=lsWTJe9CWLoHaxnOn1twNH+2C9jGs/SqhhbtHk1hIOWYK/jy7Gr8kEHpojW/F67W4Gg0cVU7v7qLpVK3tzF5owCcOEutg/BD6uVjvcf317+Ro0jc0jI6E7Liog0rv7dKmpVXCnBPBQwTIVSD8Tr8oV+inF2qUSClUjL97rUwH/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041534; c=relaxed/simple;
	bh=CtrdS2evZrfzsVMSGcskXsot5uSRUDlKoUg6Oqum/tI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qIGpyZ22cTQRfeJ8NZOZFnLa9/SavTcOYhReiWVpIltb6RxfJ1tTxrIzdS/lUi/UJnUA/iC/boXurNMnM/qxkskweJ2XCYcAFnFhrxBUtkF5LaDvP/48/o44cyLwievGL6HRLqyeCSLFAbK8xYpwlcIdmKoalzdjPpH3ZcpfIjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=e5dphBVy; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041527; x=1715646327; i=herdler@nurfuerspam.de;
	bh=w80fT1iOlD6ZYiFxbPcMZFWau4NZWVi3MGQ87dN4SIQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e5dphBVyTNVluGAiTzjMaeUKlbaZCsIK8A9po4lLS8S/LvkmT9sMLyRwn1Em+TMN
	 L9hMAMp5XsPOrPDZpnmx+grQ6SOeGigSaDxHmvPTbIGqrJXlSI1pnHojzxb2vdDus
	 NZitMam/NWb4icxiAd/4V/uBEkgsYCbEpwT9vuaX0fNKz1liAE2x3RGKUHAQ37JLk
	 MSwPyd8mCj3oQdlp/5tPzQkHJ03DJduSLtUSYkHvLUiUBQuiR5yUWnQkWlea6yeuv
	 6FcA+geaySxkJpDCvj+D7O6lErU0PWOeqQFCczjUjLFFDnVd9+WgyaVcSyFzZ2UT3
	 I4YXflWuP/XuAf0ILw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiPl-1sBSsk1c3Z-00U66U; Tue, 07
 May 2024 02:25:27 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 09/21] media: av7110: coding style fixes: whitespace
Date: Tue,  7 May 2024 02:24:48 +0200
Message-Id: <20240507002500.81867-10-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:paoao+mKRbZAXc3J1gqxpWFU+gbPMenbFgFmOpI9JNCR0jyEAL8
 sreox8UGjL9zdWcB0Bp2AurZ9LI6e5bwKC47jzxOvs1w7PgJeNDvsFAJbKkFkQstbZDMFWq
 H4RgAxCVLlpAwUi0FObaq/sR2l1prZ3PSxtt/mJgD6FUO1xadCC/DffraG/+tG1k8w3L91K
 gWqpCbwuWSdgl7mk1tZ5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yPlSTh5iTIQ=;wf2TvEYULl/23RGfr77WIZ42b5+
 +IJdRYkwFFcu3qb90SDBrkiue6rWOh0tjW4R9/PhHUeuZ3f/wdYgvfQTm8coFRlOni8h9wbJV
 zRLP8894EDAOLDJkLR89l1vSOpuDOHAgfrsqH4Rc94o7PrtGmKUVrr9reMGK/4t4AMWbuwts/
 rtNVQTBQ2utwnM0z7lO4Sul0qsgb8/RdurhN8qNvPWNmQRwE0gKVjuFbn6TNgLk3ly/cjSg8i
 jxvBdJETcBCvQRn/vLbzF0ULzSRb0abiZ9UjYaNgC72EOmgZSJzk/eFWspaMICp8TpsYHFbYu
 e9WUji6baJOV0Y9KEHeU0aMfZCo373OB14GFWMik6et1o22ItOqm323GJH4/b78xc0cQFIeYy
 r+JVbKxDdq6iS30WSOXiwf7bj83ytu9GXMw4Cyz9BGfmSrWCV197otKFVBK+gu+KarqQ4ChwG
 BIZPEwsGJ5u7HUum3JPic4w3Q4HqYiabvY29KxPWvUFIFyYB9ZAW123lRZChRH5IMPA7aaGzV
 +odQCKEYtFYsl2DxiQg9QVs+gLVLU6TMsCEzKZ/9xL/+I4Ws7xuzH/EqLBe07hFN4/AD7m1ra
 +SL49n5Q1bA8vwMwYtiZVJn7SXw1m27H/Q0cEBj4iOZ3Cq3ehL3OEGU0BjxkOl/gUHQpzvEwp
 F561nEQYEVxKFNwKdCSuD9iUVGi1vYcBtvaY9Ki7BJvUoA2FEtqIlrrWVKnCioaANTRSC9kUR
 ylPW4SMutdxdwlW7P4UA8/rh7Rml1H4enVD/F1gP9wpBuXEBOoegVGgi/WH3suMIkDULypB1r
 g814zDlJ88CQQE1zfy+xmimoFUQClILNdWMG86TVsVrN8=

This patch fixes the following checkpatch warnings:

ERROR:SPACING: need consistent spacing around '&' (ctx:WxO)
ERROR:SPACING: need consistent spacing around '&' (ctx:WxV)
ERROR:SPACING: need consistent spacing around '-' (ctx:WxV)
ERROR:SPACING: space prohibited after that '~' (ctx:OxW)
ERROR:SPACING: space prohibited after that open parenthesis '('
ERROR:SPACING: space prohibited before that close parenthesis ')'
ERROR:SPACING: space prohibited before that ':' (ctx:WxE)
ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
ERROR:SPACING: space required after that ',' (ctx:VxV)
ERROR:SPACING: space required before that '-' (ctx:OxV)
ERROR:SPACING: space required before that '~' (ctx:OxV)
ERROR:SPACING: space required before the open brace '{'
ERROR:SPACING: space required before the open parenthesis '('
ERROR:SPACING: spaces required around that '&&' (ctx:ExV)
ERROR:SPACING: spaces required around that '!=3D' (ctx:VxO)
ERROR:SPACING: spaces required around that '&=3D' (ctx:VxO)
ERROR:SPACING: spaces required around that '=3D=3D' (ctx:VxO)
ERROR:SPACING: spaces required around that '!=3D' (ctx:VxV)
ERROR:SPACING: spaces required around that '+=3D' (ctx:VxV)
ERROR:SPACING: spaces required around that '-=3D' (ctx:VxV)
ERROR:SPACING: spaces required around that '<' (ctx:VxV)
ERROR:SPACING: spaces required around that '<=3D' (ctx:VxV)
ERROR:SPACING: spaces required around that '=3D' (ctx:VxV)
ERROR:SPACING: spaces required around that '>' (ctx:VxV)
ERROR:SPACING: spaces required around that '>=3D' (ctx:VxV)
ERROR:SPACING: spaces required around that '|=3D' (ctx:VxV)
WARNING:LEADING_SPACE: please, no spaces at the start of a line
WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a =
quoted newline
WARNING:SPACING: space prohibited before semicolon
WARNING:SPACING: space prohibited between function name and open parenthes=
is '('
WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statement=
s (16, 23)
WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statement=
s (16, 32)
WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statement=
s (32, 39)
WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statement=
s (39, 47)
WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statement=
s (47, 55)
WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statement=
s (8, 18)
WARNING:TABSTOP: Statements should start on a tabstop
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

Whitespace changes only.
"git diff -w" shows no changes.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c       | 62 ++++++++++-----------
 drivers/staging/media/av7110/av7110_av.c    | 30 +++++-----
 drivers/staging/media/av7110/av7110_ca.c    |  6 +-
 drivers/staging/media/av7110/av7110_hw.c    | 32 +++++------
 drivers/staging/media/av7110/av7110_hw.h    |  6 +-
 drivers/staging/media/av7110/av7110_ipack.c | 14 ++---
 drivers/staging/media/av7110/av7110_v4l.c   |  8 +--
 drivers/staging/media/av7110/dvb_filter.c   | 48 ++++++++--------
 drivers/staging/media/av7110/dvb_filter.h   |  2 +-
 9 files changed, 104 insertions(+), 104 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index b19c27f6e..557f42352 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -72,11 +72,11 @@ static int full_ts;
 module_param_named(debug, av7110_debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (bitmask, default 0)");
 module_param(vidmode, int, 0444);
-MODULE_PARM_DESC(vidmode,"analog video out: 0 off, 1 CVBS+RGB (default), =
2 CVBS+YC, 3 YC");
+MODULE_PARM_DESC(vidmode, "analog video out: 0 off, 1 CVBS+RGB (default),=
 2 CVBS+YC, 3 YC");
 module_param(pids_off, int, 0444);
-MODULE_PARM_DESC(pids_off,"clear video/audio/PCR PID filters when demux i=
s closed");
+MODULE_PARM_DESC(pids_off, "clear video/audio/PCR PID filters when demux =
is closed");
 module_param(adac, int, 0444);
-MODULE_PARM_DESC(adac,"audio DAC type: 0 TI, 1 CRYSTAL, 2 MSP (use if aut=
odetection fails)");
+MODULE_PARM_DESC(adac, "audio DAC type: 0 TI, 1 CRYSTAL, 2 MSP (use if au=
todetection fails)");
 module_param(hw_sections, int, 0444);
 MODULE_PARM_DESC(hw_sections, "0 use software section filter, 1 use hardw=
are");
 module_param(rgb_on, int, 0444);
@@ -951,14 +951,14 @@ static int av7110_start_feed(struct dvb_demux_feed *=
feed)
 			switch (demux->dmx.frontend->source) {
 			case DMX_MEMORY_FE:
 				if (feed->ts_type & TS_DECODER)
-				       if (feed->pes_type < 2 &&
-					   !(demux->pids[0] & 0x8000) &&
-					   !(demux->pids[1] & 0x8000)) {
-					       dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
-					       dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
-					       ret =3D av7110_av_start_play(av7110,RP_AV);
-					       if (!ret)
-						       demux->playing =3D 1;
+					if (feed->pes_type < 2 &&
+					    !(demux->pids[0] & 0x8000) &&
+					    !(demux->pids[1] & 0x8000)) {
+						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+						ret =3D av7110_av_start_play(av7110, RP_AV);
+						if (!ret)
+							demux->playing =3D 1;
 					}
 				break;
 			default:
@@ -1029,7 +1029,7 @@ static int av7110_stop_feed(struct dvb_demux_feed *f=
eed)
 	}

 	if (feed->type =3D=3D DMX_TYPE_SEC) {
-		for (i =3D 0; i<demux->filternum; i++) {
+		for (i =3D 0; i < demux->filternum; i++) {
 			if (demux->filter[i].state =3D=3D DMX_STATE_GO &&
 			    demux->filter[i].filter.parent =3D=3D &feed->feed.sec) {
 				demux->filter[i].state =3D DMX_STATE_READY;
@@ -1466,7 +1466,7 @@ static int check_firmware(struct av7110 *av7110)
 		printk("dvb-ttpci: root file has strange size (%d). aborting.\n", len);
 		return -EINVAL;
 	}
-	if( crc !=3D crc32_le(0, ptr, len)) {
+	if (crc !=3D crc32_le(0, ptr, len)) {
 		printk("dvb-ttpci: crc32 of root file does not match.\n");
 		return -EINVAL;
 	}
@@ -1553,7 +1553,7 @@ static int alps_bsrv2_tuner_set_params(struct dvb_fr=
ontend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&av7110->i2c_adap, &msg, 1) !=3D 1)
+	if (i2c_transfer(&av7110->i2c_adap, &msg, 1) !=3D 1)
 		return -EIO;
 	return 0;
 }
@@ -1819,7 +1819,7 @@ static int nexusca_stv0297_tuner_set_params(struct d=
vb_frontend *fe)
 	}

 	// wait for PLL lock
-	for(i =3D 0; i < 20; i++) {
+	for (i =3D 0; i < 20; i++) {
 		if (fe->ops.i2c_gate_ctrl)
 			fe->ops.i2c_gate_ctrl(fe, 1);
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) =3D=3D 1)
@@ -2060,8 +2060,8 @@ static u8 read_pwm(struct av7110 *av7110)
 {
 	u8 b =3D 0xff;
 	u8 pwm;
-	struct i2c_msg msg[] =3D { { .addr =3D 0x50,.flags =3D 0,.buf =3D &b,.le=
n =3D 1 },
-				 { .addr =3D 0x50,.flags =3D I2C_M_RD,.buf =3D &pwm,.len =3D 1} };
+	struct i2c_msg msg[] =3D { { .addr =3D 0x50, .flags =3D 0, .buf =3D &b, =
.len =3D 1 },
+				 { .addr =3D 0x50, .flags =3D I2C_M_RD, .buf =3D &pwm, .len =3D 1} };

 	if ((i2c_transfer(&av7110->i2c_adap, msg, 2) !=3D 2) || (pwm =3D=3D 0xff=
))
 		pwm =3D 0x48;
@@ -2074,7 +2074,7 @@ static int frontend_init(struct av7110 *av7110)
 	int ret;

 	if (av7110->dev->pci->subsystem_vendor =3D=3D 0x110a) {
-		switch(av7110->dev->pci->subsystem_device) {
+		switch (av7110->dev->pci->subsystem_device) {
 		case 0x0000: // Fujitsu/Siemens DVB-Cable (ves1820/Philips CD1516(??))
 			av7110->fe =3D dvb_attach(ves1820_attach, &philips_cd1516_config,
 						    &av7110->i2c_adap, read_pwm(av7110));
@@ -2085,7 +2085,7 @@ static int frontend_init(struct av7110 *av7110)
 		}

 	} else if (av7110->dev->pci->subsystem_vendor =3D=3D 0x13c2) {
-		switch(av7110->dev->pci->subsystem_device) {
+		switch (av7110->dev->pci->subsystem_device) {
 		case 0x0000: // Hauppauge/TT WinTV DVB-S rev1.X
 		case 0x0003: // Hauppauge/TT WinTV Nexus-S Rev 2.X
 		case 0x1002: // Hauppauge/TT WinTV DVB-S rev1.3SE
@@ -2126,7 +2126,7 @@ static int frontend_init(struct av7110 *av7110)
 			}

 			/* Try DVB-C cards */
-			switch(av7110->dev->pci->subsystem_device) {
+			switch (av7110->dev->pci->subsystem_device) {
 			case 0x0000:
 				/* Siemens DVB-C (full-length card) VES1820/Philips CD1516 */
 				av7110->fe =3D dvb_attach(ves1820_attach, &philips_cd1516_config, &av=
7110->i2c_adap,
@@ -2398,14 +2398,14 @@ static int av7110_attach(struct saa7146_dev *dev,
 		 * use 0x03 to track RPS1 interrupts - increase by 1 every gpio3 is tog=
gled
 		 * use 0x15 to track VPE  interrupts - increase by 1 every vpeirq() is =
called
 		 */
-		saa7146_write(dev, EC1SSR, (0x03<<2) | 3 );
+		saa7146_write(dev, EC1SSR, (0x03 << 2) | 3);
 		/* set event counter 1 threshold to maximum allowed value        (rEC p=
55) */
-		saa7146_write(dev, ECT1R,  0x3fff );
+		saa7146_write(dev, ECT1R,  0x3fff);
 #endif
 		/* Set RPS1 Address register to point to RPS code               (r108 p=
42) */
 		saa7146_write(dev, RPS_ADDR1, dev->d_rps1.dma_handle);
 		/* Enable RPS1,                                                 (rFC p3=
3) */
-		saa7146_write(dev, MC1, (MASK_13 | MASK_29 ));
+		saa7146_write(dev, MC1, (MASK_13 | MASK_29));

 		mdelay(10);
 		/* now send VSYNC_B to rps1 by rising GPIO3 */
@@ -2419,7 +2419,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 			printk("dvb-ttpci: BUDGET-PATCH DETECTED.\n");
 		}
 		/* Disable RPS1 */
-		saa7146_write(dev, MC1, ( MASK_29 ));
+		saa7146_write(dev, MC1, (MASK_29));
 #if RPS_IRQ
 		printk("dvb-ttpci: Event Counter 1 0x%04x\n", saa7146_read(dev, EC1R) &=
 0x3fff );
 #endif
@@ -2533,9 +2533,9 @@ static int av7110_attach(struct saa7146_dev *dev,
 		 * use 0x03 to track RPS1 interrupts - increase by 1 every gpio3 is tog=
gled
 		 * use 0x15 to track VPE  interrupts - increase by 1 every vpeirq() is =
called
 		 */
-		saa7146_write(dev, EC1SSR, (0x03<<2) | 3 );
+		saa7146_write(dev, EC1SSR, (0x03 << 2) | 3);
 		/* set event counter 1 threshold to maximum allowed value        (rEC p=
55) */
-		saa7146_write(dev, ECT1R,  0x3fff );
+		saa7146_write(dev, ECT1R,  0x3fff);
 #endif
 		/* Setup BUDGETPATCH MAIN RPS1 "program" (p35) */
 		count =3D 0;
@@ -2576,7 +2576,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 		 * then RPS_THRESH1 should be set to trigger
 		 * every TS_HEIGHT (512) lines.
 		 */
-		saa7146_write(dev, RPS_THRESH1, (TS_HEIGHT*1) | MASK_12 );
+		saa7146_write(dev, RPS_THRESH1, (TS_HEIGHT * 1) | MASK_12);

 		/* Enable RPS1                                                  (rFC p3=
3) */
 		saa7146_write(dev, MC1, (MASK_13 | MASK_29));
@@ -2650,7 +2650,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 	if (ret < 0)
 		goto err_stop_arm_9;

-	if (FW_VERSION(av7110->arm_app)<0x2501)
+	if (FW_VERSION(av7110->arm_app) < 0x2501)
 		printk(KERN_WARNING
 		       "dvb-ttpci: Warning, firmware version 0x%04x is too old. System =
might be unstable!\n",
 		       FW_VERSION(av7110->arm_app));
@@ -2769,7 +2769,7 @@ static int av7110_detach(struct saa7146_dev *saa)

 	i2c_del_adapter(&av7110->i2c_adap);

-	dvb_unregister_adapter (&av7110->dvb_adapter);
+	dvb_unregister_adapter(&av7110->dvb_adapter);

 	av7110_num--;

@@ -2825,12 +2825,12 @@ static void av7110_irq(struct saa7146_dev *dev, u3=
2 *isr)

 static struct saa7146_extension av7110_extension_driver;

-#define MAKE_AV7110_INFO(x_var,x_name) \
+#define MAKE_AV7110_INFO(x_var, x_name) \
 static struct saa7146_pci_extension_data x_var =3D { \
 	.ext_priv =3D x_name, \
 	.ext =3D &av7110_extension_driver }

-MAKE_AV7110_INFO(tts_1_X_fsc,"Technotrend/Hauppauge WinTV DVB-S rev1.X or=
 Fujitsu Siemens DVB-C");
+MAKE_AV7110_INFO(tts_1_X_fsc, "Technotrend/Hauppauge WinTV DVB-S rev1.X o=
r Fujitsu Siemens DVB-C");
 MAKE_AV7110_INFO(ttt_1_X,    "Technotrend/Hauppauge WinTV DVB-T rev1.X");
 MAKE_AV7110_INFO(ttc_1_X,    "Technotrend/Hauppauge WinTV Nexus-CA rev1.X=
");
 MAKE_AV7110_INFO(ttc_2_X,    "Technotrend/Hauppauge WinTV DVB-C rev2.X");
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index 96309a896..0b384e832 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -238,8 +238,8 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer =
*buf, int dlen)
 		sync |=3D DVB_RINGBUFFER_PEEK(buf, 2) << 8;
 		sync |=3D DVB_RINGBUFFER_PEEK(buf, 3);

-		if (((sync &~ 0x0f) =3D=3D 0x000001e0) ||
-		    ((sync &~ 0x1f) =3D=3D 0x000001c0) ||
+		if (((sync & ~0x0f) =3D=3D 0x000001e0) ||
+		    ((sync & ~0x1f) =3D=3D 0x000001c0) ||
 		    (sync =3D=3D 0x000001bd))
 			break;
 		printk("resync\n");
@@ -296,7 +296,7 @@ int av7110_set_volume(struct av7110 *av7110, unsigned =
int volleft,
 		vol  =3D (volleft > volright) ? volleft : volright;
 		val	=3D (vol * 0x73 / 255) << 8;
 		if (vol > 0)
-		       balance =3D ((volright - volleft) * 127) / vol;
+			balance =3D ((volright - volleft) * 127) / vol;
 		msp_writereg(av7110, MSP_WR_DSP, 0x0001, balance << 8);
 		msp_writereg(av7110, MSP_WR_DSP, 0x0000, val); /* loudspeaker */
 		msp_writereg(av7110, MSP_WR_DSP, 0x0006, val); /* headphonesr */
@@ -362,8 +362,8 @@ static int get_video_format(struct av7110 *av7110, u8 =
*buf, int count)
 		if (p[0] || p[1] || p[2] !=3D 0x01 || p[3] !=3D 0xb3)
 			continue;
 		p +=3D 4;
-		hsize =3D ((p[1] &0xF0) >> 4) | (p[0] << 4);
-		vsize =3D ((p[1] &0x0F) << 8) | (p[2]);
+		hsize =3D ((p[1] & 0xF0) >> 4) | (p[0] << 4);
+		vsize =3D ((p[1] & 0x0F) << 8) | (p[2]);
 		sw =3D (p[3] & 0x0F);
 		ret =3D av7110_set_vidmode(av7110, sw2mode[sw]);
 		if (!ret) {
@@ -590,7 +590,7 @@ static int find_pes_header(u8 const *buf, long int len=
gth, int *frags)
 	while (c < length - 3 && !found) {
 		if (buf[c] =3D=3D 0x00 && buf[c + 1] =3D=3D 0x00 &&
 		    buf[c + 2] =3D=3D 0x01) {
-			switch ( buf[c + 3] ) {
+			switch (buf[c + 3]) {
 			case PROG_STREAM_MAP:
 			case PRIVATE_STREAM2:
 			case PROG_STREAM_DIR:
@@ -635,9 +635,9 @@ void av7110_p2t_write(u8 const *buf, long int length, =
u16 pid, struct av7110_p2t

 	c =3D 0;
 	c2 =3D 0;
-	if (p->frags){
+	if (p->frags) {
 		check =3D 0;
-		switch(p->frags) {
+		switch (p->frags) {
 		case 1:
 			if (buf[c] =3D=3D 0x00 && buf[c + 1] =3D=3D 0x01) {
 				check =3D 1;
@@ -703,7 +703,7 @@ void av7110_p2t_write(u8 const *buf, long int length, =
u16 pid, struct av7110_p2t
 		c2 =3D find_pes_header(buf + c + add, length - c - add, &p->frags);
 		if (c2 >=3D 0) {
 			c2 +=3D c + add;
-			if (c2 > c){
+			if (c2 > c) {
 				p_to_t(buf + c, c2 - c, pid, &p->counter, p->feed);
 				c =3D c2;
 				clear_p2t(p);
@@ -787,7 +787,7 @@ static void p_to_t(u8 const *buf, long int length, u16=
 pid, u8 *counter,

 	while (c < length) {
 		memset(obuf, 0, TS_SIZE);
-		if (length - c >=3D (TS_SIZE - 4)){
+		if (length - c >=3D (TS_SIZE - 4)) {
 			l =3D write_ts_header2(pid, counter, pes_start,
 					     obuf, (TS_SIZE - 4));
 			memcpy(obuf + l, buf + c, TS_SIZE - l);
@@ -880,7 +880,7 @@ void dvb_video_add_event(struct av7110 *av7110, struct=
 video_event *event)
 	wake_up_interruptible(&events->wait_queue);
 }

-static int dvb_video_get_event (struct av7110 *av7110, struct video_event=
 *event, int flags)
+static int dvb_video_get_event(struct av7110 *av7110, struct video_event =
*event, int flags)
 {
 	struct dvb_video_events *events =3D &av7110->video_events;

@@ -1124,8 +1124,8 @@ static int dvb_video_ioctl(struct file *file,
 	dprintk(1, "av7110:%p, cmd=3D%04x\n", av7110,cmd);

 	if ((file->f_flags & O_ACCMODE) =3D=3D O_RDONLY) {
-		if ( cmd !=3D VIDEO_GET_STATUS && cmd !=3D VIDEO_GET_EVENT &&
-		     cmd !=3D VIDEO_GET_SIZE ) {
+		if (cmd !=3D VIDEO_GET_STATUS && cmd !=3D VIDEO_GET_EVENT &&
+		    cmd !=3D VIDEO_GET_SIZE) {
 			return -EPERM;
 		}
 	}
@@ -1419,7 +1419,7 @@ static int dvb_audio_ioctl(struct file *file,

 	case AUDIO_CHANNEL_SELECT:
 		av7110->audiostate.channel_select =3D (audio_channel_select_t) arg;
-		switch(av7110->audiostate.channel_select) {
+		switch (av7110->audiostate.channel_select) {
 		case AUDIO_STEREO:
 			ret =3D audcom(av7110, AUDIO_CMD_STEREO);
 			if (!ret) {
@@ -1624,7 +1624,7 @@ int av7110_av_register(struct av7110 *av7110)
 	spin_lock_init(&av7110->video_events.lock);
 	av7110->video_events.eventw =3D av7110->video_events.eventr =3D 0;
 	av7110->video_events.overflow =3D 0;
-	memset(&av7110->video_size, 0, sizeof (video_size_t));
+	memset(&av7110->video_size, 0, sizeof(video_size_t));

 	dvb_register_device(&av7110->dvb_adapter, &av7110->video_dev,
 			    &dvbdev_video, av7110, DVB_DEVICE_VIDEO, 0);
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/me=
dia/av7110/av7110_ca.c
index 38a8f3f49..93b888c70 100644
=2D-- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -206,7 +206,7 @@ static int dvb_ca_open(struct inode *inode, struct fil=
e *file)
 	return 0;
 }

-static __poll_t dvb_ca_poll (struct file *file, poll_table *wait)
+static __poll_t dvb_ca_poll(struct file *file, poll_table *wait)
 {
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct av7110 *av7110 =3D dvbdev->priv;
@@ -260,7 +260,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned in=
t cmd, void *parg)

 	case CA_GET_SLOT_INFO:
 	{
-		struct ca_slot_info *info=3D(struct ca_slot_info *)parg;
+		struct ca_slot_info *info =3D (struct ca_slot_info *)parg;

 		if (info->num < 0 || info->num > 1) {
 			mutex_unlock(&av7110->ioctl_mutex);
@@ -285,7 +285,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned in=
t cmd, void *parg)

 		info.num =3D 16;
 		info.type =3D CA_ECD;
-		memcpy(parg, &info, sizeof (info));
+		memcpy(parg, &info, sizeof(info));
 		break;
 	}

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index d75c8947d..d7439c522 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -465,7 +465,7 @@ static int av7110_send_fw_cmd(struct av7110 *av7110, u=
16 *buf, int length)

 	ret =3D __av7110_send_fw_cmd(av7110, buf, length);
 	mutex_unlock(&av7110->dcomlock);
-	if (ret && ret!=3D-ERESTARTSYS)
+	if (ret && ret !=3D -ERESTARTSYS)
 		printk(KERN_ERR "dvb-ttpci: %s(): av7110_send_fw_cmd error %d\n",
 		       __func__, ret);
 	return ret;
@@ -511,9 +511,9 @@ int av7110_send_ci_cmd(struct av7110 *av7110, u8 subco=
m, u8 *buf, u8 len)

 	dprintk(4, "%p\n", av7110);

-	for(i =3D 0; i < len && i < 32; i++)
+	for (i =3D 0; i < len && i < 32; i++)
 	{
-		if(i % 2 =3D=3D 0)
+		if (i % 2 =3D=3D 0)
 			cmd[(i / 2) + 2] =3D (u16)(buf[i]) << 8;
 		else
 			cmd[(i / 2) + 2] |=3D buf[i];
@@ -675,7 +675,7 @@ int av7110_diseqc_send(struct av7110 *av7110, int len,=
 u8 *msg, unsigned long bu
 		buf[i + 4] =3D msg[i];

 	ret =3D av7110_send_fw_cmd(av7110, buf, 18);
-	if (ret && ret!=3D-ERESTARTSYS)
+	if (ret && ret !=3D -ERESTARTSYS)
 		printk(KERN_ERR "dvb-ttpci: av7110_diseqc_send error %d\n", ret);
 	return ret;
 }
@@ -777,7 +777,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u1=
6 x, u16 y, char *buf)
 		wdebi(av7110, DEBINOSWAP, BUFF1_BASE + i * 2, 0, 2);
 	ret =3D __av7110_send_fw_cmd(av7110, cbuf, 5);
 	mutex_unlock(&av7110->dcomlock);
-	if (ret && ret!=3D-ERESTARTSYS)
+	if (ret && ret !=3D -ERESTARTSYS)
 		printk(KERN_ERR "dvb-ttpci: WriteText error %d\n", ret);
 	return ret;
 }
@@ -861,13 +861,13 @@ static inline int LoadBitmap(struct av7110 *av7110,

 	av7110->bmp_state =3D BMP_LOADING;
 	if	(format =3D=3D OSD_BITMAP8) {
-		bpp=3D8; delta =3D 1;
+		bpp =3D 8; delta =3D 1;
 	} else if (format =3D=3D OSD_BITMAP4) {
-		bpp=3D4; delta =3D 2;
+		bpp =3D 4; delta =3D 2;
 	} else if (format =3D=3D OSD_BITMAP2) {
-		bpp=3D2; delta =3D 4;
+		bpp =3D 2; delta =3D 4;
 	} else if (format =3D=3D OSD_BITMAP1) {
-		bpp=3D1; delta =3D 8;
+		bpp =3D 1; delta =3D 8;
 	} else {
 		av7110->bmp_state =3D BMP_NONE;
 		return -EINVAL;
@@ -927,8 +927,8 @@ static u32 RGB2YUV(u16 R, u16 G, u16 B)
 	u16 Y, Cr, Cb;

 	y =3D R * 77 + G * 150 + B * 29;	/* Luma=3D0.299R+0.587G+0.114B 0..65535=
 */
-	u =3D 2048 + B * 8 -(y >> 5);	/* Cr 0..4095 */
-	v =3D 2048 + R * 8 -(y >> 5);	/* Cb 0..4095 */
+	u =3D 2048 + B * 8 - (y >> 5);	/* Cr 0..4095 */
+	v =3D 2048 + R * 8 - (y >> 5);	/* Cb 0..4095 */

 	Y =3D y / 256;
 	Cb =3D u / 16;
@@ -944,7 +944,7 @@ static int OSDSetColor(struct av7110 *av7110, u8 color=
, u8 r, u8 g, u8 b, u8 ble
 	u16 ch, cl;
 	u32 yuv;

-	yuv =3D blend ? RGB2YUV(r,g,b) : 0;
+	yuv =3D blend ? RGB2YUV(r, g, b) : 0;
 	cl =3D (yuv & 0xffff);
 	ch =3D ((yuv >> 16) & 0xffff);
 	ret =3D SetColor_(av7110, av7110->osdwin, bpp2pal[av7110->osdbpp[av7110-=
>osdwin]],
@@ -985,7 +985,7 @@ static int OSDSetBlock(struct av7110 *av7110, int x0, =
int y0,
 {
 	uint w, h, bpp, bpl, size, lpb, bnum, brest;
 	int i;
-	int rc,release_rc;
+	int rc, release_rc;

 	w =3D x1 - x0 + 1;
 	h =3D y1 - y0 + 1;
@@ -1084,14 +1084,14 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_=
t *dc)
 			u8 r, g =3D 0, b =3D 0, blend =3D 0;

 			ret =3D 0;
-			for (i =3D 0; i<len; i++) {
+			for (i =3D 0; i < len; i++) {
 				if (get_user(r, colors + i * 4) ||
 				    get_user(g, colors + i * 4 + 1) ||
 				    get_user(b, colors + i * 4 + 2) ||
 				    get_user(blend, colors + i * 4 + 3)) {
 					ret =3D -EFAULT;
 					break;
-				    }
+				}
 				ret =3D OSDSetColor(av7110, dc->color + i, r, g, b, blend);
 				if (ret)
 					break;
@@ -1177,7 +1177,7 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 	}

 	mutex_unlock(&av7110->osd_mutex);
-	if (ret=3D=3D-ERESTARTSYS)
+	if (ret =3D=3D -ERESTARTSYS)
 		dprintk(1, "av7110_osd_cmd(%d) returns with -ERESTARTSYS\n",dc->cmd);
 	else if (ret)
 		dprintk(1, "av7110_osd_cmd(%d) returns with %d\n",dc->cmd,ret);
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/me=
dia/av7110/av7110_hw.h
index df13d55f7..3aff5db56 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -394,8 +394,8 @@ static inline u32 irdebi(struct av7110 *av7110, u32 co=
nfig, int addr, u32 val, u
 {
 	u32 res;

-	res=3Dav7110_debiread(av7110, config, addr, count);
-	if (count<=3D4)
+	res =3D av7110_debiread(av7110, config, addr, count);
+	if (count <=3D 4)
 		memcpy(av7110->debi_virt, (char *) &res, count);
 	return res;
 }
@@ -416,7 +416,7 @@ static inline u32 rdebi(struct av7110 *av7110, u32 con=
fig, int addr, u32 val, un
 	u32 res;

 	spin_lock_irqsave(&av7110->debilock, flags);
-	res=3Dav7110_debiread(av7110, config, addr, count);
+	res =3D av7110_debiread(av7110, config, addr, count);
 	spin_unlock_irqrestore(&av7110->debilock, flags);
 	return res;
 }
diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging=
/media/av7110/av7110_ipack.c
index 9a2b51d54..fc953db36 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -123,7 +123,7 @@ static void write_ipack(struct ipack *p, const u8 *dat=
a, int count)
 		p->count =3D 6;
 	}

-	if (p->count + count < p->size){
+	if (p->count + count < p->size) {
 		memcpy(p->buf+p->count, data, count);
 		p->count +=3D count;
 	} else {
@@ -137,7 +137,7 @@ static void write_ipack(struct ipack *p, const u8 *dat=
a, int count)
 	}
 }

-int av7110_ipack_instant_repack (const u8 *buf, int count, struct ipack *=
p)
+int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p=
)
 {
 	int l;
 	int c =3D 0;
@@ -170,10 +170,10 @@ int av7110_ipack_instant_repack (const u8 *buf, int =
count, struct ipack *p)
 			case PROG_STREAM_MAP:
 			case PRIVATE_STREAM2:
 			case PROG_STREAM_DIR:
-			case ECM_STREAM     :
-			case EMM_STREAM     :
-			case PADDING_STREAM :
-			case DSM_CC_STREAM  :
+			case ECM_STREAM:
+			case EMM_STREAM:
+			case PADDING_STREAM:
+			case DSM_CC_STREAM:
 			case ISO13522_STREAM:
 				p->done =3D 1;
 				fallthrough;
@@ -334,7 +334,7 @@ int av7110_ipack_instant_repack (const u8 *buf, int co=
unt, struct ipack *p)

 				if (c =3D=3D count)
 					return count;
-				if (p->which > 2){
+				if (p->which > 2) {
 					if ((p->flag2 & PTS_DTS_FLAGS) =3D=3D PTS_ONLY) {
 						while (c < count && p->which < 7) {
 							p->pts[p->which - 2] =3D buf[c];
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index 3bf08cbcf..c494e940d 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -26,7 +26,7 @@

 int msp_writereg(struct av7110 *av7110, u8 dev, u16 reg, u16 val)
 {
-	u8 msg[5] =3D { dev, reg >> 8, reg & 0xff, val >> 8 , val & 0xff };
+	u8 msg[5] =3D { dev, reg >> 8, reg & 0xff, val >> 8, val & 0xff };
 	struct i2c_msg msgs =3D { .flags =3D 0, .len =3D 5, .buf =3D msg };

 	switch (av7110->adac_type) {
@@ -53,7 +53,7 @@ static int msp_readreg(struct av7110 *av7110, u8 dev, u1=
6 reg, u16 *val)
 	u8 msg1[3] =3D { dev, reg >> 8, reg & 0xff };
 	u8 msg2[2];
 	struct i2c_msg msgs[2] =3D {
-		{ .flags =3D 0	   , .len =3D 3, .buf =3D msg1 },
+		{ .flags =3D 0,        .len =3D 3, .buf =3D msg1 },
 		{ .flags =3D I2C_M_RD, .len =3D 2, .buf =3D msg2 }
 	};

@@ -132,7 +132,7 @@ static int ves1820_writereg(struct saa7146_dev *dev, u=
8 addr, u8 reg, u8 data)
 	return 0;
 }

-static int tuner_write(struct saa7146_dev *dev, u8 addr, u8 data [4])
+static int tuner_write(struct saa7146_dev *dev, u8 addr, u8 data[4])
 {
 	struct av7110 *av7110 =3D dev->ext_priv;
 	struct i2c_msg msg =3D { .addr =3D addr, .flags =3D 0, .buf =3D data, .l=
en =3D 4 };
@@ -724,7 +724,7 @@ int av7110_init_analog_module(struct av7110 *av7110)
 	msp_writereg(av7110, MSP_WR_DSP, 0x0007, 0x7f00); // SCART 1 volume
 	msp_writereg(av7110, MSP_WR_DSP, 0x000d, 0x1900); // prescale SCART

-	if (i2c_writereg(av7110, 0x48, 0x01, 0x00)!=3D1) {
+	if (i2c_writereg(av7110, 0x48, 0x01, 0x00) !=3D 1) {
 		pr_info("saa7113 not accessible\n");
 	} else {
 		u8 *i =3D saa7113_init_regs;
diff --git a/drivers/staging/media/av7110/dvb_filter.c b/drivers/staging/m=
edia/av7110/dvb_filter.c
index 8c2eca5dc..4f1f92290 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.c
+++ b/drivers/staging/media/av7110/dvb_filter.c
@@ -26,10 +26,10 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct=
 dvb_audio_info *ai, int p
 	u8 frame =3D 0;
 	int fr =3D 0;

-	while ( !found  && c < count){
+	while (!found  && c < count) {
 		u8 *b =3D mbuf+c;

-		if ( b[0] =3D=3D 0x0b &&  b[1] =3D=3D 0x77 )
+		if (b[0] =3D=3D 0x0b &&  b[1] =3D=3D 0x77)
 			found =3D 1;
 		else {
 			c++;
@@ -52,8 +52,8 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct d=
vb_audio_info *ai, int p
 	if (pr)
 		printk(KERN_CONT "  BRate: %d kb/s", (int) ai->bit_rate/1000);

-	ai->frequency =3D (headr[2] & 0xc0 ) >> 6;
-	fr =3D (headr[2] & 0xc0 ) >> 6;
+	ai->frequency =3D (headr[2] & 0xc0) >> 6;
+	fr =3D (headr[2] & 0xc0) >> 6;
 	ai->frequency =3D freq[fr]*100;
 	if (pr)
 		printk(KERN_CONT "  Freq: %d Hz\n", (int) ai->frequency);
@@ -70,46 +70,46 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct=
 dvb_audio_info *ai, int p
 void dvb_filter_pes2ts_init(struct dvb_filter_pes2ts *p2ts, unsigned shor=
t pid,
 			    dvb_filter_pes2ts_cb_t *cb, void *priv)
 {
-	unsigned char *buf=3Dp2ts->buf;
-
-	buf[0]=3D0x47;
-	buf[1]=3D(pid>>8);
-	buf[2]=3Dpid&0xff;
-	p2ts->cc=3D0;
-	p2ts->cb=3Dcb;
-	p2ts->priv=3Dpriv;
+	unsigned char *buf =3D p2ts->buf;
+
+	buf[0] =3D 0x47;
+	buf[1] =3D (pid >> 8);
+	buf[2] =3D pid & 0xff;
+	p2ts->cc =3D 0;
+	p2ts->cb =3D cb;
+	p2ts->priv =3D priv;
 }

 int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts, unsigned char *pes,
 		      int len, int payload_start)
 {
-	unsigned char *buf=3Dp2ts->buf;
-	int ret=3D0, rest;
+	unsigned char *buf =3D p2ts->buf;
+	int ret =3D 0, rest;

 	//len=3D6+((pes[4]<<8)|pes[5]);

 	if (payload_start)
-		buf[1]|=3D0x40;
+		buf[1] |=3D 0x40;
 	else
-		buf[1]&=3D~0x40;
-	while (len>=3D184) {
-		buf[3]=3D0x10|((p2ts->cc++)&0x0f);
+		buf[1] &=3D ~0x40;
+	while (len >=3D 184) {
+		buf[3] =3D 0x10 | ((p2ts->cc++) & 0x0f);
 		memcpy(buf+4, pes, 184);
 		if ((ret=3Dp2ts->cb(p2ts->priv, buf)))
 			return ret;
-		len-=3D184; pes+=3D184;
-		buf[1]&=3D~0x40;
+		len -=3D 184; pes +=3D 184;
+		buf[1] &=3D ~0x40;
 	}
 	if (!len)
 		return 0;
-	buf[3]=3D0x30|((p2ts->cc++)&0x0f);
-	rest=3D183-len;
+	buf[3] =3D 0x30 | ((p2ts->cc++) & 0x0f);
+	rest =3D 183 - len;
 	if (rest) {
-		buf[5]=3D0x00;
+		buf[5] =3D 0x00;
 		if (rest-1)
 			memset(buf+6, 0xff, rest-1);
 	}
-	buf[4]=3Drest;
+	buf[4] =3D rest;
 	memcpy(buf+5+rest, pes, len);
 	return p2ts->cb(p2ts->priv, buf);
 }
diff --git a/drivers/staging/media/av7110/dvb_filter.h b/drivers/staging/m=
edia/av7110/dvb_filter.h
index 928b33436..43a36d653 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.h
+++ b/drivers/staging/media/av7110/dvb_filter.h
@@ -227,7 +227,7 @@ struct dvb_audio_info {
 	u32 bit_rate;
 	u32 frequency;
 	u32 mode;
-	u32 mode_extension ;
+	u32 mode_extension;
 	u32 emphasis;
 	u32 framesize;
 	u32 off;
=2D-
2.34.0


