Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A145379786A
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242998AbjIGQqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241644AbjIGQqZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:46:25 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A86D2117
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:45:48 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31768ce2e81so1110371f8f.1
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105074; x=1694709874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsf1mehY1EU1JR1nmS7E45I2Zeglu1yJCbPwjJvU1uU=;
        b=qDmJ6X12zgGqpS1mkKoD1zIF9B6XzCL8acxY5pD9iR5CVtQKWvqxaTXPK4KXtYKzbX
         Or3959BlEmENDTlBwQ21MD13Ivg8X9H0nyQ0gXrgWCiSZ23+KnDGSmIEnvFEhLekYiRJ
         h50ArjBHiw73riL50oRAMDjGm0WFrfiogxKSdWzmIIi1JrKlTukUJ0kNBdo0epXliaLi
         F0y3q+Mo06Ty6oxclW+wB4s5jSh36TW7rSEILKQSWFVJnlfcVckZUrWdADVOWW7Yci64
         mt7k7973gkcFw9gACzYS4BHN+hc4hkjrMkPNFPYOuIHS1Qo5DAmB7YZ7qaCysEOcHDF9
         9BZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105074; x=1694709874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsf1mehY1EU1JR1nmS7E45I2Zeglu1yJCbPwjJvU1uU=;
        b=KRXdpJCBA//8EGlnMh7yKlNZ4hTAxPAxkK5jV9ErlkV9shICeWgsg5SpM6uAb56EDF
         8WfV+Miv8HZc+L5hGQgKmSgrNOFMsT8ciWfMDXSGTm57wUzuaWabBULX26n2Rfe2KXZ2
         ajohcPAudS5cg3kIeiILYfvpszmo1qSI82pU4eOuoXy8qkaQy3quH2k6UMQcV8H+hIWo
         jenxlnkug5ZYbsjE3WrNulBXdy83G08bMLK/eIJHbRLCEn7YxrF5Twx+uWBGV89rXKD+
         g/pB6a/lUHqS6aoKdEoKj1NNFXB5nYCWrqi4JCkno1TAip8jE2WNUIHCDoTvzJcbmvqM
         YffQ==
X-Gm-Message-State: AOJu0YzqD+HtZht3AvvwYAvFZLrnhjhsDwgzXFO02CT3zAehtvLRY9db
        rAMf5QcaMO4jEyTbrQhYuqvHqw==
X-Google-Smtp-Source: AGHT+IG3BWilOJ+YfKjw7ZTqC8wbsZGwXEa01yDeLkkclOQHDpZHzPugldVac3UjZ9qjBCmK/nJTAA==
X-Received: by 2002:a5d:4d84:0:b0:319:85e2:6972 with SMTP id b4-20020a5d4d84000000b0031985e26972mr4850999wru.42.1694105073885;
        Thu, 07 Sep 2023 09:44:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:33 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/17] media: qcom: camss: Support RDI3 for VFE 17x
Date:   Thu,  7 Sep 2023 17:44:07 +0100
Message-ID: <20230907164410.36651-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
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
2.41.0

