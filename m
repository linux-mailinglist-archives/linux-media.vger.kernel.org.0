Return-Path: <linux-media+bounces-35313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E0FAE04CF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 634F918978E0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FB125B1CF;
	Thu, 19 Jun 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mk7T/5tp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477FB25A32C
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334364; cv=none; b=PeJQbCwrvbbUzFglpwf70Qn04gscDFA1BDvWW1DohHlR6hMYwzGT5Qee7R9NsQPCPwgW/yjV/l5hC4MKVnAawv7FN3lrQsdeqWG2ZLhgMqhcxuaqmyyitBFYF0oc+iVpt4kaRYDlFyUwbxIjBJebloU4YfRxDzXfgCr0WFUGXjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334364; c=relaxed/simple;
	bh=5OYUvWhOv0sy1erUTugtFvfm5MLAQyRQDD8AlH4Npc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IzqFTJyvhefS2Rt6lHNGB+jJUUyvgGRwCbR65Mod0yTwDgY2J82LMdoc8fVoGo6IjzhflHjvoWQqW9WWnib446T5RBhjrqHVS/bdAMwlbSPOXUBOtUXl5JnY466yYWCrFbTKaG+sd7akmXtFzG4lUTkOBBtGlNLbplr6A96OJVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mk7T/5tp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334363; x=1781870363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5OYUvWhOv0sy1erUTugtFvfm5MLAQyRQDD8AlH4Npc8=;
  b=Mk7T/5tpJB0uHFnsgzvBIcnJdKYuB03CMJ/9p2FEMHFTa8OIcvXSRALB
   WQf4dQRSF4FC/Qc+/6MWFx7aXx/zyEMFTxT5AGrizYPsGrRTg2B+aeiyI
   W+AOMzrRMF0cNyrTpuB5/ByjU72GxohFVpnJPIqXqk//ySt/RaRhkWRy/
   kU8iVkD4ed3U5j4gaopBU/fzM5s3V/kqGbNgeHbaOMan7FvVdrtFlXGX9
   d28azMI77Hm104tkLRkqHDojDjVYACAbdry0HfEo7vLXR1bT/qVNx20zQ
   w+8rFLWQdpIVvOhbCA9RH0ziK2ZiwaZhwKibWS1r12rQfWH44TPKYXJcK
   A==;
X-CSE-ConnectionGUID: kgt+jNXVRCmHzXbCqq4pxQ==
X-CSE-MsgGUID: 3YZcrlWLTxacphma6QfvQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386760"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386760"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
X-CSE-ConnectionGUID: OH3Rn/O7THGRuK4BxEWB0g==
X-CSE-MsgGUID: rP+DDjVIQbu2qJvw/iqJdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908461"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 54D3D123267;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALc-12;
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
Subject: [PATCH v10 50/64] media: ov2740: Add support for G_SELECTION IOCTL
Date: Thu, 19 Jun 2025 14:58:22 +0300
Message-Id: <20250619115836.1946016-51-sakari.ailus@linux.intel.com>
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

Add support for the G_SELECTION IOCTL in the ov2740 driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 00319eacf89e..2480813113cb 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -24,6 +24,11 @@
 #define OV2740_DATA_LANES		2
 #define OV2740_RGB_DEPTH		10
 
+#define OV2740_DUMMY_LINES_PRE		8U
+#define OV2740_DUMMY_LINES_POST		8U
+#define OV2740_ACTIVE_WIDTH		1932U
+#define OV2740_ACTIVE_HEIGHT		1092U
+
 #define OV2740_REG_CHIP_ID		0x300a
 #define OV2740_CHIP_ID			0x2740
 
@@ -1155,6 +1160,35 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 				   fmt->pad, fmt->stream);
 }
 
+static int ov2740_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	if (sel->stream != OV2740_STREAM_PIXEL ||
+	    sel->pad != OV2740_PAD_SOURCE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV2740_ACTIVE_WIDTH;
+		sel->r.height = OV2740_DUMMY_LINES_PRE + OV2740_ACTIVE_HEIGHT +
+			OV2740_DUMMY_LINES_POST;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV2740_DUMMY_LINES_PRE;
+		sel->r.left = 0;
+		sel->r.width = OV2740_ACTIVE_WIDTH;
+		sel->r.height = OV2740_ACTIVE_HEIGHT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1268,6 +1302,7 @@ static const struct v4l2_subdev_video_ops ov2740_video_ops = {
 static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov2740_set_format,
+	.get_selection = ov2740_get_selection,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
 	.enable_streams = ov2740_enable_streams,
-- 
2.39.5


