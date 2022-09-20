Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B165BD9BE
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 04:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiITCA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 22:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiITCA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 22:00:26 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED143D5B1
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 19:00:24 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id w2so1418939pfb.0
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 19:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=EjORqgjc+/XhQqghTBNI0hH8VFbCYaiJSHUSAzsHW/I=;
        b=dGZ18XozA7N0XnASUbI7DGMsKYTkXd2yFvJICwNNaOaJH4dpJDcjL27zwe6QeC3VCp
         M8Gy8lGui2ZVOGDeboW8GStuOY3D/vHOgXU4MK249GOOYUGFyAuXIK7XGA4i5qYz/qDh
         5XBadz57bCkwq3wujP2qDkjmeN60exaMcgAiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=EjORqgjc+/XhQqghTBNI0hH8VFbCYaiJSHUSAzsHW/I=;
        b=xrszWF+a7Y2X3j+Xe2UXlFkbCdI3A02O6omhJGEoMIcgCw85THujDJzPIJTuDQ5K1Q
         J7p6HgSgDpAzqyJgg6k+Tk67xb2nNEEankF1+LCKUd1lE53zfA6/rCGryRXggy5dDMSV
         DhyPY+gZ+xiGhX4jDylnGTA6qise20P1slEGX76JQumWbcEeOMuG+aiNJcgKp2p7354v
         vTr1BYiSDqIDKKQG3cdcmOR50e7KW3OioroeolUOUQv32zMB0ydBFldWJxKgPWBvGPaX
         FYNJc1jQdWNVQW0JRM2NSlI0N6pzCYiGY3pNnXc4FpKWpdcg/jRdRKfsxBouDk4z0MTK
         YHUA==
X-Gm-Message-State: ACrzQf1/fN7dw0HdpHIBbPWB0YXQQ17F2L3qOLCZcOFmZipEJEXoGQ2W
        0nu6Otu5Zjq/YiiMFGVVdANNAA==
X-Google-Smtp-Source: AMsMyM58X9k8GcTeKgoegI2mdrKD6liuT+rLE15aHV+Fgb9jLF6PqaA/CefLL5MmiIGmP6MmFzcv8w==
X-Received: by 2002:a63:778d:0:b0:438:5c5b:f2ac with SMTP id s135-20020a63778d000000b004385c5bf2acmr18209126pgc.401.1663639224075;
        Mon, 19 Sep 2022 19:00:24 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f7fc:1606:58e3:671d])
        by smtp.gmail.com with ESMTPSA id z30-20020aa7991e000000b0053bf1f90188sm68003pff.176.2022.09.19.19.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 19:00:23 -0700 (PDT)
From:   Hidenori Kobayashi <hidenorik@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hidenori Kobayashi <hidenorik@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ov8856: Add runtime PM callbacks
Date:   Tue, 20 Sep 2022 11:00:01 +0900
Message-Id: <20220920020002.710533-1-hidenorik@chromium.org>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There were no runtime PM callbacks registered, leaving regulators being
enabled while the device is suspended on DT systems. Calling existing
power controlling functions from callbacks properly turn them off/on.

Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
---
 drivers/media/i2c/ov8856.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index a9728afc81d4..3f57bc30b78b 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2200,6 +2200,26 @@ static int __maybe_unused ov8856_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused ov8856_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov8856 *ov8856 = to_ov8856(sd);
+
+	__ov8856_power_off(ov8856);
+
+	return 0;
+}
+
+static int __maybe_unused ov8856_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov8856 *ov8856 = to_ov8856(sd);
+
+	return __ov8856_power_on(ov8856);
+}
+
 static int ov8856_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
@@ -2540,6 +2560,7 @@ static int ov8856_probe(struct i2c_client *client)
 
 static const struct dev_pm_ops ov8856_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov8856_suspend, ov8856_resume)
+	SET_RUNTIME_PM_OPS(ov8856_runtime_suspend, ov8856_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_ACPI
-- 
2.37.2.789.g6183377224-goog

