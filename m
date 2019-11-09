Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484F2F5EB4
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 12:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfKILWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 06:22:45 -0500
Received: from mail-ed1-f53.google.com ([209.85.208.53]:35646 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKILWp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 06:22:45 -0500
Received: by mail-ed1-f53.google.com with SMTP id r16so8073338edq.2
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 03:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2KJzeg38k9TKP9n2OHi7V1tXDJtLQP/OdiV4r/c9Qw4=;
        b=YlVtrbheqLjXbAWyZhaPH6O4RntSaSg6mNxZeDNdjviC/mLwwz5yZmdchc9K7fjO5r
         MV8hoOwJpyJkHyRuzgwyIbq1y1zftyhCam1YE8EA/XfOvhopBrdKxxZfHCChKYT8b4pd
         9vOBEHKK8ymvr5y1m0qq80cPB4FeqvV+7V0nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2KJzeg38k9TKP9n2OHi7V1tXDJtLQP/OdiV4r/c9Qw4=;
        b=RE2nUYoICPbWScO2XWX3W5JHROMAs4dmbt7DVFwUy9kqyvCP0aqJqxxbksSeIOK6j4
         56/2O77ttWx2UAGdBVuQNPxHJ2STsOKNmlcyUJDKnd6N0WXyLgvo4sh+mwhsgWzyJ+v2
         kyanxqRuugPtuEOGjL6acioShse30uUriZnQOZmDZ9RzMXF3x6Q/ngVZhAPKnueXiz1W
         XWFBw/VhCP3vcG6NNdAqTPqPa8G/AGw21ASNA0AMSCYhD7jW9fmUGh56FmsCXDpaarZn
         IESe8+MyAEcUPqZbOpqSRx76M2Tzrgr8CwWK4GthHkkjmkK0ZVo2bCrBpysagYQ/dh1p
         ldGw==
X-Gm-Message-State: APjAAAXnzGGk4IRzUVrlSBBWRIX3C3Ktrc5xwn+oVM1jtx4NohpTDjW3
        0CS+jUhlWC0CHqktHEZd3kkMVK01AdnvvA==
X-Google-Smtp-Source: APXvYqzSvmCdRJtj0T0zFJSLa8TifcGqLggxXog9XW+h8MIz/zkLRP7HpDcoFHdUsKejN5yg0BmV2Q==
X-Received: by 2002:a50:895c:: with SMTP id f28mr15000998edf.125.1573298562775;
        Sat, 09 Nov 2019 03:22:42 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id d26sm287598edu.37.2019.11.09.03.22.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2019 03:22:42 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id f7so8050903edq.3
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 03:22:42 -0800 (PST)
X-Received: by 2002:a5d:4946:: with SMTP id r6mr11729096wrs.155.1573298226861;
 Sat, 09 Nov 2019 03:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org> <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
 <CADMs+9ZrfEt4QfCM9pC243KTejvbORQ-Nzo0eHjU0FJ8y-2kwQ@mail.gmail.com> <CAJSP0QUF1YA0c7b2ENeDLo1T9OsfeTJbonOYug5Fc56--YqZJQ@mail.gmail.com>
In-Reply-To: <CAJSP0QUF1YA0c7b2ENeDLo1T9OsfeTJbonOYug5Fc56--YqZJQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 9 Nov 2019 20:16:52 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C6mVEUQUP8-=GevM+rV1ksFg68kyWAjCj+cjB-iQiXaA@mail.gmail.com>
Message-ID: <CAAFQd5C6mVEUQUP8-=GevM+rV1ksFg68kyWAjCj+cjB-iQiXaA@mail.gmail.com>
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

On Sat, Nov 9, 2019 at 7:12 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Sat, Nov 9, 2019 at 2:41 AM St=C3=A9phane Marchesin <marcheu@chromium.=
org> wrote:
> >
> > On Thu, Nov 7, 2019 at 11:35 PM Stefan Hajnoczi <stefanha@gmail.com> wr=
ote:
> > >
> > > On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.com> wrot=
e:
> > > > > > Adding a list of common properties to the spec certainly makes =
sense,
> > > > > > so everybody uses the same names.  Adding struct-ed properties =
for
> > > > > > common use cases might be useful too.
> > > > >
> > > > > Why not define VIRTIO devices for wayland and friends?
> > > >
> > > > There is an out-of-tree implementation of that, so yes, that surely=
 is
> > > > an option.
> > > >
> > > > Wayland needs (a) shared buffers, mostly for gfx data, and (b) a st=
ream
> > > > pipe as control channel.  Pretty much the same for X11, except that
> > > > shared buffers are optional because the X protocol can also squeeze=
 all
> > > > display updates through the stream pipe.
> > > >
> > > > So, if you want allow guests talk to the host display server you ca=
n run
> > > > the stream pipe over vsock.  But there is nothing for the shared
> > > > buffers ...
> > > >
> > > > We could replicate vsock functionality elsewhere.  I think that hap=
pened
> > > > in the out-of-tree virtio-wayland implementation.  There also was s=
ome
> > > > discussion about adding streams to virtio-gpu, slightly pimped up s=
o you
> > > > can easily pass around virtio-gpu resource references for buffer
> > > > sharing.  But given that getting vsock right isn't exactly trivial
> > > > (consider all the fairness issues when multiplexing multiple stream=
s
> > > > over a virtqueue for example) I don't think this is a good plan.
> > >
> > > I also think vsock isn't the right fit.
> > >
> >
> > +1 we are using vsock right now and we have a few pains because of it.
> >
> > I think the high-level problem is that because it is a side channel,
> > we don't see everything that happens to the buffer in one place
> > (rendering + display) and we can't do things like reallocate the
> > format accordingly if needed, or we can't do flushing etc. on that
> > buffer where needed.
>
> Do you think a VIRTIO device designed for your use case is an
> appropriate solution?
>
> I have been arguing that these use cases should be addressed with
> dedicated VIRTIO devices, but I don't understand the use cases of
> everyone on the CC list so maybe I'm missing something :).  If there
> are reasons why having a VIRTIO device for your use case does not make
> sense then it would be good to discuss them.  Blockers like "VIRTIO is
> too heavyweight/complex for us because ...", "Our application can't
> make use of VIRTIO devices because ...", etc would be important to
> hear.

Do you have any idea on how to model Wayland as a VIRTIO device?

Stephane mentioned that we use vsock, but in fact we have our own
VIRTIO device, except that it's semantically almost the same as vsock,
with a difference being the ability to pass buffers and pipes across
the VM boundary.

Best regards,
Tomasz
