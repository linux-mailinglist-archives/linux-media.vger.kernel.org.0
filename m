Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABBFE7E158E
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 18:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjKERpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 12:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjKERpK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 12:45:10 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CEDF2
        for <linux-media@vger.kernel.org>; Sun,  5 Nov 2023 09:45:07 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40850b244beso28857695e9.2
        for <linux-media@vger.kernel.org>; Sun, 05 Nov 2023 09:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699206305; x=1699811105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=hetBiWVmbJDT0Wgd6EaZUMTJE0osAuIPUXe7wjXP0qI8CxKvZAkg7jKQ2+OW4If7v6
         6ogx8if0/2USLBGpuwgtBDpRKtJ4JI7S/RD5OyoUEGvaiSba16tFOtDRPu/+6ygOONHp
         6u8qHaY6l74CO1FSJlwTTD6A3RzPGVXyTbXSeOGT14kFHO6CtxlTRkPsGsFWmjW/RF2v
         hkGD8ft88Zp9I7rXYK9Ax5c31xNMCjjKH7jDbEruhNhgMm0TooZyjWAhT3Y6AHsoV7eT
         utpeMNxOoGOOHKhSuqEcV9SR+Hd1oNqtF20xOG7DuCAubz/fzcGtleDCruB+0Ki9VMqc
         80+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699206305; x=1699811105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=jvOgGb3OomRPEAnXi1dsROmIX1oMhRhqDLn/KGM9hiKHk6Na+yjOsxxkEyw2sssDS7
         RP77+fMZmnp8SI5tT5ZxtMuVOThQluvLhx3P3SkatsxGXfQDmz/Fq8T5ejejJ+ETCGZl
         Fdv7J0pybM5pMbscRjGdkgL9iCmNfoGBeMXXs+WLDKcG6xz6/hfBL14UsCObBmAUWJvW
         euY26Ip2s+Wa3moUuEYiDgGeOD3714crAY3E4dL1bmH9AskYfHdnYgYF9VYvQ9/fOpEf
         DWDRENcdqdD4suicSs8i1b4CNyeAY/ZfXQ6TU8xK7Hh2GqNFFP/tutio4qA0YOZZ3fjp
         zEQg==
X-Gm-Message-State: AOJu0YwqbLSlMUlkCCugeQhZfHl++JorcRONbFSgzDQwQR/VbjCyzMiL
        BBUYtD9S27vzPgkawCK8QlvU8A==
X-Google-Smtp-Source: AGHT+IFB+h55Xf4s2VnkpNXIbIgE69lt05jIAsBbi1JAmQQV2biLYbRHgAdd2ZW/RG9KLrLp7HJ1KQ==
X-Received: by 2002:a05:600c:1988:b0:409:19a0:d26f with SMTP id t8-20020a05600c198800b0040919a0d26fmr22382181wmq.23.1699206305679;
        Sun, 05 Nov 2023 09:45:05 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c198a00b004064ac107cfsm9553346wmq.39.2023.11.05.09.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 09:45:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Sun, 05 Nov 2023 17:45:01 +0000
Subject: [PATCH v3 2/6] media: qcom: camss: Add CAMSS_SC8280XP enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231105-b4-camss-sc8280xp-v3-2-4b3c372ff0f4@linaro.org>
References: <20231105-b4-camss-sc8280xp-v3-0-4b3c372ff0f4@linaro.org>
In-Reply-To: <20231105-b4-camss-sc8280xp-v3-0-4b3c372ff0f4@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds a CAMSS SoC identifier for the SC8280XP.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a0c2dcc779f05..ac15fe23a702e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,6 +77,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_845,
 	CAMSS_8250,
+	CAMSS_8280XP,
 };
 
 enum icc_count {

-- 
2.42.0

