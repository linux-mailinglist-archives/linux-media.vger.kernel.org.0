Return-Path: <linux-media+bounces-22309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D489DC1B3
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8F26163272
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4522E183CB8;
	Fri, 29 Nov 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IH2RWSLJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10317277F
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873939; cv=none; b=HaU92TSr14MBj1/dWtwhbIAERdQjNql6tIwPZIEKYS2QjpuBeEE+0LcOirpAOk05Qz5d5sXRZn1hpH+blVVLpEbM11BMB4LQjOMtmPYMJHRsZL+2MDADBzvRNIBlPVGjjQE5my2DahemDW7cHtzI9Q4Cho4Mys6WXCcf7sU6xwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873939; c=relaxed/simple;
	bh=571ZZ1Rv2rs58i7iBTpAjHpfZQVENNk6sFmRsz1EPQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V1uiT+x9pmpKbz2l5HDF63fg6fl+MhtyTue+cVFQsCkSzGRPv9MXAbrWlrO5v++jKKL+j4Aip227guBhz9FnSZOTWvlRFpC93FkcYDS0ZIKut96zwXkM/PN5irpqJWkIbngqdmmiblm5OJI+32HmD0nObKVa13auQDG+b6BvUUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IH2RWSLJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732873939; x=1764409939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=571ZZ1Rv2rs58i7iBTpAjHpfZQVENNk6sFmRsz1EPQU=;
  b=IH2RWSLJxVy4ItldvXliqMTBB5/ABahVA3wd3rTnAl2o5uYtu6/5GMO6
   g6YRgUMMxD9vr/0Yvg4R0lKOmE87kQgHfuRJbDX2pJlYhF/0svg3zUsNs
   o+WAOHBYmsU7i/Gj9f5QHv37vnBDwcw3d4DZKRYOHVXOEYh/sYJ46nuvj
   5D3FTmK9hw4VZXc3zdNKio0PtVaoT6/qfr1UsekwIKzap+ZpXWG+hWv0B
   lmbjhui5vC3v/93d17qVE2FS+uaeeGo7aeOfqTdzz+uCKHs6IyroH27pH
   9mDo2jP/C4PsuRABe91XwfN0XnP8pMBYc2YlNURYKuDpVvRGm5qlXJPzH
   w==;
X-CSE-ConnectionGUID: 6W+JfhWCRvCqiAjt2XJVqw==
X-CSE-MsgGUID: FUqg4YcITPeQqxSts0vmMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36776016"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="36776016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:17 -0800
X-CSE-ConnectionGUID: FO0HtmaTSG2POyDrGZ7nhQ==
X-CSE-MsgGUID: EJySxsKVTyyB87iLGE3aZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92258559"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:11 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 485F211FADB;
	Fri, 29 Nov 2024 11:52:05 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [RFC v3 5/9] media: Documentation: Add scaling and post-scaler crop for common raw
Date: Fri, 29 Nov 2024 11:51:38 +0200
Message-Id: <20241129095142.87196-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document scaling and post-scaler digital crop operations for the common
raw sensor model.
Signedg-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/subdev-config-model.rst         | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 4ddf98e3143c..1ae20800f34b 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -119,9 +119,13 @@ The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
 0/0. The resulting image size is further output by the sensor.
 
+The digital scaling operation is performed after the digital crop. It is
+configured by setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair
+0/0, relative to the digital crop.
+
 The sensor's output mbus code is configured by setting the format on the (pad,
-stream) pair 0/0. When setting the format, always use the same width and height
-as for the digital crop setting.
+stream) pair 0/0. The width and height fields are used to configure post-scaler
+digital crop, affecting the right side and the bottom of the frame.
 
 Drivers may only support some of even none of these configurations, in which
 case they do not expose the corresponding selection rectangles. If any selection
@@ -179,12 +183,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - X
       - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 1/0.
+    * - 0/0
+      - ``V4L2_SEL_TGT_COMPOSE``
+      - \-
+      - X
+      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
+        rectangle on (pad, stream) pair 0/0.
     * - 0/0
       - Format
       - X
       - X
-      - Image data source format. Always assign the width and height fields of
-        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
+      - Image data source format and post-scaler crop. The width and height
+        fields of the format, used to configure post-scaler crop on the right
+        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 0/0. The media bus code reflects the
         pixel data output of the sensor.
     * - 0/1
-- 
2.39.5


