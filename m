Return-Path: <linux-media+bounces-27032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD03BA45FB5
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E151173AB5
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 12:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7A72153CF;
	Wed, 26 Feb 2025 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nzYbAjZS"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C3E2CAB;
	Wed, 26 Feb 2025 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740574191; cv=none; b=bJBpYs/2FUlaC8tGjYd7enjd3RvDPoEWUeNu4vNRolsRex9waMT+ed09DUIF6oEwlazOCusmarSMJZFpeLlaSZk6rv7i8l6j/PvF94wFPdkZp6TNZo7Epurd1mVUW/lSpTQKb8HU5W866nVP5aNyM6ReHwhzEx1f8dh8cyEGGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740574191; c=relaxed/simple;
	bh=dITrfhYfSkTRNCxmowtpI3OCz2F+YfFl9lEZ/TAdmKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F6aYL9YfTJIq+MA7oDtORBSHCZMpmoiiqWQz90vvI7MneaOfaqZ/LBNGPPUJTE51epHpQQS1vFmFxHzgsdXjR2furH/dfiMAzICvlh5VUJfRRaprFHM0orq5xWhwVe0A8j7iTAElUdY5rHHrldjYkPeIMBVpw3iJLin4L8YDg3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nzYbAjZS; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QbUGY
	YPk+RS02VOby7U4Hzj9A50xV95MDQb2+4Sc4fk=; b=nzYbAjZSLXuN1R9HpRduk
	uTi7yN3OH3OxCDyQ4CIFx11vTfVfj80XAWeV+SMaQ+XPyqQ1ARm5DeX3Tp//JsCN
	aHxstxpfZhN1iQqB4CoevWtcCaRIvk+FcVgQxLQ0JRpHbZ3F5GuDekN51UgNUfAD
	RV8hafKmGoC8mBmuuzf+eY=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDX767UDb9nemzXOA--.48555S4;
	Wed, 26 Feb 2025 20:49:25 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: devarsht@ti.com,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	d-huang@ti.com,
	benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: imagination: fix a potential memory leak in e5010_probe()
Date: Wed, 26 Feb 2025 20:49:22 +0800
Message-Id: <20250226124922.3601755-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX767UDb9nemzXOA--.48555S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF17GF4kZw48XrWUXFW5Jrb_yoW8XF1rpa
	1DJay3tFWUKrsFqwsrJF4UZF98Kw1S9ayrKrsrCwn3u3s3ZasxJw45JFy0q34rJFWIk3W8
	Xr9rtF4rAF4jvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pimhF7UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqA0Abme-B1eUmgAAsN

Add video_device_release() to release the memory allocated by
video_device_alloc() if something goes wrong.

Fixes: a1e294045885 ("media: imagination: Add E5010 JPEG Encoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index c194f830577f..53e501b5ac0a 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -1057,8 +1057,11 @@ static int e5010_probe(struct platform_device *pdev)
 	e5010->vdev->lock = &e5010->mutex;
 
 	ret = v4l2_device_register(dev, &e5010->v4l2_dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register v4l2 device\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register v4l2 device\n");
+		goto fail_after_video_device_alloc;
+	}
+
 
 	e5010->m2m_dev = v4l2_m2m_init(&e5010_m2m_ops);
 	if (IS_ERR(e5010->m2m_dev)) {
@@ -1118,6 +1121,8 @@ static int e5010_probe(struct platform_device *pdev)
 	v4l2_m2m_release(e5010->m2m_dev);
 fail_after_v4l2_register:
 	v4l2_device_unregister(&e5010->v4l2_dev);
+fail_after_video_device_alloc:
+	video_device_release(e5010->vdev);
 	return ret;
 }
 
-- 
2.25.1


