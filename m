Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BAD22E673
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 09:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgG0HZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 03:25:36 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:52995 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgG0HZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 03:25:36 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MrQN5-1kc6LS1RQ7-00oSaW; Mon, 27 Jul 2020 09:25:33 +0200
Received: by mail-qt1-f174.google.com with SMTP id k18so11476309qtm.10;
        Mon, 27 Jul 2020 00:25:33 -0700 (PDT)
X-Gm-Message-State: AOAM532evHLRZt1xnU3P9FMl3ZraIadYspfVI5Vomrdbvzy9ZxVO1OPI
        qxumO0Av/Q4pPojkPWhRX+2CehV5T+ovqeEIF5E=
X-Google-Smtp-Source: ABdhPJwWLr1eTQmOXplkFU6XSrVj3kjpURsSxQSIWVgU+rgY8vc+FCSJgM46ph7HyxcrmOsXIwIa1wuoiXAbMCg8mWw=
X-Received: by 2002:aed:33e7:: with SMTP id v94mr18147736qtd.18.1595834732135;
 Mon, 27 Jul 2020 00:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com> <20200726222703.102701-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200726222703.102701-1-yepeilin.cs@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 09:25:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
Message-ID: <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Pvkn78eH0tOJf1RFljQq0oDnVVH7E+/mtWTzh0OZ61SmInkuDGg
 lQ3UluJCbw1dkfypL+PduslEGlPeO2uD+Lj3fwuYYLKKtFhvZTcugw5EqR1eaxlq567DoAO
 +XBUvz2a442uXtXHTLTJ0FVCQ/oClATX8n9+XvvAQcwIgbpinnBpxyn311yh8YgiTdoNEuS
 n2vMJker2LIcbxoXziSrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l8yhX0La2Kw=:H87blivzVsgm1iYavydGII
 QPGdLMTp92t8lUhTRnAALef8MV9tOwxvzVOYIjqyjS2kmqsjU3vIYXIs48ahj1ZlRaP/sp/vu
 3B+v1yEreVmaKyynRVfr2pHMKLfmDDzmyJ2e2DXqNwrnHOM3Glr6GJ03Trw+U5fJAJS5SHPOQ
 uO7+n8rNUSk+5qub8bEw13yBaXtRtlxVEnPmOmRI0nEdWyXx+dugVhsC19qirqQf9Wv6NjlKf
 koAt4ieGEVWppFB3sNx0MaQV65V7423su4SS06OWeq+ugs9/w3G0XosYQpTvahKteRmsPKFIl
 8WZLLkHGJNwVF6veBxCXNmCZXaJX8xNxddgaWhrSF4j2g9V76VuT9Po4VzRk7+p9rk2ngBn5y
 R74+gOAk8OtyZYt6mbaZitvMkjVLp00CulPvqCGVUwJZyPUHAOtU11m3HM/DG2SrZGpOk82iw
 D+unrqN3nxvA5sB9K/YTdF9mY6if7XMBzHgsvPOZdmmlosyBZ9yaA93F3qcu/6AlJxGK+3QFN
 Kf/TJ76qZFqe63Jz2KCtLetPX8A/IQXu7wBHn5pu7HDVK+qjjdNikrYyfn3ckysAjjfleGMeb
 Nm8CWsHJcDI3sTe8oC+vm4iEQp+amyLMAdAoSha55/UUM0qe+8drnn5Irmu+MBeiot3ic6GHG
 eTnRs8e2dkVDHMabPsls5Oc3GWldlYYJ7Jl3rbY6bgsXWgt56Sz8J/piopWWwOLD/5TRzlpN0
 PuxjoCuD2fAD6ZC2hvZC9cbbmMaCIPivKQ+6XwC0+o5pa8AsD5/alD2yH3QZZz7lO3PGkBReh
 et9bmtcjn2GUFjpRkKcKy4YLPJ+olxpLrNWqZ3pYzdQv7itsqCojzez8zmII8RjWun4Ljm1vS
 AhBfx6ZwjN4CXetQokg8iWRtvZXSb3czRjjngwDILilNwxV3NvEhr0BAc87lTPjvesJ/bsIG2
 yZ7Dx4js7OllOYMstz+5fdPkHhRBdm4Pq2lgRVW2IBlUX9Tnwp5BL
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> video_put_user() is copying uninitialized stack memory to userspace due
> to the compiler not initializing holes in the structures declared on the
> stack. Fix it by initializing `ev32` and `vb32` using memset().
>
> Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Thanks a lot for addressing this! I now see that I actually created a similar
bugfix for it back in January, but for some reason that got stuck in my
backlog and I never wrote a proper description for it or sent it out to the
list, sorry about that. I would hope we could find a way to have either
the compiler or sparse warn if we copy uninitialized data to user space,
but we now don't even check for that within the kernel any more.

I would suggest adding these tags to the patch, to ensure it gets backported
to stable kernels as needed:

Cc: stable@vger.kernel.org
Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
Fixes: 577c89b0ce72 ("media: v4l2-core: fix v4l2_buffer handling for
time64 ABI")

In addition to

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
