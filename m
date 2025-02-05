Return-Path: <linux-media+bounces-25659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DA7A281AC
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 03:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A61164105
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 02:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CFB211472;
	Wed,  5 Feb 2025 02:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="hxBgZqX2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F53120D51F;
	Wed,  5 Feb 2025 02:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738721926; cv=none; b=Uuei1kU5NAykcJPjJT5Gqfdae+LMrXe5vUFUS8tsQKN1XaxRNa3i++63HWtyyGm/S3NxJPwL1PbBVe+I2mEoYM1WvXnOzxkwdxvEOGCHxHzJrkfmJY7oECiuWp49XtdxXvdmwgMv4365r8fhAcWFKOJsnYOKxdNhmRqNDo8e9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738721926; c=relaxed/simple;
	bh=qUuT77iTdaXvCS87a5KrQ3Pbb0JYPN+p43d3YwVVnZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mwl316RuT3SOLk6U5JsfZSWWWtahNxQGvDn4u0TDOotzSmB4sAmrpcQJDrrekbaNyvJ58XrNPflGrSeKOJ+VSyudcgSE3B2dpRTPLElaZQgBHFgQyIGTHRz3qgg4Lm0Q2NmeYp9pps8G4pK1npEKpupJ63mo4k05lTz9dF8mojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=hxBgZqX2; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=+Yfw3YYmQ42RTILNlusHnxgsov7m4pIrTmZuZQJm8vg=; b=hxBgZqX2iUarOki1
	7a8QWu65p+dX7+GDq0vp/w+ZILVpp2qBdA4nku4KqP6VOUBSh25RpghyzVjLwthCB6wnX0IfLOaZZ
	Tb7v46rnlaxD3Zkj06Tl36F9Z4m7cGRWkHlYLPMH9wCcc5H46+A30QxA9MGrb4ACZcL3/2b5hPKT1
	CQ5Lbt12GaQAnS8zifoKCZabue0jwxQ1CGhT882CaG7MMhlJuur1tYXiaCNl0VrOW828L4F1BpRr1
	1nW4O+bfn4qJiZZpSNkUA1jv2YvvqGR+mldSsH7DlFWMKkIeJNqVu9i+ixJdbsIqVeWhT0EMEQ/Qp
	MP9g3vWWbjQYHSaeRw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tfUzr-00De3m-20;
	Wed, 05 Feb 2025 02:18:35 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: mtk-mdp3: Remove unused mdp_get_plat_device
Date: Wed,  5 Feb 2025 02:18:34 +0000
Message-ID: <20250205021834.497105-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mdp_get_plat_device() was added in 2022 as part of
commit 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3
driver")
but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  2 --
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 19 -------------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
index 935ae9825728..222611e03a06 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
@@ -12,8 +12,6 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include "mtk-img-ipi.h"
 
-struct platform_device *mdp_get_plat_device(struct platform_device *pdev);
-
 struct mdp_cmdq_param {
 	struct img_config *config;
 	struct img_ipi_frameparam *param;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index f571f561f070..8de2c8e4d333 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -79,25 +79,6 @@ static struct platform_device *__get_pdev_by_id(struct platform_device *pdev,
 	return mdp_pdev;
 }
 
-struct platform_device *mdp_get_plat_device(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *mdp_node;
-	struct platform_device *mdp_pdev;
-
-	mdp_node = of_parse_phandle(dev->of_node, MDP_PHANDLE_NAME, 0);
-	if (!mdp_node) {
-		dev_err(dev, "can't get node %s\n", MDP_PHANDLE_NAME);
-		return NULL;
-	}
-
-	mdp_pdev = of_find_device_by_node(mdp_node);
-	of_node_put(mdp_node);
-
-	return mdp_pdev;
-}
-EXPORT_SYMBOL_GPL(mdp_get_plat_device);
-
 int mdp_vpu_get_locked(struct mdp_dev *mdp)
 {
 	int ret = 0;
-- 
2.48.1


