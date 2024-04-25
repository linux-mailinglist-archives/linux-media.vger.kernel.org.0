Return-Path: <linux-media+bounces-10128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F57E8B2AAF
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F641F21868
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D978155A47;
	Thu, 25 Apr 2024 21:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhjfKLNh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8382155A26
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080449; cv=none; b=MkPd/HM9/VaAjP02XO2y9g4pkop+IVBh2ckzlzZ0OOvZUN+eTPBTYPYrG0r54xK2hoVsVsq/u3vDNpmj0lYpYEJiOS5RCNa5INTsYvtdIhFZVUiBXwcIpxLvpXh5cE77Sw8+wvbzf38tpixmXLcGFG3aX1uVcR6Qb1wWhs7/9TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080449; c=relaxed/simple;
	bh=r3x723Snzkjpcuach5hQ4+R9JXBfiUgeKKTHkL+GnYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cAKarCVgKgfexMir1xyjIevee/wo+IFu/qgenVingm4vGak/GlO7O+zgrXZsvQatAhNQ6IdxtGwjDPqedUyDhQlfWbpYmhZq0U/s9aKlDFqfb1su5YjoaxMTf79Yd04z4r/Lt79BDFakC0kqtzyazMmHLLCWd+1edzl2J8LNmwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhjfKLNh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080448; x=1745616448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r3x723Snzkjpcuach5hQ4+R9JXBfiUgeKKTHkL+GnYU=;
  b=fhjfKLNhdzWcNH3oJVyQjXrJ/hYup8dfxs+zXfLFGGJlqFOQqsEmfxgH
   Pp38/bRsF81joGDoXeQ4zojPo48RDPq5ZC3ZGfuYCs4CR5cPIaUtSGYl4
   ya5985e/a1clahLrTHEjLrRD7Z3J44k9xudzzshfSyNeJhFq0/OKtYLXC
   WSwe5W8/DREldS18CXV/SA+2JVZmwUNxJgn+YuqK21DuwjL6XHk5h9hdc
   8gasmkqFnYrqzLzU04RjlUecTsobyk55zpallQYuu3pVD3/CSUQt49IqU
   0yvrCtXqMDJSCJ452v87Zrt6PrgeXc2zKNxiFWmR4Tbpte18B+PpktQs9
   g==;
X-CSE-ConnectionGUID: T4N7u3IVR46B+shNqMaAFg==
X-CSE-MsgGUID: KYnQ9KWPS2SaLSk/8mTnLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20487671"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="20487671"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:20 -0700
X-CSE-ConnectionGUID: Aa6b5gHBQNmpspkKxLR1mw==
X-CSE-MsgGUID: 88YN9eHTTNiHh30kaZPmKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25305736"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:17 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ACF0512027E;
	Fri, 26 Apr 2024 00:27:13 +0300 (EEST)
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
Subject: [PATCH v2 01/14] media: v4l2-subdev: Clearly document that the crop API won't be extended
Date: Fri, 26 Apr 2024 00:26:58 +0300
Message-Id: <20240425212711.928300-2-sakari.ailus@linux.intel.com>
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


