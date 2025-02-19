Return-Path: <linux-media+bounces-26374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1CA3C0AA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65EBA3A38B1
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4091F30DE;
	Wed, 19 Feb 2025 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JDlj/oKd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A91EFF9B;
	Wed, 19 Feb 2025 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972991; cv=none; b=beMwshb//skzpmL7ycdikxtAiFh2L2/a/PcDz08yv2FRC/F7xkrum7HKOYjDWhS+OL8U5EF8O+pF+etvSyYAnDjdeHV/0AdKGVcFXkrv94/giXlumfcwoDEcJpwvBJj7h3rJyAPl5dlsY6XMwBD+cvQsmR5BtczynTDTZPVuwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972991; c=relaxed/simple;
	bh=cI20VEEG0Wewbxtf6yf0cY16LqWf1h8sTX2S2UouvwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a8YHjQPKdZUGDEZUxvQuZDNL8a1uq0ikXPyhL7y3+T/LdTMj/wel++UZaO1qVPGw+wPI22MZ1Qlnev3EyIXpslp62qlskYDgZERjShg0wjxtGoB/BLThbOp+Qht49wM9wVh/X69EwlG2qJA26KVzAg+yPmAZsv2sjPdKTv9lRRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JDlj/oKd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8352675A;
	Wed, 19 Feb 2025 14:48:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972903;
	bh=cI20VEEG0Wewbxtf6yf0cY16LqWf1h8sTX2S2UouvwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JDlj/oKddSHCuhVL04XS/DFPJFRTtPH51ejqCtQslYxUVM7ELJWTXz2w7exgZRHOz
	 oE3gYRf17risCx9zT0xXbmRUAXa9b/hhVa4WNrA4g2ClZdXX8x6a5jbOllk/v73JHN
	 UiGojk7hWvNqoIfwZWk/FLWr6Rh4iuw3Jgzileog=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:48:57 +0200
Subject: [PATCH 03/18] media: rcar-vin: Fix RAW10
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-3-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=cI20VEEG0Wewbxtf6yf0cY16LqWf1h8sTX2S2UouvwU=;
 b=owEBbAKT/ZANAwAIAfo9qoy8lh71AcsmYgBnteFwUn2vdNxe2ESg8YkBy7AHTJAjWcqWqcbcK
 O2Z3lBuHz2JAjIEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcAAKCRD6PaqMvJYe
 9fHkD/QMLIzJRx1BRcxckphx+wWzfnm2pU5vZUhkWGkE+DJ5K1fAnEpfMV4QLGpoWW9eKhrmGPx
 +tlmpW9mwKaL4Uelvr108CcIOdPTa7GggbWKpaxivJ4/Img6Xq+kHfXnEFNEEqHxeZ6nX22dcNq
 zR9fYskfXx2pdQaeVJZZhC2VJzz5DIVRW0EGJWYlqRpoRPFQPqJHEOFKv9oKCGVLQMA8XO/gLah
 0ruFoNcnN9IflDZsdTregkF6ZAdW6d4mnAQTZoyp+4RmNInnCFNbJone0zsMXX+Ux0gXrPi5tyS
 l5CpdVsw6d2wFnZUfjV7AUV0V5YQaLulRd9XeNSWRndPY9e+10H10soF0jySZAbKK1kmOopa3OU
 DQ/rSbUZzI2rOfKQgArf6VdFn7NNGWmjFvelUCRAxNa+okdCuBZNKY84aYXQtpXqM5tU8c65zkQ
 K/RxMUrWUYWTUVjyDZgRKAGCqK5FWi/96XFnhIE+/GMC1bg+NFAHRlya4y9oZXV2ZKsfS/K/PJS
 oX0+371dIBEiqVzP5NeTwSGDHMfX00zznVeqe3BRPFBwnNs2gaWACgGw4JBqLG+4DYa+f7x/xEn
 bGcQtOgrQ3fjxUvAbCh4s9b/XEWT6gmi+2p1SvkUycqdfNX4tk5qMrkVmyCJ8VGZQHlxwNtmVte
 eF2eP5UxhsNlm
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix the following to get RAW10 formats working:

In rvin_formats, the bpp is set to 4 for RAW10. As VIN unpacks RAW10 to
16-bit containers, the bpp should be 2.

Don't set VNDMR_YC_THR to the VNDMR register. The YC_THR is "YC Data
Through Mode", used for YUV formats and should not be set for RAW10.

Fix the check related to the RGB666 format and CSI-2 mode. The
VNMC_INF_RGB666 define is the same as used for RAW10 on Gen4, and RAW10
is allowed on CSI-2 (whereas RGB666 is not allowed on Gen3 on CSI-2).
This feels a bit hacky, though, and the formats should really have been
verified already earlier.

Fixes: 1b7e7240eaf3 ("media: rcar-vin: Add support for RAW10")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 9 +++++++--
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 8 ++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index bbdff7aed9e2..00629acc6404 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -829,12 +829,17 @@ static int rvin_setup(struct rvin_dev *vin)
 		case VNMC_INF_YUV8_BT656:
 		case VNMC_INF_YUV10_BT656:
 		case VNMC_INF_YUV16:
-		case VNMC_INF_RGB666:
 			if (!rvin_remote_is_parallel(vin)) {
 				vin_err(vin, "Invalid setting in MIPI CSI2\n");
 				return -EINVAL;
 			}
 			break;
+		case VNMC_INF_RGB666:
+			if (vin->info->model == RCAR_GEN3 && !rvin_remote_is_parallel(vin)) {
+				vin_err(vin, "Invalid setting in MIPI CSI2\n");
+				return -EINVAL;
+			}
+			break;
 		case VNMC_INF_RAW8:
 			if (rvin_remote_is_parallel(vin)) {
 				vin_err(vin, "Invalid setting in Digital Pins\n");
@@ -931,7 +936,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SGRBG10:
 	case V4L2_PIX_FMT_SRGGB10:
-		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
+		dmr = VNDMR_RMODE_RAW10;
 		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index a1b74be33ab2..591f1a4d3595 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -88,19 +88,19 @@ static const struct rvin_video_format rvin_formats[] = {
 	},
 	{
 		.fourcc			= V4L2_PIX_FMT_SBGGR10,
-		.bpp			= 4,
+		.bpp			= 2,
 	},
 	{
 		.fourcc			= V4L2_PIX_FMT_SGBRG10,
-		.bpp			= 4,
+		.bpp			= 2,
 	},
 	{
 		.fourcc			= V4L2_PIX_FMT_SGRBG10,
-		.bpp			= 4,
+		.bpp			= 2,
 	},
 	{
 		.fourcc			= V4L2_PIX_FMT_SRGGB10,
-		.bpp			= 4,
+		.bpp			= 2,
 	},
 };
 

-- 
2.43.0


