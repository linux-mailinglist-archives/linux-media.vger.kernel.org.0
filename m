Return-Path: <linux-media+bounces-35287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88966AE04B8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 650361897CE1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77B5255F5E;
	Thu, 19 Jun 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShDHhDsr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC55A25523C
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334348; cv=none; b=qlj5M/SCwrIcNFPiy6lWhjQErOiky196Wh6bjDK19TlSfgjlnnkKuo85g2S6uWWQLTSRxUMbtRYcPA/jwOIbwxsOuN45eXttWY/bZDvL0k56+ts7YwbHvXwzSzV9Tf82h5ba/vdChiJgw+pWJPjrB/huNH/wMZUyyewCra3KkYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334348; c=relaxed/simple;
	bh=8oNh7DH3+an4XOVyqX0t2Me/NbZ26XiEWrHL+x/0vCU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PPhFIbDnsP3R7ABEgpALZGKVS2KsU/QA+UJxUSd8WjZr/EVNFDQ16YLEnNUYpcPKhOxbXXKSZznF28aSEn5G8eDbU0dZ6i/Vot+dEUD1c2skp4EfN73IiPAMeAe5a//JJAj9mptxg3etwrhFruuQcvFhqkboxjAmayFJjfKuMTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShDHhDsr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334347; x=1781870347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8oNh7DH3+an4XOVyqX0t2Me/NbZ26XiEWrHL+x/0vCU=;
  b=ShDHhDsrnqqwUnmWRXFMuYrdL1EgNedIxX+Qgx2zh6BOu2C7fewtwYKS
   FONRdrc5tvqTLrVop1xUrD8Hrd2e3tN2ky24pj1NObl2Gk3Ug9lmhRSla
   bShKFHKuZcsHMoazsT4GqLByPbPCv1zOREtWQVqzjiOciMuAE53BgW1oW
   IFoYQ9V3rjYT9YvB8iEdIrEycZKbTLyVRyPx6nBMOnfDuRRLLTm1Y09BH
   7/Uf+AhuvrqJfOXpUR6E29tF6hbESsWFP1RG10rrQuZTgVxc6av5ydi8n
   snOeK/inZ7lr9g6yLb3sgea3Y/2HRuGLpvBvyLYr0V2O1TfNHlOqXRdOs
   w==;
X-CSE-ConnectionGUID: sI2SCihQQhWKzlcAFFVZpw==
X-CSE-MsgGUID: P6HO5Dg5RP+4C2rTc0qfag==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386385"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:04 -0700
X-CSE-ConnectionGUID: sI7h+KCJRLWeJnCpuqqU1g==
X-CSE-MsgGUID: mEMe8xtUQl++5dPtSFpsYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908283"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E7C781211D5;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AJG-2z;
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
Subject: [PATCH v10 21/64] media: uapi: Add V4L2_CID_METADATA_LAYOUT control
Date: Thu, 19 Jun 2025 14:57:53 +0300
Message-Id: <20250619115836.1946016-22-sakari.ailus@linux.intel.com>
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

The metadata layout control defines the layout of the metadata on the bus.
It is used on sub-devices that use generic metadata mbus codes on at least
on one of the pads.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
 include/uapi/linux/v4l2-controls.h                          | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 3cb7ee1b0aed..64c0f9ff5b1b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -145,3 +145,9 @@ Image Source Control IDs
     of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
     ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
     ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
+
+``V4L2_CID_METADATA_LAYOUT (integer)``
+    The metadata layout control defines the on-bus metadata layout for metadata
+    streams. The control is used in conjunction with :ref:`generic metadata
+    formats <media-bus-format-generic-meta>` formats to specify the layout of the
+    data.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 9ec65998a8f7..a7ea380de5ee 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
 	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
+	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 740bf8544446..bb8b0b174a43 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1233,6 +1233,8 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_COLOR_PATTERN_FLIP_BOTH \
 	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
 
+#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
+
 /* Image processing controls */
 
 #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
-- 
2.39.5


