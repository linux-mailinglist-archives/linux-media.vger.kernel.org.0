Return-Path: <linux-media+bounces-35305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D49AE04C3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E679018933CC
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7372459EA;
	Thu, 19 Jun 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPTmXQp9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F5C2580CA
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334358; cv=none; b=COoJC8eRCN4i6QrHWfpzQxQtvpKNxVaCxu0ciCw3OmQy+kx4m9zrOospK1l2Y060BxMOl7vWeKD4hKb6mPDMgEMlNlUsth9fQgzLlnd4U7FaiX9C5EBa+R+LbgxZ8UfAAsiIKi+GHpj5bTh4j+6NYrRBEqTK+uyAZX9b4qpvmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334358; c=relaxed/simple;
	bh=kNUbbG4hbHMVqgU5K4fG/sDdAN+pLQlB28Gty54ZUCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LKSlyGAQ7EYi1lqg8WhLRO4H/Gl6A+4YxF+W7Wy6jmYNzEqm/6Kvd0fjHi+J0HOnuw3yp6BJy1FkFJAvUKbJ0rmTDD7wT5zg1zO/vnKX2rR4CfjRoNNWzOxbBVI0UyUnSZMqHhr9/25qE+Q3gtJgEtjOnJaqnowbU6/sE5OtwTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPTmXQp9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334357; x=1781870357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kNUbbG4hbHMVqgU5K4fG/sDdAN+pLQlB28Gty54ZUCs=;
  b=WPTmXQp9SZy0XzRpZ3vk7WllDpqzW07HdAbSvD1Hyf+acbXdTC6wLNLp
   qpRQ7fwyK0S5oWRZuKRRtDt+J3NGKhN1O2SNv3p9toZGf2gbYrKD+c0LL
   pf/024TfGotxcM/2hsorWuisTWX2wK6az9NDoOqWb3OYxJWlGL09mIVMr
   qxwyV+YIq1V/ytFIA/hnJwFaGL90d0MADfrJaNkp9xUy33YpTKbcFmekK
   XjMiEkqNPqBcHx/YxXjpTIRVfAPkItNm0eyZkS867YxzpDaBvQkLQbmaX
   Ht+LuEUEoajECwCjZanSoFXmhpytv0h7LrhJ+p+xkVwnwpih5er/fuIql
   w==;
X-CSE-ConnectionGUID: OD9QfRDmQa6UI7hZoEYykw==
X-CSE-MsgGUID: f9ct6/kMRBGknVD24IAm/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386640"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: XAlDdU0IRheDy8aJFNNEoA==
X-CSE-MsgGUID: NvlHHF9fQCSeAamBkIYyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908433"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2C4C6123105;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AKd-0V;
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
Subject: [PATCH v10 38/64] media: uapi: Correct generic CSI-2 metadata format 4cc
Date: Thu, 19 Jun 2025 14:58:10 +0300
Message-Id: <20250619115836.1946016-39-sakari.ailus@linux.intel.com>
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

Rework the pixelformat 4cc for CSI-2 generic metadata. This can be done as
no driver uses this yet and the interface is disabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/metafmt-generic.rst      |  2 +-
 include/uapi/linux/videodev2.h                       | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index e8824b5a65d6..e0d675d1ec07 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 ********************************************************************************************************************************************************************************************************************************************************************************
-V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
+V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MECA'), V4L2_META_FMT_GENERIC_CSI2_12 ('MECC'), V4L2_META_FMT_GENERIC_CSI2_14 ('MECE'), V4L2_META_FMT_GENERIC_CSI2_16 ('MECG'), V4L2_META_FMT_GENERIC_CSI2_20 ('MECK'), V4L2_META_FMT_GENERIC_CSI2_24 ('MECO')
 ********************************************************************************************************************************************************************************************************************************************************************************
 
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 855cbe2a97d8..6f0dacd69ab3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,12 +893,12 @@ struct v4l2_pix_format {
  * adding new ones!
  */
 #define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'E', 'C', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'E', 'C', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'E', 'C', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'E', 'C', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'E', 'C', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
 #endif
 
 /* priv field value to indicates that subsequent fields are valid. */
-- 
2.39.5


