Return-Path: <linux-media+bounces-22236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F239DBB30
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA419B22555
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EBB1C1ACB;
	Thu, 28 Nov 2024 16:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JUe6tDkW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB8D1BDAB9
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732810916; cv=none; b=KbGi1nVfSPx0nct4d4jJqhpTbhRm6VBdkyltPqulA+BepkhzhlhIUxpi/5toO12Qi0TfzndUfJ0sCXwMEYLZ5raYy0JWeUqUzpoa21NoEWfzMo0wO3XShgqkzrrdOZ/8KD9VlRfGOAOcPuwXJ0UjZSCmWRZqscvWrqEqy/QoJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732810916; c=relaxed/simple;
	bh=uHwu28kexnpu01U+BQLqCIx+XHvsd7tHdfHAO+9X+fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fl9EM2EK4XDI9iVGUSj72X1aP28kYWPddE/GAE/zMkKSM9A0ODaOQCu612rrsvGgF6WzP++QGws1CTjY4V6uxwp3VOq9zBkaIVKU6YeEgd7wEHZTjO26mwNulU3WW1pcKlByG9wYq8dWiS9cOuIZL3tXcToiEISfePDSDuRJGE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JUe6tDkW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso256273f8f.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732810913; x=1733415713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2ByW5LJaVgwbGGu4xqa6JYQJaVynxhc9VtK5XpZNd0=;
        b=JUe6tDkWypzDArBQdaQW35vaIWtolgUuBBj+czhkEJRL8AumtxZ8KU5avJjnopWI3z
         et9hnm0Vi2qk8A1FQrC91FhKnOhmVN45CbWa9cygE3ldd5v90VLDh1pvpUviQBhVdJm8
         rme0tMzCFUm2gV58Tn6iAUJ/JwvsG38DnmXcxw7UPmE41BddyRrOZajHOReoU3iBVVGG
         wlHQNmL3QaHt/tjwkMmeJkKVSaEuG3nrpr1oymEfpya9cuZVghlbkT2HWS6ymsUi9fkH
         5khdPYM1jSzCOXICc3NaP5uJ3RlAo25sM50TNJlkYLJyDVPbz2sdCTwTzuCdPB7wuzbK
         V1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732810913; x=1733415713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2ByW5LJaVgwbGGu4xqa6JYQJaVynxhc9VtK5XpZNd0=;
        b=HuWnZGyvE/04L/+CgnNzppoiNHDsAFXTNFbBnZ5tv+IML1DUoYnyikK7LRBy35y0zY
         TP0yKD0DOGLDUtZsHBtAnVBgGrBaH2V2l/8/fIhY/F5Ce5lRwPT7fa7wvhWDP1/dF/B0
         dUwRJuYcvUqC9OzjfXLDf3BU5aLLLSKSUrKZiHq+wJucmIdKyyTnb68ZLkeZeBhtPuze
         l/UqoEpSDHe4T9Hyp8QBIzd0ZA7/kOQIZc0VC2zNFhKCXJMi/At4NIHj4zG6KIwfrvt6
         EBB34zjQ4qMsENi9BRuMh9tih1+qKuDjmAZSJWz9ULi4yI/L80fVI/X9rEo7/bPtaKce
         A45Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQQDyY0osUG6b14FKmwHQRSf45xIrvCOQJQjgwdblJH1r7MYZMdd4w60xwem+Zga1COjbY5idfPAM3OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYNjLs4JyeYrXJBwLZGu/U1dXVFryFB6phixUH6o9M5msRUmdY
	6AXPLqkravio5edFEO744LI4aH2rAfG9cVIP3/Z6E9Djis/+DQhZyVDBatECzWo=
X-Gm-Gg: ASbGncuAXSAM7O9SA+XGme5ubVfneB6DRGdFsrzOfybXS2r+eSt5H8SxYmGHNLkDz/g
	GAkXhQxRX88osA2HTQMEX8KvtluDNGJXffq+a68dSMElacWNNV10EgXiLyLThWBLeXJLk4Psv+F
	jLoOXTCnKnIDamxXmd/q1FtsCCC96/e90dThBs2Aotu4uGuEXKHTeVIqCZHufasYwHG6zWU+L/M
	0IQkWuzOBExlCq+a1fie3nk6/rLObYgopsycFSPlGa2qt3qZxy9TRMGNCw=
X-Google-Smtp-Source: AGHT+IGGiN8vBkxi8NX+D9sBUXrGPX4zuLPArfsKyiosF573lLbt37akFeV+XcprEbuk25Cn/bUWfw==
X-Received: by 2002:a5d:5f53:0:b0:382:3f77:8584 with SMTP id ffacd0b85a97d-385c6ebb9ebmr6891625f8f.32.1732810912756;
        Thu, 28 Nov 2024 08:21:52 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70d9csm27004545e9.38.2024.11.28.08.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:21:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 28 Nov 2024 16:21:50 +0000
Subject: [PATCH v4 2/3] media: venus: Populate video encoder/decoder
 nodename entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-2-fd062b399374@linaro.org>
References: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
In-Reply-To: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Populate encoder and decoder node-name entries for the upstream parts. Once
done the compat="video-encoder" and compat="video-decoder" in the dtsi can
be dropped though the venus driver will continue to favour DT declared
video-encoder/video-decoder declarations over static declarations for
compatibility.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 8a085611443cfda89ae71496e320dfc1f02ade88..1a408c1c2277d77c5fcb67cb94baff6b98c26a2b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -672,6 +672,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl msm8996_freq_table[] = {
@@ -881,6 +883,8 @@ static const struct venus_resources sdm845_res_v2 = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.2/venus.mbn",
+	.dec_nodename = "video-core0",
+	.enc_nodename = "video-core1",
 };
 
 static const struct freq_tbl sc7180_freq_table[] = {
@@ -929,6 +933,8 @@ static const struct venus_resources sc7180_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.4/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sm8250_freq_table[] = {
@@ -984,6 +990,8 @@ static const struct venus_resources sm8250_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sc7280_freq_table[] = {
@@ -1046,6 +1054,8 @@ static const struct venus_resources sc7280_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/vpu-2.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct of_device_id venus_dt_match[] = {

-- 
2.47.1


