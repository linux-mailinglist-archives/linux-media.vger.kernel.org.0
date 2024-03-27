Return-Path: <linux-media+bounces-7982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8688EDCF
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6BC41C32F2E
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F3814F12A;
	Wed, 27 Mar 2024 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRB6ZhI2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F9152E13
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562947; cv=none; b=R2c6V3kH+9RPE6fQLz7vsdaGEyguS2xpHFyNmOKIhsKgarCVdmJQObr697TR7rPIsvBgV6BT7Po7P67onqRj9g3QEQjGE5Ndv4OQAE8GB5WKNSZhIkOewVoD0Y+7hwhfzE7LuDRRogHMduL1TdQ/QzyeScev1AcIKG865g/Yi7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562947; c=relaxed/simple;
	bh=zpVxIGK/DC5DJdxj6d45A6gz7HiJf9g2H9+GSTEHLyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaKYaIqJzVRWjfROwgA+A7Tye0M4xqYX3ScgBj2m7g1Waco71E0XMZKo4u1/swYnwHO64UcGc+qVUXVw6j3chJ5rNE1tSr671tEszeH/wNq9wQO+MdZ3MxbSp9VntiwJCV3qgCYYmzvmLF8nNbu3uplMIqhJnPdLK1rZtdgIM8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRB6ZhI2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a4a387ff7acso13099366b.2
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562944; x=1712167744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4k+D1R/CO2vefULfDvrbe1JRYsRPZZCZwyqn3SKwsgk=;
        b=mRB6ZhI2ps6TBIJPrZob/ry/DkkJvkxPg+bYtYJdMyK0RrI4zNxgcbZu1YO3Oqv194
         LAiZnlRS86Arq57t1TuPu2nbIDa7G+1+mZNiZn35K32dMI2Nl4k5cxQpwNTzzRNEvMtk
         o8X4ew5Tl06wBOyJRR1zTS/fHNqK9UkyLNtP89nA9ncH3gwRs8aWaXXqK+Lr9JK7pKNn
         YNfv4VHE8lkHQhm1tfwmMRdJVa6/qAzH8BzDcTvRu9Qatm6zJXQ9StNyuC+ZGf9zolAL
         89pY6ybwm1BepOIFqdB4608DB36w3nT+gEGZJU96hJUF7LHE0qd3PvUQuj7CK/GADdVu
         6KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562944; x=1712167744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4k+D1R/CO2vefULfDvrbe1JRYsRPZZCZwyqn3SKwsgk=;
        b=WudhZIzKlLAn91Op4sla5PIueQ4kZ03SH/9h7mDvPMtAg1duhqzJFBKoet+22np8Vy
         G8bx/F1qtYUTakfaI2kV7br+RDcHsJXdLgoGUTcTEXVt64ri1ukCEvuivX4a46ulzOIn
         Vz50Nk8VGoa9KdgW1oVN8VvtBwv74XE/mLE+Hrc4/6FfbtQoqpiNgqJTtKgcJXME7lw9
         C3Yci5/ZJxXoLCyAf2NMTdW5IiEIEMFQhqSPTHenWB0OmpUrS8SXW2r6a5RrUjjL/mEc
         IOpCo7S2XTxntK0qILsFzi+vqckVoI0SN9ZUhu9efqDf5r9Eu/4dnwrYnyIw7fEV966f
         JQbA==
X-Forwarded-Encrypted: i=1; AJvYcCVfPL0OMSnbZ89d0Yxw53SLXiQ0w82K8ekLDjuVV6z8/btsaFAglAqLBoNnzUNf+mjg/Dl7I7lCYL0N+XHDeCppi7Vq64ndFuyhIbQ=
X-Gm-Message-State: AOJu0YyBARiFx78rKg4zwHfJ7kreHjgaR+xPzXdPRnmLJZqfhyaSvIlS
	oq/yKQIdN7yTfJKRrPOJxoDXdQypIhJOlfbbdTlDMzToYsTZAyGB5dnr7oi6C+g=
X-Google-Smtp-Source: AGHT+IGgh8TVK7OaOIm3bODIsmJap1Sy6Kp85kSNzHznpes15v25Nir9SvBKmsFNHfjIzUjXZW0S4Q==
X-Received: by 2002:a17:907:1b17:b0:a46:636d:ef23 with SMTP id mp23-20020a1709071b1700b00a46636def23mr213739ejc.54.1711562944568;
        Wed, 27 Mar 2024 11:09:04 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:48 +0100
Subject: [PATCH v3 10/19] media: venus: core: Use GENMASK for dma_mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-10-79f23b81c261@linaro.org>
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
In-Reply-To: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=2766;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zpVxIGK/DC5DJdxj6d45A6gz7HiJf9g2H9+GSTEHLyk=;
 b=KE3ZI01LlS6edqeVW0yMZSlgZxpiWF33PPA9Z+BTOODUIXObGqTSBmR5rIY4voS0rD8lIUri0
 2ZS65Ft7gT0CIbc9VvabxmKT5SGO/H+FZdyzgvPvE/quAClfrrunznY
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The raw literals mean very little. Substitute it with more telling
bitops macros.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 51ac9eff244c..5d41ecddcef6 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -562,7 +562,7 @@ static const struct venus_resources msm8916_res = {
 	.clks_num = 3,
 	.max_load = 352800, /* 720p@30 + 1080p@30 */
 	.hfi_version = HFI_VERSION_1XX,
-	.dma_mask = 0xddc00000 - 1,
+	.dma_mask = (GENMASK(31, 30) | GENMASK(28, 26) | GENMASK(24, 22)) - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
 };
 
@@ -592,7 +592,7 @@ static const struct venus_resources msm8996_res = {
 	.vcodec_clks_num = 1,
 	.max_load = 2563200,
 	.hfi_version = HFI_VERSION_3XX,
-	.dma_mask = 0xddc00000 - 1,
+	.dma_mask = (GENMASK(31, 30) | GENMASK(28, 26) | GENMASK(24, 22)) - 1,
 	.fwname = "qcom/venus-4.2/venus.mbn",
 };
 
@@ -693,7 +693,7 @@ static const struct venus_resources sdm845_res = {
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
-	.dma_mask = 0xe0000000 - 1,
+	.dma_mask = GENMASK(31, 29) - 1,
 	.fwname = "qcom/venus-5.2/venus.mbn",
 };
 
@@ -715,7 +715,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
-	.dma_mask = 0xe0000000 - 1,
+	.dma_mask = GENMASK(31, 29) - 1,
 	.cp_start = 0,
 	.cp_size = 0x70800000,
 	.cp_nonpixel_start = 0x1000000,
@@ -759,7 +759,7 @@ static const struct venus_resources sc7180_res = {
 	.opp_pmdomain = pd_names_cx,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
-	.dma_mask = 0xe0000000 - 1,
+	.dma_mask = GENMASK(31, 29) - 1,
 	.cp_start = 0,
 	.cp_size = 0x70800000,
 	.cp_nonpixel_start = 0x1000000,
@@ -814,7 +814,7 @@ static const struct venus_resources sm8250_res = {
 	.hfi_version = HFI_VERSION_6XX,
 	.vpu_version = VPU_VERSION_IRIS2,
 	.num_vpp_pipes = 4,
-	.dma_mask = 0xe0000000 - 1,
+	.dma_mask = GENMASK(31, 29) - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
 };
 
@@ -868,7 +868,7 @@ static const struct venus_resources sc7280_res = {
 	.hfi_version = HFI_VERSION_6XX,
 	.vpu_version = VPU_VERSION_IRIS2_1,
 	.num_vpp_pipes = 1,
-	.dma_mask = 0xe0000000 - 1,
+	.dma_mask = GENMASK(31, 29) - 1,
 	.cp_start = 0,
 	.cp_size = 0x25800000,
 	.cp_nonpixel_start = 0x1000000,

-- 
2.44.0


