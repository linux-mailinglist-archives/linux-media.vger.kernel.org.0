Return-Path: <linux-media+bounces-49764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEBACEA584
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 793343027E34
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026B632B98D;
	Tue, 30 Dec 2025 17:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aynFx6uv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EFD322C73
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116449; cv=none; b=rLU+jQ2mynKyXOLRlNgO0IPEike7ajpTlqOSnYaFwB18dGuFZlMBJG40Hf1k9rOIK87YCqdOfz7yZseZGBEOEsc0EKMj1396HzQGvJrxu022gdRVpVqMebC5gyVD9ruCSU+HGLDsPK4QScOdtrVS6teyNIhV2CUpnyyzwyMoWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116449; c=relaxed/simple;
	bh=izZup3Mb2Jz2UCkYT0P7YkY8VirpOGhG8Zo1esOZNl0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5h9m7O0StIcDNLCqyiEYZkloqJIwPbog4Xky9SIlAzgzWxEQZ0smQ0G5IG1DiM8LcLqIFzPEpY44UuFyS+TpjE3TvoD1mXyCBDTszt7uPVbFAtAB+jYVf/3h6c0Rm2cci24GFNF4jZVEwS1dwLs3BJ2BO6B6dDBqydNb8sGPZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aynFx6uv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767116447; x=1798652447;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=izZup3Mb2Jz2UCkYT0P7YkY8VirpOGhG8Zo1esOZNl0=;
  b=aynFx6uva7Y/xemsdP8TeAF+HllPhaNdqfJn47xeVJXBy8IBeY79YPHP
   TPSzhO5h+yPf90w2egGhcF7qsiladpIbjgmsiBDbtLfmJr3VD9+fufONQ
   YuvdSUOUA6gVKs8JKQ+yd97WfkLd8OapQKde+1TRKNIHU0GIOPD/e7gKg
   jJVxGAvTc92KOmyXYM7MRgP5DvBoJ0igmJrKFrDaRZDiZY6NbbIiPY4FI
   Ovt6J3zcY3a94GbjW6nA07W+95GT8nkzwV9nRHwF5y5ld/zkhWKHZVL2A
   ZpjkggC2BIFKlHfLEZfB5B4AVOOxkCDZgS6mWgU0rWVFt2zVhqgAWv9EJ
   w==;
X-CSE-ConnectionGUID: N9OxCCORR4mdxszpb/YYtw==
X-CSE-MsgGUID: 54i8t1tTQYulSnzRc2h+VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72559950"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="72559950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:40:45 -0800
X-CSE-ConnectionGUID: bx1ca5bFS2iCftUKJj6row==
X-CSE-MsgGUID: M7HQQhnPTtuRHI43iQRMcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="206309983"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:40:44 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 69943121D84
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 19:40:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vadiE-00000000tyn-0VXr
	for linux-media@vger.kernel.org;
	Tue, 30 Dec 2025 19:40:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: ccs: Track streaming state
Date: Tue, 30 Dec 2025 19:40:49 +0200
Message-ID: <20251230174050.215164-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230174050.215164-1-sakari.ailus@linux.intel.com>
References: <20251230174050.215164-1-sakari.ailus@linux.intel.com>
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
index 623fc9770205..a04763adad91 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1761,6 +1761,11 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -1882,7 +1887,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
-	sensor->streaming = true;
+	sensor->streaming |= streams_mask;
 
 	return 0;
 
@@ -1903,6 +1908,10 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (pad != CCS_PAD_SRC)
 		return -EINVAL;
 
+	sensor->streaming &= ~streams_mask;
+	if (sensor->streaming)
+		return 0;
+
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
 		return rval;
@@ -1911,7 +1920,6 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (rval)
 		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-	sensor->streaming = false;
 	pm_runtime_put_autosuspend(&client->dev);
 
 	return 0;
@@ -3522,7 +3530,6 @@ static int ccs_probe(struct i2c_client *client)
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
2.47.3


