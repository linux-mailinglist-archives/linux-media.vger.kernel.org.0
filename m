Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3EBED5F1
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 22:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbfKCVto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 16:49:44 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46679 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbfKCVto (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Nov 2019 16:49:44 -0500
Received: by mail-lj1-f195.google.com with SMTP id e9so2163477ljp.13;
        Sun, 03 Nov 2019 13:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yvffdycxNBwgpU3LU9SuxVJbqRvIU33ihFBNPv6gC7I=;
        b=YC3q7hQx4Wdn9a7lvBf3sNRgYqSo7VuFt/qp739qXrfCWKTCIf7TMJoCIVwRjUoG/o
         4bLT8+KRH6CiO8EBwWJPDP059P9ClkWcHcKvaaOlVbkl29j7yNiU0w27cb1vicc+zByT
         nuCPV7BUVhegPXeKwYBRkWQXJ+Gefwvj58+dSsDwCljRtZBe0/zPIr5/lWFlxXHDCif9
         qeeJJcBYbDzZQLcQOLDZpgXRJ41dZX9aOsOiYEp1eLK0NhpHqIZ6A04keK/0Ii/0NxYV
         9lpO5Vrexmy8VJ5z5tKuYMp20TkQQ/2o224ALGTtYlOTMofft/Zu9VCnx99CiNe+KgOF
         bsTw==
X-Gm-Message-State: APjAAAUxq6YkG8pPgpGBGIKhda6hg7HYUb18S8Gvtxo9PTJs8h0Qr7vK
        VpdpGxF37+ZpH5ZVB+T2Jf0=
X-Google-Smtp-Source: APXvYqwszZFVzcpBYbF1AygeSMGbm2SLWC9bxHThW1tANhHWxm1XLP3O7uysmVsAlCa4EXsFFr6Eiw==
X-Received: by 2002:a2e:8e27:: with SMTP id r7mr16590670ljk.101.1572817454047;
        Sun, 03 Nov 2019 13:44:14 -0800 (PST)
Received: from [192.168.1.183] (128-68-70-109.broadband.corbina.ru. [128.68.70.109])
        by smtp.gmail.com with ESMTPSA id x5sm7505573lfg.71.2019.11.03.13.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2019 13:44:13 -0800 (PST)
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH v3 1/1] media: vivid: Fix wrong locking that causes race
 conditions on streaming stop
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Security Officers <security@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Popov <alex.popov@linux.com>
References: <20191102190327.24903-1-alex.popov@linux.com>
 <CAHk-=wgE-veRb7+mw9oMmsD97BLnL+q8Gxu0QRrK65S2yQfMdQ@mail.gmail.com>
From:   Alexander Popov <alex.popov@linux.com>
Autocrypt: addr=alex.popov@linux.com; prefer-encrypt=mutual; keydata=
 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
 j3lCqPk=
Message-ID: <7ec33848-67a6-069a-132c-f8550f6e090f@linux.com>
Date:   Mon, 4 Nov 2019 00:44:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgE-veRb7+mw9oMmsD97BLnL+q8Gxu0QRrK65S2yQfMdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03.11.2019 19:45, Linus Torvalds wrote:
> On Sat, Nov 2, 2019 at 12:03 PM Alexander Popov <alex.popov@linux.com> wrote:
>>
>> -               mutex_lock(&dev->mutex);
>> +               if (!mutex_trylock(&dev->mutex)) {
>> +                       schedule_timeout(1);
>> +                       continue;
>> +               }
>> +
> 
> I just realized that this too is wrong. It _works_, but because it
> doesn't actually set the task state to anything particular before
> scheduling, it's basically pointless. It calls the scheduler, but it
> won't delay anything, because the task stays runnable.

Linus, thanks for noticing that.

I've double-checked: I didn't manage to get a deadlock with schedule_timeout(1)
on the kernel with CONFIG_FREEZER disabled and CONFIG_PREEMPT_NONE=y.
But setting a bigger timeout argument (e.g. 1000) doesn't change the behavior,
which agrees with your statement.

> So what you presumably want to use is either "cond_resched()" (to make
> sure others get to run with no delay) or
> "schedule_timeout_uninterruptible(1)" which actually sets the process
> state to TASK_UNINTERRUPTIBLE.

I changed it to schedule_timeout_uninterruptible(1).

I'll send the v4 shortly as a reply to this thread, because I refer to it in the
oss-security mailing list.

> The above works, but it's basically nonsensical. My bad for not
> noticing earlier.

Thank you, now I know.

Best regards,
Alexander
