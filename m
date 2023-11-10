Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90DC27E7663
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 02:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbjKJBFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 20:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345592AbjKJBFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 20:05:02 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173804220
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 17:05:00 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso20747591fa.1
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 17:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699578298; x=1700183098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYQvDtaR1Rq2jfedJTX47JK1X6rSYRRgJAozvHJVQR8=;
        b=kVm1GepxG7CjuP/CSk3gtvvT6PzrXnahWDwPtHTJpiEa3x7F+jrEZI8WmzPysqmSoE
         OjqPb850bxrsXOly21iA14glW2B07eBnIes7v3WKnRwbUccHLVLlRx6teXZQQZArk0pB
         SyL+UZMspwOu2DtCRRObK/7TkoAAuakXzocNbj/HOQ0OspmEgLAJ83KEIfXnYiwvFl5r
         /lAxHQIEb6aLHsuMvirZN1yuuu6hRDEYGw1yhrZVvpwEbNqtf5cgKrQTnUJbkzSVFXrq
         lrKvqPj0SOTKAP8NbjSPx6tDn7FnmRAxpSwVKhVwlmupJrEBtJFQwwTp4nJhPmyTS2Iy
         ND5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699578298; x=1700183098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYQvDtaR1Rq2jfedJTX47JK1X6rSYRRgJAozvHJVQR8=;
        b=UgXTM4WnQ5KN7UmzRYK887FH9WygVQD4A+IqCE4DqaKx+ydGWH39Dyu5u81rqInd9L
         yEefj60sJA7Rfyhidklf4C+O4yfZ21kXxNQr3W0k7pXZfs8LjwLvaKnh3ZTA45N9NBpP
         yqFGAe4KT9Z5xjJIQR0hIgCgfD5TtthIWfGPCZho0L2QMt+zGWsaEsW9TG93O8oF+wrA
         roxoaFrhz1HWVkwNv0DYh/QIPQ9Ofdo76X8t6yZ5KUTYeGbpCFj4Xs+b71MupbtnCo/0
         lJ2Pi5JO3Q2z8Y44qtWfvwAEChGzOLanriPavQ/gFLKkEjjzg/znG/BS5ZeNV3l7A5O4
         GkCg==
X-Gm-Message-State: AOJu0YxE/9WXXfbMHvL0hBfWTi/RX9GSr27wMmgtROZaaXmZlSpCX3GA
        qmgeHFmUGoCIzyGo1m4wJ22MZA==
X-Google-Smtp-Source: AGHT+IGO6UmvZMd+QDCGUZMGgoA1QAKWo2qz6+2Fs6vQvRw/QvQsKdJg7ZqNXqHhXGL9zsVGvNFJlg==
X-Received: by 2002:ac2:4306:0:b0:508:1332:558a with SMTP id l6-20020ac24306000000b005081332558amr2632106lfh.2.1699578298239;
        Thu, 09 Nov 2023 17:04:58 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d1-20020a056000114100b00326f0ca3566sm820562wrx.50.2023.11.09.17.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:04:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri, 10 Nov 2023 01:04:51 +0000
Subject: [PATCH v5 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170
 to camss-vfe-17x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231110-b4-camss-sc8280xp-v5-6-7f4947cc59c8@linaro.org>
References: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
In-Reply-To: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
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
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vfe-170 and vfe-175 can be supported in the same file with some minimal
indirection to differentiate between the silicon versions.

sdm845 uses vfe-170, sc8280xp uses vfe-175-200. Lets rename the file to
capture its wider scope than vfe-170 only.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile                             | 2 +-
 drivers/media/platform/qcom/camss/{camss-vfe-170.c => camss-vfe-17x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 4e22223589739..0d4389ab312d1 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,7 +14,7 @@ qcom-camss-objs += \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
-		camss-vfe-170.o \
+		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
similarity index 100%
rename from drivers/media/platform/qcom/camss/camss-vfe-170.c
rename to drivers/media/platform/qcom/camss/camss-vfe-17x.c

-- 
2.42.0

