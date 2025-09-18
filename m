Return-Path: <linux-media+bounces-42722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1830AB84CDC
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 15:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D7ED7C3C27
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 13:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF4730C0ED;
	Thu, 18 Sep 2025 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RBryiVGw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F3A30BB86;
	Thu, 18 Sep 2025 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202085; cv=none; b=RyTDHSE91k1o5LL2G4gIuPEQCZFcswtAUoEAuJy9ziwl+wNN3NEVr5rs8lvL6FgekReMecAqlGXOjysU4Kb90y23E+4PxNMKAd1ofcN33zFSVTJFWMWBvZaw1e+pTpvIvE9Xkn01gYiyGvqr1+zYTmBNh+SZtscr5K9QG+VgvkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202085; c=relaxed/simple;
	bh=DiD08csnYfqx0XNhFT7EmwcuVTpo3RN6h8m6Sfi7xLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FbrkWW4zR4qRYQRgn8/66NwKawJYic/zmk7tsnZHg/3yOG6WM/HvjsP2hXcYichzJW1afCjI2Ez34UWemKEZin33qDh10mWhbv4xopKxSAdoWHgU14xVaDYb69jD3fmq3ihqRPTrxqKtqzxhyKEVq4lcfPtuyp85sjdfh2qZ4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RBryiVGw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C151CC77;
	Thu, 18 Sep 2025 15:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758201999;
	bh=DiD08csnYfqx0XNhFT7EmwcuVTpo3RN6h8m6Sfi7xLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBryiVGwau/MYWDsbwgBn5iWx01rnuuQAXCOkcaMg4f0kX5E2jBnBapgp8qefhz8d
	 b5jG/iF8DtnoeTOMJsNxXVt7Rk2ENolxkZ8BasyFtsVHdLP/TfnRTt8QS+ZJvzpU7z
	 ifIGTg3sB56UWdgVQdpavw7/wqIiWFYJ5/rpUmWo=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] media: i2c: imx283: Recalculate SHR on blanking changes
Date: Thu, 18 Sep 2025 14:27:52 +0100
Message-ID: <20250918132753.3154059-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com>
References: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exposure control on the imx283 is handled through the SHR register.
This value is calculated based upon the hmax and vmax registers as a
property of the total line and frame length.

Ensure that the SHR is updated whenever the blankings update and adjust
the frame intervals to ensure the correct exposure is configured on the
sensor.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 06c4b01868c0..582975ac849f 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -807,6 +807,11 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		dev_dbg(imx283->dev, "V4L2_CID_HBLANK : %d  HMAX : %u\n",
 			ctrl->val, imx283->hmax);
 		ret = cci_write(imx283->cci, IMX283_REG_HMAX, imx283->hmax, NULL);
+
+		/* Recompute the SHR based on the new timings */
+		shr = imx283_shr(imx283, mode, imx283->exposure->val);
+		cci_write(imx283->cci, IMX283_REG_SHR, shr, &ret);
+
 		break;
 
 	case V4L2_CID_VBLANK:
@@ -814,6 +819,11 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		dev_dbg(imx283->dev, "V4L2_CID_VBLANK : %d  VMAX : %u\n",
 			ctrl->val, imx283->vmax);
 		ret = cci_write(imx283->cci, IMX283_REG_VMAX, imx283->vmax, NULL);
+
+		/* Recompute the SHR based on the new timings */
+		shr = imx283_shr(imx283, mode, imx283->exposure->val);
+		cci_write(imx283->cci, IMX283_REG_SHR, shr, &ret);
+
 		break;
 
 	case V4L2_CID_ANALOGUE_GAIN:
-- 
2.50.1


