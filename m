Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D50DD683657
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjAaTVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbjAaTUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:20:55 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A1B5977F
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:51 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso6398499wms.5
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLNhf5APnhwJhTJUEBocYb42Q20VcIzYBY0/ED9ON98=;
        b=KN/2WCK+J1NkgTzN8gTGMBcQwmty4Xh+CBioXZaduJOPXXILuDWwQMdBSway5LAiKU
         FnMe0GIm4c/RxBdcmzuzF/qtGyv5r1bblwhShFqO9WhDDuIphXd4hxo6R0tDVuU4jBfi
         5fKfdNW/+uQFaHJXWb1qGuxxgD9dt2Uwi78IDeZ/2xq/77aqvqXG5enCtjVrTDpJmx84
         5UTHkbercpCNj09OIG/Aia8tgsqN9ZZiLGsKgk5obYmosjxPPPIVYT/UxFOF3XvwSK/R
         L2MRukVfq0R4iPBkuXGfGcILirK8RVPTPT06gDxKgVImS/FC++DZzaMsqWgbk/KeHx6E
         wrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLNhf5APnhwJhTJUEBocYb42Q20VcIzYBY0/ED9ON98=;
        b=XTpNQ0pNtaqXS794hMR+1x/77CxeTaoLo8bD5rDOFEOe4Qq4I1kqEjStuOK6zRgbeB
         rYCRAkOhAspN5f1nCT+dKQgkfBRq4uN0qNLZJd+WF5EEQs+1AgAJlEsdYCxQc1simgI1
         iH4lAHB9jOPWFSGl7qkuroGwUCmyBRLSTt5JXccX+TRrCvwyDY2I/sRR/p7Azftch0xb
         lBd0uTNDxKmQYVnpazKin/BQG7f1JNtBxZM0NQ+NldWCUNCHH+fMf/nHkdsS5oPIeTof
         IqWQm9AmDh2aek+VBimqXvgB4Dw0AF+0ViS82Xv6O8I46QruLz0+k583w8zvtYHLREXn
         CuJA==
X-Gm-Message-State: AO0yUKUsGNCYyMpV9TO78l2sv9oHgY7BHTesodq7VEgicb47hWytGUqz
        cnH43pSt9cRx14/K2sM8oX0LBg==
X-Google-Smtp-Source: AK7set9N+y2qABTbja5ZTw44ju26/j0hTSK/frm55MyXJDq0OqkEg6txqMGSm/InsdkqwoEP9TuYpw==
X-Received: by 2002:a05:600c:44d4:b0:3dc:405b:99b4 with SMTP id f20-20020a05600c44d400b003dc405b99b4mr19835196wmo.25.1675192849793;
        Tue, 31 Jan 2023 11:20:49 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:20:49 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 01/11] media: i2c: imx290: Match kernel coding style on whitespace
Date:   Tue, 31 Jan 2023 19:20:06 +0000
Message-Id: <20230131192016.3476937-2-dave.stevenson@raspberrypi.com>
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

Fix up a couple of coding style issues regarding missing blank
lines after declarations, double blank lines, and incorrect
indentation.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index a370f1102334..88c7201510a2 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -106,7 +106,6 @@
 
 #define IMX290_VMAX_DEFAULT				1125
 
-
 /*
  * The IMX290 pixel array is organized as follows:
  *
@@ -335,6 +334,7 @@ static const s64 imx290_link_freq_2lanes[] = {
 	[FREQ_INDEX_1080P] = 445500000,
 	[FREQ_INDEX_720P] = 297000000,
 };
+
 static const s64 imx290_link_freq_4lanes[] = {
 	[FREQ_INDEX_1080P] = 222750000,
 	[FREQ_INDEX_720P] = 148500000,
@@ -465,7 +465,7 @@ static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *val
 			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
 	if (ret < 0) {
 		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
-			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
+			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
 			 addr & IMX290_REG_ADDR_MASK, ret);
 		return ret;
 	}
@@ -486,7 +486,7 @@ static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
 			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
 	if (ret < 0) {
 		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
-			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
+			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
 			 addr & IMX290_REG_ADDR_MASK, ret);
 		if (err)
 			*err = ret;
@@ -752,8 +752,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
 
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

