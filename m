Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 686CB62C4AC
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233265AbiKPQgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbiKPQfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:35:50 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F665B852
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:14 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id t4so12270465wmj.5
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14a7jMDAoP2/kCMIDso2BzoE1kHC+rStklX/7ZEF+xs=;
        b=ErcBG6N1Dzx5Dbpbd3X1gUZZ6p34SuUodutdr5Yf7t8nO+sASJeyEqxCy+Z/1WJ8mo
         OsaEbIwH5mGNleAbamFXN98Sa/OfJD43vHDJIG9WXFh42rTJZ3DGZ+7OvpHO0PVb9sYO
         sZmlNdgbLWyRUDHPL09rFD6yZGwz+16SthklsjkTnzA3YMovHkmGC8Vb6JS3EJ0SHFOp
         oouisIFs7Xo8qJbsEypyKTrdG0XbWsP56jHDxtEAVEdR0Dhw4BgenvBTV8NWBiZMgF4f
         Fk5Nf73aZ2d1QePR+H68Jd9IiAsiQ4uoxH3c3VM853sBjN0hSj/2CPRV1+t+mM9x4dbA
         S8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14a7jMDAoP2/kCMIDso2BzoE1kHC+rStklX/7ZEF+xs=;
        b=UBGi4jPtXr2Cc/ARKpxo9hS26msHPTG7mzpvr7xrBJTGINkeHsCyUHH2YgePIDU87C
         jH2Z8fQcmuQeSAZdwMaQoEGFIMg7TA0JNPEGSEpLIRxlykcVIhXeOk4T6CdfWvoxQze8
         iKg4kpQgcXwLDjfCjHb2WHpqfZKPfWr+6/mKJZyBAFRMKX5gIBelNAvy47ft0T7LEMw5
         OzVA+JqwjnShcbsw7fYHMEo9HW2iwT1sd8G882/RCOJeoVAAK2b9XAH/tk1+PEX6Z8ak
         0/z4Y7B9VPcsSKwLSYng+Xl0FllF/ps3X+PDQLhjFlzEoSI1TIZUWqmixhrgwLZ3Dgsu
         SrsQ==
X-Gm-Message-State: ANoB5pmDUSWBh69jddJDJv9t0eAGwEDmKNhAlSokjdM1R5yvKwKtqaFh
        xLtIoElJs7qyKD84Du1/JYBBuw==
X-Google-Smtp-Source: AA0mqf6VKM2RE23OqT8I0YARh8Ler7ZD0LPYuE0yQYM3WL3RdxlhqsQp20aYlut7r54raeocJXASEA==
X-Received: by 2002:a05:600c:5014:b0:3cf:72d9:10b0 with SMTP id n20-20020a05600c501400b003cf72d910b0mr2704652wmr.26.1668616093596;
        Wed, 16 Nov 2022 08:28:13 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm15459168wro.69.2022.11.16.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:28:13 -0800 (PST)
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
Subject: [PATCH v6 6/7] arm64: dts: qcom: sm8250: camss: Define ports and ports address/size cells
Date:   Wed, 16 Nov 2022 16:28:00 +0000
Message-Id: <20221116162801.546737-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
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

Define the set of possible ports, one for each CSI PHY along with the port
address and size cells @ the SoC dtsi level.

Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d517d6a80bdcb..806aa19ad93ce 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3412,6 +3412,35 @@ camss: camss@ac6a000 {
 					     "cam_hf_0_mnoc",
 					     "cam_sf_0_mnoc",
 					     "cam_sf_icp_mnoc";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1

