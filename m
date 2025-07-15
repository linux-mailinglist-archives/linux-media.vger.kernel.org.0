Return-Path: <linux-media+bounces-37737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF5DB05264
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C0633A4F3E
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A449BA3F;
	Tue, 15 Jul 2025 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ijblgx19"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E45F4A21
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563173; cv=none; b=Hl6qqoS/KGN1fKuf7SqOjufLh2n9Td+SDdlDB6XXPVNAwFX61cf8qge3UKCR9yJcubCildhwbqgpGlzHtMg0ZCTYcUnO7ZCqLpj5NfWZ3jJu8Z+b9p8zWqK7De7sraYzundUD1WEFk0LGF0EzOQBhmtSU8tpk1E/qfA92X3SMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563173; c=relaxed/simple;
	bh=zyJfM4m7iuHQnvGctowIKLGbpXe3ilOcyRc3lTCCWws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vzycz/PQS9LLeTZrOPX/3ExTqX9ZfKELd7/s9SSK5GuAbKkGTdOm6Xh8L+oiJo7Wts6X3NXLuspa7w+3PqTP7PvxcJROHn9ODxoHaiDs90x07bPlYDNFeX9ERKs0yhowdSdtoDXCbhlZyyjgQJ1Za9ZDBhB9aDPPRG9ajxf07pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ijblgx19; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a52878d37aso606339f8f.2
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 00:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752563170; x=1753167970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ajGTcGAxR3mBk5Sj7qmdIl5DeQZYWu+Iyg/14Szz+Jg=;
        b=Ijblgx19A1NCo3mygiSs4KfnHosZwGAeYahVTWwNpKlRUWVD047oOnbsrt377dCzIO
         +BdFddaTA/43HjBT4PnE9ItTntrtn5EJJ42rdVdOsDRdQzV+H21bhZTGHQ0c+yh7QY7m
         1egLTNZNQSGBO2JlS6vk8a7CYVYIs3bk5CUE5zx2RaY9TkdG4PHWW1p0ymhuPVdnwhh0
         KuKZc6nByS75IfpC3vzydSTqX8un8+UHC4FqmZmDa0KeUyTaDLCRS+uxws4ttBCBFkn0
         qA5DYnDBmrEfTOuwXMbUGmQ38x5/WHbOiW+2U7TZkFRpUKCHL+MpXGMpn/gmD65jIfpa
         972A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563170; x=1753167970;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajGTcGAxR3mBk5Sj7qmdIl5DeQZYWu+Iyg/14Szz+Jg=;
        b=tTRZZgq8v7WtIpixSj/PntSmS65N2v/vCzGnDgudkktTi1T91xCZcLVD22rVW7lM07
         JByocGCkxa3fhyUEAYtVmSw0pVznsjneedS9EG/ghIM91+Uxjtuq5haTKjRPLXYpShuL
         h0B2pOUebHhJ55AV9u3Q4OaNnLIXi12aIbZ9T/MGIchupHkV2gfKFVen/ghEvJ6gOA4A
         EusZa/SDGaKyZky4dFUA2vjzLEGuE3AEhkA0FDQGdnafeEPD+973Ua8GLxr5G5ntntha
         jDmVJjF/w00EN6S7kPy8xugxDGhrij9SFFWnhuBS8qORFnZvcyR6VCHL8SVV+cWoI6+q
         ZJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3kQ3qjjsspstgGNbxJwfNTNe7+AkMXmSRu+GV0DQfTkYL068setKKIOsMbMKUfm06CUr0re3vJOVlMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhw7EDkRQQDmBNbnoGvJy65wua6yxsJvren58FKzbod/JpZ4b
	0cdI64rMrihDamUY2U+2AbhptzXA0p7VfsUQ7hJppn3sk1e/LvhdyA7tc6MuPs08bsE=
X-Gm-Gg: ASbGncsyouVFdO5kD68eeGTY1B/WkkWSErXViPZlRC0V1U3NmYHXhFVy0mRzQ7y/pYd
	RKitgSZZHvEE3C4nPOf1PWvklwulpe0zoHT73no16MBTNf0DhEFvlDy0DQzH2AP3KngNaS9qxaG
	ii0++7Dspva28Yvf8zw/owmxSYVetIzIHjHAKaFhuI+jymj0fZNqrmxeOqKExu6IU/mk4uPmMfY
	IB0dYBx5zeLdBBBhvW9KXx4etB+P0yFuO+2OwcTE7YOuIBK2LfH/zhPGwRVbrdfMyfT2+F/xrZT
	GJVdkPpCFxzaWHVxSfzpf9cM9z8PWCeStsRV0fwJYi+z+3+G+7m7B9jmRAPWdfQOwYGLoA1wX68
	xb3wTOam50C4TIhZRmil04SxPvusAhXZ2Kg+efOoEDQ==
X-Google-Smtp-Source: AGHT+IGM2wXJAUFxtvCXjrk3+MCSefDOx/ZdlSq18YErK1icLcSQ2roGieecsriz1//IYmmyHvk3og==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:eeeb:7e70 with SMTP id ffacd0b85a97d-3b60b331badmr176750f8f.4.1752563170328;
        Tue, 15 Jul 2025 00:06:10 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm14330311f8f.93.2025.07.15.00.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 00:06:09 -0700 (PDT)
Message-ID: <4f79424f-0005-4978-8c6d-6b726ee7e4ab@linaro.org>
Date: Tue, 15 Jul 2025 09:06:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
To: Vikash Garodia <quic_vgarodia@quicinc.com>, bryan.odonoghue@linaro.org,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
 <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
 <b83cc20b-44d2-4635-a540-7a9c0d36cdb5@linaro.org>
 <a4dfc82b-79df-3e3c-0964-a99db222c6e6@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a4dfc82b-79df-3e3c-0964-a99db222c6e6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2025 09:00, Vikash Garodia wrote:
> 
> On 7/15/2025 12:14 PM, Krzysztof Kozlowski wrote:
>> On 15/07/2025 07:51, Vikash Garodia wrote:
>>>
>>> On 7/14/2025 8:46 PM, Krzysztof Kozlowski wrote:
>>>> Bryan O'Donoghue reviews and applies patches for both Iris and Venus
>>>> Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
>>>> in pull requests like [1]), so he is de facto the maintainer responsible
>>>> for the code.  Reflect this actual state my changing his entry from
>>>> reviewer to maintainer and moving the entry to alphabetical position by
>>>> first name.
>>>
>>> NAK.
>>>
>>> The roles and responsibilities are well agreed by media maintainer(Hans), with
>>> Bryan part of that discussion, w.r.t code contributions to iris and sending
>>> patches to media tree. The only reason Bryan post the patches is that Hans wants
>>> single PR for patches across Qualcomm media drivers (Camss/Videoss)
>>
>> That's the maintainer role, so Bryan is the maintainer. I am documenting
>> actual status and your NAK is naking what? That Bryan cannot handle patches?
> I would say, you are reading too much into it, i updated what we have discussed
> and agreed upon the different roles for managing venus and iris drivers.

Reading too much? Bryan HANDLES THE PATCHES.

That's it.

There is nothing "too much here".

Person handling the patches IS the maintainer. Full stop.

>>
>> Sorry, this is already happening.
>>
>> Your push back here is odd, impolite and really disappointing. You
>> actually should be happy that person outside wants to care about this
>> driver...
>>
>>> Hi Hans,
>>>
>>> Incase you would like to split sending PRs, as the contributions for Venus/Iris
>>> would be significantly higher, let us know, we can pick that up separately.
>>
>> Considering quality of the code you sent as Iris upstreaming, you are
>> not there yet.
> If you see the scope to improve the quality, you are always welcome to add
> patches to improve it.

I spoke about your work. You cannot use argument that you want to handle
patches regardless of quality of your code.

> 
> Regards,
> Vikash
>>
>> https://lore.kernel.org/all/1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com/

The one here.


Best regards,
Krzysztof

