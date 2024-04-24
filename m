Return-Path: <linux-media+bounces-10007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246868B0933
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B155B25035
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F2215B0ED;
	Wed, 24 Apr 2024 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiAkCoN2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D143215ADA1
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961368; cv=none; b=IbTuueXey4GM+I/XwJsQDv+n9JdwGGFhE8RBE+BY+hxApeO3RCMGb+7ttqmz8s5yXu6RDrL8tlqedhOuPMBoJ65q4bn2LPJG7g7yB0k4b4l7x/TRVlrPyFrJLolhDqs0PD1ME0/wA3QpGyTMl5hosJaJdBoYEykAhrabJQvGsA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961368; c=relaxed/simple;
	bh=r3x723Snzkjpcuach5hQ4+R9JXBfiUgeKKTHkL+GnYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vAmMMU8QnUpBIVjeXQjQuWfqGuVd6gJLofcaLlxEqc76pfvL8vRx/NdnbWDlONZ2239qFXcYUQaobNYcIoK75yJ+0tW1JuAostKELo6/xF92BFVFYkUhudy8qfsN5XLrZjZiH4bQNcbLU7d8c1xYaWXdHBRGEn6PJFzR531+ak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiAkCoN2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961366; x=1745497366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r3x723Snzkjpcuach5hQ4+R9JXBfiUgeKKTHkL+GnYU=;
  b=fiAkCoN2tX3bDorslk0Fkzzd9jGGqT5R3GEUTr6NRXGOpcXq0Ia8HJYD
   eDTZ+3x4QcgM2MyCb8q6c/fkVHubahJ0A+ThqAy1RZzSi0YjecorwwFXG
   7DDqTVO9UWIqfGKtNK41gZf8U7H5jCW1BZBDeFZgjMGwwFqwQsgsXwWtV
   rwgJmk4V1IX6Kueon7tnw86Ld4rl+MaEEnXAVFApBY0yVYPMi5SVHsH5t
   Ol+QoB7ffQeD/23XOG3J2lowGAU4VraMxclmrfKp8pdtOobnq1iNmrK63
   7gtSbbfCPfmZGFEnBtJomhXXhIIq1Ap/NmY5UZgf1uJ8IkGTtenHKK1zb
   w==;
X-CSE-ConnectionGUID: huLvYMvgScqCfmV/SD9pLw==
X-CSE-MsgGUID: qk86WrnRSmOEcH2ouX1QFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="12522888"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="12522888"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:46 -0700
X-CSE-ConnectionGUID: sT8IMxJ0QHaoLH19TCV4lg==
X-CSE-MsgGUID: /DvV/8eGQIqXPRXWT5vcXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29348880"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:43 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 255CB11FA8A;
	Wed, 24 Apr 2024 15:22:38 +0300 (EEST)
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
Subject: [PATCH 01/14] media: v4l2-subdev: Clearly document that the crop API won't be extended
Date: Wed, 24 Apr 2024 15:22:24 +0300
Message-Id: <20240424122237.875000-2-sakari.ailus@linux.intel.com>
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


