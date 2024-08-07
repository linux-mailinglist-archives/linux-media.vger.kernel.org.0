Return-Path: <linux-media+bounces-15953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA8D94B214
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 23:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F1FC1C211E8
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 21:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CB314A09F;
	Wed,  7 Aug 2024 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ku6sWzEb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE714E2E6
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723065805; cv=none; b=Dj7XEl3tOPVlPGPYKoZxtlDsjCIIgHpBVUJ7G9t9KGkux5Mh8Uir2o+YJumvY1ZC9clvLv052N7d/MutdxDfX9CH6b35cuu/L8oF07nkGnc28D5rwLnXAA0Juy4Xxf7zh+t0TJpnkAZ7pvE+a/c/ydgGw0jjomtx0mJL4o73ZeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723065805; c=relaxed/simple;
	bh=IhgVWTuPISitdd+/x7/wOlEV0gHXNFv6+mAgRNLcSX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0vd6bhv2Cr0eAVqIq3RoD/EnTxFkD0jPFiTLwxipG9+j68w2qcg9/KEY+rPILC0YQmOBQduTFgVLqQZRVg1bWDhvyS+AvbLqCT/OrhYz0PvsdAdoCK1CSGbnkq4pzM0iWFjowkjMacenRSPbsUSpoc+k8S0BMtFCmWTCamwpbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ku6sWzEb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-150-234-175.cust.dsl.teletu.it [93.150.234.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0163096C;
	Wed,  7 Aug 2024 23:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723065749;
	bh=IhgVWTuPISitdd+/x7/wOlEV0gHXNFv6+mAgRNLcSX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ku6sWzEbVPaBXMPXtrXG/rbWmrMG+Pxn0WjC0KK9iZncTnM8HImVoZOxcXOasaerc
	 gUtocBO+gqFCHI+iPJJCvbl8SxcFoLuwa26NKEi+6SFAPK2gpW+M0o48Cbtqj7mqVo
	 l1emh3iVjGI6Hnwp3BRuX489NhsQHrQi9F06YTeQ=
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
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 09/12] media: rkisp1: Add features mask to extensible block handlers
Date: Wed,  7 Aug 2024 23:22:49 +0200
Message-ID: <20240807212253.1667847-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807212253.1667847-1-jacopo.mondi@ideasonboard.com>
References: <20240807212253.1667847-1-jacopo.mondi@ideasonboard.com>
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
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index f223cead5dc5..4ea7f1ec654e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1856,6 +1856,7 @@ static const struct rkisp1_ext_params_handler {
 	size_t size;
 	rkisp1_block_handler handler;
 	unsigned int group;
+	unsigned int features;
 } rkisp1_ext_params_handlers[] = {
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
 		.size		= sizeof(struct rkisp1_ext_params_bls_config),
@@ -1962,11 +1963,18 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
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
 
 		if (block->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)
-- 
2.45.2


