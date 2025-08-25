Return-Path: <linux-media+bounces-40936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8DB33BC2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DAFD16E16E
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE46F2D6412;
	Mon, 25 Aug 2025 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XS2GPezx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8044B2D5432
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115490; cv=none; b=izC4JCzDHyTljz23KaYg/YuNWBWWrv81JOvgR5DGb5lxzUvHCRw/DSKO4zDN5GTU4kL0v5N2I/O9H1SY1yKdkOscdYR6gwd+2WFOWNNN2A7xrwVVCBJMOKzmKGu5D2l6dymg40hdqbfoqprkPmy/M0E5oPoU22omdJACTewJCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115490; c=relaxed/simple;
	bh=zSgpnv1ja6bVrogf/l0p3+BZ5r+ZPz9zJX6d6z/Ix/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SV1ztu9MvJ7ardH3nPNNRW7T1hsNvvYixeZajSthbt6MLuFwEE8n7hM7JAFBp5lGQAxU7E79Y5PlvxGOU5NWv3Dw6iM7OBDio3r1sguLv5MyNRhjhSGjg+WRVdDdJSF8fddXjZePQhxY+4jN8eTGQcr+lf72+E8YouxioBgDixc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XS2GPezx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115489; x=1787651489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zSgpnv1ja6bVrogf/l0p3+BZ5r+ZPz9zJX6d6z/Ix/4=;
  b=XS2GPezxXFxn+FQLMpnH2AMIGr7w+diiDHf2dyKrNTnYIr6AhOTgekNi
   ugkSrfYrYfFKCB0eiAji5RPK1An89axIBLsXtzg0wLCeBGu0Qi/cTeqce
   kR0Tf1wwZuHO/JNvbXYHm7k/LmYuO20TzGX49q1z6RLeAfEl1oeSIR88m
   lx0FVqdgp02cp1osZ/WjFH9Zp3Q9tGSyvK4SZybq+cjkw2PtiWYAQYuvr
   kTc73ku6ItA386+HqMIfJEo5NlahwfyaQ3CpdCPhfS57GieC8HHJhFJ24
   D0x9qujRpplrGt6em/r0JSEdgbmQ7yD+baPghD1A+787a4KJGY9OV3B8R
   A==;
X-CSE-ConnectionGUID: Csi5Oi50RI281aLDnpJ1+Q==
X-CSE-MsgGUID: kJtihilIQ9G7zBf4stx8Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695819"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:26 -0700
X-CSE-ConnectionGUID: mPI4fmVvQruTKAc31RlZ9w==
X-CSE-MsgGUID: ATd++dFdTX+l310j/r/gaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195415"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 24FBA121F6F;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005adl-0Tvj;
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
Subject: [PATCH v11 07/66] media: ccs: Move ccs_pm_get_init function up
Date: Mon, 25 Aug 2025 12:50:08 +0300
Message-ID: <20250825095107.1332313-8-sakari.ailus@linux.intel.com>
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
2.47.2


