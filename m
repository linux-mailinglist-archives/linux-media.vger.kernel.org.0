Return-Path: <linux-media+bounces-35289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F265AE04CD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBF184A3590
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7861242D96;
	Thu, 19 Jun 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hmdn/zH7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8B25525F
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334349; cv=none; b=le18cQbE0VQoipuwVtFQUEEc24L+jiXO/vQ0/dmGH6IeiSA4LA/SmxcZ8o00zVpdJtTu3Megp1Trtpb/XSIL3erXi+/F78SqKBFV5MGITVzNZsNQj9ilJI03IPl3SKQqH4SpbUBDAkknKgqtxUcR+GiWx1HZEZWGkcLKLN1o0ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334349; c=relaxed/simple;
	bh=wQ44mxgs1oQOtZNg7ygk78fbBD/eqMk8lIBUZq091Os=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bd2jlCpsPAv+G7okQzHYH0vFLjNGFeaOoBDg5OFStBu1qJbjPWkCq7C2k4nugmIFZlLYXU9iWstWLHoR9fPhorE+TxJojL6JfjzuhGYWXTgmruCuWJTh5SlhxGP+ugHN0XQAxnuG2tS7EUemCZUTMPgB3uEfSRoZLfGfeDwW5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hmdn/zH7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334348; x=1781870348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wQ44mxgs1oQOtZNg7ygk78fbBD/eqMk8lIBUZq091Os=;
  b=Hmdn/zH77VnZ9A/3w/PAvyorcyVRjKsBicpAi5LSGQP6hUd/ntfGflDz
   SnEgEHD1YdkGdHne6CQmPtiKTyjOqh4YeyiPx4f4fAx+8DU+KHHFYSIyd
   G1JQVF8LXney/xwVnPJMUN5CrwKeqIcXXnJ5TaprNclmgziub7FzYuwiR
   hmDqd0lP7m2oNsz1HXJxpsjP28cooNEQc0uo4Otm/T5BsgyKhZtouyImQ
   fz4CQ6rTNBsBPvnIK9cTlcoDv+UUmt4mJFjSNxRzVEH76crkiM6JVaKbM
   xx44QxmFRcm2OjXpOw42BEiaUjodQ/81je1wN1mNVElohQEL+2EFd0RM7
   g==;
X-CSE-ConnectionGUID: BweaEZxwS72mS4czndAOwQ==
X-CSE-MsgGUID: +N77T60MSCetyiVR2sCQHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386396"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:04 -0700
X-CSE-ConnectionGUID: 0l7bVlOsS0S3UKdS3Yz4Uw==
X-CSE-MsgGUID: F8FlYKbKSeCehwpsjmmhvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908286"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E2227120F45;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AJ6-2t;
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
Subject: [PATCH v10 19/64] media: v4l: uapi: Add a control for color pattern flipping effect
Date: Thu, 19 Jun 2025 14:57:51 +0300
Message-Id: <20250619115836.1946016-20-sakari.ailus@linux.intel.com>
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

Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
flipping results in a change in the sensor's color pattern, separately
horizontally and vertically. The information is essential for raw formats
when using generic raw mbus codes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
 include/uapi/linux/v4l2-controls.h                     |  5 +++++
 3 files changed, 17 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index b19aaaffbce0..43a62a85afb8 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -131,3 +131,13 @@ Image Source Control IDs
       - Raw Bayer, with alternating lines beginning with green, blue pixels and
         red, green pixels.
       - 3
+
+``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
+    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
+    V4L2_CID_VFLIP) have an effect on the pixel order of the output color
+    pattern. Macros ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
+    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
+    either horizontal or vertical bit is set, the readout pattern order is that
+    of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
+    ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
+    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8119012c2638..9ec65998a8f7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1156,6 +1156,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
+	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1484,6 +1485,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
 	case V4L2_CID_CONFIG_MODEL:
+	case V4L2_CID_COLOR_PATTERN_FLIP:
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 09e5d5bbe7f8..740bf8544446 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1227,6 +1227,11 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_COLOR_PATTERN_BGGR			2U
 #define V4L2_COLOR_PATTERN_GBRG			3U
 
+#define V4L2_CID_COLOR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_COLOR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
+#define V4L2_COLOR_PATTERN_FLIP_VERTICAL	(1U << 1)
+#define V4L2_COLOR_PATTERN_FLIP_BOTH \
+	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
 
 /* Image processing controls */
 
-- 
2.39.5


