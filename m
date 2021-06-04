Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36E339C24E
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 23:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhFDVYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 17:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhFDVYV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 17:24:21 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F62CC061766;
        Fri,  4 Jun 2021 14:22:34 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id im10so4824212qvb.3;
        Fri, 04 Jun 2021 14:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ezTV+OzOLi9CptsqU6k+KBEk+Xlfv3f///KA0MIi6U0=;
        b=sTlhzcqPM87ea0l8D+Wd5U3ppXJB3g9EUqPojbs8WCalJTm5mBPmndLy4VcD4Pkuem
         XgrzWwGFyeLuQ46R6IJ2lfXBOJnrHRNFOLD+LXw4T7uHQ1zIu3AqyRne0NMJloYPv0YC
         OX8+eiavUq/ylSB4P+PyDUKOH330DMES5DnjrGCfDvOf0NF4BkpuUoR853IDCFReWcAj
         uWxdKihlrE+y3UnCJL2AHVfXK//vgkGNVTna286Qna7thfv5ZlTdbwzpetHv8tRmJz9Q
         44ysjLb74WdMjaavRL6W38uMyJwxsKvtdh9GbhaYLYhBneQloCO/+RM3WEe7QtC+eF2J
         emfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ezTV+OzOLi9CptsqU6k+KBEk+Xlfv3f///KA0MIi6U0=;
        b=f5iBoC3rRBI8z+v7yO6s+96eaOl+nlLBAcy7wXs5zaZp2N9CmjsjOPo31sapuxtrrC
         Wwduzv4obrkB2Nm469cNRCJPhsSu9HiGzE9GTKOHKQTtq+oxgTifuK2icakzYcFwmO8Q
         fAjSXLIBBK2XfMu74gW66xWy4h6ucqyuQONJ+C3LQl5XSTB7eDDBZ6Yyk/6Zqm/ROHjk
         QNvteXW7jOkqGD0N8YwsKVNIxJQyp0KZKNfzPpBxlZg2uQ9TAgIIi4G65auDYdLGRMtS
         5Y+PJWCLFA5hnzT7TEJH2N+RSQcKNjV9JjFQx4wP6+mwCrGHhL5gVS69yGIB5gtre3Ma
         ZQUg==
X-Gm-Message-State: AOAM531DG9B1rbXSqbwjU/TlIqnpTWTDHTeFcqHsXAr0ZmPdfdYo0IT3
        OxnI8BNLh0+ZZvm+458Tkb4=
X-Google-Smtp-Source: ABdhPJw+BfRFhvWnEEk2bSJ1ykOGEJ/6ToCGnng0fPtdDkxtTk0GNl2glZ/qEAChFwVIkknafSVriQ==
X-Received: by 2002:a05:6214:2269:: with SMTP id gs9mr6560455qvb.57.1622841753700;
        Fri, 04 Jun 2021 14:22:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:5e11:28ac:75e2:dfae])
        by smtp.gmail.com with ESMTPSA id h5sm4213892qtu.75.2021.06.04.14.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:22:33 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, matthew.michilot@gmail.com, tharvey@gateworks.com,
        linux-media@vger.kernel.org, niklas.soderlund@ragnatech.se,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
Date:   Fri,  4 Jun 2021 18:22:17 -0300
Message-Id: <20210604212217.70518-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604212217.70518-1-festevam@gmail.com>
References: <20210604212217.70518-1-festevam@gmail.com>
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
[fabio: Introduce "adv,force-bt656-4" to not affect the existing users]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Remove the part number from the property name (Rob)

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
 
+	if (of_property_read_bool(np, "adv,force-bt656-4"))
+		state->force_bt656_4 = true;
+
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
 		state->csi_client = i2c_new_dummy_device(client->adapter,
 				ADV7180_DEFAULT_CSI_I2C_ADDR);
-- 
2.25.1
