Return-Path: <linux-media+bounces-35750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A19AE6239
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 194B94C1BC2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3434F283FF4;
	Tue, 24 Jun 2025 10:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pXBQwD0z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8C917A2E8;
	Tue, 24 Jun 2025 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760514; cv=none; b=bQ422cLOfHHjL44tI3VVBfI5b6cU6mgJXVRzS+BKqvGplvx6RwSl9SdUAMaSsebTWO4LE8ey4SYbgn1xY/zkr2ns2741IhRwc5nuU4ZsWbcbNmEU5sMgzgr7Wmd/FESfkdL89ppmBe91CASXpuVNRwCeiIL5uKaVWriRSxqBHa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760514; c=relaxed/simple;
	bh=m/Xqeeea/y3ppbinMP0HM6EGei7bjWHfN4A+3KMaSyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZY0N7NKsOvgzmAzjVxPWiaEp0BG3lzQifzJbj50kmpzl9AbLPNkh/q1gKnrzmaLuz4tLD/qrqh4OBwFa32OmXvoPWr4tFw8AXee8MAKSYVwZkk6ShRIN+zZvUKPYCIxZPk6XbkoXoOek7py/XU1Bzdo9R6wMBiefI1MamN39h8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pXBQwD0z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 590FE1E5C;
	Tue, 24 Jun 2025 12:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760480;
	bh=m/Xqeeea/y3ppbinMP0HM6EGei7bjWHfN4A+3KMaSyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pXBQwD0ziSu42yN95duxxcwXXDPkmjwsOdoyQFBKdKdfxCFuvtRM6eNOQtCzetRjW
	 2Sp9IA9Hp6woDH4yBbcK124CqzZx/GIDK+N1gk7ttozvP4/FaySqbrkoswcrSpRLp3
	 Ru4tgs8rQi8+lWe0g0fOfjioBC/W4ae1B+7zPb8M=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:23 +0100
Subject: [PATCH v10 10/17] media: Add MALI_C55_3A_STATS meta format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-10-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2402;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=m/Xqeeea/y3ppbinMP0HM6EGei7bjWHfN4A+3KMaSyw=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwoBRgy4tWZxme+fRItQlnzXnwEB3OlDNjGO
 QRJ1cl1qmuJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8KAAKCRDISVd6bEV1
 Mm/+D/9xizY+fB0CySbg19JL6d4W6hM/AcynN/dp6njYvvDWb8E/xeBapJTqxag24+lCRjrcB6L
 qGXr0p0BYmtKawFWfUMH6CkpXNAnOqiC7D4u/dFoyUwpgIgxobz2dl+13Qt+bLzuJl6iGh0BZLF
 GUOFlNoUin+W9oedkFIJiMjygu+PUrg/LXjE2Awnq0ask1PwLq52v7GewVBgsN8MK1j807Dezwg
 jQQIgQ56FojYUhe5UEXnLyGX+S0AaPqIow0j2kJRtkrXWL0DRgyzv4o10KuBaQDGVtM5mOH2o6R
 OYcBMnOK9lHIZkjL4O84utxawJMF3kvICstxoq8PLjDcTaYhIeMR89qnm0yj7C44z/44u1dMEU7
 mAPhgtf+kWiLZQm8iGgdUEaywLrFT867YRz1Z63hEk9ORGvdF/z41RehzCQgDDRPJExqeSWKcrJ
 N8xlMk8R+4e9e/Nwj+Spv1ezo4MMgYOXEajzi8vrY0va32GViaq1x+CTsDJyKnAMbxyoJvMSN7s
 4CWTT5sRdcFDtDxKUOKOmlheJE3EpHRbB1jVpT0dCwQC58Yexde61ymQoRJJWPKVUUkGhyg38Le
 c/xujliQJgd6iFcrw5/SCcul8abh5dosiVbMEIgw54JhCl4ePWPvY5ym8V97Ac2tY+heE0lkPJP
 FdlWBXuAKHwDupg==
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
index 650dc1956f73d2f1943b56c42140c7b8d757259f..674260256681b59ab4919ea1f6bc437487e81ee2 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1466,6 +1466,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
+	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9e3b366d5fc79d8a04c6f0752858fc23363db65c..05023c16590db117503259f60f1d762b181c0350 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -877,6 +877,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
+/* Vendor specific - used for Arm Mali-C55 ISP */
+#define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1


