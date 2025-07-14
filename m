Return-Path: <linux-media+bounces-37669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878AB042E7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F60D16929D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD81260562;
	Mon, 14 Jul 2025 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jOplQvN7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F55525A2D8;
	Mon, 14 Jul 2025 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505640; cv=none; b=AvLOqWrwKPvSgGtUUW2hT5d4pom///QSisqQUn2IsXg4iiAGOJKxWGgXYaxo9+crFCh0RhFgRWXKdZGS0H3TW2Jz74sqlkKw47VoBfnwshjJYI9NUKweqTCYyOITdng/fDSwwehFyRQG3f1HK3UUO6DvlRGKHNDtL9J68t4QDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505640; c=relaxed/simple;
	bh=XjVjn+xAvh9s3EU0BVPLhg8s5WFvUqD2cs3bnzs3Z98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCsuW/DvD+GQLmQa+2m+Aow9bnDIUFOg92dDi7HT5uGpZeEqkLb/FpUYcco5jZSMl5BkWzx6jgxFQyhF/a++3WzRLnBWudAh7HVtugiIrLN1KQof7ez1kfMM4PFS5YzkKHJjZuEAwJTfqDJL/gsq1CUwScv6bKXp8e952h+bvdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jOplQvN7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 910A65405;
	Mon, 14 Jul 2025 17:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505584;
	bh=XjVjn+xAvh9s3EU0BVPLhg8s5WFvUqD2cs3bnzs3Z98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jOplQvN70gjkQDqs9HgzTuGRAmXEVlmHyI75zYJfZG926GqIBfJkQibegujpBoQuw
	 qNveotNU/vZdUgEYy3zRQcvL1lUEbJlvkP2UVeJrVI5nwM6l29RO0k4i24Q3cAMagi
	 lSbQ7nqzCxEPaMl+383P/NxBrQk+4lfnZVLUybU0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:42 +0100
Subject: [PATCH v11 16/19] media: mali-c55: Add image formats for Mali-C55
 parameters buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-16-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=nlVEOOgtyKoZ2JgOMvjf3Ic8ZvOX/TnVcxqvgJ6nnHM=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0D+zTqBdxmhfrq0zlneCzpjem+3YZRDGx7c
 LsM6xzLCPGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAwAKCRDISVd6bEV1
 MoY3D/0RYtHCxCLkFN0e1x8bad6oTixX+U2RDAiIJBBzw/FpnSvnj7rMnFRBCn35BPQbVZlN+/w
 3x5lNU8+BvQmHOJkWBlE2f9zFn9mewYmpxB1RFFNl4wYYB/Yiv9NGL9z0cF/N9pRIcgvAkOHUGh
 41vsy7EoJf8V7cpyPBQPAoGvHAfBbLiy7NVEScNzDW/iYCWurfnZoWu/vrOIA2NmT2ecVDcuWUf
 j403fF7UmGvXy8T27ugl9ecXjoo6JyDE8ah/t+0sTpKf52txRfoeq04rzaBEldkMqbaqR7BOx3t
 /7XC5wEKRSjRQrLR8eYcDn7ky/QJa1Sd1KZnBVc/UlhwocxZf9SUbDYDt6cAHYcBECpzk83YPQ3
 l6JSPUrOMOhR0/AJJtF3zaXs7LFsW1tv6JDVZD2ADoqOb+cN4RkD/E0hd8Q9a4tFT8uK0bv4A7T
 Xe/thqjw6q+Ru8+MBJGYfR5q0indqbih4BYOzLjk+zVxBiKgJCbmRPW50X5gePYeFGrcWWmGOu2
 47Tb2NNfRXwqIXycI2x44L5UzLo+lpwF1bMiDGFnNYmFWGCjfNLlNfa3xyMscpkOPE4G3Fst64Q
 fWjXTtj1mKIMxFOFum/IyJleeQCSzS4QyJHPGUnsiFRW9YgHA9Hczv8/Cf8MSfR5qWu4mixCcsp
 odmNP1/6LZriuew==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Add a new V4L2 meta format code for the Mali-C55 parameters.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- New patch
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index d2e7d6b115b53980fef959cbd9c8e758819d20e9..bd65cc771d682dd3856a7a0a38dc63a268a01e7b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
+	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 752d4d6ae5ca4ca924dd8a58aed6c4af3304879e..9da42c528a04398e05c06b5e9da4ef22a0b2c8d0 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -884,6 +884,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
 /* Vendor specific - used for Arm Mali-C55 ISP */
+#define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
 #ifdef __KERNEL__

-- 
2.34.1


