Return-Path: <linux-media+bounces-37658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C59B042B8
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5839D4A4FC5
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC1125D527;
	Mon, 14 Jul 2025 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G4zDsRhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95E325A2D1;
	Mon, 14 Jul 2025 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505618; cv=none; b=DK9vbbapLFw468UQa7yuXMCe+Rq9NaYk0p4+Blwbx2zbUfq7+Y7JC8bmMJKD3leVGWmOmn0XW9KLH6xYqL1LMJswuFppOv6GXrMnsUCzah1sZ4wwCWi1bwFSrhErFHMfHaZ4t53o3BUNXWgKbuPY58uzuMHxcTpdd87IfyAHkk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505618; c=relaxed/simple;
	bh=ZQUU3jmSUSxgVvqdoecsQN8+9VxXx//7OqvGkQ/kxQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=noCAxP4RuZhGAFS7Zj6pI1TGTGH8UeW4fs2v689IycL5v5olQ5WEMX7vEWUKl2JQUReT5nh/EcRtEgi/UfvnzSvDzUKI1rUxfFYS4ZO8IO2btF2//NUq/NVtPbPXqnDYUmiPBt/d362H9yjhGUca46qXjm1dI6mVMF8636d6CYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G4zDsRhJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08E1D54D6;
	Mon, 14 Jul 2025 17:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505576;
	bh=ZQUU3jmSUSxgVvqdoecsQN8+9VxXx//7OqvGkQ/kxQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G4zDsRhJCN36zqAJO0GrlJhafhdAheyt9cnJRc/OURWIOmiRfF8+2gYuqf0PDLpfa
	 RiU005ab5D3A+25M9ngJuqs0WnPqlcpz+cnDwj5wa+jc+KbOZXXVECi+vduDWLEEWJ
	 WKILUgRgISOD+sFGR8V0G9QMqYvoMw4eNyOMgRcM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:31 +0100
Subject: [PATCH v11 05/19] media: v4l2-common: Add RAW16 format info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-5-bc20e460e42a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ZQUU3jmSUSxgVvqdoecsQN8+9VxXx//7OqvGkQ/kxQM=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0ATXqKOp14Gy2P1Ty5prBhhCaixe3I98kao
 sDa3g+movKJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAAAKCRDISVd6bEV1
 Mk0TEACTvdzYRIzFxdEW6Jzv9lGJKwo/iZEy6qIsGu/m2lzNWd/b+RonJYhIgP9xyLKwBNTEQ1k
 apREeOxM2GWlYUsctz2B9+y/XOUZlIv58GooqQxq8LfqifMJ57RyDaW3tXH6iX5y/swA0vDhw1X
 ak9dbyfH+3RZvKWFrW9j5dRT7PlF0v3wM/500GKkvsV9OmTy7dRVTiqP9JqqU/Ptj8WgKmRzinp
 4zEN40c/+CE1DwEFELD/O18/5RdhA4dYaRtrb1gNO5Oo/cuds8IvSYHMUoSZC34N7fFKN+eC44L
 g4EdJHQf0Jd0wMY6FjDfDlG5Oun8oxEV4qM5zkdIg0xKb7uhykZlSdGVYEFGYWiB7lytVnn2ZQA
 n+aakoYDVjc8MAigHbE1ya6drncFllxI7kF3nTKvg6W5EoP79MESn9rm2WxYLYHTNcRg6YqShse
 bvnI+4poZXKN28OgHawltoLgXUZNFg/AeOJCtlILxK1iDz8XfH0TLICBc4wlf2xNVpZAW/+ceGR
 Q+aKZQXl6yeDA0aCUiFkzYJVNDtv4paQEyFGJh3ipq5/RJtPeUEsP1QWI1DE/336MY1fPk9AJSc
 IbVi4wwRd/zYgNCcZm7UalJIgVGQr08lgZhy8q03kBzBmCoyCrU2Gps7wGtGKYZ4xATU8NGc9HS
 czFDN6vvofK1bog==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add entries to v4l2_format_info describing the 16-bit bayer
formats so that they can be used in drivers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 drivers/media/v4l2-core/v4l2-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index df40756ac8f6c5103d61cd1d4b2ff99b8fbab641..5bac5d45c5ad19f2e76eda127338409d400d5aca 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -344,6 +344,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SBGGR16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Renesas Camera Data Receiver Unit formats, bayer order agnostic */
 		{ .format = V4L2_PIX_FMT_RAW_CRU10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },

-- 
2.34.1


