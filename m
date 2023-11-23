Return-Path: <linux-media+bounces-920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D047F64B2
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 18:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 768ED1C20DFA
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 17:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1F33FE36;
	Thu, 23 Nov 2023 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1NGys4j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8E5D54
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:05 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332ce50450dso702527f8f.1
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700758983; x=1701363783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X26+8wItEuS2j+BVlRHOHS9xadXwL+/+KykUmMySayM=;
        b=U1NGys4jSXa478wAcCoNa4IIy5tjcOydyInU0h3s6KQ0M7pFJKxjmXq9X+ARqlPpy7
         pSgr0V0ec0kVVflR5Sy7EODi1d2D+wuAWnqkY+cLd725bUjBZkK+K1LOANiPxHwVQyWS
         0AJXXtd6x1aPjx//Pfo04CBOUWiFWTw9sjuFrPYcvCqqLFWmDbnmnCipYRWNyTum8EoY
         rB1xYzPGChS56b0NVaU/hfkJt91yDfmCjmMAEkmZLsVgE1qZB2x8XWToNBkyOduGQrl7
         fWYxmjfflN/+R1WvKeytRT5nnGyr67sxHEyuzO5lVWvn3hfbIOAzClTUSY3q1SzldH9l
         JVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758983; x=1701363783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X26+8wItEuS2j+BVlRHOHS9xadXwL+/+KykUmMySayM=;
        b=RBZ2kgBKm6linAjFrSoKxbb2P8KvTO3w3NFcXKSwpRl5lENChVRQ8+pfvlqmjQSQxH
         ombDJoH17quiZhcMy4+tjrO1oPwEugP0zyTgU71vPtO4cb+eTnHTr7OgCzHIlL47LgWz
         iuM4OwQEHptWxWdKurdLUSZmocMbGup296hkT6sHfi46a783j28GQ73s4jBqqEOVIpUz
         LK6N6TQS5Y+5UOvu+K3cp9/zfpXUNLNxXfRo4t/HjGzEbgUFC+pP25Thjp9mLWAFSBqG
         EWppR7cDd1U7OfwDKEYWAoHM/pVl+/0NNXUSXofl36YnWK7cDkqAKFgsWkZSPTlvhUiN
         iOZA==
X-Gm-Message-State: AOJu0Yy6pD7hQvj4O2GDNK2UmVziQ3K5rLRhSIwx5GPTFAgSYao+rEuZ
	11TUSZ/bd2lfzB0ohVg0cyzgOw==
X-Google-Smtp-Source: AGHT+IHtQTwXimrf79Wlg5jnvUDF/YuL90RVlWtpebD3jhmxWckb7X/7abp/KkIBDc8SOLJF86HENg==
X-Received: by 2002:adf:ed09:0:b0:332:e7b9:b671 with SMTP id a9-20020adfed09000000b00332e7b9b671mr75060wro.14.1700758983681;
        Thu, 23 Nov 2023 09:03:03 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b0032196c508e3sm2172585wrz.53.2023.11.23.09.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 09:03:03 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 23 Nov 2023 17:03:00 +0000
Subject: [PATCH v6 1/8] media: qcom: camss: Flag which VFEs require a
 power-domain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231123-b4-camss-named-power-domains-v6-1-3ec2fd9e8e36@linaro.org>
References: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
In-Reply-To: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com, 
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615

At the moment we have some complex code for determining if a VFE requires a
power-domain attachment. Particularly discordant in this scheme is the
subtle reliance on VFE and VFE Lite declaration ordering in our resources.

VFE id is used to determine if a VFE is lite or not and consequently if a
VFE requires power-domain attachment. VFE Lite though is not a correct
delineation between power-domain and non power-domain state since early
SoCs have neither VFE Lite nor power-domains attached to VFEs.

Introduce has_pd to the VFE resource structure to allow the CAMSS code to
understand if it needs to try to attach a power-domain for a given VFE.

As a side-effect from this we no longer need to care about VFE Lite or
non-Lite or the id number associated with either and which order the
VFE/VFE Lite was declared in.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++++++
 drivers/media/platform/qcom/camss/camss.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8e78dd8d5961e..ed01a3ac7a38e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -278,6 +278,7 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_4_7
 	},
 
@@ -298,6 +299,7 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_4_7
 	}
 };
@@ -468,6 +470,7 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_4_8
 	},
 
@@ -491,6 +494,7 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_4_8
 	}
 };
@@ -658,6 +662,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 4,
+		.has_pd = true,
 		.ops = &vfe_ops_170
 	},
 
@@ -680,6 +685,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 4,
+		.has_pd = true,
 		.ops = &vfe_ops_170
 	},
 
@@ -840,6 +846,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_480
 	},
 	/* VFE1 */
@@ -860,6 +867,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_480
 	},
 	/* VFE2 (lite) */
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8acad7321c09d..b854cff1774d4 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -49,6 +49,7 @@ struct camss_subdev_resources {
 	char *reg[CAMSS_RES_MAX];
 	char *interrupt[CAMSS_RES_MAX];
 	u8 line_num;
+	bool has_pd;
 	const void *ops;
 };
 

-- 
2.42.0


