Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 201DD10A11B
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 16:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbfKZPTk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 10:19:40 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:48361 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbfKZPTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 10:19:40 -0500
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N18I8-1hq5I03i5S-012UMW; Tue, 26 Nov 2019 16:19:39 +0100
Received: by mail-qk1-f172.google.com with SMTP id b8so1459199qkk.5;
        Tue, 26 Nov 2019 07:19:38 -0800 (PST)
X-Gm-Message-State: APjAAAX1bw1LdLbu9guADta0uV8K96uqlfn0Ru39rha4XxxPNlUmNpxc
        JK4nAr9A7K7C2r/xv9TTCDG3EsH2huJp8o+TX/s=
X-Google-Smtp-Source: APXvYqxkJM9lYV6ySiCqqwmdO8XRdUFW/0iwCM8k71faNi0k7M+UF9EcV3qyWKGQNF7hE1x+4/qErH4knwLOBFrAgZI=
X-Received: by 2002:a37:84a:: with SMTP id 71mr15651038qki.138.1574781577640;
 Tue, 26 Nov 2019 07:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20191111203835.2260382-1-arnd@arndb.de> <20191111203835.2260382-6-arnd@arndb.de>
 <272c471b-a7a9-c830-e19b-d1f19ee47073@xs4all.nl> <CAK8P3a3vHWBJU6EiUbRKJ01Zsv5E5Yfr+=h2Dg95atjvaHZ+Rg@mail.gmail.com>
 <15a1a26c-b3ad-7449-4508-1207527ab21f@xs4all.nl>
In-Reply-To: <15a1a26c-b3ad-7449-4508-1207527ab21f@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 26 Nov 2019 16:19:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1xZZNYtOgyGg8hcUKNdXHhT9CyTbD1PkyXqfXSdy5mUA@mail.gmail.com>
Message-ID: <CAK8P3a1xZZNYtOgyGg8hcUKNdXHhT9CyTbD1PkyXqfXSdy5mUA@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TeslaUHoW7jHFuz2vZBZoWUXU6BPhPCjmeT5eJndrpAPBnqnGyA
 PVM5VJKQuFvk/CLaFPIMSuGVXcC4725e9428bUWB6j7MJbPX+ClTiUMn1zzg6EUSYZgLQTt
 DmhtlVXnq6MPyvShBmrmN/TO0hAoX+eKPBnpWxW+PsFFePs55CfmyPFD+mv14hR/kQ3xqmz
 QakJocJN5f3gi7rF0NFcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KV2i6mp1x5E=:lbVqwXsT3kIEt4Smtc5p5d
 o9wOEtlSTktEYVPi/cf8TVD7umMlASIlHnu/YDt4/7RLeNkBR0mQivX7ueyDCaTcW3+9PWjxD
 1tmCvLgplOZB+lzFlWBUhlAhOiu2euFaarC1f7Iv6QsXEQfQlkUhf0AzVFyVKW2zABsb/jCn1
 qb5HiRchenlmZB5AY7kHnZhRRVE+gg0llefoJ1LhgE7whFg1+ed4gbvPyo0caKz6HMTR0m+mF
 HikB6kEHruCMr/5u3YC5bRDXwbpBPOgQ5zZa7skVVWvIcQkS7RXSbzHeDC4uRapS/JYO4CM7d
 0CWWGuxA+TYVqWI3cjXbHHKjaec1gzOTJD7ssuJd5SIQpldKMR8YNB999gOeVX/wX/huP9VYl
 MprTB7MfJUZWGkfLSOg6KR3ZL5fgKRt+hqVym2aIfIClln/q419gMHwE/lSr1dXVHoDgy4RvZ
 eNf0oNrf0yVYvf+6sHZkGKLS3RQ9q/a+zL0D3gfaYTdCSnb6vPoyQs/m/ivh8hmV65iNRQkkz
 ASaPism5CP/hsa9QAHkWGLaDud+2ixQedmn5qBpzg5Dc2SHc8A/Co0IgSzKAj6QBlMdTIcVhH
 jUafmTlmiaP3O/yaxn8lW+JxqS0BG5iqr0OWnuph0L3OXCjXpmFECN8GqmxQcG4yGQ4Fyxj7k
 ydInHRJ086M1z7pKSXXfQxT49gzvm9HxVVJAKwioxmlqcVwVm1sotj84dWBTWDZg4IWMAXS+8
 iLF66qfyAHpiY8TyoiXnhcVeyMJKwHthALV6BCBhOL5LqwpoliEZnfFvcA+psboYWbJRPYpbi
 Oh7EeTnEbnP15DRZGoqT6wGimYH/dDe1XyW/jvPD5sGDQs2OXFWi7UyDXZ84ZG8lkR3My0UjG
 4E11tAxyOLUCZXPEXJZw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 26, 2019 at 4:10 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/26/19 3:43 PM, Arnd Bergmann wrote:
> > On Mon, Nov 25, 2019 at 3:40 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >> On 11/11/19 9:38 PM, Arnd Bergmann wrote:
> >                 struct v4l2_event *ev = parg;
> >                 struct v4l2_event_time32 ev32 = {
> >                         .type           = ev->type,
> >                         .pending        = ev->pending,
> >                         .sequence       = ev->sequence,
> >                         .timestamp.tv_sec  = ev->timestamp.tv_sec,
> >                         .timestamp.tv_nsec = ev->timestamp.tv_nsec,
> >                         .id             = ev->id,
> >                 };
> >
> >                 memcpy(ev32.u, ev->u, sizeof(ev->u));
> >                 memcpy(ev32.reserved, ev->reserved, sizeof(ev->reserved));
> >
> >                 if (copy_to_user(arg, &ev32, sizeof(ev32)))
> >                         return -EFAULT;
> >
> > Unfortunately this is a little uglier because it still requires the two
> > memcpy() for the arrays, but I think it's good enough.
>
> I agree.
>
> Hmm, can't you do .u = ev->u ? Or is that not allowed by this syntax?

No, that doesn't work here since the two unions are considered
different types despite being defined identically. It would work by
giving the union a name, but that name would also become visible
to user space without adding more hacks.

       Arnd
