Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D671E025B
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388360AbgEXTZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388351AbgEXTZ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:25:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5701CC08C5C3
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:54 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a25so6899596ljp.3
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ArHIpbhBZ4QboXR1B47LETKKz8hPypHrPsMnuHhW5Pc=;
        b=oBFl+FYPXCF2nyxMWUbG5bRYxOeXrnLcwNIOcNbWk5ote7fWi1iuH6oIHUNBiMytjf
         Lqb144emRs2uKuETQJHJ2h+qwGb7j3Gs0fzmlSKrXbKmxGi192Z4hTbMU+tvRx/lPlhm
         rI8UWpO2x/VZpLDOCAmwB7vORkosPtFSeqPZ2rlL8PF69L4lyvn5HN8oNKWKDtvNiqVU
         ZzhJphVkNtcB1hPa5X1uOcsystaTuCU3yCmwTvETURKyYsb0vkCWjVXhaUH7Hy1rb9GD
         zr4SsTBhTokVxMCiUD/3pdlEeaXfxxjUuJTamP1EG8nr00iS/PgVG6DaIaQD8gV3kGjo
         Qi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ArHIpbhBZ4QboXR1B47LETKKz8hPypHrPsMnuHhW5Pc=;
        b=nvz25+OmmYP/Ar14hEh6pvUkIXzNp/+QhLCY9O0HPebzkfbBJYOnUytlqoa18j0Tpr
         QuQF8Na85bIiPhHrRwJ3iUczhtQylfkCmoezLLSWnKBJ7y3jErRHsea6/HoP/vkSWuXi
         XD4aUrnxlN3LdEMoX1W6ZRvBw9Aaw7bCNiiFXJ3ZdMxU6F9PLPPhESkP7hVQcp1IEmLX
         4uQWfpLmfuj8TSeFgDY1jUQXXgrHdmua7uRsOMD8X8ha5cfG1ezNfz+7V8rz791DNZGH
         4xRb0i3L7yQhILg/VFXz6iAE8Y5tRhE867Bkd2m9BlZDGrr/9W8NW8XHG61t3Edq+GIV
         3nlA==
X-Gm-Message-State: AOAM532RQ5NOKPl0n2Ph5nTWtv7wIBgymtbxB5mAg2vdkIBK8TlStG9g
        dXGtTGglUAWc0St8RF6Kx4GkNQ==
X-Google-Smtp-Source: ABdhPJxyBtmtLkqVgMFpLolLOPlu5o8eTu0WHSm7CDTFILzmDEAVdYLLTsHq30+ePOwEbD75fjQSVA==
X-Received: by 2002:a2e:8008:: with SMTP id j8mr12789036ljg.72.1590348352874;
        Sun, 24 May 2020 12:25:52 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:52 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 08/10] media: i2c: imx290: Add support to enumerate all frame sizes
Date:   Sun, 24 May 2020 22:25:03 +0300
Message-Id: <20200524192505.20682-9-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Add support to enumerate all frame sizes supported by IMX290. This is
required for using with userspace tools such as libcamera.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6e70ff22bc5f..88850f3b1427 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -471,6 +471,25 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx290_enum_frame_size(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if ((fse->code != imx290_formats[0].code) &&
+	    (fse->code != imx290_formats[1].code))
+		return -EINVAL;
+
+	if (fse->index >= ARRAY_SIZE(imx290_modes))
+		return -EINVAL;
+
+	fse->min_width = imx290_modes[fse->index].width;
+	fse->max_width = imx290_modes[fse->index].width;
+	fse->min_height = imx290_modes[fse->index].height;
+	fse->max_height = imx290_modes[fse->index].height;
+
+	return 0;
+}
+
 static int imx290_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_pad_config *cfg,
 			  struct v4l2_subdev_format *fmt)
@@ -850,6 +869,7 @@ static const struct v4l2_subdev_video_ops imx290_video_ops = {
 static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
 	.init_cfg = imx290_entity_init_cfg,
 	.enum_mbus_code = imx290_enum_mbus_code,
+	.enum_frame_size = imx290_enum_frame_size,
 	.get_fmt = imx290_get_fmt,
 	.set_fmt = imx290_set_fmt,
 };
-- 
2.17.1

