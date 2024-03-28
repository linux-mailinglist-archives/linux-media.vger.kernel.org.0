Return-Path: <linux-media+bounces-7979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646C88EDC6
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C07E2A41CB
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2D8152534;
	Wed, 27 Mar 2024 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVkeu2le"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BB8152190
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562942; cv=none; b=FiBZocMBeU6IvOrIv6RCCsMy3E4RlJ/xgkQY6jy8epdbQA0r9snWomG3LF95bA7JhfEM76Z8CoeM90mahfsJtcB958y+I7EzpIj8C7/WX2RZ++eX6Wnw26jjKdUgVvmGS05K/F4KKAzkRrohqHK5K7mJi1GYpTX++wvKr3DfYLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562942; c=relaxed/simple;
	bh=Budt9AUFLpH1GYKX8rMtQXugAPGu6mfLKAoQkafZiaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bo2oUipNu35yM7PamYj8dmnUxJGd5hM3WBpEZVscNwrzf3eXEILq1ThTKI5vc7NjvsuH8svVBkBQC4gdKZKDf620hF3VU9elcAf4H0KEZs5wbySSaPuVGidTQ2t36CRgrGaOtD2vOuWtWy8ficp2oepOAWR1nqd2gOJQOGRtM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVkeu2le; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so166261a12.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562939; x=1712167739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJhEqHIZwwgc6uNF+pC9y2W8axppjx29k8m/ZrhWPRw=;
        b=rVkeu2leYFiFNc223n2BK8AnwXn89B0p83x++is6nd/z5ABbRv0QQ3kFpCyMIn+0VV
         AfdlF4m158oEHkI3km+ZQZ14zUMjznWLhoEvtCvBfJcDKrYpxEFTfYRiuqu3rS3e/Guj
         Vh+ZFR69rAKHB+2cv4fAhDn+fNjmyVUnoDI0mOBA5Np2VgZWh63gWPe6PZkrNZ7BxH+c
         3yAZCkfdW6Us/6BSDsChdIFn3RG6CcOmasBu0Rf3nSLwx8pfjHEF/m0iSJ+02loa9dYe
         F902hzYSdo+CZnmb1DtiECzdrccGmDKmyx5Je//h2lawtN+OcPju/5XNr7vctM0gbwtD
         AOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562939; x=1712167739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJhEqHIZwwgc6uNF+pC9y2W8axppjx29k8m/ZrhWPRw=;
        b=evPT3sajdScQ1qNrczkzU2Asrugz1m2kNnEi3+avxayq7P938mJ6Chb9hUHibN1ymN
         C5BdUoxOnwU+4zAaiURs3WtZCgvDKLmeyKMKMHt1Tz6mlRKrAEWen7hBBJqYSxItSFhC
         06Lb02YYaEZf/tz8+SLzKQ1jUvQbveazHF/8SzJTj0wPRp1prUhJIXzi8ZhXAClY6qUO
         1cRpxWKeELwrVwD3oGLK9xwV+0NVn/YdXLF+a6KyMSlgc45rnjtyrSPIM4ugvxDUq5Z5
         A4ptHzJnkEg4+Stp5I0ViMAvGgiFUyrs/ntjacYoXzpcurt1kPXMIrmbPdLVpN93tCky
         vRjg==
X-Forwarded-Encrypted: i=1; AJvYcCU5b/Bhj6TuKxK/7WwOLSSm+xIz4OefC5SSonjE1aKz2gcvRUzj3DJjPRqGyFRf15lOmCWirAEc3Ic6O+B3PReS5GN4FnRdCN8Q0Bo=
X-Gm-Message-State: AOJu0YxvaJqtLBlT/S3CrwzmjgmniRRgU+Dvc+RrbSOB5yCnucKm4W7y
	mPRvZZ3d2A9Ezd0jRruWItX9sWe+sGu73nRi35wl3U9XoaYdCTY4cE/S46IHuDU=
X-Google-Smtp-Source: AGHT+IFg2fdSBGhwpvoAe6uBODcR1dEVreZcP7kGjP05S5Jc97wqqqIh+NeIcQVvZbGt2UxiVIYhIw==
X-Received: by 2002:a17:906:6885:b0:a49:9631:1df with SMTP id n5-20020a170906688500b00a49963101dfmr181069ejr.77.1711562938850;
        Wed, 27 Mar 2024 11:08:58 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:08:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:45 +0100
Subject: [PATCH v3 07/19] media: venus: core: Deduplicate OPP genpd names
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-7-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=2511;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Budt9AUFLpH1GYKX8rMtQXugAPGu6mfLKAoQkafZiaw=;
 b=UFLj+uwJyuVqVs+fTzGZMKqQs29u1/aYfsU8w9zlzRy7BQoarxCrDpnWsR/h9kMFz1PnlZ0vb
 LmL27/8psDhAPde7VvB0UqKVgIBIVLEOr5TuMBxbZpTkHDoGmojRqfi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Instead of redefining the same literals over and over again, define
them once and point the reference to that definition.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 0652065cb113..5e7cb54e6088 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -538,6 +538,9 @@ static const struct dev_pm_ops venus_pm_ops = {
 	SET_RUNTIME_PM_OPS(venus_runtime_suspend, venus_runtime_resume, NULL)
 };
 
+static const char *pd_names_cx[] = { "cx", NULL };
+static const char *pd_names_mx[] = { "mx", NULL };
+
 static const struct freq_tbl msm8916_freq_table[] = {
 	{ 352800, 228570000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
 	{ 244800, 160000000 },	/* 1920x1088 @ 30 */
@@ -721,7 +724,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
-	.opp_pmdomain = (const char *[]) { "cx", NULL },
+	.opp_pmdomain = pd_names_cx,
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
@@ -770,7 +773,7 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
-	.opp_pmdomain = (const char *[]) { "cx", NULL },
+	.opp_pmdomain = pd_names_cx,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
@@ -827,7 +830,7 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_clks_num = 1,
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
-	.opp_pmdomain = (const char *[]) { "mx", NULL },
+	.opp_pmdomain = pd_names_mx,
 	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
@@ -886,7 +889,7 @@ static const struct venus_resources sc7280_res = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
-	.opp_pmdomain = (const char *[]) { "cx", NULL },
+	.opp_pmdomain = pd_names_cx,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
 	.vpu_version = VPU_VERSION_IRIS2_1,

-- 
2.44.0


