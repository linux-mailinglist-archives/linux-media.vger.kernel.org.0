Return-Path: <linux-media+bounces-40978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD06B33C0B
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E5BE7B3629
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FD02E03EF;
	Mon, 25 Aug 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HS0Pkzsi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC92DECA3
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115516; cv=none; b=iQhes6IT9k0UyfNh5aEAeDXBWg/rmyyMJbhmzrj+PVFvnh6Q+l0JfQ1oetJCsiDnn/xYMA/DglEviqI/jl1/mZtiZO8clXA+QOCOv3yF2dfAXC5yqWPe/0BGpIuwlbOaFF9rRmgPwc+xybduWCWTqVkWCB9fOWaxKiT5owmV1yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115516; c=relaxed/simple;
	bh=Dcw6T50xd9aMwTYXk/ySzk62vvSo6rhRQm1wY+odupc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNkCq5rAYn7/OubI46kCZwtbTDQfsNFcBmxZuHWe667fZyWn2Pj9MujLWPVI8lgoy79mi3g92M1bj3KJ9Ou06oBhd+WER06t4bQ3oI7cOata6TJORrlcf0ubFJ5PoHK/PVn7XaxK70ugoqZPvahfZvjO+QjmQLK3+0/CYVx2i1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HS0Pkzsi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115516; x=1787651516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dcw6T50xd9aMwTYXk/ySzk62vvSo6rhRQm1wY+odupc=;
  b=HS0PkzsiMqtQUDfTRIpjqjyTAoA5GhneuYOOhEnz7OVCPhlJWA8Hc20j
   bNXoV5nZewMj/JdwjCnoODuSSJeznmv2lK6OnDN3KBjFTqXVj2NtJdN7m
   JzuPLCmO8W2+VqlXmb+y/OFNz7LbZhPNBQOv5P00bErDrqYbOr5+e+vM1
   N+IwpByUdoLy9413KLxpj90EW625hu7cn66Y4vcAN8dSFf25Z5vD88gN7
   PiV8xjoT+iSh1i7yi55On5qiYceor/da0v/TeaN82NJhxpuNjq20hgXvQ
   AhPG5Xc/UOTEDcnNzltndhuETc02hC9qkBKv9+zTHg4W6L0Lc51gteg+B
   w==;
X-CSE-ConnectionGUID: Xi/kCRX/SAKnSMU5qDJkvg==
X-CSE-MsgGUID: tp6bxHzjRkuyPqBh8OvOxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032307"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:46 -0700
X-CSE-ConnectionGUID: mdSED/MjTRmJkhnkSwWRLw==
X-CSE-MsgGUID: Q8PLImdqSu6uH1UJO9suuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431095"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D0710122001;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ahE-3O1J;
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
Subject: [PATCH v11 50/66] media: ov2740: Add support for G_SELECTION IOCTL
Date: Mon, 25 Aug 2025 12:50:51 +0300
Message-ID: <20250825095107.1332313-51-sakari.ailus@linux.intel.com>
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
2.47.2


