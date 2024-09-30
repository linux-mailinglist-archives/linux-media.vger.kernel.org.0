Return-Path: <linux-media+bounces-18772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1507989CD7
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 10:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80FE41F22296
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 08:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4042B17C219;
	Mon, 30 Sep 2024 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YfsHsZTu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B38111CA9
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685207; cv=none; b=fcz2dt5dq2cuKd5aQ4ErMhnAxspktCvMNJc9tiE0n1zJxRedl+eIS1AKtAivw9XRp2snb7YCXkHfnViDRvhi1x1ed4UBO4qQyM8F3ShX975L+pihxBSK7mWdFLIR5rvNGGebSziAwsZdbFr0jZ3C7lbFgSoDw36VCoFLCMaI4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685207; c=relaxed/simple;
	bh=MC3H2ib4p1ZOfnsOF7w8rHpvoPlM/t2s1U7C5gPM1/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cl+RiqQrdtoy90xeYUYvpiqqTNxofiQOWul/VbHG+eXUdzrGOO3funqa1l9DVyPc1lMwHO6bL5IbDQSrKXg/vURH7/V7VRi+YMbRG9cjZHkG7XR+iL4n2N1TVXzofg7Qv3LPFSfT8CPEOYTakIknaFQ2BMxKyMORLZCOuGNogRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YfsHsZTu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from fedora.local (unknown [95.131.45.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95D37B7E;
	Mon, 30 Sep 2024 10:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727685112;
	bh=MC3H2ib4p1ZOfnsOF7w8rHpvoPlM/t2s1U7C5gPM1/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YfsHsZTuZ3VgA1d6jPLVBu9DLgUFx1Xi2qmhZra3Y/MwbQiVgvRRZi3t4uFcMDuFh
	 5ldGsXeuXwHakBDN0K+DSbvWliyeDaJRiRjSMZlS2gQ+o/BmCC31pssftyG3jL6qUL
	 73k7BueCZ5+ijqv+t2N0IPAHTq3AegDQsIWPdqLI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 30 Sep 2024 10:32:58 +0200
Subject: [PATCH v6 2/4] media: pisp_be: Remove config validation from
 schedule()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-2-63d60f9dd10f@ideasonboard.com>
References: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
In-Reply-To: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3030;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=MC3H2ib4p1ZOfnsOF7w8rHpvoPlM/t2s1U7C5gPM1/8=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBm+mJPVkjyrIYPsdOx2YtiOIzO77BhurkYbLxUy
 Z6ExHBwzweJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZvpiTwAKCRByNAaPFqFW
 PHL5D/0T2i5rL6YSiSvlotG3S/gzKG1dImDqpsV1dZ7ey2UzMqt4HLQeKgvhRqJWB3lt3NuWoT6
 ibIGGZNQBIIL/2npzdWHAtxHSN73EKm97dRoOeZSgQBdJsSQyxTx0aeRVVyJpdH1dTCNtduOzvT
 DsNLan6rwhreZmekD0LDtTMxtD+cjghTLTGZ5+51NDFvzB/kE0heXL+W8XDMdyVZZ0od4jFOXJB
 1ItGbMZDPMVwRTsfNujUSVidUfKgacDPdl/Ful11saLCzvzozLj5PWGliXjaceMseB2NkhSrxTm
 XrFN4HnJbKrzwrEFT6s7PifRwih65x/wXf8FbQZqB2R+hMSjt5OQCN/CodWvXg33jFJUMy9tQ7f
 34d+hWBpRY3s+WUVOdBMu6rROa09JHSnFh9xFc59gi5/7ipCBL4w3LPqhFPnVIO0d4LQGYVUNIA
 gKYWO1pFEzBxgQVeY0J4wgA51XxxafoRdQYkn53F8puO00+4wv846dTdYfiATvLb9fgw0CzMask
 WrMD1fn8ayc1hjuaSj2Z6wONW/vxE5PdOvjFmXOoybIKuYqIHDBBeEjCug0A2O9hzxz7qZQxmyA
 Js09AGHbC4RTJuxo7ZqstFr+TWEOib4L/c3TkRuoSgTbd2oERPfagOR5Ncm4SCT1UyHlPitGt1F
 MYXimmfyIjm8y9g==
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

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 25 ++++++----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 8ba1b9f43ba1590753d9601123f9261a3bf41b8e..41fd68b7757b38d4d71b27598b31888fa399c97c 100644
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
2.46.1


