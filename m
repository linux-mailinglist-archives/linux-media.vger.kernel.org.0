Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 154CF7ADBEA
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 17:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbjIYPmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 11:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjIYPll (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 11:41:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2908CC7
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:41:21 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-405417465aaso55421795e9.1
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695656480; x=1696261280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XAtVUAyBOvnRtU7QZlyMg2OvJJmAGTuY+WdBD311GM=;
        b=Xnz7pFyZOCUK3oas2KxJmig/iFPqwGiN85LZmi0ddh0OZ92VL2m1uAcKKQrMeDaN6O
         WVJqxFJ7/xT/ktc4GHgbzQ7EXzSVWf9cN0zmpkNudAV0CV783EnknC0RhUBzkgGgGNk9
         FGapO/XgQH8sni4DPMSU1ljMV0wM+Knw//e0JO+KdS10jHbwTyJ53PUyebO5FI+NiabM
         fkmK+7mZLhHbfT4/u+JPYUgSKHYLrAeFBCy/raj/Ql6J8AYsfmhNC5WsQrzoaAzjO4Ky
         lzu3hpwelu7TAPdF+gAYpvcE8SCXoXiGAKvaDoMlUiWqbJR0RJVxVxtj4P8KkXUCM8LV
         yDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656480; x=1696261280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XAtVUAyBOvnRtU7QZlyMg2OvJJmAGTuY+WdBD311GM=;
        b=a25Na9nakehQNeJj/y7vkxXCpPiTrGkU2Ot+dhSFI77sC10bP5d5WZMSjQb8iyp7OF
         Pney0CH8CwLk21UX8I4iJ/bF7Ox/U9H9LJGU1YOd6gDSxIKZkLPSTUSGJRLoBK6P2xkU
         k8CqE5Ja1M6NPQnCn5J4LKXuRoTCjPy3ZfSf0uOiJ0yy33BTvtu1HdAyC5bNnh9wSX47
         emvLFK4NChL0aBz10FKuPEDzj5kM4urycmT99DCpPR3q9XELnD8zrhK0urY+MDYN5vHk
         kWmJkboJR41w/n84/N00Mz8iwAnXsmvn4736vb1qRDOPgHwQ2r982wNb+XEKmP7aK+W4
         ANFw==
X-Gm-Message-State: AOJu0YwDN+GSKMKLTlNqsTon1jG/FYFD4fmERDVAOdG084treLIBg0iY
        0U7Bx7LMFv8D0emZWDwy4cA6gA==
X-Google-Smtp-Source: AGHT+IHIYsIZ8vZqQaDPoDXEY7tcVUbqvj1KdoeCpEzq1zo6LVnPKhEuMzJyfNb1ZAcyPclD6hYQ9g==
X-Received: by 2002:a05:600c:ca:b0:404:757e:c5ba with SMTP id u10-20020a05600c00ca00b00404757ec5bamr5470692wmm.26.1695656480416;
        Mon, 25 Sep 2023 08:41:20 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m15-20020a7bca4f000000b003fe4548188bsm15206155wml.48.2023.09.25.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:41:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 14/17] media: qcom: camss: Support RDI3 for VFE 17x
Date:   Mon, 25 Sep 2023 16:40:56 +0100
Message-ID: <20230925154059.837152-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925154059.837152-1-bryan.odonoghue@linaro.org>
References: <20230925154059.837152-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some VFEs have four RDIs apiece. Right now the ISR code has a hard-coded
value which tops-out at RDI2 meaning only three RDIs can be utilised in
practice.

Extend out the various routines in camss-vfe-17x.c to support the higher
RDI count.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 2ba7160b3bd1e..a5aa799501861 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -209,7 +209,8 @@ static void vfe_global_reset(struct vfe_device *vfe)
 			 GLOBAL_RESET_CMD_IDLE_CGC	|
 			 GLOBAL_RESET_CMD_RDI0		|
 			 GLOBAL_RESET_CMD_RDI1		|
-			 GLOBAL_RESET_CMD_RDI2;
+			 GLOBAL_RESET_CMD_RDI2		|
+			 GLOBAL_RESET_CMD_RDI3;
 
 	writel_relaxed(BIT(31), vfe->base + VFE_IRQ_MASK_0);
 
@@ -343,7 +344,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 static irqreturn_t vfe_isr(int irq, void *dev)
 {
 	struct vfe_device *vfe = dev;
-	u32 status0, status1, vfe_bus_status[3];
+	u32 status0, status1, vfe_bus_status[VFE_LINE_NUM_MAX];
 	int i, wm;
 
 	status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
@@ -352,7 +353,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	writel_relaxed(status0, vfe->base + VFE_IRQ_CLEAR_0);
 	writel_relaxed(status1, vfe->base + VFE_IRQ_CLEAR_1);
 
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++) {
+	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++) {
 		vfe_bus_status[i] = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(i));
 		writel_relaxed(vfe_bus_status[i], vfe->base + VFE_BUS_IRQ_CLEAR(i));
 	}
@@ -366,11 +367,11 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	if (status0 & STATUS_0_RESET_ACK)
 		vfe->isr_ops.reset_ack(vfe);
 
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
+	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++)
 		if (status0 & STATUS_0_RDI_REG_UPDATE(i))
 			vfe->isr_ops.reg_update(vfe, i);
 
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
+	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++)
 		if (status0 & STATUS_1_RDI_SOF(i))
 			vfe->isr_ops.sof(vfe, i);
 
-- 
2.42.0

