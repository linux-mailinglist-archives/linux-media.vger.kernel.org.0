Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1B853E9F8
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238752AbiFFNUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 09:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238755AbiFFNUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 09:20:41 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC3A2CDB14
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 06:20:38 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t13so19844823wrg.9
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FQwiRH8SbyYIRHOU4lVjXun0soxJoAIDMcmiGn/Jje0=;
        b=xx5cq5muegsEvF4gpDl5OHz5d4sNa48M2bl7tgeif9GPubNXfOqT39T6RuX6+b/xZr
         CKiJnPz8tdmu3vyUnZLol4SF46dWOBT7A3MdnsV/4zxLR3pffMnKxNkYC3iAiBEZCJcV
         weAiD/Q4iQmOxcAZkfUiKHZHj3TUx+oKbCWqW5o3k894KHg4MkVnQ0AEh6MzZ1MatoxQ
         ewxGgLyJg8x99oGYunr7UmGfKQyBFEwe8hFwqTVr5TUWsgLrHC+YlgfKE+XMQzMoPtJ1
         aECJaYv4zJLcgDYU3d2iW9UnIxEOml3DScKjk9gRB9cI/6B5FS0iG5snrEeSqQfRfsWC
         5cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FQwiRH8SbyYIRHOU4lVjXun0soxJoAIDMcmiGn/Jje0=;
        b=JgZFwzcLR+1nAYRIsaHcM9I+WOVyGyVq9Rk2xXBeuJwOH6p1dyQ/ok5xR1pcnK1Vhc
         oj28r1VbaO3+2A7ppqbvWdsTbdG838cmLL9Ne/aNJ41fvjCBeJxMk9HIn7IYI+ld2bAG
         eqB0GTntgYXRZ+qQYr7IAo7xur1pjJFQCcikgqP09a5u7kpo8UNlcedaifwBe12vvqdk
         0x4QJYUkOjESM0h061RYscO2xb1K3aKXXX19FX0dLmIev7tidmmYFCr4G0OKXslINgAx
         91ONsu9S0TpMKxwdz+CMYquaM64UWl9aVdXZpP/czp2G9HiUhLW1jJWkw2ujKSze/d5i
         3sdQ==
X-Gm-Message-State: AOAM531KJwIrDuaeVsN3wLlakMvsMQc4c5gRXTAn512abXhKyGKr74K8
        o3FN/6F9GaFemMsCadg1EYYQS0rnIJZkh4U2
X-Google-Smtp-Source: ABdhPJwX8u4hl1HTjoDuEvZm7k82rQox3NkVffQFGprdrtuacznOZElYZq5En1vC3jUfzD4vSmRNRA==
X-Received: by 2002:adf:d1ef:0:b0:215:89b0:9add with SMTP id g15-20020adfd1ef000000b0021589b09addmr14215792wrd.279.1654521636893;
        Mon, 06 Jun 2022 06:20:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b0039765a7add4sm21077810wmq.29.2022.06.06.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:20:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 3/5] arm64: dts: qcom: sm8250: camss: Define ports address/size cells
Date:   Mon,  6 Jun 2022 14:20:27 +0100
Message-Id: <20220606132029.2221257-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
References: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
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

The ports {} address and size cells definition is the same for every
derived 8250 board so, we should define it in the core sm8250.dtsi.

Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 2bc11cad3a44..aa9a13364865 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3395,6 +3395,11 @@ camss: camss@ac6a000 {
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
2.36.1

