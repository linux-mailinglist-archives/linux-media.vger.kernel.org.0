Return-Path: <linux-media+bounces-27048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046C7A46293
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A25D43B2568
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E771225408;
	Wed, 26 Feb 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="b9R/2bqE"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2209022424B;
	Wed, 26 Feb 2025 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579744; cv=none; b=ukPm1Tze8WFwEMTExmqISH7OeGSVL6LFBL1ip5IK9sCFipR9dg0L5bRkf8kxHmgifBB66rwZqqDG0VK2zlaAnAvpl31HziDGJ5IZB/lhnnAmIL8gRv0cdW+52NKMKla0uNUm8hehPyphqcR5igaB5dTja9tk1Jh1sl4UjxVETBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579744; c=relaxed/simple;
	bh=7MWAvDS1sUySSkaCp7pr/xs+1jMl8D4sSiP1dEcJvvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FwJSKGWqsYX7M4lH+Z+9/niFmAudTg2yzO7ZqlMRCMOiRhXwoQYJHa6HRTqmES7D9P3h12fmlat0lLEUwfEZgPrH8hdoE5keD932ZHbYYxGqazI1iGbVgD6C5mKn5Z6OdbHBRkGmmtWtfOpy63bpo5/DIWDlVMivUD8xW47PpPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=b9R/2bqE; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=G1DsQ
	8xw/CbJlnE26e47lsHv8AyG3/Yu1byV8dq/fhY=; b=b9R/2bqED/xY7w5nVSLAw
	9l9GF6Uf30+u9FHRoc8pgM2NYUsEG0LzNIBRoGu2ODaHN0ede47vEvmVdNsQ7SpV
	tGVVbPLlPPIQVDpyKl2dA2M5qNINFRP9BemySV0mRBHnUHlOAi/fY5vxzNiOpEJe
	4DcWLN2bot18n+BJP1vP3U=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wAHpyRoI79nVfm6Ow--.12430S4;
	Wed, 26 Feb 2025 22:21:30 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
Date: Wed, 26 Feb 2025 22:21:26 +0800
Message-Id: <20250226142126.3620482-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHpyRoI79nVfm6Ow--.12430S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF17Wr1rWw15ZrWDWFy3urg_yoWfZFX_CF
	4vgryxXrWjk393t3WYyF18Z34Sqrs29rWFq3Z0va95WFWjya4avr4qvwsYq3yjgrWS9F9x
	Ar1rJr13Kr92kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuBTYDUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqB4Abme-HD3S3gAAst

Add video_device_release() in label 'err_m2m' to release the memory
allocated by video_device_alloc() and prevent potential memory leaks.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index e5e08c6f79f2..f99c88e87a94 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -913,6 +913,7 @@ imx_media_csc_scaler_device_init(struct imx_media_dev *md)
 
 err_m2m:
 	video_set_drvdata(vfd, NULL);
+	video_device_release(vfd);
 err_vfd:
 	kfree(priv);
 	return ERR_PTR(ret);
-- 
2.25.1


