Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7D4731B07
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344997AbjFOOP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344989AbjFOOPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA502945
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5QTW7OiOI+NHnIRuohWDP2oA9YZzKZJ4W9hrsZrn0uQ=;
        b=hz4ndKCP/8EDjKju2bbULq3y9fWa1jhfZ7eMTlgq7lk/Rfiue6gFuwLI6G65kMEZWhUZ6w
        JQvVATTWVVbeZCOwOyw3dx/cNDIZ/VbwqXMTeZ/SeiPkMWGkfsvEtHOpq2A1KkmP2UcEY2
        j2i4UuTJhmBf6igGWwO+y2WnD1TDykk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-_1gFLi32N8-N8-Kv5Y0dgQ-1; Thu, 15 Jun 2023 10:14:23 -0400
X-MC-Unique: _1gFLi32N8-N8-Kv5Y0dgQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79788810BBE;
        Thu, 15 Jun 2023 14:14:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6612848FB01;
        Thu, 15 Jun 2023 14:14:07 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 13/28] media: ov2680: Drop is_enabled flag
Date:   Thu, 15 Jun 2023 16:13:34 +0200
Message-Id: <20230615141349.172363-14-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With runtime-pm it is guaranteed that ov2680_power_on() and
ov2680_power_off() will always be called in a balanced way;
and the is_enabled check in ov2680_s_ctrl() can be replaced
by checking the runtime-suspend state.

So there is no more need for the is_enabled flag, remove it.

While at it also make sure that flip control changes while
suspended still lead to the bayer-order getting updated so
that get_fmt returns the correct bayer-order.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 56aaf67c1d82..b7c23286700e 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -100,7 +100,6 @@ struct ov2680_dev {
 	struct gpio_desc		*pwdn_gpio;
 	struct mutex			lock; /* protect members */
 
-	bool				is_enabled;
 	bool				is_streaming;
 
 	struct ov2680_ctrls		ctrls;
@@ -312,14 +311,9 @@ static int ov2680_stream_disable(struct ov2680_dev *sensor)
 
 static int ov2680_power_off(struct ov2680_dev *sensor)
 {
-	if (!sensor->is_enabled)
-		return 0;
-
 	clk_disable_unprepare(sensor->xvclk);
 	ov2680_power_down(sensor);
 	regulator_bulk_disable(OV2680_NUM_SUPPLIES, sensor->supplies);
-	sensor->is_enabled = false;
-
 	return 0;
 }
 
@@ -327,9 +321,6 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 {
 	int ret;
 
-	if (sensor->is_enabled)
-		return 0;
-
 	ret = regulator_bulk_enable(OV2680_NUM_SUPPLIES, sensor->supplies);
 	if (ret < 0) {
 		dev_err(sensor->dev, "failed to enable regulators: %d\n", ret);
@@ -353,8 +344,6 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 	if (ret < 0)
 		goto err_disable_regulators;
 
-	sensor->is_enabled = true;
-
 	return 0;
 
 err_disable_regulators:
@@ -541,26 +530,37 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
+	int ret;
 
-	if (!sensor->is_enabled)
+	/* Only apply changes to the controls if the device is powered up */
+	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
+		ov2680_set_bayer_order(sensor, &sensor->fmt);
 		return 0;
+	}
 
 	switch (ctrl->id) {
 	case V4L2_CID_GAIN:
-		return ov2680_gain_set(sensor, ctrl->val);
+		ret = ov2680_gain_set(sensor, ctrl->val);
+		break;
 	case V4L2_CID_EXPOSURE:
-		return ov2680_exposure_set(sensor, ctrl->val);
+		ret = ov2680_exposure_set(sensor, ctrl->val);
+		break;
 	case V4L2_CID_VFLIP:
-		return ov2680_set_vflip(sensor, ctrl->val);
+		ret = ov2680_set_vflip(sensor, ctrl->val);
+		break;
 	case V4L2_CID_HFLIP:
-		return ov2680_set_hflip(sensor, ctrl->val);
+		ret = ov2680_set_hflip(sensor, ctrl->val);
+		break;
 	case V4L2_CID_TEST_PATTERN:
-		return ov2680_test_pattern_set(sensor, ctrl->val);
+		ret = ov2680_test_pattern_set(sensor, ctrl->val);
+		break;
 	default:
+		ret = -EINVAL;
 		break;
 	}
 
-	return -EINVAL;
+	pm_runtime_put(sensor->sd.dev);
+	return ret;
 }
 
 static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
-- 
2.40.1

