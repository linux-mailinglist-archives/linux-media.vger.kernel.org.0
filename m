Return-Path: <linux-media+bounces-36221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88626AED123
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309033AB035
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F0323F42D;
	Sun, 29 Jun 2025 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaMiDB0x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FAA23D283
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230617; cv=none; b=Qj3tkav2io9/LtEh+DrJwDpWeAsBvhbmoi0ds7OAn3v3ATgnrgUSD9HCdnKuAfrHOwM02+EMOPBkEGay7ch9Qj026TmOFx7mbLV4YzfVFvb1i0ytA+bLNGu6ORMJVNJ4DQdO2tDxaBKCyv49JcI3XxbVk2qWg6QWiwO7lvpBKhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230617; c=relaxed/simple;
	bh=QIWHH8zHhgEs2K3CtiPDhmKfiI/qAL5uK7i6EkN8F+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pweHXSXhGVy5FVKiHODsyJm/9+ihVZYxIpgeR0Gde79U0DpAUsgVNb1/NxEkBirTW8RwFeuuM6cKOPrmyCzCNIOmvWNqlCOLp+/ZtY+zWUPqDehHlGweSF4YYEyx0DsvJzggh6UQ0gCVzxybkbvtmqLpub4B4HRRDq2lPD+mdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaMiDB0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0548C4CEEF;
	Sun, 29 Jun 2025 20:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230616;
	bh=QIWHH8zHhgEs2K3CtiPDhmKfiI/qAL5uK7i6EkN8F+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VaMiDB0x/xfjehgb9AEPey1aH7iyy3EGvsz6GJ7D75Yim9nAsFSDakOclUR5ZCxgB
	 Jq2z+m3sIm9J61usUsBcUeBPQjvEZFIYzO5PrGLwbbY1ZiTSSGVHpzwZSRkXeHzawl
	 9LYONkNa9BCQs4hWzlwIl8BvPOac13Br6dw8b83tl1AACEJn1ztguf9S+NSjO4j+aD
	 ZXlmoTo0y09Z9mtmOB4bfTD+dOZJqmyWu7guQYAuJS//qsdwayBo9X+/D5nz7HGthY
	 WWFXoNk0XHra6mDM4MsIyj1cOC6mJIy1w3miTqFwVbDAWx2FJTbvmR0pvE6wGAU6YW
	 IbEO0eADpRAhA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 13/15] media: mt9m114: Drop start-, stop-streaming sequence from initialize
Date: Sun, 29 Jun 2025 22:56:23 +0200
Message-ID: <20250629205626.68341-14-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the start-, stop-streaming sequence from initialize.

When streaming is started with a runtime-suspended sensor,
mt9m114_start_streaming() will runtime-resume the sensor which calls
mt9m114_initialize() immediately followed by calling
mt9m114_set_state(ENTER_CONFIG_CHANGE).

This results in the following state changes in quick succession:

mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING

these quick state changes confuses the CSI receiver on atomisp devices
causing streaming to not work.

Drop the state changes from mt9m114_initialize() so that only
a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call is made
when streaming is started with a runtime-suspend sensor.

This means that the sensor may have config changes pending when
mt9m114_runtime_suspend() gets called the first time after mt9m114_probe(),
when streaming was not started within the 1 second runtime-pm timeout.
Keep track of this and do the ENTER_CONFIG_CHANGE + ENTER suspend from
mt9m114_runtime_suspend() if necessary.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 1280d90cd411..ec5e9ce24d1c 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -389,6 +389,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	bool config_change_pending;
 	u32 clk_freq;
 
 	/* Pixel Array */
@@ -781,14 +782,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
-	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
-	if (ret < 0)
-		return ret;
-
+	sensor->config_change_pending = true;
 	return 0;
 }
 
@@ -987,6 +981,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
 	if (ret)
 		goto error;
 
+	sensor->config_change_pending = false;
 	sensor->streaming = true;
 
 	return 0;
@@ -2315,6 +2310,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 
+	if (sensor->config_change_pending) {
+		/* mt9m114_set_state() prints errors itself, no need to check */
+		mt9m114_set_state(sensor,
+				  MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+		mt9m114_set_state(sensor,
+				  MT9M114_SYS_STATE_ENTER_SUSPEND);
+	}
+
 	mt9m114_power_off(sensor);
 
 	return 0;
-- 
2.49.0


