Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7DD5F5FAF
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 16:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfKIPMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 10:12:31 -0500
Received: from mail-ed1-f44.google.com ([209.85.208.44]:46080 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfKIPMa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 10:12:30 -0500
Received: by mail-ed1-f44.google.com with SMTP id x11so8409312eds.13
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I5aoCc9fhlcAHUeVvXS2BisbghVNdu1/cPTG1nycIkY=;
        b=TymgvK/SkkrRHBlsMJdJ/6A0ZUrDfbPwbVMZg6TykgCLfkU3EWh8IKsDo5HH7+SdLm
         JQJjHqtsuxI8PQM3KJHya4lFNrgtDg8EtYjBXrRdHZ9vYtoBefDwkIbgy7NQck+sae4D
         f0NYwK/iYefWKNpz04s7HSMkVwPbXCbjuvp68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I5aoCc9fhlcAHUeVvXS2BisbghVNdu1/cPTG1nycIkY=;
        b=M3gjlNPa95kxsG14wa1t/hjj2v55waaGzN9QS2Wi441BwJSLMj8e5cijOuDkDKVeJo
         wAUoerFcqLUeJiI4R//BWfAhMk/RIVOXXOADaINlPkzl+7Zvq14r0dRq7Rh6MUrhQdiu
         kbSGSMwZCoKiJwhjl54opGUaEkadUcf4KK8LPSrCId/0punbgOGrGxw0/C2763AWd0nu
         ZnH1l50JkpPG+q73JrbZ5q6E26VeXcvwJYvK3hYsFtcA9uNeOIyNuSwN4lrGUlTmm+GF
         t2ZNL7jna8AAfMv7spwHD/Yw+tdc25iQHBcwi5Vi1TEXkRF0HkcZxxBYuoIzXSPD6de8
         4XlQ==
X-Gm-Message-State: APjAAAWzp76fj29U/rBbJ7Cm2sEKyP1Rb2V5T8mZZuKjP5+Y/NoWu+qk
        6ZM/fUqWbSQadGEsWq+3rP+dMVNzqeBXQA==
X-Google-Smtp-Source: APXvYqyYyTmOJzD+VxoFVHqVDLZcx3OyJu+JaN5UtYiWs0gpIXhqB8ihP2iLK7niRJD5ikik3w69+Q==
X-Received: by 2002:a17:906:1395:: with SMTP id f21mr13848263ejc.152.1573312346575;
        Sat, 09 Nov 2019 07:12:26 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id i29sm253178ede.47.2019.11.09.07.12.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2019 07:12:24 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id q70so9019093wme.1
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 07:12:23 -0800 (PST)
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr14165628wma.90.1573312343284;
 Sat, 09 Nov 2019 07:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org> <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
 <CADMs+9ZrfEt4QfCM9pC243KTejvbORQ-Nzo0eHjU0FJ8y-2kwQ@mail.gmail.com>
 <CAJSP0QUF1YA0c7b2ENeDLo1T9OsfeTJbonOYug5Fc56--YqZJQ@mail.gmail.com>
 <CAAFQd5C6mVEUQUP8-=GevM+rV1ksFg68kyWAjCj+cjB-iQiXaA@mail.gmail.com> <CAJSP0QXk9XkrOeiMZ=yQCbStkXATv+AUwqqGDfcSbqL05j1kbg@mail.gmail.com>
In-Reply-To: <CAJSP0QXk9XkrOeiMZ=yQCbStkXATv+AUwqqGDfcSbqL05j1kbg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sun, 10 Nov 2019 00:12:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DBiUta9HWYZX3N06J8bSqa=zBQvL5kdCLfWUfsf9s9Vw@mail.gmail.com>
Message-ID: <CAAFQd5DBiUta9HWYZX3N06J8bSqa=zBQvL5kdCLfWUfsf9s9Vw@mail.gmail.com>
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

On Sat, Nov 9, 2019 at 9:08 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Sat, Nov 9, 2019 at 12:17 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > On Sat, Nov 9, 2019 at 7:12 PM Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
> > > On Sat, Nov 9, 2019 at 2:41 AM St=C3=A9phane Marchesin <marcheu@chrom=
ium.org> wrote:
> > > > On Thu, Nov 7, 2019 at 11:35 PM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
> > > > > On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.com> =
wrote:
> > > > > > > > Adding a list of common properties to the spec certainly ma=
kes sense,
> > > > > > > > so everybody uses the same names.  Adding struct-ed propert=
ies for
> > > > > > > > common use cases might be useful too.
> > > > > > >
> > > > > > > Why not define VIRTIO devices for wayland and friends?
> > > > > >
> > > > > > There is an out-of-tree implementation of that, so yes, that su=
rely is
> > > > > > an option.
> > > > > >
> > > > > > Wayland needs (a) shared buffers, mostly for gfx data, and (b) =
a stream
> > > > > > pipe as control channel.  Pretty much the same for X11, except =
that
> > > > > > shared buffers are optional because the X protocol can also squ=
eeze all
> > > > > > display updates through the stream pipe.
> > > > > >
> > > > > > So, if you want allow guests talk to the host display server yo=
u can run
> > > > > > the stream pipe over vsock.  But there is nothing for the share=
d
> > > > > > buffers ...
> > > > > >
> > > > > > We could replicate vsock functionality elsewhere.  I think that=
 happened
> > > > > > in the out-of-tree virtio-wayland implementation.  There also w=
as some
> > > > > > discussion about adding streams to virtio-gpu, slightly pimped =
up so you
> > > > > > can easily pass around virtio-gpu resource references for buffe=
r
> > > > > > sharing.  But given that getting vsock right isn't exactly triv=
ial
> > > > > > (consider all the fairness issues when multiplexing multiple st=
reams
> > > > > > over a virtqueue for example) I don't think this is a good plan=
.
> > > > >
> > > > > I also think vsock isn't the right fit.
> > > > >
> > > >
> > > > +1 we are using vsock right now and we have a few pains because of =
it.
> > > >
> > > > I think the high-level problem is that because it is a side channel=
,
> > > > we don't see everything that happens to the buffer in one place
> > > > (rendering + display) and we can't do things like reallocate the
> > > > format accordingly if needed, or we can't do flushing etc. on that
> > > > buffer where needed.
> > >
> > > Do you think a VIRTIO device designed for your use case is an
> > > appropriate solution?
> > >
> > > I have been arguing that these use cases should be addressed with
> > > dedicated VIRTIO devices, but I don't understand the use cases of
> > > everyone on the CC list so maybe I'm missing something :).  If there
> > > are reasons why having a VIRTIO device for your use case does not mak=
e
> > > sense then it would be good to discuss them.  Blockers like "VIRTIO i=
s
> > > too heavyweight/complex for us because ...", "Our application can't
> > > make use of VIRTIO devices because ...", etc would be important to
> > > hear.
> >
> > Do you have any idea on how to model Wayland as a VIRTIO device?
> >
> > Stephane mentioned that we use vsock, but in fact we have our own
> > VIRTIO device, except that it's semantically almost the same as vsock,
> > with a difference being the ability to pass buffers and pipes across
> > the VM boundary.
>
> I know neither Wayland nor your use case :).
>
> But we can discuss the design of your VIRTIO device.  Please post a
> link to the code.

The guest-side driver:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-=
4.19/drivers/virtio/virtio_wl.c

Protocol definitions:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-=
4.19/include/uapi/linux/virtio_wl.h

crosvm device implementation:
https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads/m=
aster/devices/src/virtio/wl.rs

Best regards,
Tomasz
