Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78996626967
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 13:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbiKLMlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 07:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234762AbiKLMll (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 07:41:41 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B0B12AC2
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 04:41:40 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id q9so18285443ejd.0
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW1r5A1hXNoZH6nEqF4dUZL+EuJMyzrztmVIxOhjiNs=;
        b=IHyV91eZUWesaEnBQt3Uc/qb6bKbaUd3PQnusUby1uiH/Jm4L2QnrIvjaJJwAyUjca
         Nz5EeneyuT+8B2zo9YByPOXf78nNS5WLfPPOL2arQohQpLWcEVOUkUe7FWfDl+tATS9e
         NKsF5h0wHW1sA7WnuMz2jSLR86/zVrDhuxqfOYO/WSfxFuDmeEWbzZhBGjNsRg+baCgG
         46Gt0eL3nkQ6VQg0EYySgtYElq9UUmfp4gNl3+zpNJy3FvKVUsbzwNcgMtEWyqijFkwN
         yj6VPzyM0PidUXSVLbX3U7taMPYCRblZy0bRRGqf3X0pkn6jFXOzzv47XEQU7snyaEfE
         39RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SW1r5A1hXNoZH6nEqF4dUZL+EuJMyzrztmVIxOhjiNs=;
        b=c77sPF71cgwZezsL3d67dLMrXIdTxU6A06swQpeHUBM+UHNSeVU5ZKKkKlXkn7gu/G
         1z4dkWqg7XDD8IOfVk0KN53ou4frzay3kjYG3M7ohrsCbDfC9/B8VGDd5Jfh8XuiiOkJ
         G2o0sucz6/0nin64mojyPSG955ovaLMdJceUnbZBxcF8DRiyCbH15yf81wdmyCOmEKf5
         sc9Y+OiY2DRcLQgPTzw1DZL8QcMWPAnWYH99YvImXn9v3xtmFjXDMkUR6j052h8zFsb1
         yoLs0f6OsVjsycCFNjHLCbSTcz2Uao/yxPBl+HLlcrAyGlcCFnS0G5udFU2sOHArbuqQ
         JFww==
X-Gm-Message-State: ANoB5plGX/sZsCfQ2pVin8qoiZIiUUyb6oW4CX5D9FzKWZipNW/EPT3n
        nbV/zJqCZrh+4hyX//wf9TQ4Ug==
X-Google-Smtp-Source: AA0mqf7miIuB1aD5MeGdZk5K8VN+Mb57ynDaPc7xJG+Aj9qSIoiEjVVPDuh1ju3hc4WeYvaebyrvSQ==
X-Received: by 2002:a17:906:4e48:b0:73d:dfb2:d188 with SMTP id g8-20020a1709064e4800b0073ddfb2d188mr5156360ejw.426.1668256899050;
        Sat, 12 Nov 2022 04:41:39 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-7e82-4de3-e7e5-df38.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7e82:4de3:e7e5:df38])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906585700b007317f017e64sm1882915ejs.134.2022.11.12.04.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 04:41:38 -0800 (PST)
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 1/3] arm64: dts: qcom: sm8250: camss: Define ports address/size cells
Date:   Sat, 12 Nov 2022 12:41:24 +0000
Message-Id: <20221112124126.86815-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
References: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
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

The ports {} address and size cells definition is the same for every
derived 8250 board so, we should define it in the core sm8250.dtsi.

Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d517d6a80bdcb..f28a8893d00d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3412,6 +3412,11 @@ camss: camss@ac6a000 {
 					     "cam_hf_0_mnoc",
 					     "cam_sf_0_mnoc",
 					     "cam_sf_icp_mnoc";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1

