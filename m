Return-Path: <linux-media+bounces-50534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F4D17AF9
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DA9A3055DE0
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C83F341AB8;
	Tue, 13 Jan 2026 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="UIqnpgs3"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FCA2EA48F
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296858; cv=none; b=IoTdf0vbcPTB8/vKRkhPu1nk7xvGcrLD3t0JR3mY9JZso46fKtl3XamXLcUC8qUpTWWu2iMl7stR6XYAyr2tukWjkeKB28H04KQkI1u1MfRJ/0ka1So39mXwMhGk5z35+Aj3VaEZzidjgGUCuXmPUEmylMMMnEewqjULKPSr+pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296858; c=relaxed/simple;
	bh=k7LSUBeA9DlvOYaRqTZCmvGAyT2AzCvymJOUa4lgACY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=pXrFJv6tdzs4bWhof3uOkmAE30Jd4glb0x89pYK1Kh4SwdnXfqcKaafmg2DKdKmCpz2QWe2gEDcDvywOSf0KkBdI00g00aEATKr9edYySRqObGxZjIPNzZioohNq2iHBoOow8McMOS/VvhSBlQTthkN89J4kJ5o8RWfa3F0owfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=UIqnpgs3; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768296847; bh=YjYddL/2pKHYBNAKBVaIyzdnVwUZghzUWLF1Z/Yb/Jo=;
	h=From:To:Cc:Subject:Date;
	b=UIqnpgs3K4/3lN13m55c/PFqWwmUsDJog8WwbNqBAEB5w4etwB8pjlTCgbdfWWkpw
	 gEw/EGn41yzXjMB/42Z9giMzJzRkutFDnyYr38CY0IPfp3YGnAMqQNclOHHt4cju61
	 2wtpekmOGBCaombHC5ITxzUTCdCG3NqQC+Y8yAM0=
Received: from kfuzz ([202.120.234.33])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 6673D4E3; Tue, 13 Jan 2026 17:25:39 +0800
X-QQ-mid: xmsmtpt1768296339t3f4mveaq
Message-ID: <tencent_7DEC784AAFE550A8BA532E65E60491E1D705@qq.com>
X-QQ-XMAILINFO: NmhoXJR/eu5xN2f88XAyGAy8CqNO44QsoRbUBkkwBzOGpGaLENEum7D8s29Sy0
	 NXQVXI0wccjGKvpsL/McQm1rBv6jN+/gPPGaBqQMHPeoBdNZxS+eo7u8sbYnxw27yIJX3vXZtFnV
	 UBSY7YA1t0JJ/A5CI4mYktHBHt+/NG67wYc96Ob0j3dzJqm6yA5qeaMKDJf/G7dMKBCmYXKDp1Yw
	 Uchqt64lIMkG4+7bg9dCRePdTTiZz1KCOiSjrRCQnRChXeGDRDJygsm7KlMi5vGu2mRlzVbwckOq
	 9MNr7LScpQs4pirwKaBuy0396BCU18nMaUPibJ82L8AAiHoy0x4+Z+FoHJITYz/BBgbCoakoTGXD
	 tBe0+7mJlSlF4TAUkBz2i9Q1Nn/jaJHf0SYAOAbfnPzwsLGsvFafQXu2WNbPB8lg7v+Nf9IzonSg
	 1Meb1XZq2mNlBhVKkOCOUqmCrR4+PZNEYJSmqKIvS5NeK9FesNLYoXT4m8PJiTURNGkRd0b3DBSs
	 7laxol8LgWi7Yn+W6hTGmG4C30jBYKNv2BwPORmrW2ddVrNRWrnJl32kWx15nNNgAbhxU66+kGyx
	 vj+1p2Y7/rE+vdk4Rf0IdQ29Lpa7lpPr3BTuFmqYNig41tScVB5aGzDxMlI9pamB+i8LtNagMrxG
	 S/uOv1TNY0yZvboiKmWjtAWb2Xpd3RO5rEOwDiO0JlRoywJlmpqbP28N81W3T3i2bU1ONlTVXtR5
	 h3p+pbt3b2wlvKwiORS458D2LkhPaddnaOa+Uc0cymPTrXAZLARPP7uCWPLXOTlYSzfojOYSrfEq
	 o5z7PSQQ84o3LXAQaTCNl5HqNYTa9Y+5FQJ+PKyfc9DginzCHzrm6DDzel3hyZu1nUcq2EGqJ+8y
	 4+Fx8JBF1GscMIfld6za6lDJP+hPRHJKYbd/XOx6DcwqaDsVeXhyMITajCbO8Mw4Jbjr5U+Lxedi
	 FQotS0gqRtGzbBWx4d+sApGIyrIEF3gjEm2sk8TIwJL+PjmiPEAfrCi/4ImvClMzJZD1MUc/bc/m
	 D84bWecbgDwJ6xtNtt1kuNTkH4LRU=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: q1ming <1643771613@qq.com>
To: klimov.linux@gmail.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	q1ming <1643771613@qq.com>
Subject: [PATCH] media: radio-mr800: fix memory leak on error path
Date: Tue, 13 Jan 2026 09:25:37 +0000
X-OQ-MSGID: <20260113092537.60520-1-1643771613@qq.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a memory leak in usb_amradio_probe() where the v4l2 control
handler is not properly cleaned up if control registration fails.

The error handling jumps to err_ctrl instead of err_vdev, skipping
the cleanup of the v4l2 control handler and leaking memory.

Signed-off-by: qym <1643771613@qq.com>
---
 drivers/media/radio/radio-mr800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-mr800.c b/drivers/media/radio/radio-mr800.c
index cb0437b4c331..530765c7cef6 100644
--- a/drivers/media/radio/radio-mr800.c
+++ b/drivers/media/radio/radio-mr800.c
@@ -529,7 +529,7 @@ static int usb_amradio_probe(struct usb_interface *intf,
 	if (radio->hdl.error) {
 		retval = radio->hdl.error;
 		dev_err(&intf->dev, "couldn't register control\n");
-		goto err_ctrl;
+		goto err_vdev;
 	}
 	mutex_init(&radio->lock);
 
-- 
2.50.1


