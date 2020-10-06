Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D331284EBE
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 17:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgJFPUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 11:20:17 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:36089 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgJFPUQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 11:20:16 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MxEYY-1kakqt0YUC-00xaie; Tue, 06 Oct 2020 17:15:11 +0200
Received: by mail-qk1-f170.google.com with SMTP id q5so17062541qkc.2;
        Tue, 06 Oct 2020 08:15:10 -0700 (PDT)
X-Gm-Message-State: AOAM530UbBh1EQ1VU3hy+ZkkaI437DwpTJPzjz3rG/E8wM/MWMT9CIZK
        5MQiGA2efvc31NymD/BqtLUkgXnFK5JGCNu0dOI=
X-Google-Smtp-Source: ABdhPJxTpgArrfDQo8W5CK8nNZlKm7RcxTTiNBO5j8QFBSYk1wLZmZUcMy0G3P6Si2XG12LUKy8ETjtd5I7v2oNBuC8=
X-Received: by 2002:ae9:c30d:: with SMTP id n13mr5889944qkg.138.1601997309825;
 Tue, 06 Oct 2020 08:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200917152823.1241599-1-arnd@arndb.de> <cbbed130-3329-85a5-f360-3537391c1569@xs4all.nl>
In-Reply-To: <cbbed130-3329-85a5-f360-3537391c1569@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 6 Oct 2020 17:14:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3KCxSJyfoBe40_=Qjsmc_e-yJFVE9jzaTGBz7t76GBHQ@mail.gmail.com>
Message-ID: <CAK8P3a3KCxSJyfoBe40_=Qjsmc_e-yJFVE9jzaTGBz7t76GBHQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] media: v4l2: simplify compat ioctl handling
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FW9gGMIsqjHVgMZb8vYH5MGqjymQyRPnT2DGNU+cRK2Ad76ltxe
 R2CeApZNQVYruN7A7st6Ziuw+cPbzDTiTbfQ5U2CuGNNo4r+jmJPWB69YJfMHblTfewKK6C
 sMOhiyqMlXNCD6JsogUfsQQFGBZhUevD8IjhfzupCX5XJKSGqzc6PqH7mKrWvuKG1Yj7ShK
 XQvxaXszuTHXkZ48YoooA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XwI1XoyJ1Js=:716q04jo/ohZB3ZNvlU4rf
 58BuFg7wVZ3GcvURV2n6UpQcXBDLzs+8sgQqo6qayqUmm14Gfn/3Yq0SBHBeAtDqG0J1LBmI0
 eYb5IJF8QaszgObitY1WIn9ox1HFbI3zk/kmW/IUqRlEhpRpWdrIfBbJ1zjJOTtSvwbZEhs2+
 HdJBJ62200RhzqsLNuKtmAae3QSnbdm3RklIkBJBZlsmy+FJgcyWTuQ7ZEHaWA9eU3SD6rw2C
 h2Z4/kpWKdNg4HhS8P6i5PS3vbZ4dF0dr0yNJjRlTD4y918cofeYfTQ8LkmXgSSYTn6/7WosM
 RcVfaqPQiqwW6XmglFZM80UDqJLE6z/L3hSBIfti2B2EyGtaICnb07CrEI4TeioF2qzvPN1Sm
 6nwrQg6WStclIRhMo5BjHEBChR+1svaj/jr9K2G2zgwWBo5PD1vqqulRCTmW0JyObLvpMB1et
 QUDqU5sqVFFykVTFfEp7JQzjTzR+yFJ5WOx0EW5OsSv9lE+QrhJNmTV9Gc2TMEytQhSgPJV/c
 q9CAtRGtGH6ObE+VAO4qUnRmC2h0SmqNKO8ZUIEy8L2VQCTbxnbOqM9yyKjzo7fny09ZsiDA1
 f77MDN7Lyr3/AFEnLIirt2lo/n8NwJFUd3s6AxDWimLFtRuX92pmpTnPAA3bhOLUKfn0YS7i8
 w+CTrahIpjbK5YaeEzNp7dsmb5y/KIbA5ZYybdwP/m3GA1p65Dyhm47lrdqwb8x6gmZYDgk1q
 iXrxnabiHWeqPvtGBnUEyiAoggCJKvN2II+4kwgC83XZhHleTIPYnDpnbz3x4i3LCOKXgoOds
 RzDHv1K4Z+qbzH6enxRgVhfl7oeShrBK9DdBERJcUXyZ5JlLPTVvzZDuaywol96nVb0JN6z
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 2, 2020 at 4:32 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 17/09/2020 17:28, Arnd Bergmann wrote:

> While testing I found a lot of bugs. Below is a patch that sits on top
> of your series and fixes all the bugs:
>
> - put_v4l2_standard32: typo: p64->index -> p64->id
> - get_v4l2_plane32: typo: p64 -> plane32
>                     typo: duplicate bytesused: the 2nd should be 'length'
> - put_v4l2_plane32: typo: duplicate bytesused: the 2nd should be 'length'
> - get_v4l2_buffer32/get_v4l2_buffer32_time32: missing compat_ptr for vb32.m.userptr
> - get_v4l2_buffer32/get_v4l2_buffer32_time32: drop querybuf bool
> - put_v4l2_buffer32/put_v4l2_buffer32_time32: add uintptr_t cast for vb->m.userptr
> - get_v4l2_ext_controls32: typo: error_idx -> request_fd
> - put_v4l2_ext_controls32: typo: error_idx -> request_fd
> - v4l2_compat_translate_cmd: missing case VIDIOC_CREATE_BUFS32
> - v4l2_compat_translate_cmd: #ifdef CONFIG_COMPAT_32BIT_TIME for
>   case VIDIOC_DQEVENT32_TIME32 and return VIDIOC_DQEVENT
> - v4l2_compat_put_user: #ifdef CONFIG_COMPAT_32BIT_TIME for case VIDIOC_DQEVENT32_TIME32
> - v4l2_compat_get_array_args: typo: p64 -> b64
> - v4l2_compat_put_array_args: typo: p64 -> b64
> - video_get_user: make sure INFO_FL_CLEAR_MASK is honored, also when in_compat_syscall()
> - video_usercopy: err = v4l2_compat_put_array_args overwrote the original ioctl err value.
>   Handle this correctly.
>
> I've tested this as well with the y2038 compat mode (i686 with 64-bit time_t)
> and that too works fine.

I'm not too surprised that there were bugs, but I am a little shocked
at how much
I got wrong in the end. Thanks a lot for testing my series and fixing all of the
above!

I've carefully studied your changes and folded them into my series now.
Most of the changes were obvious in hindsight, just two things to comment on:

>  #ifdef CONFIG_COMPAT_32BIT_TIME
>  static int get_v4l2_buffer32_time32(struct v4l2_buffer *vb,
> -                                   struct v4l2_buffer32_time32 __user *arg,
> -                                   bool querybuf)
> +                                   struct v4l2_buffer32_time32 __user *arg)
>  {
>         struct v4l2_buffer32_time32 vb32;
>
> @@ -489,8 +484,6 @@ static int get_v4l2_buffer32_time32(struct v4l2_buffer *vb,
>         if (V4L2_TYPE_IS_MULTIPLANAR(vb->type))
>                 vb->m.planes = (void __force *)
>                                 compat_ptr(vb32.m.planes);
> -       if (querybuf)
> -               vb->request_fd = 0;
>
>         return 0;

It took me too long to understand what you changed here, as this depends
on your rewrite of video_get_user(). The new version definitely looks
cleaner. After folding in the video_get_user() changes, I've amended
that changelog of the "media: v4l2: prepare compat-ioctl rework" commit
with:

|    [...]
|    provide a location for reading and writing user space data from inside
|    of the generic video_usercopy() helper.
|
|    Hans Verkuil rewrote the video_get_user() function here to simplify
|    the zeroing of the extra input fields and fixed a couple of bugs in
|    the original implementation.
|
|    Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
|    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
|    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I could split that out into a separate patch if you prefer.

> @@ -1025,8 +1020,10 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
>  #ifdef CONFIG_X86_64
>         case VIDIOC_DQEVENT32:
>                 return put_v4l2_event32(parg, arg);
> +#ifdef CONFIG_COMPAT_32BIT_TIME
>         case VIDIOC_DQEVENT32_TIME32:
>                 return put_v4l2_event32_time32(parg, arg);
> +#endif
>  #endif
>         }
>         return 0;

I think this change requires adding another #ifdef around the
put_v4l2_event32_time32() definition, to avoid an "unused function"
warning. The #ifdef was already missing in the original version, but I
agree it makes sense to add it.

As you suggested earlier, I will resend the fixed series after -rc1
is out.

       Arnd
