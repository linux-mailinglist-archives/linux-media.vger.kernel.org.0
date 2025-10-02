Return-Path: <linux-media+bounces-43612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C192FBB39C5
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4437C1689DD
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C5C3081C5;
	Thu,  2 Oct 2025 10:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dg9dHVT+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F2030AACD;
	Thu,  2 Oct 2025 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400340; cv=none; b=r1lf0MaxDNH93InkUpkgODHqOTa+3XU3i7ESTT87Hbgk/cniYDM4AcjXjDcFlihqTvV/lmzOUruokJElb8V/7GIHUGQI83BAba1F/o9gn5kWS1hywc1swws4zP8x1oRe5ibKtXLXOyQ9EYY7UWK967Xp0IOIt9W+KIsx+/6iO2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400340; c=relaxed/simple;
	bh=fOiY1/AZWM6G6PZTvW1U+5zyR9Ob6DNupG1ktoobXgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RirNNQMavv9FsSIP/gY5AIsOtv4kQ1WehieOVq1dXXw1YoS0Uv3TgjHWJDKNiwPgFufJA1pMcSDql3mGBh+IyTU06c6UBF7oMmWgozstYtHlAhbv//p3l3CBm5PiuSo0nIWJOJYM9B0EH6a1f402QLZ5AVjxkyVPjZPhIjCfrLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dg9dHVT+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 593721E5D;
	Thu,  2 Oct 2025 12:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400232;
	bh=fOiY1/AZWM6G6PZTvW1U+5zyR9Ob6DNupG1ktoobXgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dg9dHVT+PZXcHy95G4OjmFb91wjfL4pgvtaq8mOjqeDvkQ1+XNnVeygWRDT5cczNM
	 JNIPN2G1ssBq4eYxw7WkWZf5riwr+FNDGRcYc1Dz0VUQGX+FODGs+QR/Kqvdr2o29h
	 yUVxBrZYvbYE57BohuqZcsLycYyfIyYlF1DC4mWM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:27 +0100
Subject: [PATCH v12 08/15] media: Add MALI_C55_3A_STATS meta format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-8-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2476;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=fOiY1/AZWM6G6PZTvW1U+5zyR9Ob6DNupG1ktoobXgg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF5ZNe4qy7rd19gWz+0BsYLJJtf+UMtgZo0E
 ODS/mL8vV2JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5ReQAKCRDISVd6bEV1
 MocuD/4sZ4MDQeqP2/an70+lNYXi+R3OZXueEFenMlgZuWetSUUjiErTPq64SIlhIXvCZny+jR2
 7sv0n8U5lIMxd77EC4GvXdIZYX69oydJWs3SZQLdmiMnrkJjX6tBSTKvi1n6rKSAObgOOMnpTnc
 ITx4dkFSjp7cN3G2P8DjDB+MldfeI2IZPAMRHgw/tbwfP8kpphlFnB46Lhh6B/9IkLNbtNbRNSC
 6GEn+Mzn7eX4YRavkNLRjnCyaM+SfCPjqavBVTAJMc5i5mlOVAgQJoFpjEHH6kjY5nXpq7Rf2Bu
 PI7ymd55KOCU3J7ZgFCutelYJUPXuHrY3nVuqKr2vXJI5e99kk/1aggy+7RqNKvO291CqfIOwvQ
 t3lSPVOVAZQXhMrQ554gFH9BnzqyIG1UrKsz8IOX2qGQmYJ6qAe4JUZKgkx1wVcBLP0SfB90KFX
 wrNjP4MzS92FbmJsw4kZkmeYTuWFNlMlR+OXTWmgLR09iAjPRCPJRJZPGbGdFeN1KZ7IGkXvINx
 Ct+9f1Qfq2Jp3joJpld8GwJyOgeqQ/xSTH66xGpiY6ACcBB57vtrY0cdB9su9aYtYcnKoosq5Ye
 TmYvbtyidgy/4mVNipwr0i/fb9wJu3CSfAIMnkQV9cemhSucDQu0GhK8YY3BqOlpBc3ibnCdPvX
 KQRUB1+hOjykn5w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add a new meta format for the Mali-C55 ISP's 3A Statistics along
with a new descriptor entry.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v12:

        - None

Changes in v11:

        - None

Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- New patch

Changes in v5:

	- New patch
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bfab29938b8f43f3224e4bc794c21eb5b6e368a2 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1469,6 +1469,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
+	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cba4b131166773ae0d52c00de6e1c304bd08573a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -884,6 +884,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
+/* Vendor specific - used for Arm Mali-C55 ISP */
+#define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.43.0


