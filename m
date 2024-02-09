Return-Path: <linux-media+bounces-4922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329D84FE57
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 572D31C21213
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8A23BB52;
	Fri,  9 Feb 2024 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SPrfwAj2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86C83AC26
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513003; cv=none; b=ut5MnpPuux/kMSNqD6tHuuwaQI1vm5sircp4/tk0ZRVGHauSiOPI3cOiwn8OEzScXXjVOH/cirSmsvjitRLXDx7ZpYa5lnymJGZBkQU3yEly/Ze9YqlKYIHB1Xxwxm38nWKCiqJfSy5/rMtiEfVypgsHkL5qkORzNKHHQNhzdoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513003; c=relaxed/simple;
	bh=2igVAqX0VNw3fNZBRPW3xI6PegwRz7NA5+KLZ+WJ63U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oAK97rgBPLgmUCWnKGqKLV8I/hgf6p1h+cL87x5otDNKvqdaEzAiMECd4xzzU2OuCHBPctd2p9arPmWgattW1lHTJb4Y/wd8Akmcw9y0dyLiaD8Q6OPJ7++tnDqKmG1LlvdegZRIywrr70T9NBeCJLRhE/SsLQRwu6yjecPpcV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SPrfwAj2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3be9edf370so142770166b.2
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 13:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707513000; x=1708117800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlIzPxVWq+bsAR6HPmAA/ifEN8Nb2TRGFiIMlA64yBs=;
        b=SPrfwAj2kg3ZLBhxtTxDB4ydSQjdTpZr7xYCYlZ7W7eGiH7nX/WrDTLOm7Pp55ApmM
         hRAszqjZ+DaTkKnB+WHtM5JDMwgQCPcyBCHLFTPchA+USR1mzepx4YRRnT0Vu8FPkm6J
         q3AjnUGIwooRtGMguTOyDkRiYFr/d5b5e8hkbTX+bPrYpmxUMRr08uzByDiKvEq4bzpE
         nmgKdd/QFllDT+VOgecLy07ZZegkcO5NX/LG8FzBz6vEjVxJbqvwPxWtHNXvt5roBDJX
         AOkqWmgDSYjYuxjzqARCVDshFnO7DloORwT8GIX+Fd5yGrZZgCflOpR7gH1Od+ek+QRD
         uPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513000; x=1708117800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlIzPxVWq+bsAR6HPmAA/ifEN8Nb2TRGFiIMlA64yBs=;
        b=r7YTL8glDlLbxHVPzz24g4Xgq6yHZNahl5Cd2tJnr4koxE3Cu2L22DXPmvDqQiL2RM
         d9gCqG8aC8k2IOVjjnfVP/tJJ4B0kvUTBg9COF/ZMzk8/Vz64oj2W0JHHcIfo3MfT8WL
         og7MVuP1D7JEeN/BH/buyvv4JIICl6DdQiXuLXY4inoXYE5QTq2IgfqESnoVt6/6pKkn
         EufxnB1MhYXw7mg+30jecWyrBvXCXMXbTNaMq58w+PaoUMpur48/pk+hR4FKYWfx5rdv
         xGlC3oyYLipGd/79oje5ATQ1DxqxsqH+HzHWRUqYmVRFoKktqxLQ7bEvuhxZViqAnoDQ
         QHhw==
X-Gm-Message-State: AOJu0YwlU/RVEuHP5xY9Q00tFn45s/72BC9ADDc0saHCC/E5y8DKXT1Q
	bsCCJJyDvZ1uThObjHxGpXEV8auKiczeBD6JvEawglpHB+gVlKMIAWG3OLXtQII=
X-Google-Smtp-Source: AGHT+IFnCxzyEedknS8glnIpOZ9GDBMua8gfkrZRkR3e3+UJ2pcF15UePro3zx+DsQ7PS/+aZf/YiQ==
X-Received: by 2002:a17:906:230b:b0:a3b:e115:7b69 with SMTP id l11-20020a170906230b00b00a3be1157b69mr167492eja.69.1707513000009;
        Fri, 09 Feb 2024 13:10:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU43QCiyrytYxFxTxdhazfamHHqeLm5xnTyGUEoGhxRhNdGtZYwyCobuEDrz13F0peEVzF9hXAC37nnUngLF/3nwOhpGIRgQPW20GasVlz2H0PwfQNIJkZICjK3xuyh8Z8zBEknC0Z/uebrWghTa8wX+IjY4iUf4PeyjWDc0ud7GEpQH5yGlMHDkzrZbql/QDdwW4bluhNc334cQIPU4Ldg/fvBA6oAsIRQIJjiUHaaQAQQuzlhR6p4Xl1z4LWhJiTTKrdYYzbcVy0OYx+V6M5Wwdy7EsmGdjxBTFKCRBktjJMFyMGjMOSvmkTKuqSmdFWsCRjMY4I7aYsrh/JlRkX1KYnlxxQzlvAa+Wb8Ou79RA1AkP5rKBuiAlEv7TzeLjIWTneR6xqG6Q9UU6mMIMxEII8m3nHcZ8fa4xjNvsR9snrx4algbLlIjTtO4UW/aG8c/oUZUDVbCVx6lilNme4N3NWFO3Gg5TArMwagfoh7qtHq6wJE7M3Duu0GUV9XAvipeA==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:59 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:51 +0100
Subject: [PATCH v2 07/20] media: venus: core: Constify all members of the
 resource struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-7-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512985; l=2706;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2igVAqX0VNw3fNZBRPW3xI6PegwRz7NA5+KLZ+WJ63U=;
 b=Y7nFOgWoxzW+xfFgI0rML0+tWKvbFCA3TQs/Nwf2AzFXA+IkV7piuQt7VgOVY3+o7nrSsc7H/
 +E8YHaQRkrxBYhXeRsLvZZmvyVFRd9yxBK3UHiT6QONOW5zXQCNkUo1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Nothing inside the resource struct needs to be mutable. Sprinkle
'const' all over it. A lot of 'const'.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h | 58 ++++++++++++++++----------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 6a77de374454..6b1887f7d9cb 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -56,39 +56,39 @@ enum vpu_version {
 };
 
 struct venus_resources {
-	u64 dma_mask;
-	const struct freq_tbl *freq_tbl;
-	unsigned int freq_tbl_size;
-	const struct bw_tbl *bw_tbl_enc;
-	unsigned int bw_tbl_enc_size;
-	const struct bw_tbl *bw_tbl_dec;
-	unsigned int bw_tbl_dec_size;
-	const struct reg_val *reg_tbl;
-	unsigned int reg_tbl_size;
-	const struct hfi_ubwc_config *ubwc_conf;
+	const u64 dma_mask;
+	const struct freq_tbl * const freq_tbl;
+	const unsigned int freq_tbl_size;
+	const struct bw_tbl * const bw_tbl_enc;
+	const unsigned int bw_tbl_enc_size;
+	const struct bw_tbl * const bw_tbl_dec;
+	const unsigned int bw_tbl_dec_size;
+	const struct reg_val * const reg_tbl;
+	const unsigned int reg_tbl_size;
+	const struct hfi_ubwc_config * const ubwc_conf;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
-	unsigned int clks_num;
+	const unsigned int clks_num;
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
-	unsigned int vcodec_clks_num;
-	const char **vcodec_pmdomains;
-	unsigned int vcodec_pmdomains_num;
-	const char **opp_pmdomain;
-	unsigned int vcodec_num;
+	const unsigned int vcodec_clks_num;
+	const char * const *vcodec_pmdomains;
+	const unsigned int vcodec_pmdomains_num;
+	const char * const * const opp_pmdomain;
+	const unsigned int vcodec_num;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
-	unsigned int resets_num;
-	enum hfi_version hfi_version;
-	enum vpu_version vpu_version;
-	u8 num_vpp_pipes;
-	u32 max_load;
-	unsigned int vmem_id;
-	u32 vmem_size;
-	u32 vmem_addr;
-	u32 cp_start;
-	u32 cp_size;
-	u32 cp_nonpixel_start;
-	u32 cp_nonpixel_size;
-	const char *fwname;
+	const unsigned int resets_num;
+	const enum hfi_version hfi_version;
+	const enum vpu_version vpu_version;
+	const u8 num_vpp_pipes;
+	const u32 max_load;
+	const unsigned int vmem_id;
+	const u32 vmem_size;
+	const u32 vmem_addr;
+	const u32 cp_start;
+	const u32 cp_size;
+	const u32 cp_nonpixel_start;
+	const u32 cp_nonpixel_size;
+	const char * const fwname;
 };
 
 enum venus_fmt {

-- 
2.43.0


