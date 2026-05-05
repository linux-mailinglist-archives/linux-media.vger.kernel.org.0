Return-Path: <linux-media+bounces-60474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIHIMTM9+mmjLAMAu9opvQ
	(envelope-from <linux-media+bounces-60474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 20:55:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708C4D2EFB
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 20:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E52A33021ADB
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 18:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006C54A33E9;
	Tue,  5 May 2026 18:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5HoPn+l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E764A2E33
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007345; cv=none; b=hAhiDz2TPYeyq3oQoxO/wmKjrY+Gbj55BXTOE/IFgiIUycQ6m4OtFhfUoP4BKxxZBvnRDvzgLg8+sHtx+3zyHN2Dm6JFRV9y+h1yxGNfvnvf9P8OJtgLUtfAxjTd85DetHGpBEBXKec2ql3kNgadUt1Kv9evdMBrZOjOWfNsU4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007345; c=relaxed/simple;
	bh=Qrih9tbIxMYK3cVffn8rChfomShm6TcW+n2OQ6LGqGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qnp1NFP7B4w77fYws9X4Od4F/Zd+Nq3li+0oS5X1+FQ11UI7XS6uHHPGWCJRAfSopcvxdgXH2oE3okVILLrLllu8QPR+fmctZ+yNfb/Yq6i255Y5GkrlGzyWGG8/YryOsYZoLy+NEoTjSIaSUxCdg8XpWFraywLK0IpNyEAmqmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5HoPn+l; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3937a1f9f7aso4397901fa.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778007342; x=1778612142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWLCp8e9dyR6o6t0FMX093JcFxR+HkBbCVvJsU9sLHM=;
        b=J5HoPn+l6jV5hGSLKn4NHP9KvSnHq7N0LYbPkufjlgcYzDMkKr0IfithL78JM9fbbg
         85ArIY0QlT6L0cjsX/6JBxZUaJ6FAwSxFBoj1S2D5G7dxbHpojgU7BiqL3CUhXP8aGpW
         BcLEkXU7X95iiI9Qymp5qZ3Z28ktdMzSSdGwoIFTOAPlTCkz5BhLS3yW+7oKF6yul/AX
         GcziERwiYn9d1/gBgIFIPrFoF48f87RgXuOO+63m29PbG7DVb+SdyoTf2Bw+BDRxdFMt
         QjBiTuia3vTIj2qPCUnwL4Uo6AYhRHcAhmHbel0tm9zfctTQ/ifBoeXfb2+HuUzBFCrK
         S0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778007342; x=1778612142;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWLCp8e9dyR6o6t0FMX093JcFxR+HkBbCVvJsU9sLHM=;
        b=AZtk6wjPgA3xcFs8RPKQLhNFFA/YxRV05oSfuCR/D4ZxIceQSay8F5XBgu8uh4sbKy
         O3y5ldFdBXDKMKNkkzzifJQTgcc9tYV2cu/eQh8+IqGmvQTjsfc58eTQLMy4VMI65ypa
         2YMaUPBsRN3xmk7G1fTIJI2th16Zhw6hZoYQLfiE5GDnX+N7aMFeCF91486AHHv3mgSL
         SrV9K5CBcs9foEzdzEIkOrMX3QX8OFQgYggco2sdnYNfBJdCyQTga/NXis38aQYtmaqY
         A2AwejzJP2lbR3WBJuajXA8ikNCTFIvbxUFTYP8vJDyZpOXwR4ITmfuaMjO4ZoII+Zh2
         DrNA==
X-Forwarded-Encrypted: i=1; AFNElJ9ezNL1NaXeXCs537TjuYn8NisrYQYDNU1VdpsGoGhHnP26SAkvt5CC6aogpzPBF+1YjR2NhzEEXXbaQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDkZbJRFBvGRijdm7c6UI9l2MtWOt8Bz1+uj0fKMiUVaZetYC
	mYYDOrHl5USkEV/FnySkhonyM+7Vz7yZ0f4uiaMZsdGuEyFs0UTBCBeA9BqtTCy7eyU=
X-Gm-Gg: AeBDiet2eUs2mV9xNlNK8mRH2IeQTBvwL5tHDJSQrN3gdYJA9jXLB9M9KU6m29Pt8oP
	YIgyAnKPd0AjehxE0WwBKAqaQMAclauBIgoeeSW8dm5IMltDFsNxGWh5L1aujPBUFRZLir5GQYT
	sgy4KVWf8PZK+3maDS+tk23xDq7dJP0mXuJv1p9QsGRi2DLz5LwBwIcOq9ZjcZzzF8vaGWWe4Q5
	MZf03Glm9SfRBgBx3fj078M+mKLBRR827chi5JvCiezNR5om+CamSE48THCyDbmYTOVmfesu+cI
	teylJeUj1A1qUG0wPngrNShipSby+mTstKiIHHdqWNh4aF2vxPi/ofky/FuSyRJiAtlrvqkq5jC
	7GHgkmSmn2rbAVqSFyCf5fkBupambVKv0PH+OkVTT+0K50I0phkQ7cv+n2rXz82H3VBfS4pubzQ
	JIB29rblQATuF5Ouz5FkzG+nZZBBtaYQDEjyJp+yRZVjBq7fhtO67rZ7b6VMPauTUjOxw37fr2A
	DAFeNg0IJxPF1MS
X-Received: by 2002:a05:6512:1056:b0:5a7:4912:1a3e with SMTP id 2adb3069b0e04-5a8631b8d40mr1976270e87.3.1778007342013;
        Tue, 05 May 2026 11:55:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a882e3589dsm654744e87.30.2026.05.05.11.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:55:41 -0700 (PDT)
Message-ID: <9da6d544-97f6-4915-8d53-e3fde7339695@linaro.org>
Date: Tue, 5 May 2026 21:55:41 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear
 camera module information as musch as possible
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Kepplinger-Novakovic <martink@posteo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-5-mitltlatltl@gmail.com>
 <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
 <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8708C4D2EFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60474-lists,linux-media=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

On 5/2/26 15:55, Pengyu Luo wrote:
> On Thu, Apr 30, 2026 at 7:00 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> On 4/25/26 13:53, Pengyu Luo wrote:
>>> The rear sensor is S5K3L6, describing it but dropping compatible
>>> string, since there is no upstream driver. A funcitonal downstream
>>> driver is in comment.
>>>
>>> The VCM is dw9714, describe it.
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>> Please take this patch as a RFC, I am not sure, how much I am allowed
>>> to add without a sensor driver.
>>> ---
>>>    .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++-
>>>    1 file changed, 123 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> index 39e559e91289..76b1ecb3819d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> @@ -22,12 +22,18 @@
>>>    #include "sc8280xp.dtsi"
>>>    #include "sc8280xp-pmics.dtsi"
>>>
>>> +/* remove due to gpio pins collision, skip 2nd instance won't break things */
>>> +/delete-node/ &cci1_i2c1;
>>> +/delete-node/ &cci1_i2c1_default;
>>> +/delete-node/ &cci1_i2c1_sleep;
>>
>> Instead of removal 'cci1_default' and 'cci1_sleep' nodes shall be rewritten
>> by excluding 'cci1_i2c1_default' and 'cci1_i2c1_sleep' from them.
>>
> 
> Should we register an unused node?
> 

I believe unused nodes are found everywhere marked by status = "disabled"
or if they do not produce a conflict for resources. I understand that a CCI
IP with two ports are special, but likely (not always though) it should be
acceptable to keep its device tree node as is.

-- 
Best wishes,
Vladimir

