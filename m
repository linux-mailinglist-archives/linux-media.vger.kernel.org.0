Return-Path: <linux-media+bounces-35308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124CAE04EC
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B70A3B49B6
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA589246332;
	Thu, 19 Jun 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtDviPX6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5434258CD4
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334361; cv=none; b=qXYgaGNsvKxNH1576M9jScDQjaYaltZvbrgReVPaczU3ZekxyyS9xSvZEtYmvGpDD4tuJI075ljWBGHMj5LBhKIFxUg2EJGcnm9bUciq0V1Byqfsj62H++IcBAPH18DX8v1XsBamWqtYsIJYSDXA3T2eP8NZ/fwtjkIL2VXEUf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334361; c=relaxed/simple;
	bh=fRkDx4eTai4PkK9MuSyNeW21rJtNNFLuWqEp0wC3tXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pVOW5QzZCqxuwFWVxFLMq8Kp0c7zBoRCmu4y7Bb26Um+iORr/sPNklC1PRKqT+HHtIqQw4xt3d0NOxCD0khD8jkkebY5bL/XpVpz7eou8s7gJKzccnQ+IXZLGgmdBGOF1sCwaMngKjyFEzlA5fxO4gmtKPvWx9ez67zEA6bEeak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtDviPX6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334360; x=1781870360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fRkDx4eTai4PkK9MuSyNeW21rJtNNFLuWqEp0wC3tXk=;
  b=UtDviPX6tYerndd8W7JVD/pJOsK9YIWjuTIViARJws6EUfwkhOy3moLR
   up4wRIEdyBarn9BpSZ7udM1squeo6Z71LIvD9LMMZkxYyPE0jfg+nbf8k
   2yQJpuKvJvGcgOHl/I6zoqNnh2kVT1XX+uWV+ERujXqQg2SrKHu0izacP
   oFUZw2hRpqlfntkRmlSC8GCrcK6csPDtBHW/Kqjp5b+XDdeQlX/Fjb3re
   jfIDf+v99cgWXFy+yw+M6VEi8pbUvamw9ujLy/hOTH+1dQTOAUQOcgTEF
   wGuGYnx8nXeJv+1pJURRBM1nBeQ/1v3ggXVEjUPHYmCdR45NRYyswVwQE
   w==;
X-CSE-ConnectionGUID: q+cLNdPiT6mVD7m5O/Rz2w==
X-CSE-MsgGUID: gflUGso0RXaWbUzVcxs3pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386663"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386663"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: YDDGDbpAQYeVDG2uLdGBGg==
X-CSE-MsgGUID: 2hEbGdnYSEOPZbl7kSEDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908436"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 43AA8123243;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALC-0o;
	Thu, 19 Jun 2025 14:58:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 45/64] media: Documentation: Add binning and sub-sampling controls
Date: Thu, 19 Jun 2025 14:58:17 +0300
Message-Id: <20250619115836.1946016-46-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index ee59bf3c5761..c1c9c9b8bc14 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -134,8 +134,12 @@ separately horizontally and vertically.
 
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
@@ -194,9 +198,15 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
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


