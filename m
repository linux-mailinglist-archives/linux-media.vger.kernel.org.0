Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554F222EE3B
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 16:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgG0OF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 10:05:58 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:52043 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgG0OF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 10:05:58 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mkpj7-1keMbU49JH-00mGMu; Mon, 27 Jul 2020 16:05:56 +0200
Received: by mail-qt1-f175.google.com with SMTP id 6so12267451qtt.0;
        Mon, 27 Jul 2020 07:05:55 -0700 (PDT)
X-Gm-Message-State: AOAM5327FGTxxBDo5Oi5XN1wZ/q2cVIkLwoK+76IcPJJWpNTQ9+BhIyq
        AU8iyWerlh55CfYlRr47GKRN9gqZEmoGAIZXNdY=
X-Google-Smtp-Source: ABdhPJyLw0yS/axt0gy7Q4r8Mv5c5syAQIHggRwgMclz+d8wr5c6LKZiPDs5uhjwt61MDn3Dh4YP6VF9XZYYgL6b5rw=
X-Received: by 2002:aed:33e7:: with SMTP id v94mr19493367qtd.18.1595858754708;
 Mon, 27 Jul 2020 07:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com> <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
In-Reply-To: <20200727131608.GD1913@kadam>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 16:05:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
Message-ID: <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uYTTDyuV42QIpGKOCNEEJ+PUI3+ux0SBsv8tF5Ho0S0vzFmKGog
 TcyE4TgnawrR6xE72VZ+fE59OSPlVlqX4s3KcFHxZbJhXdil7/Y0WxnveLPDjl3py7pELbf
 fRe/QCgKZhFs2bM4PgbqYWZnvVYxDxn4urGSveq0yzoAP9G2q4rY70i0HLbgR3xRDmtnnUQ
 DbCbVasMf1h4AHE/3slYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cYFVaI5WBYI=:98jziNKZlNXKNy+uR4ZSOI
 8fAVlZzVEqhLe6zvP/UeqiT3K8ahGWYRUInl4yH3WJ5d2jocEKtrAaLj81+oXo+NHeeVOxDFR
 ISh16TPwCc0X6BQ4eaRrc5B8D3A/rU3EqZ1+74RRXkS0lUWMoW2jLW3UvC7pezD6v8NEHHaTj
 8691zR/eYK6qkH5qTgFzNtbNu3mxT2i1Ho9r8APionDoEGOQ3Zu0HG/2QMcs28ynnDw3pqFwQ
 Ab1Klvkh0NzNTjRPBNlCaSSAsZ1tMOOliJgCsUmuaoDHzVFAGC6Za+NR7eehvd4dYY38oR8K8
 XGl+uUUMiMDllcJlGQCqiISBqx4GrnNarQ3ECWdCF6dOX4Jl2yjk5I1pJSekOawhCjpNxmI42
 VFwR3hIw5COlQ/wiUeIyrcbD8gWwaI/rqzn2Jrto1XmePRJkf4OFyoK1dByHuQU2ATP/2d5xg
 RHxkKb8tDAqFQQhdlxqK2uDtMvzgub8YGzS/OzVdCIL23EJX2zolx4zWebLUQqstQTvbVFH8t
 BmDTkw/Vf47E8xBO4LXL5ut4B9x0p5iDYQ6GYzZqkx344yZyS2wAjHJfjxhq7W4J3WMduLL1Y
 s0IT7EwBZAoKDH675ikMZ2lVLyV2GnG2Ke3WwNF0c7dKv/C2kxgJHMrohlI9TcyvLmTG1C78U
 IWZgOBtJHvcFkxwJMYxHBGV9X6tvYbBcslY5PCJqTK0vxWu3xOWishgrO4Sg6FFdZTtTCQEqt
 LgBxb+zZztuB/F6WMQd5Q5w/1EpiwURaJgKP42+XkydtwHudzEALtVyWfqKCRaTmyHZuiFKn0
 GzGe8viUOfiw9ypa613osJnFQWhCOoUh80TCxuzm/G5WEx1qm1D1dVOGgYHzUUwC3D+eLwDYl
 K6c/FAfSTYLH9dIOz9s0bh9r90pKJZbAKcqbOSbRABPWoG1ncvps6VQ5CH37gUh82Ip2fQ92L
 FMpd9xILL3vA2UyOqZfihRwOyqtmu9A1RzLsvtfUZEFYBX+P5lBKt
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 3:16 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> > On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > >
> > > video_put_user() is copying uninitialized stack memory to userspace due
> > > to the compiler not initializing holes in the structures declared on the
> > > stack. Fix it by initializing `ev32` and `vb32` using memset().
> > >
> > > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> >
> > Thanks a lot for addressing this! I now see that I actually created a similar
> > bugfix for it back in January, but for some reason that got stuck in my
> > backlog and I never wrote a proper description for it or sent it out to the
> > list, sorry about that. I would hope we could find a way to have either
> > the compiler or sparse warn if we copy uninitialized data to user space,
> > but we now don't even check for that within the kernel any more.
>
> Here are my latest warnings on linux-next from Friday.

Ah, I forgot you had that kind of list already, thanks for checking!

> block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')

I see no padding in this one, should be fine AFAICT. Any idea why you
get a warning
for this instance?

> drivers/input/misc/uinput.c:743 uinput_ff_upload_to_user() warn: check that 'ff_up_compat' doesn't leak information (struct has a hole after 'replay')

This one hs padding in it and looks broken.

> drivers/input/misc/uinput.c:958 uinput_ioctl_handler() warn: check that 'ff_up' doesn't leak information (struct has a hole after 'replay')

hard to tell.

> drivers/firewire/core-cdev.c:463 ioctl_get_info() warn: check that 'bus_reset' doesn't leak information (struct has a hole after 'generation')

broken, trivial to fix

> drivers/scsi/megaraid/megaraid_mm.c:824 kioc_to_mimd() warn: check that 'cinfo.base' doesn't leak information

Seems fine due to __packed annotation.

> drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')

The driver seems to initialize the elements correctly before putting
them into the kfifo, so there is no infoleak. However the structure layout
of "struct gpioevent_data" is incompatible between x86-32 and x86-64
calling conventions, so this is likely broken in x86 compat mode,
unless user space can explicitly deal with the difference.

> drivers/gpu/drm/i915/i915_query.c:136 query_engine_info() warn: check that 'query.num_engines' doesn't leak information

I don't think this leaks any state, as it just copies data to user space that
it copied from there originally.

Stopping here for now.

Peilin Ye, is this something you are interested in fixing for the other drivers
as well? I'd be happy to help review any further patches if you Cc me.

     Arnd
