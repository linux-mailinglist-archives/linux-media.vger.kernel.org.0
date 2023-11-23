Return-Path: <linux-media+bounces-926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCDA7F64C4
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 18:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DF22B2128D
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 17:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D937405D0;
	Thu, 23 Nov 2023 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6x5YaXs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CA610F1
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:15 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4083f613272so7329665e9.1
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700758994; x=1701363794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ib96ZmK5LO+Py4E9hj9+63+qAtneu0ywuXljodtPMuY=;
        b=U6x5YaXszv099+Rk8xUiToMirZjVQ4Cefr3zDfKmRhXwx3YnbIuJ/jbZtuuAPKDzBU
         kXf5v2RRD6UDJESXHk3GD7a2oc45RqS0K5QKm+0ikTSM97o+I4ViNzpYHk6bGAOrnK4n
         HLZmms2usNkO9wV05qluLhOsaoW6sswIAS9xK47HFZeBOgohZIc9gDQ1yhgQpClzYyMD
         WlBF9DVqlHNkNj/0Ad/ENKrZ1GEpFpdXihJemXBcuuMQ3LU4ROamgjJbgUk8fI5Rean5
         OHl4gVDnQ5Im5Fdy9f5u3+fNt13dlsi8brLIVC98JjEWdTVO2cu55FuMK7sXxoLA6cLs
         oyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758994; x=1701363794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib96ZmK5LO+Py4E9hj9+63+qAtneu0ywuXljodtPMuY=;
        b=Kt7Q2Tig1SZrdNEXXUie5ylOgrdlxp+KUqMGUJrv1NoXbId/6KvQqpQ0rMrSJF2aWC
         E7U4tyLtFbIumCY6+FQsbbjovjHRA+JzcjCV/Rav+1HMaDdoJP+jzhaFI4c1A70W3kCw
         vwujzSSyANz2EcMeayt+NsJ/0yqYtrI1g8/J7QLYgI6BCYiKXxgEJuqiz9ROhiNQ8ubU
         kQadZCy1v7ll5BIwtc/UK7Xmd7qhmWP5Pm2aZkr1btBYGPDNxp9WOoH1+/BCQOn1u/u5
         yzSTGdI5+I2DfUiYFfnRgMuyj3CsSopOHU5qxdyjwtb8n6qtedtOAa7FFpl9/Qyg2wwn
         1UAg==
X-Gm-Message-State: AOJu0Yw3/Zmb3jatl69Rg+xdka0r3zIRzV1jvObu6Vw6CRfcr/GXv7ar
	Ii6KARDX+cVUsutuOAxU6IjYDnrFcOs2ui+OHJK2hLWK
X-Google-Smtp-Source: AGHT+IE2ZsqjgtFXfB0jHpQJO9dliYDAYlVpzG4gO7GaQKDTrmrF47UPTmiVBiwsPE265TSI2nmWKg==
X-Received: by 2002:a05:600c:3505:b0:405:3d41:5646 with SMTP id h5-20020a05600c350500b004053d415646mr159586wmq.2.1700758993999;
        Thu, 23 Nov 2023 09:03:13 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b0032196c508e3sm2172585wrz.53.2023.11.23.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 09:03:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 23 Nov 2023 17:03:07 +0000
Subject: [PATCH v6 8/8] media: qcom: camss: Add sm8250 named power-domain
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231123-b4-camss-named-power-domains-v6-8-3ec2fd9e8e36@linaro.org>
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

Declare power-domain names "top", "ife0" and "ife1" eponymously for the
power-domains TITAN_TOP_GDSC, IFE_0_GDSC and IFE_1_GDSC respectively.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 942db0dffa59f..3bb23fd29959c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -849,6 +849,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 } },
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
+		.pd_name = "ife0",
 		.line_num = 3,
 		.has_pd = true,
 		.ops = &vfe_ops_480
@@ -870,6 +871,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 } },
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
+		.pd_name = "ife1",
 		.line_num = 3,
 		.has_pd = true,
 		.ops = &vfe_ops_480
@@ -1810,6 +1812,7 @@ static const struct camss_resources sdm845_resources = {
 
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
+	.pd_name = "top",
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
 	.vfe_res = vfe_res_8250,

-- 
2.42.0


