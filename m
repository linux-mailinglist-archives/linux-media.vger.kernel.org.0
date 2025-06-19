Return-Path: <linux-media+bounces-35270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C6AE04C7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B3995A380B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E78C2405FD;
	Thu, 19 Jun 2025 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNXOtZsa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E0253931
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334334; cv=none; b=H7JV3PK9w0gaDC3wzunWxGlU53wYKj9yGqo4CM5fYBiadTgOkXO6CyC+nfKR8CUZXtzaQfVPqHlwu9zydGB3gcZi5rh9Oy6gRYms9QesQ4IKd/IbybSzcyA2hhxuJLfYPC7Vx6+VCvcIfit2hsCgg7qR/iPKc0anbXU4ceNLl2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334334; c=relaxed/simple;
	bh=Ql0Ar48fUr7s0LCXkUXgc9qzdow56mxGEk8MaYQDmgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A3nq3AmeVgaHLafCnyVplQIY9g0oQSmZLl58ywfQsSOnMx4nflsM1UvK1R2NPZXTZBd0eTHySZHDYIBoDYnep6dw1yUBYNEONCSFIOipcTC3D68vKbX9EQ4Ei0PTCS+ISwj9Tw9RGoN32dtgpMuanRxO9rs+VRCd0A3qCQ2m42c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNXOtZsa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334334; x=1781870334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ql0Ar48fUr7s0LCXkUXgc9qzdow56mxGEk8MaYQDmgo=;
  b=MNXOtZsa2qor6BtErh6cM5O2Bl3bXlmDI+R6NNkTKlsDi8owgkGeixmx
   Ymam9yg035lNNcajFx54aMdXbsFlWCq5L15usXQDzsnwJFAyiItWhn+Tk
   m6kD4+V28OEg7Ry8gcLPx6mNcN6CJT3gQsXui5aAvtPKPjIMwVOT1yDWl
   fj1g7sxv4dBv1G6ElG1lJjt70rrU+Z/PU8O3pIJv17yU7bFRRrZYu+oos
   jmfTBrt8TYlPU81qyzgLSLj5etuQj871zU+o3kgui9RKzzWxafRlF1EqB
   XqlHOSe3cF1jGoVcjsG70Xbqu+vDal//Oka1Ch0pVP2f4rhAYzH9ffzN9
   A==;
X-CSE-ConnectionGUID: 1eC0/qJnRrehy6p6mIoPeQ==
X-CSE-MsgGUID: UKS+AhlYT72AbYkA0YRHQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014781"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:47 -0700
X-CSE-ConnectionGUID: Zdbb5XggTSuy7TJgYDP2Kw==
X-CSE-MsgGUID: FTxb9s02SqqnaoSOotf31g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192137"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A91CB1203A5;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AHn-28;
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
Subject: [PATCH v10 03/64] media: Documentation: Clean up figure titles
Date: Thu, 19 Jun 2025 14:57:35 +0300
Message-Id: <20250619115836.1946016-4-sakari.ailus@linux.intel.com>
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

Remove DocBook (?) conversion leftovers from figure titles, including
obsolete numbering and highlighting. This aligns these titles with others.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-raw-vbi.rst    | 6 +++---
 Documentation/userspace-api/media/v4l/dev-subdev.rst     | 6 +++---
 Documentation/userspace-api/media/v4l/subdev-formats.rst | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
index 2bec20d87928..1f7bb8fd15e7 100644
--- a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
@@ -221,7 +221,7 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
     :alt:   vbi_hsync.svg
     :align: center
 
-    **Figure 4.1. Line synchronization**
+    Line synchronization
 
 .. _vbi-525:
 
@@ -229,7 +229,7 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
     :alt:   vbi_525.svg
     :align: center
 
-    **Figure 4.2. ITU-R 525 line numbering (M/NTSC and M/PAL)**
+    ITU-R 525 line numbering (M/NTSC and M/PAL)
 
 .. _vbi-625:
 
@@ -237,7 +237,7 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
     :alt:   vbi_625.svg
     :align: center
 
-    **Figure 4.3. ITU-R 625 line numbering**
+    ITU-R 625 line numbering
 
 Remember the VBI image format depends on the selected video standard,
 therefore the application must choose a new standard or query the
diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 225a45fef994..24a69c419dfe 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -459,7 +459,7 @@ selection will refer to the sink pad format dimensions instead.
     :alt:   subdev-image-processing-crop.svg
     :align: center
 
-    **Figure 4.5. Image processing in subdevs: simple crop example**
+    Image processing in subdevs: simple crop example
 
 In the above example, the subdev supports cropping on its sink pad. To
 configure it, the user sets the media bus format on the subdev's sink
@@ -476,7 +476,7 @@ pad.
     :alt:   subdev-image-processing-scaling-multi-source.svg
     :align: center
 
-    **Figure 4.6. Image processing in subdevs: scaling with multiple sources**
+    Image processing in subdevs: scaling with multiple sources
 
 In this example, the subdev is capable of first cropping, then scaling
 and finally cropping for two source pads individually from the resulting
@@ -492,7 +492,7 @@ an area at location specified by the source crop rectangle from it.
     :alt:    subdev-image-processing-full.svg
     :align:  center
 
-    **Figure 4.7. Image processing in subdevs: scaling and composition with multiple sinks and sources**
+    Image processing in subdevs: scaling and composition with multiple sinks and sources
 
 The subdev driver supports two sink pads and two source pads. The images
 from both of the sink pads are individually cropped, then scaled and
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 2a94371448dc..9ef1bc22ad9c 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2631,7 +2631,7 @@ be named ``MEDIA_BUS_FMT_SRGGB10_2X8_PADHI_LE``.
     :alt:    bayer.svg
     :align:  center
 
-    **Figure 4.8 Bayer Patterns**
+    Bayer Patterns
 
 The following table lists existing packed Bayer formats. The data
 organization is given as an example for the first pixel only.
-- 
2.39.5


