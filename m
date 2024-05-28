Return-Path: <linux-media+bounces-12080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661F8D18E5
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F171C21D88
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451AE16C693;
	Tue, 28 May 2024 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="BQYtiEk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583FD16B74B
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716893400; cv=none; b=eF1bnaJcR36sxaF+VkoWAegPT62s9NM5WmnzfH/8JLpGSzgln6Wrepc9Sxmt4rf5vXeus4EnPDXXQU1K7u3DIqlQdQamibPsvrLk//rCrQ31+CF8NCksbv2u01U5Cj3sk0vFdabIMd8ypKxmb28ViGDhdx8WMw21VfCiHP1IQoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716893400; c=relaxed/simple;
	bh=xkwtv/ar7L7z1hGbFo/aekoVFoud4lD93MVDzRtiDUo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=b9YklOQTDYMcIuW3H4XJ8NTIu/vFx+4FfJ5O7/mlkYobXqkOdOtiN29O6OK3KhoR2kCkCpUqhSWIE9IWFYzj0eAM9mv1zyNPpSF0ydMJFKFMCULNf2K1egXI3/GGVzJa5fJpCFIub9u+QRpGnqVrzvjVNTEO6jCBUDdwKEIgr34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=BQYtiEk1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42108856c33so22052615e9.1
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 03:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716893396; x=1717498196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SoaTaKESqCNq2RRTZbp/puYp7dOBR/SpLMVVBMPUbKE=;
        b=BQYtiEk1dUXiYPFN7gSahgzdU28uSoCjrRiU4OUqdoBtDUEtwLxU9bmyMvBR5hu+OM
         prtRdM9hgVNwm8p7CRybS20YxLqL0abaUqWpNo7qhlFJTSQz7rv8r1uArH/cBngiev8w
         YOlJBdKsrDs2WmGwQh/u2VM6J6az11oluqyl9Sj/vr1O0H2n0+9XlBprtFswcEo2J4V8
         3NOx2G/vPnOj34MD3+iMVYPzSb8x7bC2VbrqZ2vVn5t7KWRXuXEAKcEjmpXijWN1wzpL
         NGuVf9IPBg7UlvZz8KOXB2KtwPjJtzM64RaT/Tga2XPef7AFgXv4Bao3AnXibBxkVf0/
         EE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716893396; x=1717498196;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SoaTaKESqCNq2RRTZbp/puYp7dOBR/SpLMVVBMPUbKE=;
        b=OEOod5/sPzirAZV4MWsIEWeddYWnxL0tae6J5jL665e064D19EHSf/2ZqYSey4V+U/
         GdNA0MhjFjS9rKY99R0DfrOTuJXbvKyWnxAbIWUfi8I/P5IGAqO9bNh5EVNet/8GUVOl
         pYQ78hSvnYEkJELSKlBhALzUTOvc4bF4S9JeszSHkbYzHKOQzbi4Hf4J1mthzPrhg2tq
         iO+LPfa/oGEguFnfWy3doATyv3WyImqA2xdtt3OMsY7KrNyePjFLecIAxKllCtfukOZ6
         efJZCumlAgnEMYSyODEeRg/CSuAFwXhZaQcGj39Z05HO9ZuHx+JNL1ce2jxME/nDKAdf
         M+0w==
X-Forwarded-Encrypted: i=1; AJvYcCWvYfk+/6OkQmLlwDFrrXUIwScGmCR0j9+JKN6xq9PGLNWxCnDhMwGZJcmA/cbzKlHYb3Ju4+wcgqPAssSuuUO69oHWL483qcInPbk=
X-Gm-Message-State: AOJu0YxB2dKsaURGU9ajOAyKRAGf/+mEbhVoPOwTKUaj3b85Qta8yGAC
	+Xrn9Y/khsvcQ/c6rqtzbLa6EmJISuUuaPzgcV8e4n7Tpqo7DFYMwenfq1ht5fM=
X-Google-Smtp-Source: AGHT+IGewrMUbSSURVDW5W/6sj6A3tBXyhPbUTHqmyvZmpelqP045wp02w6f3gR0CZiMG43AH7dtNQ==
X-Received: by 2002:a05:6000:1753:b0:354:fce5:4cc3 with SMTP id ffacd0b85a97d-354fce54d2dmr10916648f8f.19.1716893395715;
        Tue, 28 May 2024 03:49:55 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a0902fcsm11321509f8f.53.2024.05.28.03.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 03:49:55 -0700 (PDT)
Message-ID: <b4a71be9-b888-4396-9eef-28c4a4f2b149@freebox.fr>
Date: Tue, 28 May 2024 12:49:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: msm8998: add venus node
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
 <c2fca6c7-2421-42b4-a43d-68b251daf9b4@freebox.fr>
 <e187c5ab-0241-4a45-8d74-a33ec12deec6@freebox.fr>
Content-Language: en-US
In-Reply-To: <e187c5ab-0241-4a45-8d74-a33ec12deec6@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/2024 10:51, Marc Gonzalez wrote:

> On 07/05/2024 11:29, Marc Gonzalez wrote:
> 
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> Now that the venus clocks are fixed, we can add the DT node.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 5f5b90a6e2bf1..3d3b1f61c0690 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -3010,6 +3010,54 @@ mdss_dsi1_phy: phy@c996400 {
>>  			};
>>  		};
>>  
>> +		venus: video-codec@cc00000 {
>> +			compatible = "qcom,msm8998-venus";
>> +			reg = <0x0cc00000 0xff000>;
>> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
>> +			clocks = <&mmcc VIDEO_CORE_CLK>,
>> +				 <&mmcc VIDEO_AHB_CLK>,
>> +				 <&mmcc VIDEO_AXI_CLK>,
>> +				 <&mmcc VIDEO_MAXI_CLK>;
>> +			clock-names = "core", "iface", "bus", "mbus";
>> +			iommus = <&mmss_smmu 0x400>,
>> +				 <&mmss_smmu 0x401>,
>> +				 <&mmss_smmu 0x40a>,
>> +				 <&mmss_smmu 0x407>,
>> +				 <&mmss_smmu 0x40e>,
>> +				 <&mmss_smmu 0x40f>,
>> +				 <&mmss_smmu 0x408>,
>> +				 <&mmss_smmu 0x409>,
>> +				 <&mmss_smmu 0x40b>,
>> +				 <&mmss_smmu 0x40c>,
>> +				 <&mmss_smmu 0x40d>,
>> +				 <&mmss_smmu 0x410>,
>> +				 <&mmss_smmu 0x421>,
>> +				 <&mmss_smmu 0x428>,
>> +				 <&mmss_smmu 0x429>,
>> +				 <&mmss_smmu 0x42b>,
>> +				 <&mmss_smmu 0x42c>,
>> +				 <&mmss_smmu 0x42d>,
>> +				 <&mmss_smmu 0x411>,
>> +				 <&mmss_smmu 0x431>;
>> +			memory-region = <&venus_mem>;
>> +			status = "disabled";
>> +
>> +			video-decoder {
>> +				compatible = "venus-decoder";
>> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
>> +				clock-names = "core";
>> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
>> +			};
>> +
>> +			video-encoder {
>> +				compatible = "venus-encoder";
>> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
>> +				clock-names = "core";
>> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
>> +			};
>> +		};
>> +
>>  		mmss_smmu: iommu@cd00000 {
>>  			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>>  			reg = <0x0cd00000 0x40000>;
> 
> Hello Bjorn,
> 
> This patch is supposed to be merged through one of your trees, right?

Bjorn, would you take patches 1 and 2 in your tree?

Who would take patch 3?

Regards


