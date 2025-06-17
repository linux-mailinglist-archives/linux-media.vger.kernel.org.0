Return-Path: <linux-media+bounces-35085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B57DAADCE62
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 15:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90E82188E54D
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60932E6D37;
	Tue, 17 Jun 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NHU7vyyc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ACF2E2667;
	Tue, 17 Jun 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168461; cv=none; b=Z6P3M49+afad8XON8sIMbW6+6RSHdVO77oA3xTZkDNb5w5TwbrsW1ODE8pz630Murf3C41GUyydqZ4owA0pMgyK0yVsvVNbPLbduiCZNtRRQPVg/lUJe+OyWZJwSyTtiJEaN0A6OVjp4D+0yQWHH7fwb4eFPxhXHICn5EMd1DmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168461; c=relaxed/simple;
	bh=LQpsALkTPotTLV0L5B38pVMNZD6nPoEHZMe5t0uCYmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATpJ02sE9YbATUOdugYxrKIsVlg5iHLlFqzVIap2JBfZM9cANQV8YFTMqgreOLqA4oJ0m0iXR1VlT4uV0U9Bb5ctrNLrVWm0zcjf0Xh+lnJMX2YyIpQ3nV+lKJHmAU1RHz5jckUDA9pXJwDRlM6WH4lWcpbxkMgyH65LgBs7CeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NHU7vyyc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7A762A6E;
	Tue, 17 Jun 2025 15:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168443;
	bh=LQpsALkTPotTLV0L5B38pVMNZD6nPoEHZMe5t0uCYmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NHU7vyycIFe0HBI4fykD18fkCNWRJLcihiOR6Xb9oRBhD/2MDLRHkuy4YcDM0yitV
	 Q2fTWUGVLzkljeGrVyxnkFu2hSxHaj3Q9Ef6saGv1cppCXizoUXf0w2cNnTPHKcvdF
	 8i/ardEtnZow0qmslyN5HaJAtvfAFkesHcXL6sow=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Jun 2025 15:54:00 +0200
Subject: [PATCH v8 2/4] media: pisp_be: Remove config validation from
 schedule()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-2-e58ae199c17d@ideasonboard.com>
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LQpsALkTPotTLV0L5B38pVMNZD6nPoEHZMe5t0uCYmY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOEe7cRNKLlBfoyNp4m4u6p8xuPVwbfvEjPn
 apV/+o47TWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PNckEACr0tkqemhNUDeWmwwqOg6XrM4nHAm6A1FMlo9IyBTo0B6fPO/frB3qCVVv9UPybKTrSgh
 8GJ4j0yzPfhAyEBYpmNU2/ghXGCttalOPzgC8YU6prLapngYH4LXncVFsGPF19wqHNZk+9R8sBa
 ktooy16Cw6m4wfl5Huv+9YCZIQ7RuSpluTuiWzdOVSV1Iu+d/M02eDEiCrc1eu2A021VTL07TqK
 ZN22ZtJ6rmKIsKJihvYKuAnAufyjUOY7PhzKOcwFUCE4/YvqGni9wuQnnnfnE2jVhKNEVYguXCN
 mhaNqvnez8g6Nw1r4OvVw2TYzMtzkJq8BsZG2lXzwAjqtWKSSMTYLRsAbQ0MrDp3jbMgi1VwDgU
 MEjBJlbf9vMWwc5mH9xp0Hl+0NguN+9Tsn5q68essJCktZ8/FvP5dvWz7tLg5AwBMzC5TtWM3vp
 GhWOAaJHsSUbkkzhHz50Z07G9J52rfNX1FlQ2wmUT7psI5muXik0jTi5f6qxT67gmrh42HkTCvj
 xrGwj8QmbWXoxUoewggDR/uqYna5+4b8hLuTOQDqMMWb3j9NViIHGtHSZrvY/1Tpo5Z2z8FtSWs
 D21ZT9+xdBHBA6xqPQ4JOTBNXbm7D4FPO7Lk1OeHs9Rh9y7AgCPOqH1323BM33QHsHcPKUsn5l9
 aIBenMFybodxJZw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The config parameters buffer is already validated in
pisp_be_validate_config() at .buf_prepare() time.

However some of the same validations are also performed at
pispbe_schedule() time. In particular the function checks that:

1) config.num_tiles is valid
2) At least one of the BAYER or RGB input is enabled

The input config validation is already performed in
pisp_be_validate_config() and while job.hw_enables is modified by
pispbe_xlate_addrs(), the function only resets the input masks if

- there is no input buffer available, but pispbe_prepare_job() fails
  before calling pispbe_xlate_addrs() in this case
- bayer_enable is 0, but in this case rgb_enable is valid as guaranteed
  by pisp_be_validate_config()
- only outputs are reset in rgb_enable

For this reasons there is no need to repeat the check at
pispbe_schedule() time.

The num_tiles validation can be moved to pisp_be_validate_config() as
well. As num_tiles is a u32 it can'be be < 0, so change the sanity
check accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 25 ++++++----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index b1449245f39436d02c9c710916e2d0605606a327..92c452891d6c2d68aff9aa269c06fa1af77e3885 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -588,24 +588,6 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 	pispbe->hw_busy = true;
 	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
 
-	if (job.config->num_tiles <= 0 ||
-	    job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
-	    !((job.hw_enables.bayer_enables | job.hw_enables.rgb_enables) &
-	      PISP_BE_BAYER_ENABLE_INPUT)) {
-		/*
-		 * Bad job. We can't let it proceed as it could lock up
-		 * the hardware, or worse!
-		 *
-		 * For now, just force num_tiles to 0, which causes the
-		 * H/W to do something bizarre but survivable. It
-		 * increments (started,done) counters by more than 1,
-		 * but we seem to survive...
-		 */
-		dev_dbg(pispbe->dev, "Bad job: invalid number of tiles: %u\n",
-			job.config->num_tiles);
-		job.config->num_tiles = 0;
-	}
-
 	pispbe_queue_job(pispbe, &job);
 
 	return;
@@ -703,6 +685,13 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
 		return -EIO;
 	}
 
+	if (config->num_tiles == 0 ||
+	    config->num_tiles > PISP_BACK_END_NUM_TILES) {
+		dev_dbg(dev, "%s: Invalid number of tiles: %d\n", __func__,
+			config->num_tiles);
+		return -EINVAL;
+	}
+
 	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
 	fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
 	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {

-- 
2.49.0


