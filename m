Return-Path: <linux-media+bounces-34219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9F3AD0064
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A3C3B1304
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438E42882C9;
	Fri,  6 Jun 2025 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="er7gwa/t"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A88287516;
	Fri,  6 Jun 2025 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205777; cv=none; b=m6Nks+ed82bCPIlcJ7KEPeOlHoBTf4LIGEAKT2Y8NRV8SGS7PFBf7PLdVY1EnhbLhYsb9Ft4z5wXnazxo873F73xTwSJqZodUi9/4W65Sr0PefoAlIUYtCxYmfTAWGYJ2QGke9mSVfgxJmVSp15trZlwSS498Bs6OQLRSUi04bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205777; c=relaxed/simple;
	bh=9MM74xoBnZjeb+7dlcAgIXr4ZI2P++CHv1REUpu+GeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nd8mRtDDOgn3OFa3cvBUx3uLLn1SNvp0Mt27STdTPoZQ1KkximxUv4QuJBt70TtFajgZvL7FcMeDgdTm/iaMqr2g1LNbq/MlGZtFfmyF2FejDk3FDzzx/2pWhtnmvEr5UupQFAnU+aIdYqo6SVqPVn2RFOHf64exwyqaCof6hdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=er7gwa/t; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93FEB1449;
	Fri,  6 Jun 2025 12:29:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749205768;
	bh=9MM74xoBnZjeb+7dlcAgIXr4ZI2P++CHv1REUpu+GeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=er7gwa/tSh7C4H/PxSZsAhdzkpBC6d9YzX0Xc1X+dcVMz4NsSoRAqbo7uSCi9gPRO
	 ujHcJvb+EYg2cT8HfW3Tqwa6qjZtK5nvIfBofSR1Iy5V51YdSdnV/X1tc63Q9WW9Hd
	 nDT5vSrL4edUEMVsQIrpRxNrX6Hr2Hv5APrL442o=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 06 Jun 2025 12:29:22 +0200
Subject: [PATCH v7 2/4] media: pisp_be: Remove config validation from
 schedule()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-2-46169f0622b7@ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=9MM74xoBnZjeb+7dlcAgIXr4ZI2P++CHv1REUpu+GeY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoQsMJrEbciS8x2BHdIWih/2w10/v2vY3ocpNYy
 +Fd9/iyT8KJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaELDCQAKCRByNAaPFqFW
 PGTXD/0UhSC7RVmTpo7+6azLUS7zBmkMT5p/G08Lu2Wz9NEezo5GvXp2P4dx3ruWpU6OowFF/1W
 tPjwlj4rC1K1ZG0ZSt1xQFsmr76YjKRUrAHJIsaaKoYYnskRlOKZ2DereCPP2XePKeA7EGp9/iZ
 bx9uNfBMbyPvProqMdb65iuiwawNCXQMOUxjGabt5Wi0m0cT9WiEYeULiJE7xDwgRg461bIh1rE
 n5CVOC+crpNPBCsUa9ZEQjvKJSCu9sL1hBYupMDV/U6DE39oeNyKbgwZjGxtY6lX+D2HI691YHP
 snqwIL+fk52+jAr2PJq6ra0waUAEtQmNFVWD5i+3C98KJ+fbZNIfxA77trkJwCjnoaiQiCHM579
 2Msc4h0secTqAh+4K0AE/HJR4BkKK3ifXaXnfu9boznO0KCYlYFIpOoHA5ZoVfpRHm/mYBiI/M/
 Wow6KHFqzkaFB14cd/STuDAV2CVB9mePsvcyl9x4Tz0FP0tY8YTe3FyaBmkI32S1rtnjjqKrTh8
 wPnH6hR9iEsmvqhNShfZ57smIAPazXg/+eSZTTiS3bBhN9Tf85ruh8WBD1wHd2u6dqoOSqN0Tul
 Nj8Dqbm0WyPR3xNtvBSCpokm4Ek1Hk0Dnesf4upKXwH8WCxTbEksz9HUFDpXTEa3S0G6/a1BhVw
 2hXbLEgfTTTgQGA==
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
index b1449245f394..92c452891d6c 100644
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


