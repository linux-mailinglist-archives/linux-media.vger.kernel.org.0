Return-Path: <linux-media+bounces-17343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C8B968623
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 13:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3768F1F227FD
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99B3185B7D;
	Mon,  2 Sep 2024 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jxgTkFeu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8079144D15
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 11:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276263; cv=none; b=Wv+oDjPmns73kiogkhOnXKJF5zema16uGu6Ok4hYL+t57FXQc+7h7vOeQII2iiWkuT2k4CD0VbWMGqLL4wbgc5E1vgxIpDEatJCgOlvFAG+FVoKspNBotUKN1d7afjj8dnP+bcsE71JMAEzMIoR2aAConXSUc8ApIhUbv+bbfdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276263; c=relaxed/simple;
	bh=8yRAxflb92Og2NF7Fbe8JWUW6AYWhmh8Rs5qGPmnwkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlWHkQbIhH5EPgmqWwnkENqzYs+qo7TNBOzO6XW2rSLLf01+Ua7KP01ezpQ26KASPZhD9A4XMZgOfPLgPYPQxNzRqvQcxUakOQZtRo7Sj5HY0L+73jtKdqlJER7IoeZHljNxGOxxueudV6kdD+xgpd9ODvjnL13yjqnz77MclTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jxgTkFeu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-54-22.net.vodafone.it [5.90.54.22])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86933C62;
	Mon,  2 Sep 2024 13:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725276189;
	bh=8yRAxflb92Og2NF7Fbe8JWUW6AYWhmh8Rs5qGPmnwkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxgTkFeuX8W2wiwusBxhOOx/2Y82cqmTE+3uVMuLDLCQfn8uSHyuGglmxTt2oog2S
	 2FReONbg9je/8cwGE8DYRWxlIkaW2u3TIBkkp263PQwswvyyxQNZPEuxwqJZG1iJB+
	 YERRdlFKtUPB193/KsaE4MG7UnxXRMqsRBiDFfl4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 1/4] media: pisp_be: Drop reference to non-existing function
Date: Mon,  2 Sep 2024 13:24:03 +0200
Message-ID: <20240902112408.493201-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240902112408.493201-1-jacopo.mondi@ideasonboard.com>
References: <20240902112408.493201-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in the pisp_be driver references the
pispbe_schedule_internal() function which doesn't exist.

Drop it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 65ff2382cffe..8ba1b9f43ba1 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
 				     &pispbe->node[MAIN_INPUT_NODE]);
 	if (ret <= 0) {
-		/*
-		 * This shouldn't happen; pispbe_schedule_internal should insist
-		 * on an input.
-		 */
+		/* Shouldn't happen, we have validated an input is available. */
 		dev_warn(pispbe->dev, "ISP-BE missing input\n");
 		hw_en->bayer_enables = 0;
 		hw_en->rgb_enables = 0;
-- 
2.45.2


