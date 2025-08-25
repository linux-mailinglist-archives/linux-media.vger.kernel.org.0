Return-Path: <linux-media+bounces-40939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D62B33BCF
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0388E7B1BB8
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FC72D6E49;
	Mon, 25 Aug 2025 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDJi/q8R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7942D63F9
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115491; cv=none; b=STtT2rPQOVM1s/Ai5l9s5qWQu+D1C9nEP3OXeZs6fXPK0ftXnNyFS1gJjy2BdJyp2Ar/D5jAB01ZytE8qVndPpazk5xOlrPxwCUIoIkN2NlGa5J15bKhU+0cn6FTDlDbomVEudNdoPcnf9kGuNLUrH/mOyCYK6fZptuNak/3XE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115491; c=relaxed/simple;
	bh=AIX4SKfsq7RmqJ/CryayH51/DyNItO3x4/rUmNw8cto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByYCyY5hrIL846pETVC8UbyUoeQy2YnBqgsVdaHaZYk/1eNPGQ9V4MzJxUQN5xC0wCVbbfHDQZTNnATOu7udTrmkZNbcIMhrLdX3tYVn5ShqKi5SG54XLE//vaHjKARIfevVYwzJQiKxXRTtxv1bOx3tbQQgNrzSU/AY+Q+i0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDJi/q8R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115490; x=1787651490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AIX4SKfsq7RmqJ/CryayH51/DyNItO3x4/rUmNw8cto=;
  b=HDJi/q8Rhfd/cEkaNo7r7jDXo5KuDQXutEIzQI6+1yAoltvmuata/ND0
   id30N9ZS/7X7IoVPdB9LmN4Oj2nwRGr+xkYkRZVLFi6cKOI9DY0ckpwL2
   V5q2pBnEsuEM7hh7prPuQg1eygvTYvpF6g18lOcaKOc19c8CBCm/Omb4l
   8tuFyP5B4ynq44hDiazVfa8hG6UEYJs0vyR2g/VXJRsrzzcTCRXrB6a0/
   TZIi8kGLzTSyfG9UB58Q/Pd+IR3Ew0AoGAts1Jq88w0AkSEZ/Xakdln2c
   Zd+TdARv/TZjpyRlGTlvOErP+rIie3LRvb47CIvJui/A1aBWnk3aaEcpN
   A==;
X-CSE-ConnectionGUID: t8kQERxWR4Gk57xKDIKneQ==
X-CSE-MsgGUID: aS2VkxnuTe6IQk6ozc5dRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695861"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695861"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:27 -0700
X-CSE-ConnectionGUID: 8/35+W6BQs+4peV+fZxXnw==
X-CSE-MsgGUID: wDiol1mJTquttPrKDqvEzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195426"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 34D31121F82;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ae5-0jFW;
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
Subject: [PATCH v11 11/66] media: ccs: Track streaming state
Date: Mon, 25 Aug 2025 12:50:12 +0300
Message-ID: <20250825095107.1332313-12-sakari.ailus@linux.intel.com>
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

With enable_streams and disable_streams, the driver for a device where
streams are not independently started and stopped needs to maintain state
information on streams that have been requested to be started. Do that
now.

In the future, a helper function in the framework is a desirable way to do
this instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
 drivers/media/i2c/ccs/ccs.h      |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 56c9f7124b2a..bd7d2a8d23dd 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1763,6 +1763,11 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	if (pad != CCS_PAD_SRC)
 		return -EINVAL;
 
+	if (sensor->streaming) {
+		sensor->streaming |= streams_mask;
+		return 0;
+	}
+
 	rval = ccs_pm_get_init(sensor);
 	if (rval)
 		return rval;
@@ -1884,7 +1889,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
-	sensor->streaming = true;
+	sensor->streaming |= streams_mask;
 
 	return 0;
 
@@ -1906,6 +1911,10 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (pad != CCS_PAD_SRC)
 		return -EINVAL;
 
+	sensor->streaming &= ~streams_mask;
+	if (sensor->streaming)
+		return 0;
+
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
 		return rval;
@@ -1914,7 +1923,6 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (rval)
 		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-	sensor->streaming = false;
 	pm_runtime_mark_last_busy(&client->dev);
 	pm_runtime_put_autosuspend(&client->dev);
 
@@ -3519,7 +3527,6 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_cleanup;
 	}
 
-	sensor->streaming = false;
 	sensor->dev_init_done = true;
 	sensor->handler_setup_needed = true;
 
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 0726c4687f0f..518482758da6 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -238,7 +238,7 @@ struct ccs_sensor {
 	u16 image_start; /* image data start line */
 	u16 visible_pixel_start; /* start pixel of the visible image */
 
-	bool streaming;
+	u8 streaming;
 	bool dev_init_done;
 	bool handler_setup_needed;
 	u8 compressed_min_bpp;
-- 
2.47.2


