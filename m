Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFCE10A098
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 15:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfKZOoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 09:44:02 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:50287 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfKZOoC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 09:44:02 -0500
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MIxmm-1iGQGI0lIo-00KPaf; Tue, 26 Nov 2019 15:44:00 +0100
Received: by mail-qt1-f174.google.com with SMTP id q8so18985162qtr.10;
        Tue, 26 Nov 2019 06:43:59 -0800 (PST)
X-Gm-Message-State: APjAAAVEEHufWk6ZOeZpqEg5ZuzkmH8tQ6tjfEbCmq1KddqYj9sX2Crx
        CtZ9UEKITgRey2Dy5xWIerJ78PolIu2AbVpj1tA=
X-Google-Smtp-Source: APXvYqzRjNzcbtyT8m8Js3ouqRwuywNkSzgoSbWGRTp68Xa/cFG4Ckp/M6kGXAKo5/MG+uIlcDuSE2MktCaWDNF8BHg=
X-Received: by 2002:aed:3fbc:: with SMTP id s57mr20247572qth.18.1574779438951;
 Tue, 26 Nov 2019 06:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20191111203835.2260382-1-arnd@arndb.de> <20191111203835.2260382-6-arnd@arndb.de>
 <272c471b-a7a9-c830-e19b-d1f19ee47073@xs4all.nl>
In-Reply-To: <272c471b-a7a9-c830-e19b-d1f19ee47073@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 26 Nov 2019 15:43:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3vHWBJU6EiUbRKJ01Zsv5E5Yfr+=h2Dg95atjvaHZ+Rg@mail.gmail.com>
Message-ID: <CAK8P3a3vHWBJU6EiUbRKJ01Zsv5E5Yfr+=h2Dg95atjvaHZ+Rg@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:sVf1GKu7Qs2YDYafC87hpBxta/ajrGexzYgpMCoRb6AVSelhaAK
 zl2sHsU460UbVkjFNFBbuAwqXjtc72k41YmVRt2fJL4s903LpkWZ5EFt/G+Kd4lVVuzeUeQ
 qEmrqlQ1dyVwW+7r2ljpxrH/MIZ3Fd8kB82OrkTS7VCDC0pqhEf9kMN6jj1NtUaGrQcmHfg
 VAlw1on7uVoRS4trRoBHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t+Q4V2GWkv4=:Y/MPRVz5xJpT10FLX+efh6
 29FLKGigzHLjaGdI3ib+NTvc1NRs1BDveuJEX/KyREJ/RbU5OO9deyArgj7beE7hexsY3i4rD
 36mHV3Rl6+B7apvVwxe9mr84roeItRJJZlCWo5piSpdlQn34tHrJ5IjRyXDTEU9af+YqOC79h
 UScGxWE7bZNXe0/BKPkF46Z8Gvl6cmEpY53F1g3cthl//BPm9bsEjHXoUTCaWK0Soru2flVV9
 kqbrBWSI2V4TA7MAuce5ja0t0JrBVakNuXfL/pOqxv0ZxdA1yuxFkGRsiAWtfo5zc7NC0MvGO
 JZStFxM9l+dij9TqxlaqHEIZbDfRhPMVoKXETQUgwwQNxtBUPCdlPl51d0WqEB9bxqU4fLtkT
 Og6lBzlZebsc+CYC2moYwOmlYgU4IidA+E76KcJvf4meOGqXR+N2FxMtBNIf8b5nJQ3/9Uu+G
 KnuZhOQ7BTcpJJeF3MmTsv7vTxgulMxhDgw0CwVrT9SiatVu35SmA/hFQwO6JkMJf5L5LLQ/L
 co93mQfvhbNH/KS/AwHYk0uXAO2RbzrrydX0uGIqBsehLC0tBLSrlTR+rtFetM3wqduYjZc8x
 8zsS5od8kNPK5BIABvZIWd9J9EjEvVSaqbrjXdXlfWnTjUt21giGJSVeQG3NK5DOuFhVcBcze
 XBCF1BmgKkCkFhLCsSHH9by5aB/NwvDHM9ftrF7JLfjp2l4H7OLG1tKHjILRXMhpjCsPM27jB
 xxnNDaoRzJ/kPZqVdVitr9wJ8THtFZ8RormoqZkLGQdwskWUz8Ua9z5js9IXlZlL7N1Mzfy91
 1HSNd9N3IaxU+8Bz17yI11CAAZFVEuZqoylQH9X5nnXq+YJjo/sv9t9F+8OuRsCdDBMmXTtyR
 7XAxwnuLpwAIk0e2ldZw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 25, 2019 at 3:40 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 11/11/19 9:38 PM, Arnd Bergmann wrote:

> >       switch (cmd) {
> > +#ifdef CONFIG_COMPAT_32BIT_TIME
> > +     case VIDIOC_DQEVENT_TIME32: {
> > +             struct v4l2_event_time32 ev32;
> > +             struct v4l2_event *ev = parg;
> > +
> > +             memcpy(&ev32, ev, offsetof(struct v4l2_event, timestamp));
> > +             ev32.timestamp.tv_sec = ev->timestamp.tv_sec;
> > +             ev32.timestamp.tv_nsec = ev->timestamp.tv_nsec;
> > +             memcpy(&ev32.id, &ev->id, sizeof(*ev) - offsetof(struct v4l2_event, id));
>
> This looks dangerous: due to 64-bit alignment requirements the
> v4l2_event struct may end with a 4-byte hole at the end of the struct,
> which you do not want to copy to ev32.
>
> I think it is safer to just copy id and reserved separately:
>
>                 ev32.id = ev->id;
>                 memcpy(ev32.reserved, ev->reserved, sizeof(ev->reserved));

Actually I think it's that's also bad: The padding in *ev must already be
cleared here (otherwise there is a leak of stack data in the kernel
already), so  *not* copying the padding requires at least adding a memset
upfront.

I would do the per-member copy like I did for v4l2_buffer in my
other reply:

                struct v4l2_event *ev = parg;
                struct v4l2_event_time32 ev32 = {
                        .type           = ev->type,
                        .pending        = ev->pending,
                        .sequence       = ev->sequence,
                        .timestamp.tv_sec  = ev->timestamp.tv_sec,
                        .timestamp.tv_nsec = ev->timestamp.tv_nsec,
                        .id             = ev->id,
                };

                memcpy(ev32.u, ev->u, sizeof(ev->u));
                memcpy(ev32.reserved, ev->reserved, sizeof(ev->reserved));

                if (copy_to_user(arg, &ev32, sizeof(ev32)))
                        return -EFAULT;

Unfortunately this is a little uglier because it still requires the two
memcpy() for the arrays, but I think it's good enough.

Any other ideas? Let me know if I should do a memset()
plus individual member copy instead.
> > +             if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > +                     return -ENOIOCTLCMD;
> > +
> > +             rval = v4l2_event_dequeue(vfh, &ev, file->f_flags & O_NONBLOCK);
> > +
> > +             memcpy(ev32, &ev, offsetof(struct v4l2_event, timestamp));
> > +             ev32->timestamp.tv_sec = ev.timestamp.tv_sec;
> > +             ev32->timestamp.tv_nsec = ev.timestamp.tv_nsec;
> > +             memcpy(&ev32->id, &ev.id,
> > +                    sizeof(ev) - offsetof(struct v4l2_event, id));
>
> Ditto.

Using the corresponding code here as well.

> > +
> >  #define V4L2_EVENT_SUB_FL_SEND_INITIAL               (1 << 0)
> >  #define V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK     (1 << 1)
> >
> > @@ -2486,6 +2515,7 @@ struct v4l2_create_buffers {
> >  #define      VIDIOC_S_DV_TIMINGS     _IOWR('V', 87, struct v4l2_dv_timings)
> >  #define      VIDIOC_G_DV_TIMINGS     _IOWR('V', 88, struct v4l2_dv_timings)
> >  #define      VIDIOC_DQEVENT           _IOR('V', 89, struct v4l2_event)
> > +#define      VIDIOC_DQEVENT_TIME32    _IOR('V', 89, struct v4l2_event_time32)
>
> Shouldn't this be under #ifdef __KERNEL__?
>
> And should this be in the public header at all? media/v4l2-ioctl.h might be a better
> place.

Done.

       Arnd
