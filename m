Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C95230BE5
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 15:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgG1N6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 09:58:41 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:58177 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730245AbgG1N6k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 09:58:40 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MiJEc-1kfogj00lq-00fQ2X; Tue, 28 Jul 2020 15:58:39 +0200
Received: by mail-qt1-f170.google.com with SMTP id s16so14852782qtn.7;
        Tue, 28 Jul 2020 06:58:38 -0700 (PDT)
X-Gm-Message-State: AOAM532ED7pYfMVpHkIdd70P/m+QDTMTWwMcnZw8ZFg+5ipGq36vYPZJ
        OPq70pLVcA20jVOvMPJ6hSjYFwS63jQHTYxuzIw=
X-Google-Smtp-Source: ABdhPJwcnjVzdXtH0ZMmkoqshSACaXjuaYnltOnaP33Va8Er6+9hKFR05vX7mZbNRjlSOGS84rqh1JYn+h/D4FTuw+M=
X-Received: by 2002:ac8:5195:: with SMTP id c21mr12200851qtn.304.1595944717799;
 Tue, 28 Jul 2020 06:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com> <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
In-Reply-To: <20200728130632.GI1913@kadam>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 28 Jul 2020 15:58:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
Message-ID: <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Peilin Ye <yepeilin.cs@gmail.com>,
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Z5iHW/C9P5Nl85OcBzVakBrqWM4lrfuNf/SQq8hrr0QV3dyVsUu
 IVmBk5jybQpiDhpTJEUEfuql9PZLvDPTMXIkZXu9RUhcIoupMGC5ivPlyaN+ZX+WdJ73xoz
 laBDBwmzOeAtkAg+h8+ZbbAocYSr6uPnlCP2wZNYZ2ufWvtmBrgrdvTo+gJdtou0A/7KSew
 136lzHuvUO6dyC9MHhR6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:abpZXgSh0J8=:7Ulpbons82EHMSBOYjqD5X
 mAh0ss9eDi6VPTk4uphhfDi7Hl/Me2mKhGuoWnECtgKohzKalxG+/573kRNI5sfMUDWVA6k44
 OJSnCfLnsbXHlRxs1wALVKcoBADg4PylyIbJiCbZTwzwDxYu5pkEKKT/uT8GQ09tae0kKXiJ1
 Rn/JqHqVarnQKYXiXVvN7qilchteRaSgkfC7gfKqZWdeEIwT0pzgR7O8yzJBrVEmdjLO/LC/G
 V3sCJjKM6SjJ8SJQRg7zPKnBHc3vRohe7CJx8B6kYYkG50mH8d3Wr83VT9aqmVGUNQuJldNLq
 7CMByJ2MgKaauSMMG7mZ+5ccau9nHGi8OyCACbJGoQOxd8sbBmnH8zUbDaI1LshfFL6Z5TvXL
 taLWy67OUTTXjGPfj+DErwrF/GZTOoYZbHbKL8MzxDrV/kvGY+dR2fgBOF4Qc0lkqzI57SN68
 1LeIfPIzQRZuVw57+nlrPAfwgvTzuHNje+oIubf3Q7I7GrOcrL0Zam8NEQbOGEDYFm+9VJfay
 SLnFIvdxspRcsN5uoyux3OlUAiwaKrCP7wRuifGmxBdz1rEk7AGz9NE7Ws56US7KfUUcQelaJ
 RQ8hyHcDKYRmrIocqJCLqt8bGZUqVlkzzF9lJOf4ZYLC8H8QYyCHD+WqoYTRGtcjiDlQicpIX
 8NI0LBGCVEJ4/eb1OQFlE/wlxkRDY2LJ0Y+yw4DRVQlQnJmG7Gxp/z94YeLEaZ5k2q5ivYvyU
 MgPyhs67KLxEsbpoXQPmz35cvAciHCKS9YQjNbXKrThvgPEzxH12n2S/HKowfCACrRuoi5KEB
 AykIp/7b4HOc7IYX3vC1ATba5bA5o38HSVmaWRHB9DlSSI/qoL1Dkw1yniqkuzOqQ8MLNu/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 28, 2020 at 3:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jul 28, 2020 at 02:22:29PM +0200, Linus Walleij wrote:
> > On Mon, Jul 27, 2020 at 3:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > > Here are my latest warnings on linux-next from Friday.
> >
> > Thanks for sharing this Dan, very interesting findings.
> >
> > > drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')
> >
> > We are revamping the ABI for 64bit compatibility so we are now running
> > pahole on our stuff. I suppose we need to think about mending this old ABI
> > as well.
>
> Yeah...  But this one is a false positive.  It's not super hard for me
> to silence it actually.  I'll take care of it.  It could be a while
> before I push this to the public repository though...

The lineevent_read() function still needs to be fixed to support
32-bit compat mode on x86, which is independent of the warning.

Something like

static int lineevent_put_data(void __user *uptr, struct gpioevent_data *ge)
{
#ifdef __x86_64__
        /* i386 has no padding after 'id' */
        if (in_ia32_syscall()) {
                struct {
                        compat_u64      timestamp __packed;
                        u32             id;
                } compat_ge = { ge->timestamp, ge->id };

                if (copy_to_user(uptr, &compat_ge, sizeof(compat_ge)))
                        return -EFAULT;

                return sizeof(compat_ge);
        }
#endif

        if (copy_to_user(uptr, ge, sizeof(*ge))
                return -EFAULT;

        return sizeof(*ge);
}

       Arnd
