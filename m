Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E53439CFAE
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 17:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhFFPI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 11:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhFFPI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 11:08:57 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3CFC061766
        for <linux-media@vger.kernel.org>; Sun,  6 Jun 2021 08:06:52 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id u126so7200015pfu.13
        for <linux-media@vger.kernel.org>; Sun, 06 Jun 2021 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cfz5gfstiVPlh//ybdMIBwabxkpDJCo5LH6ZIQtncvM=;
        b=ZAUGE0tEqAvgS2L1/LoFZwtXCnmyaxpc+bRTQjPH7ENVHEKNxtx8oJfI//zG4RX2Kx
         o13YK4C5dqQur89DVRcjAaxUTYXjUUFpxkFuPdijOTmCCtwlNQjfEJ6nUWKLMphx8OcH
         7UFoC+KolpIUpUEN3Np7faPfEdi4zKA9BmQNwA0tiCk/riYGLwcSirLH7G7l93xa58Ol
         xOY4pUqWt+W2TZw/6KgNlgXrx5MqbDh2UxEK4Ub4m91LAxUbhHbs/derYxR4HOuFBX97
         82JsyGO+rzA9kBnN50lthrvWftIB+rPEN7Pa07oiZn/w8SoHIwf6duGUmwku2PvxGASL
         /+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cfz5gfstiVPlh//ybdMIBwabxkpDJCo5LH6ZIQtncvM=;
        b=Zhl/CbV66jTQaogPXznNCaIvc62P/67E9WMvMTJHHSbzrlzHO8UhMAf7XD1L+32R1l
         nWMMbUCbN3xqb/JledPH6yz9xYb6DEbC6TIO9X4a2eXT+kLtqPbIDtZ4tAzNHfd33dPi
         b84bVKQ8oR3dBCdqvjr6PEJ0dHMWR6lQQQSGKr7KjE9VmmAO3w+DFrcbnXGtpYvFaTjV
         uwltYAOxsRpDO7YXcmBPjZKa/JV1+owy4PaB6p3PsifDsIo9zQvGA+xURQ4ZRL1FGUk/
         YZO0tAANyryT2dLiUh3u/r2VxWa0j9DIYIMUJVgQKf9fZGCzVP8kgA3rhbJfzeXXkDQt
         eAuw==
X-Gm-Message-State: AOAM530YiqU0mS0P3agB9nQ0gbuUJ6wrsRsNELIA4VHwi5UQd/77v965
        T+8JhbijMR5KZOxSjfOFWsMTVwNuf7YTyujmTn4=
X-Google-Smtp-Source: ABdhPJyXBRUle9qCKBrNSnplAod2yCiAFIgN8Z9OPA7W5sXmjY3qSdRS/c9Gl06IwEt47ZYjxW9yuX6DKeq1y0G5GqU=
X-Received: by 2002:a63:ed12:: with SMTP id d18mr13947203pgi.42.1622992010612;
 Sun, 06 Jun 2021 08:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210605115456.14440-1-euphoriccatface@gmail.com>
 <20210605115456.14440-2-euphoriccatface@gmail.com> <20210605160028.6ec30b8a@coco.lan>
 <20210605165335.26313de9@coco.lan> <CAJp=mWRihf_AiLXojoeeY6JTqA=-mD11+aWZToRcw2ozWoB5zw@mail.gmail.com>
 <20210606130043.382d3450@coco.lan>
In-Reply-To: <20210606130043.382d3450@coco.lan>
From:   Seongyong Park <euphoriccatface@gmail.com>
Date:   Mon, 7 Jun 2021 00:06:36 +0900
Message-ID: <CAJp=mWTwRePsk6ACr7Jc1uDOwNe60hVAyneh3VFU_LYii6M=Bw@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: video-i2c: frame delay based on last frame's
 end time
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

`2021=EB=85=84 6=EC=9B=94 6=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 8:00, M=
auro Carvalho Chehab <mchehab@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
>
> Perhaps something like this would work better, keeping a more precise
> average fps rate:
>
>         next_jiffies =3D jiffies + delay;
>         do {
> ...
>                 schedule_delay_us =3D jiffies_to_usecs(next_jiffies - jif=
fies);
>                 usleep_range(schedule_delay_us * 3/4, schedule_delay_us);=
               ...
>                 next_jiffies +=3D delay;
>         }
>
> >
> > I'll send another patchset if it doesn't look too bad.
> >
> > Thank you very much.
> > Seongyong Park
>
>
>
> Thanks,
> Mauro

For a few hours, I couldn't get the module to make precise timing.
It would always be a few tenths of FPS higher than I set, regardless
of how I construct the calculation.
And then it hit me, maybe jiffies is not granular enough - and of
course, resolution of jiffies turns out to be 100Hz :P

e.g. If you set it 16FPS, the count of jiffies to sleep results 100 / 16 =
=3D 6
The sleep interval ends up being 60ms, resulting in 16.666... FPS.
This discrepancy gets quite big if you set it to 64 FPS, resulting in
a single jiffies count, i.e. 100Hz.
(Though you will need to either skip some data, or set I2C baud rate
beyond the sensor's spec
in order to realistically even achieve 64 FPS, at least on an RPi Zero
it seems.)

So, I basically changed the time source from `jiffies` to
`ktime_to_us(ktime_get())`.
The timing is definitely better now :)

One last question please, before creating another patchset.
>                 usleep_range(schedule_delay_us * 3/4, schedule_delay_us);
Is it okay to make it essentially 0 microseconds sleep here, by
setting `schedule_delay_us` to 0?
It's going to be like,
```
if (current_us > end_us) {
    end_us =3D current_us;
}
schedule_delay_us =3D end_us - current_us;
```

Regards,
Seongyong Park
