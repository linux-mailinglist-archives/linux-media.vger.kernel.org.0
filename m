Return-Path: <linux-media+bounces-10181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BF8B334A
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E3CA1F229A8
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478F313D2B7;
	Fri, 26 Apr 2024 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBruTl/7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A113CF85
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121455; cv=none; b=bZThbbKoI/sJk0H7x+2eVRjERo2iNLB7yKpwTpEz3+QBTjLy3HGQ9B6RWTUM6bvpk1fh8ec5jcbCXhogVANHPiybr2xgBSLGUg1SIR/F4f9ZNlZ4MizIMmlkJEIsNh/fk+Kd584I7VPYmS6pcLx7/hV1hEuH1Xv8TCI4YRQCVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121455; c=relaxed/simple;
	bh=4k+HZWL35942Ca8VTVz4rxPnzMzOqQshonyH4ZE7dW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rxjsojJNcJyKQZgfiojLxZvrs9jQhwGmDgO33B+FS6HlxfzVdAsS5P+uhPQLu6AwyIOWCoSaqtxZHCQDFJ7+zyEI7MRzCphEs3/wGkSHxAo8ZM1NdfB2zYDQLKP/nyI/3G2UG9Dy4JlkXMUx2x+6RzkNpaUEMSf8T7JzlhCIwRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBruTl/7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121454; x=1745657454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4k+HZWL35942Ca8VTVz4rxPnzMzOqQshonyH4ZE7dW0=;
  b=MBruTl/7M0LIQHMhokJrx6qo6zgopz1wx2wuTdBTXWiYh+V1NlAyyPDW
   HBFdmPsk1FcObE+6FV9JbZCWcNK4jIXTehg6yN3i/v2fJpWIx2iauEB6G
   RqqpN1gqa/wpRkzyiOY4Ar6HDEY2pvksDrA8FMgcssyKFfMvr7t3483JA
   +/d+tPdnRPVIlJo5jN3Vz8u8gozGcYbanW33kh39n0VIGXpA93MnZa5G+
   5VAIZfVz1s5bkJTqX6KszBfcrsVJVe+zbdxVaJeCBEViHKxbQCw22MnOd
   f8lxG9g+9cU635sdg8nRa4BXsiy8rw/uL30A54fIISKaVOeh6Qdw2Hn3S
   A==;
X-CSE-ConnectionGUID: MTU0ZjAERWywneUUl1Bc/g==
X-CSE-MsgGUID: Sc2R1fAjSiq52hKomyXXCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683813"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:54 -0700
X-CSE-ConnectionGUID: hTY7hqdRSb6hWPPBFOeqlg==
X-CSE-MsgGUID: bjrRAbujQA2ECw7UVLc4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598517"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:51 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4F231120358;
	Fri, 26 Apr 2024 11:50:48 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 07/14] media: v4l: Set line based metadata flag in V4L2 core
Date: Fri, 26 Apr 2024 11:50:31 +0300
Message-Id: <20240426085038.943733-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set (and unset) the V4L2_FMT_FLAG_META_LINE_BASED flag in struct
v4l2_fmtdesc based on the format after returning the driver callback for
enumerating formats. This way the drivers don't need to care about the
flag.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 16 ++++++++++++++++
 include/uapi/linux/videodev2.h       |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2cfc9106857a..5e928e2a2beb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1538,6 +1538,22 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		}
 	}
 
+	if (fmt->type == V4L2_BUF_TYPE_META_CAPTURE) {
+		switch (fmt->pixelformat) {
+		case V4L2_META_FMT_GENERIC_8:
+		case V4L2_META_FMT_GENERIC_CSI2_10:
+		case V4L2_META_FMT_GENERIC_CSI2_12:
+		case V4L2_META_FMT_GENERIC_CSI2_14:
+		case V4L2_META_FMT_GENERIC_CSI2_16:
+		case V4L2_META_FMT_GENERIC_CSI2_20:
+		case V4L2_META_FMT_GENERIC_CSI2_24:
+			fmt->flags |= V4L2_FMT_FLAG_META_LINE_BASED;
+			break;
+		default:
+			fmt->flags &= ~V4L2_FMT_FLAG_META_LINE_BASED;
+		}
+	}
+
 	if (descr)
 		WARN_ON(strscpy(fmt->description, descr, sz) < 0);
 	fmt->flags |= flags;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 647ce3419bd8..d944db7ae1ed 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -839,6 +839,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/*
+ * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
+ * adding new ones!
+ */
 #define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
-- 
2.39.2


