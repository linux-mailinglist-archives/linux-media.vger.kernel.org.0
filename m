Return-Path: <linux-media+bounces-17550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A796B795
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8F2E1C24166
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815CD1CEE9C;
	Wed,  4 Sep 2024 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rqb/s3dm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EAF80603
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443987; cv=none; b=Oz6guYAhrAvFSXe3WvOPo3VIyJE1JlIP5J46A8Blsu2tvGvbbDU88gUtmWRYwvJVnx0frjpngx4AVXbeMQacDafrc9B0UHT4x6Sfb/2lcuHpbNree2exrdDwE/NR2S5o3XsC5jymEn4hDGl6Dd5M9fT4wyqtiKig3StyWfxBM3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443987; c=relaxed/simple;
	bh=Y4S5EjPza8O+5OFIuIh1nXU03l5Sz6DNhIpWoRVLGT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6ox3PSCi/Bmj3XD3TzwUxg2BCO9rd9CDH4T4ajn6yRZNIEq9olFQJEjumVov4/3JXZcVjMc6t0GfC6yDZgLXZmB7w9iakGYMsRotKrCcUOraBY7jvh/Uvh2hH/wjB6s56xvF8fNboOnivqzj+bq8l07D8XVcspyIKHzbmApg3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rqb/s3dm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A861B2E3;
	Wed,  4 Sep 2024 11:58:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725443911;
	bh=Y4S5EjPza8O+5OFIuIh1nXU03l5Sz6DNhIpWoRVLGT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rqb/s3dmtBJWoKWmWLdkUrEWudP46eCEPNVdgW3MlRzVKdj6uWKXBTkAdDXqwox6G
	 yCGnO6SPYf0ZzijrAoEeiE/CgxPR6N55ivDtWNyv2MzJ+8xTd+2LA/DCCZD4gW3Nov
	 +ZdpHUU1VnNrVAzcfpQ052ce/Ne+aG2LdGmE08bM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v5 1/4] media: pisp_be: Drop reference to non-existing function
Date: Wed,  4 Sep 2024 11:58:32 +0200
Message-ID: <20240904095836.344833-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904095836.344833-1-jacopo.mondi@ideasonboard.com>
References: <20240904095836.344833-1-jacopo.mondi@ideasonboard.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.46.0


