Return-Path: <linux-media+bounces-6195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A586D1E3
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 19:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814DC1C22E5D
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 18:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF53757E6;
	Thu, 29 Feb 2024 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nq/NZF2I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD75163511
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 18:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230699; cv=none; b=uIAjgm6LfZQ/s7TzTVQO0KDX6MO06TYrCBIa3hDW8EFNew4IcKrdju5jmNxXWRoc43bqaqj8FNA22yDEUtJUAWNMfyv+x8wdLr6H40ur2vHTWkWcUHYAJjJZsE32sjbM2flntdJl/eABUYPfmRlzLywwtG+2dCZvku+cvNv69i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230699; c=relaxed/simple;
	bh=7IKIom3eNl8+Mrtp3UZQGJQ86BV0ePVRpfCp0fglhhw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k//aXHJqxEziESMSApy/hv9wzNGL+pMhfnqBz5DVndbmER2QNRvg70Zgi+aBDPyV4gEiuXnZ1Age8+rCVYO5Bv5ZONaFjqTk0cuPvapR3WK+6mTf3kEy6i/fLlAv8aOx4xe059ANt0fMHR5nPE0WW5QpPZVadbwvIS4pmtdVs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nq/NZF2I; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so1704672a12.0
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 10:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709230696; x=1709835496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WRyaqiqMC4KS7tJ6X/sLfx6ZMSNbMGGwAsa5r/EztqA=;
        b=Nq/NZF2IMMWQZ5UaCTmu9k/y3UVAldwhscxWNH/tB2HRy4x8o3C5PVTmjDKlJKOME2
         w60deROAwWa7aI2hbMeawIAZ4WDOdZ862tTU8F+cmkZatOqF3aXnZ53pG+z3ByN3pZSG
         5UYSSgitx01O/JQaUUa1DBfVtgmwzJumKO604a/SaJR0HF31rzV/pVxdUyVFne3WjAUl
         Jf4rnAd/QjPDloKPuaTEQQBrF9vGPhLekdHO+TfaGO/f4kzi1T5eQ+TOIL7wTwKRVu25
         dPa4Ys4jWTDXLa4bbHwU6ZTg6y3wzBvxhtByFT1NLoSC5V54BylyzSvyFX6u11ShliIH
         8jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709230696; x=1709835496;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRyaqiqMC4KS7tJ6X/sLfx6ZMSNbMGGwAsa5r/EztqA=;
        b=VPif+JnWewTfJMazp6M+y+eqozfWlcnj+KlO4/j11dZN7Bd6xRjqsWeRJt8o99Bx+q
         E/RQJx/Be2QPXg/qPqqC2sbaVD1dfCxO4HRC88+0aLkK+gauhmtDWsakyL/nFhSAdKps
         XEuEatGabh58p5p6nGllHE5UjAsBAwBZjh3SRQiS/QAsZOkLizEmLiTJv2gq9wK4oZ8c
         6+HyjlwEQbSrQ8qdcPaQCGgIYaebMmJlrlCdONdmoB4PrAYI3lKWQwJ7zxfJ2Fv9O6cc
         zh4iY3xMpTb28HN/coDXQwjE0wq/PC5k8MLBd8N/JwGZ5uHdtG+wsNuV95NNZyMpcLtg
         IqyA==
X-Forwarded-Encrypted: i=1; AJvYcCV32O8v4ylJdU87xg2Qf1uJzgT0ZE0mPO0Cx2rkGeOwh0jaULmExC/l4RApyS+FR4UMonz6I5g7vqliGneT2AuSSdAzAwox3W2qRn4=
X-Gm-Message-State: AOJu0YwXpoh2YXSnUm6VjmVZ8Z3gVmEJDr1lwbpgn9s09ayz6LTRPmWY
	Govxx/SCs6a9RH7w3u8KlXU9I7jT2Efp+lOIDHh+KmSpg6MzlDhThvRlfppWIP4=
X-Google-Smtp-Source: AGHT+IH6JpeYBX20HrbbrvTPfRBCWGlvPxVY5/VhNgW/LbVbf/uNLkYrdRkDr6Hf6RjxPprkaPqjIQ==
X-Received: by 2002:aa7:c2c5:0:b0:566:6640:10e1 with SMTP id m5-20020aa7c2c5000000b00566664010e1mr2056492edp.38.1709230696305;
        Thu, 29 Feb 2024 10:18:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id f12-20020a056402194c00b0056661ec3f24sm832564edz.81.2024.02.29.10.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 10:18:15 -0800 (PST)
Message-ID: <3f82eadb-a475-4ea0-8de3-0bfe0a46a27b@linaro.org>
Date: Thu, 29 Feb 2024 19:18:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: dt-bindings: nxp,imx8-isi: Allow single port
 for single pipeline models
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
 <20240223140445.1885083-3-alexander.stein@ew.tq-group.com>
 <20240223141630.GA1313@pendragon.ideasonboard.com>
 <20240223141731.GB1313@pendragon.ideasonboard.com>
 <bf892e5b-be7a-4197-9e68-5199e3aada23@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <bf892e5b-be7a-4197-9e68-5199e3aada23@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/02/2024 19:14, Krzysztof Kozlowski wrote:
> On 23/02/2024 15:17, Laurent Pinchart wrote:
>> On Fri, Feb 23, 2024 at 04:16:31PM +0200, Laurent Pinchart wrote:
>>> Hi Alexander,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, Feb 23, 2024 at 03:04:44PM +0100, Alexander Stein wrote:
>>>> In case the hardware only supports just one pipeline, allow using a
>>>> single port node as well.
>>>
>>> This is frowned upon in DT bindings, as it makes them more complicated
>>> for little gain. The recommendation is to always use a ports node if a
>>> device can have multiple ports for at least one of its compatibles.
>>
>> And reading the cover letter, I see this causes warnings. I think we
>> need guidance from Rob on this.
> 
> Here was similar case:
> https://lore.kernel.org/all/20240227142440.GA3863852-robh@kernel.org/
> and @Rob recommendation was to just use ports.
> 
> It's true it causes warnings... or I should say - it was causing
> warnings (one of my last warnings in Samsung DTS for W=1).
> 
> I wonder what's the base of this patchset?
> 
> https://lore.kernel.org/linux-samsung-soc/20231122-dtc-warnings-v2-1-bd4087325392@kernel.org/

Uh, wait, this was not merged, so the warning still appears. Anyway the
preference is simpler schema, so just "ports".

Best regards,
Krzysztof


