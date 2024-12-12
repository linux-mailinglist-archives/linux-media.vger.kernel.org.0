Return-Path: <linux-media+bounces-23253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA7D9EE0B8
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 08:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 585D3281BB7
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 07:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB9920B805;
	Thu, 12 Dec 2024 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+uVxJFQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04582010F2
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733990243; cv=none; b=Xcnlw3RI+NMQxiP9AcBSsvZIHv7kz72DantkLbX3O6Y20AS0cnMuqDB4PHFJsx+JmQ14dqwq0wzMrjTXLmepAHUxj8sbcS2brB4+mI0TkLX13zwh2CQjo41nVFKANz4svTUY939CdmAifR5IpHa26nwHxizRs6b5e+de6chpadw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733990243; c=relaxed/simple;
	bh=gu43IItEc69wzb0eHVqTCGsohjjMs1ZP6cMcHAUHkC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaElNxsDnR8Kk8e+xPi8ZQF4UuH/hGZHb5HZrWfEQ2D1zq8RUaJ1UVEYMWPdZD2RitSmJtztuT9JAkaaKHOrrdQ0nZt52jbrQwg9WzC7nW5rel93gIPolCOq/Io3M6gpq141Y8VdB5CJS5ZAp14y3o1RtoW7xhu/JK5Ls/NTKTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k+uVxJFQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3c3e38d0so57667e87.3
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 23:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733990240; x=1734595040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWqMXO8FKfgEyH0IhREvGbWFvHCKay6Tk9EoQBbE3f4=;
        b=k+uVxJFQPzRynEVqBqVPTELlyJpwKDY/hahyfJd7h9splMnAczG1IekUlE71fQe61n
         c5fUHBpgoVsrxh8Z9HMdkcQIjK0RaNk9ukZW63hrxitdITLlr03P6GJbb2GnrgRBMwPk
         XKoS/8KITDhHwScTga5ftHCdsCq/w0MvuCFvdVt/Mc5nWExD7H9lsGbL6Ha3vUbuC0A2
         ChzDjtzQOZk0qZ7Gpnoe27DG8o+jIjJwcUWGrtlFqxDkJvQ8umBjjbjba/mcmVsPezDd
         DUwsUGul4cCpi4clYMkh/XZUV5faXvHOZhvVOMoRo6GhtjXu4YeszNrTymwu6rW6d4Cn
         5lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733990240; x=1734595040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWqMXO8FKfgEyH0IhREvGbWFvHCKay6Tk9EoQBbE3f4=;
        b=pxWkCx67idUvPmFGkKluGYQCGPyJbiQ1L457RnpxIHIFzdLzfd23ROaJ+gqPGMUQYq
         0viyTMZlfP6F1lfUaU8LCgi3U7bU0WupLwGdldemZuTY/ISdCb6WFOL1QfwcuihjDlky
         IY/ho3oRhCRDd6+vmZI7cFincRz2nxwI1bHs8iAOc1kvnIb/zIyd1hZEjuCYuKtKsh7K
         zXT2CEdtp4470DwRUM3BP1ZRuHjZ+TjJYWRFKD9AGK+SVIj5i28zQ2W/C1U4R46kbJys
         zSQ21U9m2XibZO2TyDgB70uxjoMmp1IHiWE4kuyM49LTH/vFN7gB333t211bgqC3zEwr
         wnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuebw/YiRM6npig/Ul7XV/z9ndt3T7wB8RinZUg6o0UaKbmNuIhYw+hXrELl8ADzjxWNuY1xOJWOuPcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMiqKoNFLqKWLftWDdBNuBEgQqjfaV7me2Ai0cXVW8JKejzQOp
	Ww9aTOo+aaSqWQFi6q0jX9Ye8YySUL4GJvao2tcvw/IJ+5tTDZe7LBEIZv1wl00=
X-Gm-Gg: ASbGnctJ13BKCGaEPTo6zA2hROPWre9eEO/Z5rD9W4JlKlHeQTmcPa2QUgSO9X6TxlW
	zDql7TZSb/dUK6oW3YvkR/8CAAnEvqUlfqEExG1hy+8HeXTdb87MyLgKZ0pw0Fh1peg+ETvapAG
	u1Omw+hckCtlwrhnjDWPhPoIMadNtBsMBfiyH1Ek51eIx9guYn7B2y33QehC+L9CsMafEn/DD82
	cy+QFkAoNOgU8UyjCnoc379eBTkeSQ1lqSmEhOm9b+7HnEn1ukXQMKSAU7CD9utjwIV4hW/3M2D
	AXgE60FYZo3eM1FHtb0epKran99THiOBg38=
X-Google-Smtp-Source: AGHT+IEnjc3IkzAwCkvxBgbpNXSCFVmUmB4AdseEra75anwcsLYJFFQWNYiHrup3ASijJku99aU/ew==
X-Received: by 2002:a05:651c:b28:b0:302:27c6:fc7b with SMTP id 38308e7fff4ca-30249e053bcmr2855071fa.6.1733990240038;
        Wed, 11 Dec 2024 23:57:20 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401d670734sm1319306e87.220.2024.12.11.23.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 23:57:18 -0800 (PST)
Message-ID: <add63655-626e-482c-a309-f124f3b18115@linaro.org>
Date: Thu, 12 Dec 2024 09:57:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: qcom: camss: vfe: Move common code into vfe
 core
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-9-quic_depengs@quicinc.com>
 <79fc669d-999f-42f3-948a-ee5f3a91ddfe@linaro.org>
 <ef9a65a6-339e-4428-8487-ead242b3b2d4@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ef9a65a6-339e-4428-8487-ead242b3b2d4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/24 03:35, Bryan O'Donoghue wrote:
> On 12/12/2024 01:06, Vladimir Zapolskiy wrote:
>>
>> This is a massive and a functional change
> 
> It shouldn't be a _functional_ change at all, just a refactoring and a
> reduction.

I've just tested that this change breaks not only TPG on SM8250/RB5, but
a regular image capturing from imx577 camera sensor is also broken.

Hope it helps.

> I'll take a look too, see if I can spot a regression on rb3-gen1 and
> replicate the breakage on rb5.
> 

Thank you, very much appreciated. Splitting the change would be still
welcome.

> @Depeng we can probably get you remote access to an RB5 if you need it.
> 

--
Best wishes,
Vladimir

