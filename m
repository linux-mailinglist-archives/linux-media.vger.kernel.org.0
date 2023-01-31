Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41665683659
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjAaTVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjAaTU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:20:56 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B45589A6
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:52 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso5271643wms.0
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFJWbZbE2PPVfA3ICvzj1Enxs9hPxy1DhzpkcqIlUJE=;
        b=i0SO1MwfH4e8osruv9YP2+/BvlSSP9K9t4aQx2AyPESiOz/N+cE6tXjUX9IgpPzPKA
         beSIS+BqJt5eKh4KABqCyHkKR0oKCe8/PA9ys+zbwm5jhUdxeXZkg7p2wl/RdWmkyeIR
         EDZZuFSeqs+F8QlHGVayw7Aq7N6X05imAtVD7uxJ/XV30GQqm8KkWlZIlUT+nlkaITfR
         e95nKFzz6ft9e1aR3Qe5eLy//pSBp8faPn/XPiUzQVX2n30sZv2XTizZt+Kth12ValNf
         MXQsq9U24QB9rr/KTNWWtrq/e1FmKrIN5dD6zXgNXP51MO+d095O0oYe8CnYB+ZVpm+O
         Ca/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFJWbZbE2PPVfA3ICvzj1Enxs9hPxy1DhzpkcqIlUJE=;
        b=O+GGievjFQ9UWzTcIjbuEjTd6JAz2XYi9rLMUgthyXbXMNIHpRNB7k2BwIS6sUeo4Y
         W9wzFVNXMqEClqjuAHExERBhxbcF8+zcMSXDEGQI+aJr0gYqtxgpEea+CzWqtc8ZYtZE
         cWpHU9A7lORLjYLsdWSelagCsHI2tJiGHohS2LnY+cJpaghumLwI8ZLKcYiaVtWbxMwm
         yFrEvjOl246+Euk/HcWAqV7KOI2nFsqaKBUknjUbNuu4hVwZ1Bl9DCbOW+1Bl9tUb0Aq
         yuEjfamlse2H1J+tVv9ns3FyqcGeSOkwvg9l/97QHFGeHMJk2JahQ+G5TLYYAFrbpUhC
         wCQA==
X-Gm-Message-State: AO0yUKU3zQlgNUQM1XZJOkrCCZCAj1m1dvMFxUYNLzKQT3qY3weIfQc0
        03v+7pRZ3i/7uXDdDXl4UyEEwg==
X-Google-Smtp-Source: AK7set/Ryp0Euz247gW8j9Dx3LCwvsvJnLSQ2lVfABqva/9+WquKABmLJfm4nS5nP27jiAcUkgrSWA==
X-Received: by 2002:a05:600c:3b0f:b0:3dc:5e21:8aa2 with SMTP id m15-20020a05600c3b0f00b003dc5e218aa2mr7086964wms.34.1675192851382;
        Tue, 31 Jan 2023 11:20:51 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:20:50 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 02/11] media: i2c: imx290: Set the colorspace fields in the format
Date:   Tue, 31 Jan 2023 19:20:07 +0000
Message-Id: <20230131192016.3476937-3-dave.stevenson@raspberrypi.com>
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

The colorspace fields were left untouched in imx290_set_fmt
which lead to a v4l2-compliance failure.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 88c7201510a2..bf96fd914303 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -897,6 +897,14 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 		fmt->format.code = imx290_formats[0].code[imx290->mono];
 
 	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc =
+		V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->format.colorspace);
+	fmt->format.quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(true, fmt->format.colorspace,
+					      fmt->format.ycbcr_enc);
+	fmt->format.xfer_func =
+		V4L2_MAP_XFER_FUNC_DEFAULT(fmt->format.colorspace);
 
 	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
-- 
2.34.1

