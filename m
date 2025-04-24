Return-Path: <linux-media+bounces-30891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20836A99F70
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 05:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841FE922D13
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 03:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2741A8F79;
	Thu, 24 Apr 2025 03:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ctgxr0x1"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9565444C77;
	Thu, 24 Apr 2025 03:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745464347; cv=none; b=Ga0iHd0zJaHf/+Xe+dcqbugqA/8pyMmXWLoxLgco12RPNFseK2wKEKUGbsKq4lMxS+rkSk0QhNAAV0rb1x4CpqxrzeO544uXN5vF+70nkPQYJHRE0mejQort062AeA0+LnvMXX1HoJlgY1NgZFESqEad2SrON3EElrqiD6KvYCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745464347; c=relaxed/simple;
	bh=KxI7ZwwdRe9K0y2ib/3b0x21CNzXlTubOfKD4w810Nc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s0j9lwLlOc9HN7N39pPBVbo2lrhQcx0KYAAvGFbEgsXk7UzMmAeA16knWg50FUOYPooWefSU57abGSPXSa/Iu7/CIDz3DEYwOCBciC8JnekAgGoPUpXLMD/FZr5YCZIuF0JP3CZ2K9h3R5QjLWOjx0DARkiN23P718FbHm1Z6J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ctgxr0x1; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=A09Ml
	t/Mb26VyS9VXRXqUFoJt2UqYjVyFJddK4O2fxQ=; b=ctgxr0x1JThALzXsRdeaN
	7pkAerYCeHPIosPVi8PI4o1TwF42xWo2lXhxOLesmiq7GY365TGJYlLDWy5ZIA68
	8KDOXv5lQ/4LT7TrFlYuDlFV17VV4CglWrpitQSy4HPeQ/YsC2mvTINGJFffXdaA
	J3OQV8R32qvzPBUGwoYJ7M=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnTxrBqwloZo4dCA--.57924S4;
	Thu, 24 Apr 2025 11:10:58 +0800 (CST)
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
	stable@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 RESEND] media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
Date: Thu, 24 Apr 2025 11:10:53 +0800
Message-Id: <20250424031053.3508137-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnTxrBqwloZo4dCA--.57924S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxtFWfKr15GFy5JFyxKrg_yoWkWwc_CF
	4FqryxXrWUC3ySy3W5tF1I934Sqrs29rWFq3Z0vFZ5XFWjy3WYvr4qvws3X34jgryS9F9I
	yr18Jr1akr12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtCJPDUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbB0gA5bmgJqTxwAgAAsD

Add video_device_release() in label 'err_m2m' to release the memory
allocated by video_device_alloc() and prevent potential memory leaks.
Remove the reduntant code in label 'err_m2m'.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
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


