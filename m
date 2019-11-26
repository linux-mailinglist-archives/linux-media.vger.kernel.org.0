Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF99109F89
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 14:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfKZNua (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 08:50:30 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:58329 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfKZNua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 08:50:30 -0500
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MlNYj-1i5iON0V4v-00lpy1; Tue, 26 Nov 2019 14:50:26 +0100
Received: by mail-qv1-f51.google.com with SMTP id c2so105454qvp.12;
        Tue, 26 Nov 2019 05:50:25 -0800 (PST)
X-Gm-Message-State: APjAAAX3yZ7DUZaoCSoYXeIpqZq6KlrdE0LMcuZqnvIg4FXgv+cABkUQ
        H52RMpORTM6lPck82I/8U9Ah8wihbpSiuXhwAFQ=
X-Google-Smtp-Source: APXvYqx1kEUjMhBoyWfGDOcVEf9yxBeeeOF62PdlbrKEp0MnUNCK+3SzKhfm0UM+3l5go75Yd40xWBGDk2wdx7QuWXg=
X-Received: by 2002:a05:6214:811:: with SMTP id df17mr15666880qvb.197.1574776224821;
 Tue, 26 Nov 2019 05:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20191111203835.2260382-1-arnd@arndb.de> <20191111203835.2260382-7-arnd@arndb.de>
 <d54c82b5-21b7-2d5e-ad0b-206527ad2768@xs4all.nl>
In-Reply-To: <d54c82b5-21b7-2d5e-ad0b-206527ad2768@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 26 Nov 2019 14:50:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0rom6x4X8eH0zknfZ5=6_rrXGKGR4H+RiY4SWKbXfp=g@mail.gmail.com>
Message-ID: <CAK8P3a0rom6x4X8eH0zknfZ5=6_rrXGKGR4H+RiY4SWKbXfp=g@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jnSSMN6vdSxwYv1na6uurqJRzOiUJ36xJ/yJRTCW45aYTgUoZqV
 pAzqr/S4arqUzgy0WqlS/r0TseIgQNGoavCJuWLp+fv+1c1F00sV1ke8mDEFPkLtHUoQWd5
 6OrDfyeim4tDQMwDXSc9DJctEUcJuAFIEvJkcCefMh2bFIhHuPtyTmcxLLIVqmlTr7t+8jQ
 t0sG0qBkTMjGihMIbSZPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vdKusKFyMok=:xbX6PN+6Oc9mRNbptd9iIe
 Ai6wE/DCIRMtnGQhneDTEMboZ0wQY2ssucY5kXrvUMpIcu5XXGx8HZSMlibin/tbI+RyDQC/u
 QjFZMS9pN3CdgojLTSs9Ryp6n8aXc1GvB+VmObWiGx131TjWykuyuU2TXvjrJy8HXWNa1LXKE
 OTTvJ9BFYlQHz/SnpVTIYtpVWpDBQ4ayBZWlK3+Bj/sl+d0sMBYAZbI+wnFfwv1Mm51wcHk/Q
 e9MThMNcB9jGI27I3m0YkYmeTVGM868pXzIkHhxv1kjvFkOdtJnhgLcC45y1YPOuEXHq8zEqn
 c/tN3OxJLAFmLuQd/neydeuCFpVLhPHnY7hYqZJp/nDfbwrwPDWj6Q9+SjCCwvkePFHh/ACli
 8soUjCnojJMzw9GFJskRq7SR16pyDHjFQMMFCiwkIjiy3DgeRyftDO+qbI0aIuYeo6wBfbfiI
 KASe8jNsHSXXzVmaBJhQT/EsbdFxQAQcXKCkS3ix8pBlG6LGzg57DhRuy04GbY1TABKDgMUow
 T2hTS0gMtt055Ta5n7nv1/VVFkgk36kGuPWufF8kio1VyB1LY+Ize9Zgwxh+4uzCHLugViRTl
 YtUG+hmdqu0w/99MrGtSOhHF2kXpz24tCUUmNEFbOvgHnaX3Vy4jY/NXIOYu5mDoQWkixJ7le
 yBoV0dMtc7fvALlKB6dJw9EmyvGOpKqEe106ufX9ay5cfZoV+WlUCpnXiD6R234O2nRkRMhem
 r0jdsI5IN4n5rz32UyebszjUZFGcm5WUq6ZU2fmNLwHpJzi/o+Vt0wSv/OZzxvcKOMfA28KYo
 QMeYGaPr1ksv/XFGwVv0sk+ukTWQ7W5uoQlaThAAnpSQLFNQAYS5+4742ZS8UNhHrHB/aoDiD
 3lf3C3f9y2tCWCLc5ZGg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 25, 2019 at 3:57 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 11/11/19 9:38 PM, Arnd Bergmann wrote:

> >       switch (cmd) {
> > +#ifdef COMPAT_32BIT_TIME
> > +     case VIDIOC_QUERYBUF_TIME32:
> > +     case VIDIOC_QBUF_TIME32:
> > +     case VIDIOC_DQBUF_TIME32:
> > +     case VIDIOC_PREPARE_BUF_TIME32: {
> > +             struct v4l2_buffer_time32 vb32;
> > +             struct v4l2_buffer *vb = parg;
> > +
> > +             if (copy_from_user(&vb32, arg, sizeof(vb32)))
> > +                     return -EFAULT;
> > +
> > +             memcpy(vb, &vb32, offsetof(struct v4l2_buffer, timestamp));
> > +             vb->timestamp.tv_sec = vb32.timestamp.tv_sec;
> > +             vb->timestamp.tv_usec = vb32.timestamp.tv_usec;
> > +             memcpy(&vb->timecode, &vb32.timecode,
> > +                    sizeof(*vb) - offsetof(struct v4l2_buffer, timecode));
>
> I have similar concerns as with dqevent about whether this memcpy is the right approach.
> Unless you can prove with a utility like pahole that this memcpy is safe.

This is the video_get_user() function, so the input data comes from user
space and gets copied into the kernel, which has to check each field for
validity already, so I think this is safe regardless of the padding (which
exists before the 64-bit timestamp on 32-bit architectures). The fields
match because the definition of all members other than the timeval is
the same.

On the other hand, I agree it's not obvious from the code why this
is correct. I've changed my copy to this version below now, do you like
that better?

                struct v4l2_buffer_time32 vb32;
                struct v4l2_buffer *vb = parg;

                if (copy_from_user(&vb32, arg, sizeof(vb32)))
                        return -EFAULT;

                *vb = (struct v4l2_buffer) {
                        .index          = vb32.index,
                        .type           = vb32.type,
                        .bytesused      = vb32.bytesused,
                        .flags          = vb32.flags,
                        .field          = vb32.field,
                        .timestamp.tv_sec       = vb32.timestamp.tv_sec,
                        .timestamp.tv_usec      = vb32.timestamp.tv_usec,
                        .timecode       = vb32.timecode,
                        .memory         = vb32.memory,
                        .m.userptr      = vb32.usercopy,
                        .length         = vb32.length,
                        .request_fd     = vb32.request_fd,
                };

                if (cmd == VIDIOC_QUERYBUF_TIME32)
                        memset(&vb->length, 0, sizeof(*vb) -
                               offsetof(struct v4l2_buffer, length));

This way, all padding is zeroed out, and it's obvious to human
readers that each field gets set in the correct location.

> > +             memcpy(&vb32, vb, offsetof(struct v4l2_buffer, timestamp));
> > +             vb32.timestamp.tv_sec = vb->timestamp.tv_sec;
> > +             vb32.timestamp.tv_usec = vb->timestamp.tv_usec;
> > +             memcpy(&vb32.timecode, &vb->timecode,
> > +                    sizeof(*vb) - offsetof(struct v4l2_buffer, timecode));
>
> Ditto.

This is my new version:

                struct v4l2_buffer *vb = parg;
                struct v4l2_buffer_time32 vb32 = {
                        .index          = vb->index,
                        .type           = vb->type,
                        .bytesused      = vb->bytesused,
                        .flags          = vb->flags,
                        .field          = vb->field,
                        .timestamp.tv_sec       = vb->timestamp.tv_sec,
                        .timestamp.tv_usec      = vb->timestamp.tv_usec,
                        .timecode       = vb->timecode,
                        .memory         = vb->memory,
                        .m.userptr      = vb->usercopy,
                        .length         = vb->length,
                        .request_fd     = vb->request_fd,
                };

                if (copy_to_user(arg, &vb32, sizeof(vb32)))
                        return -EFAULT;

> >       __u32                   field;
> > +#ifdef __KERNEL__
> > +     /* match glibc timeval64 format */
> > +     struct {
> > +             long long       tv_sec;
> > +# if defined(__sparc__) && defined(__arch64__)
> > +             int             tv_usec;
> > +             int             __pad;
> > +# else
> > +             long long       tv_usec;
> > +# endif
> > +     } timestamp;
>
> Ewww!
>
> Are there more places where this is needed? If so, then I very much prefer
> that a __kernel_timeval struct is defined somewhere, with appropriate
> comments.

I was trying hard to avoid adding a modern version of timeval, because
all new code should be encouraged to use __kernel_timespec instead.

There are not many users of timeval in the uapi, and this is the last one
after the others all got invididual treatment.

Usually what I would do is to have a kernel-internal type based
on timespec or u64, and then define three uapi types:
old native (based on __kernel_old_timeval), old compat (using
old_timeval32) and the new type with 64-bit time_t.

The problem with v4l2_buffer is that it includes another
compat-incompatible field (m.userptr) and that it's passed
between kernel functions, so then I'd probably need five variants
of it in total, and it would slow down the common case (64-bit
native) because it would require an extra copy.

I can try a few more things here, but I don't expect to find anything
much better than this.

> > +#ifdef __KERNEL__
> > +struct v4l2_buffer_time32 {
> > +     __u32                   index;
> > +     __u32                   type;
> > +     __u32                   bytesused;
> > +     __u32                   flags;
> > +     __u32                   field;
> > +     struct old_timeval32    timestamp;
> >       struct v4l2_timecode    timecode;
> >       __u32                   sequence;
> >
> > @@ -1009,6 +1049,7 @@ struct v4l2_buffer {
> >               __u32           reserved;
> >       };
> >  };
> > +#endif
>
> Can this be moved to v4l2-ioctls.h?

done.

> >  #ifndef __KERNEL__
> >  /**
> > @@ -2446,12 +2487,15 @@ struct v4l2_create_buffers {
> >  #define VIDIOC_S_FMT         _IOWR('V',  5, struct v4l2_format)
> >  #define VIDIOC_REQBUFS               _IOWR('V',  8, struct v4l2_requestbuffers)
> >  #define VIDIOC_QUERYBUF              _IOWR('V',  9, struct v4l2_buffer)
> > +#define VIDIOC_QUERYBUF_TIME32       _IOWR('V',  9, struct v4l2_buffer_time32)
>
> And all these should be moved there as well.

done.

      Arnd
