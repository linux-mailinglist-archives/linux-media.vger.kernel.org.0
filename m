Return-Path: <linux-media+bounces-27734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5749A54FFA
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09F6C16F1D9
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DAC19ABBB;
	Thu,  6 Mar 2025 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h5Ji2W+h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0D31A89
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276902; cv=none; b=QWpxlgq2JIs50m0W42jOdMBz7xo/y4v1xAg9NgiifYCNV4V7aLNdFleEGcJFlVjFoOF0WEw0FBAghLEl2TrRaDG3MlWfFkctjRiYo6rkEhRsJUYmfrLz0D5lqTfnG0+t+ieqDdHoITK58nOHQ7RTfyD4IqwRMGEMhxzrQtw15CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276902; c=relaxed/simple;
	bh=E8ASYo3UrMPC3hDewAZmOcmnA1im+L9mOOJf1TCKZ2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZMhWwN235dt24+DD1qVo26WIFk8j7rwW4PZgrx+xw9LdwkVPc4QHkpNtLavjVIrEJU+bPhS0rT5i0EziGLCK7ytbx0k9TFSpxZHi0YblcbTxyifi93IJZJYiaXcGkxQ3i6GLCYinn7n6RZsbQMMcGck/VV+jPAbcnadrtm2Fb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h5Ji2W+h; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3cfe17f75dfso6578355ab.2
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 08:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741276900; x=1741881700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVnnzRabgTQCEUIYr+F/94B5+FAwfZoxZsQ8xoGHCek=;
        b=h5Ji2W+hiTaUSbj4Gs2KjMb/Q9pE+8MAb4zF6ypplJuHTux906qAx2tEwIvD0KFvDi
         qoiFGqEUGO1/+k8QyuaTaCTulniW00KJq5cN+lAQFG2Jjgj+8y/eBTvC0bHPnMkDrIVN
         rxtQQSQLIvdSRuyBYB0X0SvP/pLjQ5erv2t20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276900; x=1741881700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVnnzRabgTQCEUIYr+F/94B5+FAwfZoxZsQ8xoGHCek=;
        b=LNF8hxYceBnMCqVp5DEiq7GCXq78sW4SweokrHIAXP9dzzBmUHEhpZjsd1/VBi6O/O
         nSBD29MWsiB5iSCdumOFZ8K0xYZIOW1kxrWox9NhBsJcY8Jy043rTr+vsSEb9hgSxQD5
         y63dh4btQNX4nYC8vyoxrZ/JCLlv7jtNl9FhmI4T0CZGI5rrcaKZM3dWWWSm1Jy2Orl1
         TugQNqPVJiLDBHMGWMFdJDdsnKtAwO2poCqGwZG/Tb9kW6LkuHLBJTTatq5+Xmpsyon7
         p25Qn27yoFY49Gk1SWDmY49M7gA17sYJWfhF/DeDZOSuY5aTpMhNZktcEZxbU6RMEQiG
         +/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUud/b6YZu4HoKZxOU+fU+ej/wrGqh8z+5vCs+FxGvUChaVof27HnQq8ilwGY3mtD2J58KU6AVrcn+UYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCIVFeeE2zqzAZDbhbIOGNeKGCO9pL2iGimVGvIWKBucBW5rP
	HlbA8bqRQrSxsSYKpX4uqbMH6OXYhhoAtCDsdF9pyWiXRIOJdzZLbHxGJipT1mc=
X-Gm-Gg: ASbGnctuuuqCJAz2fFJDNPoPaQaewZeGWjmHiPaIzQHZCQEInFm2wXMRkK3rNSYFt80
	Lqt2Y1F0gYXLuyX+rRKM6hPNOJ/WnChV8spYeQIDqRYhByCq7Ey5FANrP66cZxLzZf7HfXJRe5u
	c+Hw5HGnD5o+PtrWBe2EpQFCs5PChf3lDa+U1bZ2xtRhfsoXuuqQ55G8QnHMpOeaVWRlol6NTaI
	MEdJV0itiipMHNdsxhR54SjpccOZaL/XE94CyQ87NPS5UwvLFOTzXq+YyOZjfdExuytrp113tX8
	6fV3wQcUd1Uk11n96V9jXAXhy+P+vTb54G2DJZGSvjkHJtdoegYvXPk=
X-Google-Smtp-Source: AGHT+IFqVDoMxQ+ybV14JJzOP/UeroC4pF5340mvSNaJjPqDwHb3xmlejwbzaVxMkbTTC6Lh4W+Qrg==
X-Received: by 2002:a92:3603:0:b0:3d4:3aba:954a with SMTP id e9e14a558f8ab-3d43aba962emr23771405ab.15.1741276899710;
        Thu, 06 Mar 2025 08:01:39 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d43b510102sm3335975ab.37.2025.03.06.08.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 08:01:39 -0800 (PST)
Message-ID: <287521e2-afaf-4ed9-bcd6-bac610aab564@linuxfoundation.org>
Date: Thu, 6 Mar 2025 09:01:38 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: vim2m: print device name after registering device
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Matthew Majewski <mattwmajewski@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250219190501.295976-1-mattwmajewski@gmail.com>
 <ym5q2cpn2lxk7sarylnf4o3ztvtnb47wroxdiibdsp6yz4gt2y@jfyfo2ekmdmj>
 <5051c252-f1ef-4731-b0cb-fedfcda04d98@linuxfoundation.org>
 <61bd42742ff8a8e5f409b0f2ccc4ab8875dfe7a4.camel@gmail.com>
 <fdd0356f-d91e-400e-9598-d34e0862c9cb@linuxfoundation.org>
 <06766086-b148-436c-b6d4-975c26493233@xs4all.nl>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <06766086-b148-436c-b6d4-975c26493233@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/25 01:37, Hans Verkuil wrote:
> Hi Shuah,
> 
> On 20/02/2025 17:27, Shuah Khan wrote:
>> On 2/20/25 08:29, Matthew Majewski wrote:
>>> On Wed, 2025-02-19 at 17:21 -0700, Shuah Khan wrote:
>>>> On 2/19/25 14:58, Uwe Kleine-Konig wrote:
>>>>> On Wed, Feb 19, 2025 at 02:05:01PM -0500, Matthew Majewski wrote:
>>>>>> Move the v4l2_info() call displaying the video device name after
>>>>>> the
>>>>>> device is actually registered.
>>>>>>
>>>>>> This fixes a bug where the driver was always displaying
>>>>>> "/dev/video0"
>>>>>> since it was reading from the vfd before it was registered.
>>>>>>
>>>>>> Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
>>>>>
>>>>> A Fixes: tag would be great.
>>>>
>>>> Matthew, there is no need to resend the patch. Just send me the
>>>> Fixes tag and I will update the repo.
>>>>
>>>>
>>>
>>> Ok, here is the fixes tag:
>>>
>>> Fixes: cf7f34777a5b4100a ("media: vim2m: Register video device after
>>> setting up internals")
>>>
>>
>> Thank you. commit is now updated.
>>
>> thanks,
>> -- Shuah
>>
> 
> Please post your PR today, if possible. Otherwise it might slip to the
> v6.16. Alternatively, I can take this patch myself.

Thanks for the reminder - I have to send a vimc PR

Please take this through your tree.

> 
> Also, why did you pick up this vim2m patch? I was a bit surprised by that.

By mistake - Blame it on jet lag - sorry. Explains why Matthew sent series
for my review.

thanks,
-- Shuah

