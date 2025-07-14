Return-Path: <linux-media+bounces-37665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F1FB042DA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED85516613E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DCB259C80;
	Mon, 14 Jul 2025 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v/GfC6XB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08CB25BF00;
	Mon, 14 Jul 2025 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505633; cv=none; b=eaYbe5S+dEMh+rjM1oskVAVD56dGkKXI1QcRw2dDonlc2Vu2s88EHfaAKs7ISUSD3Rr0sgKzVJxga4MuuKWRatca8HBggTaE683tdMCr1qsXibGQbJD3A/357RSJhg4HHDV3I2W9A3MNxt1mv/O6IbQJ1rFMoT1uG9xSPddP7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505633; c=relaxed/simple;
	bh=PxvqmiYbPz70hs/qoH9Iut4e6C/h17us0NlLYFupJ/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvByprjL6qahzxV3gpiUuIzAa2wj4dRjCBMEXYwIJbfw6X7WNVMRAQ0AWNckqcN7iBv5K176ajL9UrCXMCusukY5nw+QDHPF7heWFIQIL2zeOrVbUJjNjMGIq9FF6qEkrKPx5EvWxOrCKCr1Gjr7vI3oVwf386mmlia1OrNdXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v/GfC6XB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A82B31B24;
	Mon, 14 Jul 2025 17:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505581;
	bh=PxvqmiYbPz70hs/qoH9Iut4e6C/h17us0NlLYFupJ/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v/GfC6XBLD6nq1bXFY1NoL+Yc+1uR3YPRhJp+/BYpIjdGZkO8cIm0clxqcI/4XDn/
	 sZfidNBpBPj4B1mm9737f6RPZONcxyOZ63mXZVcnLDJO77IotXWXiKBkZMifDYV7b9
	 oCcKYg1bSTbxLKx9ig+T3dt1OHRLIaUMvIcU3QyU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:38 +0100
Subject: [PATCH v11 12/19] media: Add MALI_C55_3A_STATS meta format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-12-bc20e460e42a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2402;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=PxvqmiYbPz70hs/qoH9Iut4e6C/h17us0NlLYFupJ/c=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0CCHK9aZk2SI0RcgV/0tuTxD/+qI18F0XxJ
 9d57YU8/PGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAgAKCRDISVd6bEV1
 Mhn2D/9MMhEpgwq4bOTYhFBhlDQ1lfLzkA3iu+Gqn9rKhXDeqbRJe86C2B/CWTdcfur+G+DRPLw
 YONqHqDPIACRqY7PUlQefpme984cyATyfiqUPC3qtWEv1xSGhL9lc/DgSkL8BvewP3RneIh1k+F
 ayS/dzShlgCi1KVNyr7TZUagl1PmxGutMNn6XFDR0/3HjrHweeaALhgAOFq/82tX8zMWFBTPXUL
 C5ZKUzvBYyyge+iF5qSyfq7iDfBdfUeNIOf3CXHsZVuvMkkHa/ZD7FVLFGonypggnYMIKdxqhX3
 aE6u4A0UerlCYDZ1qlzxAFhmk0xcnnNnmde55mWoEoj6xJkeSZcHxxMqG60K4IaStC23aT6Hxtj
 xFZlJ7rB+vj0jSwUtzqIo2MQnEAajmxsu2zhMjK06WK+TjaMp3rpEvD+4gz03RpPFAU4B6bL0Jz
 DBBfKjFm/FxxFieFiC7STmpnGkfpKHmHMzIhvwKqqTOSgwwZoHNLS/s3mdAalDZroj2KBgImdRC
 SyX7fP9VcKIPvlVE/isJlj/u2g/s6dcJEdqfXLpLo2L2+rjbrjxFLsIb0vZOoec+VEAstBybVJx
 xC98DuRQ4uhO3j9mhXDtSkn1Vsa+jmK5TXhuTYRSZ3oGjfxB1FRbgL5GW/rzCL4gKf3/oC5lCP8
 q6ES1U6jCIbNXdQ==
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
index be94a79b976e3de4eb957f5d2584ec6d4230469e..d2e7d6b115b53980fef959cbd9c8e758819d20e9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
+	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 6f7bd38dd5aa4b1b2084685512512a380d76a5e4..752d4d6ae5ca4ca924dd8a58aed6c4af3304879e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -883,6 +883,9 @@ struct v4l2_pix_format {
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


