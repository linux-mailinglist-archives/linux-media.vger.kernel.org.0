Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B833626ACF
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 18:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbiKLR1B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 12:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235048AbiKLR07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 12:26:59 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E7C1742E
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 09:26:58 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id i10so10511884ejg.6
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 09:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U///bHfyu+eJ33f5aGcqLhAu/znMGGv82jQ6Af73qs=;
        b=wj648wajgFLhCRVsxrcj9DqgbvLXCkILxv/+4oZ3pteJUbDYLTTlM3xMbUddSTBtap
         7sqWrQeniUFY1mzbMNYRsPqsgS40AluJg77gDi0rhKRsR/mZ0lNygjFThK5Nf7brax+N
         Dya7Am0sZR3QOl7jU0Qr6Pq0Jb1gnPURJ4hq6ZEph/Gy/LZ0U8O7X8KwH9a6Vsnjfmbu
         9LzvESKf2oVXrCvMedE5/kvbQxsCL89risnW9+74h6iuwPLDLZDWweJNJKZm/uLbh309
         6zZDG52q4PiH3HZrNrxG/uoeJgwIBDTc4x7R3g/iHJKyMAphgs+9nXNrs+7qmF/Y5kjp
         x2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0U///bHfyu+eJ33f5aGcqLhAu/znMGGv82jQ6Af73qs=;
        b=rAAxLrgjxCxtwRvPgB13do60YWx1PDdQNfZ6QnkcfCHPkUB24AnmrX5DSHGhCos7NN
         NurIl/USFtCK6XGWXzrB3KGotBRWk6exiKFAfjOISN+3c3w13lfnNhUbaxlwD9fNx+7n
         jXVqAtdLPTh/KAuW8Ti7L9FK7wK0/DTwsyXN4WDNmSW5MbLBZHQ682cBk/Z/IuUq8IZ3
         k4jP5gRE6CG5ZLmss6sEONPhqOGVi0rOGeirtO9XzgV1dj5gYxm1x1uC9WCucnZcFr5F
         rSokV1+Mx9NtvaOMD7JptVN9npwem3Owcqk1ES+fRcv0y8o/0ACNN7gyrA3Onj5DxGX4
         kf9g==
X-Gm-Message-State: ANoB5pkKRps/Mx+KKXm16gqe96Ee9Xj7sfbNMyCLJIsHnR/E0+NZu89F
        yPwF2JKvm2FXU3Dzekedopqx1w==
X-Google-Smtp-Source: AA0mqf4SkjaKZ9V4hMiOv/JrPh/ow6CTPCVna8uWh4Yt2L4DrT22MtMPMORJF2XXJ0zSDL0TxX+V7w==
X-Received: by 2002:a17:906:5048:b0:7ae:e9c1:760f with SMTP id e8-20020a170906504800b007aee9c1760fmr1468535ejk.18.1668274017153;
        Sat, 12 Nov 2022 09:26:57 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-3861-6a56-0346-9c90.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:3861:6a56:346:9c90])
        by smtp.gmail.com with ESMTPSA id qo9-20020a170907874900b0078c1e174e11sm2099265ejc.136.2022.11.12.09.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 09:26:56 -0800 (PST)
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
Subject: [PATCH v5 3/6] arm64: dts: qcom: sdm845-db845c: Use status disabled not disable
Date:   Sat, 12 Nov 2022 17:26:47 +0000
Message-Id: <20221112172650.127280-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
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

Use preferred status "disabled" instead of "disable".

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ce95b51f17fff..5da91c646c200 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1262,7 +1262,7 @@ camera@60 {
 		vdddo-supply = <&vreg_lvs1a_1p8>;
 		vdda-supply = <&cam3_avdd_2v8>;
 
-		status = "disable";
+		status = "disabled";
 
 		port {
 			ov7251_ep: endpoint {
-- 
2.34.1

