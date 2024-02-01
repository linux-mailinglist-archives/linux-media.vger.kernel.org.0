Return-Path: <linux-media+bounces-4556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C68457E4
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 13:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 309021F25A54
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 12:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAA78663E;
	Thu,  1 Feb 2024 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="inAgxRXM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB053364
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706790795; cv=none; b=Vp8NKrFGo4IKFj9O0lrPQDvwyffMhihfS7/90egb8v1mTQ6OuKc4MPU/BLABzxpbA9/gmuz9PkoiwXhVxsqVnTDhgfAclEROZyuy9PqaD+2EoGnHN1eN4zbrJIw0g/397J5gPdBOifYMMzrQ52Hutn+Hcdvt0yYrVEfDyJ57eCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706790795; c=relaxed/simple;
	bh=vztFMk5uuEh38jenc7+zX5epdhHN3eiCXzKX1f1ISFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2urboe49fq27+Ylw5fFEh8NjNOTDJGSB0Y7r4R6Ox4hFOuk5KxI7EWs/WMW1BL149LtDetCb649b8gX20o1fN3Yi7w9okemPzYUXdpwzkkq7jNKaYFGd7mDWm1ZB4gp4/Rmhj7PCml97JjdA48kQMqIuAZ6rIj7yPnixyXEFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=inAgxRXM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706790792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VykzFS/A4gtaHJ5yZrvwMMrgvKzQbIZs+sazS0I9kak=;
	b=inAgxRXMv/pSsYbzaazz0H3kkAfoejSiO16T7Cv7UtZGfPSmW3XfPUfaTqdaH+DxNeOPvM
	x+fUg53Fj8sE2k3MxQ9aYHOCdlIGhlTzLKSDv+mgA/N5jyFpheivLM4nsoCVddEx2YzMnR
	wjYNj38tliCUjmXhZ9V5kH5uW2uJxsg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-7Z1qPjkTNla0Ine-vOe29w-1; Thu, 01 Feb 2024 07:33:11 -0500
X-MC-Unique: 7Z1qPjkTNla0Ine-vOe29w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a35247a5d8cso76867866b.2
        for <linux-media@vger.kernel.org>; Thu, 01 Feb 2024 04:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706790790; x=1707395590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VykzFS/A4gtaHJ5yZrvwMMrgvKzQbIZs+sazS0I9kak=;
        b=hESNHuIDud0dUWRX0h6SyM3ZkweqKOjwjEbud239mP7TqkVZSpS2ZUocUwFfU8qs/y
         TPZ0oDLgpiWKUanRBV/Hd2wsbEgOBeX3aEps4XQ/89FyZ0bPuqYGsrv1NwxtgItngYh8
         ko++20/QcOhv05GOy7OaHg/PYUi2mlMJ8fRa+2Eidb1um6xqupkYfZ3nJdZou4AJ5PgG
         fvFZcQj791IrOLZ+IfNZVwJIXTp5B61hJN+zvbqpulx2I2X6oLTuInsX2sk8U57b1vme
         FoZw9bq/HnzaDkRy6I5iOcgWBTTyYV9PCKXBqO72tBqZKPMgJsR8a5pKHm2Y1HBlw6wG
         VfNA==
X-Gm-Message-State: AOJu0Yx9TzFoOqwYiIlRCcWFKbxPVxN1BRinJVwL/ACWd53tVlmsZmNG
	Gpb71G+LNVfBwiCQc4zxzHCJL2htwDM6SzpkJbY/B6+gzQAwFAlYCJkBLWC0WdAAg2yrw0kKzm/
	p+rlcnZTc6k8lwBsFXC7M+xt5eF5ciOYtb+iaUxQbgycNvi66wKx/3RhFZhpv
X-Received: by 2002:a17:906:e9b:b0:a36:741e:a5 with SMTP id p27-20020a1709060e9b00b00a36741e00a5mr3637728ejf.70.1706790790069;
        Thu, 01 Feb 2024 04:33:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG24YEwQkEJ9vizn3D6WUrihJuxwFM1DrqNfiUXQJnJ0eGcsdi1ConwFQ7h1xVfblGwtTtwNw==
X-Received: by 2002:a17:906:e9b:b0:a36:741e:a5 with SMTP id p27-20020a1709060e9b00b00a36741e00a5mr3637711ejf.70.1706790789773;
        Thu, 01 Feb 2024 04:33:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXk93JY4fPpdN7OjqvVkFatc+yT/+REOzgP4mJdD3AiA7IteyTRYwbPXvSpSEtkDQM5Hu7G8tp4Jobh6WbCWNf1+1zgCn1fr9YqOxzTnVoYLo4+ONTQfeOdyn8eKxx0LKCTSjDftFTBcVRa810kogGx/e2B0c3xX0w5/jvmjPGEYSh4MA4ygM1bo3Ng0lqXqpDtbvMWiB1C6tZjesKjWQ==
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ig11-20020a1709072e0b00b00a36834a6c0dsm1411188ejc.19.2024.02.01.04.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 04:33:09 -0800 (PST)
Message-ID: <3d0d2d3e-f991-4261-83f8-e4fd813e0804@redhat.com>
Date: Thu, 1 Feb 2024 13:33:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.8-1
Content-Language: en-US, nl
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
References: <d5059986-0329-4e6a-a7a5-30da8ebd58a9@redhat.com>
 <20240201071017.6032bba8@coco.lan>
 <508f2b4d-5fbd-4389-b98f-31b9525dd7cd@redhat.com>
 <20240201131826.7d8502ae@coco.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240201131826.7d8502ae@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/1/24 13:18, Mauro Carvalho Chehab wrote:
> Em Thu, 1 Feb 2024 12:46:19 +0100
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> Hi,
>>
>> On 2/1/24 07:10, Mauro Carvalho Chehab wrote:
>>> Em Sun, 31 Dec 2023 11:39:18 +0100
>>> Hans de Goede <hdegoede@redhat.com> escreveu:
>>>   
>>>> Hi Mauro,
>>>>
>>>> Here are the atomisp changes for 6.8.
>>>>
>>>> My patches in this set been posted on the list, but only a couple of
>>>> minutes ago, leaving pretty much zero time for review. Sorry about that,
>>>> with the holidays the timing did not work out very well.
>>>>
>>>> If you don't want to take this pull-request because of this it
>>>> would be good if you can at least take the patches up to
>>>> the "media: atomisp: Fix spelling mistake in ia_css_acc_types.h"
>>>> change. There are only 2 unreviewed patches from me in that
>>>> set, which fix the atomisp driver not working at all with
>>>> the latest media_stage/master code. And the rest of the patches
>>>> in that set are from others and have been reviewed by me.  
>>>
>>> We typically close the media merge window at -rc6. As I was also
>>> in vacations during those weeks, this PR was merged today for 6.9.  
>>
>> No problem, I know I was late with submitting this PR.
>>
>>> Indeed the first two patches seem to be needed to fix an issue on 6.8. 
>>> Could you please send them to stable after their arrival at linux-next?  
>>
>> I'm not sure what you mean with send them to stable ?
>>
>> 6.8 is not released yet, so these need to be send to Linus this
>> cycle. What is the process for media bugfixes for the current
>> kernel cycle ?
> 
> Heh, sorry, somehow I was thinking on 6.7 :-)
> 
> If the bug only happens on 6.8, I can just cherry-pick the two patches
> on my fixes branch.

I believe you only need:

"media: atomisp: Adjust for v4l2_subdev_state handling changes in 6.8"

And as the subject says, that is a fix for 6.8, 6.7 is fine AFAIK.

Thanks & Regards,

Hans


