Return-Path: <linux-media+bounces-8052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E036388F51B
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083E81C23808
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6687D2C84C;
	Thu, 28 Mar 2024 02:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="FeJg6tZQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2924B34
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591575; cv=none; b=fjBqoTh7iVGfjZWcnz9pg9rltQb4hKTuqpOQcgzJovm5u5jvnPfe7aZYr4dKC3SRPpoVkVfcLVOaz02VN6rXGHysPRMBjQqehWx/uGnciUcb2qew6QE+OzvCDxYdJhvcvHMn9+A4YJfrqv5A3mksGqRyZXvSIw28xKjUn0jkNFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591575; c=relaxed/simple;
	bh=GQNg+k9e37m9tYVW8cJQDgUfhvVZsnYjLGkHVG96yh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KyGe+ebTk/Jy9imfkCXQsKLK9h8g/YPforvkIOkIg83meVO+Z0ZeWh9XJAIHYkObWOUe/LgG0mCnxLnhRQtwEg7kpCIuvz6xLzkyAHRg2XSItCPD2HMb4rDaTSfsAINTZ+qYm1Q94ELNKS8HowU3DlMDR7Y0qOuToT2bAUrGtBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=FeJg6tZQ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591569; x=1712196369; i=herdler@nurfuerspam.de;
	bh=M29TQFZUAqm5ZFLmnlffQnKoDrhwUc8sevDLxtgT5uI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=FeJg6tZQbUN7OTTFkSzST7fvQj3iG3WWEvMHdtbwnx63UEmHZLrcQm52Frc7/jQ+
	 jefiM/T1w/aS9YGxK8FOSlugLjqGLoTDBkZaFj4N2MpOAIexany8+PVSsIqSEIyk/
	 RGvV2kng1WX6f2VANpDxv3N6K8YSvVkl+qEAid9PD+Azkw18+fWKhqKqylAsjt56E
	 avUVcQ4Pd/4xYxcEqgoWhZHvkGu20Pd+icNQsbVpBGa5vMY43lEmwqpNAG8YmHMEp
	 NSCxEdpcALqwYAl/KHlxQstqGb1PaRoa5XzLn21Gr/brCRwByt/YjMMNd1KyBEp7U
	 KfQHzk8I9FhIdgfaJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1rqm9V1b6C-003OTe; Thu, 28
 Mar 2024 03:06:09 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 11/11] media: ttpci: checkpatch fixes: msleep
Date: Thu, 28 Mar 2024 03:05:22 +0100
Message-Id: <20240328020522.50995-12-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:oUfRkO5U1mPMMycXApF2jIQg1wCyiA+nJWAnOGOIRVZIV7lCYz4
 EQjlHA7m1R0xjEIfZGu2SHI/LEDeqxR6PFMCIl99mobBnnBOOtXb9aY68vcWYH1s9O28ZZo
 jEOF50jUZuNsTz6pD2M2BERlePvSAENzRMALTxxctB/8qfmbZ67QjWOFjSmDvIYi5ZJV7ep
 37fJ77zD++lR0l6vQ56sA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tfwjy4zKMgw=;ikshiUP8ResWIeG7PqQZrT9+FUp
 RpEkSxWpbz6c0lOJy1s5yYNyiJMB8gjxL/DhA5sZK0w7+2MIBcteDl+xiEyoaq8Ip7JS9SyMP
 mWcsDKq2pyiJg+k1Ow0PSpw4VJakle60DiPJRCcGCmGZailODuqXFKoecOm+uPYiBvxsVoab/
 KF1H9iiZ/2AvbQxIi8MXhnBTP5gMAEt3ITd5CozYbBQFpqLglub9hdyEeF6WPbo9cGyL2vLGj
 YbWmiukaJ8VtAlBDntmtrAJ1+zUaxC1d+exyeNfvPSL2yDHTZ5WK8lO7K8jiCYiLAXaH5I9lm
 n53rTIPb/8kjniTfABIkzUg29xpk9MaQEvAgQiilCIyfaMIQRQdetLMd4My+Ay4LY4XFGc/Qu
 GVDpJ5KxoC3iCO2bd/HRqrvTUUafge/OdEWMUx9F9JXeJmJEd4PPngfP7bXCCGpSgDVWhlnAy
 l7Bck7nPZchKI9LizU8EKJDmwEEUNpmL3vTyUi7X6IBn1OqHvmnQuECidG3RlpMp1dYNDMHhm
 J582TTdHX9+IzMzQWLfgLa9RCvJh8fmkV0gP/Y+ZC6UwO8judep/nJNkT76ahGjASnLoHTn43
 bOoOhON6J2b9C5xRRgJNjhN3i6MsQbM6JCZHGAv4KbefLgjWT/FWtQOc3PdsamkUj/nR2uuWC
 mpWW7fLuyO4fhZh6TT+rTwTH2xdu+lROcVs4ebKjAVIaMfrUg1qthmkzpa8end4Mm+4lUUIfe
 aTQbdZzm23E3/MT6HNkgGxOltt9lnE1bRAleO2+I/Xm1OQLVcQl6SF6Hc0Oylwy4KfBb26bZc
 T6RnUljb3MPGOJNEosx2zpRKLEwnO4hVTeYHjH19jSL2I=

This patch fixes the following checkpatch warnings:

WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/=
timers/timers-howto.rst


The driver is working with this behaviour since years. Just replacing
all msleep < 20ms with msleep 20ms to silence the warning.
Add a comment to indicate the time choice was not hardware related.

There are only a few of these msleep in a row, the extra sleep time
won't add up to much.


Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Warning:
I'm not able to test this changes properly. None of my cards are affected
directly and I don't have a operational CAM.

I think, we have 3 options to deal with this warnings:
* Ignore them.
  This is save, but will keep the warnings.
* Use usleep_range.
  Probably dangerous, it may break the driver.
* Rise all shorter msleep to 20ms.
  This should be pretty save.
  Many of this msleep are in a row with much longer msleeps anyway and
  there are only less of 2 of these in a function.
  Most of the affected functions are init functions only.
  The most time critical msleeps I have spotted are tuning related. So
  tuning a new transponder may take up to 20ms longer on some frontends,
  in the worst case.
Nevertheless, please consider this patch as a proposal and optional.

 drivers/media/pci/ttpci/budget-av.c |  8 ++++----
 drivers/media/pci/ttpci/budget-ci.c | 10 +++++-----
 drivers/media/pci/ttpci/budget.c    |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index fd5a88e64..680e46cf1 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -211,7 +211,7 @@ static int ciintf_slot_reset(struct dvb_ca_en50221 *ca=
, int slot)
 	saa7146_setgpio(saa, 2, SAA7146_GPIO_OUTHI); /* disable card */

 	saa7146_setgpio(saa, 0, SAA7146_GPIO_OUTHI); /* Vcc off */
-	msleep(2);
+	msleep(20); // Was 2, but msleep would have slept up to 20ms nevertheles=
s.
 	saa7146_setgpio(saa, 0, SAA7146_GPIO_OUTLO); /* Vcc on */
 	msleep(20); /* 20 ms Vcc settling time */

@@ -637,7 +637,7 @@ static int philips_cu1216_tuner_set_params(struct dvb_=
frontend *fe)
 			fe->ops.i2c_gate_ctrl(fe, 1);
 		if (i2c_transfer(&budget->i2c_adap, &msg, 1) =3D=3D 1 && (buf[0] & 0x40=
))
 			break;
-		msleep(10);
+		msleep(20); // Was 10, but msleep would have slept up to 20ms neverthel=
ess.
 	}

 	/* switch the charge pump to the lower current */
@@ -679,7 +679,7 @@ static int philips_tu1216_tuner_init(struct dvb_fronte=
nd *fe)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 	if (i2c_transfer(&budget->i2c_adap, &tuner_msg, 1) !=3D 1)
 		return -EIO;
-	msleep(1);
+	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheles=
s.

 	return 0;
 }
@@ -764,7 +764,7 @@ static int philips_tu1216_tuner_set_params(struct dvb_=
frontend *fe)
 	if (i2c_transfer(&budget->i2c_adap, &tuner_msg, 1) !=3D 1)
 		return -EIO;

-	msleep(1);
+	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheles=
s.
 	return 0;
 }

diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci=
/budget-ci.c
index d821710bb..066eba67f 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -308,7 +308,7 @@ static int ciintf_slot_reset(struct dvb_ca_en50221 *ca=
, int slot)
 	}
 	budget_ci->slot_status =3D SLOTSTATUS_RESET;
 	ttpci_budget_debiwrite(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL=
, 1, 0, 1, 0);
-	msleep(1);
+	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheles=
s.
 	ttpci_budget_debiwrite(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL=
, 1,
 			       CICONTROL_RESET, 1, 0);

@@ -534,7 +534,7 @@ static void ciintf_deinit(struct budget_ci *budget_ci)

 	// reset interface
 	ttpci_budget_debiwrite(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL=
, 1, 0, 1, 0);
-	msleep(1);
+	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheles=
s.
 	ttpci_budget_debiwrite(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL=
, 1,
 			       CICONTROL_RESET, 1, 0);

@@ -706,7 +706,7 @@ static int philips_tdm1316l_tuner_init(struct dvb_fron=
tend *fe)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 	if (i2c_transfer(&budget_ci->budget.i2c_adap, &tuner_msg, 1) !=3D 1)
 		return -EIO;
-	msleep(1);
+	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheles=
s.

 	// disable the mc44BC374c (do not check for errors)
 	tuner_msg.addr =3D 0x65;
@@ -805,7 +805,7 @@ static int philips_tdm1316l_tuner_set_params(struct dv=
b_frontend *fe)
 	if (i2c_transfer(&budget_ci->budget.i2c_adap, &tuner_msg, 1) !=3D 1)
 		return -EIO;

-	msleep(1);
+	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheles=
s.
 	return 0;
 }

@@ -910,7 +910,7 @@ static int dvbc_philips_tdm1316l_tuner_set_params(stru=
ct dvb_frontend *fe)
 	if (i2c_transfer(&budget_ci->budget.i2c_adap, &tuner_msg, 1) !=3D 1)
 		return -EIO;

-	msleep(1);
+	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheles=
s.

 	return 0;
 }
diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index 3842bad8d..10599037c 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -630,9 +630,9 @@ static void frontend_init(struct budget *budget)

 		// gpio2 is connected to CLB - reset it + leave it high
 		saa7146_setgpio(budget->dev, 2, SAA7146_GPIO_OUTLO);
-		msleep(1);
+		msleep(20); // Was 1, but msleep would have slept up to 20ms neverthele=
ss.
 		saa7146_setgpio(budget->dev, 2, SAA7146_GPIO_OUTHI);
-		msleep(1);
+		msleep(20); // Was 1, but msleep would have slept up to 20ms neverthele=
ss.

 		fe =3D dvb_attach(tda10086_attach, &tda10086_config, &budget->i2c_adap)=
;
 		if (fe) {
=2D-
2.34.0


