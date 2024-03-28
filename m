Return-Path: <linux-media+bounces-8055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E888F51E
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EE2D1F2D080
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B5925569;
	Thu, 28 Mar 2024 02:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="Wps7U1JV"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CAA2555B
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591576; cv=none; b=Q1z4QrTQhGAXvFZESqumUML/sQN3ujya960qDy6F9h6XFAWrFgQJAMnR4Lgtu/NDjmTBGbSjWEIItIcaoynFjiO9DPFYMhnttNxEV61/ZIhnq/qggW4d0FatpGTvv16rfwK6v2POVvuLpMEGVBa8FoWH6l4r3zoIHUTQrAJNFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591576; c=relaxed/simple;
	bh=7T0ReUL8BGnd6CiDw8i9IpjzM4PrgljDQF0phkNiJLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XiThBqYNt6l5oKced24zmyh3Em3iHzCRBLyi2leuW8I6BWgKLyUPxlzPiI8nVTmztMb8Ro9aSMafM4CyExwCrT7ncb4dNtUdoUgPc0WLq0/0fPb5IsWhsaUrrEhF7/2n2wKDAtOXPT3wk5dCBKPo55stkffnx1JfC47Au1Zrkvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=Wps7U1JV; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591568; x=1712196368; i=herdler@nurfuerspam.de;
	bh=zO2Xox0HB7IS3rD+nkdyh5wz8seL2jCmE3CW7kvEmjA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Wps7U1JVRdLOn8zOwGVJIH/+IRYXSnESmoKy6Kb+lu2YyxqBOvmGql6n5yTfUl0j
	 Blgm0kQI232p2Paz50XxlVsOM4NBD+ZJBYU34cLVcqU6ek54e7VYTGokaArObeZ/K
	 yuzuZsDKwYeEjBI6dQSzXL/GIu5EZ+qYLWKlB2odg5l/el3hHu/63baQ6HUQHZ+Em
	 t9dVCbfg92vIipssJxcC2/eIP4+3MW60BxMt1grpVAd52fJ0m/4gQzQOnakKX6zOF
	 6rwCo7hT2fHQYsL18yLoiRxu+ZDq7OTErW7RaU1b2n9VwbB9b2TyX2j2Kg9Z+5kI7
	 gFy2fG8OjccTT383+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyuc-1sk5l02lLK-00wzAS; Thu, 28
 Mar 2024 03:06:08 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 08/11] media: ttpci: checkpatch fixes: constant_comparsation
Date: Thu, 28 Mar 2024 03:05:19 +0100
Message-Id: <20240328020522.50995-9-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:nsBvZbu5kYE7fORE4gbtwNExM4YHBiMIVNnfEkOFY78/gFRfQfZ
 Wt9CYxjzldmQmBGMGZxg7T4SHTYNrccb/9+qYbQQz0Zi9lxAX2jDQKQW0LHoHipzve692Sd
 ecz4ecv78jmoEP7SDG+9DKsuFgVjdStVqcWNq9gVOTM/Bttz55BOg34U9khMAm2iaqzGh2t
 W4F9RC0EN7YL4c3exONAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:37HOcrPcbzQ=;M3Lei6lG3+EHAxtmPKKALKIywQV
 GFj3yrJEnt3ipmgZJsf+nL2KMpHCrcrAA4Fxq6UEFNeDdFjqKAVN7KRNaDw1EPIvniJU1s7jV
 Xtw8hVseMvMK45IQxEvAW88Kqwp5kT7OPGORuoSMxKRGVWTDzFiQfrp8PvNqz2IVrxq/8aTVE
 9M87v7MmbZiJ9mD3ISGwZAY3Opo318x0FVDFTOIDCTldSABLlpDwaYGMyOO8rttVJXRq4BCmi
 Tyi5fjcCN+hPTODrJcYT6X7mShqqJvSGNgmKebBiypzJJm2nahSysd2ppln3IO/JlQdiHv8Ki
 dfFBqXfKYtDSCPLzQ0RSokdDScaP4/ZTOxFlTg+27q3V0wsyGsHMArjWro2iozLSuFwq9QvOw
 +kONWJvFhfRYDK2LGp7xdS+vioEfQ1EoLLu1Cpq7wdIlCapzXFyN7LG1OIbjRvmsNZwU1j0dt
 cGxrNPwM9FBAcKRYGeoxRdmglfcn9LdlUH2D5eFT6mGw7nOLvn/Ww09m0+jb6pIPSazX7gD9A
 qzUHKyRoDcC6souku93KbpsJYAx7TQNHd4ywnAhxCT3Rmgdra4J94MPAVnh2VwYAEZSBpU+tv
 MxBoktYcj9KS6e6fg2dvJPP5Tc6N7WKKa0/7aGiqywkTTG/66rxRsw1387w/A3VFX4kWS10NE
 mzaVgnEyBezbwEY5lUqPvYuepeM3dLN3nxzk+wHcHXe2IykXb+SLWb9tLcL8VHVbiZhMvAR8U
 LNZXfH4DpCdQkWUVIDWlGPdX0W2jYiyA6bv8Du12tiMrsPg+3Neo91Dwy1vKPsJrh56HTWfc5
 sBlj0pNxdog8MOMlyX5ePDwvk5+YqcwOpQ/e5gXkoPWKQ=

This patch fixes the following checkpatch warnings:

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the =
right side of the test


Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

 drivers/media/pci/ttpci/budget-av.c   | 4 ++--
 drivers/media/pci/ttpci/budget-core.c | 2 +-
 drivers/media/pci/ttpci/budget.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index 06d08cf98..2781548b9 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -442,7 +442,7 @@ static int saa7113_setinput(struct budget_av *budget_a=
v, int input)
 {
 	struct budget *budget =3D &budget_av->budget;

-	if (1 !=3D budget_av->has_saa7113)
+	if (budget_av->has_saa7113 !=3D 1)
 		return -ENODEV;

 	if (input =3D=3D 1) {
@@ -1365,7 +1365,7 @@ static int budget_av_detach(struct saa7146_dev *dev)

 	dprintk(2, "dev: %p\n", dev);

-	if (1 =3D=3D budget_av->has_saa7113) {
+	if (budget_av->has_saa7113 =3D=3D 1) {
 		saa7146_setgpio(dev, 0, SAA7146_GPIO_OUTLO);

 		msleep(200);
diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttp=
ci/budget-core.c
index dc8b2de30..101695c71 100644
=2D-- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -516,7 +516,7 @@ int ttpci_budget_init(struct budget *budget, struct sa=
a7146_dev *dev,
 	ttpci_eeprom_parse_mac(&budget->i2c_adap, budget->dvb_adapter.proposed_m=
ac);

 	budget->grabbing =3D saa7146_vmalloc_build_pgtable(dev->pci, budget->buf=
fer_size, &budget->pt);
-	if (NULL =3D=3D budget->grabbing) {
+	if (budget->grabbing =3D=3D NULL) {
 		ret =3D -ENOMEM;
 		goto err_del_i2c;
 	}
diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index 76cc554d5..f14b90de6 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -790,7 +790,7 @@ static int budget_attach(struct saa7146_dev *dev, stru=
ct saa7146_pci_extension_d
 	int err;

 	budget =3D kmalloc(sizeof(struct budget), GFP_KERNEL);
-	if (NULL =3D=3D budget)
+	if (budget =3D=3D NULL)
 		return -ENOMEM;

 	dprintk(2, "dev:%p, info:%p, budget:%p\n", dev, info, budget);
=2D-
2.34.0


