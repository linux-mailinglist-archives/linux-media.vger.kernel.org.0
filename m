Return-Path: <linux-media+bounces-14648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB8927A77
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 17:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC003283B04
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 15:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215991B14EA;
	Thu,  4 Jul 2024 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LH7UcE61"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5451EB36
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720108201; cv=none; b=TbfjJrkWwXASm6dxceHK5MD24ndhBl53FyrzMuJhOi5C57aJmb/i0S0Jv7laJ+UmDE8LjienRctEhjsCXsnxgwKbwJxkZbcXr0HJMioUcNFhDv7m0YoE36y9nWJdUEWwIGePrVhaT/kjoQ2OO99h5XWfE2GzcxLQg21fqtwojTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720108201; c=relaxed/simple;
	bh=kc7rOE1SRWXqYszACekAhn3MoWNVww0rPEitfYLmnfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSoIWyY/IPYsnWJ1HO7SEegnhOTP8iV9pwltC7rswLwOqBoITy/RjKKZssPMKyJJ2G0HIWkiQWUt/yqqWCpx8Aqe7DLIZ7RFOW1QjFkozZTN58h5aU/OWV4fw0iq4mYv4N9wmWU4R7J2Sy8wunV2YhS7FAAovEr4y9K/6klVxvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LH7UcE61; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D65DAA27;
	Thu,  4 Jul 2024 17:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720108166;
	bh=kc7rOE1SRWXqYszACekAhn3MoWNVww0rPEitfYLmnfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LH7UcE610uPFLfAB5/ZqxmL7jLTpWPt5oObqZKXqC3WIkmpZNV1LZh6IUglB04hXd
	 UMGLgOu23sE4HGO2PdnLzrOHJ3e8EJwvF8R8/jVDhHF2PRnQC9ZpOUQzdbRFa0Tv9W
	 jhYxyZ08D33sg7q6IZKBxuimmav5ikm+KRNBpqNc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 2/5] media: rkisp1: Add features mask to extensible block handlers
Date: Thu,  4 Jul 2024 18:49:29 +0300
Message-ID: <20240704154932.6686-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
References: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Future ISP parameter blocks for i.MX8MP-specific features will not
support on Rockchip platforms as they lack the corresponding hardware.
Introduce a features mask in the extensible block handlers to indicate
which device features a block require, and ignore blocks that require
unavailable features.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Expand comment
- Fix feature check test
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index c56365c7c51f..d3a7c7f55db0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1845,6 +1845,7 @@ static const struct rkisp1_ext_params_handler {
 	size_t size;
 	rkisp1_block_handler handler;
 	unsigned int group;
+	unsigned int features;
 } rkisp1_ext_params_handlers[] = {
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
 		.size		= sizeof(struct rkisp1_ext_params_bls_config),
@@ -1951,11 +1952,18 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
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
Regards,

Laurent Pinchart


