Return-Path: <linux-media+bounces-10469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E58B7BC1
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 17:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1E08288041
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 15:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413C917335E;
	Tue, 30 Apr 2024 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="OKv34VfG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14AD16D9B6
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491317; cv=none; b=Ymisw5nOTOqUlr9ZaYN5kUbB1i1AnLoIdNDkNCHyNfoJXtYWCUFtFj2et8RrNS+biWFq1N6s8kb8rnqGcYthqanSmF83hmfpgJdDzWA7g2HvRXbNQ/k6OZctFxB5mkUTiaT3AyXXY3XeIY33xi5I6Yxc39av6gbrG0+I4zCWMgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491317; c=relaxed/simple;
	bh=MPXbvZewmO/D2DEHW1XiJWvSM8CPq85XDTvUbnZY4DQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=catri2/0ctRI+QvDu2lJjybK2i3+b5SMSvPyW3SH0+nQ4Cs6OwV41Jbak8Tsfm2vgpgpZFeZW6usE10X/ZACjorY0HPOG/tIdREKYDnWdkbrDz9glhwKbaQooaJJSTACW7i7zUS1iSmGtfe6imXJS3SCbD3Q9yu1T8Oc7mFj85Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=OKv34VfG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41ba1ba5591so30770095e9.1
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714491314; x=1715096114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QyXdN6gxvZfSyDlB/uI/J3a7zD0pJvSdTF4inS8BuAY=;
        b=OKv34VfGvM0gRFRCIxQ5jCqJI+5hUmKmQj8oSnVTtPdDp54APgW7c9APrsoMdNlbCA
         73HQPruan54V0oGSfcl8ckotm/B7r2dZ4RIFlB9PMUiHQLsT9X6TvLLRkLTjqaufCI2D
         +mmbpn82uHfSj2PdRX1jWld7x12Ky9+OsMGpj5+mfgY2G0nSW3WVvWCheVfrzknIUbWM
         UweEDxX0VoCJKqZ0BkKw4wgKaw6sIEDHKnLp0WjtXO8pqzM9VLFASEldS6YT69ZMolGJ
         g/zCHsZ5FHYRSP/o6VZ0N1XWhcFzcekHwLI0WAL6USiTULVmV4yffjwMsz97egTeWeLH
         LWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714491314; x=1715096114;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QyXdN6gxvZfSyDlB/uI/J3a7zD0pJvSdTF4inS8BuAY=;
        b=lVfrd7j21OLm0CJPtU3qWDZ5Rgw6+85QqQrnEJKw5ZX6u+O7yFHvtWozs3iIBM02fL
         n86V5HU8IL2GZZXUxOpzvj4GFqfWOrxpjhVHvRyWPAZfC7e6fjZuixO1x3OIzyCw/bJd
         +JhVeFExEJqEl8WPKV4rgMAHIIZozQch4NkCmsGaJSPNw3DhaQrMmC7w+CBZ3WJzOne1
         QnaKC6UwEcoFYpp2tRN4caQ64tRvuofjKrXlPCItXb89ATWQRkCQb+2RXrYuVlvkOIK5
         RnhdRmdNCEkHf8+bKbnCo7OCR3L/5Giy7ykJVrij8+MvJFYVnJrEfst+1g2UYfXC/t8B
         vp4g==
X-Forwarded-Encrypted: i=1; AJvYcCX/wRC9n40Xv+BNCDtuvqQOZMor0uQU6wFE2ucerHW8PNedrTVgzSWxb3rontQgTdo25LZIvyAHo8ghBMRXivw/uT5/SiQpRw7o8ko=
X-Gm-Message-State: AOJu0YycW+65i4i+ymzUK3pfuvrkqZNXoDdjYHfehb8KRRXRmUM9TMo3
	cpNIckGalWyz+CjEj4j7JkqwGpQ1X/OW4GScc1bDHSlqIsLE7elsUToNUgorHKo=
X-Google-Smtp-Source: AGHT+IFrLbxNE44BvP21M6g2WJTpq0/K6uhfLusQ+1ISn3HGmLcIUnF43AaIXpJs1Os97gFG3XMenw==
X-Received: by 2002:a05:600c:3d0b:b0:41b:6cf6:61f8 with SMTP id bh11-20020a05600c3d0b00b0041b6cf661f8mr8498967wmb.11.1714491314064;
        Tue, 30 Apr 2024 08:35:14 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b0041ac4aafd3dsm27045674wmo.12.2024.04.30.08.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 08:35:13 -0700 (PDT)
Message-ID: <d474ee6c-c429-40c0-b1eb-19647439eb6f@freebox.fr>
Date: Tue, 30 Apr 2024 17:32:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8998: add venus node
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
References: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
Content-Language: en-US
In-Reply-To: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Now that the venus clocks are fixed, we can add the DT node.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


