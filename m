Return-Path: <linux-media+bounces-9595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E28A7501
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87F0B1F227A0
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EB913BC31;
	Tue, 16 Apr 2024 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha0eQ8AH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D07A13BC2D
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296070; cv=none; b=MmcCG9kChmfGULeYLbXTo1sKf51Ndepq7WmsMsfgOucwfetlIrffDeqMPsdqYCi/rwUGv6A4PUnz3VCo/SJkLkZ3f4aBEytAQiSPzXTZIQR3Wza46NSpgCj/kr+MEqxQSXiuIvejsQb8krYgs9phUC/rS2lqFT6j9rrW2khgy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296070; c=relaxed/simple;
	bh=Y4SoX55k2tCjXgIJI4q9ZqDANT+7BGkx+y55lDsG+Kw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bUY7H+SnWDUyVIdUDeoQ/JkCMDz4cYUfo0ouEszg58daMowgJWPc32d9LZAtlavBidw8yzoD6tdzg8AK+cKJssoc7eUVq9w7fI4ZmkZNOSySmJOzkU2KZi8SmsqtnIlpbizzLq+/Dc0aXxQ/qSIHPCgWYM5EhFa2AGiXDPYlEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha0eQ8AH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296069; x=1744832069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y4SoX55k2tCjXgIJI4q9ZqDANT+7BGkx+y55lDsG+Kw=;
  b=ha0eQ8AHQwNlqbJmrZ82eaZ2p+8HpSMxBLLKtS5EL7U/b4ebnImk3vr3
   M2/Ac5cL6WgWxZmcfvbRtiE3B2S8gFHdiWTYGDCP1EspJK6l+RxmVNlq8
   u1+XMH6mZVxy5DGxcpfE4gF2PvfkrviWpc94hk0b9Cxj4vDziE7xqVtj0
   HXvb2sqfA94w2r6OhVEVvZMEM/Glk1KJV+l1IoXmaALuPG9tNMT83tb0T
   8GD1VhHcxsWg8AYqzm4PwkHIo69baKllTUUXkgXyKZY3a7ocG7APAhyID
   UQoNFOMd3pB4nNl8gREFeMogr7xFyo3uQ1WljwDY/pPnCR5M433hQveiB
   g==;
X-CSE-ConnectionGUID: jVAIDGheR6KlDozrrjMY2g==
X-CSE-MsgGUID: QbL2bGm4SS6dSpHPdNnvhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929924"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929924"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:29 -0700
X-CSE-ConnectionGUID: jNNYtVvjQWC+5JHO1d0/GQ==
X-CSE-MsgGUID: HXYqBAa9SDqn3oFiZvmPeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22244792"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:26 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2168312056F;
	Tue, 16 Apr 2024 22:34:22 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 43/46] media: ov2740: Add support for G_SELECTION IOCTL
Date: Tue, 16 Apr 2024 22:33:16 +0300
Message-Id: <20240416193319.778192-44-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ov2740.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index e37d824291fe..6e355e986b88 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -23,6 +23,11 @@
 #define OV2740_DATA_LANES		2
 #define OV2740_RGB_DEPTH		10
 
+#define OV2740_DUMMY_LINES_PRE		8U
+#define OV2740_DUMMY_LINES_POST		8U
+#define OV2740_ACTIVE_WIDTH		1932U
+#define OV2740_ACTIVE_HEIGHT		1092U
+
 #define OV2740_REG_CHIP_ID		0x300a
 #define OV2740_CHIP_ID			0x2740
 
@@ -1114,6 +1119,31 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 				   fmt->pad, fmt->stream);
 }
 
+static int ov2740_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
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
@@ -1222,6 +1252,7 @@ static const struct v4l2_subdev_video_ops ov2740_video_ops = {
 static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov2740_set_format,
+	.get_selection = ov2740_get_selection,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
 	.enable_streams = ov2740_enable_streams,
-- 
2.39.2


