Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B70677BDD
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjAWMzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjAWMyz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F6E12066
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mrke5JufIOmcGBUjvE3Pl/Ei2jA/GlG1QFPe4gfBo2o=;
        b=fg5fyv94sPn2pKAhEZQjY70WBGjwqmfcX+tWGHHu/EUtgnpReZmt+G5dzmWmUrH/Y/56Nx
        21N6hNZ/Bnx6y8Hg/HvcoV+6ejkBzc1+vGK9yfCYLTPI5IxrNydA74zxizUGFD4QfLDfUE
        00xabgpDEqvL8lVkQID+Eg9502lXyM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-Ld_NtXkoPhC6kk6NVZQIyg-1; Mon, 23 Jan 2023 07:53:51 -0500
X-MC-Unique: Ld_NtXkoPhC6kk6NVZQIyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A02FC8853BA;
        Mon, 23 Jan 2023 12:53:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E842C15BA0;
        Mon, 23 Jan 2023 12:53:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 33/57] media: atomisp: ov2680: Add test pattern control
Date:   Mon, 23 Jan 2023 13:51:41 +0100
Message-Id: <20230123125205.622152-34-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a test pattern control. This is a 1:1 copy of the test pattern
control in the main drivers/media/i2c/ov2680.c driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 33 +++++++++++++++++++
 drivers/staging/media/atomisp/i2c/ov2680.h    |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 14002a1c22d2..6ca2a5bb0700 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -127,6 +127,24 @@ static int ov2680_gain_set(struct ov2680_device *sensor, u32 gain)
 	return ovxxxx_write_reg16(sensor->client, OV2680_REG_GAIN_PK, gain);
 }
 
+static int ov2680_test_pattern_set(struct ov2680_device *sensor, int value)
+{
+	int ret;
+
+	if (!value)
+		return ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), 0);
+
+	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, 0x03, value - 1);
+	if (ret < 0)
+		return ret;
+
+	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), BIT(7));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -151,6 +169,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_GAIN:
 		ret = ov2680_gain_set(sensor, ctrl->val);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov2680_test_pattern_set(sensor, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -644,6 +665,13 @@ static const struct v4l2_subdev_ops ov2680_ops = {
 
 static int ov2680_init_controls(struct ov2680_device *sensor)
 {
+	static const char * const test_pattern_menu[] = {
+		"Disabled",
+		"Color Bars",
+		"Random Data",
+		"Square",
+		"Black Image",
+	};
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
@@ -658,6 +686,11 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
 					    0, exp_max, 1, exp_max);
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 1023, 1, 250);
+	ctrls->test_pattern =
+		v4l2_ctrl_new_std_menu_items(hdl,
+					     &ov2680_ctrl_ops, V4L2_CID_TEST_PATTERN,
+					     ARRAY_SIZE(test_pattern_menu) - 1,
+					     0, 0, test_pattern_menu);
 
 	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index e3ad20a7ffd5..45526477b612 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -120,6 +120,8 @@
 #define OV2680_MWB_BLUE_GAIN_H			0x5008/*0x3404*/
 #define OV2680_MWB_GAIN_MAX				0x0fff
 
+#define OV2680_REG_ISP_CTRL00			0x5080
+
 #define OV2680_START_STREAMING			0x01
 #define OV2680_STOP_STREAMING			0x00
 
@@ -171,6 +173,7 @@ struct ov2680_device {
 		struct v4l2_ctrl *vflip;
 		struct v4l2_ctrl *exposure;
 		struct v4l2_ctrl *gain;
+		struct v4l2_ctrl *test_pattern;
 	} ctrls;
 };
 
-- 
2.39.0

