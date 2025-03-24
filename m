Return-Path: <linux-media+bounces-28625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 868EEA6D94E
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 119207A3EF3
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 11:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F196225E836;
	Mon, 24 Mar 2025 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V8s1npky"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B2725E803;
	Mon, 24 Mar 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742816966; cv=none; b=AndQ77Wd7el0nSNS1mv/8KHe1rRLlfie5CdpSUxKdUyaqyS8Pr5FIrotP6o4gZEVe9E9d+FJks4Sc+GQrXW+2QRznxWW7wiNqulmCQ5fnpAe/A2pYS/dyJY5+R0v0rhDzFzOU6VKwgPQGJLVCWTy8fZQR8qLbpbinOTX3g968m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742816966; c=relaxed/simple;
	bh=aLanm0QqoHMeJ689eljYWwN7d8uu1F99MXdNNkMINrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=quEAMh0awVqBTOo9ENVyY+WKY6SHCX/vbuj5jZszITcdfja+T1v7ZLYfz60scJES36AHkkcPvf5cfAUA+iR7A+rU13K80qA2eWwPPhbGc+ikgiK5zv87mlSB/QtGCLSXOgTPLEWGDEQcF7mIfo7sCNcRh9By7mAX5Tc4Mz9DOaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V8s1npky; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EFB510DD;
	Mon, 24 Mar 2025 12:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742816855;
	bh=aLanm0QqoHMeJ689eljYWwN7d8uu1F99MXdNNkMINrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V8s1npky6WU6sKCA+fmXIjaiqdBUVAKdW4Z76dw2KXapqCJzmC+OFP2q4D23TC8gx
	 dAUP0BcLt0mzbfp68K7EMqAF3xRxFMI1cJzsJpoCZLY3FVv/+Dw/LRYDs0febTsxqs
	 eEau9qJdwXMJu180J45xIu0Soscuz6ryRWf948ak=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 13:48:54 +0200
Subject: [PATCH 3/3] media: rcar-vin: Fix RAW10
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-rcar-fix-raw-v1-3-ae56c1c7a2f6@ideasonboard.com>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
In-Reply-To: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=aLanm0QqoHMeJ689eljYWwN7d8uu1F99MXdNNkMINrc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4Ua+hTUbk4ltQ36kDYhFUqSslrROA+tQb66X6
 iEo6cMsdSqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+FGvgAKCRD6PaqMvJYe
 9SMFEACnEV5Ruyo+GmMLFswQoyA0NRzaDyRVzc2rmavXTDG085zhHNsH6xbZXOQX0Br1rRsLEfv
 u1NK22mA9526XgX4wRJvZLFpWED/+3Wk6f+UOxwE7iGFbbnbPo7bpJv1P12Fx/XpVvbdic6+IrK
 NPc5HHNjqP+5jukKEnomJiwivKhD5mLDrtn3NE7FxWY2+yt+AqsD6ycU9wRsgihMAsuyMeCZ2eS
 N8pVY9VOiY6xo0odX5sGcB5N4oE8DSC55Mk45QJ95BQd83jiOIuCEHQQ3RN07DKB32GH/cOt/tR
 aIu2RfwLXXuTgguQEAAFcxCjmqw0yfIOptu8t6bDIKJk+6QsOEHElFBSsDVTjlT4hS79C0QuhpR
 aLHh8qly5F/IT9YJ8PXrIUfTShdLhy381Td5f0yNaoh630HUjGX/Wl1ZF3pAY5gl02YQKLvWAIx
 RS0z7+ZmeRECa2Hei5m8WAk4UGGZi+gm061yD7Gj0AripPyclQ/C6bPGm16qYQmZAdP1/ArJzmN
 ZlTF5JeVPyaWwAM6xKWPAaOFm7Ss2312YFHqmgJDojxu5dPpNwYYUWLRIVfURIXdXfe+MyKUgA2
 n4aet++LA0nVOSfhczIJS4t20Z493mUK+6YRTtIC4tUgWjV2fjiJVW2nPefhX/sfYuD6kH1B4mk
 /1rN0pot3LP7WMA==
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
index 53046614f7a1..f8394be8a922 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -811,12 +811,17 @@ static int rvin_setup(struct rvin_dev *vin)
 		case VNMC_INF_YUV8_BT656:
 		case VNMC_INF_YUV10_BT656:
 		case VNMC_INF_YUV16:
-		case VNMC_INF_RGB666:
 			if (vin->is_csi) {
 				vin_err(vin, "Invalid setting in MIPI CSI2\n");
 				return -EINVAL;
 			}
 			break;
+		case VNMC_INF_RGB666:
+			if (vin->info->model == RCAR_GEN3 && vin->is_csi) {
+				vin_err(vin, "Invalid setting in MIPI CSI2\n");
+				return -EINVAL;
+			}
+			break;
 		case VNMC_INF_RAW8:
 			if (!vin->is_csi) {
 				vin_err(vin, "Invalid setting in Digital Pins\n");
@@ -913,7 +918,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SGRBG10:
 	case V4L2_PIX_FMT_SRGGB10:
-		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
+		dmr = VNDMR_RMODE_RAW10;
 		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 756fdfdbce61..65da8d513b52 100644
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


