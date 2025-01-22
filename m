Return-Path: <linux-media+bounces-25131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4010CA19282
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4CA3A0FD9
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FE7212F91;
	Wed, 22 Jan 2025 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vfd+wum4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7BF1BF24
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552631; cv=none; b=tvY75cekrTnprFq75JJI7/MWvJVdb8UI6zI0Xi+pkfmGG5Pln/eC4jEKVZfs6uslF6iZhQxaS38JmOtZV3wNIibJqYAX+bwkoYJbKHhyGwLRTUpkwi+5hZ66s85wAjmz58Hq/NEj5lRdgiC9NFbq6TqAoSNRoEEmi+8H54Wbo/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552631; c=relaxed/simple;
	bh=aFfcC6jiiGz1Osz0vw8EKi0+lxkltGCJDQoZCrR2Ux4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJeLo1StN5wlx+2puwP4BtLJEZkPc73XOPp5bDMrHylb8V2pABODYQvpBlFasz2vIo/mL3JVLBoMrqA47pzo9SF/2hmT9tsKHl4LasBIjYGgfwkqBCRX5Srt7Gu/zhDt0HDKi0n0t6MavW6pSPzAafwYxi6GPLaHuxCqRbj0OTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vfd+wum4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso5786275e9.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737552628; x=1738157428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NB6Rh/OFeXzQHL/a0mwC65e81QBFBxkxQjo9tidAdio=;
        b=vfd+wum4b9E3w0Fcz9bN3ngiXfnVRQ3wRkSbmsT+us1AJj71QrptJ5KqxxHjAe3lOs
         zrg4gF/H6JugCQciKnln49dCHw9UayBlZYBRLmKvy41/53G36pYTW2kOPE+E8Z4uPltE
         WfvtcMza0/tHynGJlkidQr1A0H1xUe9Nt0WLmkBsFEEtelhdfAT1X1CwyPIQFHbm/kJq
         LPxVeO7AuVsi4lz0jU7Ocbh62v2k4gQufWFuli+xnqH/uN9DoHPA/rgvM46zOqACSvyG
         z7ZRwCVgiYl9dLWXNDDltlzrpqroTa6enoLHLrhPpXhvgPGAv1NNlIqSUhVva3fT9eLI
         OM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552628; x=1738157428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NB6Rh/OFeXzQHL/a0mwC65e81QBFBxkxQjo9tidAdio=;
        b=eOJV8YnOFlGRrqDwi+988rgrkEnzgB2/nK1cv9r4TLy2P+JTtFpBpehCTmIuxs4Q+l
         uxRMb8EL36hvAc2h2JyKEvrIvvpZ9cYwUdqnQAjPGxYjafWky7G3U+h3Q2foERBaHBn9
         2rkbAsRjXeV9zkQxH4B74XBAKptJpSWj7bUA6/cgo7jNzH8tbeTWkMfku/i0VKqUlSFk
         +QAc3szaZ6OoK8+eW2PhO1Au4Um9IHcUR4Bc1edvgCa82XuvsoU1vlEC2sGXTxaPLITe
         QwoK7lyPg7sPhkmZdYA8D/VoJdALAJ3/IFhXJZ1094acPReyW9ku2AL3o1RYOz2wQSto
         OkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhf11CB5imIjbe8b/aIaLzzjhsKwduwtbJEjP/2tp1csRXZzuQYqA/MM0Yaq18Zzqs92L/qHdz77+NZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1SFqVFf43A5/oBmPHuzqGPjWX5dNGtESGS8k+FMPo/kSjUdQK
	a8TJWy8Q5cnhOBVwKf7ND4VrnRgFBmlfjq5kb723gLuK+hRGWSbsxArFhYiqBss=
X-Gm-Gg: ASbGncurqJRtp1OXqubCAHuyOSZ7H4BsObgF4egF13Q944HH8Udaa7uuZ/i2uveaVvq
	rjnVIVEHli2ZPbgpygkOlj+65WSX8SZ3Uki3xqfjgQ+DdDZPBZupCaOxd8PafBct+d6pRxdUqnj
	58cGCgmZRmLDn0uaTQTnKP3D1eGNqqGbruOPtTxRVADMQdjhBy+ijh4tCTBDTBgjtsOsRQLztA3
	NT7TJaYkH+w20ZT5P8hPwIuxyDJi45B331726ayv+1pw+fngKrui7VVJHp1Lndxk6+tyv8uTGSr
	CehmINk=
X-Google-Smtp-Source: AGHT+IEs9lAWF9RKOmcaZzHtX4TIStHBK+ZBY/o7F7o+SLwozXV7t/wh2J7X0yEr3mWNe9q0TILkWA==
X-Received: by 2002:a5d:47a2:0:b0:38b:e22e:aee0 with SMTP id ffacd0b85a97d-38bf5b02a75mr19062848f8f.23.1737552627762;
        Wed, 22 Jan 2025 05:30:27 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327556dsm16278714f8f.71.2025.01.22.05.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 05:30:27 -0800 (PST)
Message-ID: <f0079c85-0ff9-4663-9ba3-b208b3487db5@linaro.org>
Date: Wed, 22 Jan 2025 13:30:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: update clocks for sc7280-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
 <20250121180746.1989996-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250121180746.1989996-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/01/2025 18:07, Vikram Sharma wrote:
> Update clock names to make them consistent with existing platform i.e
> qcom,sc8280xp-camss.yaml. Rename gcc_cam_hf_axi to gcc_axi_hf and add
> gcc_axi_sf.
> 
> gcc_camera_ahb is always on and we don't need to enable it explicitly.
> gcc_axi_sf is added to avoid unexpected hardware behaviour.
> 
> This change will not break ABI because the ABI hasn't been cemented yet as
> the dtsi changes are not merged yet and there are no users for this driver
> as of now.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../devicetree/bindings/media/qcom,sc7280-camss.yaml   | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> index e11141b812a0..ee35e3bc97ff 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -55,8 +55,8 @@ properties:
>         - const: csiphy3_timer
>         - const: csiphy4
>         - const: csiphy4_timer
> -      - const: gcc_camera_ahb
> -      - const: gcc_cam_hf_axi
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
>         - const: icp_ahb
>         - const: vfe0
>         - const: vfe0_axi
> @@ -310,8 +310,8 @@ examples:
>                        <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
>                        <&camcc CAM_CC_CSIPHY4_CLK>,
>                        <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> -                     <&gcc GCC_CAMERA_AHB_CLK>,
>                        <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
>                        <&camcc CAM_CC_ICP_AHB_CLK>,
>                        <&camcc CAM_CC_IFE_0_CLK>,
>                        <&camcc CAM_CC_IFE_0_AXI_CLK>,
> @@ -343,8 +343,8 @@ examples:
>                             "csiphy3_timer",
>                             "csiphy4",
>                             "csiphy4_timer",
> -                          "gcc_camera_ahb",
> -                          "gcc_cam_hf_axi",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
>                             "icp_ahb",
>                             "vfe0",
>                             "vfe0_axi",
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

