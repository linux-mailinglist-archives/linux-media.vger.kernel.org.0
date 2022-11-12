Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD73626AD6
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 18:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbiKLR1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 12:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235040AbiKLR06 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 12:26:58 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6409617409
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 09:26:57 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id a5so11676815edb.11
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 09:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z38NVszeeRzwpeCo7llBZCNOGY8/lbL4u7FRY89ykkI=;
        b=YpP/W7fpkp+243on8JOUUN+Qr+osZ/b3gkWDIGsJmZ9MfG+/hyldpIbn+EfbcH01TB
         J55iN4eU3Zm2saAAsiarrRIGC74qvYX7AL+0eNVUGw1hXaoBbIpxU6/E8yeKoVjjenNB
         +XhN2iZOR9/eCiye9ykYmktilHRc0o040IbT4xL4kUScUYnptO6/RKC7odsQ8kACRXLq
         l+IDVlOaFTXcKpbFQjWACXI2tTd6rH6bo11U/LXdOE68sXEg+URxAJehtABAVncrc2bP
         u45E8FRZyEpqyhOsdALNl3jGF8wvytHIVOaWb+Dht1WbxNbUIVgEzTCbDFdYixdVQytO
         +2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z38NVszeeRzwpeCo7llBZCNOGY8/lbL4u7FRY89ykkI=;
        b=tW0eZ+nDSrsMSL8JS5UvenqM9FSIpUXoAwDaPvnXk+1ITcCuotzI+b0/st20sg7pR4
         ytoJngjlcxuY3BYIWWSLyWFg3dmdq2fV/Wi5DZcPadgV12NDMDoa2S+sxTtfu3aUFTeR
         2CMPwLm7SFWg5/E2o/20/1Rju5YgRQKJJW8MGmxpRWGZkb3Fwp+aBdW+hfLN4o+pla1D
         9dyD6AQImdue7BpAO9G+1B464zC2SXUbg9R1cJrqkT8faNvdgMTzgYcFDuZKdzuY1yyF
         +RAM0y3k7RFsqWDN1MsaSUZ6d017Ekic55NkPEsQGWLjCnlrNU0H5dEjc4hXICgjyvZs
         ai5Q==
X-Gm-Message-State: ANoB5pnxw4DjkgYihiwP7pPzPj4y7UiqUPYER9b6L3j9pcGHeYv/aXEN
        v1sD57UjAcNK/JPAO4HpOPdQBQ==
X-Google-Smtp-Source: AA0mqf5vdXHouvfKT3uRuv95XjECUr5LI2duP59LqQqBrXFB1b4w8za30xzeT0Laae5n7tznzqMt5Q==
X-Received: by 2002:a05:6402:b7b:b0:463:ab08:2bc6 with SMTP id cb27-20020a0564020b7b00b00463ab082bc6mr5854206edb.143.1668274015984;
        Sat, 12 Nov 2022 09:26:55 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-3861-6a56-0346-9c90.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:3861:6a56:346:9c90])
        by smtp.gmail.com with ESMTPSA id qo9-20020a170907874900b0078c1e174e11sm2099265ejc.136.2022.11.12.09.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 09:26:55 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 2/6] arm64: dts: qcom: sdm845-db845c: Use okay not ok for status
Date:   Sat, 12 Nov 2022 17:26:46 +0000
Message-Id: <20221112172650.127280-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
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

Convert camss status from "ok" to "okay".

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 7c88312333c22..ce95b51f17fff 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1182,7 +1182,7 @@ &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 
-	status = "ok";
+	status = "okay";
 
 	ports {
 		port@0 {
@@ -1221,7 +1221,7 @@ camera@10 {
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
 
-		status = "ok";
+		status = "okay";
 
 		port {
 			ov8856_ep: endpoint {
-- 
2.34.1

