Return-Path: <linux-media+bounces-16014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1133894C5DF
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 22:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 414F41C222CF
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 20:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F23A15A4B5;
	Thu,  8 Aug 2024 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q/6yBaNU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2EF158D8B
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723149703; cv=none; b=shH1s/S698+uhf3Urr+AYkKsAc1gq1N6E/v2ulbPBNn3B1Y8SUMYWZVPbzg7rFv2VKTq3yY91Bsp6Tuib69VlaYZmP5hNT7MnhtNLpnpVv9NliNaOxVO9ewUPThYNIbpIUGDzFQ7qPfeCAmn+2Ovsh3wURl2pMcRXfIlQmta5lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723149703; c=relaxed/simple;
	bh=K5Ps8fUMPCKeq3miAjzyYjnyQw1W5UzYADuODbGmaC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lE/iDzbh8Q9psLQe7d1JsC32C9K3REN8y3HnP8YWvK40rgFJFh1wKmro1muOHZO36VFphkP083j0nzFfsU3uNHadwxGJYgjSaV+1zBNAAprXcRNTICHHOuhRMpRd58f/Hy7DA9xICVrgvzZA/TauHpSJeS9qUHbuXDktHMYR2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q/6yBaNU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-118.net.vodafone.it [5.90.52.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0531581;
	Thu,  8 Aug 2024 22:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723149636;
	bh=K5Ps8fUMPCKeq3miAjzyYjnyQw1W5UzYADuODbGmaC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/6yBaNUEWJ8dzMcXkgq1utVaTIn4O9bmvtxPfsgjIlS/c9niGj7CtKxTRIGTNsEg
	 aAP63SNh4WdcNvLguNtQqr09HJZJIST09JWAXROo8dklQTb/geuQhKodrQ71GGpZBc
	 sotXo2A2rtaPsOXveHp2iPzz3qNt1yvEMJ2xL99I=
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
Subject: [PATCH v10 09/12] media: rkisp1: Add features mask to extensible block handlers
Date: Thu,  8 Aug 2024 22:41:02 +0200
Message-ID: <20240808204106.2461316-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
References: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
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
index a2d9dbd97958..ffa16ed8941e 100644
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


