Return-Path: <linux-media+bounces-40931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 990BAB33BD3
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5091B2662C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195C22D4B6D;
	Mon, 25 Aug 2025 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7/ONk8X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67152D46DB
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115485; cv=none; b=T3YjLq1gfecHQ0uHuuUFYLlgc2/1tpAMtVf1IWkZkWepJOv9FyOlwHnz5/DbCVII6q0ZbgS8e8uSef67o4eC7HKc46UBfnCIAG4VGVXKeZjkZuwRnSClWLB+OwFW7B20/R3NXtOXjUiGvP7EkJ71ccDSvpnWxY38DGZEeTV5oWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115485; c=relaxed/simple;
	bh=/RmmH0yT7/5iQ0HDUuVbe/Ei+gflOATp9Q7tRRD3zNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlQ38sbFbvjnHFgfJ3L5AljqIWLdjueqf905ylMP5ZhCFpLXDaNEvGKpiBzLCZRdJP7BbVdRiXaMjVbsPQS+FXVSmmZv1VBk0gBqwH3n39Ec5aoWugAzMdEEiXc8BPyg3vNSGZm+QhiycPNoy/sMCGM4UEcpq/TxilSnI5idals=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7/ONk8X; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115484; x=1787651484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/RmmH0yT7/5iQ0HDUuVbe/Ei+gflOATp9Q7tRRD3zNc=;
  b=J7/ONk8Xo8sWtFNI4WUZYqhMvstQRcYce57tNXPKFsjNI1fGR6wwLmuB
   xhPzNea+5gJT4hygwYkvNflL/+2dtxt0G7IUDoV9bkg1gSChgYWZW34y/
   F4YUS5Ws9rbMyIdmKCtXCgISlhqRtEeRikp+tP5eTM+e+qUU4rEbR1C1P
   p2qAKCb0SSf1Wi10XhTX/2Cu9EbFO2JDpsU49gUsFlj4SxiaJ+kcUb9DC
   LFvnSDn6hlPpU6kAcDmeSKRNW1R9n2bPUpYvL9lk3VDtmnjE5gsP2Do2Z
   51OF+itDjNI241KDc68ZUxJ1MbB7/ZLwHYmMuGmnbFajpSqAn23ocA4st
   g==;
X-CSE-ConnectionGUID: VRAvWF+eQZSJ71Ij8yUVvA==
X-CSE-MsgGUID: CswHrPNoSI2qO1dpSEbKLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695766"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:18 -0700
X-CSE-ConnectionGUID: GT6sSiokTe6KK7QQK4xVww==
X-CSE-MsgGUID: H2Gp+GjpQTquUyNPsj8wWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195366"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 10EE91203CE;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005adI-00ou;
	Mon, 25 Aug 2025 12:51:08 +0300
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
Subject: [PATCH v11 01/66] media: Documentation: Clean up figure titles
Date: Mon, 25 Aug 2025 12:50:02 +0300
Message-ID: <20250825095107.1332313-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
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
2.47.2


