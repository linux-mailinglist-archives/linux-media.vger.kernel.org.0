Return-Path: <linux-media+bounces-15311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49493AE16
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 10:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E58285B4A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 08:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45C014F102;
	Wed, 24 Jul 2024 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vQ5czJQ+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA58414B977
	for <linux-media@vger.kernel.org>; Wed, 24 Jul 2024 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721811048; cv=none; b=BWGD4rcnsyYrQBbw1jd0gWh5x5beChQkyY019/N9segceMY89g3AIy5udynEbSTJ/LXYgI2LaSwPZijDMMmnAlvBeqvi3uxUySazjMFINzSEjmMf1YAHJZssGgfXzXNYnSClRaQLSQDTwOOv/ZACH/dy8KC2hbSICpkRx/7cKnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721811048; c=relaxed/simple;
	bh=pFxRYKPrTrbqQuuLKEI2WF3tnM8NxuWLbBDiU/5yMgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdZdIaZIK+284HaGdNohyURdqWh5fpBQGSa7T7GyM7tkrUp+fxc4ctksfZpFMyW3geWJRykxu1S7hOOCIDz4yxRLasV5gMkpXIcObnj4ILRBvUri5Fuy2qjefO/3TyH1n5Y9xByX+OCF5C8PA4C1dp5Wc+BtIFjyqcBdCnQErAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vQ5czJQ+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:24bf:30c5:c4f3:c9fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC5081FA9;
	Wed, 24 Jul 2024 10:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721810994;
	bh=pFxRYKPrTrbqQuuLKEI2WF3tnM8NxuWLbBDiU/5yMgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vQ5czJQ+NH5fm6d15v0to8MJfmMVe2W9IwVw8x7wSsiyYRxzX9+EdyeZV7uErEBtT
	 RSXNcaWL16x+HXpG/VgsGHR+eZ3U5MX7sDRQDH2A2IxpKaK+wX8lkC9idaZBOmazgY
	 3LOusScowDBC9eFVezrvXAhGuQR8Lh+3w/YwJFao=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v7 09/12] media: rkisp1: Add features mask to extensible block handlers
Date: Wed, 24 Jul 2024 10:50:00 +0200
Message-ID: <20240724085004.82694-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
References: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Future ISP parameter blocks for i.MX8MP-specific features will not
support on Rockchip platforms as they lack the corresponding hardware.
Introduce a features mask in the extensible block handlers to indicate
which device features a block require, and ignore blocks that require
unavailable features.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index ca24ed858448..016d8d50a17b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1848,6 +1848,7 @@ static const struct rkisp1_ext_params_handler {
 	size_t size;
 	rkisp1_block_handler handler;
 	unsigned int group;
+	unsigned int features;
 } rkisp1_ext_params_handlers[] = {
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
 		.size		= sizeof(struct rkisp1_ext_params_bls_config),
@@ -1954,11 +1955,18 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
 			&cfg->data[block_offset];
 		block_offset += block->header.size;
 
-		/* Make sure the block is in the list of groups to configure. */
+		/*
+		 * Make sure the block is supported by the platform and in the
+		 * list of groups to configure.
+		 */
 		block_handler = &rkisp1_ext_params_handlers[block->header.type];
 		if (!(block_handler->group & block_group_mask))
 			continue;
 
+		if ((params->rkisp1->info->features & block_handler->features) !=
+		    block_handler->features)
+			continue;
+
 		block_handler->handler(params, block);
 
 		if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE)
-- 
2.45.2


