Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA17677BDA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbjAWMzH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjAWMyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0896D10242
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j34uTCjaStM9stIlocCubwOtzPqdi2G8sufxTZVuEXo=;
        b=IJQI9/NfhZEL+oVUf13Y+lrSKu1JzPFJ6x3U2C6W20A6fUQFcipwHfvY9kvKeds2wETUs6
        n+p0KnQQvVRf81pafLGIwoL25mN6SAWtc+YYH8MjCn29Q05kilLY8Ie8Svq93EjVsfrvo1
        RKRM3XotuYFKiITR7+thvj8PLAIae3w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-e5w1VA44PG2ypeD77SSN2A-1; Mon, 23 Jan 2023 07:53:48 -0500
X-MC-Unique: e5w1VA44PG2ypeD77SSN2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC1DB802D1B;
        Mon, 23 Jan 2023 12:53:47 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6E7D9C15BA0;
        Mon, 23 Jan 2023 12:53:45 +0000 (UTC)
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
Subject: [PATCH 32/57] media: atomisp: ov2680: Add exposure and gain controls
Date:   Mon, 23 Jan 2023 13:51:40 +0100
Message-Id: <20230123125205.622152-33-hdegoede@redhat.com>
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

Add exposure and gain controls. This allows controlling
the exposure and gain through standard v4l2 IOCTLs.

Note the register defines for the exposure and gain registers
are renamed to match the datasheet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 27 +++++++++++++++----
 drivers/staging/media/atomisp/i2c/ov2680.h    |  9 +++----
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index d508c02444eb..14002a1c22d2 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -117,6 +117,16 @@ static int ov2680_set_hflip(struct ov2680_device *sensor, s32 val)
 	return 0;
 }
 
+static int ov2680_exposure_set(struct ov2680_device *sensor, u32 exp)
+{
+	return ovxxxx_write_reg24(sensor->client, OV2680_REG_EXPOSURE_PK_HIGH, exp << 4);
+}
+
+static int ov2680_gain_set(struct ov2680_device *sensor, u32 gain)
+{
+	return ovxxxx_write_reg16(sensor->client, OV2680_REG_GAIN_PK, gain);
+}
+
 static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -135,6 +145,12 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_HFLIP:
 		ret = ov2680_set_hflip(sensor, ctrl->val);
 		break;
+	case V4L2_CID_EXPOSURE:
+		ret = ov2680_exposure_set(sensor, ctrl->val);
+		break;
+	case V4L2_CID_GAIN:
+		ret = ov2680_gain_set(sensor, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -392,10 +408,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		goto err;
 	}
 
-	/*
-	 * recall flip functions to avoid flip registers
-	 * were overridden by default setting
-	 */
+	/* Restore value of all ctrls */
 	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
 	if (ret < 0)
 		goto err;
@@ -634,13 +647,17 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	int exp_max = sensor->res->lines_per_frame - OV2680_INTEGRATION_TIME_MARGIN;
 
-	v4l2_ctrl_handler_init(hdl, 2);
+	v4l2_ctrl_handler_init(hdl, 4);
 
 	hdl->lock = &sensor->input_lock;
 
 	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
 	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
+					    0, exp_max, 1, exp_max);
+	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 1023, 1, 250);
 
 	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 45eb1f93b847..e3ad20a7ffd5 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -90,11 +90,8 @@
 
 #define OV2680_GROUP_ACCESS							0x3208 /*Bit[7:4] Group control, Bit[3:0] Group ID*/
 
-#define OV2680_EXPOSURE_H							0x3500 /*Bit[3:0] Bit[19:16] of exposure, remaining 16 bits lies in Reg0x3501&Reg0x3502*/
-#define OV2680_EXPOSURE_M							0x3501
-#define OV2680_EXPOSURE_L							0x3502
-#define OV2680_AGC_H								0x350A /*Bit[1:0] means Bit[9:8] of gain*/
-#define OV2680_AGC_L								0x350B /*Bit[7:0] of gain*/
+#define OV2680_REG_EXPOSURE_PK_HIGH		0x3500
+#define OV2680_REG_GAIN_PK			0x350a
 
 #define OV2680_HORIZONTAL_START_H					0x3800 /*Bit[11:8]*/
 #define OV2680_HORIZONTAL_START_L					0x3801 /*Bit[7:0]*/
@@ -172,6 +169,8 @@ struct ov2680_device {
 		struct v4l2_ctrl_handler handler;
 		struct v4l2_ctrl *hflip;
 		struct v4l2_ctrl *vflip;
+		struct v4l2_ctrl *exposure;
+		struct v4l2_ctrl *gain;
 	} ctrls;
 };
 
-- 
2.39.0

