Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C6162CFAD
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 01:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234401AbiKQAcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 19:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbiKQAcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 19:32:43 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132A245A08
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 16:32:42 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id t4so78451wmj.5
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 16:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8ELHDGYZkvIUDG1EOo8d9+2Q92ZZ7kCaKvs0deEyqA=;
        b=W25TP9+nSxFtCu11gy5JbWvSQ9cc/VgfL4wbgyjTvLJ6p7veEZWBh1RtfNk5T/wVYo
         0Z2O/nhaq6pXpl2aq80kjc0KoDJZIBxpQs2LY78Kx8iWpEOSMB0vzJgLuxVLYlhidwU2
         lJvDQV5RpLuGecBmFto2kzBjK6AeC3sr2OBpNXgZtfn5ZEIRzbQGN72uLjH6N2ZHe01O
         maSad5+Q7ZHGkuXN6gU5l83lsiBq67qpFdUWkwf+A6QUQ0Ny/4/IX5NSkbzWKMHuku9S
         zvMcDEsYq0qDYJcQfzyxg3rcrsAxArqcN6WHpUTxUK19IHgbPXNSgOVSnQh/a+LZavyq
         9RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8ELHDGYZkvIUDG1EOo8d9+2Q92ZZ7kCaKvs0deEyqA=;
        b=XOncdTcb/hNjEtC5XgwqG7bwm8YUe8I74bqwugi7Mayzk+RJ4ULQdiXodBsBWkhsLY
         hkFRu5w8oWTxtZ85izS9ZJad3KfdMNdw5xbM7Y5TyreLSYRnhNLR0eEBkz0cH/KjDr3u
         RbfL4AkusTgpF5NZFvvzXN2Q87VHszHnydgozbrSTLaIFJnWyzntvxp8ZUs9UdP5seaB
         5aFUeeJhvBn9/0HruwskYKVbjU/Alcktb0R3Z03fA7piqxaselMgVdTWFtlQL7liMLzC
         BYExTkTNX/ArNFlvs8yq/iaAUujdMhRAQ1p+Q3lwvIrTrd084SpW9zlG+0yfATHnsZnG
         19Dg==
X-Gm-Message-State: ANoB5pmq4hRfQezvYUQVFvoMrmYDAkB0nQ88TP1KGMiI+W0pou1K+4Ne
        qhvAoPcuRW6TCFwtY6SxdM9Ljg==
X-Google-Smtp-Source: AA0mqf63J+419+aiLtn1nm91IX+YhUxYIRBFbwvesdyErzoQds1xxEGLUef1H1Efqewa/T4NyeLd0Q==
X-Received: by 2002:a05:600c:43d6:b0:3cf:a856:ba2f with SMTP id f22-20020a05600c43d600b003cfa856ba2fmr133372wmn.37.1668645160694;
        Wed, 16 Nov 2022 16:32:40 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b00238df11940fsm16472703wrm.16.2022.11.16.16.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:32:40 -0800 (PST)
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
Subject: [PATCH v7 1/7] arm64: dts: qcom: sdm845: Define the number of available ports
Date:   Thu, 17 Nov 2022 00:32:26 +0000
Message-Id: <20221117003232.589734-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
References: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

