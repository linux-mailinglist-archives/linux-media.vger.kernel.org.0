Return-Path: <linux-media+bounces-30901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FBA9A2E7
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93FB64452C1
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BBE1F463E;
	Thu, 24 Apr 2025 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uEv+IJqh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9991F4163;
	Thu, 24 Apr 2025 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478399; cv=none; b=L79/znHT37AKAHpPHsG8HrhWmNaD8w352UY2sRpK0FLzKOkH6o10D6GJz/8ebSPhf7zz4YrkQSmk1Oq0xXz+agG/wqHfiDDataCAU+hINDa/NYrodr+fs49mz+d9b/K9s36zQQ7E16Civv44EcgqqP/6/Ni+hiEVYP6lyaHyvfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478399; c=relaxed/simple;
	bh=xhH0XMxjiI3yb2Cbwo/0uvupPBVxsULcWWPLtlgIQds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqb9b25kfwAFvCm5dhHgoyE4ABOZC7SK/cSUW1M6u2hCd6FhCWh/Y/VatsgdgCzWI4g+FbAMN8E9jzPFDAHO8ZNSg/bPao2jL0HifYoreceFjEdkISdk+IqnbKSexHWJjwHpJX+lgQqskmpPH8jqh58uS2ptV8lPftHtjGHy70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uEv+IJqh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD9E51666;
	Thu, 24 Apr 2025 09:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745478388;
	bh=xhH0XMxjiI3yb2Cbwo/0uvupPBVxsULcWWPLtlgIQds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uEv+IJqh/UNYUWA3hLM1GEC6yNkPA2mIZRNMRiS8PoGc6OGV1jUFbSCYqTV07LGWi
	 aPoa2w02BDhTOwQaOfp/C8uq+gs3yH9JuDk5mUPa/tcnzlKUf97W/c9ryeaymCFyk/
	 mJ0bmmKG2u5Frn2fNAgQVYynIaEcXQfdzvYZOJDk=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 24 Apr 2025 10:05:36 +0300
Subject: [PATCH v2 4/4] media: rcar-vin: Fix RAW10
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rcar-fix-raw-v2-4-f6afca378124@ideasonboard.com>
References: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
In-Reply-To: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=xhH0XMxjiI3yb2Cbwo/0uvupPBVxsULcWWPLtlgIQds=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoCeLybYS0CNhsdk1MUMpQFpXEXJxMDs57bV46n
 TQ7SZEGQW+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAni8gAKCRD6PaqMvJYe
 9SJ+D/93EeRGUEnSSMrmFLwqwg1LDisXgEnzXc1gecAkOpk1YxxttctnEVJ8Ge/vd0lZizdetuZ
 tnfSMiBMgFfaJ7e6BBuZH3t7Ts5Bi0KUDGGVPC3auV52/UzRMlRLiiH9Q9dO7YIIeUHtpnwXQuI
 4Mtrg+xLvS78QNkMXE5fTvAeEPX5z8G5gDXNtfXpSBEND2yA6PzVO01+614eiKkyyBJghjIwCTp
 DSLOkInF6N24xXSZeMm2qvF0ZSPvgEeYL27446OcihyezUDeyXEW6q4a5+LgMbWCnW+RBUHeVrc
 CuZzSNVdFJIPspT4+OcuSZH72dik79Ld34Rel8psT91GOSdf2ugm8tZ7sTs1O6wpQmf83Fy5FLK
 uVtVXuir4Po2hlI1tBTA9HYDls5H8mmoJVgyMPt/9Z9aMNJGMcXhCh6JXgX8qntJ3yVeNTdRwe0
 tq/WGWJEHYCoXOTxYeqGUuFbGGuz7gtVRlGVJVSWXJisk0XnGmSGXs+SXEWICuPqVYfcJrLO+Qh
 +//hLNxFGYTxlkRGC/dgEv66pMJRHE1TzZfy1qxMh/dWX9IfU4tN5thA4ulU6pyDcLY6y3ZF7gN
 6V95H0WM31T9eifRhNGu+NPY5OR+wb9z0y/gr34hoJ/pxW+77mgaWa+3Tk7WOqfPCwC4mPGRdAM
 JxJOYMJbtx8xmPg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix the following to get RAW10 formats working:

In rvin_formats, the bpp is set to 4 for RAW10. As VIN unpacks RAW10 to
16-bit containers, the bpp should be 2.

Don't set VNDMR_YC_THR to the VNDMR register. The YC_THR is "YC Data
Through Mode", used for YUV formats and should not be set for RAW10.

Fixes: 1b7e7240eaf3 ("media: rcar-vin: Add support for RAW10")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index a38c7b835231..9de1d3d91fa6 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -890,7 +890,7 @@ static int rvin_setup(struct rvin_dev *vin)
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


