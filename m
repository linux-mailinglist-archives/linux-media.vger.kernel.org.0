Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1593812012D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 10:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbfLPJ3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 04:29:47 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34195 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfLPJ3q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 04:29:46 -0500
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N2VGj-1hhYJD19WJ-013uuD; Mon, 16 Dec 2019 10:29:44 +0100
Received: by mail-qk1-f175.google.com with SMTP id d71so2800146qkc.0;
        Mon, 16 Dec 2019 01:29:44 -0800 (PST)
X-Gm-Message-State: APjAAAUmD99gNhBhSIse8KvXNC0UwITT/5m9w+RIEGEf6HSAS3kLOE/g
        AZis8ZNqC0gX9zuSsZ0Hpby32BCgx3xvnYYqJeQ=
X-Google-Smtp-Source: APXvYqwnX6GlvO6u8+bfvMVIUZ/oU7KPTuY3yjqtkcSioLIbKvJ9U7ZGkD5hdoKheQF7tMorZJqulXowNmumIyY72aQ=
X-Received: by 2002:a37:84a:: with SMTP id 71mr25200404qki.138.1576488583018;
 Mon, 16 Dec 2019 01:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20191126161824.337724-1-arnd@arndb.de> <20191126161824.337724-7-arnd@arndb.de>
 <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl> <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
 <81bb5da1-6b84-8473-4ada-c174f43bbae2@xs4all.nl> <0843718f-1391-3379-38be-41fa9558ea6d@xs4all.nl>
 <CAK8P3a1-xLUn368Lajia1=2GEXa92srQ2s9wH--MrRHj+kSTtQ@mail.gmail.com> <bfc18778-0777-ad49-619b-39e1b9b536f3@xs4all.nl>
In-Reply-To: <bfc18778-0777-ad49-619b-39e1b9b536f3@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 16 Dec 2019 10:29:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ZwMgXqjAjh7P8B2BR4THd-rMZM0jt5KvxHtxNF_8Nqw@mail.gmail.com>
Message-ID: <CAK8P3a0ZwMgXqjAjh7P8B2BR4THd-rMZM0jt5KvxHtxNF_8Nqw@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        me@zv.io
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:izcqn5yCqAbKl1aTSEnkyBrDhaZyDuMITo0e7+Jdxn8yuW9+PYe
 23wueq+RMNK5ajhGuBbQZPUj5cIMTLpVZXuMZ22YVe/vH51PAlxwEwvXbwwDG5pdAuyDX6I
 2cIegC0wXGN0yzzV2FNXe2CXyqADxJwk21JBRXLN8Sid9MP7VTBJ3RnwESQP0nSSYnr3jw9
 tkOpusrozO+qXY1LrKkyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rP/qqRmI8Oc=:9S8evxqS+v2s511xsqA+OL
 Iuvsn58l4UUhfgFESElot5N+0q5Zgm0yAboQZsikrRgBMeudslXjxxN+wjsbcCBnu4qV8FLlc
 GU314BVk4eqcZNo+KecXnrLJOxRF0kMkaU4+21Tkb0lNsgpu1+sPF/VonOT74sOsISzHXP0Jg
 6NsYUQ1FzBfudi2mP0OP+lhSGu+TBiSBEjZaeE0ImFNjK7+/qsRu5rh+fyZqtxd/znuhFG+Im
 T2vJXokFCc1rBGE4wl6w/afglZNnXNhT2GA+LyEVEotkIMywkxAQ+cnAYdcujZrh8eeH64QkI
 B4FqKh/zKrpU6s+pUOIiCQEdDe4Ld7tc3isU+3hW2JPi6+C0kKAQphNTOa5rJcBl0kTa8ltNC
 zeqfrOV9Bggh9Tm07TuPQt1radpwRBfhuAG+rMCV6wgDKlgXTKY/eReLlAwuuUbW37GKNDkAI
 fZvAkNsueuGopwjS9/VaiQZN5AxG4FknIUMlPYnUSHPWa7YsZWdXrkG24w0EZsg0r+vV4Q3YO
 Mau2c2VVK2ICN9NMOhgTKaSMFNCCDsz5zXBHcha8Zs6D0IgNC4sCJG53+gZgN+z9VYLDnuOj+
 mwOv/VKaaAMHoyo7gkLwWnW2+hoYQBwOLIczPVqYe/5zLLgMN2M2dT43MhKDtAop3Vqms6HbL
 mI57UrCKwsAzV9n0menRlL31YkxL1wsC8IeClbZwiDMPU/XP+iVd6/iIVwI28jPKqY0wJ6IQ2
 uyt5iqGW0EFn9DR9HUmwEcKtNTk6KG7v95hggD3s4WHJL8czQKlxZbRiqplrCMC+mG2DJ+fRj
 VHxYlQ7rrt5fQqJ4AfLyhrq2bITUc2d1XKyLzPznYaOKk6pc2E2jhZ8WzUCKEZ7HIiJCOtX0v
 M3UffePl5R124yrzY3Bw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Dec 15, 2019 at 6:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Ah, great, that worked, after applying the patch below.
>
> Both struct v4l2_buffer32 and v4l2_event32 need to be packed, otherwise you would
> get an additional 4 bytes since the 64 bit compiler wants to align the 8 byte tv_secs
> to an 8 byte boundary. But that's not what the i686 compiler does.

Thanks so much for the testing and finding this issue. It would be much more
embarrassing to find it later, given that I explained how it's supposed to work
in the comment above v4l2_event32 and in the documentation I just submitted
but got it wrong anyway ;-)

> If I remember correctly, packed is only needed for CONFIG_X86_64.

Correct.

> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 3bbf47d950e0..c01492cf6160 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -492,7 +492,11 @@ struct v4l2_buffer32 {
>         __u32                   length;
>         __u32                   reserved2;
>         __s32                   request_fd;
> +#ifdef CONFIG_X86_64
> +} __attribute__ ((packed));
> +#else
>  };
> +#endif

I would prefer to write it like this instead to avoid the #ifdef, the
effect should
be the same:

--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -475,8 +475,8 @@ struct v4l2_buffer32 {
        __u32                   flags;
        __u32                   field;  /* enum v4l2_field */
        struct {
-               long long       tv_sec;
-               long long       tv_usec;
+               compat_s64      tv_sec;
+               compat_s64      tv_usec;
        }                       timestamp;
        struct v4l2_timecode    timecode;
        __u32                   sequence;
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -1277,7 +1277,10 @@ struct v4l2_event32 {
        } u;
        __u32                           pending;
        __u32                           sequence;
-       struct __kernel_timespec        timestamp;
+       struct {
+               compat_s64              tv_sec;
+               compat_s64              tv_usec;
+       } timestamp;
        __u32                           id;
        __u32                           reserved[8];
 };

If you agree, I'll push out a modified branch with that version and send out
that series to the list again.

There is one more complication that I just noticed: The "struct v4l2_buffer32"
definition has always been defined in a way that works for i386 user space
but is broken for x32 user space. The version I used accidentally fixed x32
while breaking i386. With the change above, it's back to missing x32 support
(so nothing changed).

There is no way to fix the uapi definition of v4l2_buffer to have x32 and i386
use the same format, because applications may be using old headers, but
I suppose I could add yet another version of the struct to correctly deal with
x32, or just add a comment like

--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -468,6 +468,10 @@ struct v4l2_plane32 {
        __u32                   reserved[11];
 };

+/*
+ * This is correct for all architectures including i386, but not x32,
+ * which has different alignment requirements for timestamp
+ */
 struct v4l2_buffer32 {
        __u32                   index;
        __u32                   type;   /* enum v4l2_buf_type */


      Arnd
