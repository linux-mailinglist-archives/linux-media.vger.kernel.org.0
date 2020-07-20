Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC933225829
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 09:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGTHHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 03:07:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16878 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727040AbgGTHHw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 03:07:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595228871; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mvbsyjNOsVr1qUOEhJ50w9899eyqmnSk84iDvKCs73c=; b=gYhP8w1s0pkLvF/Ln2lCSnkGP8nqeNzNIfSKjc1rb0aKQWDJhTbShvnd5537Xm1bnxoJxWai
 +V6G4UQm8TePzeuQr26WdQinoTlu54SNIP/R4KEJ9U/MHoOBHDDmKdK8u0CvnozxVi7dlVBK
 XTMjv8ZRSOuulaBpcYthzMU9cLQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f1542c7512812c07004fac3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 07:07:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C401BC43395; Mon, 20 Jul 2020 07:07:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62F69C43391;
        Mon, 20 Jul 2020 07:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62F69C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 3/4] arm64: dts: sdm845: Add OPP tables and power-domains for venus
Date:   Mon, 20 Jul 2020 12:37:21 +0530
Message-Id: <1595228842-9826-4-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595228842-9826-1-git-send-email-rnayak@codeaurora.org>
References: <1595228842-9826-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the OPP tables in order to be able to vote on the performance state of
a power-domain.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 40 ++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e506793..5ca2265 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3631,8 +3631,10 @@
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc VENUS_GDSC>,
 					<&videocc VCODEC0_GDSC>,
-					<&videocc VCODEC1_GDSC>;
-			power-domain-names = "venus", "vcodec0", "vcodec1";
+					<&videocc VCODEC1_GDSC>,
+					<&rpmhpd SDM845_CX>;
+			power-domain-names = "venus", "vcodec0", "vcodec1", "cx";
+			operating-points-v2 = <&venus_opp_table>;
 			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
 				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
 				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
@@ -3654,6 +3656,40 @@
 			video-core1 {
 				compatible = "venus-encoder";
 			};
+
+			venus_opp_table: venus-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-320000000 {
+					opp-hz = /bits/ 64 <320000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-380000000 {
+					opp-hz = /bits/ 64 <380000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+			};
 		};
 
 		videocc: clock-controller@ab00000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

