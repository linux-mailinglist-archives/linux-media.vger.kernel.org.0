Return-Path: <linux-media+bounces-22168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCC9DA700
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B147165E41
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316541F9432;
	Wed, 27 Nov 2024 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KyxbHMxa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F661F8F1A
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732707869; cv=none; b=L7PykFG8s/WdgzjMnq+nD9rM+7v2EogHnrSnQ0GejFYPLEQOOZ3ePSYBMf5PzK31jS+C8UAFnL/vaFeiXTsuUvzyQXF/N6KmhqZ6+OPkPOvLwQ/BZqxoJTpKl/quSIPkV5yD9xfGA862EftXNAeonconDAEkVwJdDaUVgnnI+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732707869; c=relaxed/simple;
	bh=5nl7J9DAIXEGP6XFckA2tv9xwlEwURwQ899BzKy9f8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzDWruF7qkN7jWubLURgm1ltiQ1mt0o4BajsXKQrGE2PJUv+oN/WY7qR78FSJUqWbZzXNeKutb1wWZrt8tm2cBq8TstZa9mlHn8Zy1sHrQu7Os0dJTojGFrxU+rd9k1baDBBVyNmWBgHnUJbU7MzxyIb4zOlr8MbbPDcTJxz3KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KyxbHMxa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a45f05feso23663635e9.3
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732707865; x=1733312665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3KnIWFjjoDSB2qzMeOzFANQJr83mKvOblCgk3APOdI=;
        b=KyxbHMxaiZUItlR9t4tObsD1iz00aQ7JIYytg1pVcD/KLIml1EWIyvH+qlsyUoMz/8
         PPf/i53BgZVpEeosvfiy1AKC4yy/9B32MJHbRaWZwlUB9bXphgpqnfzAcc8pM8BzWWLT
         gnQQkaEgvzxmKeDA1Lb7w3BX+f+r+3yYyJ/6BxP6Kh7LDLPJhCiza7x9UmD5o83Z3BKR
         t9LKq00KPcwGCRo2PfxmxRRpgbqq3CL8aqWQSvqKvfYMyaIFClp6jFr4jvst+ZGVb9vJ
         N2YIbKeH7PztjpeC/AFRXfwZ7+Z6gTf/z6yLEAcJSUF/grfTny5BzUYIy6l/yumc+qQM
         MSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732707865; x=1733312665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3KnIWFjjoDSB2qzMeOzFANQJr83mKvOblCgk3APOdI=;
        b=lFdU0Ngh+KIZCuSU3UqKmjANbUXYK6o2w8SBu1cTOk0XLBPs6dTRkk0P21YIEMWI4g
         /Bd+Luwk4sADRO7RyY++lKYiMYmK90DoUw73mqsOGhYiuOXNG8C2uydKWSCzxt7tOoXG
         8QuFF9XmrSC2J2BJmQmSqH1EQ0JMQtJ1lskZR6pYCJa90DEFKC+AAyMrkHZlUMY1UZbx
         4TgUElw8icE5CIIrSVF59bQHW5QENk86Y9zO/tGRYL2mDnA95QkPA7iOZ0cmsLzN8hPn
         xWhxfKWFgQxC3swGrIVARXgKir32O+b4PIgyQC7IAMSewUmy3WtBvkm0zi5NOw1/wvvo
         yTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK3vPezrTniTKEIpDTn/tJ+bHc5R3FjwYu77WN1iCTKTPlnzRCD1xknfmD8g5VZElEHz3AftfmAI5JXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh+x7lmNRNiSoYqKY0Wc3NYcGwf9uHvvzWc+bnMrBirtIC/e+O
	TyoC4eWCBrr8SXsOaWb5jW7HtCWreOL9mq4WUjSmkp1sHDH0wgguuOvhxSuqZJM=
X-Gm-Gg: ASbGnctU9fO/HI0aK/8OUwkTo9iH6xgTL0PeR4rnen6UOauTDAkdyc6CcDXfMQQsurZ
	RMqzf25HBLqWYM2AbLcQpGi01MzqX/V6D5YtUXWLsvbD2eQ4Wdc4gUxlHKz1VNO6oJUZorK/xfV
	WGUzAkyBmXBUoTz1uzty7KAM+TBN8+0kA9NoQUmICKG5Desbk5xY2LYBWhm7ExCx6pfxe9E+RUi
	xNmTWKcsu7ErSWGsktKiCpJyU6KEyBHmNkdOupeG+efTKzQS+nC56UnCqc=
X-Google-Smtp-Source: AGHT+IE0pK2hTwaunQOjZoX6SVQi9BmMtvCCwAMVwiCR1lY2+Tt/vnpsknckg/1+k2IZIpKPguxvvw==
X-Received: by 2002:a5d:5983:0:b0:382:3d04:9646 with SMTP id ffacd0b85a97d-385c6ccaf23mr2199795f8f.11.1732707864752;
        Wed, 27 Nov 2024 03:44:24 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3531sm16463586f8f.80.2024.11.27.03.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:44:24 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 27 Nov 2024 11:44:21 +0000
Subject: [PATCH v2 2/3] media: venus: Populate video encoder/decoder
 nodename entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-2-c010fd45f7ff@linaro.org>
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org>
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
index 17506d547a6172b89acb77879337750c22f993cf..847caf4d9cdb6fc3f4133450d40b69a4baba522d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -638,6 +638,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl msm8996_freq_table[] = {
@@ -847,6 +849,8 @@ static const struct venus_resources sdm845_res_v2 = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.2/venus.mbn",
+	.dec_nodename = "video-core0",
+	.enc_nodename = "video-core1",
 };
 
 static const struct freq_tbl sc7180_freq_table[] = {
@@ -895,6 +899,8 @@ static const struct venus_resources sc7180_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.4/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sm8250_freq_table[] = {
@@ -950,6 +956,8 @@ static const struct venus_resources sm8250_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sc7280_freq_table[] = {
@@ -1012,6 +1020,8 @@ static const struct venus_resources sc7280_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/vpu-2.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct of_device_id venus_dt_match[] = {

-- 
2.47.0


