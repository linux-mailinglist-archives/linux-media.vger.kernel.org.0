Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1FC640964
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 16:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbiLBP2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 10:28:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbiLBP2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 10:28:08 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F17356EC8
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 07:28:04 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso4537891wms.4
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 07:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jW/wraYzdeVh5VN6Plj6mY5qgvxc6yfVXPI0v0RffG8=;
        b=T6xLzGf3TMqby53fsUCeMhnBP4LI2llt+uN1pGULRH5d9uNVQh8hPqHwe0h6k4IOxD
         IeTpYXRinbiXbqt19DZZaM4vu0B1g/WrhBy+BFmuCSUNrKQGG4C28H4JYKztrNSWyGYC
         dhYQsfPEypKN4tygZWW46gJlVA7z1aSX6CpwZolUfgldBblmtxeOwOo05goj5fSluUFH
         DeAvnCF3W6R7ikVH9jf5LZmVv7WckVvIX/qH9n/A4ZWs0AzAVdkoDncW0gG2FCs6mPOa
         9oBt6SPQYn0aJDkreghjgDt1ilx+xuUpqGjS5tVCruy7DWXSKF9Ht1Tp/JNAwi7ez1WT
         +iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jW/wraYzdeVh5VN6Plj6mY5qgvxc6yfVXPI0v0RffG8=;
        b=1nUMynfQk+3CnCLye4iCuGIFnIqSYKA0tpB948hLFc2midnqe9ULW9oXTuw/lj1eAD
         vv/4GBqgH4yr5Ta9RJ8m9XJ0fK2Cx0SBFC2qlHK/fbIlNYjZwNzd/3mG6WriSxycqBdI
         CkjC322G1YBT/gXTSX+OUSC+nA+HEDy0SuaWGW+myoU7i9bB3AulrZrEGA/mmBOTShd3
         gH9+bFczf5C21uGopZZtWSUwTo5cMh87Rz5q5G8nzqj9DdJdAtfJAEjeJ5ZEWAHvakyH
         Xq4j0NC0f0PAeIcSoYQAUgqbYKHanQm4dwpPA+wk3P/42HYlqlMD80/9ZwvTz4jbJTtV
         qkwA==
X-Gm-Message-State: ANoB5pnZgVPD0L4Oh0HcExT1Ag+NhL28Vklh1Gq7OscT5wE67sv9+hLD
        epVFwyHcpd8HlfIj+LgvOsT2NxibGRT/y/MRIhs=
X-Google-Smtp-Source: AA0mqf4fZ5C8H6QFWhtrNkO1yzoaXvhnD7dN9Qiu3Iz9mnwVZvXXXOJ2pgX+/+LVKFb/DX1rQWit3Q==
X-Received: by 2002:a1c:7212:0:b0:3cf:7a77:589a with SMTP id n18-20020a1c7212000000b003cf7a77589amr38989873wmc.194.1669994883057;
        Fri, 02 Dec 2022 07:28:03 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id t17-20020a05600c41d100b003cf71b1f66csm8322773wmh.0.2022.12.02.07.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 07:28:02 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 3/5] media: i2c: imx319: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Fri,  2 Dec 2022 15:27:25 +0000
Message-Id: <20221202152727.1010207-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202152727.1010207-1-dave.stevenson@raspberrypi.com>
References: <20221202152727.1010207-1-dave.stevenson@raspberrypi.com>
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

The driver changes the Bayer order based on the flips, but
does not define the control correctly with the
V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.

Add the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx319.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 245a18fb40ad..45b1b61b2880 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2328,8 +2328,12 @@ static int imx319_init_controls(struct imx319 *imx319)
 
 	imx319->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx319->hflip)
+		imx319->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	imx319->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx319->vflip)
+		imx319->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  IMX319_ANA_GAIN_MIN, IMX319_ANA_GAIN_MAX,
-- 
2.34.1

