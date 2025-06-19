Return-Path: <linux-media+bounces-35285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04918AE04B5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 223D87A93DA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCF3255E4E;
	Thu, 19 Jun 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vp3B9G8k"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C702550AF
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334347; cv=none; b=HekL4J+MxXEMbzRh0GE0B9nwOohlmZlGQTUVPnQFv+fZEg62kOMQpLhiCfbBubzW84iumjm3aRmJip0d8VV58cc/O5Mw05Iq72ZOt8TprJ3HUtPwVA+9Qj4aE2mL8D3nW/16KlbtvGTXn7XhuBI1Io/x5qUVlCcqH6JqgSj0BS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334347; c=relaxed/simple;
	bh=4B34YzZ95h/41o2CE+Zf5uwZLURDiSCQwAxCF1LyazU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p7NIKg/3K/naHuSjRa6UKcP+M06OIIRy1eHVyjd4kC8C8a1fyl1+EFIN94A4qdfqWfGInnb0AWbJD5fLQFpH/Z2H1i8NKvO7bj3RJzwRu1f9v61s3S/7185hPjrOcWHYaECgX1eJhSl0cdmf1+2mBMXYVyY1Y98y1OeeHtaXH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vp3B9G8k; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334346; x=1781870346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4B34YzZ95h/41o2CE+Zf5uwZLURDiSCQwAxCF1LyazU=;
  b=Vp3B9G8kV2YVDL0tAkKL7XLoA2tD9at9YB5+nQ4Op0mjJH0khPI+Fvn7
   DxogwwiU5AJdGzqPdxXm9kogAf9P2OugmJxnROShsqPSaA0b0eGKU6LwI
   rVx7mUTuJCvw3cSpyIzSFPEdluuGtRkGrKXjeDN2OYIppQ9tE1Ma3u+yY
   pFK/dFmWV8OwnvHG5c43ilf7C2pSSsXvbZa/BGLdx3bXRBB7eLAdI/6gy
   ubcp9u+/2XzDoK0PQI1ONdqFif/4pqPNHszM4zU60dPibbjvNl3YmyCGm
   14rIdUYCu39LdRWkV2rRWmiRU8jY6c43DHd3VbVoz5MzZr/oLCA3LYJ6n
   w==;
X-CSE-ConnectionGUID: riPFbAotQ0CBgU0XBnsODA==
X-CSE-MsgGUID: zktojkBvSWukX6pZAgA62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386368"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:03 -0700
X-CSE-ConnectionGUID: t/yW4IbvQJuN1UeFlXTaZw==
X-CSE-MsgGUID: +kRzPVMKQQ+JzyDVMJ3YTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908279"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E42951211BE;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AJB-2w;
	Thu, 19 Jun 2025 14:58:36 +0300
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
Subject: [PATCH v10 20/64] media: Documentation: Document raw mbus codes and CFA for cameras
Date: Thu, 19 Jun 2025 14:57:52 +0300
Message-Id: <20250619115836.1946016-21-sakari.ailus@linux.intel.com>
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

Document the use of raw mbus codes for camera sensors and how the
V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP controls are used
to convey the color filter array pattern on UAPI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
 .../media/v4l/ext-ctrls-image-source.rst            |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 919a50e8b9d9..9f68d24dfe0b 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -37,6 +37,19 @@ format set on a source pad at the end of the device's internal pipeline.
 
 Most sensor drivers are implemented this way.
 
+V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For raw image data originating from camera sensors, specific :ref:`raw mbus
+codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
+<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
+raw formats. The ``V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>``
+control in the same sub-device defines the native color pattern of the
+device. Flipping may further affect the readout pattern as indicated by the
+``V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>``
+control. Further on, cropping also has an effect on the pattern if cropped
+amount is not divisible by the size of the pattern, horizontally and vertically.
+
 Frame interval configuration
 ----------------------------
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 43a62a85afb8..3cb7ee1b0aed 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -93,6 +93,8 @@ Image Source Control IDs
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
 
+.. _image-source-control-color-pattern:
+
 ``V4L2_CID_COLOR_PATTERN (integer)``
     This control determines the color components and native pixel order in the
     sensor's CFA (Color Filter Array) when used in conjunction with
@@ -132,6 +134,8 @@ Image Source Control IDs
         red, green pixels.
       - 3
 
+.. _image-source-control-color-pattern-flip:
+
 ``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
     Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
     V4L2_CID_VFLIP) have an effect on the pixel order of the output color
-- 
2.39.5


