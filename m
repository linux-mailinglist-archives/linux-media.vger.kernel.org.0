Return-Path: <linux-media+bounces-43616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C58A7BB39D1
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EF933BE0CE
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766053090F9;
	Thu,  2 Oct 2025 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O16JTUbD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9893093A7;
	Thu,  2 Oct 2025 10:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400346; cv=none; b=GqvaF4UEO2Q0uhEFBvrlxv3ibQTAIc5iyLSj/ImcFI6agEAwTJh+VHde+gAUAA/n3CmrW7ZDNikiaeODbUPIHADnDmEG9tDhKs6NjbyJeh+u2f2WfPV4dxZplaef5VSVe3NLNImIVFHdJYCMq2A7jKjSWYpZ8tU15xQt8pYhCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400346; c=relaxed/simple;
	bh=+FZjh0KD1xYN054F5LZEiMZLyULw9GdMG4UwnOx3QKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ek0ABaL+gViP0pdiDz8rO9bceAMrMyELUXE4hkfqime1vxRiav+7+50aqFWByO2mJluGT0GFjyDk95ZgOjWSFB1vToHnyQnVZuRt5okoDCt6l59V1hD506e8O0hjqEZ4NveEKz9x4dJ00p8KUo27Y6jRxsB4w8WYAe6WN4N3n9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O16JTUbD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EF1717D8;
	Thu,  2 Oct 2025 12:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400235;
	bh=+FZjh0KD1xYN054F5LZEiMZLyULw9GdMG4UwnOx3QKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O16JTUbD3+tmQqrqaJKQjI05TX9RKPQauXWHmT3qpf3WiGjwICXHTm88E6Gs60DmM
	 w1f8BsIyRymteSzAxTQwsTJgc3mGQugB82aBOpDBrGrBcvKKy5jN0eRjnJqzkZpNdi
	 2x3zS89KqPExMXDR7eRmG/ND5mdIhxfQUPwXz8S0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:31 +0100
Subject: [PATCH v12 12/15] media: mali-c55: Add image formats for Mali-C55
 parameters buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-12-3eda2dba9554@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Me0+tvP4qtD9rKq4TYgM5FGzbi14RMDCwtIItjOMemI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF6NKxfoXXcnOckRhf0E+y9Lre1ma0c2LrYk
 RpHGgPHiMOJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5RegAKCRDISVd6bEV1
 MtBND/9AU8LAe7KW/4oUiAJwJa13z3ZyzIomrfEBZghsiwOiUMPhkovNzlBMYyxKn6g1+OL0YnK
 Cp61V1HFdQwqRgV8MZqtBL2JiOetjfbL9qCuy25i11RPV7Uvk85sS1w9SczmCWJPqBxvidxSP3h
 gA5aQzlmHZlLl8SfQdyWVsvMAwVeu8/OD5QtxRosuc2GXNNIAtxpnG8A/+dpBZDheSxlmZJmo9y
 MVwL3l/lqVh6kpO2WCQh9ftAmOWpmEcxItnh8KqrfaWmachpxtUhrgOwjStgtG28wln1ld7aXHb
 9z2iDYtk9eeoESBSm+rO8CJPHTffR7aHvL9e7LohPhAmdpNzP/IxOJ9B0jJ4+8FJ7fX3HYssqGE
 cWRQDOeIAbo+uIBPF9WY4QpEWTHK7eeEq9n8VhXtdW2tS8OwkQJKUMjI/ShEit+voZx+z4tto7B
 1PcyVM/f1Cry6X7Gy0/QEbRQHCg237QOgqmgA7RfB3OTk9ubYCVL7Rq9oi5LcN/OvW6/cvmSPO1
 pJTM720lOyNNMWF5pp9Cb6DYbckALEV4Oxu+zp8id2mCe1PxfUMbWvWEsSrdKUnMDHfL0z/QLUy
 CBDyhZrKTholrGloZWCi9MnkBdYxacWcrGoqxP8kphSRuAD7fWh9RKNksqcYCRk8i33lYr8u8ry
 QIwMt4IqCHpzbHQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Add a new V4L2 meta format code for the Mali-C55 parameters.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
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

	- None

Changes in v5:

	- New patch
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index bfab29938b8f43f3224e4bc794c21eb5b6e368a2..98512ea4cc5b9d725e1851af2ed38df85bb4fa8c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1469,6 +1469,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
+	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index cba4b131166773ae0d52c00de6e1c304bd08573a..add08188f06890182a5c399a223c1ab0a546cae1 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -885,6 +885,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
 /* Vendor specific - used for Arm Mali-C55 ISP */
+#define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
 #ifdef __KERNEL__

-- 
2.43.0


