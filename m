Return-Path: <linux-media+bounces-17603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C196C145
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 16:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DF4DB27E64
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9123D1DC19C;
	Wed,  4 Sep 2024 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uSP/aT0s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319471DB942
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461518; cv=none; b=V+twO5/A4Kej5JZ4A2+pdaFwvS5GlriQ87PxGxam7FLjkPSHWCiURESScUXp+WbaSpHZmTYQ+BGdOQZRmiKqVSEfVgtaYiaKfwewXg1Z5ykNoZW6wJgD7x45+yiguM0ui9j7ln7TBO8qY9vz0m3FA+qLSaInambOw2bnJhqN3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461518; c=relaxed/simple;
	bh=ZV4bjcd1yVb9I8n+Wb7M4c70xmHeXcQXOcpIq85B9dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6AN2Pn4aacIhUB2cbDfIO89mNddu4Ju31Hfk5312gX9hqTaHLJ41LzAXeFn6z3Kyb6u1FOJr+e5SMsV6l4iREdtiDHZXetz07TeAnnHBvFtaBktMW7iTxnpTFTW6ud8WRfY5ACgW12hQD7q9h/k6zSBO1y6sPddoc0TZ14ePZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uSP/aT0s; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5343e75c642so8657335e87.2
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2024 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725461514; x=1726066314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3Zj/0oIQoWTqTF5i+8OqjuVpe0UWAOmwxaLu2EWaqw=;
        b=uSP/aT0sYeDvBwtWbxltmyP26ddavrcPN7w2LyE5J4d5GGpmm3dTzy/ZcBEFg5CZWF
         nRkplDb1bOGm66bDadQcKmEcz07QTJAzlZE0O0PbTS4DthZewnNIg5RLkLp9zyQGSmNH
         clVU9MrikQaR5pcziUontm+JYqSF0czIKFqVtBnozy199Y8sbv7KOu+sVKtPZQ5mz9nS
         QG03ChAmSvSxobNFuq6QfVZU83tqugDni/pvlWD61Id2Bvv/qSXE2ZyRdMI9lgzRCErM
         25MzQTxqzUDmGgf4lSyBiAGd9gsyPHQMKg+/6qKnY7D7sKpyCaxcdB2V4y3fSQ/ua9Fq
         0J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461514; x=1726066314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3Zj/0oIQoWTqTF5i+8OqjuVpe0UWAOmwxaLu2EWaqw=;
        b=rt4ahIl9OlCSHVo+xLQLu3ZUto9W13dwLo81LsDMFfAwDgEDZR6DUNdPNeSLMBvAEK
         9x3i6nKQzwrDorvy7S30Wo/mCWkJ6NHN0JO2FpXAS7uKzJ+jEkrjY7RLaBcJ1LC+Iffj
         TQAKTfBgM3Ai8Obrc2uITE/aeTDdXmk7q0/isqpgasFMCfAZRkKfNFhZdm262dt6EqP0
         JxijlPMjn9kf8LWOocOACBJYRUfgSKyEE2ajVL8BBF/XNpkrYEeOA40caE2V3Du6xWWD
         lxepsIk4LK6zZ70cB+XQAio4NLekEtKsE2NmHe7GLiDOqe0DF8/i4No8N8V8GVKQgoxr
         AvTg==
X-Forwarded-Encrypted: i=1; AJvYcCWxXsikP+69ThyYUH4reddwedNrXK4vCb8u7PkgZ7/+qaGFJFjPooGsl/XbBh0YkzQS5x7HHU2nuZKwVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkAApb08SL541LU14MaG8FXNGR/R9dqVetYam1verGMvsUf2gH
	PYdRH6+DBEvikpEQx6ZgIdKLfvIPzpJkmEd2sw6dYKClIDdq0XV4R0PA+XA//t8=
X-Google-Smtp-Source: AGHT+IFkqigaaN4wMGLBNJtAdSFzX1aKYyL8ehUt6BR57k4XcYMiCACdw9hdTrqWngLObGFcFo5oGA==
X-Received: by 2002:a05:6512:3190:b0:533:4820:275a with SMTP id 2adb3069b0e04-53546bbfec9mr12860116e87.52.1725461513856;
        Wed, 04 Sep 2024 07:51:53 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623e67desm1021766b.209.2024.09.04.07.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:51:53 -0700 (PDT)
Message-ID: <6f9b7047-7471-4fdf-89ae-d78c1c92690a@linaro.org>
Date: Wed, 4 Sep 2024 15:51:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Depeng Shao <quic_depengs@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-5-quic_depengs@quicinc.com>
 <3cdd7101-ae8c-45c9-9695-f7f4202d1edb@linaro.org>
 <7fb34b98-7bc0-43fb-a6e7-dee073fed317@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7fb34b98-7bc0-43fb-a6e7-dee073fed317@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/09/2024 15:20, Depeng Shao wrote:
> Hi Bryan,
> 
> On 8/19/2024 8:17 AM, Vladimir Zapolskiy wrote:
>> On 8/12/24 17:41, Depeng Shao wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
>> I've already expressed concerns about a necessity of this function, 
>> since it
>> adds runtime burden of work, which can be successfully done at compile 
>> time,
>> but okay...
>>
>> Since it is needed for 3PH case only, it may make sense to remove it 
>> from 2PH
>> and call it here conditionally like
>>
>>      if (csiphy->res->hw_ops->init)
>>          ret = csiphy->res->hw_ops->init(csiphy);
>>
>> But it's up to you, I hope the callback will be removed in short future.
>>
> 
> Could you please comment on if it is fine to remove the init from 2PH 
> driver?
> 
> 
> Thanks,
> Depeng

Yes, its dead code ATM we can enumerate this callback when/if its needed.

Agreed.

---
bod

