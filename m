Return-Path: <linux-media+bounces-27134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F991A476C9
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 08:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28C4D188B5F9
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 07:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC83C22370F;
	Thu, 27 Feb 2025 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Pdw9TsGx"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D636438DF9;
	Thu, 27 Feb 2025 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740642384; cv=none; b=oBOeHgJxAQvmFkRj1m0cdcisw5Kadrq334YeAOafODqEydZ0nXX1rIPoMs+1TnPg0G1eyMSGCCDte6KyUUPQPEFUwL2EVkbhYmUosgw94gBhb1Nw31Gm1EK8LZ/lbzO62m5vPRpFcQHN4RP28W9exA3IJ1aV0ELmayzjLi8ct8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740642384; c=relaxed/simple;
	bh=jJwqgKWR5JOY+McBAKuUmoyfRIE0w/3F/QEWmYkYatA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VqQl2Yi29HME8PQP9ReLYgVvelQFvkDACRksMpGEF8uqqlH/a9RcCEeW/C5xNLeM+8NpnCavmvkYeEOhORrrkQ0f1POXtLFfJmZoE5uoqW9m1mcebFlEX16KFtDK0EwPvJ1I2OwjYtXdL5ZVwmFXgSiavGU+KolO3PDx1cm0dFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Pdw9TsGx; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1r95T
	CcHEiHpvMqFCEcTBmSykQv+FZGWvggAUclAA/A=; b=Pdw9TsGxqEIb8P1Njcyt2
	65sRf1XYHRd/Y87FZJJVFM9B4S1n7jBzIVrgtfyMiwaao9AucI5GaqA2BCTeXhDb
	Yd2ifvgOtUDxN86mHg4aNwTGJc/2Xgvj2+/YzKg8T8f5oy6tsbENpHM4/8BWwLsa
	oHjEHQsO9B5l7chEHKG388=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBnKk_0F8Bnz+IEPA--.57589S4;
	Thu, 27 Feb 2025 15:44:54 +0800 (CST)
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
Subject: [PATCH v2] media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
Date: Thu, 27 Feb 2025 15:44:51 +0800
Message-Id: <20250227074451.3698971-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnKk_0F8Bnz+IEPA--.57589S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxtFWfKr15GFy5JFyxKrg_yoWDtwc_CF
	4FgryxZrWUC3ySy3W5tF10v34Sqrs7urWFq3Z0va95XFWjy3WYvr4qvws3X34jgryF9F9I
	yr1rJr1akry2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtnYw7UUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbB0g0BbmfAEbmqBQAAsQ

Add video_device_release() in label 'err_m2m' to release the memory
allocated by video_device_alloc() and prevent potential memory leaks.
Remove the reduntant code in label 'err_m2m'.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
- Remove the reduntant code. Thanks, Dan!
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index e5e08c6f79f2..19fd31cb9bb0 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -912,7 +912,7 @@ imx_media_csc_scaler_device_init(struct imx_media_dev *md)
 	return &priv->vdev;
 
 err_m2m:
-	video_set_drvdata(vfd, NULL);
+	video_device_release(vfd);
 err_vfd:
 	kfree(priv);
 	return ERR_PTR(ret);
-- 
2.25.1


