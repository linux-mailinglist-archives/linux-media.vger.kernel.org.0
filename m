Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CEF36DA0D
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240358AbhD1Oxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240284AbhD1Oxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 001F861440;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=7cvQL/2CEUShgMHfIXo5pZaMj/4OUeemdQZifBElsOo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pmMpvECgadVQ/lFWxH3421LB/XeNcqsauk/qf9lufWVYHku2EEci0Kn1vPP5PsPpC
         ln79bRE+1PEHpZy1rv8FkHNJZkmkLeHMQSMLCS5x6ze/T/AoxkmQNG8Jq6Qvah2P9N
         dB7uMQVQvqVLJBREeC7RNPNpWM1aH161gq32I4JObh6y9WiAn7wypz9BJX4aih8qw7
         K1p1LUMf/jXjFajdhivMHMVFYY4oJ75Iz03n0vwrCxJthTzNF481hHb51cmcHgkguQ
         0P2Hwsf/cjBqRvXbDeqHUxQjNo1WTwXYls+zOkJJqe+CGMHKX1b4vufskiuI69uPMV
         Bq8xy7jHLM4yg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dpy-PW; Wed, 28 Apr 2021 16:52:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 08/79] media: atmel: properly get pm_runtime
Date:   Wed, 28 Apr 2021 16:51:29 +0200
Message-Id: <3150349be99187c4f9290ac35d6227bb6a83519b.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several issues in the way the atmel driver handles
pm_runtime_get_sync():

- it doesn't check return codes;
- it doesn't properly decrement the usage_count on all places;
- it starts streaming even if pm_runtime_get_sync() fails.
- while it tries to get pm_runtime at the clock enable logic,
  it doesn't check if the operation was suceeded.

Replace all occurrences of it to use the new kAPI:
pm_runtime_resume_and_get(), which ensures that, if the
return code is not negative, the usage_count was incremented.

With that, add additional checks when this is called, in order
to ensure that errors will be properly addressed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 27 ++++++++++++++-----
 drivers/media/platform/atmel/atmel-isi.c      | 19 ++++++++++---
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index fe3ec8d0eaee..02543fe42e9d 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -294,9 +294,13 @@ static int isc_wait_clk_stable(struct clk_hw *hw)
 static int isc_clk_prepare(struct clk_hw *hw)
 {
 	struct isc_clk *isc_clk = to_isc_clk(hw);
+	int ret;
 
-	if (isc_clk->id == ISC_ISPCK)
-		pm_runtime_get_sync(isc_clk->dev);
+	if (isc_clk->id == ISC_ISPCK) {
+		ret = pm_runtime_resume_and_get(isc_clk->dev);
+		if (ret < 0)
+			return 0;
+	}
 
 	return isc_wait_clk_stable(hw);
 }
@@ -353,9 +357,13 @@ static int isc_clk_is_enabled(struct clk_hw *hw)
 {
 	struct isc_clk *isc_clk = to_isc_clk(hw);
 	u32 status;
+	int ret;
 
-	if (isc_clk->id == ISC_ISPCK)
-		pm_runtime_get_sync(isc_clk->dev);
+	if (isc_clk->id == ISC_ISPCK) {
+		ret = pm_runtime_resume_and_get(isc_clk->dev);
+		if (ret < 0)
+			return 0;
+	}
 
 	regmap_read(isc_clk->regmap, ISC_CLKSR, &status);
 
@@ -807,7 +815,9 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_start_stream;
 	}
 
-	pm_runtime_get_sync(isc->dev);
+	ret = pm_runtime_resume_and_get(isc->dev);
+	if (ret < 0)
+		goto err_pm_get;
 
 	ret = isc_configure(isc);
 	if (unlikely(ret))
@@ -838,7 +848,7 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_configure:
 	pm_runtime_put_sync(isc->dev);
-
+err_pm_get:
 	v4l2_subdev_call(isc->current_subdev->sd, video, s_stream, 0);
 
 err_start_stream:
@@ -1809,6 +1819,7 @@ static void isc_awb_work(struct work_struct *w)
 	u32 baysel;
 	unsigned long flags;
 	u32 min, max;
+	int ret;
 
 	/* streaming is not active anymore */
 	if (isc->stop)
@@ -1831,7 +1842,9 @@ static void isc_awb_work(struct work_struct *w)
 	ctrls->hist_id = hist_id;
 	baysel = isc->config.sd_format->cfa_baycfg << ISC_HIS_CFG_BAYSEL_SHIFT;
 
-	pm_runtime_get_sync(isc->dev);
+	ret = pm_runtime_resume_and_get(isc->dev);
+	if (ret < 0)
+		return;
 
 	/*
 	 * only update if we have all the required histograms and controls
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 0514be6153df..6a433926726d 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -422,7 +422,9 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct frame_buffer *buf, *node;
 	int ret;
 
-	pm_runtime_get_sync(isi->dev);
+	ret = pm_runtime_resume_and_get(isi->dev);
+	if (ret < 0)
+		return ret;
 
 	/* Enable stream on the sub device */
 	ret = v4l2_subdev_call(isi->entity.subdev, video, s_stream, 1);
@@ -782,9 +784,10 @@ static int isi_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
-static void isi_camera_set_bus_param(struct atmel_isi *isi)
+static int isi_camera_set_bus_param(struct atmel_isi *isi)
 {
 	u32 cfg1 = 0;
+	int ret;
 
 	/* set bus param for ISI */
 	if (isi->pdata.hsync_act_low)
@@ -801,12 +804,16 @@ static void isi_camera_set_bus_param(struct atmel_isi *isi)
 	cfg1 |= ISI_CFG1_THMASK_BEATS_16;
 
 	/* Enable PM and peripheral clock before operate isi registers */
-	pm_runtime_get_sync(isi->dev);
+	ret = pm_runtime_resume_and_get(isi->dev);
+	if (ret < 0)
+		return ret;
 
 	isi_writel(isi, ISI_CTRL, ISI_CTRL_DIS);
 	isi_writel(isi, ISI_CFG1, cfg1);
 
 	pm_runtime_put(isi->dev);
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------*/
@@ -1085,7 +1092,11 @@ static int isi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		dev_err(isi->dev, "No supported mediabus format found\n");
 		return ret;
 	}
-	isi_camera_set_bus_param(isi);
+	ret = isi_camera_set_bus_param(isi);
+	if (ret) {
+		dev_err(isi->dev, "Can't wake up device\n");
+		return ret;
+	}
 
 	ret = isi_set_default_fmt(isi);
 	if (ret) {
-- 
2.30.2

