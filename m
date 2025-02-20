Return-Path: <linux-media+bounces-26501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B03CBA3E0BB
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F771887DB7
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F381FFC6C;
	Thu, 20 Feb 2025 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZWTAu4sf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677841EDA1F
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068872; cv=none; b=nEyBWDa6M58hzQ8xcdqEf6BaIBFg/yR0jD+mS31Eduf7jIQgb1K/hqtLznKyez1t3z3EaMwTrPmR61PMjvsQa2Y3y6v8kYE2fly9deIcdNtRO9l7hg6T+bjACeUF0XrJ6Eu9saqXvP8nhn3gsH2gyiiH/DBKQPAoAqAmsWVoEt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068872; c=relaxed/simple;
	bh=BLQ1IP4exzcN8Kb+oDw9C4Il2MvG9m3hGzv57Hm52xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afbW4fV4vRv4wRwNsIcaTU0xZD7AotkJJQxDIcyGXXCKgTJFjSn1hdJ6avPobfNm8VW0ZMdihUr2pv8ib1i85q+6DU4FXWxrO37fW+FgJerYTUP0uwOsaBTwvGM1in0IS6z/6zFD0iXWGk0jYxbIWYVFfusDohtWeXkfQjO1P1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZWTAu4sf; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso8784815ab.1
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 08:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740068869; x=1740673669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwjlKhRG0iGOyn0ejvOkf3BvOfxLPNGzGQ5wbxYo/lU=;
        b=ZWTAu4sfiM5NvJYVNNWLkOi2RDKRuSbwq1JKC0B3ud95i+Xny3X6GOKdg2+3DMKncO
         YIQCOCBasIYhihetGbUHf22bC/ijrhyI+QwW0kjL6VSIEpOHu+ZS2ehTp2WyZxCXdIBE
         udnkOcRb6SOisr69W1u3GttaP7S9Uozf2iIZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068869; x=1740673669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwjlKhRG0iGOyn0ejvOkf3BvOfxLPNGzGQ5wbxYo/lU=;
        b=ZJ4/IPYKSB+z5RMBEXtEzyxK3GHY8b3HYxvcPiq/6yDOPWdPFJ+WOIzyeMvP5cpmeE
         ltj3+j8lawg8cHr/oxgoW4ldItkTKTdSRjF+xbuIMP/4WeJVsNQbrHRadjA2R45aEnlA
         MwlVHRjm5JlzgoLx6NjjeMrQHMjZuHmAezgwfReebNj3M7FoQzTopb9g0iHqsjA2lkqi
         l2tVltC0+gXfX4r0myz5CbVMmJi3/CERrJJhYRS3jkRkHNFfx9g6ynAR3rKvFIK6fvKQ
         95OuRdZktg+IgOz6Nxa0BAjSPviFOt3jLan8br9VMMN/jqlYn/ykLgcowMDr+Xm/VVdf
         2PdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb1G8p9o+REqb+ayL0JVOL0WlhWt4GNqGJPmIYS7ITvuWMQge05I4ZuNSjCi61Lm337y2odkiu9DbRpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGp7J+OLSOOkLLhENtrc96cHsAc1fK57Cdil5VrnK5trzZ3WZR
	MkZxJVPuJmSrgdGDNq5BAJ5ZsrH9xiXskz4MB3cD7WeTa+1GK3DVaA36A7zVH2E=
X-Gm-Gg: ASbGnct8rY6SLFqaUO7rYje3U4i10NlzsxHRBkx2k1SSZ72XRTHEP87+ASFFWEsPbec
	XCgqSaKiE+FqvqqpoQGTRY8yjXU/vcSUSaANg7WjFZDvy8dHNGk/FX5fKAf9gQBYUdPHCY2eJVy
	c6XrL1A9Rsgm9MxF8h+epGXqDrNs9TaHXbKJoDZDIAdLqItj9aEWTA/gx0ychUfhED4dm17uiEU
	Ab2G1gGCERKpL3jvPLYP/mOSK9KgZd2u5Cob4Twutaz4qEYq0e+sjnZB9wm1TdTMRaKU4acbTzp
	7X1DCl7syD7wyqDAp3R2kNM1Jg==
X-Google-Smtp-Source: AGHT+IFASkn5j/fmfjTm2TAx7kTG0tE4mRqekWxZMkb1c+xrRe5TIpTFGtFlIN+DjXR3rXi+Js/zuQ==
X-Received: by 2002:a05:6e02:20cf:b0:3cf:c17d:5cc0 with SMTP id e9e14a558f8ab-3d2b52df712mr77663015ab.13.1740068869421;
        Thu, 20 Feb 2025 08:27:49 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4eeb9359772sm971606173.60.2025.02.20.08.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:27:48 -0800 (PST)
Message-ID: <fdd0356f-d91e-400e-9598-d34e0862c9cb@linuxfoundation.org>
Date: Thu, 20 Feb 2025 09:27:47 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: vim2m: print device name after registering device
To: Matthew Majewski <mattwmajewski@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250219190501.295976-1-mattwmajewski@gmail.com>
 <ym5q2cpn2lxk7sarylnf4o3ztvtnb47wroxdiibdsp6yz4gt2y@jfyfo2ekmdmj>
 <5051c252-f1ef-4731-b0cb-fedfcda04d98@linuxfoundation.org>
 <61bd42742ff8a8e5f409b0f2ccc4ab8875dfe7a4.camel@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <61bd42742ff8a8e5f409b0f2ccc4ab8875dfe7a4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/25 08:29, Matthew Majewski wrote:
> On Wed, 2025-02-19 at 17:21 -0700, Shuah Khan wrote:
>> On 2/19/25 14:58, Uwe Kleine-Konig wrote:
>>> On Wed, Feb 19, 2025 at 02:05:01PM -0500, Matthew Majewski wrote:
>>>> Move the v4l2_info() call displaying the video device name after
>>>> the
>>>> device is actually registered.
>>>>
>>>> This fixes a bug where the driver was always displaying
>>>> "/dev/video0"
>>>> since it was reading from the vfd before it was registered.
>>>>
>>>> Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
>>>
>>> A Fixes: tag would be great.
>>
>> Matthew, there is no need to resend the patch. Just send me the
>> Fixes tag and I will update the repo.
>>
>>
> 
> Ok, here is the fixes tag:
> 
> Fixes: cf7f34777a5b4100a ("media: vim2m: Register video device after
> setting up internals")
> 

Thank you. commit is now updated.

thanks,
-- Shuah


