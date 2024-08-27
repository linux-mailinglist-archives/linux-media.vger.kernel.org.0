Return-Path: <linux-media+bounces-16873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DFB96036B
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 09:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944791F23928
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 07:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2483417ADFC;
	Tue, 27 Aug 2024 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JTlE1gRu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62815884D
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744439; cv=none; b=Edto+OPc62Ao0enRYPEK16nJl5TAHpPSicm9kCihkkGWz7vixbHJcaDzwagB2NVKgbFjx9LGY09YEgUx9dxp5oEP1PU5mfN0hR5x+xB1obVS7M1E7UWIpK7ZtYitkikaIjvzfkcD5K0/hsMATDaC1FzjyZrx94qQ2aJrXMLeKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744439; c=relaxed/simple;
	bh=Wdxv9SQ6HPlRDOYbzWq3gMXeob61suNvNjG4TSNiDsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1/d6RB3llh8A4JVBbCqNHcT+1EGb44sXtIeXcqeGKBt+YpSyuA0jjXtGmvEPd1l2nPMin1dD/Oew7b2i8Up2tft3F1SLC9dJi5HoQpe73uDd6oijkDLhemr3QtUzcjRkBs7Vjsl88YO5SS8ohz5c6xtowCIwJYXRE+rWZO5U+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JTlE1gRu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-141-165.net.vodafone.it [5.90.141.165])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E549B0B;
	Tue, 27 Aug 2024 09:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724744362;
	bh=Wdxv9SQ6HPlRDOYbzWq3gMXeob61suNvNjG4TSNiDsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JTlE1gRujUSUalu+CJyF3BOcvcScoRDVv3mm4raM86+WZ5MdtwjB26lqk92Gyfsi3
	 xEpJ/cEF5jBLJ1ejCDhEworf+5rhTHo4VS2tolJkzdlLQp6wqKZlCsKuuN4whITel7
	 nARWpQgoy/B6MXAmCqcwUpInEHtoefkEk6jsKmPE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/4] media: pisp_be: Remove config validation from schedule()
Date: Tue, 27 Aug 2024 09:40:16 +0200
Message-ID: <20240827074018.534354-3-jacopo.mondi@ideasonboard.com>
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

The config parameters buffer is already validated in
pisp_be_validate_config() at .buf_prepare() time.

However some of the same validations are also performed at
pispbe_schedule() time. In particular the function checks that:

1) config.num_tiles is valid
2) At least one of the BAYER or RGB input is enabled

The input validation is already performed in pisp_be_validate_config()
and there is no need to repeat that at pispbe_schedule() time.

The num_tiles validation can be moved to pisp_be_validate_config() as
well. As num_tiles is a u32 it can'be be < 0, so change the sanity
check accordingly.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 8ba1b9f43ba1..73a5c88e25d0 100644
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
+		return -EIO;
+	}
+
 	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
 	fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
 	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {
-- 
2.45.2


