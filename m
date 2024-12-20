Return-Path: <linux-media+bounces-23896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91A9F931E
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0012169721
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8E5216384;
	Fri, 20 Dec 2024 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itNlfKMs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D0215F7E
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701107; cv=none; b=Co/GWbTzM38G8Ud7WVFBuuz3n3lil0UgFS2j1OII7oBV1SF8eSpM5C8OFwNfotHJLpVCovbybpVVux4Ue35xePAzEcEkGNYHqUT5T5NPe1OHjYgl2hVE8dzbkwLW7Rqm2D5Tv4d/1BKjl9iZUh+04D67ixsGGS2iVl/4C1pplok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701107; c=relaxed/simple;
	bh=APCMTulVGvl/4oU3GCTZx2R+6M3HjalCZobgdjNcH2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eQNar1P/xX9Yxb6otFf4zamSAqBZNluEfoXEPXhu4vV4Yb7yT75mYkfWE+jqGbd3xGC5Qk0zZ6w63s7h1vl2G0hG/To2AXA/kedPKoUbCXSGfjOGmAhqTOJKjwo+akWVAPu0vcUWNls+uIHxBDZaHjtp4S1AgphejquREnFhaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itNlfKMs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734701106; x=1766237106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=APCMTulVGvl/4oU3GCTZx2R+6M3HjalCZobgdjNcH2g=;
  b=itNlfKMsuEDhOq7oXqtNtibV7BpgpegCc0/QTPhh8G10G9aySpva4MOX
   mPr4zwRZ+O58y8h0/qIKqyFNfB53S0Ax58oVEYfrM1gxYuU2bwZZcn02n
   B1WRZbARe9mUV4t9DbBh/mt/Q2MlI193GYOpTAPiX79+SE6ugQIt/4xtW
   TNe4z+5NdcgM9SF07Fm0L0XQyOhpMrjiPZmIudznq4XdRfqg412a+ox9Q
   pQmKHSK8375QZXzIeFegxtwdi+IQ2nAaju3R29ydhz/JULSj8B43U7hY5
   AndXiz9olvDeADRL0uJXQWWx7JFcy+3kAHh68HbGeTsrbbz5yUbT5hKzM
   g==;
X-CSE-ConnectionGUID: rou9pJEyT+WUypIdJe1z8w==
X-CSE-MsgGUID: wMDnfltgSMe99C5BdaUEFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45937679"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45937679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:25:06 -0800
X-CSE-ConnectionGUID: A+iEhH4YTaCw1TI9T4YXfA==
X-CSE-MsgGUID: Vuq7adqdTdylIbYkOAsTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103132536"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:25:00 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D164711FADB;
	Fri, 20 Dec 2024 15:24:54 +0200 (EET)
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
Subject: [RFC v4 9/9] media: Documentation: Add binning and sub-sampling controls
Date: Fri, 20 Dec 2024 15:24:19 +0200
Message-Id: <20241220132419.1027206-10-sakari.ailus@linux.intel.com>
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

Document the binning and scaling controls (V4L2_CID_BINNING and
V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index f15e5495cc34..84957dc62800 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -113,8 +113,12 @@ separately horizontally and vertically.
 
 Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
 rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
-1/0. The driver implementation determines how to configure binning and
-sub-sampling to achieve the desired size.
+1/0. It depends on the driver which of these operations are being used to
+achieve the resulting size. Binning and sub-sampling are also directly
+configured using :ref:`V4L2_CID_BINNING_FACTORS
+<v4l2-cid-camera-sensor-binning>` and :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>` controls on
+drivers that support them.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
@@ -173,9 +177,15 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - \-
       - X
       - Binning and sub-sampling. This rectangle is relative to the
-        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
-        combination of binning and sub-sampling is configured using this
-        selection target.
+        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binning is
+        configured using the :ref:`V4L2_CID_BINNING_FACTORS
+        <v4l2-cid-camera-sensor-binning>` control and sub-sampling is configured
+        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+        V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`
+        controls on drivers that support these controls. To configure binning
+        and sub-sampling on drivers that do not support these controls, the
+        selection rectangle may be changed directly to configure the combined
+        effect on the image size.
     * - 2/0
       - Format
       - X
-- 
2.39.5


