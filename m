Return-Path: <linux-media+bounces-22705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 293099E558C
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 13:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAAB016452B
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 12:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F10B20CCC8;
	Thu,  5 Dec 2024 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="kV/QVj9s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8321D9A7E
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733401927; cv=none; b=c7fdpRQvWI+u0L65xNxQkGPZOWmkNKapoaMfFat/WnhKlofJD2xhT/KFiQ0zpB21gm31QbIN7/W8w6senH6Fk+fV9BzjK8pHan2MvBYu5nvAtcvbGH18gDG9c5ldQFxcMNFN5xdAw7ctiyZtlTyZLMwZhDhIDz1908AJMzo4BU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733401927; c=relaxed/simple;
	bh=WvD7k27/pkhPjnyOGKktbfEOXOmS0rb5gMAbbaMczjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mCHDjLOIlpLbT5dAU0Hbu7d6s+Twdd03kBQZIFpwxgegsyBSyPd30Y9gulYPvKh7UWJWXD/NGwg2Bad1aWlHkeYdmcxJVOJUkYj0ta/W/VKb7nYHLxmisbJiX60rGNoU/AMOFpXF0dyIsazM2IqAMX0gZhTz99ifKU7YC/545H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=kV/QVj9s; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724e5fb3f9dso700387b3a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 04:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733401925; x=1734006725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8RjxM1px2WZXKbCHymJqNJ8fA9PslmtN7uJTjbqjw8=;
        b=kV/QVj9spQLlXVuH7hNVwoPLn02frGyU9eDAeGPK1K+G85Dulwkczy7+oVm43FLSkO
         AsuqYtPRHYhqaD4aXCQTNgUlJ+6B5YK5o80fkC2YB0kI1c0tySapgpo+BjMT4ZpUWYw0
         LoHc89H8iTCWruofjUoPaLzIyZclEaRJQJUl6f5KXAhJP41KVJRMcyGOj1mKDnPgS0Mr
         eFikSyLBu4ntff7u8/zq88sz8UGVr/Rx69/MNjtkZ1VTKRbWbqX5y8lJ/HN9Qn0aoFX4
         GsCSmCmBhrGVBFuH6+/C97nEYKU7E0Cge9uHe8Z7dVIysRSw8I3/eCSnMln1CDUsZz1E
         wA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733401925; x=1734006725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8RjxM1px2WZXKbCHymJqNJ8fA9PslmtN7uJTjbqjw8=;
        b=Ydeo6ed9j5YIxFLouyFdDf3QFZYPdG2yHQCrnavKfhtOsg55jb/R+6/pHYIPrF4aKX
         NzmGzarpKFbJNqz+xJnvlVvljG9JTQ0xzXbbQpVs3s8/eTbmHR94lzgXW3rpTLRy7oTt
         gfV2mM50RVVTjQ6UEuafdAlC8TM5TJlYy2mu97LNCaez5/dWUkifFiOMtbs41JgJqUuB
         HEd7aMB1GEVLYyyYpheHpb/QLF7g4yGofFC2Zp3KAmWQduxE2pEyiGO4DgZXxVRSFBXk
         I5fkpNRv1VD7ippjXvzqKyqBhU63CYmemNBISO8CSX3eqBdPXjvFShb0YA2A5ErkpL20
         TMFA==
X-Forwarded-Encrypted: i=1; AJvYcCUPP/oIgEtkpb5jUNK+mVvIgNbx5nSIdLcqyDbqjlUhj8Idj/XCgZjSrKPQo+nBNPn4qUmuO0Pk359K+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGHWqnPBikj+4uN/HMssNDa7RLJVZ0t+UkU4bz9Yb2znMecz5
	UAorQZ+A7wZo5eJJnKX7OMNTVuN/ZixMaa80FQUomhwMqdr47gefRBTtmJYAEL4=
X-Gm-Gg: ASbGncvBFYNa/MWHUKwdhaIb3BeU56ZA1vX8HP9HZwib7qpdzujbp5DHyyVNJVXFB1p
	kSI7wva/ntCmyZjFThxYEY4aYDAd72rjFL1gyjjUqEULnOlDk5QxxW4UL0fwV+lF41+c5ZpcuUQ
	QNW92D5732FmhF8sPji2jrTFzlo3t3nNPvEMuza1A0fPSxTIydewhJRzvc1yhc76ABIL4H1Eqi1
	VNZg9N5KQG4/rqpjB/y+ETqgFkvVXhUdZl1i1w9E+6yeGvOqtovjN1ghgiO9wZYjLjoqHFrLRvX
	7fyelV8kpjNpfvMGsHkQ5m2xQnsiOw==
X-Google-Smtp-Source: AGHT+IH/zfjolI/SiezdIBq5+qp9KJL+gIbUI4L83k8SXVcb+l/yeLqz1BJUnSpDFPzfXdYZuScztw==
X-Received: by 2002:a05:6a00:218b:b0:720:75c2:7a92 with SMTP id d2e1a72fcca58-7257fb740b0mr12230679b3a.15.1733401924853;
        Thu, 05 Dec 2024 04:32:04 -0800 (PST)
Received: from ?IPV6:2001:f70:39c0:3a00:fdd1:5d17:fcf1:884a? ([2001:f70:39c0:3a00:fdd1:5d17:fcf1:884a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29e8dfbsm1130230b3a.56.2024.12.05.04.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 04:32:04 -0800 (PST)
Message-ID: <26030b48-fb18-4db4-ba0d-cb31b766cc3a@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 5 Dec 2024 21:32:01 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: allgro-dvt: unregister v4l2_device on
 the error path
To: Michael Tretter <m.tretter@pengutronix.de>, kernel@pengutronix.de,
 mchehab@kernel.org, linux-media@vger.kernel.org
References: <20241205020621.2051079-1-joe@pf.is.s.u-tokyo.ac.jp>
 <Z1FpqQldoZvVlydA@pengutronix.de>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <Z1FpqQldoZvVlydA@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 12/5/24 17:51, Michael Tretter wrote:
> Hi Joe,
> 
> On Thu, 05 Dec 2024 11:06:21 +0900, Joe Hattori wrote:
>> In allegro_probe(), the v4l2 device is not unregistered in the error
>> path, which results in a memory leak. Fix it by calling
>> v4l2_device_unregister() before returning error.
> 
> Thanks for the patch!
> 
> Out of curiosity: How did you find the memory leak? Did you use some
> specific tooling for that?

I am currently building a tool to automatically detect refcount bugs as 
a part of my academic work, and it successfully found this one too.

It will be published soon :)
> 
>>
>> Fixes: d74d4e2359ec ("media: allegro: move driver out of staging")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> 
>> ---
>>   drivers/media/platform/allegro-dvt/allegro-core.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
>> index e491399afcc9..eb03df0d8652 100644
>> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
>> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
>> @@ -3912,6 +3912,7 @@ static int allegro_probe(struct platform_device *pdev)
>>   	if (ret < 0) {
>>   		v4l2_err(&dev->v4l2_dev,
>>   			 "failed to request firmware: %d\n", ret);
>> +		v4l2_device_unregister(&dev->v4l2_dev);
>>   		return ret;
>>   	}
>>   
>> -- 
>> 2.34.1
>>
>>

Best,
Joe

