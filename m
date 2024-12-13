Return-Path: <linux-media+bounces-23388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D29F0BB8
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 12:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0873228329A
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDE31DF74C;
	Fri, 13 Dec 2024 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trhYqVBU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CCF1DF273
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090905; cv=none; b=NVgj6zlAja7NqkTYPLLBeCbmqdYCgTcjJKzV6U/s/LqA0stUvS4TCqNXICf1IfV6J1B/MMTAp2m52K3ke5NkeLDLEj+84AvAIQrhVU7EidsBjrug9Opx848H3S7Tz43z4jzWZU1NJlY3ccXOSFs4QSTjlTJSpZMHzW1uajp6kvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090905; c=relaxed/simple;
	bh=cm5icUi+sGrOEhIGQ1zzIb3GehhAkBun86ehhroxOkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bex4jfiFdnLl6dFjLpFrSjxS8BMTsqu4PWeyrCXKWWGFHunfGTSk5bbXxqKLl59bO7pUJRRLMnSnZvGjMJtW4DGGNKZvU3VZPPt2Bnpijaogau4fecpqzkgQdGAm+tcDm52Womrcq5/h+iD+MMjKDz4s3W/O5oxvR4iqY5E7YOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trhYqVBU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3003ae21db4so817751fa.1
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 03:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734090901; x=1734695701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F3dU7OsF77ENdouZE5VjBEoGAwdDiEqe/G1nbxNLpk=;
        b=trhYqVBUkmMfN2kG1osEhNbww1Gu7a3EV34B339p4IRX8ZlczOWUX0peFPbWNbX1ia
         zLR32uEdDx099B852sbHC1XztZFJF3shiqZSXKexo5xEGmCDfbF0EuWTg5kibrpPrmw1
         /EuVvxB2JmIhtBqY5fB4u0x6JdiK8o0umlnHGztn0qZMB1bLCaQ5BaaTw6xKoFXi/+p1
         +2VR+Xy0m0IgVsWFNxdytgiLi44Bhuod1BY9V+PZ10WLEYPlWOjB1E5DKqbvf5YAVvdY
         8+sw572STWXXcIACzgyO/uWPrrHLnU4B2M+W78Y8t0cngh7DWoxFnFDpHHfHJK8G/fC6
         azOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090901; x=1734695701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2F3dU7OsF77ENdouZE5VjBEoGAwdDiEqe/G1nbxNLpk=;
        b=hitJa8cTYL1WDJkWtob9WGK0BOtjFyXeK1DyIh07LQ2ot+3+Sz9hkoxVZRUvFd/53H
         RJF5E/KiV3S59sMsMoefaf2xLbJeaKVXQ01bWiWIeR4+536M2SY9WWmngrIQy6UBarxe
         ygoUlJWNhOCDlYuYj2w5LKJtHmXn6EiQ1l9XJW/zwgEpmnpDA4Np/FMlzbG5cHYbnHyt
         f2aT0Pd3X5gayF9u41Qygh+SnCiVnTasntyZ9nRuWKZ1aPEs/agaA8WVlvwfbtlx+Zgy
         2rCL0FJ0Ju8st/QReMQjbbgDymZu0L7nx4Y2ArSvysF8cUWps+h3zoL84BgEeRzB8u2r
         Xqdw==
X-Forwarded-Encrypted: i=1; AJvYcCWWU6LdjzIJaEvUcqh9gxw5etcbZI4xLyxXONmDcE12yxkedPQ+hVGLFNxjs5EQHIeGwYp6zCGSW/JsRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAetRqLYPzA/heOyJm7FBZzNhP+wKeT15ntlWgLIjhDZcanMyO
	hoYqjwfxNMrX+Vy7yE3PhdBnsacXZ1H/41aJYWnFghYXhQEmZgRFD3WoMmCKj0U=
X-Gm-Gg: ASbGncv93nXW1BXsUyXN4Lo8in/mxakZ1SWd9BnCiQcwUezzDUxfkEnNFXT02CirdaK
	/fv3VCJLD9K+2SVofyC9FL+vIoQqfqxjIBdlViDAW7Z3/u8KqADJGRZHX6fU3Dgv2fqT/IIL+EV
	YpZH41r8gbceu84Q9iKJYxNhVFoDNPBEnl9HLZCpUtdGpYL6woqD73OkeXK21sfkMi7ByIooWmO
	lT4Nlqrnde+TDFzkxlPUdaLxrNSO4V1RMjhExzhk1bVfETiFrrGm4IL5B98QJ5gHWmnU4ZTekTY
	amcfQ413U/25wTUlh06xiDX3RhIWFtrJnEw=
X-Google-Smtp-Source: AGHT+IEw9CbAiCn1zybvAh6eWtC/7CZTeXbl9zppPNXp3e2y976kH/LkaKh1sfGg5XjVH3qSYyz7kw==
X-Received: by 2002:a2e:b954:0:b0:2ff:bdef:88b5 with SMTP id 38308e7fff4ca-302544ca4b6mr2241771fa.12.1734090900693;
        Fri, 13 Dec 2024 03:55:00 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-302292959c0sm13482671fa.94.2024.12.13.03.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:55:00 -0800 (PST)
Message-ID: <244ab38d-762f-4860-b38e-51b08389ee6a@linaro.org>
Date: Fri, 13 Dec 2024 13:54:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
 <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
 <e4bd515a-eb98-4ea1-8d73-4ba5e7c9b66e@linaro.org>
 <D6AJ9U23ANWI.1DLHNPU5A6HQ4@fairphone.com>
 <d7e3076e-5b32-4ab8-afe8-f52458769f23@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d7e3076e-5b32-4ab8-afe8-f52458769f23@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 13:34, Bryan O'Donoghue wrote:
> On 13/12/2024 11:24, Luca Weiss wrote:
>> On Fri Dec 13, 2024 at 11:50 AM CET, Vladimir Zapolskiy wrote:
>>> On 12/13/24 11:34, Krzysztof Kozlowski wrote:
>>>> On Mon, Dec 09, 2024 at 01:01:05PM +0100, Luca Weiss wrote:
>>>>> The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
>>>>> CSI-2, but not any others so restrict the bus-type property describing
>>>>> this to the supported values.
>>>>>
>>>>> The only exception here is MSM8916 which only supports D-PHY. C-PHY was
>>>>> introduced with newer SoCs.
>>>>>
>>>>> Do note, that currently the Linux driver only supports D-PHY.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>     .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>>>>>     .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>>>>>     .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>>>>>     .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>>>>>     .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>>>>>     .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>>>>>     .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++++++++
>>>>>     7 files changed, 133 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>>> index 9cc0a968a401836814560c1af3ee84d946500b4f..3de2a3d2b5b761106975aab65ff614b2ef579ef5 100644
>>>>> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>>> @@ -94,6 +94,10 @@ properties:
>>>>>                     minItems: 1
>>>>>                     maxItems: 4
>>>>>     
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>>                 required:
>>>>>                   - data-lanes
>>>>>     
>>>>> @@ -113,6 +117,10 @@ properties:
>>>>>                     minItems: 1
>>>>>                     maxItems: 4
>>>>>     
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>
>>> But is it really needed to specify the single supported bus-type?
>>>
>>> I believe it is not, at least it's not ever done for other media devices
>>> like sensors.
>>
>> Through video-interfaces.yaml 'bus-type' is already allowed but not
>> restricted to the values that actually make any sense on such hardware,
>> so in my opinion this makes sense to have here.
> This is additive not prescriptive.
> 
> New additions should include this bus-type number as we will need it
> when we add CPHY support and the subsequently move to the PHY API for
> CAMSS PHYs.

This particular reason is invalid IMO, since dtb changes are not relied on
drivers and shall be kept agnostic.

The open question is if it is really needed to specify non-variable
bus-type property. As I've said it's not done for other media devices,
so that's at least the established policy on practice.

--
Best wishes,
Vladimir

