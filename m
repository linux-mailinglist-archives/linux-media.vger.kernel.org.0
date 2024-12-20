Return-Path: <linux-media+bounces-23892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767A9F932C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E50231890257
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531AE215F56;
	Fri, 20 Dec 2024 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mstwKA6P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0A6215F5D
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701092; cv=none; b=I0vUO0v0bJCUKX4NBJPvxoczsbb2sm1ButgjH83NYJMHF78toMJO8z/pzJoBcaaHW5JIhFn4i6N+5E4OUIqG5ivvaehhTKRWVf9ICF7n1vuvLjbTEnDSxXlLHjBdeWMjNpWxUhABcgw9I5qqqT6PW8FiDT4GC8ETY2TdD5mTWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701092; c=relaxed/simple;
	bh=EqS8HsotZO5ElRikzcpalqye+HQyEZNIAk/pAvJ7Qb8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mCgKNadhQTEpOPJIGGWc30kL0UsfobGOBbzrcVSZpBrMcmmUdUaLuJkW4cOX2DKwwIX/7hxc6HWef49K69/LL9GudARg5ekTbjhbe+sSG9CuA/AAxEqBixTXf6sIHt/UhuOjQdlznEngzhIRx3Qcl+pdKT3gNicl9TCfB+JJ//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mstwKA6P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734701091; x=1766237091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EqS8HsotZO5ElRikzcpalqye+HQyEZNIAk/pAvJ7Qb8=;
  b=mstwKA6Pmox4z31LNu/UVbIZd+WdkVlAO7UukZ2Zre085MsglZCxpJSh
   QZbGAU7d9uQNrBdPUbaJR+kfz+A3NK//7FbAZFNxq3z9382DjBjzfcS9k
   F1itC0TDnRL4un14e1K0XsOop23N9yFtj9kwrjB7KEwqbG826G6ld/Gm2
   Ib3MoOyS46j6iYBaGwEFBBsYznrt4wxNV8gioM2cb79X4n2z5zDTrpdUC
   D8dyu9uCPGLsscWcBm8kl8Z7C+U51JyG1sWGylhlWFKzrEInxg9oLqrh/
   6E7S5NYEfYFNPVp1LfXr0R0rcykDqTlyQ0F8XveAId0r849Yp//9WB2jX
   w==;
X-CSE-ConnectionGUID: GNwkHudCQPuBiGj43COLmg==
X-CSE-MsgGUID: 1sk2vSKyTnq6LoeOdqYf/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45937612"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45937612"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:51 -0800
X-CSE-ConnectionGUID: jj7oxGHJSi26vORCbE1Qrg==
X-CSE-MsgGUID: iq2NlmfPRK+ugVmfPb8GVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98333276"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:44 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2FEEC11FADB;
	Fri, 20 Dec 2024 15:24:39 +0200 (EET)
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
Subject: [RFC v4 5/9] media: Documentation: Add scaling and post-scaler crop for common raw
Date: Fri, 20 Dec 2024 15:24:15 +0200
Message-Id: <20241220132419.1027206-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
References: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
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
 .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index b0bd09772ceb..f15e5495cc34 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -118,11 +118,18 @@ sub-sampling to achieve the desired size.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
-0/0. The resulting image size is further output by the sensor.
+0/0.
+
+The scaling operation is performed after the digital crop. It is configured by
+setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
+relative to the digital crop.
 
 The sensor's output mbus code is configured by setting the format on the (pad,
-stream) pair 0/0. When setting the format, always use the same width and height
-as for the digital crop setting.
+stream) pair 0/0. The width and height fields are used to configure post-scaler
+digital crop if supported by the driver, affecting the right and bottom edges of
+the frame. If post-scaler digital crop is not supported, the width and height
+fields of the format will match the compose rectangle sizes applied on the same
+0/0 (pad, stream) pair.
 
 Drivers may only support some of even none of these configurations, in which
 case they do not expose the corresponding selection rectangles. If any selection
@@ -180,12 +187,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
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


