Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDB662C49B
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234737AbiKPQgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:36:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233325AbiKPQfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:35:34 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24085B59C
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:07 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id j15so30800683wrq.3
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9qHD2IlY8HDaN9Np6/rFRle6GqA3vYAg1s62WKFjkM=;
        b=COAZcUAYfTWSVH8kk6tXeN3WUHw4vgBo7fuFefw4wP72pYk2VIZIpM6X2CLI5rXX+C
         2hVIhnNPFl+7zr9N3QPyx89Nt1KNxDiiTzY7XCeS28KJYfPKmDzhzDmtBq44ZJDFwBTp
         n/zhY/54CgiIWFSKFTwyc9EypSo0WiqXbxmXfTmRrtf27Wm+Lex6R6dGu0ec9TTlGIE4
         fQUct3Ss3GUYBo9jFrNQGiPv9tD2jKgNBFqHxK2bYe9gnu01o66ygovgor9qfJRJsOQW
         uNNBgdWuN8qSaoKcAsQzJcQF36Ok+1hP97h1b48ci2aHaYkAd0NbljMS/yVC8R1U1yYQ
         cW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9qHD2IlY8HDaN9Np6/rFRle6GqA3vYAg1s62WKFjkM=;
        b=ObuI6WeA+UJonrvwUDxJMZ+/MYb5r2d9CFthjsELMzzDfwKQ52SMN2KRgo+rb3bHkF
         2M+wm+cr34+RuB4A8X/vz+n011nMyxzqNkQB/NZ9AFbPe8SAWrrGRIqzsGKvl7fAriD0
         DnmmtZmzNvhnb8Qaen8P8vYzvK5VxTRf8v4kmD2oUJBqvbQ5VoJh8NQfqNF+wvQY6BB8
         NPjc/EY60x/PziMGczAH0eVC8WDaNXmuyXBYfpzmVKwn9RkBCMqlrCtD5lrVhn63FRAG
         loIJ75628dZKF/JK503CeNROIVQe5CF8k1IV5HUkqSHy+6vkk8ILfxiwrHu0iijKZzXC
         5+Cg==
X-Gm-Message-State: ANoB5pl6Xau1EMqt7XDiRVLN83lv7bnfDcfl+l91vpWwPBiw/+sByzfH
        7z996HsBBRmXL9zUl09J7K2HAw==
X-Google-Smtp-Source: AA0mqf7gLFmA+Luc3GP1ks5uoTyYHqk/bPEKSZ8ppyDjOQQ4amQt5jRn+X5OeSV6hfjgAV4T5bpXuw==
X-Received: by 2002:a5d:4fce:0:b0:22e:4704:d042 with SMTP id h14-20020a5d4fce000000b0022e4704d042mr14270753wrw.547.1668616086587;
        Wed, 16 Nov 2022 08:28:06 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm15459168wro.69.2022.11.16.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:28:06 -0800 (PST)
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
Subject: [PATCH v6 1/7] arm64: dts: qcom: sdm845: Define the number of available ports
Date:   Wed, 16 Nov 2022 16:27:55 +0000
Message-Id: <20221116162801.546737-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
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

The number of available ports is SoC specific so we should define it in the
SoC dtsi. For the case of the sdm845 that is 4 CSI PHYs => four ports.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1a257f6728874..29e6d64e74c97 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4368,6 +4368,22 @@ camss: camss@a00000 {
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
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
 			};
 		};
 
-- 
2.34.1

