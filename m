Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F41638D78
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiKYPbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiKYPbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:31:34 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A0A2871E
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:31:33 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ud5so11125105ejc.4
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh5MwmK/rpgu4dep0zQ7hNCT5OBsH1qzr2wUQzS5UDg=;
        b=Z0QOUkHNbUhcxB7/qsRBOHolpcQUNhJ2Vr+k+PhgqYsMopbt5CG8AGVuNwcc9uFJbV
         y1kOkWvenIaa/OsBSyNyVum+v3lc/UP1yzOntuZcHirrFKLPYgp04PHgABy4N1oyVdzB
         RgjaYgdV0jTyXJOtCEM5Yg6Iy0kUfHAv3hb1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nh5MwmK/rpgu4dep0zQ7hNCT5OBsH1qzr2wUQzS5UDg=;
        b=b6/HL2DEEQntOonqpmBljO01qtwvpXNJf+3gCZQ3U88ihCOoI5D+IWXYGsjzB0jTQK
         UGKZi1JMBkoYzQ/TeJHVY68kMSWQMI4Hdfax2FuWEhDWx4lEbfYq0He8Z2ueclfOUp9r
         y0+cxFN0j27wJnCkQAUPcpHv218TaKVu/NoBpLNwhCVosGYnetb8/hX7v90rCqM5Qeh0
         GdMh0I3a0M7YB+BXsCapp3Al0bsVN0gos99Acg//H1YUm/PU5KA5icFQol71vdRKD83n
         6H/bffaYXKzjihLPH4/i7wgyMULoIirEGsd7a6+RT7vC+t+nrLK3tSPVGiajPSb9j0v6
         LPIg==
X-Gm-Message-State: ANoB5pmzjc4DtpMJCjHajNt3jnlKWHr4pPdLvZFNSSu0g8FlcEpoacVD
        g6PXmYzwnpC25RK+/FacwHO+3VARXOmunw==
X-Google-Smtp-Source: AA0mqf4OW90GcQfYttnvOEzCTft2cYBLMX4YQDa7yGPxTYzzpcK79QCgYCnoUwu5jN6M8F69y4hhWA==
X-Received: by 2002:a17:907:c70a:b0:7ad:d6c6:eb7c with SMTP id ty10-20020a170907c70a00b007add6c6eb7cmr24743937ejc.249.1669390292508;
        Fri, 25 Nov 2022 07:31:32 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p10-20020aa7cc8a000000b0045b4b67156fsm1878435edt.45.2022.11.25.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:31:31 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 4/5] media: i2c: add imx492 config entry
Date:   Fri, 25 Nov 2022 17:31:19 +0200
Message-Id: <20221125153120.541298-5-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125153120.541298-1-petko.manolov@konsulko.com>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
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

Adds the Kconfig entry right after it's sibling.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/media/i2c/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 49c1c27afdc1..db69725d2f9a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -228,6 +228,20 @@ config VIDEO_IMX412
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx412.
 
+config VIDEO_IMX492
+	tristate "Sony IMX492 sensor support"
+	depends on OF_GPIO
+	depends on I2C && VIDEO_DEV
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the Sony
+	  IMX492 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx492.
+
 config VIDEO_MAX9271_LIB
 	tristate
 
-- 
2.30.2

