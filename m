Return-Path: <linux-media+bounces-44639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639FBE105E
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 01:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21CF84E9070
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 23:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970A33168F8;
	Wed, 15 Oct 2025 23:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sxstRAqA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3453219D093
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 23:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760570493; cv=none; b=J+kvmu00zyigfU/1ldPtl7+3SLs645LeDLe4Nd312m72uIa0MzqwIdWQImteJYZToV++4DOphHr5L8q3XQ37yMpsmrn3xuBQqkPPWKjZG0QMqAeNHl46uIBOMD0Sj5M4s/MFguYRhuttDTsdXMrIR7a242dnWplK1Rc3+WrmMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760570493; c=relaxed/simple;
	bh=YkyMyirxMHvG2HWlK1FfdBUp1DFrDKhIPiRlbbKh6XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syGi+Li3dL224V+NmOlY2+PpWHSdULmIfISBPR75t2Awmyzz1nOgZXjzvjQ2x2x7r6m/iUPSwqwpvXtc524k8IikmrFLU0dUCx3phAIzXhFpmUj4c76a3nV99mVyjdTnWlfCMl/ETqpk856Yw0/e9C2BkIZ7SF7CuaVaRkdSE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sxstRAqA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37233c55e78so8541fa.3
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760570489; x=1761175289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B0q4BGZ2XC9IpC6Pjd+pwzTY4I/KdNTGZZcgGIVD2s=;
        b=sxstRAqAblfFYJaynrAU+4p8dvJEYPpEpONe9AIS9BiWsyHEfFg6pwKhURS2EgkxMI
         wmEAXA739rRZtL7fn20jUBdobDp+8YM5Mdi911shWn8eWTg1xEvU6FGNItHA7mZkkmlD
         grlj11hBO31Hrw/NH37rDFW6VqG6rC/ddpLfsu017JCHnipsA+hxLIAlKBVnV6vCR2xN
         D3INQTaWO2PLPKMJQc4hVlivp0Nf54FQlIT0JsZhG0g9NpOfEOq6dUYPlyTUVA2fh4Yn
         incFA7PJeDgrttH2mKZld0dkKsJJCAz/lxPHV+8CLmEtL6W0MNwlVGdIBF9YmFGt8gnG
         2E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760570489; x=1761175289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0B0q4BGZ2XC9IpC6Pjd+pwzTY4I/KdNTGZZcgGIVD2s=;
        b=xCMRfb/1M5qFdIVC3IJF8kwQdAFvdjdLlY1ysnALkX52jfKNx3gppBh/ROfplArFT1
         KZ58ef5rOeDG3GtKwsm0KSjGPIGzBELSSBrd5m1DYfRg+SuFzCoIzHSU++KQfnHuJ2q/
         oZ4nweYFWVUE2pgjgVq9KTgkBuBw/cltaHj6mRsgvHrUGvfx5DBDX7OC71qx4oBvUh/b
         jLRyntbvPQKrlDceYplRy6+5cVHRRfa2bviuJX1y9aHZO4BSZZqaj1UlESFRXJN//wlT
         frpyiPgKI8mOMsUYkmn8G63K3TIMIP0y4S/AsGaC1eviZWOqY9TwpnzL+W8XXzJufc4N
         85zw==
X-Forwarded-Encrypted: i=1; AJvYcCUaBJyQYx6EQUbtVX4VQ7oFTaxY7czWk2x4F6pgQ+oBEJecGEFuzz0LaUNYzcPYjoVkZCAbvO+f5bRu2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIAYFQatpS096NUOpC6Naxa/UrWZ50jM9I5XN8Ogms098ZJOj4
	4co5/tbifFBKSj9awYeNbpjMG1J/zlHEj1zpGleJf5wHw3UoMSKdOxIrN8cYAImabpw=
X-Gm-Gg: ASbGnctBnr3UjwpTj3qJVYdddONWU5yLD9rrJPnxOUTiIm0JtL8cMh3Z107TL6BN+sj
	Lcr10YNHKzuA3ZHTg634LyLbGVOtiyTwQ8tzDbDH7bxfYsmrn//eOxtERR527bFXFwlo4Zy/60Y
	AxBZpNUVIjHXhD9iGoOG+d8SEkl4ez+fFAqfAQLBFeMVfUo46q1CivQAqgzFZzkIauYdC4/mPMC
	yrdCO99m0ioSziFg3Nad9Ck9Lv9PLvpmZgLCfKIXUNdHp4HZijyhCaB+GlVEqwSxkkmKEpkaxTg
	1PM82SvbCGvVJW8mVGvfqQ8pLDBQKtPJDDtmI8oMzivx3iWAOYgyAtKFgpKtmBx4RKEKCfJB7er
	2FTtpdqIUyesuTgDSNqoB3HDx6XZ/2HA8dIHOaD+F4t40sO/d/4HKG+//K0oH5sQ1/Pl2fztnKb
	TwqQ3O/WiFc8HMDOpsBKVwNcOzeAwYkU/WvCtC/oiCCdGOA4lamt5MUzjoyjU=
X-Google-Smtp-Source: AGHT+IFsezevTFX7VRsMPmvaC7e3rUHL6zRBQobMDgZpbCMrsMUto/Rrsx7K6ihOpaTOS8S2VJhQLA==
X-Received: by 2002:a2e:a543:0:b0:372:79e8:ea7f with SMTP id 38308e7fff4ca-37779707285mr8426581fa.7.1760570489271;
        Wed, 15 Oct 2025 16:21:29 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ca04sm51213281fa.4.2025.10.15.16.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 16:21:28 -0700 (PDT)
Message-ID: <47b4dc34-ae75-437f-84ce-84558226cdeb@linaro.org>
Date: Thu, 16 Oct 2025 02:21:26 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
 <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/25 22:58, Bryan O'Donoghue wrote:
> On 15/10/2025 19:49, Vladimir Zapolskiy wrote:
>>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>> +            power-domain-names = "top";
>>
>> 'power-domain-names' property is redundant, since there is just one
>> power domain.
> 
> Its a required property of the yaml.
> 

Technically it is not a property of the yaml, but I think I understand
what you mean here.

As usual since there is no users of the previously written device tree
node rules, I believe the documentation is still flexible to be updated
to a better shape.

-- 
Best wishes,
Vladimir

