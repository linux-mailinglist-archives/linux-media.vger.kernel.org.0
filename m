Return-Path: <linux-media+bounces-10232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C581F8B3BA6
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 17:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0300B1C23A69
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 15:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1645614901F;
	Fri, 26 Apr 2024 15:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MRnjVJql"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C1148854
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 15:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145615; cv=none; b=X+n47rEqP+UZ4920Em9g+OBxD9MEq+xJzzXsdSjRDcUi+v7RmI0ufZLL8z0E39YcEOUPhMLPKkrrurUOnLsnpkAFYE8LSoZekzJwj+sJVc5jOAYzHaO3bXva52McwnGS2Y9jfyB90FyY0mfS03zpv+wsrtcvNsRlrHuEkOYp6ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145615; c=relaxed/simple;
	bh=g3TtjgLkYlygqyNCwe8Gl6ON/BKmy/yXjDCndIobHQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYIM0UwXJjvF2ZcRTrbbPf4u6y7pBBI0Yjde7Hk42+l04JmpIU2ERhwZs+kQGto7yPPJ6JX/91kQXF+lFtBSSmm8KGrTweU7wS1H0mXqHj6MxmkvvHhGEifNb0NOC4DVHpYzi01hR8NlBFHftd2IXLqHUD9L2lXVhTRybDyY9Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MRnjVJql; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7753E2B3;
	Fri, 26 Apr 2024 17:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714145553;
	bh=g3TtjgLkYlygqyNCwe8Gl6ON/BKmy/yXjDCndIobHQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MRnjVJqlKaZ3yqSqKMXBzpOfEQe5Q0xEHee1rLc9qbH/COVHYBeJ3Yj2TQ3cdH0So
	 RVoPlMtiIjBn4X7nozqraSwwXj0TDvQc+j/xRIGiARLLCj0/1ybo+VTd+PYQMYOVDj
	 e2HgggS3pWeoYcDJ7t2TcuWwXOf/JEBZpr856ySY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Ng Khai Wen <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH] media: uapi: v4l: Don't expose generic metadata formats to userspace
Date: Fri, 26 Apr 2024 18:33:19 +0300
Message-ID: <20240426153319.26872-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic metadata pixel formats (V4L2_META_FMT_GENERIC_*) are meant
to be used in conjunction with device-specific media bus codes. Those
codes are work in progress and not available in the upstream kernel yet.
To make sure the generic metadata pixel formats won't be used by
userspace until we have the full infrastructure in place, keep their
definition private to the kernel for now.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch can be squashed with "[PATCH v3 05/14] media: uapi: v4l: Add
generic 8-bit metadata format definitions" or kept separate.
---
 include/uapi/linux/videodev2.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f74aca14044f..1c0bb4f9ecac 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -842,6 +842,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+#ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
  * adding new ones!
@@ -853,6 +854,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+#endif
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe

base-commit: 5a6272f644afa3db2f00e77ff8b0ea9df51ea875
-- 
Regards,

Laurent Pinchart


