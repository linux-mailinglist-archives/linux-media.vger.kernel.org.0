Return-Path: <linux-media+bounces-15857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA68A9493CE
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 16:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17FF71C215AE
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 14:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF8E20FAB2;
	Tue,  6 Aug 2024 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hoGaCR2x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF69520FAAC
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955906; cv=none; b=RcasI6IJXNG8cp+SGbcuTmNEzLUA4ruz3LrMvP6IrAmVi8tOjy0XE+l0UibqoLF9EMZma5TlgTV6mOHiObrSuk+LfzsmaEE45aACk/MjpZd+SFnb1qcpXPfE1spwOLsQK6JbHtZunFPNCo2wgGWuKlsQbYur8asY73m9LjXZ0iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955906; c=relaxed/simple;
	bh=FbEXtZkc8wYvHYSwLmYlLBiYehRw7/DhT/d7M3FEnvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXYvSWr53PrBKvpUrG4+31dpDWOifNiiUOELjfdyrr49mtkb5XS66l7H+kzYFRlmGvh7U5qvlpBkO+GRr4TQ4nGg4D5o6dZNSg8zPhrPAFYXqTj0LtBXVwM/EPRVkfB6otSuFk9fPrd2jWb6Hi6dAwuoohAwxrLS2H4unQGlfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hoGaCR2x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-24-0.net.vodafone.it [5.91.24.0])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CE47D90;
	Tue,  6 Aug 2024 16:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722955848;
	bh=FbEXtZkc8wYvHYSwLmYlLBiYehRw7/DhT/d7M3FEnvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hoGaCR2xL2hR0HWnQU4Z5aH55pXoRdxdTAErzN4HWLYeHcIA1njHlL6k/lK0KALxM
	 wjGo0pjZwJOXVEEtHLWKyXPukxipDd9j1YuJRWVYCzQhbmvxON8Ebhj1hSaTzcPUy4
	 0dfV/qFN0REvRaA0YLfxOZQD3n1iRfvczMRnfKWk=
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
Subject: [PATCH v8 09/12] media: rkisp1: Add features mask to extensible block handlers
Date: Tue,  6 Aug 2024 16:51:05 +0200
Message-ID: <20240806145110.918843-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
References: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
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
index e8c0d7cf97a3..f683d138bd0e 100644
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
 
 		if (block->header.flags & RKISP1_EXT_PARAMS_BLOCK_DISABLE)
-- 
2.45.2


