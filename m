Return-Path: <linux-media+bounces-14613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC25926B87
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 00:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96E4A282E41
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 22:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56F719306C;
	Wed,  3 Jul 2024 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hqy3ORUn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A6191F83
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045562; cv=none; b=BECutKrOmM2FaUbF2teL6jsjm9kq514L3DNDaalY//L/Ln+1oW4wWLWZ87x8yIGmaZ28yGWtm1rDkiIjjkMUrJ78XgIEXJ+em9Nb2drfR2Xg8eT04S7Lg1uri4elI1GJy4qy0x2k3Yz95jK9eEplk8tRfQmV+FiYp+b1C8qvb2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045562; c=relaxed/simple;
	bh=TTPnUr61Pgf5v46sRCccdeyyuku5BaST+clpOdnxGcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWBRRQl/3tdzhHr/lKKEOvNLm/+l+V+eSsfZXfGrX0QHCjmeXz7FYNH0LzyV/RQTsMoxbHvs1tXdMJzVP6DM0Uv60orq6GgOL///T9GlkIo97gbMNHi0CGJLlXkG7Su3NsOefgWLPuZ4xJhfAEDGwaBTIRqDCF1HhndX4i8ad4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hqy3ORUn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A96D1A27;
	Thu,  4 Jul 2024 00:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720045528;
	bh=TTPnUr61Pgf5v46sRCccdeyyuku5BaST+clpOdnxGcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hqy3ORUnNzzaot3R5NxQUuEO9n1EUoqM6d1s+zA5L/wZK7rtBMj6q7sgeL4KzqplJ
	 bLN9Jl7BGQ+PVQPqC1xHN82PU8zaaUpdbSk1Tfkicvqr8YJBHE2VXKLvmkrg6MjV7c
	 dRgT5Ru98QvM3KI4I8KA65A7Sr/S4ODGQTfNqc00=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 2/5] media: rkisp1: Add features mask to extensible block handlers
Date: Thu,  4 Jul 2024 01:25:30 +0300
Message-ID: <20240703222533.1662-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b10cc2701244..92312b4dabf6 100644
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
@@ -1956,6 +1957,10 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
 		if (!(block_handler->group & block_group_mask))
 			continue;
 
+		if ((block_handler->features & params->rkisp1->info->features) !=
+		    params->rkisp1->info->features)
+			continue;
+
 		block_handler->handler(params, block);
 
 		if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE)
-- 
Regards,

Laurent Pinchart


