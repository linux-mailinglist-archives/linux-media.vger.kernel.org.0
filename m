Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D26668A2C6
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbjBCTSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjBCTSY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:24 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B728B70D58
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:23 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ba1so1478963wrb.5
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV7cEjOEkCBAw9kSdJEJORaQ2AZ3g69IwUjmjoQIzkE=;
        b=ih2jRgx4T5ZOiFGruZGGdqMrG/RloIEykbs6wirs5zMOHbkVjtKIuFonnxACKvxVaB
         F0wAVreP7B6T0sOERQapHwHtvbomsw81FPdCg1PJe1CW9hy2IxUJrqVfy4Hw7d+84zx7
         CD49i892o40lp2RVIutK6+rx7CZtRTCwZkoq6de2bJflAn5XlaCsXvE08PD61jj/hoyy
         pIAVwzRukSGetvwaRad65DWFmMVQH+1jWUTn6QBjK4QHT5q2l0/OO1yIiWWGT5UZdc9a
         A56LjmrxC+6nxG4o0VtC+NJVkOBQgFERrW21n/kP5ZwXJVPCnNgtZw5VQYgHbm33JpE5
         Vbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV7cEjOEkCBAw9kSdJEJORaQ2AZ3g69IwUjmjoQIzkE=;
        b=qRHfuMxjaCFIwi3rFc2rzQilmTlD4i/mip4xN3mr0r2lVIcm2KqmzPZs1h2fbc7s/k
         sxlFxQoMZhEoFESC4damllY2ZgLszYJsuky3YKmvck+cz6oRJCIs/MWj5IJR+H+9ITzZ
         fT2eCZSIsbpg9SALKwx0UxgGEV/1jBkEGRhgSqhUFE+1ELiJWVq4ciJxCUdlQ2b9fQph
         LhK4RcvRzY/qetNYJ/lmBmOeZhY79N2MuPgrIoqISFnUnoboqJMfgeDexQSanesCR4F8
         yfZ6hPQ9e2lBB/9kuf4tZUAuXiidmc1C4+0VMGuuiDNWYwfOn1MG+9CWZ8OhnIy4wU1m
         Liwg==
X-Gm-Message-State: AO0yUKW9VC9R5jIS1VmZYHJ8qrAefgZqjpo6+AcEvVke1ysOL7ZMrW7h
        sQJI1AvY2mhy2hFgrdqIIfk+IQ==
X-Google-Smtp-Source: AK7set96YFTahWD7IwvFH8xVBIuupaOE1l6FzODMjI+oDGLa+ZwGrXs7+pvexv0lH2GK4TnrjRzIIg==
X-Received: by 2002:adf:c60b:0:b0:2bd:c1de:a33f with SMTP id n11-20020adfc60b000000b002bdc1dea33fmr9700335wrg.19.1675451902287;
        Fri, 03 Feb 2023 11:18:22 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:20 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 01/13] media: i2c: imx290: Match kernel coding style on whitespace
Date:   Fri,  3 Feb 2023 19:17:59 +0000
Message-Id: <20230203191811.947697-2-dave.stevenson@raspberrypi.com>
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

Fix up a couple of coding style issues regarding missing blank
lines after declarations, double blank lines, and incorrect
indentation.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 9ce839541926..22d6194678bc 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -106,7 +106,6 @@
 
 #define IMX290_VMAX_DEFAULT				1125
 
-
 /*
  * The IMX290 pixel array is organized as follows:
  *
@@ -350,6 +349,7 @@ static const s64 imx290_link_freq_2lanes[] = {
 	[FREQ_INDEX_1080P] = 445500000,
 	[FREQ_INDEX_720P] = 297000000,
 };
+
 static const s64 imx290_link_freq_4lanes[] = {
 	[FREQ_INDEX_1080P] = 222750000,
 	[FREQ_INDEX_720P] = 148500000,
@@ -485,7 +485,7 @@ static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *val
 			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
 	if (ret < 0) {
 		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
-			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
+			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
 			 addr & IMX290_REG_ADDR_MASK, ret);
 		return ret;
 	}
@@ -506,7 +506,7 @@ static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
 			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
 	if (ret < 0) {
 		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
-			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
+			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
 			 addr & IMX290_REG_ADDR_MASK, ret);
 		if (err)
 			*err = ret;
@@ -772,8 +772,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
 
 	/* Set init register settings */
 	ret = imx290_set_register_array(imx290, imx290_global_init_settings,
-					ARRAY_SIZE(
-						imx290_global_init_settings));
+					ARRAY_SIZE(imx290_global_init_settings));
 	if (ret < 0) {
 		dev_err(imx290->dev, "Could not set init registers\n");
 		return ret;
-- 
2.34.1

