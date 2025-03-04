Return-Path: <linux-media+bounces-27480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736C2A4DEBF
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 14:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3B6F3A3DD2
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 13:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CC3204C29;
	Tue,  4 Mar 2025 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLIMuJvg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80172046BA
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093639; cv=none; b=DohNXMyHjouJON2e6navOzyUBHI26xC7UBZo9lOpNnyu4fgQIBhcZqf40myaCBcLoIVQFXNzdROO/iMPPoVB/5Wlm1MJAnBW2o742Pueln6PpnW3eTidmuPGmm9seJw4fVfsl/UysVpQdBbP2TsgoT0wNIMskno7/htTToP5E7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093639; c=relaxed/simple;
	bh=eVAsey3JxdTzcp2dytGoCKkDVWArrUAtGBxSzsk01Zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JwDt4ZwAukKtjcybUfI8xdNy1t7XJdMMPbFPVZOjJAFZLnv+Yi2Kzm9Ry5y8LydYgzRVjnhH0dWAWvbFHSrUb/EfnwS16vHW7c1WmNHccOAUzJMxnYDmqSKC118OAz91iur6Xdo1J8uUVegChDOfH7S648X8w07YCCd7IDvPb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLIMuJvg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso4552473f8f.0
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 05:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741093636; x=1741698436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuQPD4WHO0oVNRv+mxZovyBbMl3mHwOGIxiQAqnpkUE=;
        b=NLIMuJvgH+cc55I8VqOQYO6oHtM8h5SDDLFlxoZOFgmYOBBKC79kivJqLebm5TH2jY
         tPju7WC3wlIuNFhE0cAp75EtmRNBiqXNXBhrgg/XdhdzxAPuSZHcgv6EgBbAzR2KiALp
         OCqX64qZ2wSOwFtdqYXzwIGPZUBIKYvyDnKUv9l1r+xA4ZdTc9X4SYyRmjMezSNBNB4b
         bmOTk3UO4bX0+Z5f4ukZaCuA2cF/iFr24+p2+9neZimHvWjV7+sY/US+bh0JnhL650jD
         lQmYfWJajC2CJ+NpWaYi82EAmasWeKM5eZAsEQgrdyI5Hkyopnm9uzS+gY8LJoNxi6MO
         O5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093636; x=1741698436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuQPD4WHO0oVNRv+mxZovyBbMl3mHwOGIxiQAqnpkUE=;
        b=o5vrtFbRrYlIXMIc9QgJgTXFKayKxJgyD2RBRN3aPWh6Gny3Fw5aMt0Yjt4y6t/zpu
         qedtclf05JdoARjM4UwLk151V9WuonnrMby8RDrqsaoWQT10ytAOJ7xYXxSn6CJcSPDq
         U2N+uwdujTQlZyXx6C1kAO8LRtTHvX+hwQaIWf3SCkn5g4lY1Z25VDtIugKBIJVkCS6r
         EMUjfBLH4j6Bv0N/c8QYbO7mzdAnqS+ag3KF8j/1yLa/K70coD+Y46vNg/JUNDIuAy8p
         JP4B34rRk/IuusQGvLb0Y0/1fLP61vtZwzSW29BwsQbsS+H7R3Q8fs2PANa2zlGLJuYd
         7j5Q==
X-Gm-Message-State: AOJu0Yz3gkpJ0VVLIZMf1O8ruMRBVkXyCHXL12uq3eP/9mytVw38STBl
	ydMszhb+vmk79gfSs2Uo3TgWjSETB2TtsK4W7u/HF8UcXCd/RTOynSObZ/2F0Qk=
X-Gm-Gg: ASbGncuPks22hO7abwywv3/yYxQZZezQyf3bacPbSWknKxq+KEUPX824Vmtp2ztiPbU
	K2Hu/MVJfk2SxEfGYooePZF3pa3PEOplGrd0IAmg5cqL2FA+fiU6ezF67RecibtrY+mmFItJErP
	HuY9wFz7+1S2tba5ME2waA4G+odbgPW3HEKLZMRsXfGyggvzPVWvrHFu78lQRjKty02u3uwG/kW
	p/TIPsn5ETEogUGpWl1fqyqPc5rwIa/ZbLT6FJQ0+kNU0jPHOhZ0lQR62Z57G/pt2+PtvL907K4
	qgd91iMdU31LWpI+v4wzakN3zJa903u1jjrysO11Hk6+M5Fe5DkcpbXtiLrPfdwjO15ZG1mqzQg
	KYH3lTA==
X-Google-Smtp-Source: AGHT+IFHR8q/L6pe4BnBXKTY1Ga7eFmSDtcmLdUHWlgfJfHC/2yz9FYNMzKiIzY6WUs6i/rWq/DfjA==
X-Received: by 2002:a05:6000:2a81:b0:38f:2c10:da1e with SMTP id ffacd0b85a97d-3911561959fmr1840760f8f.27.1741093636048;
        Tue, 04 Mar 2025 05:07:16 -0800 (PST)
Received: from [127.0.1.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm17401715f8f.44.2025.03.04.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:07:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 04 Mar 2025 13:07:11 +0000
Subject: [PATCH 5/8] media: venus: core: Add SM8350 resource struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-5-279c7ea55493@linaro.org>
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

Add SM8350 configuration data and related compatible.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20230731-topic-8280_venus-v1-5-8c8bbe1983a5@linaro.org
[ johan: rebase on 6.9-rc1; convert vcodec_pmdomains ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: added static video encoder/decoder desciptors ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 93e5b9e1f70cc..dbce635f9fa45 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1012,6 +1012,46 @@ static const struct venus_resources sm8250_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct reg_val sm8350_reg_preset[] = {
+	{ 0xb0088, 0, 0x11 },
+};
+
+static const struct venus_resources sm8350_res = {
+	.freq_tbl = sm8250_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sm8250_freq_table),
+	.reg_tbl = sm8350_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(sm8350_reg_preset),
+	.bw_tbl_enc = sm8250_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sm8250_bw_table_enc),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.clks = { "core", "iface" },
+	.clks_num = 2,
+	.resets = { "core" },
+	.resets_num = 1,
+	.vcodec0_clks = { "vcodec0_core" },
+	.vcodec_clks_num = 1,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "mx", NULL },
+	.vcodec_num = 1,
+	.max_load = 7833600, /* 7680x4320@60fps */
+	.hfi_version = HFI_VERSION_6XX,
+	.vpu_version = VPU_VERSION_IRIS2,
+	.num_vpp_pipes = 4,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = GENMASK(31, 29) - 1,
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.fwname = "qcom/vpu-2.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl sc7280_freq_table[] = {
 	{ 0, 460000000 },
 	{ 0, 424000000 },
@@ -1086,6 +1126,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res },
+	{ .compatible = "qcom,sm8350-venus", .data = &sm8350_res },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);

-- 
2.47.2


