Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3F368A2D0
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbjBCTS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbjBCTSx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:53 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DB580171
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:41 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r27so1726947wrr.1
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BY1kwD8rg2QYC3ufnAOmog3UEo3pjbjiA4aP6onfDM=;
        b=fpSYIo+TEsYHNjq9KJcvz13F123yLaIWlGmF4zKgnTga2NQVnLgiAXDfAbNy+8S2p8
         bGWFeBGU105e1HSX8FjuWJVi4tfepx/d3wyxUxOlwMY/iiYPHsEB3tcZp9vOqNo68RNu
         +WySZ/MkNgaYzJEOZNsgjIqsmqLmt5yZ/EMhrEm25Knoalh/zuAsgVy78es8n5GCObr3
         2q/TuSJ+gr2Ymrmh8qgsUGjQ+Kwu7MPuExE380G0Xk7+B3brucZ3I5UZb5JYO4KpwWZq
         kQMXEYVSjdMjyCQmtbAON6IMA+1HHxVzCjEyGWJ99dvEWR6RCrVgmtv4rRQ3ZRxVfKa9
         jkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BY1kwD8rg2QYC3ufnAOmog3UEo3pjbjiA4aP6onfDM=;
        b=v/92jkhaiCQsH6JWHnGG1IU6uewjP6kbYR8Q83KoIgjIoUQA0pZpXZ+h3UeNHk6xOY
         ZDARNbPhSuuXq9hqiHZ8JLDc8fK6Hm5GxykwtsCLLkgJ0XVxU+y4km+RjfbiWvCBaL8l
         qejx26Xv4fLuLXkcrokh5hI2mqaDGaLA6YDdOxm9r3ylZLXvshFXu2P3O4dS/mcEHZWM
         xL4XytjlkQseZYJ/2oUECmcLaw6w2jtPo1I5LIuReKB0ogomhUDisH4ZP0jgFj4EhMNi
         WXSnS1Qqu/C6GMZVJJJ7yiOiOynwGAoNMuODB91sZsBhPIhxTjb6NM+ffvafFPHxAaWp
         sHZw==
X-Gm-Message-State: AO0yUKWOykbLcJ3t8vCop5o7MxZqEf0IdDGH8lI7xxK+QNVEr5aQV28H
        BkphFmkoor5c664yOvNVMSypeg==
X-Google-Smtp-Source: AK7set9UAMy6kY4sTBto8t1HcsGSgOmjVlK4qAMQMtvputCWRDts4oyjO2t/d4TkDAp+phiQOd7nUw==
X-Received: by 2002:a5d:4352:0:b0:2be:12a8:9f75 with SMTP id u18-20020a5d4352000000b002be12a89f75mr8585214wrr.55.1675451920554;
        Fri, 03 Feb 2023 11:18:40 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:39 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 10/13] media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
Date:   Fri,  3 Feb 2023 19:18:08 +0000
Message-Id: <20230203191811.947697-11-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
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

IMX290_CTRL_07 was written from both imx290_global_init_settings
and imx290_1080p_settings and imx290_720p_settings.

Remove it from imx290_global_init_settings as the setting varies
based on the mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6235021a8d24..a74930e86a6c 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -238,7 +238,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
  */
 
 static const struct imx290_regval imx290_global_init_settings[] = {
-	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
 	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
-- 
2.34.1

