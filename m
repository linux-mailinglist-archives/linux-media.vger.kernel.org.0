Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5589A716B19
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbjE3RbJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233483AbjE3RbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:31:01 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6389C9C
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:46 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30ae967ef74so1909303f8f.0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467845; x=1688059845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdxllUf7XSE8wufKDBQEcR0WBJJ3JohUaq1pMuVJA4k=;
        b=MLURZDEdQlK9LLDCDtXuLilnaCnp3X6ACo+gKLe1VQ6z2UU+j7mLla1lfX3j0ep0wo
         SAEy12NX9WIhU/DDIzWiC9ixcp4woyMLhtLGlx8kFXPBryLU4j4zSAmlAMVyjcO9z101
         aVrC/2aiOAOcKDa9dwq3oOHPw1lgCsSqTLyykodEAAcw32DWun+ntwZ0Pk0m0Z8vq9s3
         7UD4sUOpNrZzQWl3Hgn+SVhjMWUZfnl4Ki87XCaAG7QcEVNUeenFymFhYYQ7Zrl38doV
         N5ODZo67oqKqpJ/OS6/m6etDw3VDqfB4ZhgELlZL5MlXQfHfoIhml1B0dotdEQWjj/kx
         HoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467845; x=1688059845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdxllUf7XSE8wufKDBQEcR0WBJJ3JohUaq1pMuVJA4k=;
        b=RbclCGAeP5ZPVl3AlfJEv1DafkwOSEY6kFZsjIVTpPQidj0b5Y65e/K8EN9aZEfQ0m
         40KduKgEZsrFBQ+vrt+vP0OQyyB5vqQ5BD03GgHXN3K4MNVbfXbwuOSxQ2HAox0cBWB8
         Yi7wT3NZuNnCNvJ4LLVqlQhFLfewC7tBbngvWGQqU1VS/RM3C68ixbkxWX96mgwk5+3F
         y3Tk5QN2JWe6utia2Y1iJGq5n8MSmoUB+JZhmWIojTOmC8QxVvoNumCePKPOo0twePk8
         2gcDn9VNy1zKPH7hl+CFDGeRO3Tp+Usr58ynJ/fJPb3vCs5hp+iZ3K3f/wdEIiUyKzBz
         OnwQ==
X-Gm-Message-State: AC+VfDyoDiYUV0dQciDcKfKnDB2HhtrFZgTifyOm4T9OB3TfOF3s0odl
        LwxGMqVrVPVC2CpybJoeDHAZWpCtvmTxGSyDoXc=
X-Google-Smtp-Source: ACHHUZ5Z++0LqzBzqc+b0LusLAVGSGtYlS1+lsiiPVIgoqOh8u+bHjL6M1mhHU+8IWr7KIe+ZgsDVQ==
X-Received: by 2002:adf:fe4d:0:b0:30a:d4e3:8a08 with SMTP id m13-20020adffe4d000000b0030ad4e38a08mr2055564wrs.71.1685467844992;
        Tue, 30 May 2023 10:30:44 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:44 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 14/21] media: i2c: imx258: Add support for long exposure modes
Date:   Tue, 30 May 2023 18:29:53 +0100
Message-Id: <20230530173000.3060865-15-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor has a register CIT_LSHIFT which extends the exposure
and frame times by the specified power of 2 for longer
exposure times.

Add support for this by configuring this register via V4L2_CID_VBLANK
and extending the V4L2_CID_EXPOSURE range accordingly.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index f5199e3243e8..1e424058fcb9 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -69,6 +69,10 @@
 #define IMX258_HDR_RATIO_STEP		1
 #define IMX258_HDR_RATIO_DEFAULT	0x0
 
+/* Long exposure multiplier */
+#define IMX258_LONG_EXP_SHIFT_MAX	7
+#define IMX258_LONG_EXP_SHIFT_REG	0x3002
+
 /* Test Pattern Control */
 #define IMX258_REG_TEST_PATTERN		0x0600
 
@@ -629,6 +633,8 @@ struct imx258 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	/* Current long exposure factor in use. Set through V4L2_CID_VBLANK */
+	unsigned int long_exp_shift;
 
 	/* Current mode */
 	const struct imx258_mode *cur_mode;
@@ -793,6 +799,26 @@ static void imx258_adjust_exposure_range(struct imx258 *imx258)
 				 exposure_def);
 }
 
+static int imx258_set_frame_length(struct imx258 *imx258, unsigned int val)
+{
+	int ret;
+
+	imx258->long_exp_shift = 0;
+
+	while (val > IMX258_VTS_MAX) {
+		imx258->long_exp_shift++;
+		val >>= 1;
+	}
+
+	ret = imx258_write_reg(imx258, IMX258_REG_VTS,
+			       IMX258_REG_VALUE_16BIT, val);
+	if (ret)
+		return ret;
+
+	return imx258_write_reg(imx258, IMX258_LONG_EXP_SHIFT_REG,
+				IMX258_REG_VALUE_08BIT, imx258->long_exp_shift);
+}
+
 static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx258 *imx258 =
@@ -823,7 +849,7 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE:
 		ret = imx258_write_reg(imx258, IMX258_REG_EXPOSURE,
 				IMX258_REG_VALUE_16BIT,
-				ctrl->val);
+				ctrl->val >> imx258->long_exp_shift);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		ret = imx258_update_digital_gain(imx258, IMX258_REG_VALUE_16BIT,
@@ -855,9 +881,8 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		break;
 	case V4L2_CID_VBLANK:
-		ret = imx258_write_reg(imx258, IMX258_REG_VTS,
-				       IMX258_REG_VALUE_16BIT,
-				       imx258->cur_mode->height + ctrl->val);
+		ret = imx258_set_frame_length(imx258,
+					      imx258->cur_mode->height + ctrl->val);
 		break;
 	default:
 		dev_info(&client->dev,
@@ -983,8 +1008,9 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 			     imx258->cur_mode->height;
 		__v4l2_ctrl_modify_range(
 			imx258->vblank, vblank_min,
-			IMX258_VTS_MAX - imx258->cur_mode->height, 1,
-			vblank_def);
+			((1 << IMX258_LONG_EXP_SHIFT_MAX) * IMX258_VTS_MAX) -
+						imx258->cur_mode->height,
+			1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx258->vblank, vblank_def);
 		h_blank =
 			imx258->link_freq_configs[mode->link_freq_index].pixels_per_line
-- 
2.25.1

