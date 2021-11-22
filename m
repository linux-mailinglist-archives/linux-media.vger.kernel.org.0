Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1534594F9
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 19:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240408AbhKVSub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 13:50:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240097AbhKVSuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 13:50:22 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52A9C061748;
        Mon, 22 Nov 2021 10:47:15 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id g14so81320384edb.8;
        Mon, 22 Nov 2021 10:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKAd13ADpuT/g6/zKOnVkwtQVM57IaAtbrKHSQ6bV6A=;
        b=hJgWH6pywF6UW/vvgqL5V57IsYjartVT3mGfw0/TKtJdbMM6QX9VaQxCzXFli4T+UF
         Fwvk67TmcufffHzSglF0gQ92NJn6LauHY7+LrSFO1ZlV8cIIheDiwrNETelXdTGeZ6uX
         L1WKUwr1HAo4sBkS2r3Jia8/FFwn4pYQYAAtw88A1nnzYBQaEy67+5yAjwfyUKehmq+R
         LV3KZLaE5Xgmo5lAxh+DMQMuBkUnBO1V6x+68ix3x1DiXUFqX4owFOOrUoagQtZiZJVW
         ihakzwSByhoTxJGQHjtSZoTW+UY+cQ9g3MvtxzO0a2XBpl+EKQ1VAmp6tUyf/mZU+Jw0
         xxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKAd13ADpuT/g6/zKOnVkwtQVM57IaAtbrKHSQ6bV6A=;
        b=Bw2QzpfsrWYCzKLwANRIxgJWUUWnHo+OiAyuhNlVlv2MlzSuKeNZIzweaX21vzXBsk
         A+vArFk9aLMTAXxlIkq9VkMsyrlSmoSQrp9DvRX6mRiD2UhTCNwgq7wlZP6If08pCa1Q
         W4BKqENrMem5NebWb3Yo0rlp3txV0AnWU9IFBKwWVgIBXNAb495hDGqFRJ8RiwAaSfj0
         1pPT3+khBz7rEIaSqr9wGahLtuWg35Jypukj44Kvuo+PpQb0lGDHipPBIYXsFkdh5jDO
         SJx4RZFpITfBxGB2O+SVrYM7OtronSThxGH53/YqatW0RAskaAik5USMIbrvx93GYSWn
         cePw==
X-Gm-Message-State: AOAM531f0/XD8xk7Nh3IaASJ/YgoE6YJm93V8uTjdvo/drfskiUc7e01
        SEDTlnAprGYUH33qi9uxASrxxRCZArIl6g==
X-Google-Smtp-Source: ABdhPJxgENTrJeEAp2FSu442LZx+8rnzsygJjMZ5AXrx66h6EMWLyfL6qetx5t+R4vKDqAWaXyJSuA==
X-Received: by 2002:aa7:cada:: with SMTP id l26mr68753520edt.376.1637606834429;
        Mon, 22 Nov 2021 10:47:14 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:14 -0800 (PST)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/7] media: hantro: vp9: use double buffering if needed
Date:   Mon, 22 Nov 2021 19:46:57 +0100
Message-Id: <20211122184702.768341-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some G2 variants need double buffering to be enabled in order to work
correctly, like that found in Allwinner H6 SoC.

Add platform quirk for that.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro.h            | 2 ++
 drivers/staging/media/hantro/hantro_g2_regs.h    | 1 +
 drivers/staging/media/hantro/hantro_g2_vp9_dec.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 33eb3e092cc1..d03824fa3222 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -73,6 +73,7 @@ struct hantro_irq {
  * @num_clocks:			number of clocks in the array
  * @reg_names:			array of register range names
  * @num_regs:			number of register range names in the array
+ * @double_buffer:		core needs double buffering
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -94,6 +95,7 @@ struct hantro_variant {
 	int num_clocks;
 	const char * const *reg_names;
 	int num_regs;
+	unsigned int double_buffer : 1;
 };
 
 /**
diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
index 9c857dd1ad9b..15a391a4650e 100644
--- a/drivers/staging/media/hantro/hantro_g2_regs.h
+++ b/drivers/staging/media/hantro/hantro_g2_regs.h
@@ -270,6 +270,7 @@
 #define g2_apf_threshold	G2_DEC_REG(55, 0, 0xffff)
 
 #define g2_clk_gate_e		G2_DEC_REG(58, 16, 0x1)
+#define g2_double_buffer_e	G2_DEC_REG(58, 15, 0x1)
 #define g2_buswidth		G2_DEC_REG(58, 8,  0x7)
 #define g2_max_burst		G2_DEC_REG(58, 0,  0xff)
 
diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
index e04242d10fa2..d4fc649a4da1 100644
--- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
@@ -847,6 +847,8 @@ config_registers(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_p
 	hantro_reg_write(ctx->dev, &g2_clk_gate_e, 1);
 	hantro_reg_write(ctx->dev, &g2_max_cb_size, 6);
 	hantro_reg_write(ctx->dev, &g2_min_cb_size, 3);
+	if (ctx->dev->variant->double_buffer)
+		hantro_reg_write(ctx->dev, &g2_double_buffer_e, 1);
 
 	config_output(ctx, dst, dec_params);
 
-- 
2.34.0

