Return-Path: <linux-media+bounces-27161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A2EA47C7C
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 12:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A0C87A24A7
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE8F229B35;
	Thu, 27 Feb 2025 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nNbVrRRb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65891A4E9D;
	Thu, 27 Feb 2025 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656845; cv=none; b=lXsWNyKId36owVrtH8CVzy1WoU6w5XOjeJjn65LERZQEHojwSAQejM+b9oFNIyFGV3EtIQclTrF74tqiUGXCNVrACqqMWcNV/vTsP3tjAkaAdbeU3p9as3ZFDMQqm8TOd2J8st4XT+SeKku2iyTCEHvz12v2tJKPalldUmsigeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656845; c=relaxed/simple;
	bh=CMGReD0WqsB5uzTiYELuHAlkALxDIGEWwbM9C6aIjt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKBcDKgRj6bV67WxE/Jt/aqrjZ4qhhZCK7GZ1naBtYOBn6P9SDKutefd5W6cPvIeIYmGS8OqTaxE1KLuB0ARm5BI7bIkgDYQqzXMmsY+O8Jy8xuNefKW9h2o1HCt/S0s6o3xW2xbXsTcpEAjwov82S0AqpQKmbxhBfL+a/gVckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nNbVrRRb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a3f5:6799:2ce9:5b66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A210F7F5;
	Thu, 27 Feb 2025 12:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740656753;
	bh=CMGReD0WqsB5uzTiYELuHAlkALxDIGEWwbM9C6aIjt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNbVrRRbOHj2qb2EDYltAkOsywSZzX+6+HSimopSAyVCAKq1UeOqYA2PGrgs8aA+A
	 KDZe68m4fBapfK/vtkoUWGxBWkT7a2zk3ypB07klrxY+dvjNUu4sD2KrDdp7uHSQCR
	 YyKSnKl4Suc/pvMMwfWwUrbV8bHm8jTqk+mg8KK4=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: rkisp1: Set format defaults based on requested color space
Date: Thu, 27 Feb 2025 12:44:59 +0100
Message-ID: <20250227114558.3097101-2-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When color space JPEG is requested, the ISP sets the quantization
incorrectly to limited range. To fix that, set the xfer_func, ycbcr_enc
and quantization to the defaults for the requested color space if they
are not specified explicitly. Do this only in case we are converting
from RAW to YUV.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index d94917211828..468f5a7d03c7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -680,10 +680,23 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 		if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 			if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
 				src_fmt->colorspace = format->colorspace;
-			if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
+
+			if (format->xfer_func == V4L2_XFER_FUNC_DEFAULT)
 				src_fmt->xfer_func = format->xfer_func;
+			else
+				src_fmt->xfer_func =
+					V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
+
 			if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
 				src_fmt->ycbcr_enc = format->ycbcr_enc;
+			else
+				src_fmt->ycbcr_enc =
+					V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
+
+			if (format->quantization == V4L2_QUANTIZATION_DEFAULT)
+				src_fmt->quantization =
+					V4L2_MAP_QUANTIZATION_DEFAULT(false,
+						format->colorspace, format->ycbcr_enc);
 		}
 
 		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)
-- 
2.43.0


