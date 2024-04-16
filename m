Return-Path: <linux-media+bounces-9581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8818A74F2
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37AF71F222FE
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC02113AD2A;
	Tue, 16 Apr 2024 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUrfx2TB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E2C13958C
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296049; cv=none; b=QhMKSwzQzCD2xSTpz1BI6MZddlpfzkJ62K6M+8DGiXq5tLYNDM0kcqlu7wm+E/PGwdZ+QhplS3BrVSJN2Y7EZcs86r4gp3RCkRfGfJDesHu/hFCC2Hyi0SgWMNyeMYZ9+EctfaR62HvTb66dSytfyppX3+P/C89PoLtPM6vxa5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296049; c=relaxed/simple;
	bh=Di1iJz7TjPUOE8+N/J+ikoc6pbO36v1qP8OwmyTD2kI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qQAhP9K4cQ0gy+HYmIU/MpjYQiJ0YcDteuDcq7fsxG7I3EpAWjCH1taJO0MSsCmcmZwuReWVyBLcbFJSMy9U5NXND1230IYA56nKVxN5wPJSi7oaQzBWHezzDy+s02b1rdxQd+i/zxCNqzxMH7rfAQhNn0n2+LxgVURMwfaob+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUrfx2TB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296048; x=1744832048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Di1iJz7TjPUOE8+N/J+ikoc6pbO36v1qP8OwmyTD2kI=;
  b=MUrfx2TBlEJAtBuI6DqSXcutNO44+90kx94h3e7yeGjaYdWqGggu/Lrk
   6fiQ5+bJOoof+OT9K3cyhLpb2hsVWLhIAQ/pz//IR0+Q0KIR6pCwbTXIz
   OXFJL/mf1786gOmE7VJaTSMm4Rwuslc0MFy0UERRK7/zr4riqXPNTtLAQ
   vabB9dQvvwHGSwHy/5cShtNzxA0pTb3azvl+oe05QdhOWlA1X+Z3g7zXW
   +qllaEfH136zj8GrgeNAbe3PmJObhb51qrghdxyZbxAxfi44EhVO1/eRr
   6mlXdKviTW6maDxNGT4Q01OeTTJ/w1X4xe9QLYzqV0lDeI/VzamM7PhOC
   Q==;
X-CSE-ConnectionGUID: +1eiSxAPQYGDniFDzRz5mg==
X-CSE-MsgGUID: WDy5VSYrTziwq373beDcyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906151"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:08 -0700
X-CSE-ConnectionGUID: TOmQRMLGTV2gsdhUxTearw==
X-CSE-MsgGUID: LJaJjobBTkWwciMMjIpohg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155456"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 225C912053D;
	Tue, 16 Apr 2024 22:33:49 +0300 (EEST)
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
Subject: [PATCH v9 20/46] media: ccs: Rename out label of ccs_start_streaming
Date: Tue, 16 Apr 2024 22:32:53 +0300
Message-Id: <20240416193319.778192-21-sakari.ailus@linux.intel.com>
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

In preparation for upcoming changes in the function, rename the out label
as err_pm_put. The purpose of the label is changed to match its name in
the next patch.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 38 ++++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d7bc9418eabb..d14e90f8568a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1767,7 +1767,7 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 			 (sensor->csi_format->width << 8) |
 			 sensor->csi_format->compressed);
 	if (rval)
-		goto out;
+		goto err_pm_put;
 
 	/* Binning configuration */
 	if (sensor->binning_horizontal == 1 &&
@@ -1780,38 +1780,38 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 
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
@@ -1824,22 +1824,22 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
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
@@ -1847,20 +1847,20 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
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
@@ -1869,18 +1869,18 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
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
2.39.2


