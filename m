Return-Path: <linux-media+bounces-22883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C59E92E4
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1CE18851E6
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFBE2248BD;
	Mon,  9 Dec 2024 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVDatnvf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B40221DAE
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745184; cv=none; b=RwPZbcw1ZovWarzIFrdlAOlT9SZyfCL/Ac3yLZ91L+Ykahom118eAVjzAmF/98rlWp35VZJPSjVJHcpy/5ufik1T9kFabBYRPAp63lNhxamaifxi2lnuhohzh+g/mtPd36+8IAdVfD+tZKSNTge/9u2Lx5yu9ADGr1FOMlDvKg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745184; c=relaxed/simple;
	bh=pf4aKmzgi3RBLEJZUi/1R8tLQs1HmFlgFYPDOVq6wOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSbJnGN2BlAdqOfZI/snW36foTvVyTho+ngvOBOU7/UKmX5PLRuOUozRsU1j5lVGDN+Z8V/fODXewm9SXXEmVx6ZhK5AwEA5IuW9bBUU5dYpIRGgAhN8K1ysjqJx/Fm+ZY7wXmmH33bS9Ngu6N0hbhZcS4CjjZuwlEUSVVwqWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVDatnvf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so5197596a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 03:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733745178; x=1734349978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ss0In4eAnB21GaaJYNQJneoRBodNwxSKbh+KMZRPV4=;
        b=XVDatnvfBMdi6nK2Qd2P2XUS32nDIY1UW428Tp+9D4Yemxeoci7tcxsoQITJcQigJ2
         XhLsB/HIMnz4dh54jyBfhJgUS++iKg3yY8CUa2RCuDRhLOy3tpOU6sHgUpLax3qiY5aO
         jXVJh4muVWEVAbgkzg0dZt2qIDt00OE61qjwqpb+9xiGHiXEUnMkT8RG+UfTShtFKRkx
         eZzQ4UMsDPxi+1v75+OHRnOoBxG4LH5Xd0aWXlvYBJ37dLg8mFi+YAiUkPsIpmmL/gcv
         NQvdLGzSHsF0vG2G6yza2NITpRg1Z22Vyd9ZfCFMZFLfK6yF2Zf+We7GEwhpSlynyk9Z
         lgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745178; x=1734349978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ss0In4eAnB21GaaJYNQJneoRBodNwxSKbh+KMZRPV4=;
        b=UTeY6rU/EPK7r72nuwjtGexq8Qt0/Fm5B+2gZqVCslveYc4cMLKXnjGLzFyjl5qoc+
         wWEPg0NmZ28ExheR0gr/9RCvzpOeflM/3CEKhfDe1+t51j4ejJWXpwYkVbLol9WQTf4G
         s9mVVW1DVMc03MZhDMaWWLcljSPL3pMiUA5y3JZNFBJytvwzqUhSODHJfDDOidqWoQ6c
         qz+aRFDjs9T1J85yFIjvGtJdvSj4foJltlw91PvK8J83BKq52CigYVd4I44/rbyYv8v1
         8HqcSblyz7bScgmIYGTcK53+zqZL4RTGwFoWdUUJu1MXgSSBOrM581cw/9lR06deD+6p
         PTlw==
X-Forwarded-Encrypted: i=1; AJvYcCX8fVRW+t3iU60re97WcKLaAlAvuLBw19LMkGFggpKrz3mDYxxqkXexg+OSuuCd8q793M1b2oaM38adBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqW/KD+DCRQ5OiZp0UHSZFGrz/f6jN5yU3aQg0XIABqU8CTkb
	g8JO7kNvjodn/IjRI+s5Qfgw9Ur7eF2qbVeh8fqU8A6vTRJy4MqszotyIdDeoLA=
X-Gm-Gg: ASbGnctotBCmq0R+NUuulrQtHhgpA6rNbeoP55HEPxAYAbHcqdliRQqjo7JeQyBj8p2
	2IzhQ7I5E6MdJ7scin/ISpoxI2SBrGOkotkWK7GM1TMZo5z8FSjTk4eCgYuVifxA0weNfPKGCeK
	BUNQQ+xY2Fe9pjVvs0ZjL0KK2R9A/M060gRRkW97pYhfCUfspsm7hOh16jtlTeiSY6bItfRgeeA
	ZLVIZbVhjIX65S09ax0/DXUWU2/kPFVtMRjur5dJGN7anABY0yDOZfPX+U=
X-Google-Smtp-Source: AGHT+IHnAeVlLcy4h5Agfr3CS9r8pCDCnLWpdgEYvJe/AP2380juCNdkfMUgMdq1nq6aK1DAonfJOQ==
X-Received: by 2002:a17:906:3291:b0:aa6:98b4:ba50 with SMTP id a640c23a62f3a-aa69ce22164mr1753266b.40.1733745177943;
        Mon, 09 Dec 2024 03:52:57 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa677968cdbsm247614266b.125.2024.12.09.03.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:52:57 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 09 Dec 2024 11:52:54 +0000
Subject: [PATCH v5 2/3] media: venus: Populate video encoder/decoder
 nodename entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-2-ef7e5f85f302@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
In-Reply-To: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
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
index 88dfa9f240dc6d18a7f58dc06b1bf10274b7121e..deef391d78770b8ae0f486dd3a3ab44c4ea6a581 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -674,6 +674,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl msm8996_freq_table[] = {
@@ -883,6 +885,8 @@ static const struct venus_resources sdm845_res_v2 = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.2/venus.mbn",
+	.dec_nodename = "video-core0",
+	.enc_nodename = "video-core1",
 };
 
 static const struct freq_tbl sc7180_freq_table[] = {
@@ -931,6 +935,8 @@ static const struct venus_resources sc7180_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.4/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sm8250_freq_table[] = {
@@ -986,6 +992,8 @@ static const struct venus_resources sm8250_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sc7280_freq_table[] = {
@@ -1048,6 +1056,8 @@ static const struct venus_resources sc7280_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/vpu-2.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct of_device_id venus_dt_match[] = {

-- 
2.47.1


