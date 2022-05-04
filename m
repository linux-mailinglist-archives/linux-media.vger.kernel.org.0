Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93CB51B1DF
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379028AbiEDWei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378988AbiEDWea (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:30 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1A22B257
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:52 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v12so3784947wrv.10
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f+hA5NbVCTe8pYlLM1ek8PpVaxlEFMTM89KxjFBt8xE=;
        b=nu2qX6j5MqwcHp2+UxdFRQgqRkRJR1HvjBAMSlSGsZ1LCOAnhRaKClMLvQKzk+bLif
         xmCx0KQnDp1EU0d8ZM5xyBUcmAAdlbuWEb98a3lriUrtNaKpyZ+W6KXt1gPF+2jjVzat
         X+beI0BxRwe3CbAtyk0qjAK8TE9E1UTlx1J/CDW/E6lOa9dHAPU+qVw6g/f/403PI4gl
         r6ISdMiy4j58cPY9aGLjSm3wWEhbpjHCme2aloeMPtZfIZDMPUezLHn4p/yF+PZ7YwCi
         8ZDfNUrqD6bJZw9oqzwfCK9w9reWRoPBwr4E5dzndnl5soKDnLkpmZSHTWDuGA5cBkMm
         +pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f+hA5NbVCTe8pYlLM1ek8PpVaxlEFMTM89KxjFBt8xE=;
        b=zaaadr/EobtctXyEVv9woOLRlNEBRLWLbLa0bfOrUKYCckMptfhw9vL8DfcijR2ND+
         9LXilNTwumJAHIK03VxFcTZOyoKemtCaPUjDLgnUBm6sCXFUN8DRwctiZO8rSTxWl24b
         vWYwP/26Q2wei7MPacmgIOGkyqRez1ch6lVwmj4Cs6tXAa3SAv578x7BF8QAdzSpk51f
         6n/YkrN6z+oudNn9rs/BWMCCLTk9cylnEhpRJVZQD1tCCQM+baGur7sap7nsoZyLXT8t
         1MVwKsKHs6FKnQbp2cUSZIbbkguVyh9tHNqvd9U42Rr8hZpq2B0rVFgP3xOCie6nVLM4
         3y+g==
X-Gm-Message-State: AOAM5305VgNmA/OurbjlswYyYmXe1BFjeFtt+Wdihbcjwui1MquGgHqI
        jm9e2Z3HfXg5g6qBVNz3PMjRiDjNa4o=
X-Google-Smtp-Source: ABdhPJzsc+jpB25yjrFwaI98yNlnsg6um76AfygHK5EvO6AHjDEEF/pCxSb2OVr8ClwUlEwmxdEUrg==
X-Received: by 2002:a5d:6da8:0:b0:20c:535e:2f61 with SMTP id u8-20020a5d6da8000000b0020c535e2f61mr18250219wrs.455.1651703451622;
        Wed, 04 May 2022 15:30:51 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:51 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 12/15] media: i2c: Extend .get_selection() for ov7251
Date:   Wed,  4 May 2022 23:30:24 +0100
Message-Id: <20220504223027.3480287-13-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend the .get_selection() callback to support other values for
sel->target, primarily to satisfy libcamera's requirements.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- New patch

 drivers/media/i2c/ov7251.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 4f8c797839f6..40e42d19cddd 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -54,6 +54,13 @@
 #define OV7251_PLL2_SYS_DIV_REG		0x309a
 #define OV7251_PLL2_ADC_DIV_REG		0x309b
 
+#define OV7251_NATIVE_WIDTH		656
+#define OV7251_NATIVE_HEIGHT		496
+#define OV7251_ACTIVE_START_LEFT	4
+#define OV7251_ACTIVE_START_TOP		4
+#define OV7251_ACTIVE_WIDTH		648
+#define OV7251_ACTIVE_HEIGHT		488
+
 struct reg_value {
 	u16 reg;
 	u8 val;
@@ -1248,13 +1255,29 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
 {
 	struct ov7251 *ov7251 = to_ov7251(sd);
 
-	if (sel->target != V4L2_SEL_TGT_CROP)
-		return -EINVAL;
-
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
 	mutex_lock(&ov7251->lock);
-	sel->r = *__ov7251_get_pad_crop(ov7251, sd_state, sel->pad,
-					sel->which);
-	mutex_unlock(&ov7251->lock);
+		sel->r = *__ov7251_get_pad_crop(ov7251, sd_state, sel->pad,
+						sel->which);
+		mutex_unlock(&ov7251->lock);
+		break;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV7251_NATIVE_WIDTH;
+		sel->r.height = OV7251_NATIVE_HEIGHT;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = OV7251_ACTIVE_START_TOP;
+		sel->r.left = OV7251_ACTIVE_START_LEFT;
+		sel->r.width = OV7251_ACTIVE_WIDTH;
+		sel->r.height = OV7251_ACTIVE_HEIGHT;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.25.1

