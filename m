Return-Path: <linux-media+bounces-16872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A42E296036A
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 09:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8C31F23934
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 07:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DB9158875;
	Tue, 27 Aug 2024 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cNfsDj7+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D21386C6
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744437; cv=none; b=F7RPS3w4U7ltI/+9A6wtkHBBlIBXxIQX7nkspwaJN/W2CHsXRJ3vxMSNndZhYE9Q0OqI4nh7wzYJ8VqAeasGkddgS2AYUjnfmITfwCa1ImCqlXbDn7WZ4ZcPZmhVtbFd5Buyml8glPUz88EcdZUhkLs1eZlJWXmE67vUd7MgnRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744437; c=relaxed/simple;
	bh=9oQYutyaMOqF0Dhr+m43f5SOj9YtHMZEAOH2lpITvso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foxeVy48vnZDbfkTvyU+hFgigN/bQ9vqw0LtK+JOaTpsF5UYaZTJAYzrriOgJ3SFGGLgfQjF9025znkTPY+LbHFR+VAIl4voVH4u1QKe1DHELTYscFh592LpRII8b8V1hL7axXn8AdBb8SENnEkHDv8IkiqShx/f+yyF9K5P1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cNfsDj7+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-141-165.net.vodafone.it [5.90.141.165])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2381AB5;
	Tue, 27 Aug 2024 09:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724744361;
	bh=9oQYutyaMOqF0Dhr+m43f5SOj9YtHMZEAOH2lpITvso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cNfsDj7+iEkMZpZP18ekbwucykwCwT/g7JznSpCOyz29QG7k0wMKVQfrUxofwE9bH
	 5+9YywPIZHtGv1VluZrInaY63HMdxzcRAAjIBOcDeph0wAkxqgieeZ6Cf0e3Y3An1G
	 X7dbYPRrk2Ri/tF+UJ3PLUhdbvEaxDDlkmgr0xek=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/4] media: pisp_be: Drop reference to non-existing function
Date: Tue, 27 Aug 2024 09:40:15 +0200
Message-ID: <20240827074018.534354-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in the pisp_be driver references to the
 pispbe_schedule_internal() which doesn't exist.

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


