Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8915D53EBE8
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238759AbiFFNUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 09:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238755AbiFFNUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 09:20:38 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B66D2CDB14
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 06:20:37 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q26so9471411wra.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sgUjeNlYCE2nYrQ7xP8GeK8Sj5Es/x6D2DUJducPl+M=;
        b=gs1jm6cYaHi/R4B4i2IXqLxSLgCLW5D8bJ0qE8y0V4V8hAEO0a1XKaWPf2B9qCcgyE
         eqWXuppo34l0HST5FuG6Pmu7xF900Mu+uZdlK32kq8HtrPxrAVXcJ/5KedoOszv98P6I
         +zN/l/qd20ByBq5AX6zY0AuwDoRYus2HTcskl8/c0GSb/ekQ2w/XgtfVGJHuITxMH5JA
         mIgKVocyuwLAG2cS0CNxJ4PcHOE5hjjT21DQaUxS81YO04S42/UvvZtnaofhdduo2YYT
         Ky7I1JjF8K68ag5Z2fCvHzA743DoGTXHP29HMIHhfwUw/8HHXMYSRV9Qc2w4EbR4yJJ4
         8ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sgUjeNlYCE2nYrQ7xP8GeK8Sj5Es/x6D2DUJducPl+M=;
        b=0ZaNx99lSOj1dmTGSlxqmFbolFX6lhMfxSj4EUEirUk+O3bOeYQfBuBRH5rBLXKVRf
         u15JZLMQYivjd5BkX9wiqLp+Fd4bJAkY8bPKbNmT01We2ILsXpPBJpxgn03pVLxBPIMJ
         qhZgBBMnMJ0oD+P4pBc6NJzFLvE8xHeoe60IUFZFgc8NM6oktUbrmh8YSer4MdESscJZ
         6/xCIEEKyu4LA8pOAU123lIUczD3BWm6mb5pOZa6/h6sMZpn4kLf6rb7Y4cGBoYQ6O8c
         ebR7a8le4Njtt3JRCDfvDnCiGJD9T2TuDTHDHvuvWsNXeTwQpp9sKaR+n788tY564yf9
         W92g==
X-Gm-Message-State: AOAM530u5yeH4uQATcA1eW+qIfMZI9WDLp2QjhedCaQMUWw4gzMIR2D3
        lpBzS1BxbjmfeSNw+JwcpOH8GNXdSVy3j2vR
X-Google-Smtp-Source: ABdhPJwiHfOx9Gfvc833lTes4n2Kiyunp6CDpaRHWSLPfHi7D+3hwmmoNrIxNexiQXhcqtdmr3rInA==
X-Received: by 2002:a5d:4f92:0:b0:214:c773:d615 with SMTP id d18-20020a5d4f92000000b00214c773d615mr15220786wru.525.1654521635628;
        Mon, 06 Jun 2022 06:20:35 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b0039765a7add4sm21077810wmq.29.2022.06.06.06.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:20:35 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/5] arm64: dts: qcom: sm8250: Disable camcc by default
Date:   Mon,  6 Jun 2022 14:20:26 +0100
Message-Id: <20220606132029.2221257-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
References: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

At the moment there are no changes in SM8250 board files, which require
camera clock controller to run, whenever it is needed for a particular
board, the status of camcc device node will be changed in a board file.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index cf0c97bd5ad3..2bc11cad3a44 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3407,6 +3407,7 @@ camcc: clock-controller@ad00000 {
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
 			power-domains = <&rpmhpd SM8250_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
+			status = "disabled";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.36.1

