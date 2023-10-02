Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6287B5526
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 16:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237756AbjJBOUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 10:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237740AbjJBOUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 10:20:37 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF27EA
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 07:20:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5344d996bedso15220161a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Oct 2023 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696256432; x=1696861232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3IqRDQO3YMqUzu0c5SK0CfZMleyMRbL6H+Fh9GL8Gk=;
        b=30g4eMrWlMyBhabHisXWqEIatsSjDwWwPdceCWbL8z0f+GQwKFnRdUNXrQSNrPEqGg
         SK1+1BYenMY+AIEQnQpIw6jYLBaxOZ/VITRhXOxc+EQbV9mzHrc3ZBHAC8XX3v5wzdul
         OISuWWMWnY4SKbOZhlaAaKzPlIa/9BWO8t0emwJlqVe0/8K+XU8YQ4ZR0pDQMPLiuEc7
         qS4OfkMvlmj0kPdQUnorTU4HlWg/j/gLneP2fSg4ubTY222Jpn3YmZd/5XIWCDai+s0i
         NiwZLyFVvJwgh/bo8r8ca1Z6mhaquRHT5mwnYCQwGbrijny5NIBuAKhCj2SGv4soqxFX
         jV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696256432; x=1696861232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3IqRDQO3YMqUzu0c5SK0CfZMleyMRbL6H+Fh9GL8Gk=;
        b=tpN6t9ZsPOPfLgd7o9yO9ayk3UW1WP8mVagO46/49PyapSnesfmgG3FAPaOjm3EAAA
         P8rs0Dj6u/c+s4QpD3DsQ+W0cs3NAimj4pNcvDOiZ8L5pKkVf9qqHbJNGJDV1Egim4lh
         0CP3jofX2aUrLpVMS4WVI3MmV+9Fi7zoAl2fCcUDHKStKnUjCVPhKSSxYfiqIX4T6EC7
         sPfAsueeRZSyCYcPeFgCkMhz+esk5evFlcGalmu0/I+tbDFfq+8WMC2HWIaIVjHUnPHq
         srS+WWB3vnxnVVIZOD7C++XUt+iuYCLF2juhlm4l0u62oIX0HWNmK9h6ZE8J2Q1PfNzu
         KAww==
X-Gm-Message-State: AOJu0Yz//Z6DetqnLUgHP+E3ZWivudh2wuAHqoAIwyP0LY1kDhFrC2AR
        Zw/mhsXWVrGokeFEWgWKOwRHBA==
X-Google-Smtp-Source: AGHT+IGOmdaZkFNtJWoBrZfjARmVpapUvSwzEv/rUm1T3TRWBoQTDESQR1ggJr7My1p3UmTBpg+BeQ==
X-Received: by 2002:aa7:c584:0:b0:530:a226:1f25 with SMTP id g4-20020aa7c584000000b00530a2261f25mr9383353edq.17.1696256431920;
        Mon, 02 Oct 2023 07:20:31 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id w10-20020aa7dcca000000b005309eb7544fsm15583356edu.45.2023.10.02.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:20:31 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 02 Oct 2023 16:20:30 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: sc7280: Move video-firmware to
 chrome-common
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-sc7280-venus-pas-v2-2-bd2408891317@fairphone.com>
References: <20231002-sc7280-venus-pas-v2-0-bd2408891317@fairphone.com>
In-Reply-To: <20231002-sc7280-venus-pas-v2-0-bd2408891317@fairphone.com>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the video-firmware node is present, the venus driver assumes we're on
a system that doesn't use TZ for starting venus, like on ChromeOS
devices.

Move the video-firmware node to chrome-common.dtsi so we can use venus
on a non-ChromeOS devices.

At the same time also disable the venus node by default in the dtsi,
like it's done on other SoCs.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 5d462ae14ba1..cd491e46666d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -104,6 +104,14 @@ &scm {
 	dma-coherent;
 };
 
+&venus {
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x21a2 0x0>;
+	};
+};
+
 &watchdog {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 66f1eb83cca7..fa53f54d4675 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3740,6 +3740,8 @@ venus: video-codec@aa00000 {
 				 <&apps_smmu 0x2184 0x20>;
 			memory-region = <&video_mem>;
 
+			status = "disabled";
+
 			video-decoder {
 				compatible = "venus-decoder";
 			};
@@ -3748,10 +3750,6 @@ video-encoder {
 				compatible = "venus-encoder";
 			};
 
-			video-firmware {
-				iommus = <&apps_smmu 0x21a2 0x0>;
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.42.0

