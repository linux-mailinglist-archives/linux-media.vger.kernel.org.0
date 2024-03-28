Return-Path: <linux-media+bounces-8048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 098ED88F516
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 348F91C2ABFA
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649C924A06;
	Thu, 28 Mar 2024 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="qp/VxAWq"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9822EED
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591574; cv=none; b=HWD3v4qdjGyZHMBb+dQfUl70nwYkGvwN1dzcuzaq0nC4vmlclwZHarfsmfHGvPJqPkgutBjWr8H9F2otd7ssboJxHbYr1uPseU0qzQW/V0JMA+W8HMGhrdp7SEhAl3TcTi3ozMTm8Jk4X7Gu62H+giAMisCoOeYsZiH1S8Dtw7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591574; c=relaxed/simple;
	bh=IaO7ZI4UXJtPj3wwfONskD865kzg5SnwtlCBXUqSN0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gc3fwoLuJneRP2/CgPjiTvrt6/XRaM0HQOpohKR6GDO/mzmw+7aj88dL4d4Rd9vtdkGHmsN/9EPNLtLZ3zlo6m7cPqEIINC2s4TU1Cs2nrU+q0CnRaZESJUr1U/z+S55J6RR8qrLFVh8bjtnPhi5onAgSjve3iRTQgvvELUbWKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=qp/VxAWq; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591567; x=1712196367; i=herdler@nurfuerspam.de;
	bh=WzcbaxvF9EXqQthqRHiHnhJvTEw5DR6CSRKhlVRmBGg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=qp/VxAWq1UAvtXaTKjkjaketw2bgGZl2TA54K+pkbpzTtCqO0ursJrS1Nd0ZDsB1
	 ciBM7jLaIeaGcJDPCrIKJ+nvPqU7z8LnoDYCRh5KhTTeDf7Q2/igXJUGlGMZKHlUy
	 vTWrDgu71AauXfgMj3fGdxqiLU4YVVyNHQXh8vBoihnozJZu2VnCkMAT4AypgE7dv
	 9jzQ6bbMqnRLnr/h/WbvzyD09sFYH5fFjxiErBPYawNJ0ZdBhIG+XNzE/Dl25jTcG
	 6pqtUBgK7M8PWYCd3EvW2xF6ZYNnLkX+4uWzuPRK2sD4k8rpnoGSf/EWjgFXOSdTp
	 fF0nMJwZphqZeTV3oQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1sKPSp1oqO-00UpsQ; Thu, 28
 Mar 2024 03:06:07 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 03/11] media: ttpci: checkpatch fixes: comments
Date: Thu, 28 Mar 2024 03:05:14 +0100
Message-Id: <20240328020522.50995-4-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240328020522.50995-1-herdler@nurfuerspam.de>
References: <20240328020522.50995-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5pmpVAbdKsJoTrEuBotOxXZ7nzgejW1R/4G3oqkjqJLpcCJMPri
 agyDHgrj3GKzddPPo4n4pDHf+1EsZVO/heDgo8PCtDaN6OAsrI4RSRf3Fruupjmsv3Vo83R
 ZaigWNTlwQ5FCN6CA6OClRBOKw+k8442aEgkJvGqKL8Wi+8EkdN8LKaOEAwZt+J7uh1CU6C
 oYP+r2pI8BLMNeuHHoJsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8Zfz3IQcEEQ=;cBZrVTX36XwKxcPkV6aoxqFJPSN
 VC1YniBA/UdzGHmYhXUCIlQ10WIgDr3CO3qpTUKr0DeuJ4W2FB8SML80PpkPvmp+tkd9zub4+
 Wi+Lz0QhhJVOT+bMu4fNejc1gIWywo8jOlZaHjBH2eksbLk2ZOzOebkzbERPuEuK9tDFLJxVf
 po13yMk8xTw9J2sRs4/Q2ro5/oPp9/wpQ0dC+Zmnh5UfUiK6Wab/yARrgG/8QuJHD1QfQs/m1
 Ki6crpKxkarc/ojkpAd4TFlB2h8YFYrR4BqlJA+0I7AjyOqYr4fK30B0VB6VtW8hVRfPvXiSk
 K+5gO39fqg6Am/u5GyDoHvTpQjemGmAcOc908ag8Pttz/MR6XaPVlrGmPwsjobZFGRmKWgz6D
 yIxgUpDcYWaKoTJrLbxjj7W+xDbYZaoU7LBk6r+ZBUjAbMDGEl27i4z3jHNW/o5L64Z3Xmnxs
 okTJLrKAqj82wn5yUhFCEhuziyOPFSEDnf/wh2eBaMyHjpOD8/xkMqErMxbxVUnTYypSpTKgU
 HtUZmLT5R66+sgMoKxMgRdjlsC1Yc6GNEoyANDO4/n96MBMxxAECsXauZ2VwKHf/59FaV9C6z
 3I1bsyZrapNxiq0H1y1ORXuZFbynHRQ8pJzhqs7CoSWk7aMO4rUF00/KEnLplyjHhm/Ek/nR1
 RLHNVPOqAC7GeiglEcp6VuYPAcVvfeF1NsfGyhL1u1yNHTfKfrHwWOy99rFKXUnj/Rie6rmLG
 RyzODc5rlm4gLS8DChkIwOTEDdNPsC9IctEkr2b5uDUT8jetJRjGlupEWgi9b7k35lUQGTxVv
 sVFRVOl/f5U5k2nxLEEz64yAaId68TuDFBP28yNUhI98w=

This patch fixes the following checkpatch warnings:

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separat=
e line
WARNING: It's generally not useful to have the filename in the file


Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

 drivers/media/pci/ttpci/budget-av.c   | 20 ++++++++++++--------
 drivers/media/pci/ttpci/budget-ci.c   |  3 ++-
 drivers/media/pci/ttpci/budget-core.c |  8 +++++---
 drivers/media/pci/ttpci/budget.c      | 27 +++++++++++++++++----------
 4 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index b9efcd3cc..dbd4ef40e 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * budget-av.c: driver for the SAA7146 based Budget DVB cards
- *              with analog video in
+ * budget-av.ko: driver for the SAA7146 based Budget DVB cards
+ *               with analog video input (and optionally with CI)
  *
  * Compiled from various sources by Michael Hunold <michael@mihu.de>
  *
@@ -63,8 +63,8 @@ struct budget_av {

 static int ciintf_slot_shutdown(struct dvb_ca_en50221 *ca, int slot);

-
-/* GPIO Connections:
+/*
+ * GPIO Connections:
  * 0 - Vcc/Reset (Reset is controlled by capacitor). Resets the frontend =
*AS WELL*!
  * 1 - CI memory select 0=3D>IO memory, 1=3D>Attribute Memory
  * 2 - CI Card Enable (Active Low)
@@ -267,8 +267,10 @@ static int ciintf_poll_slot_status(struct dvb_ca_en50=
221 *ca, int slot, int open
 	if (slot !=3D 0)
 		return -EINVAL;

-	/* test the card detect line - needs to be done carefully
-	 * since it never goes high for some CAMs on this interface (e.g. topupt=
v) */
+	/*
+	 * test the card detect line - needs to be done carefully
+	 * since it never goes high for some CAMs on this interface (e.g. topupt=
v)
+	 */
 	if (budget_av->slot_status =3D=3D SLOTSTATUS_NONE) {
 		saa7146_setgpio(saa, 3, SAA7146_GPIO_INPUT);
 		udelay(1);
@@ -281,12 +283,14 @@ static int ciintf_poll_slot_status(struct dvb_ca_en5=
0221 *ca, int slot, int open
 		saa7146_setgpio(saa, 3, SAA7146_GPIO_OUTLO);
 	}

-	/* We also try and read from IO memory to work round the above detection=
 bug. If
+	/*
+	 * We also try and read from IO memory to work round the above detection=
 bug. If
 	 * there is no CAM, we will get a timeout. Only done if there is no cam
 	 * present, since this test actually breaks some cams :(
 	 *
 	 * if the CI interface is not open, we also do the above test since we
-	 * don't care if the cam has problems - we'll be resetting it on open() =
anyway */
+	 * don't care if the cam has problems - we'll be resetting it on open() =
anyway
+	 */
 	if ((budget_av->slot_status =3D=3D SLOTSTATUS_NONE) || (!open)) {
 		saa7146_setgpio(budget_av->budget.dev, 1, SAA7146_GPIO_OUTLO);
 		result =3D ttpci_budget_debiread(&budget_av->budget, DEBICICAM, 0, 1, 0=
, 1);
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci=
/budget-ci.c
index 2859b8ab8..ebf340417 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * budget-ci.c: driver for the SAA7146 based Budget DVB cards
+ * budget-ci.ko: driver for the SAA7146 based Budget DVB cards
+ *               with CI (but without analog video input)
  *
  * Compiled from various sources by Michael Hunold <michael@mihu.de>
  *
diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttp=
ci/budget-core.c
index ffa659be1..f41f4eea7 100644
=2D-- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * budget-core.c: driver for the SAA7146 based Budget DVB cards
+ * budget-core.ko: base-driver for the SAA7146 based Budget DVB cards
  *
  * Compiled from various sources by Michael Hunold <michael@mihu.de>
  *
@@ -491,8 +491,10 @@ int ttpci_budget_init(struct budget *budget, struct s=
aa7146_dev *dev,
 	spin_lock_init(&budget->feedlock);
 	spin_lock_init(&budget->debilock);

-	/* the Siemens DVB needs this if you want to have the i2c chips
-	   get recognized before the main driver is loaded */
+	/*
+	 * the Siemens DVB needs this if you want to have the i2c chips
+	 * get recognized before the main driver is loaded
+	 */
 	if (bi->type !=3D BUDGET_FS_ACTIVY)
 		saa7146_write(dev, GPIO_CTRL, 0x500000);	/* GPIO 3 =3D 1 */

diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index faa2a3561..9fe087add 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * budget.c: driver for the SAA7146 based Budget DVB cards
+ * budget.ko: driver for the SAA7146 based Budget DVB cards
+ *            without analog video input or CI
  *
  * Compiled from various sources by Michael Hunold <michael@mihu.de>
  *
@@ -50,9 +51,11 @@ static void Set22K(struct budget *budget, int state)
 	saa7146_setgpio(dev, 3, (state ? SAA7146_GPIO_OUTHI : SAA7146_GPIO_OUTLO=
));
 }

-/* Diseqc functions only for TT Budget card */
-/* taken from the Skyvision DVB driver by
-   Ralph Metzler <rjkm@metzlerbros.de> */
+/*
+ * Diseqc functions only for TT Budget card
+ * taken from the Skyvision DVB driver by
+ * Ralph Metzler <rjkm@metzlerbros.de>
+ */

 static void DiseqcSendBit(struct budget *budget, int data)
 {
@@ -675,9 +678,11 @@ static void frontend_init(struct budget *budget)
 					tt1600_stv090x_config.tuner_set_refclk	  =3D ctl->tuner_set_refclk;
 					tt1600_stv090x_config.tuner_get_status	  =3D ctl->tuner_get_status;

-					/* call the init function once to initialize
-					   tuner's clock output divider and demod's
-					   master clock */
+					/*
+					 * call the init function once to initialize
+					 * tuner's clock output divider and demod's
+					 * master clock
+					 */
 					if (budget->dvb_frontend->ops.init)
 						budget->dvb_frontend->ops.init(budget->dvb_frontend);

@@ -730,9 +735,11 @@ static void frontend_init(struct budget *budget)
 					tt1600_stv090x_config.tuner_set_refclk	  =3D ctl->tuner_set_refclk;
 					tt1600_stv090x_config.tuner_get_status	  =3D ctl->tuner_get_status;

-					/* call the init function once to initialize
-					   tuner's clock output divider and demod's
-					   master clock */
+					/*
+					 * call the init function once to initialize
+					 * tuner's clock output divider and demod's
+					 * master clock
+					 */
 					if (budget->dvb_frontend->ops.init)
 						budget->dvb_frontend->ops.init(budget->dvb_frontend);

=2D-
2.34.0


