Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA5552B97B
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 14:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236222AbiERMLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 08:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236308AbiERMLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 08:11:15 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1365A3BA61
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 05:11:13 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v8so1325548lfd.8
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ENvXu+nmn3kyb9H+0ZeCKYYHHyXbkqj1LHdwtAGdSg=;
        b=whGvaDFXtPjWJjERWS3MYYHUgg39F7kI65IjOQv09J4z265YWLvU27qa6tdsTR7Eln
         nT3Oq2UZF7zHS96hgzVIgjzMoZtwWlE2sHQGq7QJSJstqXXrHUKSOxK5o35iqc4X1qm/
         BdmY6W23p3ZVWpbcgdp4lSZ4L4c2JeJCVF+W55wRnoIX7iHTUGW8/9xr4TYCw2g0d971
         +B0qTyFdV7itCadyuD1K5LYVLv4uzeie/Y3SBzVhJqGR1UGtVUlVF3/4ayGLdgYyGcQQ
         J9BWPUAxtYvWVaXbTi6aB730Y3rHRMo2pQ41/Q2SezRzYsbvI9gj54eteYOpZJj/bVt+
         33Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ENvXu+nmn3kyb9H+0ZeCKYYHHyXbkqj1LHdwtAGdSg=;
        b=TYaX2yo6BZNH2ff8RE0ONkCXCJKKcDjwoAinZHcEiC2aMzFpR6nkL0OfX0KAiNYmd/
         jVsMjI1933YNWzAH45S0+9a8QjmduwvtCoPRY/lijU9WI0+2OfV4up19gY0KxThiWISD
         VfHW4lwMzwnrlD4ETVtNbbcl8PIzH6hbJ+6DlvoVpb369Lz2d+qhGKO9YuACwigO4xF9
         fHPBUyzWoFEaaYRYG50ebFd/xRrr8+fOzuwLC8vT9CIWBHMVV/dMSu23RfcTev9ufFtZ
         3QxbpgDBSDf2xI395h8kEcqPJOqT8pTHShYgkabuyy3tak5JPMlrbSeZkueii16kEoay
         SL6A==
X-Gm-Message-State: AOAM532njm/neQkA2q2Bz3J4zgc1J3cjnTB5rWS92+bqg0bPWAWZSsty
        oj77kX+RMvGStAtzvHUZ8uiXPg==
X-Google-Smtp-Source: ABdhPJxeHTzzDWGQYLcuzUk6Jc2MaylhGO874SauCO4XaqINd6x6qsTPHrJq4q/KH4b8aHCf8iT4pg==
X-Received: by 2002:a05:6512:6d2:b0:473:a7cb:8f06 with SMTP id u18-20020a05651206d200b00473a7cb8f06mr20341004lff.267.1652875871450;
        Wed, 18 May 2022 05:11:11 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id o8-20020a2ebd88000000b0024f3d1daeccsm194460ljq.84.2022.05.18.05.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 05:11:11 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: camss: Add power-domain-names property
Date:   Wed, 18 May 2022 15:11:04 +0300
Message-Id: <20220518121104.951621-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
References: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QCOM SM8250 camera subsystem depends on three power domains, at the moment
all of them are not differentiated one from another, however the power
domains compose a hierarchical structure with vfe0 and vfe1 as subdomains
of titan_top, also managing vfe0 and vfe1 separately allows to get more
fine-grained power control in runtime.

The change should have no implications on any SM8250 CAMSS users, since
none of the boards supported in upstream enables the camss device tree node.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 26afaa4f98fe..d7bd20412f06 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3289,6 +3289,7 @@ camss: camss@ac6a000 {
 			power-domains = <&camcc IFE_0_GDSC>,
 					<&camcc IFE_1_GDSC>,
 					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "vfe0", "vfe1", "titan_top";
 
 			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
 				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
-- 
2.33.0

