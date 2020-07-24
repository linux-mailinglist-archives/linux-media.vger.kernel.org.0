Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B2422D1A2
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 00:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgGXWGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 18:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgGXWGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 18:06:08 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA5EC0619D3;
        Fri, 24 Jul 2020 15:06:08 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id 12so9290190oir.4;
        Fri, 24 Jul 2020 15:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gKGaZYbAQma5BZaaiiuz/q6Gx4ZB9iVd+JzL1laX8mM=;
        b=sEAtKdMUwCMH492Zr8KyBJo4FC3G6NThqJNVuq7jSP0yA1L6Z9fsE6toZcF3fLeG0E
         K/6ilzx3MNpT82/1+8CNDfUFsUh7nBLylWK85eVqrOV3wrmGGFlv3tjsCL5R7CEQ5WkW
         zQG0wALZRwXWwnE/AxWlS7o7EQj/jsJsE7h7I9sspuEBQpqhtERMaXU5H0tf4qIzxt0Y
         btImVEvvaaGUYGEFQmVgO+6CDMpjG4176j/exB3I+FN0uwFfbVkMW9O59ig2HrHpcjnV
         CXeIywFpC+P7vJSjRl7FdxaujfUrtm05ax1EoLF00fTZsJr+vcr8B1tRZAauCyGWWrAi
         xxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gKGaZYbAQma5BZaaiiuz/q6Gx4ZB9iVd+JzL1laX8mM=;
        b=jGbtz3GF4+bnI1dc1gTUTmACbqfhzfwsf2OSQfEjJQinMpC/dMnDr1RCStRbbrFGRX
         oXutEq8qxT9AEfu36h24htASRLjV4IqSKjGidU+GCAYaJN7V+1s5RiIKfXVRirEcabl0
         WM30j/bHCj0U/gvqzj43+/Mep8Mv4FGB1+PzTTzsvIRSqYSbMpFGM4N1zkKZhrmghx+z
         zk5Du2yu3ueVu0pdhgVPyK3tEbydICuiG0piggEyVpBG4bi+YCBgiKUuRzcyExKixHcd
         AyYuzlU2N89JUKmhU4IzRs4PTPTEftcqo+Txdo4eu2809pyJ18+OV33Ge1rXaGu5zQjw
         quqQ==
X-Gm-Message-State: AOAM531GMugT5q2m7FzBxn85Iyh/M9pMujpfOc4xD9TYW3KWzLvs0y/z
        1PFzqTd+Wx0bsuElrSaK8AUzs8I3Dcr4MVR6vAs=
X-Google-Smtp-Source: ABdhPJx+EPUvb808nu8ymhw9hZsJ+tGycBMMznqA6sRwyWtt7F2IBZHQHJOXc00tBvTycRRgjF9Gr5jiPUREwMXS+Zg=
X-Received: by 2002:aca:b7d5:: with SMTP id h204mr9855591oif.62.1595628367460;
 Fri, 24 Jul 2020 15:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200723170453.432-1-novikov@ispras.ru> <CA+V-a8uNfscxiM1fMjfdvZstZkkzxW41p40jpBXT3NeyiS9-Qw@mail.gmail.com>
 <20927111595619342@mail.yandex.ru>
In-Reply-To: <20927111595619342@mail.yandex.ru>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 24 Jul 2020 23:05:40 +0100
Message-ID: <CA+V-a8tUmMnb8x=GPXJ8QGLJg5qGP+DP+F9EbUrDfUbrxWnkag@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix potential double free
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Evgeny,

On Fri, Jul 24, 2020 at 9:00 PM Evgeny Novikov <novikov@ispras.ru> wrote:
>
> Hi Lad,
>
> Yet again I can not demonstrate you a nice error trace corresponding to t=
he bug fixed by the patch. Indeed, there is a branch in vpif_probe() that e=
xplicitly invokes vpif_probe_complete() and the patch targets the possible =
issue that can happen during this.
>
> When I developed the patch I saw on vpif_display.ko. It looks very simila=
r regarding things touched by the patch. In particular, it does not free vp=
if_obj.sd in its vpif_probe_complete(). But now I see that it does this in =
vpif_remove()!
>
Makes sense.

> Do you think that vpif_capture.ko should do the same? If so, I guess that=
 I should fix the patch appropriately since likely it just replaces one (ve=
ry rare) bug with another one (on a typical execution path).
>
Yes it should.

Cheers,
--Prabhakar

> --
> Evgeny Novikov
> Linux Verification Center, ISP RAS
> http://linuxtesting.org
>
>
>
> 24.07.2020, 17:17, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>:
> > Hi Evgeny,
> >
> > Thank you for the patch.
> >
> > On Thu, Jul 23, 2020 at 6:04 PM Evgeny Novikov <novikov@ispras.ru> wrot=
e:
> >>  In case of errors vpif_probe_complete() releases memory for vpif_obj.=
sd
> >>  and unregisters the V4L2 device. But then this is done again by
> >>  vpif_probe() itself. The patch removes the cleaning from
> >>  vpif_probe_complete().
> >>
> >>  Found by Linux Driver Verification project (linuxtesting.org).
> >>
> >>  Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> >>  ---
> >>   drivers/media/platform/davinci/vpif_capture.c | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >>  diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/=
media/platform/davinci/vpif_capture.c
> >>  index d9ec439faefa..72a0e94e2e21 100644
> >>  --- a/drivers/media/platform/davinci/vpif_capture.c
> >>  +++ b/drivers/media/platform/davinci/vpif_capture.c
> >>  @@ -1482,8 +1482,6 @@ static int vpif_probe_complete(void)
> >>                  /* Unregister video device */
> >>                  video_unregister_device(&ch->video_dev);
> >>          }
> >>  - kfree(vpif_obj.sd);
> >>  - v4l2_device_unregister(&vpif_obj.v4l2_dev);
> >
> > vpif_probe_complete() is a async callback and probe() should have
> > already completed by then.
> >
> > Cheers,
> > --Prabhakar
> >
> >>          return err;
> >>   }
> >>  --
> >>  2.16.4
