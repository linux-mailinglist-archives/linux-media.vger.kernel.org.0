Return-Path: <linux-media+bounces-9289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A08A46E2
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88E53B21056
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC1818C3D;
	Mon, 15 Apr 2024 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="k41ER2Wh"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D84848D
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147879; cv=none; b=UZUX/c+Zkfw3eDUFP37nbufFg2BnluS6zJVE/VijcsNZbKu1ti6UjebF3+/dAYBbjDJ5kuBIXR7KlupU4PLrlfM49tByJze7f0+K594N4iLrmsOBB3NWpog9IqPkpiadkuPmbMbZMSzr0uYad0KKHMNBuFBGOK1X0HbRdZ9jLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147879; c=relaxed/simple;
	bh=Vtx4SPw+kf4WnbF4QEd91gh5ktah5wK6WAX0utsmhPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tCLHtx8Tean9Ztze5Y0eUIg4K1DZxzpFgrdjgeCYZtTlzni5grH6+yFiiIULEvLeA3IfGw14kiOL1H1jgvt7kf8HQnpPhYT/3h9BuDkUr3T36A/m58hYgPxxjJ5yDT/rF/vAM1TUuq4FbW9OYhJ9mJr/4nIBnHkPwtltOEgIAKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=k41ER2Wh; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147872; x=1713752672; i=herdler@nurfuerspam.de;
	bh=Uc3+xXW8rR96TkY6gqCE9zzIBx9Ap/E1B02SoMaFhO0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=k41ER2WhzceitdFZOm72GL9AF9EEExTGLFWzNGYDP25icgsQsJLTkYga5a2eWAV4
	 Ba7fzkYxfaIMOOgYXisCUKWEzGib9zl3kFZRaHpuUrylrr88OFG8gIbpxg0rPKW42
	 Za6VOoxIdmy2CShyi/pLdA7HUOzxrkbRn4lz8qkRYSfeYD5aL0TqmWHM6D8IZvXBY
	 AoHqM5RZVQQmtXlYeierugLLAV8evuiMP5LV3/zjE1ZCI3u6Ex9VY3pNU31wsk9NW
	 +vn4PsRi8dQTfUZod+5fh95gDL6+yeQgTjrTDVll4K5epuO3ApiLxjE+JiL71VOLL
	 HlDro3fWzHWwRrXmdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7Ka-1s3Mkc1CfK-00BbMq; Mon, 15
 Apr 2024 04:24:32 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 03/10] media: ttpci: coding style fixes: comments
Date: Mon, 15 Apr 2024 04:24:04 +0200
Message-Id: <20240415022411.234580-4-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240415022411.234580-1-herdler@nurfuerspam.de>
References: <20240415022411.234580-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZVCHWH0vi0pnOVyjh1v9Nuva7fwxbNeK4oFa7GQJksqm/H/SwMQ
 101+Z7T7UcdqvB4oo4OCq/fuNX6P3b57TrLSrTojHUlrg3uM+SNwWyADFOb9xicYEb0G8R4
 NUWrqeiBztk6TKXHZJURzVkeg4hIObvzrDfMYQr2H/Zi6p8BjhRGZxdbAUKDSfYknu7i3kH
 OwvECCec6QMUOk96Yzpgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h2J8Be3V9Mw=;RefS/XqpPHnhwqQu3BmMWZVcg27
 eT4k8u1C+40LIfnG/dWXcB5L19MIUFe0gkGqOGdTTPIEDM2ZfgNbyCkPF4t1X3eUo5K6Mh2/2
 xtNP532fpYC6ZRGYOOShOEBNxM1IdsISr5K03ovsxc8QWUJohiJJj2Z5x/JjkL0DqmzclnuvZ
 IZxtPDzAmpKRVhWZSkfNjyTGTt/ptv9IEB823PeelB5GibF2oA9Rvvrlby+Aq/lGMuPsBMzuE
 c0V0Soptw5udOpzVdLRMG04Wbgv00SosdnIpjJNzVvthcfLxUW9CoSXtJH+xLRB+Z+SZMpX8y
 gFEqO7cZLRFCHvUm0UeFmu3CVdBN/JJEhsRq6CoZcJSC4vwzOAJHDAg7YriwcNCgW0XeP5ihp
 UzY8Y1cvanH4+jfzGL7iMc5zsTIXe3MnNYM9TKY/8nCQJGEzBV3kwffidT2rCOxXRjUy1H3+2
 JKUx/sVd2poMCaCXLAXry6CmlW11xb72xcCHOqa4zsCQYSsNag7a4kcKj0cnJ1VmfpYiwi6q0
 GEy5TEDxXI0GYXDt4RYahMjIw2uAE97+yxEKoZPWhvQQTq0ZRExriy8lyCy36FVbnopbZH9Jb
 F5GZqKyR7Zh9ZydOkSox6k6mYFVq5vH2uvMXO1BbCoSx/bMSAWNXDVD0EE25McpJ2ozAQMdd+
 zQ5GCDkhSL9/gyZj0OA3NH4nVUVoGjToGlYr6uXXfbk3zu2j+bQ/MNvoS2SpxjrYc723UsfMY
 skQDRFZom2U5AKRz+PN1HCPOlRYP/L58asHLAPGYmywOMU6aD1FvggdAV1uWdQuLPcidAhosB
 lvtmCDcyiWjrN2xcdKsNuhrsa/s1lznlbOipdjgZtlJEE=

This patch fixes the following checkpatch warnings:

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separat=
e line
WARNING: It's generally not useful to have the filename in the file

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Changes since v1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Title

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

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


