Return-Path: <linux-media+bounces-17551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679896B796
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 796DC1C23AEA
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015681CEEBA;
	Wed,  4 Sep 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hu0z9BBD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D8C1CEAA4
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443988; cv=none; b=pwW2R50fBCWO9n31FiCmdVWfDJz6RjkdCcZ5rKN0eBZtcw+cCqAc6lmyppU0v72C9jQMOGBcZcqhUIeuw/dVyXnSDcHdL51kJDZbTbLqudTUMFlftwITFi/d/iT46adnkhkaeA9roZjOoviVxPbWa32fucQH2E58QBN8WAgXuPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443988; c=relaxed/simple;
	bh=KlrwZOSZfO7XF4QKJZkMUU594tROEm8YS+I0iu7tGsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEXGfPakC99m7hPmFEWN/oZTaH7nc/0DVauXtAY1Y5Rc8WdJeUjKXxUAebUaMVtB/U/XdcNjjWaba09PurGuI6yJdkiU76UIShZtEPmvgRAdG90EooXrq4uaOWjyv6dujzRLK4SR3bFv7sryVBvMbfu5iRTtJelRN6Ne1G9489c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hu0z9BBD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18F233C7;
	Wed,  4 Sep 2024 11:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725443912;
	bh=KlrwZOSZfO7XF4QKJZkMUU594tROEm8YS+I0iu7tGsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hu0z9BBDotGPHle5pFwbMusZ9VdpI3GT3wb8bvzGmfeSbt0dgS6gD1buhRk15zivq
	 +ISqafQL5iWVzi6Rm+7D27nLkGSVb8Xm/M80m20gINrq4PICsNig1eJZBu3s8/gAAi
	 M56scZk2Iw1B+ckysKfbHLrAcOpTLaPNrh8C5FpA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v5 2/4] media: pisp_be: Remove config validation from schedule()
Date: Wed,  4 Sep 2024 11:58:33 +0200
Message-ID: <20240904095836.344833-3-jacopo.mondi@ideasonboard.com>
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

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 8ba1b9f43ba1..41fd68b7757b 100644
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
2.46.0


