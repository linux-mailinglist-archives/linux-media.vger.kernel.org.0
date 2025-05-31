Return-Path: <linux-media+bounces-33729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8274AC9BC1
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27B1E1888FAA
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4035B18DF86;
	Sat, 31 May 2025 16:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzgumPdM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38EA1632CA
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709137; cv=none; b=iXfQR08cLu1q7ZduNOtrVxD6/s66vGULfFZJdslUrtkSj05NumbZYHtLHWKPVLUNq1Q+2MJqEVFe9835VVdRrxXjzSGoPY9ygnp0qc3EuN+M5+SkDULFAlj+oa0dXiH/VNp75AHP0ZZftjdbR7ban2qBkr+B2g2YPgtV0wKYPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709137; c=relaxed/simple;
	bh=Q2UPmyRz23e5l/ZA/e5YkvVRAaPDuCB2ItxaZW/lAfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCVrdNw8G5GCeQzTOac8Z8YNFY8Avt25wJ/rp47QqGHYa+PYmnmPjSzd1toHSkcic8NNcYQM6tY4fMuvBGWxCV8Oqe3/FjX0c9bNTgG8auY7SlJ7zzWWKTVu2cYFfWXFf+drkbJcpLZPP3t3O7tlKGTlChfoCMtNW5uzVHirZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzgumPdM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C13C4CEEE;
	Sat, 31 May 2025 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709137;
	bh=Q2UPmyRz23e5l/ZA/e5YkvVRAaPDuCB2ItxaZW/lAfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XzgumPdMC2ttUtW7Am6dEuZuTFatylfUjyaOM4AElKbXOYJxQtr1hJVGkBStb++ng
	 9pcxlNyHLL8C0KFdrystWR9Pn4UP0WLdnZYVlnJj3gMcIYct1TBbxOO2rQCWJr9yVR
	 S+kgvwUpHQIFegUJa5+hLlJu4S94tB+PyJ6mMVVqoXvxP8dzj2UhmK5P2rhSx7WpD6
	 V1yUmz7NO6pmENA5QHCmyieQpTKsP7b+Lr2cU7yTpN+JtJDNEHvk1bPQZksz2ows/t
	 +gdJi60Edlk3MGoaMmEV0bWeRhipMefR0hw+hmvfUFF3Tg8SmAh9VcYTAjNguLHFWX
	 IxOKIBMaOw7yw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 10/12] media: mt9m114: Drop start-, stop-streaming sequence from initialize
Date: Sat, 31 May 2025 18:31:45 +0200
Message-ID: <20250531163148.83497-11-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
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
index d954f2be8f0d..c4d3122d698e 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -389,6 +389,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	bool config_change_pending;
 	u32 clk_freq;
 
 	/* Pixel Array */
@@ -782,14 +783,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
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
 
@@ -976,6 +970,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
 	if (ret)
 		goto error;
 
+	sensor->config_change_pending = false;
 	sensor->streaming = true;
 
 	return 0;
@@ -2267,6 +2262,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
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


