Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C6E10373C
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 11:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbfKTKMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 05:12:15 -0500
Received: from mail-ed1-f49.google.com ([209.85.208.49]:42494 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfKTKMP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 05:12:15 -0500
Received: by mail-ed1-f49.google.com with SMTP id m13so19801764edv.9
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k0eJ6rySdlpAX4BY9OLA/pzu+RYxPKTylT0yhkAx2x8=;
        b=lDa6MWbxkoAcBE1WDpHJD32hmuqJ8H2y9qhPgl095mw5QjXZtpdBgnIBayjwwX3eU2
         akCqWDNmQEcJ3Wc5h6NHCWAidyQZZBigVxAe3LTLCxA2UAgmD5sY6LFRuM0Ijcm7Ltyj
         8iyTi1H9C9VCNkFwrUYfC2YMmAqL0BNIm+Em8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k0eJ6rySdlpAX4BY9OLA/pzu+RYxPKTylT0yhkAx2x8=;
        b=P+5JmCLmbSkUN8jAPCXt1KssdUeIebibZfo89dY33hi4OdS/vJRvJtFlYx+ZonyrM6
         2bTFSxpt8cHzDVYJi/8WBmAEU/VB29RojCv/3EGwKrWXCaEZ0YmxH8SB3Wi1gxImczza
         +TXKr47DkTrZYakeerQoNu+/Bt98uznZaqHE7r6nGYiETKF8eAMPD5FA6WjEauE+7xMl
         gdnML17YirRl5oQNM4uXbg1a7zDq3GYQziagLr2ZwvJ8ib9SWp2EidbTf7L59ebENS8v
         PcfJdtmHh8DbiRyxU1UOInNk6djxd2cfO0cZmzYZob7qad9Vscujt3GAx8w+q4xEg2uE
         oifQ==
X-Gm-Message-State: APjAAAWSnafIyFySfyRedAPnF97Nm0gAJbQMHlBlAEg7YIb9asUY1xkU
        mqkkCk+qiuNY1E3zk684fO4bicTBR4hRxw==
X-Google-Smtp-Source: APXvYqyNnygLzZIkiOB/q7miEGO7V8+l9L+mIGSpS1o+hLwzxR+49oS+32vCqvTY4iOmiDOpm97heA==
X-Received: by 2002:a17:906:7a47:: with SMTP id i7mr4348348ejo.22.1574244730897;
        Wed, 20 Nov 2019 02:12:10 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id t27sm1369691edt.75.2019.11.20.02.12.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 02:12:10 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id y5so947918wmi.5
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 02:12:10 -0800 (PST)
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr2297809wmi.64.1574244729507;
 Wed, 20 Nov 2019 02:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org> <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
 <CADMs+9ZrfEt4QfCM9pC243KTejvbORQ-Nzo0eHjU0FJ8y-2kwQ@mail.gmail.com>
 <CAJSP0QUF1YA0c7b2ENeDLo1T9OsfeTJbonOYug5Fc56--YqZJQ@mail.gmail.com>
 <CAAFQd5C6mVEUQUP8-=GevM+rV1ksFg68kyWAjCj+cjB-iQiXaA@mail.gmail.com>
 <CAJSP0QXk9XkrOeiMZ=yQCbStkXATv+AUwqqGDfcSbqL05j1kbg@mail.gmail.com>
 <CAAFQd5DBiUta9HWYZX3N06J8bSqa=zBQvL5kdCLfWUfsf9s9Vw@mail.gmail.com> <CAJSP0QX6ajvKpU6k6i6uBFwc9gFWoYGa6HZn7AfbGr9+975=WQ@mail.gmail.com>
In-Reply-To: <CAJSP0QX6ajvKpU6k6i6uBFwc9gFWoYGa6HZn7AfbGr9+975=WQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Nov 2019 19:11:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B5t-2-3PfEfUe8DPvDKabfUnnK_svhcKExPRYUavx1yA@mail.gmail.com>
Message-ID: <CAAFQd5B5t-2-3PfEfUe8DPvDKabfUnnK_svhcKExPRYUavx1yA@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Stefan Hajnoczi <stefanha@gmail.com>
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

Hi Stefan,

On Mon, Nov 18, 2019 at 7:21 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Sat, Nov 9, 2019 at 3:12 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Sat, Nov 9, 2019 at 9:08 PM Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
> > >
> > > On Sat, Nov 9, 2019 at 12:17 PM Tomasz Figa <tfiga@chromium.org> wrot=
e:
> > > > On Sat, Nov 9, 2019 at 7:12 PM Stefan Hajnoczi <stefanha@gmail.com>=
 wrote:
> > > > > On Sat, Nov 9, 2019 at 2:41 AM St=C3=A9phane Marchesin <marcheu@c=
hromium.org> wrote:
> > > > > > On Thu, Nov 7, 2019 at 11:35 PM Stefan Hajnoczi <stefanha@gmail=
.com> wrote:
> > > > > > > On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.c=
om> wrote:
> > > > > > > > > > Adding a list of common properties to the spec certainl=
y makes sense,
> > > > > > > > > > so everybody uses the same names.  Adding struct-ed pro=
perties for
> > > > > > > > > > common use cases might be useful too.
> > > > > > > > >
> > > > > > > > > Why not define VIRTIO devices for wayland and friends?
> > > > > > > >
> > > > > > > > There is an out-of-tree implementation of that, so yes, tha=
t surely is
> > > > > > > > an option.
> > > > > > > >
> > > > > > > > Wayland needs (a) shared buffers, mostly for gfx data, and =
(b) a stream
> > > > > > > > pipe as control channel.  Pretty much the same for X11, exc=
ept that
> > > > > > > > shared buffers are optional because the X protocol can also=
 squeeze all
> > > > > > > > display updates through the stream pipe.
> > > > > > > >
> > > > > > > > So, if you want allow guests talk to the host display serve=
r you can run
> > > > > > > > the stream pipe over vsock.  But there is nothing for the s=
hared
> > > > > > > > buffers ...
> > > > > > > >
> > > > > > > > We could replicate vsock functionality elsewhere.  I think =
that happened
> > > > > > > > in the out-of-tree virtio-wayland implementation.  There al=
so was some
> > > > > > > > discussion about adding streams to virtio-gpu, slightly pim=
ped up so you
> > > > > > > > can easily pass around virtio-gpu resource references for b=
uffer
> > > > > > > > sharing.  But given that getting vsock right isn't exactly =
trivial
> > > > > > > > (consider all the fairness issues when multiplexing multipl=
e streams
> > > > > > > > over a virtqueue for example) I don't think this is a good =
plan.
> > > > > > >
> > > > > > > I also think vsock isn't the right fit.
> > > > > > >
> > > > > >
> > > > > > +1 we are using vsock right now and we have a few pains because=
 of it.
> > > > > >
> > > > > > I think the high-level problem is that because it is a side cha=
nnel,
> > > > > > we don't see everything that happens to the buffer in one place
> > > > > > (rendering + display) and we can't do things like reallocate th=
e
> > > > > > format accordingly if needed, or we can't do flushing etc. on t=
hat
> > > > > > buffer where needed.
> > > > >
> > > > > Do you think a VIRTIO device designed for your use case is an
> > > > > appropriate solution?
> > > > >
> > > > > I have been arguing that these use cases should be addressed with
> > > > > dedicated VIRTIO devices, but I don't understand the use cases of
> > > > > everyone on the CC list so maybe I'm missing something :).  If th=
ere
> > > > > are reasons why having a VIRTIO device for your use case does not=
 make
> > > > > sense then it would be good to discuss them.  Blockers like "VIRT=
IO is
> > > > > too heavyweight/complex for us because ...", "Our application can=
't
> > > > > make use of VIRTIO devices because ...", etc would be important t=
o
> > > > > hear.
> > > >
> > > > Do you have any idea on how to model Wayland as a VIRTIO device?
> > > >
> > > > Stephane mentioned that we use vsock, but in fact we have our own
> > > > VIRTIO device, except that it's semantically almost the same as vso=
ck,
> > > > with a difference being the ability to pass buffers and pipes acros=
s
> > > > the VM boundary.
> > >
> > > I know neither Wayland nor your use case :).
> > >
> > > But we can discuss the design of your VIRTIO device.  Please post a
> > > link to the code.
> >
> > The guest-side driver:
> > https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chrom=
eos-4.19/drivers/virtio/virtio_wl.c
> >
> > Protocol definitions:
> > https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chrom=
eos-4.19/include/uapi/linux/virtio_wl.h
> >
> > crosvm device implementation:
> > https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/hea=
ds/master/devices/src/virtio/wl.rs
>
> Thanks, Tomasz!
>
> Unfortunately I haven't had a chance to look or catch up on this email
> thread due to other work that will keep me away for at least another
> week :(.

Thanks for the note. Waiting patiently. :)

Best regards,
Tomasz
