Return-Path: <linux-media+bounces-40986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05043B33BF2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8C16170232
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A52C2E11DD;
	Mon, 25 Aug 2025 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QM83f6Za"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3565E2E06EF
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115521; cv=none; b=Qg4Po9qJnBoL4o1uS1gceSENyaAZCwDZ3+utuMg6JJiZ2ygC2IIvIIXfjffHA5si69tBx9ZKHdxRJ7NpMt0kCG2a1UfMcPqjwTqtB39EYVM/slkBTbZkFEOh9fzBiV5YVXDZ4FnzdNmlPQKFWFLonfouMmk68EJi3S1qpJZ8aAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115521; c=relaxed/simple;
	bh=CqX02frfH11vFTTD2JdtFnuXFfPDaTSGh+Djy70GjeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoaMmaXliCrXO4q2JPaCEgdUzYquUzRWIJhWxRlntPsrAo+C+CJC75wZosTCiUNc1POXBFnSs+Dcead97DxERuaadASd6tEOM8In8+4myGjg1rahb9ZrZZwYv2rgbJZv+TbpXkc/Xm7n3pISehYPXj+RYq/9EshAw2yNfLNfm58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QM83f6Za; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115521; x=1787651521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CqX02frfH11vFTTD2JdtFnuXFfPDaTSGh+Djy70GjeE=;
  b=QM83f6ZaVPFD1n2UmIb6T3q4BNSOhN754zIbfvj0daBnHlgz68LaCt9c
   JlqmHN5PcIcig4LCHpxV7VWLkV7wylBanGuDYX3TvEPqudjd4DMaLVpcg
   g+2HS9OAP1EB73UZrN1jYsnvq1yJ+wNGuGpt93XCk/UWw8H9haKT2Nwvp
   +P7wTeBHaujZLULGPE+dHVDDSHOP0GtRvxpu+Xv7+XJWDRzdmZ0pJRyTY
   +fnDawZaY0X19EB4rwb82qT/HV8ZG9xPVWLR/7tzN5GNC9gK2ANEPy7bE
   QuinbX2zs6JHUZmcEWDTqes5d7XptlPEFqGZh+7TMKLOUXEpfyiJ6x6Y6
   A==;
X-CSE-ConnectionGUID: moJ8Wor4SM+YZdo75dtKmw==
X-CSE-MsgGUID: 4K1qwEpST5Cp2mATgBBsrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032435"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032435"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:54 -0700
X-CSE-ConnectionGUID: AiHfd+3YT4eys+GOj9xktQ==
X-CSE-MsgGUID: tNRoVUMvTveDARLa7OU8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431145"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F0D7D12200C;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ahx-3zXT;
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
Subject: [PATCH v11 59/66] media: i2c: imx219: Add image stream
Date: Mon, 25 Aug 2025 12:51:00 +0300
Message-ID: <20250825095107.1332313-60-sakari.ailus@linux.intel.com>
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
index 1ab7fb1f220c..bb972fd90026 100644
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
2.47.2


