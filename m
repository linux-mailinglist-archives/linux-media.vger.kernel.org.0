Return-Path: <linux-media+bounces-34413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C205BAD32B9
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD34616DA4A
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE84428A708;
	Tue, 10 Jun 2025 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8Kh8YV+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8C021B191
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549045; cv=none; b=NAJPjJ+MsAKjeZ4W6Oe/DoSqzczC7yhljTfHwBC+QjbBZEC+Qvmo5zZeElLVH3JBjiXtFPAtxtiJ8fcKC+J3rxkL7vIGXwyj08AFIr+8yRng6w3uWdLGS80k5LgzCUkoJc4CwbpPU8a/z5CX7ujS82orKI2eVlW0Cu1xdpXZUkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549045; c=relaxed/simple;
	bh=8Ll2kob0wSYtYqhFir3rxUwGEptHOBJiRRepu1pCBG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3F8HHHXWoSFSn1iAB0sU2rfqV2lpxgUiUO/pbXOZn+eM73c0NqSsYEGpbjxaMOsc52t1ORJUQ73+S7ZMC+9VELEnZvF8Zuiw1iRhWtBC1ULbwBFDkOAf1s3CKhsHOxmSuLox6NpOR6nyC4OQTeldiUDkA4K+9nxp3Qf95PkLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8Kh8YV+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4251353f8f.2
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749549042; x=1750153842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8TznzlpknrW4G6RXb6OY8061/Q2TUa7Ep05qd1XEIo=;
        b=p8Kh8YV+1h0Mtfja6dRk9SorulJQLx5zlkXLR4MhDw7Mzhwf3dam/zWzfjekXS5ElO
         TmDj8LqG0qOcGo1VeUPBJZQtltFAC7UpeFbsVy7u2lCE4aYnMfBsjpz7Vwa0IJJ4O1V3
         qxvd49C1MtYbOazkrUhv+gzXq5y+yN8cbZ31ajzKji7Ge9d36QoWQl8lpSW5Y2bT49/U
         cPmVYFU/8/xQ9q3oRRKDKCHOHUhZkP4DlcCrnjika9XKGb8/Y0htUZQ7Ikm6FjpD1aw3
         T+G6elY0pcY1WqjyRh8yfR0L8tIJ8sYsftNpxK3k4EX2lvNnprRkMIuiBFqfq+RpZBwv
         e5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549042; x=1750153842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8TznzlpknrW4G6RXb6OY8061/Q2TUa7Ep05qd1XEIo=;
        b=oiMRcwjfDilpgsoKZJatAARtyMpGhJeNDYrKTLaZ8/iC8XcfPaq7477w1nHL8V00ug
         3FZ0GpYCQoW40DoVuClGAEAOXF6vbCvetsKC8dxAZgu/0oGFx2OywiTRPTqO/7ZRL8/3
         1muqibV5WH7DY6TN7zlbXV0r1yFC05aYE7a4I5v5StS/r5XTH6qv+zlY53qpMmKtGUA5
         NhUJ9JmCX/YGs+kYkZWN621mMmF5DFI5yIGSeVExzdkwTSS3290adhi4JF33Z0/1yDQp
         /cYPOJporsBVFy052/jNbRk0xzmUY/R4wxXV1UrFx/f4s9Fo7vVYGziN/ba9D37Dwi28
         y/8A==
X-Forwarded-Encrypted: i=1; AJvYcCWvE6eZX5RRECYIWHjhZaMWOXKN1vT5umWrp6plM5BKuqdM0AetixMVzWNntSHCaDonqEDzF+Ygf1dYpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzkz2fGhNOCrtLM8m7XdNVdEqWDdOS5vaVlXM9utY5SSICCggu
	PKeIyRN8j1ybvmZnpuUxUguYG3fTSPKfBPElzxuO0WqpxBdgdjRyMWx1hvS7j+jy3ic=
X-Gm-Gg: ASbGncvN7VifjhLKPz1ybBPak+08QG1RjO3Clpxnw2HmjjUiMEWOpnJ5cAxSknpyP5Q
	zHTdohm8Too10rUwgajlXjwgRIcFqSUhrhULyMR2qS23FFUwMOr+Ucgw8pE4h3NQL/MwM0ETbbF
	5ej67HpsggnEVaD1AmY9arK1d1gzY2CL8AW8fCVxslegjNWXnVgVKmDu9VjmKiZeQtdNRQzOBeM
	Ffqedb1ER60ZJjjbNgf6CKIF8xx4WC50CdzPgVZEq5RY8h0Mv7F1BaxWiOuC5G4UmDZn3OEGIUs
	MY6gbbsC1+/90BbHtMtW19xyphQen79M33n64nkc+Ekl6aLCFfURbpj1G+gNjuoFt1egfgUxux0
	zy0q0fejEfKqW2/rxwvvjcdQg6Pk=
X-Google-Smtp-Source: AGHT+IFusBXxkEoy5ESx9MfQVNtq1yC/GkKu9UVFSbJCvfrUmjZpjS8AwFM+vB8gJqBUqNEpqvdK3g==
X-Received: by 2002:a05:6000:288b:b0:3a4:fc3f:b7fd with SMTP id ffacd0b85a97d-3a552275450mr1444778f8f.19.1749549041672;
        Tue, 10 Jun 2025 02:50:41 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fceasm11618998f8f.82.2025.06.10.02.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:50:41 -0700 (PDT)
Message-ID: <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
Date: Tue, 10 Jun 2025 10:50:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/06/2025 10:48, Vladimir Zapolskiy wrote:
> Hello Wenmeng.
> 
> On 5/16/25 10:27, Wenmeng Liu wrote:
>> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
>> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
>>
>> SM8550 provides
>> - 3 x VFE, 3 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 8 x CSI PHY
>>
>> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 210 +++++++++++++++++++++++++++
>>   1 file changed, 210 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/ 
>> dts/qcom/sm8550.dtsi
>> index e9bb077aa9f0..722521496a2d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3326,6 +3326,216 @@ cci2_i2c1: i2c-bus@1 {
>>               };
>>           };
>> +        isp: isp@acb7000 {
>> +            compatible = "qcom,sm8550-camss";
>> +
> 
> This is the first time, when 'isp' label is used instead of 'camss', it 
> might
> be I missed the context, is there any particular reason to do such a 
> change?
> 
> If the label name is changed to the regular 'camss', then
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> -- 
> Best wishes,
> Vladimir

List feedback from DT people is isp@ is the correct prefix.

---
bod

