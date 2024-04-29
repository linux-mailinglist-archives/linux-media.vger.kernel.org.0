Return-Path: <linux-media+bounces-10366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF278B5EDE
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 18:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1742E1F22D2B
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 16:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B67886240;
	Mon, 29 Apr 2024 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="sSTpse/J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F92A8529A
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714407678; cv=none; b=hqJKDLaMApT0sY8fGyuUdmSn3lZocTknDikpUeFUCUmSkP1z770s63SSt5ZgEVSIpBydsCD4xLN0+LYoMipSuidU88AH5/dKeB0FjlSF0UdHl0kzpnaoCNE8wRZRblcJG+GzopZXoBxtClM+QNeKh8RqiQ6se3OGz5RxLYn7rso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714407678; c=relaxed/simple;
	bh=m8JLb1BdA35HdBjPkaAuNAfY/AHY/SDnhNfpPmwpAr4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sUWL4l1mq/wTlAD/u4LaQdBY+rbLl3YyzkwQgo2/C2E8LSYNGwKHdPBRetn2Qidhxd33aLqqR/maE2rCmHJqIGxWrmi644NiNx1ZYUngMSWdDEQIlrLyBQwWsi7NdQD5B6VhmiyuI012WDlRnCx1r5gk+aitcOfhOzm/baPDwzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=sSTpse/J; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41b782405bbso25992505e9.1
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714407675; x=1715012475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TjXiKLYT+vUURpqFWBvNlsCdhsHBjZCyYATylO1W8pY=;
        b=sSTpse/J66i8+IIQi0z5mUfXgMRwLWKA9F5py6zcxcX5VKx/c9Hc3Aa9pu+bj/ybWe
         EhFZ+LE1mJrSFZeXoR+Hig2SG8R2CBTyw5tf/vmux4r9DQDDuFxlL1FJJRu1fWW27PY2
         AD60vVXFTksdlq6pI9FngukxiJnpnAyLcNMttVW5MumYR5/3gpikE9wtqFL2h6yqoiCZ
         zCCCN4aFruArSZKZa89LwSrF1obi4sHoo9udt7Cpza35Ds3ocjBRT0q/R4YLI4qLfJRD
         a9VV+wg32yoEOZjBlUHHqv2LyT1RpNRV2780avbauSw/XgskZYj0olvWEyi0DRM5Rr0y
         3QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714407675; x=1715012475;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjXiKLYT+vUURpqFWBvNlsCdhsHBjZCyYATylO1W8pY=;
        b=v7uOa6hDYAjMD2/KfIUtDtqQrXMA9jQQD7rYhIsqHNP1+Q5TB9LSM6jNSSvTnNs25q
         kkL+yxHLsWNMMC8AJF53JWH4aDHxQaOfPNhRdY9srHsreAQMv8Gz1UOLkQmwFK9D/7oj
         +Aed0A/2W1YPHy1jM2p0NQ6nmpxtubMZU9jebn0J0KY7kN834+TfZFlY0MzaOMjNKmZc
         wbqvBVS5lTPAn2MhCJ87CEyd1hvdS1gqZawn35t2oIu4t8fTOWX6zi09HL7D6Hpe9WcO
         OuTj+DX/FWdXHUwtburNnrvSUD9X1XL59OiNqHPzLtpEoqA1ziOEJ1xBFg8p4hc9V43j
         +bHA==
X-Forwarded-Encrypted: i=1; AJvYcCVXsL9e3tx56/7Uaz4jwfKTmsaDy1stD9g0jyz/F8C7RAy2mbS/bzQNWKL3/Ok2pbE7doBE5DrJfUltBSJhp6eX5lVi849qU5QMvas=
X-Gm-Message-State: AOJu0Yxd2dKd3uq/vJkNhGYWj29CwprU7waW0ILw87QfVSha4gDyl4IK
	kSOdUW1s8UY24sG0CLvPQUR0Y+wYlyyakNUMAg9Dsi8iGwFW63VqvMNJiuxa1oM=
X-Google-Smtp-Source: AGHT+IEwTazlO5LpSJzhQHEdjt+50wYigGrsXmr6gaH7/NGRF2hB7OgAQ6yhAN9gI3nHePvx8wBg0A==
X-Received: by 2002:a05:600c:4f0d:b0:419:d841:d318 with SMTP id l13-20020a05600c4f0d00b00419d841d318mr9399276wmq.29.1714407674824;
        Mon, 29 Apr 2024 09:21:14 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0041c012ca327sm7469761wmq.45.2024.04.29.09.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 09:21:14 -0700 (PDT)
Message-ID: <61729cd3-0a93-4e8c-a7c8-6832d43c7a3a@freebox.fr>
Date: Mon, 29 Apr 2024 18:17:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v1 2/3] arm64: dts: qcom: msm8998: add venus node
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Content-Language: en-US
In-Reply-To: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Now that the venus clocks are fixed, we can add the DT node.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5f5b90a6e2bf1..3d3b1f61c0690 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3010,6 +3010,54 @@ mdss_dsi1_phy: phy@c996400 {
 			};
 		};
 
+		venus: video-codec@cc00000 {
+			compatible = "qcom,msm8998-venus";
+			reg = <0x0cc00000 0xff000>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc VIDEO_TOP_GDSC>;
+			clocks = <&mmcc VIDEO_CORE_CLK>,
+				 <&mmcc VIDEO_AHB_CLK>,
+				 <&mmcc VIDEO_AXI_CLK>,
+				 <&mmcc VIDEO_MAXI_CLK>;
+			clock-names = "core", "iface", "bus", "mbus";
+			iommus = <&mmss_smmu 0x400>,
+				 <&mmss_smmu 0x401>,
+				 <&mmss_smmu 0x40a>,
+				 <&mmss_smmu 0x407>,
+				 <&mmss_smmu 0x40e>,
+				 <&mmss_smmu 0x40f>,
+				 <&mmss_smmu 0x408>,
+				 <&mmss_smmu 0x409>,
+				 <&mmss_smmu 0x40b>,
+				 <&mmss_smmu 0x40c>,
+				 <&mmss_smmu 0x40d>,
+				 <&mmss_smmu 0x410>,
+				 <&mmss_smmu 0x421>,
+				 <&mmss_smmu 0x428>,
+				 <&mmss_smmu 0x429>,
+				 <&mmss_smmu 0x42b>,
+				 <&mmss_smmu 0x42c>,
+				 <&mmss_smmu 0x42d>,
+				 <&mmss_smmu 0x411>,
+				 <&mmss_smmu 0x431>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
+			};
+		};
+
 		mmss_smmu: iommu@cd00000 {
 			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
 			reg = <0x0cd00000 0x40000>;
-- 
2.34.1


