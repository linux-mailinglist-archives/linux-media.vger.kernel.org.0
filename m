Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CA7233361
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 15:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgG3Nta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 09:49:30 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39211 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgG3Nt3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 09:49:29 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M7JvQ-1k8qZm0vgC-007oJg; Thu, 30 Jul 2020 15:49:26 +0200
Received: by mail-qt1-f178.google.com with SMTP id s23so20305529qtq.12;
        Thu, 30 Jul 2020 06:49:25 -0700 (PDT)
X-Gm-Message-State: AOAM533BMn694DConxOl9d3hpveys2uKfWHhCH4VJMHP/BuqPLu67ulP
        oOErG67Wk6fJ4GggcbgMxk2Ityg9neRED9OnB2g=
X-Google-Smtp-Source: ABdhPJxYt4H9vHzfASu+mtn83yjSQoOpA3J4Tjf50fTb26SWJsSPR5JCjW96j8TGyMZE7WFUEvwkFXswX6oFLGrVaRE=
X-Received: by 2002:aed:2946:: with SMTP id s64mr3072428qtd.204.1596116965004;
 Thu, 30 Jul 2020 06:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam> <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
 <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
 <20200730083833.GD3703480@smile.fi.intel.com> <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
 <20200730114842.GH3703480@smile.fi.intel.com>
In-Reply-To: <20200730114842.GH3703480@smile.fi.intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 30 Jul 2020 15:49:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2L1yK=XuS5vGj-einsNKU99ZdX53Ao5TUfc7_WU-LOYA@mail.gmail.com>
Message-ID: <CAK8P3a2L1yK=XuS5vGj-einsNKU99ZdX53Ao5TUfc7_WU-LOYA@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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
X-Provags-ID: V03:K1:4L8J6U7u4enMispHGwLPSaPdYn/3ag24Ug7NY8p+/yQf2qTb+A0
 H4ZCK7qUorpCmcWBV6zNckHjpPaCX6hIYOxi/mzodf2FLXeG6r7+BItc1RahU+89xVkEhoX
 tlyma2oxQqAzKJKlCPrU49rXpS5Rp2wS9g+cMUX6FnEgHXcbZ4b6skOhkIpBJJhNttfXuED
 rj2ljDoR3WlpToDR1FJfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ixAp1TSKQ9o=:lfxiAtY+WA2NeLrtT8BIe7
 y2NCq/AYh/izuO/j2j2tgr/mOkAYTF1F61UGPqtqKgD3SdpXLiMRu4f5RS9u0WFOeC98wTECO
 yv/qN9zj1uUqtFqmXmaFc6VKIxeS0h6RXpcDVvdwEDsgGX/d5JqlOwLich9AeUcoiJKmeRXNz
 hLI9t9mM5Ia/C/p1Ljls544WtMO89761OCJtrHyXbtBqQS+ocFxm9Txw8jEWaa3JjMpbW3npt
 0m4ktsMvi4IKROQ+ly84giRSq+PiTDfMtUyl3VSPIpfpgLoRJKCrr0VERRPbnya6m+SP/QMTa
 NZiv2bkex2vVOw1HVjsSZQYXKgwN+XliVlEhEyOwCt7FIlGMGA0Ni5gYAu1T84fHB2tUMiZ6r
 Rh6m9cKZQPKqcIVTaYkzTgvyBz2n0uw3LiSVhjOAPXeXr0lyHnpreLOGMyTfiRLCjFbn5hlaF
 K6ZFcFP5QiXw39OLY8Tsrn8joLoYWQ9gM6sjUDFp+Lk4XG2YZu1V82Y7Zod3+vBldx2piLmFU
 K0+6WMo8eb653bboZbER1CH+j/WclHd9LUUqzXsOzYggqpt/vNjvjeYcBBz9VZSoN79+lCyfS
 11tLXlSe/inMa3B04PSMpZj6X2oqeRCBD4dfzeubks3OK4Aa8QBqt3RgwFtUXTgErMTv0dqjP
 /SFhLZf/VEaFWE9OM30/LLnqt1ttidERnzxfgtB73HljOzdTOGnLtAIOrfwPZZKsfdASu7snO
 nhSYBHM88Sm079y7Kw4zGp75vpEotnF37JNj7ZAfy0cSGKLYisKA8S8v1aBcDY6rKO/82gob8
 sbgwU/LRQUpDy0Hsm2kbHtRtGyE666sxoW4AN7PdZ/5WYziuGTo54Gu+k6IcgrUg1kB8uZ1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 1:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Jul 30, 2020 at 11:18:04AM +0200, Arnd Bergmann wrote:
> > The in_ia32_syscall() check should be completely reliable in telling whether
> > we are called from read() by an ia32 task or not, and we use the same
> > logic for input_event, which has a similar problem (on all compat architectures,
> > not just x86).
>
> By the way any reason why we have to have in_ia32_syscall() instead of
> in_compat_syscall()?

x86 is the only architecture that has different struct alignment between 32-bit
and 64-bit processes, so others don't have this particular problem. On top of
that, x86 also has two different 32-bit ABIs and only one of them needs the
workaround, while the other (x32) uses the same struct layout as x86-64 and
must use the normal code path.

       Arnd
