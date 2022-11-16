Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B822362C49E
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbiKPQgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233981AbiKPQfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:35:37 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0C35B595
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:09 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id k8so30800544wrh.1
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcJ7ckAKj+TSphLa5849tAwMuokA6a0ep+HYiPX+3Ow=;
        b=oHrKRxA04iAj9pCWnrSypLG0zSX8qs7AKEP1cV75mt845OUgUPjn98qqiZV+wZVp5K
         1RqwZNTolKt05H9r06VS3GOFABjlUkuuV0mBP4HU3XH6Jk/arfQWUxmVWpysL7KzEQXD
         JOWuyVzValnVzqawhEUZGPtMItgQTgJQMpYbTkFYAb4h7i0GKzlW23wagsFE0eT7c199
         NRkWI1i1FEmw6mkXmcPBbnAvVjUyPNQl8xfEFhaeH73bsd8qacILFUF6KUadGI93XYCo
         qs+JRHAWnDMgAoqH6Eo6uPWVmKZHds+NwuCWgGqKF5a5foV44suoQql+OFxiJIXGZjWA
         t1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcJ7ckAKj+TSphLa5849tAwMuokA6a0ep+HYiPX+3Ow=;
        b=shomRWbjyzkgo4VJbrI9UuRh84wijJN9rmSPoYPN7afWgLKIzY65XDUFcp5S4a58uj
         PBzBazkIhe+7NmVoVr8axXVP1tQvqlAOjBdp3Qft9JUa+Q1CAFaj0PiJrreSFmz81Weh
         tySjEqpAwHvw3ofV2tFQJW0RaQdda9pi8HwNzG3XOcYXdU2+2kHUHMq9Homhmre5DAJD
         GI8JdWrXBR95Cq0ZPNxDzlqi2NobyErf3JOfb1UkGCk++cb+a/8WgazriZwfsrPaN/Vw
         RLBPga12oOoOtCe6bRNfMhGoSgA5NLzxBkl/Gw5kBifjcyziLd9iuLmuICqR2aTdLfHw
         S60g==
X-Gm-Message-State: ANoB5plucLHGKaVXtJHvzhZMFET5BgPMbsmn0hMjMbTc56D61hHdw2TL
        uH10DRbFIv1mhctK5TWpSsHfGw==
X-Google-Smtp-Source: AA0mqf4Y4K/3mnENkTauwej3hcP2V4HHKRPFC1ohXK+hhIDxruJ77ArB06OzOzGTiAFnogCyEUdnHQ==
X-Received: by 2002:adf:fc8f:0:b0:22e:362e:570a with SMTP id g15-20020adffc8f000000b0022e362e570amr13591485wrr.127.1668616088209;
        Wed, 16 Nov 2022 08:28:08 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm15459168wro.69.2022.11.16.08.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:28:07 -0800 (PST)
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
Subject: [PATCH v6 2/7] arm64: dts: qcom: sdm845-db845c: Drop redundant address-cells, size-cells declaration
Date:   Wed, 16 Nov 2022 16:27:56 +0000
Message-Id: <20221116162801.546737-3-bryan.odonoghue@linaro.org>
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

sdm845.dtsi camss already defines the address-cells and size-cells for
camss, no need to replicate in sdm845-db845c.dts.

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3e7ceb0861eb0..7c88312333c22 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1185,8 +1185,6 @@ &camss {
 	status = "ok";
 
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
-- 
2.34.1

