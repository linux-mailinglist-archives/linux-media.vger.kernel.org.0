Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7849C232DEA
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 10:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgG3IPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 04:15:50 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:45173 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729032AbgG3IPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 04:15:45 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MY6TD-1kHxuV1Fsr-00YUKZ; Thu, 30 Jul 2020 10:15:42 +0200
Received: by mail-qt1-f176.google.com with SMTP id x12so11210249qtp.1;
        Thu, 30 Jul 2020 01:15:42 -0700 (PDT)
X-Gm-Message-State: AOAM532Ly3J/00BP5r02+s9oIEYyILDMBnNb6VdzpkVQjuqGGB2a34S/
        HjU5XYYp2T2kz62PUS2Y/MOmGn9GZbML1uu8iY8=
X-Google-Smtp-Source: ABdhPJy9qE8d6D2vfgEVw6kVbtwQLGW5Rqh6b1z9O7UyiXPqU5prrGsm5t9N2iViOWRfC5+t73qPilDnnD91WD12O3g=
X-Received: by 2002:ac8:5195:: with SMTP id c21mr1813995qtn.304.1596096941108;
 Thu, 30 Jul 2020 01:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com> <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam> <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
In-Reply-To: <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 30 Jul 2020 10:15:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
Message-ID: <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rvPNdbTTV7PaspPk9G0gnb1jPuuq8fWQC4VHq/Sx6CBresvnL3l
 tNEWWc3/5FJzPB5NxQZx9mprgop9zm6vIYT5oXYqyEcivzLtClTQcMNu/tKCSRttoPHeW5R
 ZuUWB9ACTR2fx6p6M7ebBmo3KoffQQz386BmQQsmVmjnQdGrbpuqUvIf5JRzH14mKa3ijSy
 xcBemIrm27HsLeX/n3ItA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q+oEQ8b4lzY=:voa7ymqcQ0Gw85U92BLmZd
 WleBmJHJhjeTVct+sGqSmb5VHOd9vg/U8wdBAajs7qrFZlt5qlTnFYS0gEzA2TPN1V3+MCz+B
 F2weSfp8HPvbWAYsDOXAY6eellq9j4sfriTaNJDqavBrMHbMK7qAk2mKSCeYrElM9qncJVGhs
 gSBugGNqB/cAUCuXqpRhxDPRlMCgqO7k3bzV1aArzMLf+fScjWRoSY2CKrashR7z3WMtYJQiL
 hmLMFkddnSYtCbc/lEh/u+FnpY8265y5v942dBKeIYaq5J4/b+7QbMAKdZRBd0zZVgR1jv3if
 scHZqcDhQdXcBSnseeIM7QvwoFSt4yZXkPvfQ5LH/u2kYlm1MVK645BYoP5QD4v7OuKNdIiiZ
 uaD+iWMR4ovnrAG77oGPD6kvi1TGxQVxQyehqSGGXjyE05DEy9TQWFVbSlUUf0ELKtM5bCjky
 xDmS6Sqxo1kB0HTrQIRC9b7/qKRi3IC03hJlJBm+YXPBDYMgZKmvWF40Wmu7p57jRVDtIxGcM
 pCUrFhaN+QbqaJxd7Ub+UTdAKEXU/5F++8RcdCaJw+ZLB8jhvx/3d7C0uvdHX1GOLCfcb+0T1
 k8+zFwM89tRfQuePNbzt9ogYNtRS+RfCoAA9A7ygXGG1wzgQ8nKP4HvIFUQUTAihBxLLqHSPc
 itxHa+B64V/nQfYUCwsaZ4EQaUd1b9Da0eOMnAwNwBKVRPeoDOCDrODICrtfv9RTcTyCqorYN
 CX+K0IeMEqYdL/0bIRzuCsHZ9znEv6HWH7UiwebHXDhwP4lJ8i6Im22pjADK8uaOP5ewBLwUt
 OIrbKzXqm/X6PVa3IbYFofodkpjo3u4J0ZcKMkdODwvzNuOiHZ7OZYGaCbcFgWV2w0nqdlDxM
 V5Kb2oeCEUBcuTO2tlxOomO6jn3uPi5qy2R3EnWRWcAHXKcCxZlxNgVgTyYMWwOgj33bIWeMZ
 d/5pBDqXZl/6R+B4jZMeQcM12vo4bAdVRIj6RYOjpGJQBwQo3Lj5b
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 10:07 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Jul 28, 2020 at 3:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Jul 28, 2020 at 3:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > Something like
> >
> > static int lineevent_put_data(void __user *uptr, struct gpioevent_data *ge)
> > {
> > #ifdef __x86_64__
> >         /* i386 has no padding after 'id' */
> >         if (in_ia32_syscall()) {
> >                 struct {
> >                         compat_u64      timestamp __packed;
> >                         u32             id;
> >                 } compat_ge = { ge->timestamp, ge->id };
> >
> >                 if (copy_to_user(uptr, &compat_ge, sizeof(compat_ge)))
> >                         return -EFAULT;
> >
> >                 return sizeof(compat_ge);
> >         }
> > #endif
> >
> >         if (copy_to_user(uptr, ge, sizeof(*ge))
> >                 return -EFAULT;
> >
> >         return sizeof(*ge);
> > }
> >
> >        Arnd
>
> Hi Arnd,
>
> Andy actually had a patch for that but since this isn't a regression
> (it never worked), we decided to leave it as it is and get it right in
> v2 API.

I would argue that it needs to be fixed anyway, unless you also want
to remove the v1 interface for native mode. If this works on 32-bit
kernels, on 64-bit kernels with 64-bit user space and on compat
32-bit user space on 64-bit non-x86 architectures, I see no reason
to leave it broken specifically on x86 compat user space. There are
still reasons to use 32-bit x86 user space for low-memory machines
even though native i386 kernels are getting increasingly silly.

     Arnd
