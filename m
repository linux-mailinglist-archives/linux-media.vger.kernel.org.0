Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE0977BB2A
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 16:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbjHNOKt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 10:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjHNOK1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 10:10:27 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C418510FA
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 07:10:23 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so39969105e9.3
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692022222; x=1692627022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rz1zrGGONNkngfkoUA1t5vIxlWnYkYs5EA/aRamoKao=;
        b=GM5bZ+i/YC9L6vOUhfHcXEpmYiKmLT9PnXAieBJnaaLn8c3LJqE0PwtV+vxqV6TGSm
         e11wYA7PSCbBSHizzthtz74FZt3bS2iE2MmTGaMGc2eB5WqbUJRNfMxWJhwtCk15obP7
         IjZIolAguBVCMgHqB+6Q3VCHQkHW6N6f6o8QsptAnYGfrGoMym8QCDWfh+QgGPLrIEnM
         jszXS2LvKCLCbCwG0R2lCo4Aw76jDYlKoHMIg1Ra4tYuSc+/0AFdml3zj4cZHUnKJPBH
         kEyh6GaGfNb7Ab5axvfNRayguNAlx6KP4e+3OI5wtz7ufPckdFZxZzDX0JuW67jFDxc2
         0ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692022222; x=1692627022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rz1zrGGONNkngfkoUA1t5vIxlWnYkYs5EA/aRamoKao=;
        b=F8r7+Q+oFhQxHA/VD7+DjTdNp3+Ua2TGJfkvRjmLj68Vff5epWgx4CcsTU3T36Ug5t
         DVDB91RblmvBc6S29i27pXbgUTz3v1Xz00qoJ78y8mT4cwaJjaWFuI0Rc15jRjeyMWMq
         k3Y4k/AfprZAOt/XWztTdTivvSaIZauzJMHfobHLUO6RjapYDcTaZKP5K0bZl3PkeZvY
         D9lphdVyvnaIIbsvclaK8BC7M661Bj8AhqdAePb3hqdS8vf9slL5rJLrV7mmzoaF2B5y
         RCdy3c9YdAUEqTolA8+eanKCFuiHHHzIif9dTSlW4s/ZImWGC8iep1yr9aB+rHxGPI7c
         E1aA==
X-Gm-Message-State: AOJu0Yx8XUWtTrLE7raUw/C8C7UancFHYE5qm5fYKZmIT4qPwXqAOIbW
        AcxzVIoB/UlWb+GNayp7uZZLFA==
X-Google-Smtp-Source: AGHT+IH4lmR4Jq258PPpXzeSJjiXBAi1Ej7YMvp05OASmR/BQW1itlDNeNtxzgOd1xlFJF1azKbmog==
X-Received: by 2002:a1c:721a:0:b0:3f9:82f:bad1 with SMTP id n26-20020a1c721a000000b003f9082fbad1mr6879452wmc.40.1692022222419;
        Mon, 14 Aug 2023 07:10:22 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c7405000000b003fe1630a8f0sm17232749wmc.24.2023.08.14.07.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:10:21 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v0 8/9] media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater than 3
Date:   Mon, 14 Aug 2023 15:10:06 +0100
Message-ID: <20230814141007.3721197-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
References: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VC_MODE = 0 implies a two bit VC address.
VC_MODE = 1 is required for VCs with a larger address than two bits.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 45c7986d4a8d0..9ac253111e572 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -352,7 +352,7 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
 		phy_sel = csid->phy.csiphy_id;
 
 	if (enable) {
-		u8 dt_id = vc;
+		u8 dt_id = vc * 4;
 
 		if (tg->enabled) {
 			/* Config Test Generator */
@@ -449,6 +449,8 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	if (vc > 3)
+		val |= 1 << CSI2_RX_CFG1_VC_MODE;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
-- 
2.41.0

