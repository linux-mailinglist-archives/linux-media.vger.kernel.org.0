Return-Path: <linux-media+bounces-7681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF38B887B37
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 01:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48763282545
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 00:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D6C81E;
	Sun, 24 Mar 2024 00:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H7ePD2UT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4951625
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 00:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711241098; cv=none; b=hTEWtmJz5DiNhWKHOVvWS5zM3NkLk5bwi3oQuPK5tx9DgH+m+OrEmGreMbndqIgLBl82Vbdy6OKf1NLs1VaO90Ob2gL4yU+yA9ZCqEPp+A3meN6dCazPlIaNI7AHoxBmT57NNZDGDxVHToYfKJsGcCnBOdYfsajG28xL7Kn20SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711241098; c=relaxed/simple;
	bh=iaatkivhxlH9naAXzFTEN6dbcjm4bhD8vnO4kDFsUbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPWdgHHiwBJS11vJigvPqXSCOK/3AikgZwIH507shk0Ep9iUST15dg5lOQrnsCDRzBZ4fTpBhNIoOuwgMrY3Fq6sVjmeww3/MX1lB8F0rjxgeUSRt3dgGY3vrOOWUPATmCNBEs/ApadzrXASRsBIKykEkWgHQVnYp50bmpILLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H7ePD2UT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09C4989;
	Sun, 24 Mar 2024 01:44:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711241065;
	bh=iaatkivhxlH9naAXzFTEN6dbcjm4bhD8vnO4kDFsUbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H7ePD2UTQU80uWDfX5qUqPg/BmAHh/wuKoVuk3CX6BFKdFEQqvfmB67PBJV3vh8+7
	 CI8zO9V8p+/UE8LACqEORcyoa+ZsaXfRTmY05ebq/z+C8H1Dk05fsMOpKugpu17YnZ
	 KP/+/elPZou8Y0sopXE3NS3KpIouHfVZzQfllnPg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [raw2rgbpnm] [PATCH 2/2] Add YUVA32 and YUVX32 4:4:4 packed pixel formats support
Date: Sun, 24 Mar 2024 02:44:40 +0200
Message-ID: <20240324004447.3399-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240324004447.3399-1-laurent.pinchart@ideasonboard.com>
References: <20240324004447.3399-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The YUVA32 and YUVX32 formats are permutations of other YUV 4:4:4 packed
pixel formats. Support them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 raw2rgbpnm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 6cada340776f..a2e278975d90 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -76,6 +76,8 @@ static const struct format_info {
 	{ V4L2_PIX_FMT_XYUV32,	32, 8,  "XYUV32 (32-bit XYUV 8-8-8-8)", 1, 2, 3 },
 	{ V4L2_PIX_FMT_VUYA32,	32, 8,  "VUYA32 (32-bit VUYA 8-8-8-8)", 2, 1, 0 },
 	{ V4L2_PIX_FMT_VUYX32,	32, 8,  "VUYX32 (32-bit VUYX 8-8-8-8)", 2, 1, 0 },
+	{ V4L2_PIX_FMT_YUVA32,	32, 8,  "YUVA32 (32-bit YUVA 8-8-8-8)", 0, 1, 2 },
+	{ V4L2_PIX_FMT_YUVX32,	32, 8,  "YUVX32 (32-bit YUVX 8-8-8-8)", 0, 1, 2 },
 	{ V4L2_PIX_FMT_YUV411P,	12, 8,  "YUV411P (12 YUV 4:1:1 planar)", 0, 0, 1 },
 	{ V4L2_PIX_FMT_YUV420,	12, 8,  "YUV420P (12 YUV 4:2:0 planar)", 0, 0, 1 },
 	{ V4L2_PIX_FMT_YVU420,	12, 8,  "YVU420P (12 YVU 4:2:2 planar)", 0, 1, 0 },
@@ -267,7 +269,9 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_AYUV32:
 	case V4L2_PIX_FMT_XYUV32:
 	case V4L2_PIX_FMT_VUYA32:
-	case V4L2_PIX_FMT_VUYX32:		/* Packed YUV 4:4:4 */
+	case V4L2_PIX_FMT_VUYX32:
+	case V4L2_PIX_FMT_YUVA32:
+	case V4L2_PIX_FMT_YUVX32:	/* Packed YUV 4:4:4 */
 		y_pos = info->y_pos;
 		cb_pos = info->cb_pos;
 		cr_pos = info->cr_pos;
-- 
Regards,

Laurent Pinchart


