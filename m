Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 349401879E0
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 07:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgCQGxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 02:53:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35815 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgCQGxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 02:53:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id u12so21519795ljo.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHxmhFFcYZF+UZNMOhwIVQ7Tv4SsSyq8ObQnKpBcd84=;
        b=VrwIajnR7To9zpuokuo6NAn5K/HgtoQnkaEIZSeGeLiXCqRQZfED8YhCn8t2XRtSiz
         GvZPCURNZLozZAT2AO+cBFsm0wm50/qI1E0TBQLc9Fq6waVz6i9RGYWin0+qSD6b6BiV
         N6hWsntHL4zfn53/ZutTfoL0CjES4BsXmyLTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHxmhFFcYZF+UZNMOhwIVQ7Tv4SsSyq8ObQnKpBcd84=;
        b=cIgs5HnGYLHe2hdgeb7BcqGBr/L43BYYH/DjLrTTPc/d2JBwylPfm1rIfUCMFyS5nc
         1b64mslZF6t3H1/Vi+yAB/D1QLOn2Bczqn/izWeTQuPq/zWnzRLLyeGo1mO7ly/K2tpn
         aAjcRd0H0+szev8xk3LQe1DEV2D57OxNvE4OrQSyBi5So06IJrVJ1nORXYHpp7QCWnN3
         bGY2YSCcGMQ/p2VlQ4qaMmCsuYShKtBJX2qoz/zAlOv9OyQrFnrh1esbM00fJDhcB3Nm
         RbtrPC5B/3PwIl1ivLTdMSCEMYQn48usR7YgXYntm2wsC9pj5ouaToRt3aNBdZIOZ6wV
         UXvg==
X-Gm-Message-State: ANhLgQ3pgjW53OGfQgquQ7U416mgXSauiyZlEGMqM06UaEqi77c9IODa
        B+n2+MLT/4MYHm5r2UNK71uizw/Z/IAn+L6hfJ/egQ==
X-Google-Smtp-Source: ADFU+vv11IBT5dSrtWgJAWXTEXCSdtYZuFP405C8QmgQA2ga3ts/2rfu4J5Cm+BzNAmzYceiAw20TPs1zAxychK5V5Y=
X-Received: by 2002:a2e:a551:: with SMTP id e17mr1920421ljn.86.1584428018289;
 Mon, 16 Mar 2020 23:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
 <20200218202753.652093-2-dmitry.sepp@opensynergy.com> <CAD90VcZ5rYHw9qqS7pvaX0TP240qcmoA5MKxKuVVn-eVVrORSA@mail.gmail.com>
In-Reply-To: <CAD90VcZ5rYHw9qqS7pvaX0TP240qcmoA5MKxKuVVn-eVVrORSA@mail.gmail.com>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 17 Mar 2020 15:53:26 +0900
Message-ID: <CAD90VcbON1XTuBpuqxV6E+reY8dYq08N8G-jrAO=z-6ytcvtHQ@mail.gmail.com>
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > diff --git a/include/uapi/linux/virtio_video.h b/include/uapi/linux/virtio_video.h
> > new file mode 100644
> > index 000000000000..0dd98a2237c6
> > --- /dev/null
> > +++ b/include/uapi/linux/virtio_video.h
> > @@ -0,0 +1,469 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
>
> I suspect it's not expected to use GPL licence without exceptions in a
> UAPI header file:
> https://www.kernel.org/doc/html/v5.4/process/license-rules.html
>
> If GPL is used here, only GPL user programs can include this header
> file, can't they?
> So, can we use BSD licence like other virtio headers (e.g. virtio_gpu.h)?
>
> Note that I found this program when running
> /scripts/headers_install.sh. Though it suggested to add "WITH
> Linux-syscall-note", it shouldn't be the case because this header
> doesn't provide syscall interface.
>
> Best regards,
> Keiichi
>
> > +/*
> > + * Virtio Video Device
> > + *
> > + * This header is BSD licensed so anyone can use the definitions
> > + * to implement compatible drivers/servers:
> > + *

Ah, this line says this header is BSD licensed.
So, the SPDX-License-Identifier above should be simply wrong.

Best regards,
Keiichi
