Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF15861173B
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbiJ1QPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiJ1QOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:38 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A221EF070
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:52 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so6915717wms.0
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlkXe+L2h1h18CiDtAzOilVW1h9zgoB/5M7/SaL9hQk=;
        b=Ny8adNQ89MU6uQfuzEgWi323Wo3LwCB8VN9FJQFV6bAYLFdgHS1KfZ+AtWnCtFemfg
         B14GJoPYQnMP8bmzJS0pWD4wmNBm8Su7FDgHkM98ioaLevFd15quUIhjD4uEgoK0EstF
         LdaTZH+SmAXTiWgJFgkL980YFAG4pYLentQ8b1ibjcnstNIuti0VB8zj76DWfTz9ZnPC
         2sctOZHSAhsmQsX2s7eoGQs/F+QsathwYWep8pADxar0modluIDWfAOK+2AbLEE3dLKc
         oas5tkpAPbAQBl+6X4zuWMV8knVCGAQnyOJG+u45XAIQfNvjHlKRK5wnHNOs90RLusYo
         LSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlkXe+L2h1h18CiDtAzOilVW1h9zgoB/5M7/SaL9hQk=;
        b=u4UPAIzpyu/Gm1tK60HPIwmX9VX5olHFH/fnlVH4wMZjpyAXvNApJa/ECP5zGKuUU5
         vRzfvu6whJT8/BEVwdOocQ4+V/0zBRVeMukc/gFdo+oF0AjPC+RNZueb1pdBO4+3F++u
         dS+gJtT4+6Qlx8O8ilcDAJ7htGP3l/0CI0aN/c+aJh7FmHyMHaYWDMaYJoP0Fm7cqt7T
         RRwu7svvuvknXw2Dd0i4JiTq6jzwKrL2yUZZ7/r5KKnaVVr+b9DdWUlhsEBNxHodyl3m
         VZeyFY+25pYwcGlxYvnU5uKjZgto9CQtE7FoQ157+MtLc+beBpYynxEQ7O06adcADOt4
         vBEQ==
X-Gm-Message-State: ACrzQf0FUpBw/AJEZ0mk39AbPR2rAf3pQbqhUvzrXl9bdsgPjxDOKIO7
        ck2Gpo4F0kuSjDYxUbUyrrXT/g==
X-Google-Smtp-Source: AMsMyM7E+/a6RTLSKi+5zmlmUakYzPY/Dfdy8lk6HWgQWIDXQeWazo6Sz7YeePJoynJidOolXUZtIQ==
X-Received: by 2002:a05:600c:3d8a:b0:3c6:f241:cb36 with SMTP id bi10-20020a05600c3d8a00b003c6f241cb36mr65746wmb.115.1666973572216;
        Fri, 28 Oct 2022 09:12:52 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:51 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 09/16] media: i2c: ov9282: Add the properties from fwnode
Date:   Fri, 28 Oct 2022 17:08:55 +0100
Message-Id: <20221028160902.2696973-10-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
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
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 1637cf1177c5..889db9d105a2 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -959,10 +959,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
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
 
@@ -1020,7 +1021,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
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

