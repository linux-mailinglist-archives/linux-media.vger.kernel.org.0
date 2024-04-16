Return-Path: <linux-media+bounces-9554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8528A74D7
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD1E81C220BF
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE161384BE;
	Tue, 16 Apr 2024 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GT4xbDpv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81D132801
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296012; cv=none; b=U05trlPXIP06s9Q8V9km79X1RSyfLRsNw8xVoy5BdFb5+Mvsg5/b/pYzdWBohtjNqgoz55fqBXWZ9bNqohPJLZMkIN9L2aAGLMNZL6gI3onsaGPQDHL9ZWcupSR2VekLl9h18yAJ2eh5glUVozGDeS0/4a12amaa1aTRZzxJwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296012; c=relaxed/simple;
	bh=r3x723Snzkjpcuach5hQ4+R9JXBfiUgeKKTHkL+GnYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mrN6qtyfPrI0ZFTLzfbjhcJ8x1tk0QCRRVRjLbmVzZ4zZiVNq/CW1m+oOOZ+Sccs+hu6/DAk/fQV0JtG8qNkfyo773kptA3yMm3sK73yxurK+aAtWO6aC6D9Gy+pT3c81uSnLDBemPblyLMvhp1LhvgVFqMgycaAsuxncbwfNlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GT4xbDpv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296011; x=1744832011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r3x723Snzkjpcuach5hQ4+R9JXBfiUgeKKTHkL+GnYU=;
  b=GT4xbDpv/KB6uMswfmpqg5jqTpFVIYvr5FSTmRv28E3n78VRzE9WVjnl
   mvt0r6lfuYNy60hH22Axd7LTIuHgIztsJ24nO//ANK50Lymz9dzFBkkBM
   iEch8To0RXyOCgd+1zt/sA9K2DjK20Hh2rj0hqlbv33PJs2r9emYu6gDf
   CWNx6xTcyDJUAGSP5I1Ux1cJHASof7PBrv1MnXMpxUOLXhlmLHWQSuGkG
   p0qIR4Wgd0YhwhAVKxtu3amRS4F6Gry9djKXc240Su0IDgVQfaZbkfETE
   /fOiXJ8raK4UxACofSNYdvmt76q3560ECd7g7VPTNpZrkM1WTZcq7QszN
   A==;
X-CSE-ConnectionGUID: jEGv5fETQD2rl/kIoT5xiw==
X-CSE-MsgGUID: tVn4uukVSOOxvcy/d/xsSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8621183"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8621183"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:29 -0700
X-CSE-ConnectionGUID: GYdDlD/HToibATcMtmxeqw==
X-CSE-MsgGUID: AItxn6U+SwSwZNggO74Ykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22430681"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:27 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DAEF41204F9;
	Tue, 16 Apr 2024 22:33:23 +0300 (EEST)
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
Subject: [PATCH v9 02/46] media: v4l2-subdev: Clearly document that the crop API won't be extended
Date: Tue, 16 Apr 2024 22:32:35 +0300
Message-Id: <20240416193319.778192-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The V4L2 subdev crop API has been marked as obsolete, deprecated by the
selection API. Despite this, it has recently been extended with streams
support. In hindsight this was a mistake. Make sure it doesn't happen
again by clearly documenting that no new extensions will be accepted.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-crop.rst        | 6 +++---
 include/uapi/linux/v4l2-subdev.h                            | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
index 92d933631fda..88a748103a71 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
@@ -37,9 +37,9 @@ Description
 
 .. note::
 
-    This is an :ref:`obsolete` interface and may be removed
-    in the future. It is superseded by
-    :ref:`the selection API <VIDIOC_SUBDEV_G_SELECTION>`.
+    This is an :ref:`obsolete` interface and may be removed in the future. It is
+    superseded by :ref:`the selection API <VIDIOC_SUBDEV_G_SELECTION>`. No new
+    extensions to the :c:type:`v4l2_subdev_crop` structure will be accepted.
 
 To retrieve the current crop rectangle applications set the ``pad``
 field of a struct :c:type:`v4l2_subdev_crop` to the
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 7048c51581c6..81a24bd38003 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -50,6 +50,10 @@ struct v4l2_subdev_format {
  * @rect: pad crop rectangle boundaries
  * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
+ *
+ * The subdev crop API is an obsolete interface and may be removed in the
+ * future. It is superseded by the selection API. No new extensions to this
+ * structure will be accepted.
  */
 struct v4l2_subdev_crop {
 	__u32 which;
-- 
2.39.2


