Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0046272124
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 22:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391925AbfGWUxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 16:53:52 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:39146 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfGWUxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 16:53:52 -0400
Received: by mail-vk1-f193.google.com with SMTP id o19so9003425vkb.6
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 13:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wYsPCPhjzAngWVTZ1abgqySuHNVzZ52gpsAb1vdGc/c=;
        b=lhlC4qDOUEWDnYATm+eR7b0hnmDYeCXqt/H7TvXHwZWH7vRYyYIwYOjRkuwenxzTeq
         LCZWwqVZ3C1Z7fWM1PF5DrQMS8u3CaOmRDoLz9SCvRthsVciUnO1VKAhuHWy5GeUDwaj
         ZYDbPvqJXNOJllkCob6Lr4xfQRE8f3RoKZK86MT5iKPhWB7viOHSNHigApNdb+REIR+B
         gNTJIselm0iQ4ptpNqp0n1LYAEGk2ymQZWLawJoh3lOCMqHUT/zPLD+hnaJxT6wcfZV+
         OyjpiVhCHUjODxQmDWvmQhV1jV2rqXZrYpWDxu2dJIn+Ydow+xHEo+QIBRGBM9Q+5YfL
         7qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wYsPCPhjzAngWVTZ1abgqySuHNVzZ52gpsAb1vdGc/c=;
        b=GaCRBiCrKs1FHfo1P9r1V5qMucubjL28JSnNqNELlBu7BxcDUpFinn4AVmDT2DqYRG
         Odo3vPnlcOp/UWVdu52qERZmp7cizh9nVrZw4O/kvQRUGEoxqCUtZrViIeX4O7U9C3W5
         1Wv+XcTy0p0OLCJ13nWlqAUQn7zNQBz2kCEPL6ZfyN1U40unanhk+fPtWslXtBGKjIWe
         OqE2KRZs/KKpXLRJudBJ20y27TO3BP53ECv/uklbgb5GWUy2ipD9V3HMVbOz8RP9zXyA
         /mLgQlehZoF/aklxb4d5knWrBmJD9z91sS/v1rc4qHj3pdDzrqary0joY2iURMUJ4FUQ
         tD5g==
X-Gm-Message-State: APjAAAVOfpEUHFNIHhWg+Cfq0akIaI9421Iwh4wtDBYbhVrnanuQbn1U
        TX+KmZvuS4YoPe7ulKk5LV8yR1bisaXGqp0/lVE=
X-Google-Smtp-Source: APXvYqwpdn2ZclBUJkEVwobyQBj3QZh8IwK/8YIZ0xIMk2QQ+KkwL+9NAeJahHKtFtFspkAi0yH71yDmM50MWcCM6TA=
X-Received: by 2002:a1f:b0b:: with SMTP id 11mr30706760vkl.64.1563915231098;
 Tue, 23 Jul 2019 13:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <84ab52c4-9ea7-c526-c628-47d678ccf926@gmail.com>
In-Reply-To: <84ab52c4-9ea7-c526-c628-47d678ccf926@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 23 Jul 2019 17:53:40 -0300
Message-ID: <CAAEAJfDgEVMWbYkEaVp0mp4hQXbhZq8xJQM8xqCXGmyq7OaP9w@mail.gmail.com>
Subject: Re: tw686x driver (continued)
To:     =?UTF-8?Q?Mark_Balan=C3=A7ian?= <mbalant3@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 23 Jul 2019 at 12:55, Mark Balan=C3=A7ian <mbalant3@gmail.com> wrot=
e:
>
> On Jul 23, 2019, at 8:17 AM, Ezequiel Garcia <ezequiel@vanguardiasur.com.=
ar> wrote:
>
>
> On Tue, 23 Jul 2019 at 12:02, Mark Balan=C3=A7ian <mbalant3@gmail.com> wr=
ote:
>
>
> I see. I guess then my issue would be help in seeing how tw686x_memcpy_dm=
a_free alone does any required interrupt handling, since there are also fun=
ctions tw686x_irq and tw686x_audio_irq for interrupt handling as well? Howe=
ver, in my analysis, they were called after tw686x_memcpy_dma_free.
>
>
> What are you trying to do? and what is exactly not working?
>
> PS: Don't drop linux-media from the Cc list, and please don't top-post.
>
> Thanks,
> Eze
>
>
> I don=E2=80=99t know what top-posting is, but I take it that it means I s=
hould write my email below the previous? Anyways, I=E2=80=99m working with =
a linux driver verification team to detect race conditions in the kernel. U=
sing our tool, we detected a possible race condition with the tw686x driver=
.

Can you describe how is this race condition possible ? E.g. what are
the possible code paths and what would be the problem?

Also, is the tool open source?

> Even if there=E2=80=99s the slightest thing I=E2=80=99d like to please pa=
tch it as I really need this for my enrolled program.
>

Sure, if there's anything to patch, let's patch it!

> In any case, if interrupt handing isn=E2=80=99t given dedicated functions=
 that are called before tw686x_memcpy_dma_free, I wouldn=E2=80=99t mind wri=
ting them and including them in a patch.
>

I can't understand what you mean. Can you describe what is the issue
you are seeing in the driver?

Thanks,
Ezequiel
