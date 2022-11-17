Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5E762CFB0
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 01:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiKQAcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 19:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbiKQAcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 19:32:47 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D789528BF
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 16:32:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id v1so248932wrt.11
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 16:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcJ7ckAKj+TSphLa5849tAwMuokA6a0ep+HYiPX+3Ow=;
        b=cQQvvk1kDr4i4SBvObsya6cZwKnIa16mT68QlToRDuYEs/24YJEWoLI7lQdWAyybUB
         MbsEFzzx7xQ4B4PWJlkj1ZZDXuVqBlvqViCn6U89TfQnaFN5k+MlgpzsgmIPz38Zh2J1
         B86iRBXOrTajo5rvv/zirLbuKUzwMAKC84WZDufEK4k2WIuec5aAiietxNISWNEGZDNj
         boAWuKkzNoNDJixiQrvZCehXqUqJQU6ReXiHy1vYF/S0LPbg6SvyS9LWQbfXN2s5ErpT
         5U7LMWBwsGwjg1dzPL4cCIyEMpg7VHfJciz9JIrc33oNueWRykZ/P/9bfa9W9KB2HgAe
         OTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcJ7ckAKj+TSphLa5849tAwMuokA6a0ep+HYiPX+3Ow=;
        b=5S8DENVOhcetQ7RuGeIOOCEpUIzVz/Lf+/UNV++DlxOYkilR8ntf/1eEZYGNvktE+Q
         SEVFqDvNIbfnZqwiyb5uWQ9X0zRKF7GRM5KXhlJTqWHzRrZBhvWATLac8eTXK3Da5Nsu
         uWOWZOKFVEy7D1HXxP0cXdtAxHuNmxbIsAkErHJ/7N4p0IxLhqoE7jNgiMmb9RZjjcyo
         ee+PrbM/oeOou2UgycCFyVIJlIUQND75XCYVEHUVkZM42w2hS+cSypQDLMUfvP5LD8KI
         m63qlBc67ST7b9ewDLx3lSH/l0/+KMdxnshoNZW5d01vVFGZ6PBgYjqg9hrUay10c7Iu
         tGCw==
X-Gm-Message-State: ANoB5pkLDShJlS05AvyA1OEtFs2USAX+ohGW3R1f/EnKkf3DGkykdpyj
        F4Tv89lhiIiBORNwPd+rY84MPKnKEfQvFQ==
X-Google-Smtp-Source: AA0mqf70iLy8S8U5QPDOOmqfP80gM9a/zZ1GBcJW3JaLKQ5aX/3Z2mYMeq405Rgw97SmXGsC0yPzJg==
X-Received: by 2002:adf:f951:0:b0:23a:2311:b35 with SMTP id q17-20020adff951000000b0023a23110b35mr36523wrr.183.1668645164922;
        Wed, 16 Nov 2022 16:32:44 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b00238df11940fsm16472703wrm.16.2022.11.16.16.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:32:44 -0800 (PST)
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
Subject: [PATCH v7 2/7] arm64: dts: qcom: sdm845-db845c: Drop redundant address-cells, size-cells declaration
Date:   Thu, 17 Nov 2022 00:32:27 +0000
Message-Id: <20221117003232.589734-3-bryan.odonoghue@linaro.org>
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

