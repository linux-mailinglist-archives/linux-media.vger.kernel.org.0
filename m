Return-Path: <linux-media+bounces-35275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33151AE04CB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97EDC3B3EAE
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E6625486D;
	Thu, 19 Jun 2025 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrjF0XTN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD92E253F12
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334339; cv=none; b=f23u45O7yWiJz7vyj4zDlWbv2JnhByF5Lc2I6AijVzsjbGzKkW+jppPl+o2+5IsJ3oBMzfz8A8Y4NKnILbIqfLwtx9ffbf/pY+rMhI4fAYl5BxpvJ+o4bGqvjvi+uOk/VnIRHyN/t/+NZIUnIULwrt9PWe/uQDQ9VqA09GiuUvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334339; c=relaxed/simple;
	bh=0SJzCdb+uqJ99p9hxAIobJMTrS7ZZy8aZOxe6z7lhEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DKh9uEuwDnQ0OvJIaRFWi3pwYA8+NvDcMoMKX3AEAuH28V84uF3mjPCIGszBpoyRNufDJIdqdfWo28j/b3nkEgAVEjAR+hdyf1pKQVVyRS7JlUoogKE7maQPG8EqxCUwYZvFRJymqohYVusP6UW5AEdRxE/AX2AQzFlANpe8wNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrjF0XTN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334338; x=1781870338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0SJzCdb+uqJ99p9hxAIobJMTrS7ZZy8aZOxe6z7lhEE=;
  b=hrjF0XTNC04RyinWRtYG2SEc+2gRkrCfPC4B0PkLSb0yyeHhPUgC+yW9
   Rblpi1gAwusTes1gdq0T3Ib+6ix5SaavTQEHKX2ArglUsX4Jk8XU71zNA
   v+5VmBIqaRKHNr7yDPSTJHfVriK8GuzC5dqogmi3AJ6Y5Zhc1ulo2AkFU
   V7/m7w53c0wJ8s25rGRVFfTeNwHOYQQrRWuO0kAuyjNZvQiWt7iHO5tS0
   oQciTjhQmZf02/gGv+YdL29EpdtxBf8T24MjOngsyLpF0frPXj5toNL1R
   3AGv3zoYpq+GKbiEhdJtUACGY5waAqYSt2LXIAAWexiCcV2Z2thGHkV/z
   g==;
X-CSE-ConnectionGUID: YQaHU6ntRL2h3kr4wQ7OYQ==
X-CSE-MsgGUID: MLOTxXJyQ1yJYtzjPXTFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014893"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:55 -0700
X-CSE-ConnectionGUID: SV7KbwesTDCl7ioA6aqFkA==
X-CSE-MsgGUID: qbmgfCiwRwWt6MdfhlVj5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192212"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B46C01203E9;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AI3-2H;
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
Subject: [PATCH v10 06/64] media: ccs: Rename out label of ccs_start_streaming
Date: Thu, 19 Jun 2025 14:57:38 +0300
Message-Id: <20250619115836.1946016-7-sakari.ailus@linux.intel.com>
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

In preparation for upcoming changes in the function, rename the out label
as err_pm_put. The purpose of the label is changed to match its name in
the next patch.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 38 ++++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 2a55af67ed13..1aa5a06d7cde 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1763,7 +1763,7 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 			 (sensor->csi_format->width << 8) |
 			 sensor->csi_format->compressed);
 	if (rval)
-		goto out;
+		goto err_pm_put;
 
 	/* Binning configuration */
 	if (sensor->binning_horizontal == 1 &&
@@ -1776,38 +1776,38 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 
 		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		binning_mode = 1;
 	}
 	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	/* Set up PLL */
 	rval = ccs_pll_configure(sensor);
 	if (rval)
-		goto out;
+		goto err_pm_put;
 
 	/* Analog crop start coordinates */
 	rval = ccs_write(sensor, X_ADDR_START, sensor->pa_src.left);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	rval = ccs_write(sensor, Y_ADDR_START, sensor->pa_src.top);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	/* Analog crop end coordinates */
 	rval = ccs_write(sensor, X_ADDR_END,
 			 sensor->pa_src.left + sensor->pa_src.width - 1);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	rval = ccs_write(sensor, Y_ADDR_END,
 			 sensor->pa_src.top + sensor->pa_src.height - 1);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	/*
 	 * Output from pixel array, including blanking, is set using
@@ -1820,22 +1820,22 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 		rval = ccs_write(sensor, DIGITAL_CROP_X_OFFSET,
 				 sensor->scaler_sink.left);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_Y_OFFSET,
 				 sensor->scaler_sink.top);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_WIDTH,
 				 sensor->scaler_sink.width);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_HEIGHT,
 				 sensor->scaler_sink.height);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 	}
 
 	/* Scaling */
@@ -1843,20 +1843,20 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	    != CCS_SCALING_CAPABILITY_NONE) {
 		rval = ccs_write(sensor, SCALING_MODE, sensor->scaling_mode);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		rval = ccs_write(sensor, SCALE_M, sensor->scale_m);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 	}
 
 	/* Output size from sensor */
 	rval = ccs_write(sensor, X_OUTPUT_SIZE, sensor->src_src.width);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 	rval = ccs_write(sensor, Y_OUTPUT_SIZE, sensor->src_src.height);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
 	    (CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
@@ -1865,18 +1865,18 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	    sensor->hwcfg.strobe_setup->trigger != 0) {
 		rval = ccs_setup_flash_strobe(sensor);
 		if (rval)
-			goto out;
+			goto err_pm_put;
 	}
 
 	rval = ccs_call_quirk(sensor, pre_streamon);
 	if (rval) {
 		dev_err(&client->dev, "pre_streamon quirks failed\n");
-		goto out;
+		goto err_pm_put;
 	}
 
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
-out:
+err_pm_put:
 	mutex_unlock(&sensor->mutex);
 
 	return rval;
-- 
2.39.5


