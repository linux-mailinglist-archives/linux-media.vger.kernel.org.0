Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21757846D3
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 18:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237639AbjHVQQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 12:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237641AbjHVQQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 12:16:50 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BFBE50
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:16:41 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fef5809999so14956155e9.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692720999; x=1693325799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOQ9tyjj8WPoyJd2gELXd60f8pMhiSuAdrU1RFxkiK0=;
        b=uieELBsM44VA5KzhlxYoBcWt6DDdWGr+42NYgtHF9bbZkkDJwKCcPbxQG8HhanlHyT
         yGCmNAuDKgHFWbho9PVKqCllL0b9HnSEdxqyU28X2VJzwA3RqLeN1ig+D3yxES9wLllT
         vKLH4NelEoZre0H6iyBCyWyVeKjOnONSCOJY9IZejBRbc1K+cO1YLuUKkPWVO1CjHcZL
         B13X8hTmGy4zOhZssjRcQZFXqqFP56H2OAfPSmgB5Jb2+BZ5egTPfGXVG+fK3OPnOFkP
         +q8qhECNTalcl+WJFrFjVJL2idy/ho1d48dunrDEhblP/OWg9uIpAIPOKR/lmQZsWR4U
         go0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692720999; x=1693325799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOQ9tyjj8WPoyJd2gELXd60f8pMhiSuAdrU1RFxkiK0=;
        b=AnlCZHJ9HP8boetbtoNiCfa7/bBGPbPR7x0GGs9i7BsTOLzP6lXEAu9kOaQB6AikGx
         oM8QuuDZyZOsUeB7sYAfObWsE8lgFz2IlAJdsKSVyjntfSztQTY9ifbfwc44OD8U20Ze
         ObVtZqvBSIwk3SZjljgX9X5bkMgcLu9KvuyCQluOxPYkSh0K5ZGVc0eZQAM4YIKtAJXA
         hQv2gutHoxvULmI8AESOYGwoX1xJPZAIOmjEKJm/BvIY0yVrwN8pmbInvzIY8Kkkfpqk
         SEtWZkqk1hwu2Yz1Dd4MMR4rUTHeuDz7D7XqhVX+2nTdUlAoZvmE8cIhAQeg0SXxeZO2
         CPgA==
X-Gm-Message-State: AOJu0YwXl/TVNjwXxgjlm/fFXDtb/z9OCFjNTtdL0ZxSJQo7+dPRWsh+
        IyB+CTGhyJZoAxT/82whkKmhWA==
X-Google-Smtp-Source: AGHT+IGrm1B/yM+0GCY/WXRV6kQBI7gVRUFmO3dEvnGxiSxZEBuxPB1h++sXNcD8RehiH8011cLdrA==
X-Received: by 2002:a05:600c:2218:b0:3fb:40ff:1cba with SMTP id z24-20020a05600c221800b003fb40ff1cbamr8090816wml.6.1692720999636;
        Tue, 22 Aug 2023 09:16:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t23-20020a7bc3d7000000b003fe1fe56202sm16516130wmj.33.2023.08.22.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 09:16:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v1 8/9] media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater than 3
Date:   Tue, 22 Aug 2023 17:16:19 +0100
Message-ID: <20230822161620.1915110-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822161620.1915110-1-bryan.odonoghue@linaro.org>
References: <20230822161620.1915110-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
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
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 45c7986d4a8d0..140c584bfb8b1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -449,6 +449,8 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	if (vc > 3)
+		val |= 1 << CSI2_RX_CFG1_VC_MODE;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
-- 
2.41.0

