Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27C52F5EE1
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 13:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfKIMIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 07:08:43 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41508 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfKIMIn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 07:08:43 -0500
Received: by mail-qk1-f194.google.com with SMTP id m125so7416759qkd.8
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 04:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n5Qbym5TxXMyoBu03mDyavFd/uNaJE6OrBVeeYHwKjk=;
        b=AXLDNgurFK0okSdujH8B3g1fODPa3stO+RYC/yAf1jFqZVQ5H9N+96vmO+whEeHW8N
         OEAM0oTbHy9qSjUl9icjVu/HXOz2pOI+p254kjJMtkpwEbb9vEaEktWe31c7jbQ8Far6
         4+a0UEkHsrrhZLQ8E4A9FmQp+69TXUSEuBzl4jufW6W1D/oF3n/yp49D+60oWyoxe9DB
         WgoZ6bvL/oZ9HQQf52972qLpQNYluXAVTvkPJnL7lo9Wj8KpRa4gASq+PNHs2CakniKU
         l00QRa3GyZt3TM5W3gTTFm+pU88+tcmtgYvhFkxQwYCis9EPzPTsF2ZN4VmBoH9MaU5q
         3Zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n5Qbym5TxXMyoBu03mDyavFd/uNaJE6OrBVeeYHwKjk=;
        b=gsdOIzReJURP60IhzgPAGqGYJ6jsOi/P/jFbLEu4I5/C2HTAxM1/LnS47QatEaU2Pd
         j6pYUzkYj9GwNQRLPslzWVPVor+1N8MRKlOdBnUWz54qSKywBzkOs1KHVnEryJ4UOgfv
         17AZA3Pqnf1v2sIHFbNdSmzbO/f32vKot3JkQw9FlMDd1SJ4aGJeh0egBhKdG32o5UGv
         YA7A9gyMz7qAFPnU++vO17qTdEPvjP5SzlSCh0W+3AomG42puQj8GWcBqcbJju74VuJE
         /20ZFjD3ajn0yO8yT9DQmzYfohnhjl8UP1bzoBTsODsD4uVL6CtWEodCgtgcPzld59oH
         7ZIg==
X-Gm-Message-State: APjAAAVV6LJ0eyco2QtuNg4yMdp4kJWjRVlAOA0LCBTPqSGsdgW7wbT5
        8rALC5wr8gIKcQ5Z7cmAGMWTShIed4VhdyIyNp4=
X-Google-Smtp-Source: APXvYqwQ99oAarsq7llnHHQBZTDtd8YlR9q3KeLkk4fQnWg72eMPEhoKd06XNYPhhYyUpYbCe5igbkj9bKoqwa/pnP8=
X-Received: by 2002:a37:bc3:: with SMTP id 186mr1735320qkl.196.1573301321941;
 Sat, 09 Nov 2019 04:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org> <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
 <CADMs+9ZrfEt4QfCM9pC243KTejvbORQ-Nzo0eHjU0FJ8y-2kwQ@mail.gmail.com>
 <CAJSP0QUF1YA0c7b2ENeDLo1T9OsfeTJbonOYug5Fc56--YqZJQ@mail.gmail.com> <CAAFQd5C6mVEUQUP8-=GevM+rV1ksFg68kyWAjCj+cjB-iQiXaA@mail.gmail.com>
In-Reply-To: <CAAFQd5C6mVEUQUP8-=GevM+rV1ksFg68kyWAjCj+cjB-iQiXaA@mail.gmail.com>
From:   Stefan Hajnoczi <stefanha@gmail.com>
Date:   Sat, 9 Nov 2019 13:08:30 +0100
Message-ID: <CAJSP0QXk9XkrOeiMZ=yQCbStkXATv+AUwqqGDfcSbqL05j1kbg@mail.gmail.com>
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

On Sat, Nov 9, 2019 at 12:17 PM Tomasz Figa <tfiga@chromium.org> wrote:
> On Sat, Nov 9, 2019 at 7:12 PM Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> > On Sat, Nov 9, 2019 at 2:41 AM St=C3=A9phane Marchesin <marcheu@chromiu=
m.org> wrote:
> > > On Thu, Nov 7, 2019 at 11:35 PM Stefan Hajnoczi <stefanha@gmail.com> =
wrote:
> > > > On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.com> wr=
ote:
> > > > > > > Adding a list of common properties to the spec certainly make=
s sense,
> > > > > > > so everybody uses the same names.  Adding struct-ed propertie=
s for
> > > > > > > common use cases might be useful too.
> > > > > >
> > > > > > Why not define VIRTIO devices for wayland and friends?
> > > > >
> > > > > There is an out-of-tree implementation of that, so yes, that sure=
ly is
> > > > > an option.
> > > > >
> > > > > Wayland needs (a) shared buffers, mostly for gfx data, and (b) a =
stream
> > > > > pipe as control channel.  Pretty much the same for X11, except th=
at
> > > > > shared buffers are optional because the X protocol can also squee=
ze all
> > > > > display updates through the stream pipe.
> > > > >
> > > > > So, if you want allow guests talk to the host display server you =
can run
> > > > > the stream pipe over vsock.  But there is nothing for the shared
> > > > > buffers ...
> > > > >
> > > > > We could replicate vsock functionality elsewhere.  I think that h=
appened
> > > > > in the out-of-tree virtio-wayland implementation.  There also was=
 some
> > > > > discussion about adding streams to virtio-gpu, slightly pimped up=
 so you
> > > > > can easily pass around virtio-gpu resource references for buffer
> > > > > sharing.  But given that getting vsock right isn't exactly trivia=
l
> > > > > (consider all the fairness issues when multiplexing multiple stre=
ams
> > > > > over a virtqueue for example) I don't think this is a good plan.
> > > >
> > > > I also think vsock isn't the right fit.
> > > >
> > >
> > > +1 we are using vsock right now and we have a few pains because of it=
.
> > >
> > > I think the high-level problem is that because it is a side channel,
> > > we don't see everything that happens to the buffer in one place
> > > (rendering + display) and we can't do things like reallocate the
> > > format accordingly if needed, or we can't do flushing etc. on that
> > > buffer where needed.
> >
> > Do you think a VIRTIO device designed for your use case is an
> > appropriate solution?
> >
> > I have been arguing that these use cases should be addressed with
> > dedicated VIRTIO devices, but I don't understand the use cases of
> > everyone on the CC list so maybe I'm missing something :).  If there
> > are reasons why having a VIRTIO device for your use case does not make
> > sense then it would be good to discuss them.  Blockers like "VIRTIO is
> > too heavyweight/complex for us because ...", "Our application can't
> > make use of VIRTIO devices because ...", etc would be important to
> > hear.
>
> Do you have any idea on how to model Wayland as a VIRTIO device?
>
> Stephane mentioned that we use vsock, but in fact we have our own
> VIRTIO device, except that it's semantically almost the same as vsock,
> with a difference being the ability to pass buffers and pipes across
> the VM boundary.

I know neither Wayland nor your use case :).

But we can discuss the design of your VIRTIO device.  Please post a
link to the code.

Stefan
