Return-Path: <linux-media+bounces-35276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74448AE04C0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C70316BEB5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57949254874;
	Thu, 19 Jun 2025 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmfGwPL0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13070253F1A
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334339; cv=none; b=q1q+78WCOvaAq56xq3/mji88sZL/cV9Rjsv1YkItB6knCJp5OeZShO5ZAdvXy0VHW0nuXItE9ZtyW9mVnE6xwjD7maCKDOBzezq2Ob5HCiZql/oJuHl4ZZmB2pIT7pxpoHhtur9RyoKSKZcWNEF6LJ7W7jiC8DpPHOqOb1ZfZd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334339; c=relaxed/simple;
	bh=gUqhWrB6nc5b4tPmSTzrnRPDXlEdKZEEqRLxQlIhSYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EOrK94NIsh49pQRS3qI1FsvRVcxvoF9ej89RquhDTkiz7BXotEhM8LcjdI3xo8FoaXvJjaQcUbsxEILZaebO0qnZBLBoxKP7dfAzx2skGvELvWaLeYm5+tnAo6tzpvTzZeUHQNMpStFbARWrlMloOAAam7+swx9prpJaVy6FrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmfGwPL0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334338; x=1781870338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gUqhWrB6nc5b4tPmSTzrnRPDXlEdKZEEqRLxQlIhSYY=;
  b=DmfGwPL0nyUq3f5catDE6kBb444t4NCzzZIeDsXe0X8F+X8LFyliImZc
   d7y6d3d8swJAg+uYStkWFSm0IEIJJZu0DrLMl52QX1XqrKnzbcVYtCzHy
   JjoAneIB1b7hVjwudWtfhexYbgjGy12yVJzOD2o701+PzSJwZB1iXWb1Q
   yISSjnxALaSn9LjAF6dCW2YvUYQbLgBeiphYa3J+qxDRSk6cIPB/mZl0e
   4fuisRTiPG23blmpZka9UYKg0ZjBwBVtslpWOY/pFGlGc0Tjd8Esx2IA1
   lLPTV5zEZ1xVpQx6XRENyaeRJVo5nI33ZIyBmCmJTyYtSpKSGH+tP1Pak
   A==;
X-CSE-ConnectionGUID: yNDOJrLPQEiDCWLjLjqo/Q==
X-CSE-MsgGUID: 5xx0NntwRISZxv6qoiRKoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014904"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014904"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:55 -0700
X-CSE-ConnectionGUID: Dm/Oe4OhR1mht/FawZZtiQ==
X-CSE-MsgGUID: 8C0vnzIJR1aLzQO6asr9Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192215"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B17951203D4;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AHy-2E;
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
Subject: [PATCH v10 05/64] media: ccs: Move ccs_pm_get_init function up
Date: Thu, 19 Jun 2025 14:57:37 +0300
Message-Id: <20250619115836.1946016-6-sakari.ailus@linux.intel.com>
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

Prepare for using ccs_pm_get_init from locations earlier than its the
current place.

Also add a missing newline while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 73 ++++++++++++++++----------------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 48d1f49781ea..2a55af67ed13 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1714,6 +1714,43 @@ static int ccs_power_off(struct device *dev)
  * Video stream management
  */
 
+static int ccs_pm_get_init(struct ccs_sensor *sensor)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	int rval;
+
+	/*
+	 * It can't use pm_runtime_resume_and_get() here, as the driver
+	 * relies at the returned value to detect if the device was already
+	 * active or not.
+	 */
+	rval = pm_runtime_get_sync(&client->dev);
+	if (rval < 0)
+		goto error;
+
+	/* Device was already active, so don't set controls */
+	if (rval == 1 && !sensor->handler_setup_needed)
+		return 0;
+
+	sensor->handler_setup_needed = false;
+
+	/* Restore V4L2 controls to the previously suspended device */
+	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
+	if (rval)
+		goto error;
+
+	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
+	if (rval)
+		goto error;
+
+	/* Keep PM runtime usage_count incremented on success */
+	return 0;
+
+error:
+	pm_runtime_put(&client->dev);
+	return rval;
+}
+
 static int ccs_start_streaming(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -1868,42 +1905,6 @@ static int ccs_stop_streaming(struct ccs_sensor *sensor)
  * V4L2 subdev video operations
  */
 
-static int ccs_pm_get_init(struct ccs_sensor *sensor)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	int rval;
-
-	/*
-	 * It can't use pm_runtime_resume_and_get() here, as the driver
-	 * relies at the returned value to detect if the device was already
-	 * active or not.
-	 */
-	rval = pm_runtime_get_sync(&client->dev);
-	if (rval < 0)
-		goto error;
-
-	/* Device was already active, so don't set controls */
-	if (rval == 1 && !sensor->handler_setup_needed)
-		return 0;
-
-	sensor->handler_setup_needed = false;
-
-	/* Restore V4L2 controls to the previously suspended device */
-	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
-	if (rval)
-		goto error;
-
-	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
-	if (rval)
-		goto error;
-
-	/* Keep PM runtime usage_count incremented on success */
-	return 0;
-error:
-	pm_runtime_put(&client->dev);
-	return rval;
-}
-
 static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
-- 
2.39.5


