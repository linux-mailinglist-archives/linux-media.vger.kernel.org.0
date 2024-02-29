Return-Path: <linux-media+bounces-6193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0660086D1D2
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 19:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24FEE1C22B02
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 18:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EC37A122;
	Thu, 29 Feb 2024 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNHkEEma"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7196875801
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230494; cv=none; b=avJxRgU0tS/nlMZEu2yPw7o9WefwDOtdp24vl7pT8SAoiHf0r4vo+ySqKy8gs8LDv41WiIg4/ekfQVHHLM096Q26DpU6fBNyfzTJMxS3vl2jRfNQLIM+mL6TPUQlvpHVXYtcO4EutwMK6W72fYF2pe/Rg0Bj/Waihlr/4p0kCns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230494; c=relaxed/simple;
	bh=COTOFaOjul7Lr9bwyojRlz6o6Yfbi4a+jug/YW55M/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpX5E7d1Ah5usphraJmD2LNHiN5Ldc7AHkpe4RNNOmfzeaJ1xy0UpXbBsEgMICw6MyGrdjKWRlNoaQ+FyBuE3iPLCvG9AzMS++32gA71bb3wrO1yuMT10l2wDQHcGGqeu/gaM2bGG1LnDn+lrnGIprAkllbFyPX8xu60X104WaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNHkEEma; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso2028899a12.2
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 10:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709230491; x=1709835291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZydIBh7HEsSehFdquy9wQ4h+MkSunQkONn2zKbrxR4=;
        b=vNHkEEmafTw94c/9eYrB0P1Y8ECm9kcyfVs+31jlQEkUrHPwqrSKYMllk7sZ83hGv4
         LGVH+2JKkUlCJ5HrAzPSBoIKwYYoNQAzNuVLuetjkq3K8qKCTNz1jLZPnM8yw1UkwEXp
         1GejanB+Rc3H6mz/xi8I7MBNDTIYiWOd96XQBT/atArpgVKBJtFp2NnINkdixdTkkq/6
         CBhmQqNa2w7GWzfnIkqHaLhE95oK+0ojJbJkk1E9vdQknbFBYLHUxYCqDksmV6lu2Y1B
         gNZFt+UJR3E/eak+8Skt9giuKauaDjWtLxZ7fcVX1MZvKUFbEFon1LKEZoaH0Qs2XOaz
         GkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709230491; x=1709835291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZydIBh7HEsSehFdquy9wQ4h+MkSunQkONn2zKbrxR4=;
        b=iR+fQVB80mOaTQIpWemkKJ4H8zaUmf4I8+jehw564gdLw1WDZ1vxPFvb4zY1S95rmC
         p8W8DVFIHvpTGOmLxxdQgUm3IVJ04SucnId5yHDFvQJ7k8n+39F080/LP0bC2+SfkYDf
         zyCCFZcdSdUZtDCdqEVpy8tmc2CkShdRx8ImpSB4XcrRytEKZh9WezA6jZs/4m7NEDlT
         lOMR8ON3KbTMMg+UMZkpg9F3/yh6vwlfHAT5SOlX1vt6pcshsuvJY53RxED47rkVAndK
         /ac+4IdSpMb8p8rus/qlQIttAY8TRkXFjq7e4UuR/LgLyOgCRAZcg81d2hzIIGxqhxWK
         xOEw==
X-Forwarded-Encrypted: i=1; AJvYcCXdzg2wSeJa7igNn+7AYJnGv8Ur5uAZF+D+QSMSyqLle7hKKfb/P9FcBHBa4nfSLJjrEsl+12PwGDwHYP4wv2VgBG9qkpKnhdsIAgk=
X-Gm-Message-State: AOJu0YywQJtTXQ+33/CZtCQGJZswWeHoV14kjl4K1hQiNF+dn9PhxnyR
	hqFJA9nfKKAZgPFTb0t+wX8FrpV0wOCljbLvYi8v7fJr3xwTb1L6vr+iHHWPE/g=
X-Google-Smtp-Source: AGHT+IE/I33oQwhjUFfOVZB8t9pPJpT72rKDa6jqtaAPUQ95451HXbdwx+xPhv4Xre84ge74HiGi0w==
X-Received: by 2002:a17:906:55d2:b0:a3e:ba73:8341 with SMTP id z18-20020a17090655d200b00a3eba738341mr2007201ejp.19.1709230490885;
        Thu, 29 Feb 2024 10:14:50 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id a9-20020a170906244900b00a43ab37c3besm906314ejb.195.2024.02.29.10.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 10:14:50 -0800 (PST)
Message-ID: <bf892e5b-be7a-4197-9e68-5199e3aada23@linaro.org>
Date: Thu, 29 Feb 2024 19:14:48 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240223141731.GB1313@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/02/2024 15:17, Laurent Pinchart wrote:
> On Fri, Feb 23, 2024 at 04:16:31PM +0200, Laurent Pinchart wrote:
>> Hi Alexander,
>>
>> Thank you for the patch.
>>
>> On Fri, Feb 23, 2024 at 03:04:44PM +0100, Alexander Stein wrote:
>>> In case the hardware only supports just one pipeline, allow using a
>>> single port node as well.
>>
>> This is frowned upon in DT bindings, as it makes them more complicated
>> for little gain. The recommendation is to always use a ports node if a
>> device can have multiple ports for at least one of its compatibles.
> 
> And reading the cover letter, I see this causes warnings. I think we
> need guidance from Rob on this.

Here was similar case:
https://lore.kernel.org/all/20240227142440.GA3863852-robh@kernel.org/
and @Rob recommendation was to just use ports.

It's true it causes warnings... or I should say - it was causing
warnings (one of my last warnings in Samsung DTS for W=1).

I wonder what's the base of this patchset?

https://lore.kernel.org/linux-samsung-soc/20231122-dtc-warnings-v2-1-bd4087325392@kernel.org/

Best regards,
Krzysztof


