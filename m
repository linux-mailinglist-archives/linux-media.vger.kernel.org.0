Return-Path: <linux-media+bounces-10176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C38B3346
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49F61B20C2B
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EC913CFA6;
	Fri, 26 Apr 2024 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQh1y42M"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609AA82491
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121447; cv=none; b=LjtYQ6Q45ZOaDnQfbXaOkObUzbeszdx5EvGJCHxrfJLSZfSkc3TrUGeWBO3T4TWg3Vf5DGCEFvIu1QFxpYPm52s0Wfav7ZBI4FrYGt92ezj3LdbbfGz+vvne0Zjcf+FXreoN1WDVGyGjLE5UGdtgTJnmMfK1f51bY2FFKSJ7/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121447; c=relaxed/simple;
	bh=r3x723Snzkjpcuach5hQ4+R9JXBfiUgeKKTHkL+GnYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SekZbrXhU/LIxtK1O8CHtGuHwbxrUHs85qJxg8/g7yI5MhvbiGClOb3tu4BmSgKee1WthXXt8EiPrwXme5Mm5xrohe9Q6bNzS7Q0kML1jJAxc2fbFsLER0GpJB/rxry+Pxh1Q+6VCx3lr1JKN4letpKU/QMthtXszoP2K7b8EBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQh1y42M; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121447; x=1745657447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r3x723Snzkjpcuach5hQ4+R9JXBfiUgeKKTHkL+GnYU=;
  b=dQh1y42M4U2W8pkD+zlUKFmhqov80ZyUJ728tETD820xyglM1MY5pRO3
   Pp64/nYEeCrzLki+tuVsSzArZvox4JyprlmMdh8LXmsKHoBHFOJrZg/iP
   JLvc8M6Zc/ZXSbCN1v0ZvwaUlVOMYEAHDnTvEHkj8OEV2IQ97B/wNN6rA
   pu1mEyHwsogS0TqYoOBLbt86c/dpA/MU7VO2h6XeFEEYI4KN0f9Z9ZlQ0
   ZYp/qh3qgpH1zOUW/sRa6Yl/2v14mJTTCDqvSd+T2JWnVdyZUkq4eZqza
   Q1It6aZQvSHobBxSxpc8EMahx+iZnf6LhO2JgPW5qDg5dr//3AlBUNo/4
   g==;
X-CSE-ConnectionGUID: XTMMwV6rSbStjjcre9g3dg==
X-CSE-MsgGUID: 6z/EqTw2SlGCx6Dc22Y+jQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683782"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:46 -0700
X-CSE-ConnectionGUID: mK1QCFjHRWuz0SDn1nCGQw==
X-CSE-MsgGUID: Qtt/IdHMS7KG0G+dcnLlfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598497"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:43 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DE1B11FA8A;
	Fri, 26 Apr 2024 11:50:39 +0300 (EEST)
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
Subject: [PATCH v3 01/14] media: v4l2-subdev: Clearly document that the crop API won't be extended
Date: Fri, 26 Apr 2024 11:50:25 +0300
Message-Id: <20240426085038.943733-2-sakari.ailus@linux.intel.com>
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


