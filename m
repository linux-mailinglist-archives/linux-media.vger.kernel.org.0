Return-Path: <linux-media+bounces-25548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2BA2553F
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 584C13A2470
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA21207DE9;
	Mon,  3 Feb 2025 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bShQlJ9+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872EE1FCCFB
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573193; cv=none; b=PGFndHN3I0TW1xe4s51fTRtYVXdKlll9yxRYPOck7D/R+fqVYU2vyle5cEV+nvMzNsWjAAlfCoV5pO8kpiAzOV2iAp2TFC7DdcOojmDICkOVT6sCWTjYyRg84hbbuY5TubTGLh8znC83Vj7c0k96ZuofIPW4qpFIbFyg9cuMOf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573193; c=relaxed/simple;
	bh=KCrj/XECXXQT6k1H85UI83DYiKvw++6bblnG4i6p5e8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLsY9+3AxZo1VE0thOVzavNqjrVSRFo1w1HNn47Q3Li9noaIYSrpxztZRZoL0iLHnbaG46vLhABC7FqKEOEJ19UeZ1GxY+Z+NPOuVd/iWZT/rctah47eaH8CrrPe0XKRK7F0jQYMSPt31lWGza0Jd+7oCJFDKEBS3daiyjfV+d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bShQlJ9+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573192; x=1770109192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KCrj/XECXXQT6k1H85UI83DYiKvw++6bblnG4i6p5e8=;
  b=bShQlJ9+H98Qa98F+ApT7AKi6nq0Y4ceEtZTitgE0wLU8wJq9SknuUun
   hL9ufiOHoJFvjJTgpedDurHrvQOfiv/zPkML46ZdPOsCNcnHddGgptEyp
   ZdpNcHQZOIdEtnxV/xExxReQlzYFirn/p2m3gc03GY0Qrtu23cFeGv3+M
   yVnQZNDoT9fU4W0KAvQaWr2Y9JNQQJulm3+O5GAjBCwVkaeAglOKNcjPW
   jSjB+pgGrMmu8OIxmo3yCJpViepoGL7UCDR7oIyMBKBT9AmCnlUkj4YCu
   O5iD5rpxsHDHB+NrodWPVlmeqbyCmrw09Jio3zoJpTQoSBJccmiGh+0ju
   A==;
X-CSE-ConnectionGUID: olnGke0xSKaPB2anNxODMQ==
X-CSE-MsgGUID: lvvF9dW6SC+6VIb43N8eLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39211581"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39211581"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:51 -0800
X-CSE-ConnectionGUID: iaCnPqAVQvCgjRU1Ggfbxw==
X-CSE-MsgGUID: yTtW/sJoSFuUdrCT9v4qLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="109988798"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:44 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D21A71204F2;
	Mon,  3 Feb 2025 10:59:37 +0200 (EET)
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [RFC v5 11/15] media: Documentation: Document luma-only mbus codes and CFA for cameras
Date: Mon,  3 Feb 2025 10:58:49 +0200
Message-Id: <20250203085853.1361401-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the use of luma-only mbus codes for camera sensors and how the
V4L2_CID_COLOUR_PATTERN and V4L2_CID_COLOUR_PATTERN_FLIP controls are used
to convey the colour filter array pattern on UAPI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
 .../media/v4l/ext-ctrls-image-source.rst            |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 5bc4c79d230c..91e5305458b9 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -41,6 +41,19 @@ format set on a source pad at the end of the device's internal pipeline.
 
 Most sensor drivers are implemented this way.
 
+V4L2_CID_COLOUR_PATTERN, luma-only mbus formats, flipping and cropping
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For raw image data originating from camera sensors, :ref:`luma-only mbus codes
+MEDIA_BUS_FMT_Yx_1Xx (where 'x' is the bit depth) <v4l2-mbus-pixelcode-yuv8>`
+are used as Colour Filter Array (CFA) agnostic raw formats. The
+``V4L2_CID_COLOUR_PATTERN <image-source-control-colour-pattern>`` control in the
+same sub-device defines the native colour pattern of the device. Flipping may
+further affect the readout pattern as indicated by the
+``V4L2_CID_COLOUR_PATTERN_FLIP <image-source-control-colour-pattern-flip>``
+control. Further on, cropping also has an effect on the pattern if cropped
+amount is not divisible by the size of the pattern, horizontally and vertically.
+
 Frame interval configuration
 ----------------------------
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index ecfa38c118e3..4b98a740236a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -93,6 +93,8 @@ Image Source Control IDs
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
 
+.. _image-source-control-colour-pattern:
+
 ``V4L2_CID_COLOUR_PATTERN (integer)``
     This control determines the colour components and pixel order in the
     sensor's CFA (Colour Filter Array) when used in conjunction with
@@ -103,6 +105,8 @@ Image Source Control IDs
 
     This is a read-only control.
 
+.. _image-source-control-colour-pattern-flip:
+
 ``V4L2_CID_COLOUR_PATTERN_FLIP (bitmask)``
     Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
     V4L2_CID_VFLIP) have an effect on the pixel order of the output colour
-- 
2.39.5


