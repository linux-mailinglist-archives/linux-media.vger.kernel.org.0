Return-Path: <linux-media+bounces-10013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763D8B093F
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D85E8289216
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB7915ADA8;
	Wed, 24 Apr 2024 12:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgQ1Cl2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63115B0E9
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961384; cv=none; b=d5CPEUOdBa+KrKWb8O2g/IcdzMQrS8GeXQBe7iuEHpO3gj0DAEs8NkenWJR9OVLTXbgmz0vCS0fKUWMkZwwA1H4n1l5kle0sPI2Gl7Xrm6by1db8Dh692qEJgiI5eNQjjPhn9nDBjvGq4MB77gG08OXHhb4x6d/lR8UzIOLe518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961384; c=relaxed/simple;
	bh=ZQCbfKN55JcIz/vTtNu7XLEZYGzhUwHZwpm7zYSIaUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FIHD8tkp/MsUAHjXXDtiRlXahP2SgHL/pTAEEfsYVD0LGMx07XGb2vgd0ac5L+5g0R0VnvNH1LlLF9fuxUoRe1ae2TL1EVHow5kJndb4hQszTFKAby30ghs1ikUUoy/8YaRNa3byeY2fOas2AO8gIEUreh4tVqK2k9Zora1YvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgQ1Cl2Y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961383; x=1745497383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZQCbfKN55JcIz/vTtNu7XLEZYGzhUwHZwpm7zYSIaUs=;
  b=bgQ1Cl2Y3wG501ZMbPJ+j4JyyqFljXfLOQojBVfKCigRDA0WovTxbg4v
   LuqUDvwKTRdQNun8oDs+HsEs31lrmeffNMhZ5li8Qu50hrrp8WoRWdIHY
   2whuc21kMi3DQAb4ZGw9U21+uIv1iksLkYCC14QX0YLmZOLCuusYPVXWa
   2dv7e39IqCrbBAvEcq4b8lG7SFSV4/A9OwLjyuCMmRo0vMRRFXIneyLIJ
   IrkckGtZ4mIGz1U4YAvmmUfsm78mzgvYL2pF7oXPvZaUOlMzmIoj5VWXO
   8kaS3PwziSyHCm/HG3ZciptRaJkTJz6GoDgbJ9G6fnrfLdBPxMbu+XLft
   Q==;
X-CSE-ConnectionGUID: aB2zpa0ZSxmvsUnRmeJ/5g==
X-CSE-MsgGUID: V6vOjElbT7Wk0l/ZANHozA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9809635"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9809635"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:57 -0700
X-CSE-ConnectionGUID: IdTfA1AbRrKETSZHrjTMqw==
X-CSE-MsgGUID: lHQrjU52TOK8h+H/fah5Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29512828"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:55 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A9DFA11FB50;
	Wed, 24 Apr 2024 15:22:50 +0300 (EEST)
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
Subject: [PATCH 07/14] media: v4l: Set line based metadata flag in V4L2 core
Date: Wed, 24 Apr 2024 15:22:30 +0300
Message-Id: <20240424122237.875000-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
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


