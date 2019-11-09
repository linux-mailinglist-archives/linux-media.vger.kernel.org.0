Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43DDF5CC8
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 02:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfKIBlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 20:41:17 -0500
Received: from mail-il1-f174.google.com ([209.85.166.174]:44608 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfKIBlR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 20:41:17 -0500
Received: by mail-il1-f174.google.com with SMTP id i6so6775376ilr.11
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2019 17:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wVtEFg/Qou+aYXahULIg4Ddk9uw4TDjxaxbD5XH4JVs=;
        b=S7Ja/TiGlPkwGljdD/iajvmhHtBPABLFf+GeQU9NhSJftJ5DYnEhmRClF/OVp7pyj2
         I+vI3Z150NjX/t6quJ9JBX7l6ZSxi410Oq4lJPoW0T28FDVLf6oAiBcMvmB+TRuUupAl
         PoYg/UknnwucQ1CO3eC98JAtBBqzEiT+FMkrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wVtEFg/Qou+aYXahULIg4Ddk9uw4TDjxaxbD5XH4JVs=;
        b=Hfgs/1RAwm4gosZ0MZmvWWcInyoZG3irSO2gFxoQSnTcgGusYhSzS0n5xjUZ66jm/E
         bxviYHtHrfjotQGCBSHe6mz8TcsG1EtxDOUsi0B5zhFmfCn9xEx5cVFZ9TQXHSKdSuGx
         qBLdJGdA3czj3QBGVeM99T8G8ywpMq8phQ9rzVme02rIjmoaFLC0EOLsQ0rh8oD+fA14
         qXZsWfQ5k/AcqFTYh2z0eiXPtq8J5a63to3NZPqY1ZH8pNPlP/3VYl81EESd8rcC3blO
         Ey3kSp7e2d9smVn10cNyUwLuduJ939g3Z3nEihy9ke/y015Icg/g97yGwrRqb704ES/9
         meBw==
X-Gm-Message-State: APjAAAVFoNgZtNidfsTE1HI7NEliekMvCvDDFqsjjTOJhImzc/Ymk0Ih
        QzxABeSi2dykAcc+QdE2B8SWjjtf5jO0R/C/rEDoxw==
X-Google-Smtp-Source: APXvYqyH9hhaGKo/8SsZPmZFQrsL0XDoeeBeKZspgW0B81ZfhsLOgDMjyjHCpc90IJaEKILodBC9tZm0Wuo1ZEWPa3Q=
X-Received: by 2002:a92:5d88:: with SMTP id e8mr16072462ilg.95.1573263676306;
 Fri, 08 Nov 2019 17:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org> <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
In-Reply-To: <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
From:   =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
Date:   Fri, 8 Nov 2019 17:41:04 -0800
Message-ID: <CADMs+9ZrfEt4QfCM9pC243KTejvbORQ-Nzo0eHjU0FJ8y-2kwQ@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Stefan Hajnoczi <stefanha@gmail.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, geoff@hostfission.com,
        virtio-dev@lists.oasis-open.org, Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel <qemu-devel@nongnu.org>,
        Tomasz Figa <tfiga@chromium.org>,
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

On Thu, Nov 7, 2019 at 11:35 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > Adding a list of common properties to the spec certainly makes sens=
e,
> > > > so everybody uses the same names.  Adding struct-ed properties for
> > > > common use cases might be useful too.
> > >
> > > Why not define VIRTIO devices for wayland and friends?
> >
> > There is an out-of-tree implementation of that, so yes, that surely is
> > an option.
> >
> > Wayland needs (a) shared buffers, mostly for gfx data, and (b) a stream
> > pipe as control channel.  Pretty much the same for X11, except that
> > shared buffers are optional because the X protocol can also squeeze all
> > display updates through the stream pipe.
> >
> > So, if you want allow guests talk to the host display server you can ru=
n
> > the stream pipe over vsock.  But there is nothing for the shared
> > buffers ...
> >
> > We could replicate vsock functionality elsewhere.  I think that happene=
d
> > in the out-of-tree virtio-wayland implementation.  There also was some
> > discussion about adding streams to virtio-gpu, slightly pimped up so yo=
u
> > can easily pass around virtio-gpu resource references for buffer
> > sharing.  But given that getting vsock right isn't exactly trivial
> > (consider all the fairness issues when multiplexing multiple streams
> > over a virtqueue for example) I don't think this is a good plan.
>
> I also think vsock isn't the right fit.
>

+1 we are using vsock right now and we have a few pains because of it.

I think the high-level problem is that because it is a side channel,
we don't see everything that happens to the buffer in one place
(rendering + display) and we can't do things like reallocate the
format accordingly if needed, or we can't do flushing etc. on that
buffer where needed.

Best,
St=C3=A9phane

>
> Defining a virtio-wayland device makes sense to me: you get the guest
> RAM access via virtqueues, plus the VIRTIO infrastructure (device IDs,
> configuration space, feature bits, and existing reusable
> kernel/userspace/QEMU code).
>
> Stefan
