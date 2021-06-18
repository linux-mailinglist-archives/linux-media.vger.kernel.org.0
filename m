Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E63A3AC913
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 12:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhFRKqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 06:46:10 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:57317 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhFRKqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 06:46:09 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1My2pz-1l5N0i0iPX-00zUJZ for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021
 12:43:59 +0200
Received: by mail-wr1-f53.google.com with SMTP id n7so10265124wri.3
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 03:43:59 -0700 (PDT)
X-Gm-Message-State: AOAM5319dIgBvz959zj9d9b3pConraGJ/VvOJwuHSb/Lww1/S789ykb3
        hMi4U/BT9OqO/66hYub2+oLGmf6FjYH3HLL7WJM=
X-Google-Smtp-Source: ABdhPJxuIGvy/nU7wg43kUKtzqP2fk265GUpWk9ZleA5Ax62vdKFIOlaBPQhILUBmmsHRrYIc3expMog+CE0qQgzpwk=
X-Received: by 2002:a5d:4e12:: with SMTP id p18mr12123850wrt.105.1624013038834;
 Fri, 18 Jun 2021 03:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000005ace4405bda4af71@google.com> <9c393beb-c45b-6dc3-9955-867c6abffdc4@I-love.SAKURA.ne.jp>
In-Reply-To: <9c393beb-c45b-6dc3-9955-867c6abffdc4@I-love.SAKURA.ne.jp>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 18 Jun 2021 12:41:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3=Cibm0qhijnLLWBTCK+z0r6CwkSm9zOYoc_Hjz-mDag@mail.gmail.com>
Message-ID: <CAK8P3a3=Cibm0qhijnLLWBTCK+z0r6CwkSm9zOYoc_Hjz-mDag@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-ioctl: explicitly initialize argument buffer
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        syzbot <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com>,
        Alexander Potapenko <glider@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fWrdMGsRJwo0TJTpGjHZUcnkWhT/ka9lH2hRZalcD/wGGtsuSoU
 8UwebbsMhIscEwNo8e5Sz0DfgitEzoNxv64D0t+BQqQGf/CFseWqSrh02CDnG0k3n93RnSi
 ZWRs2hsqrW+11ePyTvrYNp1UA3zzdzsTaWN6TsYdrG+fjVgMRL8YE2Guvj6qxM65MDdlM/l
 7sYfQYdL1VpBmq0I1oUCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BW76viOhsfU=:BHE7VYZmn6qKh/mLGHFd9G
 0pxK1ppuC1WOAABmg04741IDE0s+mOuFudcuAMoZmyWkuCdwTpBS/4ew9Pu/8bJN2BHQ5VfMd
 4FGxdl1KHsMO7NFQRNKLlju2OIKJMBjK1YbN1o45wyZH/ZgN3iYniYBJ8/67JT6x8XX0usvzg
 +/IXjgh+eiY7GjbZOGZISzLCED3Z8DDNR+D13e9g71B/HxmqnDnng/XeUoyxcbSi2y7SJBZKw
 JtTq0Edn0p4fUeOiw0vBTsHE6qnNN1XzfoJ/s2kq3cfodx0qm6U3KjnjS8KidZJF7SQiDzALE
 YFpN5Fhb6kXjJoqWBPUsszjQnDJsNWmXKqFu4Apg49PRxRfUOwlg07AlMgNvzWXygzH6K49Xn
 Cx7jdnOJsNHsaLibd7bF3mTMD3k0nSVZLC2cjLrRcUVxER/g4JJVQLEH0T6k4lHO+DEcatfok
 pl1i1kZkNsHRQicz8EIv1O1DN88+tlffgSFuYiXv4TeNL32p7jBWyiGjWjFuqSqO/BSEBSu/E
 f2tq6ThL2kIIskQSBKwJrs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 18, 2021 at 12:34 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> KMSAN complains that ioctl(VIDIOC_QUERYBUF_TIME32) copies uninitialized
> kernel stack memory to userspace [1], for video_usercopy() calls
> copy_to_user() even if __video_do_ioctl() returned -EINVAL error.
>
> Generally, copy_to_user() needn't be called when there was an error.
> But video_usercopy() has always_copy logic which forces copy_to_user().
> Therefore, instead of not calling copy_to_user(), explicitly initialize
> argument buffer.
>
>   ----------
>   /* Compile for 32bit userspace and run on 64bit kernel. */
>   #include <sys/types.h>
>   #include <sys/stat.h>
>   #include <fcntl.h>
>   #include <sys/ioctl.h>
>   #define VIDIOC_QUERYBUF_TIME32 0xc0505609
>
>   int main(int argc, char *argv[])
>   {
>           char buf[128] = { };
>
>           ioctl(open("/dev/video0", O_RDONLY), VIDIOC_QUERYBUF_TIME32, &buf);
>           return 0;
>   }
>   ----------
>
> Link: https://syzkaller.appspot.com/bug?id=eb945b02a7b3060a8a60dab673c02f3ab20a048b [1]
> Reported-by: syzbot <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

This should no longer be necessary once my recent patches propagate
into linux-next,
see https://patchwork.linuxtv.org/project/linux-media/list/?series=5678&state=*

      Arnd
