Return-Path: <linux-media+bounces-9293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F068A46E6
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 763421C219FC
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B771C6B9;
	Mon, 15 Apr 2024 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="GGHMo1Wb"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC9C168C7
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147880; cv=none; b=mBeaMMGxZxZu5wt+xQVb1RXswwQ9ZrbsAN5af+DU+wYqkQBkyNFoiFnPPuHkaGf50Dn8/FVXMLcaajIFxP1p9GviJsI0IV/q1XPzjso1WnS+zWGftxFc98b383z9Nh+G1nsObsBcCv0ZAANmsvUUJe/JU8mNDVhXe//1xlDPmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147880; c=relaxed/simple;
	bh=+fy2X1pVT+jXud3Ov7mWj+B/J+M93Qa1meWgDAzFWB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Betlu6YbSvE9OgQDN+aBPrBOyRm0XOY0uJtYDdgOAqKmJWOptC16ZaVIv8K+Aj9NkGAjC9b2UHQvR4mzraZfLo+KjfCJZdYGEUKiw4mKHH23aA6jYk5nYwc9NcnwVnnQWFjTlTjin/7FuzEBWg0CByJV91U8mRMV6fXkeoSNyFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=GGHMo1Wb; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147873; x=1713752673; i=herdler@nurfuerspam.de;
	bh=VqR+tx/OV7+F4CCxw9lZxOl7Q+RfXmRYGoPGVnjSYro=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GGHMo1WbGJlYD06g9cqe608ho/hswhi5DnBngwn1tbipYMcOG0cWEu7wgGg+mbua
	 RV2hdVKIS+io082fqLS3awmuHGtcXRndIHCElB6QY3oFp0SuPVnB1ahUfEaC3qPe4
	 scxTXL6iHTtiBHoHknEA/rL9PJV2Jg+lJBDW8bEyFzOrE2afGIQ2jTlL8qOfy/5FD
	 dE5we7IBsyqnSymuOgFLQgvsMYrpCuGdHfQ6A4urLXY1CFCVDULq87Z+FxGC4PZ1W
	 JJalYCz0niPQnFwrEhsAiKADSwUyXse9xqaZ5g1EwUn7ovZnODkncIYkhlfVmagCX
	 b7MQHwhbeW0mENOTAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mv31W-1smv691Itk-00r1zC; Mon, 15
 Apr 2024 04:24:33 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 08/10] media: ttpci: coding style fixes: constant_comparsation
Date: Mon, 15 Apr 2024 04:24:09 +0200
Message-Id: <20240415022411.234580-9-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:iTL1ZJX6382euxib/lvqdIypFCjzTO/2VytxzaQcnqsKmJTTj0z
 qKIbvtUXaJGIpm0yRx/pAl+9+ZvmwF19+pAVvv29Xhc3IDZpfPH9Q6sd4dVrNL/ApTUEyft
 fM9MAlyJ9LmeIVNdJgSkJ+RtypNXfy44ezSr0ymA6KnvUKj3fpE2balbNnzdmEGE3GqPYSA
 4ZOfb/D+aUJMhe9UIlKJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MUKci2UfHqA=;bN2pVfSHpl6Wcxw+S7OWoq5dHMs
 khpbspC4x1pUojUVL6V6dFtg3NCP24Dg3p5xghIxvCw44hpafuvNc+8SSvMjLmdwvZDGmJeKT
 gTAZBBKNW3O+8dmfn7TrwOpiYELN1empEvyVrA8FYqkAN87xoxOcY5y5G/pIDsKNzEZrrBmwl
 0VSkrmXZL0bhvCi2PoFY+0CY+IZxrlGpHJpTH4AXjz72symXA1Nt3YJxlPZRdO42Em5+2EpoB
 hMn6kLJBbMvysReea1bEQ1rwAePydovLvp3oaVygW8bKMEzG3Q74nb/FMK/yXBrWxd1aN3zoE
 UqtPqOOmMJwUzOCtB1z58gDWVaTVSiXTtlx/zpjhxT2SoaodhZmBkeWfRYEcb0sb1qlhic7vs
 N3lFZZWL9PzliQwgEsB47iwaB8dqys7kPeYfdOZNCZAMUqc4TuiTXn9Z1bc9poiA4lpCHzb8n
 xSGmRz8ee+7MTqEoROtnLV92Xrv/+Qn94UhzHEgK4RaH/NLS6i8mQXJSlwqlh56Ybefoov2El
 o8untUYQjqSNm5U430kn9wn1SrwCAhPQ9bXxhg5F0ABTgSJyiRxMEOYqbLAlEpnbi+jLA3Qfo
 ZdnMFbZHmlhc4hmdpEftDVOrp1937EbKobG0RrrBFUgb/wtJ0U2eRq8fklFbhG78GNKXWDp/j
 wsztLVqk0XtWng/u90EFWgH+mysmhzcXN32FUgVQ/ccCAQG997lmKPvJclHRpr27BoQEY4DF2
 s4sfHraJH6N457YrYJQ23P/JRGcix42bjFJJLDlEter0wKVLGMmMhrdwQXvRT/STHtMZpFH34
 z2vL5nPOQ9XgxAkWD37eRJqYhf1qE4CgXWCUD3Q1NoPyU=

This patch fixes the following checkpatch warnings:

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the =
right side of the test

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

 drivers/media/pci/ttpci/budget-av.c   | 4 ++--
 drivers/media/pci/ttpci/budget-core.c | 2 +-
 drivers/media/pci/ttpci/budget.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index 9549e385a..76660d22f 100644
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
@@ -1366,7 +1366,7 @@ static int budget_av_detach(struct saa7146_dev *dev)

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
index 28a479ce0..36aef9303 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -791,7 +791,7 @@ static int budget_attach(struct saa7146_dev *dev, stru=
ct saa7146_pci_extension_d
 	int err;

 	budget =3D kmalloc(sizeof(struct budget), GFP_KERNEL);
-	if (NULL =3D=3D budget)
+	if (budget =3D=3D NULL)
 		return -ENOMEM;

 	dprintk(2, "dev:%p, info:%p, budget:%p\n", dev, info, budget);
=2D-
2.34.0


