Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07529716B12
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjE3RbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbjE3Ra6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:30:58 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B73D134
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f623adec61so50009685e9.0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467842; x=1688059842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZHdyOJ+1PKFCoi5csfiytpHprnnmn7Stw/wJLEp4P0=;
        b=JQ+NmQAkcys+tgj98KIqpfOZn8haR1H74JpIacxqXchxDwWLKy6annaakPl1eCMNuL
         UsdOIy+7pG9uxevuLU4USC6F3t0GU92I9MKOjf+o7RyTztZc0XkQown35sh221mnvPB0
         rvUzgzI2UNLOr+fX8YAmlNDPnISSvktP0cuRyQ7heUpRBcMIrKq/8dKROeIpRL5rQoFt
         FaC6216on1/jUHFV6LpOFcx5oqcN6CJ1OP6ECGs8fgSq53L19is0/UvUuI3khXf5Muap
         5XkQOPXErnkQs75piVCt0mDusrO6K6JP3gk/nusR9Ao441582TKpRDX1Z5gsmsDURj1M
         zzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467842; x=1688059842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZHdyOJ+1PKFCoi5csfiytpHprnnmn7Stw/wJLEp4P0=;
        b=hsYZiqR9UDa+By005M/JM2WpHXQQ3V3DpIkT7ICtSXeZCyn5BOkSX+NAJcCWGL48pA
         iYOBCBijLiCL2Rx9Dt8MswhOvGk5mtf9EM8UvzxLZ3pOTBgDjLoJyPfdj8lmKKL42qIv
         vloyAZ3Qdg/CB1Plf91atV4hWW9ByG2sOD1MSHVTHsz/2Xmo7tPWPuRTB4aJv4pciz0D
         l33Pj0gcySdPX6TAAydjAhOL9Jb7/FTksY4MNJMgs8ETp1VBPWKgIKJQJ6mthuTjy1o5
         h0MIZGX7qdtKArz+KrtAdHv/tcQGTiWUl+FwW9Y1fMi1GL1Qt/NWCR9lWSVPJ5MtgEpG
         HCvg==
X-Gm-Message-State: AC+VfDzRKzDBq1yjiT3DZVUhSo2R8d2W3mvWva74aTAoKc2hdm/mp7+H
        df2d0U1VR2E35Cn4EU0CmolLivsm78pZPtsDqiU=
X-Google-Smtp-Source: ACHHUZ7jIziN9kzE/qWPJhVT87o4BRJcIEPuXQm5VCVKWdXcIHU79lT5IzMDKkpSVo28oFCUJHztyw==
X-Received: by 2002:a7b:c048:0:b0:3f6:490:a7f3 with SMTP id u8-20020a7bc048000000b003f60490a7f3mr2400496wmc.9.1685467841764;
        Tue, 30 May 2023 10:30:41 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:41 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 10/21] media: i2c: imx258: Follow normal V4L2 behaviours for clipping exposure
Date:   Tue, 30 May 2023 18:29:49 +0100
Message-Id: <20230530173000.3060865-11-dave.stevenson@raspberrypi.com>
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

V4L2 sensor drivers are expected are expected to clip the supported
exposure range based on the VBLANK configured.
IMX258 wasn't doing that as register 0x350 (FRM_LENGTH_CTL)
switches it to a mode where frame length tracks coarse exposure time.

Disable this mode and clip the range for V4L2_CID_EXPOSURE appropriately
based on V4L2_CID_VBLANK.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 433dff7f1fa0..82ffe09e3bdc 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -37,10 +37,11 @@
 
 /* Exposure control */
 #define IMX258_REG_EXPOSURE		0x0202
+#define IMX258_EXPOSURE_OFFSET		10
 #define IMX258_EXPOSURE_MIN		4
 #define IMX258_EXPOSURE_STEP		1
 #define IMX258_EXPOSURE_DEFAULT		0x640
-#define IMX258_EXPOSURE_MAX		65535
+#define IMX258_EXPOSURE_MAX		(IMX258_VTS_MAX - IMX258_EXPOSURE_OFFSET)
 
 /* Analog gain control */
 #define IMX258_REG_ANALOG_GAIN		0x0204
@@ -366,7 +367,7 @@ static const struct imx258_reg mode_common_regs[] = {
 	{ 0x303A, 0x00 },
 	{ 0x303B, 0x10 },
 	{ 0x300D, 0x00 },
-	{ 0x0350, 0x01 },
+	{ 0x0350, 0x00 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
@@ -739,6 +740,19 @@ static int imx258_update_digital_gain(struct imx258 *imx258, u32 len, u32 val)
 	return 0;
 }
 
+static void imx258_adjust_exposure_range(struct imx258 *imx258)
+{
+	int exposure_max, exposure_def;
+
+	/* Honour the VBLANK limits when setting exposure. */
+	exposure_max = imx258->cur_mode->height + imx258->vblank->val -
+		       IMX258_EXPOSURE_OFFSET;
+	exposure_def = min(exposure_max, imx258->exposure->val);
+	__v4l2_ctrl_modify_range(imx258->exposure, imx258->exposure->minimum,
+				 exposure_max, imx258->exposure->step,
+				 exposure_def);
+}
+
 static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx258 *imx258 =
@@ -746,6 +760,13 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	int ret = 0;
 
+	/*
+	 * The VBLANK control may change the limits of usable exposure, so check
+	 * and adjust if necessary.
+	 */
+	if (ctrl->id == V4L2_CID_VBLANK)
+		imx258_adjust_exposure_range(imx258);
+
 	/*
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
-- 
2.25.1

