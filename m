Return-Path: <linux-media+bounces-60472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDThBWA++mmjLAMAu9opvQ
	(envelope-from <linux-media+bounces-60472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 21:00:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0FD4D2FB1
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 21:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D20C530AE06C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 18:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596794A3419;
	Tue,  5 May 2026 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4NCLeUN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694413CF025
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007058; cv=none; b=NP9N7ALwJJmcC33j58J6ZQfXvoedzfwcgoPqZR4ycwpLgJZO3oHrO2my7vnhu9+rQubm5iTLEr3EstuAHjbEfy0jAoA+spdy6vkFVt1DV2ryiCVLNRJzPKXPFN//VGwEUv35U7dmxo0uLVyuSDH/XaQIJqPrIVa1NcO7Wm+iT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007058; c=relaxed/simple;
	bh=v8iGX/lK8aQ2P7nXaRjT3kEbed4ilCzF/7HTS4aXDT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDcbQasCqGtBynlj/iLjv8Ss+pFDMilQTp41UeurxenwfHQDOTgI6ty8pNRuaN0r4dRi34/rs8z+q7l+PxIBZT/8ngnhCeW3GYlK3LNfrRE6r2Ezl9bOXBBvbFpIP2RkbFbzP7BE5JFe1t39iZKT8BcjPfNj+/SZMQeRpr7xXKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4NCLeUN; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e9653b53cso4622461fa.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778007056; x=1778611856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWfIK+4R3Bk95cHMFqzFQqOhwZinnDbYjtH4XgP9PxA=;
        b=i4NCLeUNUHr0E0M+OteFwvdviHFXUnCieUEXLc7fp4Y3I/hZK0Rml77Oi4TIW3j+l9
         lTp9/O8Nox4tvn/RV5mCbkrasbXsiAEKEvFW1jjAForIpFfPxv/SbdwxnmPsCQIt6dcp
         0UWH4REYIL53UT014m85NV/BO4spok40cjv335Ycd/64yAqbYLy6t2vTEhycLuShNGht
         rlNqZhXBR755+3ww2ftkC2+ej/RmNfwECpTYFIq1MUTrOBrTB5ussG9orij9Dak+e9oM
         0gDnFiEFeaeoCa8cmnRvm6GUDoCGgilWbnnRTg1K/+e6H6tkea0q0bZHaONcJlQFcdmv
         KG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778007056; x=1778611856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWfIK+4R3Bk95cHMFqzFQqOhwZinnDbYjtH4XgP9PxA=;
        b=G9xUVuR+4NcYfxRj+w4sggDmzAxEC6WEfxVWPjd+W2WfBerD0k15EGYn4bRGIwFEVn
         f1Ai1E+6KePhKVwdftVN0iT9o/2pczoSVr8TwBG+XigKwLridmli+6tjx2jIctDy80VL
         l3nLycfd1+J7XC+0uMrIN1uvxRvb17Gfbra8CO2VQUxnWXmR0Fetl/12cgVr7mLniQyg
         1GS1hl4uD35roGhdZe8+QceyggVxKFGFRXhkDJN+8YFc4oE80NbgvXrkg9V4aZV8YgQE
         Jx+NXYsLZMCOghPAZw3bMvBVyQqYP18wOeOn/kY1IaYDnIAJw2QsNij3g0SxHS2nIAet
         cF8A==
X-Forwarded-Encrypted: i=1; AFNElJ+MJSGyxzw6VC5726cKedoJM9IiHQnyR3is1OLKaaEFf2kzBRUIXP71AfgbbhsN0efzUTsqHd5+go66WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVb7IHTPNzgYi7i5o8NHdiPL0MuA6jB2FsxOIv2gc3DcbE90AI
	LFAXmkdACzEiAxZY3s073Z3TBoPqzYDivx4WmJMMzSLAad1eVT27EQB5RsnjdUdrubI=
X-Gm-Gg: AeBDiesvZyTyab44Ryqfvuj389krHnOrglBXlL0FoL4Ze79aqud7c50g7JrCEuVNbks
	HwSqCGmHSAEEWpqRq0cIkSFrIGW/6LjL2JINz7jqXEWmsisWzGvcuHfz01stmN3ClaNk7L7cvtE
	5QfXhuH2FnUc0qt7hTQm6G+5vCCydOxR51AKq9kuSWx/gG1KEf3yDa3o4WwZS/E47+cSc+GiZKD
	CCWd5LTeODUMbJaSLnwJsL1ZYY5peNCjXHJCR0CsAKinLUZ3CbR25QFw1M2uOEeqmjt1PjG1BSS
	NB9neOkakQqT6CVPKkaE/ITPxcsKHsrCvGXT8xJF+JGIySe8hIMK9YFohvBU120BJqykE9kgyEd
	+eQeqBFYXjegSjMtnxyTr6H9d6eWRYiO4IaUwmMWi81A8M7xTXYcyz7aaLhdxfK4Ogu1bR2SKdu
	TmRxwYQQ8KjfchdA8jGYjy5e8ZlA3iPOH7fU2pe38k6OOf8nLduPkOX/5RDPDwXCIIAZGkTDa2J
	IBPq6R353AWta7m
X-Received: by 2002:a05:651c:4103:b0:393:c17d:9cfa with SMTP id 38308e7fff4ca-393c435d22cmr388041fa.5.1778007055403;
        Tue, 05 May 2026 11:50:55 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936135e578sm45101711fa.38.2026.05.05.11.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:50:55 -0700 (PDT)
Message-ID: <eaff3bd9-0b75-409c-bc5a-5013f9ce1495@linaro.org>
Date: Tue, 5 May 2026 21:50:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
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
 <20260425105300.745044-4-mitltlatltl@gmail.com>
 <c26246c1-0f90-499f-ba32-34159baa5dfb@linaro.org>
 <CAH2e8h4Y-x_4BAcgjytNj_NxZKnF1=y9GuaUnWdjzJ-MQLyCng@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAH2e8h4Y-x_4BAcgjytNj_NxZKnF1=y9GuaUnWdjzJ-MQLyCng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D0FD4D2FB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60472-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_SPAM(0.00)[0.156];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[]

On 5/2/26 15:48, Pengyu Luo wrote:
> On Thu, Apr 30, 2026 at 6:49 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> On 4/25/26 13:52, Pengyu Luo wrote:
>>> Hi846 is found on my Gaokun3, descripting it.
>>
>> To the best of my knowledege there is no 'descripting' word.
>>
>> Say it simpler like
>>
>>          Describe Hi846 camera sensor found on Gaokun3.
>>
> 
> Ack
> 

...

>>> +&camss {
>>> +     vdda-phy-supply = <&vreg_l6b>;
>>> +     vdda-pll-supply = <&vreg_l3b>;
>>> +
>>> +     status = "okay";
>>> +
>>> +     ports {
>>> +             port@3 {
>>> +                     csiphy3_ep: endpoint@0 {
>>> +                             reg = <0>;
>>> +
>>> +                             clock-lanes = <7>;
>>
>> Please remove 'clock-lanes' property from above.
>>
> 
> Is it unused? I saw it on some devices and v4l2 related source file.
> 

It is unused, and its selected value here is bogus.

-- 
Best wishes,
Vladimir

