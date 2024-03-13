Return-Path: <linux-media+bounces-7015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7585E87AA96
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 16:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 317202853E3
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 15:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757BD47796;
	Wed, 13 Mar 2024 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E4krB9Xo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FCE47779
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710344504; cv=none; b=KF6+vwNhuRyG28zQLQiLQaa2LSwBbEUgjTI7UOtfn3gdnOSeLZIoj4WjWwdCgaFeWQIiT4ZotS3jKhR6R+azAiQpNSST9z4/+m67NKT2t62nCLfnXKaBLBYl48IGPEa1iN24c4t/qDWUcv/hwV8AUvbchUvxlu8zEl89mB6/OLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710344504; c=relaxed/simple;
	bh=JcFymxVd1zOAcMVV1096V9HoWaXsq3b6ZFeQXIEh6xY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhR1nE+EJjCBkyjimRveyWZIskDLfDQWzOs8Q3NhaDKCXgmE7BTz3PSkztWTtEJrj2Ww+jA4MAjXIK8KGQLbjc1ONXwXLnRcqllmfrnvPp1d2ROYHHLDK5pf5Zg7dek/Lg7wZr56N9mgzRQ+LnhCdEOflcxb5eGKStzx6qowkns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E4krB9Xo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0968DA8F;
	Wed, 13 Mar 2024 16:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710344479;
	bh=JcFymxVd1zOAcMVV1096V9HoWaXsq3b6ZFeQXIEh6xY=;
	h=From:To:Cc:Subject:Date:From;
	b=E4krB9XoBRzq4r86lSgt8PrFc18M855lf80vqJI1jtZjewTkc04T2IXCMtSQYwmmi
	 jvEtMR8B7QjFBOy2xD4U8hlBSiPHQ4j2O7e8zK7j6eAaHxSstXgoDnO9df6yMiCN8t
	 hXPhrr+JCWbaG6bdlGERdQ7fU8DGijtv1QLdrX84=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	Dan Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] media: v4l2-common: Add Y210 and Y216 format info
Date: Wed, 13 Mar 2024 16:41:27 +0100
Message-ID: <20240313154128.75089-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the formats description in videodev2.h Y210, Y212 and Y216
are YCbCr packed formats. For each Y2xx format, xx bits of valid data
occupy the MSBs of the 16 bit components, and 16-xx bits of zero padding
occupy the LSBs.

The Y210 and Y216 formats are missing an entry in the v4l2_format_info[]
table. Add it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 273d83de2a87..adb82d8f5a31 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -263,7 +263,9 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_YVYU,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_UYVY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_VYUY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_Y210,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
--
2.44.0


