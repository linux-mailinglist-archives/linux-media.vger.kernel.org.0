Return-Path: <linux-media+bounces-10443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B481A8B6FED
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E58541C21B14
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3123F12D746;
	Tue, 30 Apr 2024 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LUKDnatF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB3129E81;
	Tue, 30 Apr 2024 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473642; cv=none; b=ZIg60q1evsf2bkuf0SZN4+X+5ohjHC/D/0KJWmXmm6++OV8drzlUtEYFpRVY2pNCTRYfsdl5BcdtbNkC87PDzVDyKJnuA6xZjRTgdOAIpmbvXThDi/VugsTMYnYGLyo4NBYNW1oPqaSZHJShF/1z9zxbYZmLb0fLpmp8uDLk4aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473642; c=relaxed/simple;
	bh=Ho878wuw/DukuUkY4lCGGSGjZ7Zs6iFx6Zht8O1shkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3lGZ86cBpxzrgZJ7uURsNmQbVNlpXQKwt8AIEqmtQNXdzuRffJ969bzVkAdYKZx6bUDPrieYguFAy0deuhA2SnIT6VQEx3WIYqUhO4udPQ+q8jm7XJ3OL0h1nhk2RMdLxR+pwHfGtR5mF0YL8SlPbcew+G5Yb2/mOrEUI67mYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LUKDnatF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2563FD6;
	Tue, 30 Apr 2024 12:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473567;
	bh=Ho878wuw/DukuUkY4lCGGSGjZ7Zs6iFx6Zht8O1shkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LUKDnatFNb6/BhJavK+qGtNNMsh5vSeWw/mUrNxiqFanLO98cKx3DUxkOTvAXROec
	 PdCk6+Fw0ewnjawMf8SBNt1J2ssfQy8gMQRfaxBBChic6ODSlvP26iVJbxqisUJV6b
	 xZgfzHlcHs8pzpnOBZqa9NsDRYTiXqgDKM4f+poo=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 19/19] media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
Date: Tue, 30 Apr 2024 12:39:55 +0200
Message-ID: <20240430103956.60190-20-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YUYV8_1X16 and UYVY8_1X16 formats are treated as 'ITU-R
BT.601/BT.1358 16-bit YCbCr-422 input' (YUV16 - 0x5) in the R-Car VIN
driver and are thus disallowed when capturing frames from the R-Car
CSI-2 interface according to the hardware manual.

As the 1X16 format variants are meant to be used with serial busses they
have to be treated as 'YCbCr-422 8-bit data input' (0x1) when capturing
from CSI-2, which is a valid setting for CSI-2.

Commit 78b3f9d75a62 ("media: rcar-vin: Add check that input interface
and format are valid") disallowed capturing YUV16 when using the CSI-2
interface. Fix this by using YUV8_BT601 for YCbCr422 when CSI-2 is in
use.

Fixes: 78b3f9d75a62 ("media: rcar-vin: Add check that input interface and format are valid")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index e2c40abc6d3d..21d5b2815e86 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -742,12 +742,22 @@ static int rvin_setup(struct rvin_dev *vin)
 	 */
 	switch (vin->mbus_code) {
 	case MEDIA_BUS_FMT_YUYV8_1X16:
-		/* BT.601/BT.1358 16bit YCbCr422 */
-		vnmc |= VNMC_INF_YUV16;
+		if (vin->is_csi)
+			/* YCbCr422 8-bit */
+			vnmc |= VNMC_INF_YUV8_BT601;
+		else
+			/* BT.601/BT.1358 16bit YCbCr422 */
+			vnmc |= VNMC_INF_YUV16;
 		input_is_yuv = true;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
-		vnmc |= VNMC_INF_YUV16 | VNMC_YCAL;
+		if (vin->is_csi)
+			/* YCbCr422 8-bit */
+			vnmc |= VNMC_INF_YUV8_BT601;
+		else
+			/* BT.601/BT.1358 16bit YCbCr422 */
+			vnmc |= VNMC_INF_YUV16;
+		vnmc |= VNMC_YCAL;
 		input_is_yuv = true;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_2X8:
-- 
2.44.0


