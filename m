Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E587113E18
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 10:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbfLEJfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 04:35:50 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38655 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728629AbfLEJft (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 04:35:49 -0500
Received: by mail-lj1-f196.google.com with SMTP id k8so2748405ljh.5
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 01:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=wHvWP5czkcs6zdqRrBhHdH/O1niSczDo76b8irOQuhA=;
        b=NkYiZEO4BCJ85bJ+ABt1jQcjXklQ4CAGRvMcoUwge9GSbqvJrNb+MRVE5SpV8jkz48
         DAQHyT5eUxCsM43EyPUtne4JNtc46XOWBS14NzHGecTNzeGfp8Rke1BJ48gQt/aUbVjY
         NsOPygPidvLydRNnCBPgBuThs+JM6cwZdUOsuAmlaBPYk1lGUYeu6+VTdHfiMkMMzTvv
         JUr7SjWcsFy36+H0QpDfyZTqmW/sQooPBQs7qOpV+aRR1cZXTtU6iyj7VkP6SXA4YO8P
         HPld01X6ipVwKZ/1HvQj3mAZZ8Jy2FVnoNG2h+yEP4WdSNQKphTUPQ/mgIW26oMSxR3r
         29Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=wHvWP5czkcs6zdqRrBhHdH/O1niSczDo76b8irOQuhA=;
        b=DKy2CXSRB9552cXCKljf2MQ3GqM3lE0chys98LIH4Dt7ISsyTYF//mnqal8PF55nJy
         AplIcWjdeTnQZk96G0z4kjqYRXB3nWSsLpTQZtA81tkSJzlo5ydws90GJtuO20RCFQf4
         oH8u7RHLqq3hhXExb7l2PSoa5ZBbgrC+HLCSRABojOuCNoE5pzNA2iWxvkpnKELEmol+
         Yvm6bTZ3I4CTsdYiSTwIO0RC9MOUyirUt0jGB0cc8eZfh2gn4lMdsoXFtCmnUqfVT5LH
         2wirvSybvk872dnaeEHwHZQOp7KTnzhTMVx1JmXEsqYLR21b95/FVvI845/yMmQKDHb/
         bK/A==
X-Gm-Message-State: APjAAAUdXEZLVwcmXYS9eDN/i4LrWQEnxz7Qu5vJn5xZVTzI28gSpJbu
        4W9KlEo9w1onC/+waeDqiJPGH7JDxsqhiYs94kY=
X-Google-Smtp-Source: APXvYqyTDah7ZXxYApuswm9ubhB3AqSVpQQTrU6WuiJ0qW63kZ9V1HxG0wMf+1GIVXR/eA3JUWRGEOc9ehw32s51+cE=
X-Received: by 2002:a05:651c:1139:: with SMTP id e25mr4922190ljo.200.1575538547567;
 Thu, 05 Dec 2019 01:35:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a19:ef0a:0:0:0:0:0 with HTTP; Thu, 5 Dec 2019 01:35:46 -0800 (PST)
In-Reply-To: <20191204121906.GA21908@linuxtv.org>
References: <CAEsFdVOUq4gyue+EZjbE_J_D=W=XnsJBTYGwfk9rV50DJmY+3Q@mail.gmail.com>
 <20191204121906.GA21908@linuxtv.org>
From:   Vincent McIntyre <vincent.mcintyre@gmail.com>
Date:   Thu, 5 Dec 2019 20:35:46 +1100
Message-ID: <CAEsFdVPRpPefJxXQj9qFPU39OTKWcy8jp7=0u3+ekpXETbJa8w@mail.gmail.com>
Subject: Re: patchowork parsing issue?
To:     Johannes Stezenbach <js@linuxtv.org>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Johannes for taking the time to spot the wrapped line.
I did actually find that document...after I sent my email.
I'll resend from a saner mail service.
Regards
Vince


On 12/4/19, Johannes Stezenbach <js@linuxtv.org> wrote:
> On Wed, Dec 04, 2019 at 08:40:59PM +1100, Vincent McIntyre wrote:
>>
>>   https://patchwork.linuxtv.org/patch/60186/
>>   https://patchwork.linuxtv.org/patch/59979/
>>
>> but it doesn't look right when it gets there. For some reason,
>> the last hunk of the patch is included with the patch description.
>> This was why I resent it the first time, I thought I must have
>> messed up the formatting.
>>
>> Admittedly I'm sending from gmail's web interface but I have taken
>> some care to get the text correctly formatted and patchwork did the
>> same thing with it twice, so I'm starting to wonder if there's an issue
>> with patchwork.
> ...
>> @@ -539,7 +546,7 @@ build - Builds the media drivers without needing
>> to compile a new kernel
>
> This line seems to be wrapped.
>
> Quoting
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/email-clients.rst
>
>   Gmail (Web GUI)
>   ***************
>
>   Does not work for sending patches.
>
>   Gmail web client converts tabs to spaces automatically.
>
>   At the same time it wraps lines every 78 chars with CRLF style line
> breaks
>   although tab2space problem can be solved with external editor.
>
>   Another problem is that Gmail will base64-encode any message that has a
>   non-ASCII character. That includes things like European names.
>
>
> HTH,
> Johannes
>
