Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B3362C4A6
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238889AbiKPQgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:36:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233712AbiKPQfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:35:45 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520E45B5B7
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:12 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bs21so30778460wrb.4
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcdtstQsKk2G63NblmToYrdyw9q10P2eTnPQzla04GU=;
        b=zCHMIGJzKDLbats4swtoMM1D8XMvqwhkzRsRppgipyKpsfyMk5xvczkheKzLuUjVno
         n33txhCkwLs23qxttmYwcAmpabdkIlp72czL/RV81jkdlxE4yCWZ00YW+2K2uSwYIY+e
         HgNhsvXk6RLduB1+3R6rkJ03C4oGrPiQA/s2dhNp0PVZC/OfWDL66dOeS/Q1xpb2Pp8y
         aq0dwX5zsi9rcPm59ep48Kn6jMz2SmBOrSGVDvB8amMSLK/WhEB8XKjBOz40KwckbQra
         VovTVfCB5fQt6C5tD50zPLCZ7LC0X4kB5v8v1qJ+4SgnhbxOs9dtpJoQyZhG4YKgf6lx
         WF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcdtstQsKk2G63NblmToYrdyw9q10P2eTnPQzla04GU=;
        b=njQKeHq72FTLkT0o55i7KbIYq9yF7MMDv9YHjtTymKFeNCWQnldjgpXwLrXSjXfPQr
         NK5jUXFmkgJTCeUrF7/x4dcLeaQc71FPGq7Os+Mzbhu2QQHkfIp/ZGRya+ox2bRJPeiz
         a5LQBd56QnaKKouTADi0nvKfntl7uODCjUx6R46+STWgA/J8r6hCKIJ1MEvUSiUNOhSw
         A8IzReE31S/VSefTXpJ6EGBBt8ijIiF5jGKY/Jmqq7fRGYHQ/SvDPHxBCIh99A+IYb/t
         1oML4XxNS+VUwCofRrBXtuvEiticHNwVzZ31ydkK/34+4r/bBUGF5jJ/1N+p2I2iFSgn
         l7Lw==
X-Gm-Message-State: ANoB5pmaZXqMlC6C5PVhX1SMcT5ls6RcQA37F/QEquDQvnq5DiUXAkH/
        +RsOiRrHHyAR2AJntAq6qKJH+Q==
X-Google-Smtp-Source: AA0mqf4tYijA5dOgk4S/3K6bt8Z4p4SuDxV+LwxSB3hzz18pFkUmYpPb58OgnyYkTX4JLTTfJ0cQ5g==
X-Received: by 2002:a5d:4f8a:0:b0:230:55fc:5de1 with SMTP id d10-20020a5d4f8a000000b0023055fc5de1mr13928741wru.500.1668616090898;
        Wed, 16 Nov 2022 08:28:10 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm15459168wro.69.2022.11.16.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:28:10 -0800 (PST)
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
Subject: [PATCH v6 4/7] arm64: dts: qcom: sdm845-db845c: Use okay not ok, disabled not disable for status
Date:   Wed, 16 Nov 2022 16:27:58 +0000
Message-Id: <20221116162801.546737-5-bryan.odonoghue@linaro.org>
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

Use preferred "ok" not "okay".
Use preferred status "disabled" instead of "disable".

There's no functional change here so no Fixes has been applied.

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 8a98f3e86b41d..be946f71666bc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1182,7 +1182,7 @@ &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 
-	status = "ok";
+	status = "okay";
 
 	ports {
 		port@0 {
@@ -1220,8 +1220,6 @@ camera@10 {
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
 
-		status = "ok";
-
 		port {
 			ov8856_ep: endpoint {
 				link-frequencies = /bits/ 64
@@ -1261,7 +1259,7 @@ camera@60 {
 		vdddo-supply = <&vreg_lvs1a_1p8>;
 		vdda-supply = <&cam3_avdd_2v8>;
 
-		status = "disable";
+		status = "disabled";
 
 		port {
 			ov7251_ep: endpoint {
-- 
2.34.1

