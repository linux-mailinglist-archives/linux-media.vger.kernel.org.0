Return-Path: <linux-media+bounces-42555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4BDB579FE
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 14:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 013891663D8
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 12:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EC93054F3;
	Mon, 15 Sep 2025 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EEBeOIh/"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFF52F28EF;
	Mon, 15 Sep 2025 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938220; cv=none; b=rYxBrPaQS0HxsUO9PGNVoyaFxFLSrRwDZ5vB/1q1bIDhdRpMJw1s8cR97Bcg4q4gIdIi/uMLpcxgdao6XITVuw8rnOs0izPYc0/dCVTWJj1tIMc+01c0wHGbLUgnnXfrNWht8g9MJpGI5iUkmmgw0bp/S0Xhad7batEql9eir7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938220; c=relaxed/simple;
	bh=uqn7sQTP/O+KXMPXYRFmgLHEQTjpBe9h/9/eeXkz65Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BPtcFJgDpGqE4b9vc16jRbLzhUFRSXqamlNAdMjxV+SRsxmnV9UVx4XRJmhBI/kj2z2HYnZq1bhYzbIAdk7jkhJwpWE+OKhaqmfNf9/cPwvqTc3FBpXdoFXNoVs5wXRhd8pehsk2Lw/1p5kmGNvxnFHHLJBhK8nHHT29Tk07j4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EEBeOIh/; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uX
	YipikAORq7rmSiXBAcddF/TDyI+Ck/jJ3ssPKAKWY=; b=EEBeOIh/Oflc6xA5cO
	8ewa4chJ9vmkDiAP0WKltbkUE51T+ydUcJOSThGB7wYBC3BGFDNj3cmMSDBBI24M
	K6YVLH18A0lDwF3Lk62/HSo6S16spdoIdjuY+AhMUJaQ3cJJhWS0MEXVRgJODkTO
	N/KpT3GlRi7SB86gO4ylZNVW4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3L8IEAshoNuutBQ--.65473S4;
	Mon, 15 Sep 2025 20:09:41 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	haoxiang_li2024@163.com,
	hverkuil@kernel.org,
	tzungbi@kernel.org,
	jiasheng@iscas.ac.cn
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()
Date: Mon, 15 Sep 2025 20:09:38 +0800
Message-Id: <20250915120938.177691-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3L8IEAshoNuutBQ--.65473S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1rWr4DKw4rAFWUGFWfXwb_yoW8GF4Dpr
	s3Ka42kFyUJw1qvw18Zw4Uuay5Cr1SgrW8Cw13Zw1a9rnxXFWIqr1jy3WIqFZ7JFyvka43
	Xrnaga4fCF4Fvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_MKuUUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBEAnJbmjIAYMTQwAAsM

vpu_get_plat_device() increases the reference count of the returned
platform device. However, when devm_kzalloc() fails, the reference
is not released, causing a reference leak.

Fix this by calling put_device() on fw_pdev->dev before returning
on the error path.

Fixes: e25a89f743b1 ("media: mtk-vcodec: potential dereference of null pointer")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index d7027d600208..1c94316f2d7d 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -117,8 +117,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_enc_handler, priv, rst_id);
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
+	if (!fw) {
+		put_device(&fw_pdev->dev);
 		return ERR_PTR(-ENOMEM);
+	}
 	fw->type = VPU;
 	fw->ops = &mtk_vcodec_vpu_msg;
 	fw->pdev = fw_pdev;
-- 
2.25.1


