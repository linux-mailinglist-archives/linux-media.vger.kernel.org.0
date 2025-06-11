Return-Path: <linux-media+bounces-34513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D126AD5843
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 16:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 024261889965
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 14:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719D229AB16;
	Wed, 11 Jun 2025 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="UP3CiPbU"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507D272E7C
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651234; cv=none; b=iEHMULp61flXnzFsOO+a72qxSXDU4xrvMD0OJ1r2t/gVw1fi1u/sVQu9BKzq3sLXrjfPRVy3j/dDsRpqcLyahKypCi/Gum+21/iF+++VF9DGHo1WkT+sidVIUuFX8uNCXjZiHQRTR22yN70H6xKFmBGzuDH/5EQAlBlclePSE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651234; c=relaxed/simple;
	bh=0pQUdo7Fg1z1Fsspi+uxEdmCfLWPhBhj6pBv7uKftBY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ja2aqTRJFnampsx1dl5QgSXQnwgTjzn9K55UBOw0ezEJG4tr4Q5v+hcVKjzoxk2c8fW9m3G62dhHq/wSheDwSC7IpSPIOwtGLkR4dLzUzCzzcDPwRuHDaax5b5/3/E8OKtdaWgmFeRSiaz99pxVvL/PRKEFMRZ14cpIJgSJbMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=UP3CiPbU; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1749651219;
	bh=C9pT23GhIrsFfueNtwNvgrBdRHk7JBAE9EsNFmLhOFo=;
	h=From:To:Cc:Subject:Date;
	b=UP3CiPbUeuDZ5QuZ7zjza4xIIUXxpTHH5OgPBualhq+RQEqKT65MVB1mCr1FlzPa1
	 tCaFJq10Z5i7e4U7BA6j6qAHsfKR9luAjeoY/5oetkxj78SVVM/zxgGQ16L6OAYa5T
	 vSGkIhpe4etsP06P1GI1SoVgpuxZYxyAZ9JKssss=
Received: from localhost.localdomain ([116.30.141.122])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id EF8140FC; Wed, 11 Jun 2025 21:59:56 +0800
X-QQ-mid: xmsmtpt1749650396tbccp307k
Message-ID: <tencent_39B2EF87C824951B6527F31CC86123F56107@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznbMGIkmB6gwqAVXNx8gnKd2KeRjHrQI/f+HWLKwKUemQ4MBwSPG
	 zIXCIVDtmyls/H+I/QGdte74EQgAKZrvsDL5g4U2FzLJa/l9dtIUJmj133cGGgzRlG2MsR4Is7Tn
	 h1u85zj23mYEANhsv92C4gopxCzmOM/jCK6pzaf5J4o9wZOIi/s47Oonu0XlboNi2YCaii4A1VDn
	 IDVWNYTKfdV7JuGXd57kSvJf+jgFraU1VDsFis48jri3kLqjrrH/f93GYG9eJ2mfGOAGk5K/E/Sm
	 t9EMe3sETg0p8rFIwT1rdZ3H6ovl6T8JCSN1O/yM1le9SuAEN+afkuHcFLuJlgGh47Be34Pipw59
	 vs4vDZ4ms54xrF99cNdEGEGmh8Ps6+OtECMx4TP6eL+d47dcQvSxvfMrd0s/R2tt7HUTDCVhPJuU
	 7JAAEccEH7WY/NuyVgaLUnCeWqwC9xrt/lw8Ej6dwf5L5SPVGDlK1bLoO3sWYmKnk2+gYp63EsKA
	 ccZ1vVAWij7Q9G15/rHfaDPIAXOMeEXPZMnIbPa3lCIOCMu9QjIShCkl9hphupEb/g2gtUIKRZne
	 3htD/kR9H6bFktWyRMS9q5DoVk05mvTUlsT0R+ncS4y8tnikFrxCCCm6oe9Hjl3wLCOeB5Yr046i
	 bKa1iwIVC8SeauTcnHKtxqMwRcNSxAhMhBXiSsV1QD3aT0ieZuTG4T98K+dBvLIg5nlOqdI9gMLc
	 l6dEDAzAFcGug7lRGb9lFYwtiC5bW9aE+tSS8kUf38HMpHENXy1odKO6GOxE0ZnW9jZlmbsUZlU1
	 fj3KCs4EJ7FBXknS0akWmHxmWh9hSDoQ3A2w5vznmqUttfwW3v4o9EyqPAZybVVuJdzP8M+JvLNg
	 e4QiswlwqIauTUANPZvT4oy0611gTDP46xu0H+iSCOKVTgOkGueQjjLYQeZRrWjTF3bCz630hRxD
	 d+/xU2Vaeee+WuvjgwG6Kf2vK8/J1W2gxHEn+m58JnMEYWzM9tpEssIaxz6cSA6oPVy067R8IFjw
	 PN98thAi1GvgFYZ+VSPXAh6cDMicNZIubmhsUzGkYKAuHR31cuhw4XZEv8+MgyBEPDzllyZfLHvb
	 dsBoErFnXWmW6k/GI=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Haipeng Jiang <haipengjiang@foxmail.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	ribalda@chromium.org,
	sebastian.fricke@collabora.com,
	bartosz.golaszewski@linaro.org,
	hljunggr@cisco.com,
	make24@iscas.ac.cn,
	viro@zeniv.linux.org.uk
Cc: linux-media@vger.kernel.org,
	Haipeng Jiang <haipengjiang@foxmail.com>
Subject: [PATCH] media: v4l2-dev: optimize device node number allocation logic
Date: Wed, 11 Jun 2025 21:59:26 +0800
X-OQ-MSGID: <20250611135926.827-1-haipengjiang@foxmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the device node number selection to:
1. Avoid redundant search in auto-allocation case (nr < 0)
2. Simplify error handling with unified boundary check
3. Maintain identical behavior for both auto and specific allocation

For automatic allocation (start = 0):
- Only search [0, minor_cnt) once
- Return -ENFILE if no free node found

For specific node request (start > 0):
- First search [start, minor_cnt)
- Then search [0, start) if first fails
- Return -ENFILE if both ranges have no free node

Signed-off-by: Haipeng Jiang <haipengjiang@foxmail.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d9..23d04c890e6b 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -907,6 +907,7 @@ int __video_register_device(struct video_device *vdev,
 	int ret;
 	int minor_offset = 0;
 	int minor_cnt = VIDEO_NUM_DEVICES;
+	int start;
 	const char *name_base;
 
 	/* A minor value of -1 marks this video device as never
@@ -994,10 +995,11 @@ int __video_register_device(struct video_device *vdev,
 
 	/* Pick a device node number */
 	mutex_lock(&videodev_lock);
-	nr = devnode_find(vdev, nr == -1 ? 0 : nr, minor_cnt);
-	if (nr == minor_cnt)
-		nr = devnode_find(vdev, 0, minor_cnt);
-	if (nr == minor_cnt) {
+	start = (nr < 0) ? 0 : nr;
+	nr = devnode_find(vdev, start, minor_cnt);
+	if (nr == minor_cnt && start != 0)
+		nr = devnode_find(vdev, 0, start);
+	if (nr == (start != 0 ? start : minor_cnt)) {
 		pr_err("could not get a free device node number\n");
 		mutex_unlock(&videodev_lock);
 		return -ENFILE;
-- 
2.46.2.windows.1


