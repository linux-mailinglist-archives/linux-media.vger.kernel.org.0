Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56A53934E1
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 19:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbhE0ReJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 13:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbhE0ReI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 13:34:08 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDADC061761;
        Thu, 27 May 2021 10:32:35 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id v8so1455323qkv.1;
        Thu, 27 May 2021 10:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2/+eIfj53POdJuJ8JguUQYMLt/9wKEEN9EHnJYWkESk=;
        b=S/Gja7fmlHHsR8eaLY1I6aybT/i/8Yx+SQKS9q1/it3rZ6RIRo0nrGXEQ4kyGVa5RR
         Id6KHsFZfBf8f6oMpbkeqzA8mFVozV61olOkAkxhmEv2MH8E8zQaBIoESe8jmNQD89Ae
         Pa5JqVYG7I1JpAz5+q+D9lPdcc3+yRVYp1/P57vbewvQX0N+enEA9MBQIklmNTyHW18V
         ZVt3jhhPk1FB7Xj/xZZ3dQlqotrIXj59gaBoDnkO7/YczX6vZ4Ex/UWDLCk73AXCbAzR
         WqJVtFZAtygVd1NLfjJwI6g8pvwSw/V0SXPalfP//trgOkZeDFl/61z6FcE0MeMVeLVH
         Rnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2/+eIfj53POdJuJ8JguUQYMLt/9wKEEN9EHnJYWkESk=;
        b=eZ71b36BB7WiDJKjsrLciKp3FxEjC0o7JJLFULeDReDJLhq4yD6ooVxHzNNnJYgJ4P
         ON0JKQxiC279ZAsbjGQVSEfASIojSw4bpvTgVCFoJpFWp9KMJUL70TaFx65iJ9pPYDnT
         XqbJMkxq5QUvf8K2pEatHFnPOl2ZG/F5db9fdJno17++xJGVEaZodZz23bEHt5XTOa28
         ZwOvdIjW7jIbY7uoyF71SScvG8/r3yzeZ9cSn4aCF/YNLi1OVt2buwl8AHmjV1JNS78C
         Fqfq+WCG0Tx47fT0tPgaPteo77MMDIL3qwXGKAZFE82bYsZaG8MUH1GPUxnVM3lppEIv
         oKAw==
X-Gm-Message-State: AOAM533a/P6gHC1aBnMtWGEw1cKgXUbtHoQmSTmlCYnDkSOu/a5ngt9o
        3LDuMkBOZriq72lHX5kei0w=
X-Google-Smtp-Source: ABdhPJzdQG652AQAP0YTwOHv5c/o9mMWwnGJzCKe43yJvGK3vOMx3Q52OQATwhvHrm6OrXAJnWSjlA==
X-Received: by 2002:a37:65d4:: with SMTP id z203mr4600614qkb.389.1622136754296;
        Thu, 27 May 2021 10:32:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:a1cb:22e7:5e60:5887])
        by smtp.gmail.com with ESMTPSA id m15sm1715117qtn.47.2021.05.27.10.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 10:32:33 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, matthew.michilot@gmail.com, tharvey@gateworks.com,
        linux-media@vger.kernel.org, slongerbeam@gmail.com,
        niklas.soderlund@ragnatech.se, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
Date:   Thu, 27 May 2021 14:32:09 -0300
Message-Id: <20210527173209.3874124-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527173209.3874124-1-festevam@gmail.com>
References: <20210527173209.3874124-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Matthew Michilot <matthew.michilot@gmail.com>

Captured video would be out of sync when using the adv7280 with
the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) had to
be configured properly to ensure BT.656-4 compatibility.

An error in the adv7280 reference manual suggested that EAV/SAV mode
was enabled by default, however upon inspecting register 0x31, it was
determined to be disabled by default.

Signed-off-by: Matthew Michilot <matthew.michilot@gmail.com>
Reviewed-by: Tim Harvey <tharvey@gateworks.com>
[fabio: Introduce "adv,adv7182-force-bt656-4"]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Only force BT656-4 when the DT property is present.
 drivers/media/i2c/adv7180.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 44bb6fe85644..a532df813d74 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -94,6 +94,7 @@
 #define ADV7180_REG_SHAP_FILTER_CTL_1	0x0017
 #define ADV7180_REG_CTRL_2		0x001d
 #define ADV7180_REG_VSYNC_FIELD_CTL_1	0x0031
+#define ADV7180_VSYNC_FIELD_CTL_1_NEWAV 0x12
 #define ADV7180_REG_MANUAL_WIN_CTL_1	0x003d
 #define ADV7180_REG_MANUAL_WIN_CTL_2	0x003e
 #define ADV7180_REG_MANUAL_WIN_CTL_3	0x003f
@@ -216,6 +217,7 @@ struct adv7180_state {
 	struct i2c_client	*vpp_client;
 	const struct adv7180_chip_info *chip_info;
 	enum v4l2_field		field;
+	bool			force_bt656_4;
 };
 #define to_adv7180_sd(_ctrl) (&container_of(_ctrl->handler,		\
 					    struct adv7180_state,	\
@@ -963,10 +965,26 @@ static int adv7182_init(struct adv7180_state *state)
 		adv7180_write(state, ADV7180_REG_EXTENDED_OUTPUT_CONTROL, 0x57);
 		adv7180_write(state, ADV7180_REG_CTRL_2, 0xc0);
 	} else {
-		if (state->chip_info->flags & ADV7180_FLAG_V2)
-			adv7180_write(state,
-				      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
-				      0x17);
+		if (state->chip_info->flags & ADV7180_FLAG_V2) {
+			if (state->force_bt656_4) {
+				/* ITU-R BT.656-4 compatible */
+				adv7180_write(state,
+					      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
+					      ADV7180_EXTENDED_OUTPUT_CONTROL_NTSCDIS);
+				/* Manually set NEWAVMODE */
+				adv7180_write(state,
+					      ADV7180_REG_VSYNC_FIELD_CTL_1,
+					      ADV7180_VSYNC_FIELD_CTL_1_NEWAV);
+				/* Manually set V bit end position in NTSC mode */
+				adv7180_write(state,
+					     ADV7180_REG_NTSC_V_BIT_END,
+					     ADV7180_NTSC_V_BIT_END_MANUAL_NVEND);
+			} else {
+				adv7180_write(state,
+					      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
+					      0x17);
+			}
+		}
 		else
 			adv7180_write(state,
 				      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
@@ -1314,6 +1332,7 @@ static int init_device(struct adv7180_state *state)
 static int adv7180_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
+	struct device_node *np = client->dev.of_node;
 	struct adv7180_state *state;
 	struct v4l2_subdev *sd;
 	int ret;
@@ -1338,6 +1357,9 @@ static int adv7180_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	if (of_property_read_bool(np, "adv,adv7182-force-bt656-4"))
+		state->force_bt656_4 = true;
+
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
 		state->csi_client = i2c_new_dummy_device(client->adapter,
 				ADV7180_DEFAULT_CSI_I2C_ADDR);
-- 
2.25.1

