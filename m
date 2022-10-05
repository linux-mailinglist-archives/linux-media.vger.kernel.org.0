Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D385F5777
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbiJEP27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbiJEP24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:56 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFFD726AC
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:54 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bu30so6600520wrb.8
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XxqpkwTUgbj02jaJPTOUGxI3NiIufCRVkxD/M+na3eo=;
        b=lanMOQAuze+cNBEAFpqsWqUFCxMWTRd1+/s6a/kds8eWz9yfCHliRlXxusxHlBBBiA
         F2GNdhBVwXFlfz/1+nwQlrmRXteOhz7VKrJ8IY/LNpRHH21IKOWYMkvrL4KQ0FOiHFUF
         MFNUX8Xvw0n3Pwxdt0GiaMyoB1G9MpxRUVFt6HBmTwZ/LyVsfiIrGuAARi3vXg7XQfzq
         jSdrh/zNUIqU0O9Zgni23njcBRvx8SVGcuri3aPJTYYOpdeNwmqtheRXzwqsJ5ITwldy
         TS/wcl1tZJa5M/HI/UgZERg9sm7s2z20Uh02aGm39XKBV9p5vQWzLVTrlHubfIdadkAh
         guPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XxqpkwTUgbj02jaJPTOUGxI3NiIufCRVkxD/M+na3eo=;
        b=usVoNoh6+YO6WOBplkg5rAcKIWnO23FWup37a17wnV8S6IPZLdMThg+7Py41XfO2uk
         So5QS67iLoB4DBjpcrde/kRd3GA6KyrkL2TdL5y8CJKfwS3cCjjKR+owiX5m8rHcl7X5
         fGjsI/UuGqGkM7RzmeHruS5vDTzuR95rk0l+FquC6CDXi0g+Cdir6HnyMdr5wkRjqHdu
         Z15+92dN+5SCfvkYRw2kiMDnzBOzBS1IExNVFc7DNSP81/hDERhaeHys1qurBY0BmR/B
         3YROAQCtpuhpVMn8wRFJsoBGvqf2mPAh588lTKTOn909tedQsLIbtXj3VjlWSaCRHMup
         nBUw==
X-Gm-Message-State: ACrzQf1tyyCYFBMwDuDz7OQ/LRMVPlxmZD1qpWpi+NStlmI9wMfxLFMa
        dTM/rOSlYzerAQqleMIoX1hDQ9/ufmuPSw==
X-Google-Smtp-Source: AMsMyM6VWNqUBXnnKFEtWsO2KAX13Jo+UWYpDChQvPjTEpSyYln5r9eTRB5kcy0emEwkUkZTeJUypA==
X-Received: by 2002:a5d:4c44:0:b0:22e:3503:41bf with SMTP id n4-20020a5d4c44000000b0022e350341bfmr228867wrt.0.1664983734533;
        Wed, 05 Oct 2022 08:28:54 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:53 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 09/16] media: i2c: ov9282: Add the properties from fwnode
Date:   Wed,  5 Oct 2022 16:28:02 +0100
Message-Id: <20221005152809.3785786-10-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_ctrl_new_fwnode_properties to add V4L2_CID_CAMERA_ORIENTATION
and V4L2_CID_CAMERA_SENSOR_ROTATION.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 334b31af34a4..183283d191b1 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -989,10 +989,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
 	const struct ov9282_mode *mode = ov9282->cur_mode;
+	struct v4l2_fwnode_device_properties props;
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 6);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
 	if (ret)
 		return ret;
 
@@ -1050,7 +1051,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	if (ov9282->hblank_ctrl)
 		ov9282->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	if (ctrl_hdlr->error) {
+	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
+	if (!ret) {
+		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
+		v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov9282_ctrl_ops,
+						&props);
+	}
+
+	if (ctrl_hdlr->error || ret) {
 		dev_err(ov9282->dev, "control init failed: %d",
 			ctrl_hdlr->error);
 		v4l2_ctrl_handler_free(ctrl_hdlr);
-- 
2.34.1

