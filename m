Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED86877BE0F
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 18:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjHNQ3q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 12:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbjHNQ3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 12:29:31 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15242E5F
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 09:29:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so7362019e87.0
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692030567; x=1692635367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWSfC4PTyf3c1S/i4WTl2tNnfkmumB5Ykd84R92bEPk=;
        b=cDDA/x6uAs9Fb/p3fnZNPWdLRpHIQkICXRmvtfXsLYbPEZca3GQOyIdWbd+wKaP+zR
         GXYTESy+Qrymyvq8hhqNN6c2KnCs0uGhbrjLYDRxo7s6rZVTW7VLLZSaY5+2iesYM6gs
         ebTMwFkfw8bmn4HleDEp62P+LOjHOEVl3rLStV9VyU0boggl8UZovgllNrHT3xuSdKok
         rDhgeEfAEcOydaO3skzqsi5vcpX2h0iGp2e4+1+hfy/VQLgJql+i3r+qiwWajascFSJR
         WL7QreSstUophq3R1rxFu36oP1SWEnNz9+xt1gOvKLORSFe/wr/E3hwOMy8NxVHzUmSL
         xOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692030567; x=1692635367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWSfC4PTyf3c1S/i4WTl2tNnfkmumB5Ykd84R92bEPk=;
        b=lyVuN0hsDzHcGwbIglDH2geF1h9oHHRThMAwa81KTxNxn/zn4Petw0/slzuDDHOW6v
         Qxx3vHKWT9qjDH1WNBBu5vQIr5FWzwrUtZCIvdG73p8To8TepN34b1PvUBoY5kyG3pK0
         UziTvJEyivfoAZcL/aa1ndgP8jT0XAElqx+Z6/J/Zo/YcMfajpyzfkOZFx4odjFrQF88
         6j95X/RllVN/physRx9XKA7wQFGoziD7g/xBUw7Or8WVvPX31Vn56mm1zedjjfP8D3XY
         tCGRgFQQnd4KopTqNCwU7i2Uj0SiQxjwPSA6HZlwzYVWNELAC85Yv8sM9mKhnxZdfVNG
         HPJA==
X-Gm-Message-State: AOJu0YyhsLmEv9bXZXQB3OOAotCb1f317A7OwfJzBpU7wwUHDnQzKFmf
        GvJre7ZpIog1gqupkG1C11+XCw==
X-Google-Smtp-Source: AGHT+IGxL4rwwl5RznxLtL6TcAZQpkatRNqXTeSe59I18disUu3EHlmBG24zBMwT/Yw3qKiWQJTA1w==
X-Received: by 2002:a05:6512:10d4:b0:4fe:746:63d1 with SMTP id k20-20020a05651210d400b004fe074663d1mr7639216lfg.5.1692030567400;
        Mon, 14 Aug 2023 09:29:27 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fc16ee2864sm14743475wme.48.2023.08.14.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 09:29:26 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 14/14] media: qcom: camss: Support RDI3 for VFE 17x
Date:   Mon, 14 Aug 2023 17:29:07 +0100
Message-ID: <20230814162907.3878421-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
References: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
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
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 8aa921400ded0..c2487a8196db7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -210,7 +210,8 @@ static void vfe_global_reset(struct vfe_device *vfe)
 			 GLOBAL_RESET_CMD_IDLE_CGC	|
 			 GLOBAL_RESET_CMD_RDI0		|
 			 GLOBAL_RESET_CMD_RDI1		|
-			 GLOBAL_RESET_CMD_RDI2;
+			 GLOBAL_RESET_CMD_RDI2		|
+			 GLOBAL_RESET_CMD_RDI3;
 
 	writel_relaxed(BIT(31), vfe->base + VFE_IRQ_MASK_0);
 
@@ -344,7 +345,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 static irqreturn_t vfe_isr(int irq, void *dev)
 {
 	struct vfe_device *vfe = dev;
-	u32 status0, status1, vfe_bus_status[3];
+	u32 status0, status1, vfe_bus_status[VFE_LINE_NUM_MAX];
 	int i, wm;
 
 	status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
@@ -353,7 +354,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	writel_relaxed(status0, vfe->base + VFE_IRQ_CLEAR_0);
 	writel_relaxed(status1, vfe->base + VFE_IRQ_CLEAR_1);
 
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++) {
+	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++) {
 		vfe_bus_status[i] = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(i));
 		writel_relaxed(vfe_bus_status[i], vfe->base + VFE_BUS_IRQ_CLEAR(i));
 	}
@@ -367,11 +368,11 @@ static irqreturn_t vfe_isr(int irq, void *dev)
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

