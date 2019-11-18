Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB3C100246
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 11:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfKRKVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 05:21:07 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43600 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRKVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 05:21:06 -0500
Received: by mail-qk1-f196.google.com with SMTP id z23so13848046qkj.10
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 02:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p9A0HQCTWo8IkEueIZ8gvaKdgMnDvJwnr6rC9+7dHTk=;
        b=pZUgrpV46Ejm0ly4g2aa4VANJRCg3njcAsKTWBbzIkV7v9jrgEa/PHjr/+JzVDC8XX
         xoXyCSlhJE0y1crHp0Q5hKtD3Md0iRErVhRhpa/5F7yWbVv4QN/kqYwuZkcDOAyc+6lX
         KIhrHYNvx9YB/+5SrEffvrOHh9LtC9awGCoJwh2KTULBsXA0Bgs4167r9HXcoIfvKzdL
         ppOh4RO1J6+dHQS4xGdYKEicbzBI1I7fRTame0sJT1y613dkEEB28MEMh12MUmCWrfTt
         PIKw2rYNgqGh1eU9ZNGBpo5WNmqblA0HGiqysXDym0ap0j1STzqEaSSoMU3lUXu8NMlN
         p8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p9A0HQCTWo8IkEueIZ8gvaKdgMnDvJwnr6rC9+7dHTk=;
        b=jVdye0CQeBKpF0j3j+ZBADXeZNXYkWpZ8xrq/E9z73vUyQPwTlx4qY6TUOcvXxMqdA
         XEQlwlCLlVucL6b6hJe0ZpRW48DUfMi/O6xEYhdh3WNjcZf9yzhe5EzCxOFBgBvwrBhR
         tbYgV1FZYRGe4RFgZaUoOPRXdMXiG7Rp5WjkO+AUoBE2cJ6G5FgGUOynIIOtgkIJ3jQ0
         xt8UuONXOZKNRyi2/Z/N3l3Tf1dP5P+NhLr0FcAxQ5CjezU9fAbPobPfpab2iAKO/kkt
         W/nFa/NEBiNI3HPTpN7ruSr9Ld6BUa6/vGjxclDHO8kez3bIHGN+2EdlvHMQYu7gAVwj
         ztQQ==
X-Gm-Message-State: APjAAAXBxGweG6Jmmhci4VdpNRP5JbkyovtweupTKgM0BWzC2VKmsbKx
        Bj+LJN5386hYs2fgdXl78EIboEbpCHJ8g9ZE/MQ=
X-Google-Smtp-Source: APXvYqz48LbupXsRKsNJSGUqZn5aPb6LZVEB2oQg4AmlOsDZF8A3gLq6CbqzGhMwrDu+IyOPXG6rlv01vOsPaMddWxA=
X-Received: by 2002:a05:620a:14a2:: with SMTP id x2mr23572703qkj.236.1574072465398;
 Mon, 18 Nov 2019 02:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org> <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
 <CADMs+9ZrfEt4QfCM9pC243KTejvbORQ-Nzo0eHjU0FJ8y-2kwQ@mail.gmail.com>
 <CAJSP0QUF1YA0c7b2ENeDLo1T9OsfeTJbonOYug5Fc56--YqZJQ@mail.gmail.com>
 <CAAFQd5C6mVEUQUP8-=GevM+rV1ksFg68kyWAjCj+cjB-iQiXaA@mail.gmail.com>
 <CAJSP0QXk9XkrOeiMZ=yQCbStkXATv+AUwqqGDfcSbqL05j1kbg@mail.gmail.com> <CAAFQd5DBiUta9HWYZX3N06J8bSqa=zBQvL5kdCLfWUfsf9s9Vw@mail.gmail.com>
In-Reply-To: <CAAFQd5DBiUta9HWYZX3N06J8bSqa=zBQvL5kdCLfWUfsf9s9Vw@mail.gmail.com>
From:   Stefan Hajnoczi <stefanha@gmail.com>
Date:   Mon, 18 Nov 2019 10:20:54 +0000
Message-ID: <CAJSP0QX6ajvKpU6k6i6uBFwc9gFWoYGa6HZn7AfbGr9+975=WQ@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>, geoff@hostfission.com,
        virtio-dev@lists.oasis-open.org, Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel <qemu-devel@nongnu.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 9, 2019 at 3:12 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Sat, Nov 9, 2019 at 9:08 PM Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> >
> > On Sat, Nov 9, 2019 at 12:17 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > On Sat, Nov 9, 2019 at 7:12 PM Stefan Hajnoczi <stefanha@gmail.com> w=
rote:
> > > > On Sat, Nov 9, 2019 at 2:41 AM St=C3=A9phane Marchesin <marcheu@chr=
omium.org> wrote:
> > > > > On Thu, Nov 7, 2019 at 11:35 PM Stefan Hajnoczi <stefanha@gmail.c=
om> wrote:
> > > > > > On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.com=
> wrote:
> > > > > > > > > Adding a list of common properties to the spec certainly =
makes sense,
> > > > > > > > > so everybody uses the same names.  Adding struct-ed prope=
rties for
> > > > > > > > > common use cases might be useful too.
> > > > > > > >
> > > > > > > > Why not define VIRTIO devices for wayland and friends?
> > > > > > >
> > > > > > > There is an out-of-tree implementation of that, so yes, that =
surely is
> > > > > > > an option.
> > > > > > >
> > > > > > > Wayland needs (a) shared buffers, mostly for gfx data, and (b=
) a stream
> > > > > > > pipe as control channel.  Pretty much the same for X11, excep=
t that
> > > > > > > shared buffers are optional because the X protocol can also s=
queeze all
> > > > > > > display updates through the stream pipe.
> > > > > > >
> > > > > > > So, if you want allow guests talk to the host display server =
you can run
> > > > > > > the stream pipe over vsock.  But there is nothing for the sha=
red
> > > > > > > buffers ...
> > > > > > >
> > > > > > > We could replicate vsock functionality elsewhere.  I think th=
at happened
> > > > > > > in the out-of-tree virtio-wayland implementation.  There also=
 was some
> > > > > > > discussion about adding streams to virtio-gpu, slightly pimpe=
d up so you
> > > > > > > can easily pass around virtio-gpu resource references for buf=
fer
> > > > > > > sharing.  But given that getting vsock right isn't exactly tr=
ivial
> > > > > > > (consider all the fairness issues when multiplexing multiple =
streams
> > > > > > > over a virtqueue for example) I don't think this is a good pl=
an.
> > > > > >
> > > > > > I also think vsock isn't the right fit.
> > > > > >
> > > > >
> > > > > +1 we are using vsock right now and we have a few pains because o=
f it.
> > > > >
> > > > > I think the high-level problem is that because it is a side chann=
el,
> > > > > we don't see everything that happens to the buffer in one place
> > > > > (rendering + display) and we can't do things like reallocate the
> > > > > format accordingly if needed, or we can't do flushing etc. on tha=
t
> > > > > buffer where needed.
> > > >
> > > > Do you think a VIRTIO device designed for your use case is an
> > > > appropriate solution?
> > > >
> > > > I have been arguing that these use cases should be addressed with
> > > > dedicated VIRTIO devices, but I don't understand the use cases of
> > > > everyone on the CC list so maybe I'm missing something :).  If ther=
e
> > > > are reasons why having a VIRTIO device for your use case does not m=
ake
> > > > sense then it would be good to discuss them.  Blockers like "VIRTIO=
 is
> > > > too heavyweight/complex for us because ...", "Our application can't
> > > > make use of VIRTIO devices because ...", etc would be important to
> > > > hear.
> > >
> > > Do you have any idea on how to model Wayland as a VIRTIO device?
> > >
> > > Stephane mentioned that we use vsock, but in fact we have our own
> > > VIRTIO device, except that it's semantically almost the same as vsock=
,
> > > with a difference being the ability to pass buffers and pipes across
> > > the VM boundary.
> >
> > I know neither Wayland nor your use case :).
> >
> > But we can discuss the design of your VIRTIO device.  Please post a
> > link to the code.
>
> The guest-side driver:
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeo=
s-4.19/drivers/virtio/virtio_wl.c
>
> Protocol definitions:
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeo=
s-4.19/include/uapi/linux/virtio_wl.h
>
> crosvm device implementation:
> https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads=
/master/devices/src/virtio/wl.rs

Thanks, Tomasz!

Unfortunately I haven't had a chance to look or catch up on this email
thread due to other work that will keep me away for at least another
week :(.

Stefan
