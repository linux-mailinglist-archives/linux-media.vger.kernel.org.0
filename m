Return-Path: <linux-media+bounces-9571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A388A74E8
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAE86B22615
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587941386D2;
	Tue, 16 Apr 2024 19:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EByv43uf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718D13A895
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296035; cv=none; b=M+Usgl+TmJSCW/MGpDGA7+yXKFi32vkkW66Jl4UHPkyW6k+W/icdB9QGg6aM2/1WBaOMlE5FxmYmpj2FrRWJPpEi+e/kwlnXVN8cW+5yY71XcI5SEdPkvpDzjtzzy3NAUz4Cd3HyXSju+gzSDc+Hgegx9BFvshdStCXhe8VH9y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296035; c=relaxed/simple;
	bh=WyH+zjq+F2hbPOswq0W98xJjsPQq+hWXoMIFrYJVz2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tgSiw5+BMzd3y/wQXHtOTkM2J1YO3vzegpz3MNkcNBl6LExHPROBXh2rYIdqzGF7w+y6/IOFvkDfQqKgVwWgFy/2wgT1xFBo9ITYkO9W+l4an9QBWJ6idQ6TxyOn2PKKt9jhgxW3HOEs+fZ/4w0+kgRedfinmfDzjaSD8vZ4xMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EByv43uf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296035; x=1744832035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WyH+zjq+F2hbPOswq0W98xJjsPQq+hWXoMIFrYJVz2o=;
  b=EByv43ufh15dxOMxrcbvI+1OI3QG0cyqsI2ZIx3C3dQJ1hj5pNfEHuTy
   EkTsfwiVtyD7QuGuDchxd2QdH9R6v+/PtlnrMcoXqdtd3Mhm19AOjGBdD
   ZjCG7eHAuPfBc5Pop/1FC/NlCK4hjfrpqduTpchlbGGS6MrheQH7ii3Ab
   IDXcEO9rJ8ppcudrafrDp6F5SeKUfeXQl8ZFtNRwEzX2N1SRW7pcceNQw
   bmNzrHuvTHYxp7UAMFLkjfVnkAnPGtBjmVuzJgDzjnqFSClWfrO8RJydh
   H+SC4YU0B56t35Ak5kGtlA1C41KA6/ixSNmv1cfX3IhHTC8Qm6AOt9LoF
   w==;
X-CSE-ConnectionGUID: 8O0nH+vhS3e7hSqmCCNnjQ==
X-CSE-MsgGUID: rZRIGkTERVqOmAKPubwBMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906129"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906129"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:55 -0700
X-CSE-ConnectionGUID: tGHG14gwS6G2qAXpPUtd2Q==
X-CSE-MsgGUID: jh7OhTBeT7689anwLifBIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155394"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:51 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D7C611F879;
	Tue, 16 Apr 2024 22:33:47 +0300 (EEST)
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
Subject: [PATCH v9 19/46] media: ccs: Move ccs_pm_get_init function up
Date: Tue, 16 Apr 2024 22:32:52 +0300
Message-Id: <20240416193319.778192-20-sakari.ailus@linux.intel.com>
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

Prepare for using ccs_pm_get_init from locations earlier than its the
current place.

Also add a missing newline while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 73 ++++++++++++++++----------------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 7e5474e38732..d7bc9418eabb 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1718,6 +1718,43 @@ static int ccs_power_off(struct device *dev)
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
@@ -1872,42 +1909,6 @@ static int ccs_stop_streaming(struct ccs_sensor *sensor)
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
2.39.2


