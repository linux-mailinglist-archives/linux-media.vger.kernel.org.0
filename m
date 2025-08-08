Return-Path: <linux-media+bounces-39143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B63FB1EF35
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B85E5684F7
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 20:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDEA28934D;
	Fri,  8 Aug 2025 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F18f32VE"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB703253350;
	Fri,  8 Aug 2025 20:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754683442; cv=none; b=R3fQT6VkXm77lPvHM1BTkC/tTjQJ5pREsIFoslKFCgLNzNRPnhNvxqq08gLRBYGVil548t4o4gT+sWEhTcFuAxbdLDFc6y98z1O6y2eFiacXSWRVKw+29GNA9tVkbwJvyDcDQEs7Qi///QMzGdG2WUKSI20VaTu8dR4ehp6hv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754683442; c=relaxed/simple;
	bh=90dzp77arnMfHsD/KpE4UUqSZVYd5kZP1fMjnyp9xuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezDcry/ctC6vt5sLyM7g3GL9VvyhWa1lFDSAnh0jkgfWiQa4hLCYfuBcuV8uYoAYJ9nIENJJAQGg11HSTDZH7bJaQll7Ot+hVA35i4+pCbPkHXWAGaB5hr/x4ca0vdB/v2cbOAVzQtxZRDtwBgAUOimlD7n13ZM2TCwJqYEBrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F18f32VE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754683438;
	bh=90dzp77arnMfHsD/KpE4UUqSZVYd5kZP1fMjnyp9xuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F18f32VEbrNdXEfd6oaZSNmCHcUkKd3x1BgoCqPVtxdOojizlc0Fijjaohc7gXvf1
	 2zaU80gzKPwg7NgLXSWXVwO643z1utH459fmUKg/7BrlAcdz42U0kNHA/2K+galFpJ
	 +YaM0VCCtXIQ++ngltsmHiVlq1+ZJJ54Pp7hinWIuS0zVVdF8yJMcpmW9qv0WjX+jh
	 1s2S8dW4JGoDADiYxZD0PvyAsCCH5Ays4gTu4FhA28ltyaN8//xDFfkt/q8JB2J4PW
	 zslSlKnlG+tXTw9JFC5EUPLwnubtwXRixjmjnt21a/R+fX+08TU/u+jKKMZIF46i/P
	 vlqin3lXjkCiQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4C7E17E0C8C;
	Fri,  8 Aug 2025 22:03:57 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 08/12] media: rkvdec: Enable all clocks without naming them
Date: Fri,  8 Aug 2025 16:03:30 -0400
Message-ID: <20250808200340.156393-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For other variants, the clock names and number will differ.

There is no need to keep track of the clock names in the driver so drop
them to avoid having a list for each variant.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 24 +++++--------------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  1 +
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5f3057e8136b5..0ccf1ba81958a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1161,14 +1161,9 @@ static const struct of_device_id of_rkvdec_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
 
-static const char * const rkvdec_clk_names[] = {
-	"axi", "ahb", "cabac", "core"
-};
-
 static int rkvdec_probe(struct platform_device *pdev)
 {
 	struct rkvdec_dev *rkvdec;
-	unsigned int i;
 	int ret, irq;
 
 	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
@@ -1183,19 +1178,12 @@ static int rkvdec_probe(struct platform_device *pdev)
 	rkvdec->config =
 		(struct rkvdec_config *)of_device_get_match_data(rkvdec->dev);
 
-	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
-				      sizeof(*rkvdec->clocks), GFP_KERNEL);
-	if (!rkvdec->clocks)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
-		rkvdec->clocks[i].id = rkvdec_clk_names[i];
-
-	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
-				rkvdec->clocks);
-	if (ret)
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
+	if (ret < 0)
 		return ret;
 
+	rkvdec->clk_count = ret;
+
 	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rkvdec->regs))
 		return PTR_ERR(rkvdec->regs);
@@ -1269,7 +1257,7 @@ static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
 
-	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec_clk_names),
+	return clk_bulk_prepare_enable(rkvdec->clk_count,
 				       rkvdec->clocks);
 }
 
@@ -1277,7 +1265,7 @@ static int rkvdec_runtime_suspend(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec_clk_names),
+	clk_bulk_disable_unprepare(rkvdec->clk_count,
 				   rkvdec->clocks);
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 679de66df2479..af47f16cb417d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -117,6 +117,7 @@ struct rkvdec_dev {
 	struct v4l2_m2m_dev *m2m_dev;
 	struct device *dev;
 	struct clk_bulk_data *clocks;
+	unsigned int clk_count;
 	void __iomem *regs;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
-- 
2.50.1


