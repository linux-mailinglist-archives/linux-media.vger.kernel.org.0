Return-Path: <linux-media+bounces-28991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065AA7591F
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 11:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B49CF188DC06
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 09:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D2418A6B6;
	Sun, 30 Mar 2025 09:17:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB8E360;
	Sun, 30 Mar 2025 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743326269; cv=none; b=uFfjxmsbnCuKS6d1J+i5sot78OvMv84ZxfIUj1Ra03ToKeviQecCvPiZ/QQmNbFGVIa3kzfe4OxRDKWoCBXxlS3HxJmti+an9VY71x8h392PpJSNijMARk4ODnaONzNBlHn1QWVbIrlyXzXG8Ix1krM8q+xQuBLISwPbiCqEtgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743326269; c=relaxed/simple;
	bh=u8hLdGe9mwn/p/thIeq0zUvxDZOAhkFYMiztxgZy+h0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAjAIOtlXTk0fp0rjftgMo46PwwjUDre18Qo3aEGssAfAqajnKbZrM5OPuR3VM9bayadQ3LhZoT6uphwDWt0Kpeshjm4Kvo1v3Zix87K1ZbmeCFsQ0LCsTPENWg2QUl2hEocM88PUUExv2d8dyiBtaE5BzFXYZp4sx9fkmtyGZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: tHhtgsqSSFeaM1C1peT80g==
X-CSE-MsgGUID: W7iNN95ZTCqzREwv9dLm9w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 Mar 2025 18:17:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C45A14001B4C;
	Sun, 30 Mar 2025 18:17:41 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] media: renesas: vsp1: Use %p4cc printk modifier to print FourCC codes
Date: Sun, 30 Mar 2025 10:17:35 +0100
Message-ID: <20250330091738.27052-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace '%08x->%p4cc' printk modifier to print FourCC codes for pixel
formats.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index b5d1f238f7be..f8a575f6188a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -593,8 +593,8 @@ static int vsp1_du_pipeline_set_rwpf_format(struct vsp1_device *vsp1,
 
 	fmtinfo = vsp1_get_format_info(vsp1, pixelformat);
 	if (!fmtinfo) {
-		dev_dbg(vsp1->dev, "Unsupported pixel format %08x\n",
-			pixelformat);
+		dev_dbg(vsp1->dev, "Unsupported pixel format %p4cc\n",
+			&pixelformat);
 		return -EINVAL;
 	}
 
@@ -849,11 +849,11 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 	}
 
 	dev_dbg(vsp1->dev,
-		"%s: RPF%u: (%u,%u)/%ux%u -> (%u,%u)/%ux%u (%08x), pitch %u dma { %pad, %pad, %pad } zpos %u\n",
+		"%s: RPF%u: (%u,%u)/%ux%u -> (%u,%u)/%ux%u (%p4cc), pitch %u dma { %pad, %pad, %pad } zpos %u\n",
 		__func__, rpf_index,
 		cfg->src.left, cfg->src.top, cfg->src.width, cfg->src.height,
 		cfg->dst.left, cfg->dst.top, cfg->dst.width, cfg->dst.height,
-		cfg->pixelformat, cfg->pitch, &cfg->mem[0], &cfg->mem[1],
+		&cfg->pixelformat, cfg->pitch, &cfg->mem[0], &cfg->mem[1],
 		&cfg->mem[2], cfg->zpos);
 
 	/*
-- 
2.43.0


