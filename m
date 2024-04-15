Return-Path: <linux-media+bounces-9298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153738A46EB
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469F81C21B66
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C5C171C4;
	Mon, 15 Apr 2024 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="AArGiY9V"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834B315E9B
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147881; cv=none; b=HlXnf7/jKK3VkI2qIn1t/K0lU8sAwWj8Vd7KzNv91MeyX1E2SoWCQCxc6ifPAbKBVTfIYlffboePuu7tCx5GgWTacy4i2zYuAnA1+aJ9jsR8NX/NTVPB1LXd6OCrE6uyLPPwip7B63/vJu13YPl2f2BzfUCNW8byk7V9B/Of39k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147881; c=relaxed/simple;
	bh=9/2fEs994sT1la1BvyKMLzn+d06NMmD69lCfmyeO1t8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PFrun4GrpfVMkM+fayVb1XiOk2+7cT7HsEg1VP8KIvCaIE6R87vKnHHaeMgBYPZqh1/QAIKFP0CqRPxJSTXI1+3/vrKQFRcmj/GldYS1ufpErpNkyRL+NysY+MPijMTofbJmnffWfh8YWt0iIu++7slBN+UfPdzWRD+3MeIxass=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=AArGiY9V; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147873; x=1713752673; i=herdler@nurfuerspam.de;
	bh=CbAS53TIn0EewL//xgHeGHMMFqzx4Scdmoo4mIk1TAg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=AArGiY9Vl5xmMcmtDm+GcyjVkfKLhWV49x6YLY+iO7MPFhxTo1z89eZF8YimaOHA
	 /TxE3w7C0b0AZ/OmbKluLK2wyP85GYaYPwViNtqLF6xnpuzhyLMMB+kqkKvWG0OUb
	 rN3h5AuO3y+ZHrGxjxWi6pbbdHGS3c51E/WH0BcbiIWFONUnIPMGNgziu6QLvnVBP
	 3LTLiKetaZbtTyuEmtq130Bclr4jG08RBWqsXzJnC3jcOq6u1l0mQMHsIlN54f6RR
	 y3Uc5aR0576Jp2UxPwzaUKRj9fSw2ldri2AcNHOi9+4yp6h1r6e7rLgeRVbaTXW+U
	 ztBhzeaHYmpBCuiFgg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79yQ-1so3gr2AzU-017XiE; Mon, 15
 Apr 2024 04:24:33 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 09/10] media: ttpci: coding style fixes: miscellaneous
Date: Mon, 15 Apr 2024 04:24:10 +0200
Message-Id: <20240415022411.234580-10-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:OTINwXjduvIZWK3F4ArTeA+ASShc773m0NVOg9g8RAShociMrrV
 GeCHC+58tYq26ZcLZrWGMN2O6Gzv6gwagvRZ8basGjhgCfFzt8WI9qrfNTuKrRYN9d9J5Mi
 MddnCzr6K9ZTWjHLX0SQYfv+SpYvCI2R4a/KjOMjwdd5kYN2BthGDpbDFQn4RaUissscgec
 y7yHFoa5esbF3Bjzn2AvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6X7LL7CqeU4=;UK9qQEr93CzXc3+Vt0DU2OgBifC
 LKumlsfg5wJf+4ksYEGRkJ8GIKm+6oDV7+5KmW51AWUct2jnnmfnmXXxuyqq3FRn5at1dIPz6
 8VSLYWiSeg4e9+mAZ74CEe4W0fUnc4victp8Po4csMAMOu8j8Rze3AsBa/GDzOrayur0Jtyro
 9HKZTTThDQ4nwUIWFqbTe/136gQMvMLFsulNtSl1SIHgckABvwLIIt5GxnWH6I5/NNNZQSt6O
 iQ+0FpvM1q/YbNnvuMOU0wuQqoBq3ZEe3lXbkIc3YhKfuYMdQmyMumhjMZKfivKSMYNfOMkTd
 FtngX2BsUUAHAOpMfFLnM2EbpNxsCgPZMlo0PEPTbtzCoLda/hbX2sEvizZWr20CSyQTLci3l
 u+/vswADphu2u4uKes7GgUlMpfeDy5ScVcU4ZkeatWtlB2sJlBlwAEHXY0KCb5RCIcRjwd2QB
 qeHl595i1pk/FC8VgHN7YVgXuVGvyBpocUju+u+IJ0+N6dWETd14+ZTO22xw+XGtqIkN5+2Ri
 jpG8FGiFO5tddqR6Al1YalI7a0XadyrP264HWa0kD5me5YPfYYmnZVkvWo5VoRGp4od6JdKR4
 3J9XnB9WGheA5PzCraK9fi4mTaXGOnBgU1IhvCA1KwdID9Hk38pS4YWJIGz0AVTza6bP37aAD
 qHqKNFD2PvqqnC2ohG9KYW+hm5iFnj72P1JAi22pI1vBXlX6wq73F86aIetIgj7F2l9y5Mcfk
 V1inDmzFnvvPPx90hTWhIAqxWHwEp1bJxcstlI97cWbRXX05T4Wa/eQsoC0R1eX6zEYXUCdSq
 n+Z8RGf88dS1Ep61udLlis1gA1kBqPftcsBUygp27bePY=

This patch fixes the following checkpatch warnings:

WARNING:RETURN_VOID: void function return statements are not generally use=
ful
WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon

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

 drivers/media/pci/ttpci/budget.c | 1 -
 drivers/media/pci/ttpci/budget.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index 36aef9303..91b998808 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -782,7 +782,6 @@ static void frontend_init(struct budget *budget)
 	printk("budget: Frontend registration failed!\n");
 	dvb_frontend_detach(budget->dvb_frontend);
 	budget->dvb_frontend =3D NULL;
-	return;
 }

 static int budget_attach(struct saa7146_dev *dev, struct saa7146_pci_exte=
nsion_data *info)
diff --git a/drivers/media/pci/ttpci/budget.h b/drivers/media/pci/ttpci/bu=
dget.h
index 4579243c2..ae6de6a19 100644
=2D-- a/drivers/media/pci/ttpci/budget.h
+++ b/drivers/media/pci/ttpci/budget.h
@@ -89,7 +89,7 @@ static struct budget_info x_var ## _info =3D { \
 	.type =3D x_type };	\
 static struct saa7146_pci_extension_data x_var =3D { \
 	.ext_priv =3D &x_var ## _info, \
-	.ext =3D &budget_extension };
+	.ext =3D &budget_extension }

 #define BUDGET_TT		   0
 #define BUDGET_TT_HW_DISEQC	   1
=2D-
2.34.0


