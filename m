Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF8D187BD5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 10:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgCQJSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 05:18:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38489 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgCQJSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 05:18:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id w1so21939425ljh.5
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EXTECaoRIAH/N+0cnidFBTckkNu/Y2stcECyKBiKMSM=;
        b=UhKugyo3yoN72voK54QuLJMl4GpEybWwDmr5RUKgYhDnUEY3C/BamPXbZHjSZt+xJP
         wiNB5uxvOMT1Pq8TwnUh4jjpYuLrzTvW52Ib2j7VyaU9JrVJpE60gM6Zj0N4jYSxIdvD
         XnQsynrO/r0qlUYNFBMy8y4x5KSbUOc5WhStk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EXTECaoRIAH/N+0cnidFBTckkNu/Y2stcECyKBiKMSM=;
        b=TdtN0WIyEsGXz54LS7Epxg2g7U3CYBcKvEzb3ksAU2WVr6wM7e0oxBDrQppQ4u/dnj
         vXVnThTtsU7jyRqWXn7o1eLmzycTSz6YDfJbccT6Fh+s+9CzuUNgHKHWEUHmzU0lz9F/
         183W3ZUQF8zg4EFAAi8jnw4DyWOfGqUy72laqvh3c1riDQdHsoaD+CRgCfwSKTYTB0/1
         rX6CuGu748aFYQeNVJz9KgO7QOOC869MHC876+hmQff9TyASH5o++kThVmAr47xSUull
         6BSiqfjk7ZlON8LpaUSgJ9h5fnpaIZ3o+SZDoKI9KS8uHMesZt4jrcoK8F7rhZyGXvzj
         nJbw==
X-Gm-Message-State: ANhLgQ02cnhXChcbCqGtb1p+9joQyUP3tDdW2FK/f8sn6NjOpxkJBE4N
        nk21Zb+dtd0+zsDXUah+3/4zIS+HGb1Y9ERP/3n3dA==
X-Google-Smtp-Source: ADFU+vvCGkBqd8UYmCkxH7QhX19fR7M4LzHZzhe0fWYk25rvmbHcfqtGsff4qjoOyG08qyL1bPshtFsiowz+j5+pErc=
X-Received: by 2002:a2e:8798:: with SMTP id n24mr2250808lji.114.1584436717382;
 Tue, 17 Mar 2020 02:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
 <CAD90VcZ5rYHw9qqS7pvaX0TP240qcmoA5MKxKuVVn-eVVrORSA@mail.gmail.com>
 <CAD90VcbON1XTuBpuqxV6E+reY8dYq08N8G-jrAO=z-6ytcvtHQ@mail.gmail.com> <1780647.tdWV9SEqCh@os-lin-dmo>
In-Reply-To: <1780647.tdWV9SEqCh@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 17 Mar 2020 18:18:26 +0900
Message-ID: <CAD90VcbG2QJvj7L-Ek64AHb4sg3tkYJKsrDn2fVO4FLiwMYOxQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] video_video: Add the Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 6:10 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> w=
rote:
>
> Hi Keiichi,
>
> On Dienstag, 17. M=C3=A4rz 2020 07:53:26 CET Keiichi Watanabe wrote:
> > > > diff --git a/include/uapi/linux/virtio_video.h
> > > > b/include/uapi/linux/virtio_video.h new file mode 100644
> > > > index 000000000000..0dd98a2237c6
> > > > --- /dev/null
> > > > +++ b/include/uapi/linux/virtio_video.h
> > > > @@ -0,0 +1,469 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > >
> > > I suspect it's not expected to use GPL licence without exceptions in =
a
> > > UAPI header file:
> > > https://www.kernel.org/doc/html/v5.4/process/license-rules.html
> > >
> > > If GPL is used here, only GPL user programs can include this header
> > > file, can't they?
> > > So, can we use BSD licence like other virtio headers (e.g. virtio_gpu=
.h)?
> > >
> > > Note that I found this program when running
> > > /scripts/headers_install.sh. Though it suggested to add "WITH
> > > Linux-syscall-note", it shouldn't be the case because this header
> > > doesn't provide syscall interface.
> > >
> > > Best regards,
> > > Keiichi
> > >
> > > > +/*
> > > > + * Virtio Video Device
> > > > + *
> > > > + * This header is BSD licensed so anyone can use the definitions
> > > > + * to implement compatible drivers/servers:
> > > > + *
> >
> > Ah, this line says this header is BSD licensed.
> > So, the SPDX-License-Identifier above should be simply wrong.
> >
>
> According to some recent upstream discussion about virtio-snd, which was =
also
> proposed by our engineers, it should be
> /* SPDX-License-Identifier: BSD-3-Clause */
>

Sounds good. Thanks for letting me know.

Best regards,
Keiichi

> Best regards,
> Dmitry.
>
> > Best regards,
> > Keiichi
>
>
