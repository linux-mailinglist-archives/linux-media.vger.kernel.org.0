Return-Path: <linux-media+bounces-35324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F18AE04D8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2AAD1891235
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C294225C6FA;
	Thu, 19 Jun 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="US+tsUPe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B328C25BEF0
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334371; cv=none; b=i5ulWoAOr1o6S66+F+ErhDeoqVVRxsxyAKF0Ki+R7R1hu4qF/+lCfeIf1G7M9jnJc543Kq5Gc0pU21VkmrJ/LXVDJS6eNJ9ihLhDNgdaUke1FBPYN1nrLKopMw2Fkn72kuGiC3b7yX7Ab+Qzmw5Fo2ixxwiyULkosWGb0B/AFq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334371; c=relaxed/simple;
	bh=lANDBGooGXWlQ7RMUBUZXXGaREEl1Y+7RlImw/GEnXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XpIjxAWMEJPamYEppO6Xmra3bBKWtglCUuLGKNVSDqwGA8zlkKJa8476FSswBMhDypaI+SlGmLDNhMg2SWco5hUGQ10hNPQyZyYuZU4XimsacxVU/tls1rs7EXzjoobjf9ZDznFInNie/1LcWRbGnjU2kuL7HS2O7Zc4cFY21FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=US+tsUPe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334370; x=1781870370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lANDBGooGXWlQ7RMUBUZXXGaREEl1Y+7RlImw/GEnXk=;
  b=US+tsUPetSA9kSfxWdHULrE9apWhxAijqMDPqNx5NlcO2DbWRDnHvFxz
   1TJ+v2ZBq29WGQZemUVnvHsoAex9gLE11TH2C3LeYSUJYUwN2XfCUtFHU
   2dKt+OzXgOGVUMFzI0NTEZz5AX0nVJcuz8QFTZ8RZ1Tqokqnyv4ZgrtxJ
   k0LvYFz/0uaW0hgtAgsxfgBShg3f1Mwp/ONVd2tg0Rcj8nqcrKB25UpgJ
   3OZH6HqZvVuqgHluNbpyHU8NCP4H4PFfu3YFWWSoxEZk5LvTPTUZXjlmw
   m3VvUK15vW8CwA4R0uKxBUNjHvJp3n0j3khxgtzmz3myi1lfwJ+8jed34
   w==;
X-CSE-ConnectionGUID: A34MXEwoS4yYs8VAB+MWrw==
X-CSE-MsgGUID: J28xI8CRQyqZPhUnyTxBTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386919"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386919"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:21 -0700
X-CSE-ConnectionGUID: TlpLt3VIQHu+DBlYBGqKBQ==
X-CSE-MsgGUID: UMBTYTnPRr2QBUgsOGqGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908527"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 67EC712328A;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AM5-1H;
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
Subject: [PATCH v10 56/64] media: i2c: imx219: Add image stream
Date: Thu, 19 Jun 2025 14:58:28 +0300
Message-Id: <20250619115836.1946016-57-sakari.ailus@linux.intel.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

In preparation for embedded data stream support, introduce a new
imx219_stream_ids enumeration for stream IDs, with a single value,
IMX219_STREAM_IMAGE for the image data stream. Use it when accessing the
formats, crop and compose rectangles on the source pad. This is meant to
reduce the size of further commits, and doesn't introduce any functional
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e8ccf2c835b3..d2abe91c42f1 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -341,6 +341,10 @@ enum imx219_pad_ids {
 	IMX219_NUM_PADS,
 };
 
+enum imx219_stream_ids {
+	IMX219_STREAM_IMAGE,
+};
+
 struct imx219 {
 	struct v4l2_subdev sd;
 	struct media_pad pads[IMX219_NUM_PADS];
@@ -460,7 +464,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 	rate_factor = imx219_get_rate_factor(state);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
@@ -682,7 +687,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	u32 bpp;
 	int ret = 0;
 
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	bpp = imx219_get_format_bpp(format);
 
@@ -938,13 +944,15 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	 * No mode use digital crop, the source pad crop rectangle size and
 	 * format are thus identical to the image pad compose rectangle.
 	 */
-	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE,
+					  IMX219_STREAM_IMAGE);
 	crop->left = 0;
 	crop->top = 0;
 	crop->width = fmt->format.width;
 	crop->height = fmt->format.height;
 
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 	*format = fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-- 
2.39.5


