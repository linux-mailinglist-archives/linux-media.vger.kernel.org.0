Return-Path: <linux-media+bounces-22121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B835D9DA056
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 02:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2251B2438E
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 01:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD496F06A;
	Wed, 27 Nov 2024 01:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7j7oq/0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80EF1EB44
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 01:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732671256; cv=none; b=PR1+A+0+PAHDV2o3GYlW4zCplGHZicAeMEtfoLmx8pCmZO3dHlMQ5Mt+2GFRU9qmmoUK4LEoYid/3YpNDBJ/339rRuYvvgkhSlsLZKskcucEIxfeY/qV6jslwz0rM4QYxPFEoj/xtc8vXolOmVMpwkkYEunPh9I6YOzzR0o1B3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732671256; c=relaxed/simple;
	bh=n/Zg82OIAdQ1zSRL1nM0L3fiC40R4jKjjiYiNFRjz48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AA8zIq/n7W2nnkJ4jBNPI0xWwX+y1HzhF7lrQm8QcgOmvoyew2gc489Upadwj4FAPBSm7mYK2mid7vKzQVJWQFjilM6UIp4+IKthHJVN2WuJ9nvo+DHkeUYoSQmfMsm/YGFNkpWvKvaQ6L/pGgC9/ES7LRhsYvXdKIgT9bVMsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7j7oq/0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a1639637so20458255e9.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 17:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732671252; x=1733276052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEBpGyzD06mzAtSx+cExNdQcs2BIj/GrC5hry0530ds=;
        b=L7j7oq/0NC45asyJ6OFtiWYizy2Md+0R0vTc1jpX4EWk/Od0SvFstKX3pSlsOLKyQt
         8ZLfRsMuV8zifAN8tKv7+15gTcYakxDz6XTmiZlV3zg19Po+9gWKVwTdlIyBB4iNCDxL
         z+3UwuFM3OISGIF1qOYDCXWFiNc6DxRKzvmmBOEg6HHABUVWlpdy69kAIiWCke0osVl4
         O81AqexDemjE+e+YGYdpinNsa7xsSaAPRdQRAl1SRo+n9MkChU1pBmYScKsUhK8wIchC
         kwA4MpxhmXsbbuqSCzoQRhdBwsLzGNHK1qnX1eFVG/YHaBerRyJiTOGCq+zIJUFWp1Wg
         Updw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732671252; x=1733276052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEBpGyzD06mzAtSx+cExNdQcs2BIj/GrC5hry0530ds=;
        b=oRhQ2dELfJr9NaXyAE79r8xuLS/LUKYSBuzesPu+PVGtxgcPXM5zUN7eg2Q7xNaPfK
         ivGCEqK/BvwSUffoyGywxcBRRSiJiwu8woA5d9jXIMZfYs29N94D7magLqP3OYYGw40O
         7b55k55oodXID4W0jV93pciKr7BFb3yneyOjVu/orImuEDl14X2Is/SlXYqP2eQ+x59s
         ElHrzKEjASm1cFdwNjE+AqRu+s1vu816SbncFmINtYlkciZfMOdxIvT/1Aie5sg4LVY2
         HF8/RQ9anyipTXUsiud+mE6KdzSLufXM7+Z77w8308q28OFrnNgzz8bC2zEOTVljF0E8
         emqg==
X-Forwarded-Encrypted: i=1; AJvYcCUz92OUHUGtchNgB6v3Qpb5c9r0sk0oKid0nLnG07pf8c8m/5taiYJKPIp6gzpmLAnD9F3do6OQakSzIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR2+mbFbYVCKB8j6u1dNMwgpcVA4pNoMxsERMsngCEfLu1qfCe
	X2b5YqPskHBexKMgTp/1FSr5foKmFubgTj5HpD+wolqYCVpQInwbOPOoQVshmPw=
X-Gm-Gg: ASbGncubIcBaFRHF+ds8oCaTpi8QHBWp+ZVMiCb58bAXtPtJ85tBsyFeMDsW5es/6IA
	KhspgPlKNQv7vlmxG7XJJjtTlQ7MDHynQi27hui2ed3J5eX0FniJFmhUYlxm/iJw+dUY+VSmkUR
	hf1uOXHqVUhxd1Z4/OmHy6VE12dLqYznyRmZ/LkVE8r06n/BSJ93bgcbBA6CeS/yKTZEhQz2vPS
	55U4RtVW3Yd9VACYRb7RClCJUnVaIO8tBLU/uqO3RVHkPKv22xSe8lNJ6o=
X-Google-Smtp-Source: AGHT+IE5xTm7ROTDuYuNzFluAr2l+MF3IkEv+n/JLAXU+hq8JkCM3MR+EuvaGqZCy0XPE4SfoOyW2A==
X-Received: by 2002:a05:6000:4819:b0:382:464e:1ab4 with SMTP id ffacd0b85a97d-385c6eb850bmr754283f8f.3.1732671252341;
        Tue, 26 Nov 2024 17:34:12 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc42b3sm14848641f8f.68.2024.11.26.17.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 17:34:12 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 27 Nov 2024 01:34:05 +0000
Subject: [PATCH 2/3] media: venus: Populate video encoder/decoder nodename
 entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-2-99c16f266b46@linaro.org>
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
index 28fe31b8251cc0efacf43d63cb2296cf8a9c052e..af874e20d01ca572a76af003630b465cdb5b5948 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -639,6 +639,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl msm8996_freq_table[] = {
@@ -848,6 +850,8 @@ static const struct venus_resources sdm845_res_v2 = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.2/venus.mbn",
+	.dec_nodename = "video-core0",
+	.enc_nodename = "video-core1",
 };
 
 static const struct freq_tbl sc7180_freq_table[] = {
@@ -896,6 +900,8 @@ static const struct venus_resources sc7180_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.4/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sm8250_freq_table[] = {
@@ -951,6 +957,8 @@ static const struct venus_resources sm8250_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sc7280_freq_table[] = {
@@ -1013,6 +1021,8 @@ static const struct venus_resources sc7280_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/vpu-2.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct of_device_id venus_dt_match[] = {

-- 
2.47.0


