Return-Path: <linux-media+bounces-10131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FE8B2AB2
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 203751F220ED
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E73155757;
	Thu, 25 Apr 2024 21:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6IAnWf8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0052155A57
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080454; cv=none; b=k1/lSO38NNcI2ZIUowwZ2rZ98gst6rD0taFvJjFjk404aF6GKkl++BCRk7Ra0vmHa0YA86N9eOYPQJCyG4m3F7IVkBeLhcVFQd3h2LzLaF4mFzW+KXFKujLOi2gnswhyBthj0wOQiuhpx2tpO4Sk7uDPYch4bWFURwK0CHdbUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080454; c=relaxed/simple;
	bh=4k+HZWL35942Ca8VTVz4rxPnzMzOqQshonyH4ZE7dW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m5Y4M/EiH5Z66e8GGvZOpL1vS1mKF3Wh+uFQzZyV8akc8s53vNxgBM64VPqcOZNexTzSjYrWoCAS0FMNU1D3VDhTdNw0kZ6OVwF835NXcRwCkEthWQWL6MP9LffDQrgM2odWGHD0LmY2OwxH4MEyooCrhHvK2hKHMTdpS9Nzjgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6IAnWf8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080453; x=1745616453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4k+HZWL35942Ca8VTVz4rxPnzMzOqQshonyH4ZE7dW0=;
  b=k6IAnWf87RAE0G/oP3wdLnVd1kupklCw1hy1QoF44/TnjVGQJKVJMEtw
   cJgc/XnWfuJXGGmZi+XyZKN7zYXXiYpT7u7y6JbIhZ3/v2tHtBCwVZAFY
   bcuHfRjel+I0+h1oet6BsQxkDHyVWUICusmD9wILbs68L6LSQ94yql8ZN
   qblprZlJTmrGrMD+G+2Clmpqu9AQM1qt1I0iuvGeer7YafjdX1h+ARilX
   AfLvuiEo/2VEIaq8HDERUB3rfvVvprufjvHIMyTN1fI6PKXX89ZtFyJm7
   s/8NCfP//4+gVOteUmFqEgIV0FXH55x3CjEAzByMkRPa9zK3ZYuNlkp0Y
   w==;
X-CSE-ConnectionGUID: b/W9jquQTHC3hSPCI/IVYw==
X-CSE-MsgGUID: 8sxnFanARraiGfaSn/Y8lA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10016694"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10016694"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:31 -0700
X-CSE-ConnectionGUID: x2J9yeazRb+rPaXC8U0dDg==
X-CSE-MsgGUID: gTRbsu+YS0SNdEegV79Iwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25620918"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D408A1203E8;
	Fri, 26 Apr 2024 00:27:24 +0300 (EEST)
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
Subject: [PATCH v2 07/14] media: v4l: Set line based metadata flag in V4L2 core
Date: Fri, 26 Apr 2024 00:27:04 +0300
Message-Id: <20240425212711.928300-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
References: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
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


