Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A165F5E5F
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 11:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfKIKMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 05:12:48 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:38243 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfKIKMs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 05:12:48 -0500
Received: by mail-qv1-f68.google.com with SMTP id q19so3215302qvs.5
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 02:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/yDxKfaCobqqzZutamm85Fz/wK48lxRhYxv8Xzm0V+I=;
        b=Kg+SrodFSpfLJeEKDt5D55MCIHsY+reC20V1VQQ5x6/Y47fJoL3K5E+xP4USpG/Aem
         GMg5olXFc7cO+GYg9yhZWzk4coG352ZVxC2NyA4ZSthpCrlyYWy2ts0E+XeavOaQAV93
         vaASKP0CvuArYKkjm4Lllz2Mlg6adb9uHEQIaVMTqcExwIvTaQGnYeNSNi0GPXNbQrMz
         vK+zGCyavvCc3E3spVPe8x+67gvWqXJbP7Blf6TuZzSviGG3r2FXPx5xm6buUoa7xcx4
         XZn6Pt9TXtcpKGTrWwvcqsIfr0N4KBOFcZrXsgpt7hwAQ0TUDMvwJWryAiqlZMYKegC0
         ynDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/yDxKfaCobqqzZutamm85Fz/wK48lxRhYxv8Xzm0V+I=;
        b=Xy3bcyTvLX5PsPC0aIjglEcx56FBaUr5nR/DHifM8Zm31QqFTVm4P2iufTOmdHvfEB
         w0zxuxr5s1R3J1X9BUbCfPg6NtZPOXUFip1dNBegjTAr7Nn6ExG8NmvSwo+k+LQ90RRy
         xlcFAb6XXoFk4E2SAV75DaahSpExS1P0W70dSZA7XA6+NcP/xpvJB1lonlMjsFh8j22B
         ynV9n+J4WGJZyJoIT4sP3nPXTY4OuQ3FpMFLWIz7ZeLhBr+BrPZ3C2D1N8PpknmALIX2
         8mOOSwWxeKNoT+aQEi0GgJ9GxIkRQVzoyhq6GPWHP5sLFkTk+8nqDkOENI1wI/ZinvJC
         qCTA==
X-Gm-Message-State: APjAAAUOMf99u1dUjBFp9WoltffwP/+/ZSBV+zK3A4TAuYAbviaJ067A
        v9Vz+u2ctM/0812F7pGjX3Z+27yTqOAfmOo2wI4=
X-Google-Smtp-Source: APXvYqz2axpTHWnDn7wE0RLT7BKV/b0Ae5JGwDuSD7H3n7uPQfkSRsyKvVHb31AID2mojlrlzoRSHMGD6G6xgrfm840=
X-Received: by 2002:a0c:9637:: with SMTP id 52mr14055274qvx.174.1573294367054;
 Sat, 09 Nov 2019 02:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org> <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
 <CADMs+9ZrfEt4QfCM9pC243KTejvbORQ-Nzo0eHjU0FJ8y-2kwQ@mail.gmail.com>
In-Reply-To: <CADMs+9ZrfEt4QfCM9pC243KTejvbORQ-Nzo0eHjU0FJ8y-2kwQ@mail.gmail.com>
From:   Stefan Hajnoczi <stefanha@gmail.com>
Date:   Sat, 9 Nov 2019 11:12:35 +0100
Message-ID: <CAJSP0QUF1YA0c7b2ENeDLo1T9OsfeTJbonOYug5Fc56--YqZJQ@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
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

On Sat, Nov 9, 2019 at 2:41 AM St=C3=A9phane Marchesin <marcheu@chromium.or=
g> wrote:
>
> On Thu, Nov 7, 2019 at 11:35 PM Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
> >
> > On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > > Adding a list of common properties to the spec certainly makes se=
nse,
> > > > > so everybody uses the same names.  Adding struct-ed properties fo=
r
> > > > > common use cases might be useful too.
> > > >
> > > > Why not define VIRTIO devices for wayland and friends?
> > >
> > > There is an out-of-tree implementation of that, so yes, that surely i=
s
> > > an option.
> > >
> > > Wayland needs (a) shared buffers, mostly for gfx data, and (b) a stre=
am
> > > pipe as control channel.  Pretty much the same for X11, except that
> > > shared buffers are optional because the X protocol can also squeeze a=
ll
> > > display updates through the stream pipe.
> > >
> > > So, if you want allow guests talk to the host display server you can =
run
> > > the stream pipe over vsock.  But there is nothing for the shared
> > > buffers ...
> > >
> > > We could replicate vsock functionality elsewhere.  I think that happe=
ned
> > > in the out-of-tree virtio-wayland implementation.  There also was som=
e
> > > discussion about adding streams to virtio-gpu, slightly pimped up so =
you
> > > can easily pass around virtio-gpu resource references for buffer
> > > sharing.  But given that getting vsock right isn't exactly trivial
> > > (consider all the fairness issues when multiplexing multiple streams
> > > over a virtqueue for example) I don't think this is a good plan.
> >
> > I also think vsock isn't the right fit.
> >
>
> +1 we are using vsock right now and we have a few pains because of it.
>
> I think the high-level problem is that because it is a side channel,
> we don't see everything that happens to the buffer in one place
> (rendering + display) and we can't do things like reallocate the
> format accordingly if needed, or we can't do flushing etc. on that
> buffer where needed.

Do you think a VIRTIO device designed for your use case is an
appropriate solution?

I have been arguing that these use cases should be addressed with
dedicated VIRTIO devices, but I don't understand the use cases of
everyone on the CC list so maybe I'm missing something :).  If there
are reasons why having a VIRTIO device for your use case does not make
sense then it would be good to discuss them.  Blockers like "VIRTIO is
too heavyweight/complex for us because ...", "Our application can't
make use of VIRTIO devices because ...", etc would be important to
hear.

Stefan
