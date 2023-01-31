Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4384683661
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbjAaTVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjAaTVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:21:12 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EFF59B4C
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:21:04 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so13257517wmb.2
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iqMwjkZPhZJ3cGG7p2ATQbb1Iz8vPEA/Svjw84DMf8=;
        b=T0l7WtiHYwPy9jMqOnQzIz7GdDoXkLt1eZMkX8cxkp1OoefmCtMeHwzymfUF0FkfFx
         SKvdg/1xTvh69NCpC156rBZW/n5yS+PIm/KfIIJ7kozPqv6JOBGgYy4PpX1OrDy9xf7/
         u8eYphYEvwa2mw0ypyb5yYjouiIcFUDRLm02O2oQzHcrejS6riAH0r+XJZ/5eO94irAj
         R2GXe0nNkikQBWSS86Tpc2Oyt7sYUHiC96eUOX54b9jv49fgIBC5BezWRwZf3sh0yTCY
         Mn7lsgmyrh4saOpC2+0j1ArT4ILP3kd1MuJOvfVg+w8+qzQote2yoNOEYB8emYTD500g
         b7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iqMwjkZPhZJ3cGG7p2ATQbb1Iz8vPEA/Svjw84DMf8=;
        b=zTscYsrzVcP6L/PzmIrsmzbqu+MPkqKvsXgF+38j/qjMtixa0tuap+KC9Ax0lEEJfi
         uedWU3dMWghPbnpvRa0qoREE87ah4EA8gAE51y1yY7C5h7Tv2otxG24l/jrsPVBfekOI
         PCm/boVyaaAqF1N3Pblv18JfOj3oI+mWodeh3wIV+HFU09w39VgTWObgTyuZD7N9H7UK
         uEzX3/xERNy0xBtVUjxarfp7Edt7Kz0fSJOHbxxCXymH36icHXe6B7mFslJfeQwbjZwo
         aIWC8RCQiODveiQk0+RlDXX/NVnMcflxEZhnQj8GZF04MkAnwwr2MGnCQZGdOFwfqzum
         shDQ==
X-Gm-Message-State: AO0yUKUNalSiJnKJMStJpesBNVDiRhMMUueIR+1rG94SFspH/3a1ulKW
        f7yUqNKvxIsFIh8eDPhRXI1sLQ==
X-Google-Smtp-Source: AK7set8Cg5DRumtVJEsvTwN8HIWFiGyugNdx8HFgOxfLP5KNV2a79LDC93so9I6tArlGohLuN7yZdA==
X-Received: by 2002:a05:600c:2057:b0:3dd:1b3c:1ca2 with SMTP id p23-20020a05600c205700b003dd1b3c1ca2mr5882381wmg.22.1675192862669;
        Tue, 31 Jan 2023 11:21:02 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:21:02 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 09/11] media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
Date:   Tue, 31 Jan 2023 19:20:14 +0000
Message-Id: <20230131192016.3476937-10-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
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
---
 drivers/media/i2c/imx290.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 3413d83369ba..5202ef3cc3e6 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -219,7 +219,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
  */
 
 static const struct imx290_regval imx290_global_init_settings[] = {
-	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
 	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
-- 
2.34.1

