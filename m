Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1533A230609
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 11:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbgG1JAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 05:00:36 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56557 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgG1JAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 05:00:36 -0400
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N7Qp1-1krjrg3oQ1-017nYF; Tue, 28 Jul 2020 11:00:34 +0200
Received: by mail-qv1-f42.google.com with SMTP id y11so5817012qvl.4;
        Tue, 28 Jul 2020 02:00:33 -0700 (PDT)
X-Gm-Message-State: AOAM530VPtxzYmmfQKA5oHkCar+PhTxxZNXrtHW4btTVztmDhQCPB+AJ
        8Pl1IiHWOgO/Jwpp7HbClrTUgsSSKdOqNnbApYo=
X-Google-Smtp-Source: ABdhPJyHJknGj8GUNL8xLpz4Ao+RH8HsvsNIXL/Mx8WnbEJnfPHwMfS9/LuIY4gTuNauTXnxx9R4Pbevp0lgD1BJOnI=
X-Received: by 2002:a0c:a992:: with SMTP id a18mr25130279qvb.211.1595926832698;
 Tue, 28 Jul 2020 02:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com> <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <20200727220456.GA328887@PWN>
In-Reply-To: <20200727220456.GA328887@PWN>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 28 Jul 2020 11:00:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0CcmchionPJQr_4Gdevo8r8ixed7WHSu8MyYvffagqdg@mail.gmail.com>
Message-ID: <CAK8P3a0CcmchionPJQr_4Gdevo8r8ixed7WHSu8MyYvffagqdg@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
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
X-Provags-ID: V03:K1:CsD6pvTl7tWkdFLkCMHcNsU0Eb4AjJHFhM1opzQVkq9DqNF9F2K
 3+hAq11J4C3r1H5dbAf6BIpro/m/Ere+KE6QfRYzrfKDJG5LfMjPVB389+aBmwdejXyYR4e
 oa85ajNCA5fclBFViosNxoLkGI4deAQMIUmxPNjAdP+cdkj/bmQ13N+ev4s7TQsOqHDpRY/
 eMe/pNgUcAPttZgLCYATQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o1YSR9rzFCI=:jgDnK1hBT7TXge87+gIjLY
 SH1LcwCSrFgyWIZAxDkSR+RvNR3HfX7bZbLWCD9y/An6LOOMFFejr6d10LyZNWVLtvad/25lK
 8WQ23F59vklG19FGaI5ZK/SrnLZSVgwRWjEtsXjNMC9YvEp3x7ufXhDP3KgYUZKxXm3FROwvw
 +B5hAsYJ9l+LQH8DlllJ7cIFBuSyCPeURYModC8Spwq/6EOcKigdTGsfuK3hesWUHv2L2HC6N
 IKLpS+XMfCCSRd5EEBEhxj+erzZRnJXjOjSy6YCKolTDeJsWO+exlP51HmBxzPa+tym0gbL2F
 1rE6LGwH33cOgbR1bkCslsF3Z9diMX1b+4L/9RWTPJQ/H+1wtZScqq+oS2/CFl5UnqQxcn4ns
 pePjB6Gc/2jXtPoU35bDxLe1d3ihchJERnF8l8G4jjCSaJD2SAv9zzVWFcFQzYkcs3VYx/ha8
 n2yQKLmR6WhEhDxkVwcFsuin3NYTx6VBu4j0ZH9OM4BTcR8KC8nTqFio6nlUqNl5HrwxPhiu4
 C9ijZ4hCDjU0qPaLqAzWgLjhAu6GIcFi37ZV0MBxg/CUYIGKxETEH3lAUVmAGaipv6lG7wpuW
 Kz5r11QZY9rc54qmdrDkLh6SBIkI2C81nT85/fdbVBXSJHI191wtl7i6RIfGMUfuVvs0jJSKD
 RpRpxAJs+3HkVCwfFBEKz65wl6oon5qT9WYc1yn0xqBqRhEdmy0c6xSLsqaAWdmhv+vYrKHnl
 JnD8vbeaH7RMGfSOjlDiIl1lVgIer0E/RAcwqWlaBOpWqiXVdCKdU4byhAc0vIy2FE+UupWCN
 qrfE9fOIvLeOYNHRzFAKPi2JHnLrhoVZcw4mNr5FwdF/Z0blUDr0IiVC9BOfgGoBarxSCIAG9
 kvzrfCLDBF8rQfDQRCzbFNMd0V7SgNEhz5e1c9wy6+tbVp4lLt6L7BPVa07hthciXQ+iLQynl
 EkQPp1yu1I7bSX77qamxRxRHY8/HOXQYzPRyaxMAFnp4qC1pn0all
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 28, 2020 at 12:05 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> > drivers/char/hpet.c:675 hpet_ioctl() warn: check that 'info' doesn't leak information (struct has a hole after 'hi_timer')
>
> This one seems like a false positive.
>
> drivers/char/hpet.c:670:
>
>         mutex_lock(&hpet_mutex);
>         err = hpet_ioctl_common(file->private_data, cmd, arg, &info);
>         mutex_unlock(&hpet_mutex);
>
>         if ((cmd == HPET_INFO) && !err &&
>             (copy_to_user((void __user *)arg, &info, sizeof(info))))
>                 err = -EFAULT;
>
> `info` is only being copied to userspace when `cmd` is `HPET_INFO`.
> However, hpet_ioctl_common() is already doing memset() on `info` in
> `case HPET_INFO`:
>
> drivers/char/hpet.c:612:
>
>         case HPET_INFO:
>                 {
>                         memset(info, 0, sizeof(*info));
>                         ^^^^^^

Yes, makes sense.

      Arnd
