Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84DD1A3AD8
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 21:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgDIT5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 15:57:03 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40865 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgDIT5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 15:57:03 -0400
Received: by mail-lj1-f193.google.com with SMTP id 142so1016222ljj.7;
        Thu, 09 Apr 2020 12:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IqFY640RbFLFwua6W1UXdOM8tCdMfQQ3d021gIPs3go=;
        b=tT6UFnbBoPP9ZSTuTEKoSNyU0aO0fMTTGxJc3vscI1hI/aY86//1Z6rlzYe/zJ0mx0
         c9AeRsLe5r1JiL+Cr/Ao7OZ4+IFdaMQk6sox9Z3FxDiaxXWSrmcdR0bSOQkTmsUqIodu
         3WWS97fvKBszB/7f79DdG0w87NLkCpheqfG2tyHSPDVB0KgzIN4VfqRC8qF7wXxioYlE
         QTP3SVZJ4NXlW99XbsgalWpHNFVdwAth+fFT/GYYvlhNLMP08gPLlqAKOERa8AH2xIYs
         ++KIBzVfK+BP4dPNUpzOZRdlnCO6qRvwJTv4RF0WCCA0L5N8UhADOFAElOZm9VNFpoIO
         qc6A==
X-Gm-Message-State: AGi0PuZOfLhT/rWj6V1Irwlbmuio7dj2r1DwXRgJ8T+LkvMgfd7O3lMg
        dHtDzCfRY7rGAz0oT/b1enc=
X-Google-Smtp-Source: APiQypIQhgYoWlP25Frwc/RU2D37XrYS4VorSwK8yMLgBcXxoB5uwlgyIN2qRn1gUM0bJiwCkuLQXA==
X-Received: by 2002:a2e:804a:: with SMTP id p10mr907437ljg.289.1586462220406;
        Thu, 09 Apr 2020 12:57:00 -0700 (PDT)
Received: from [192.168.42.234] ([213.87.131.218])
        by smtp.gmail.com with ESMTPSA id h16sm15834846ljl.73.2020.04.09.12.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 12:56:59 -0700 (PDT)
Reply-To: alex.popov@linux.com
Subject: Re: [Cocci] Coccinelle rule for CVE-2019-18683
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>, cocci@systeme.lip6.fr,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>
References: <fff664e9-06c9-d2fb-738f-e8e591e09569@linux.com>
 <alpine.DEB.2.21.2004091248190.2403@hadrien>
From:   Alexander Popov <alex.popov@linux.com>
Autocrypt: addr=alex.popov@linux.com; prefer-encrypt=mutual; keydata=
 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
 j3lCqPk=
Message-ID: <3c92523d-4b3f-e805-84e6-6abd1eedd683@linux.com>
Date:   Thu, 9 Apr 2020 22:56:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004091248190.2403@hadrien>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09.04.2020 13:53, Julia Lawall wrote:
> On Thu, 9 Apr 2020, Alexander Popov wrote:
>> virtual report
>>
>> @race exists@
>> expression E;
>> position stop_p;
>> position unlock_p;
>> position lock_p;
>> @@
>>
>> mutex_unlock@unlock_p(E)
>> ...
> 
> It would be good to put when != mutex_lock(E) after the ... above.  Your
> rule doesn't actually prevent the lock from being retaken.

Thanks Julia! I used this trick in the second version of the rule that I've just
sent.

>> kthread_stop@stop_p(...)
>> ...
>> mutex_lock@lock_p(E)
>>
>> @script:python@
>> stop_p << race.stop_p;
>> unlock_p << race.unlock_p;
>> lock_p << race.lock_p;
>> E << race.E;
>> @@
>>
>> coccilib.report.print_report(unlock_p[0], 'mutex_unlock(' + E + ') here')
>> coccilib.report.print_report(stop_p[0], 'kthread_stop here')
>> coccilib.report.print_report(lock_p[0], 'mutex_lock(' + E + ') here\n')

...

> Based on Jann's suggestion, it seem like it could be interesting to find
> these locking pauses, and then collect functions that are used in locks
> and in lock pauses.  If a function is mostly used with locks held, then
> using it in a lock pause could be a sign of a bug.  I will see if it turns
> up anything interesting.

Do you mean collecting the behaviour that happens between unlocking and locking
and then analysing it somehow?

Best regards,
Alexander
