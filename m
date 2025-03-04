Return-Path: <linux-media+bounces-27479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8921AA4DEBC
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 14:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EE33A3B8E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D632204C1B;
	Tue,  4 Mar 2025 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n0EkaPTY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B9C20469E
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093638; cv=none; b=UpSj+aDiG7BBsCYkiArqUpAscw0lZ0+VGyzYQcJKY65z/YbdTAnWX1OAECqt32qk4ufVxvj0waFQvm4gp5bR32Wvicofc3l0CzPGXdRR5XENqxQvuKA8a5nx2to9+M36L6nydf2FgGHl+4nBsQoCShbwkA3/DO/up32TXXOHJKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093638; c=relaxed/simple;
	bh=/NrrKu4n1tF2HpwX/3ZU9A1mDCbhjYaDgP2YCETu4tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KH0lNeF1LAf1TLYs64reAOPSv03o46RSh11dN0TljMSKgV714rvBLnnrh7Q071w3nU6PIvSmTIyk7Ec92zga7SZxaPB93KTfBGWy+3gctlg1oyB2zZT9V3eIhVkkbMkJyuu5ozPL3Anib9X6IR6zoSmqmKXhGYKUFNYGALtG6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n0EkaPTY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390fb1b987fso3537989f8f.1
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 05:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741093635; x=1741698435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nReu5+cl9WzV6+48QR0ZYCEfLXug0GahkekE8tX+Eds=;
        b=n0EkaPTY/NmMTg4W9rJqtaQjn7nNvzM8XLDUsc1A9s0jv0cJw17FBiprcv7e+NWmVe
         RSQbrsjt/K857XHe/c1Rqabbp5pSo/OzRvR1X75plUxl6tvJXG+2C9JDoGtGxXChrsTQ
         SYy0zvpbls5WBkycMwkA8pMFcvWEXSpxsf1Hx8cT5fNSfB3BfPcuih19qTTQP/jdHXda
         u02aKlTE9sBMQ3wzf9un12P2/D/zQrzePpEXl5Uslzw10cbfm6mJMm9qRhhhE8CO6ANo
         MLnup02BarWRUJb4+VNpnZKdrLdlIwF1149HPgGSpwe3JFjoG7VeB4wARot7JhYNil3J
         tbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093635; x=1741698435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nReu5+cl9WzV6+48QR0ZYCEfLXug0GahkekE8tX+Eds=;
        b=VMdIsSzUPoZJ6fdQftoWEqxH8WVU86Io3lfM1IUutwBmzqJHfQKxJWPFUbulPiqnnm
         U4F1DyjYMrxqD+m2CuaQbtiPxg7l9UnYeMotAmi+aAZSIQoAwFAIuqI9sF/x3KqqA/FV
         kycmvXANvQpRWKSROAw+lLcJO3Gv+X1i7vsi4Mni8NMfJXjKTWbNPbCotAaF1INuLaAS
         qjUnUq8caWWfkQqa6IOFQG+XEAEfIbtF6hC2wyRmN2CXuUtvLgxorrqq98wH3i30Ey1p
         N1UJ2hgH4s4+IqSnIjpnGAB85Pc7q+EW0hJd9PvtVe903O4OUxCnkqc4INW/JSNXuRNv
         NLKw==
X-Gm-Message-State: AOJu0YxgR8cnO3SYwctX/Vi2JUV7SHg+4RnLwyzj2MTn3ygz24PPWWPE
	oeZzstsVxs2spCLk4kJiPEfmZ/yh2tjxQ83c6s4/dQGZiHcrrYLwahD7OcO+yBA=
X-Gm-Gg: ASbGncuYAeeDA3QYPPe1NYZDQu5KuJLCxjNQNihFv+x/t4g9wYSmWfBz3yCgpZkFSWB
	op/Dpvp2c4tTO32UtfgBini9wVqy/a1PWARNxA3IVHe7qbg50NtMotdxJOpwXPi1DzrELBwt05s
	3x40m0Aga50kZtriIjFfqyVV5S81u3EGribKyZ+ynRmNcXYvFputvnOz/V+934l59pnxaqEGRoz
	1POE8blGoeFDc4wAcrMBKYPxEucLzsTKKyBXIGyiTaIG4OWwZw+KPAZstYgUCaTfiVLKWbB3v0T
	3zfNDicS6hyhlTQdA8f+57ibME/KfMAiiFhBJEWLHx8zsM07ZnYgYcyPCfb0VlKaJ8flaxOtOa4
	gU4HMoQ==
X-Google-Smtp-Source: AGHT+IFFQwNalVDcJ6wvBNHtHEZZ1GuZCNcAdrK9S2+uRO3n9xEvwwqdDOGiOLjqar6ic5Tu3r7jAA==
X-Received: by 2002:a5d:64e2:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-390eca5b1abmr13994541f8f.34.1741093634919;
        Tue, 04 Mar 2025 05:07:14 -0800 (PST)
Received: from [127.0.1.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm17401715f8f.44.2025.03.04.05.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:07:14 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 04 Mar 2025 13:07:10 +0000
Subject: [PATCH 4/8] media: platform: venus: Add optional LLCC path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-4-279c7ea55493@linaro.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-33ea6

From: Konrad Dybcio <konradybcio@kernel.org>

Some newer SoCs (such as SM8350) have a third interconnect path. Add
it and make it optional.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20230731-topic-8280_venus-v1-4-8c8bbe1983a5@linaro.org
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       | 19 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h       |  3 +++
 drivers/media/platform/qcom/venus/pm_helpers.c |  3 +++
 3 files changed, 25 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 61fb59788a810..93e5b9e1f70cc 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -393,6 +393,15 @@ static int venus_probe(struct platform_device *pdev)
 	if (IS_ERR(core->cpucfg_path))
 		return PTR_ERR(core->cpucfg_path);
 
+	core->llcc_path = devm_of_icc_get(dev, "video-llcc");
+	if (IS_ERR(core->llcc_path)) {
+		/* LLCC path is optional */
+		if (PTR_ERR(core->llcc_path) == -ENODATA)
+			core->llcc_path = NULL;
+		else
+			return PTR_ERR(core->llcc_path);
+	}
+
 	core->irq = platform_get_irq(pdev, 0);
 	if (core->irq < 0)
 		return core->irq;
@@ -581,12 +590,18 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	if (ret)
 		goto err_cpucfg_path;
 
+	ret = icc_set_bw(core->llcc_path, 0, 0);
+	if (ret)
+		goto err_llcc_path;
+
 	ret = icc_set_bw(core->video_path, 0, 0);
 	if (ret)
 		goto err_video_path;
 
 	return ret;
 
+err_llcc_path:
+	icc_set_bw(core->video_path, kbps_to_icc(20000), 0);
 err_video_path:
 	icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
 err_cpucfg_path:
@@ -626,6 +641,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = icc_set_bw(core->llcc_path, kbps_to_icc(20000), 0);
+	if (ret)
+		return ret;
+
 	ret = icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b595f72b3afc4..0cb17b7db0963 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -65,6 +65,7 @@ struct venus_resources {
 	unsigned int bw_tbl_enc_size;
 	const struct bw_tbl *bw_tbl_dec;
 	unsigned int bw_tbl_dec_size;
+	bool has_llcc_path;
 	const struct reg_val *reg_tbl;
 	unsigned int reg_tbl_size;
 	const struct hfi_ubwc_config *ubwc_conf;
@@ -136,6 +137,7 @@ struct venus_format {
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
  * @cpucfg_path: an interconnect handle to cpu configuration path
+ * @llcc_path: an interconnect handle to video to/from llcc path
  * @pmdomains:	a pointer to a list of pmdomains
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
@@ -189,6 +191,7 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct icc_path *llcc_path;
 	struct dev_pm_domain_list *pmdomains;
 	struct dev_pm_domain_list *opp_pmdomain;
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 33a5a659c0ada..3afda28cdfed2 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -237,6 +237,9 @@ static int load_scale_bw(struct venus_core *core)
 	dev_dbg(core->dev, VDBGL "total: avg_bw: %u, peak_bw: %u\n",
 		total_avg, total_peak);
 
+	if (core->res->has_llcc_path)
+		icc_set_bw(core->llcc_path, total_avg, total_peak);
+
 	return icc_set_bw(core->video_path, total_avg, total_peak);
 }
 

-- 
2.47.2


