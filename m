Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906651287E2
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2019 07:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfLUGy6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Dec 2019 01:54:58 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40199 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfLUGy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Dec 2019 01:54:58 -0500
Received: by mail-ed1-f65.google.com with SMTP id b8so10653701edx.7
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 22:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F68oGD/1SJ7SshN3GZaSjxmczsdUavxsZol8X28uIyE=;
        b=P8SMOXEIcUFxwGpwlOTMUv+4/qMmRz1JSK6Ez8a6nErhGrgf9xjca1S2ra0j/J5GJo
         LdqciioD8JtJdPfr1Ck3F9rnJf3h7FMjvbLHRymJxUj+4BSxBpi38qmOPKsJvMh9ruY3
         rDDaH+9m6+KmRVAkgtmUuKjpJayROo7NuUfLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F68oGD/1SJ7SshN3GZaSjxmczsdUavxsZol8X28uIyE=;
        b=a9N7gSM+KAhjsd4LAtknHt5kK1IW8sNqzo0R1QOvcToNHgvans8O/VuvYrxKGdKlyT
         c950Rb1QQXw5k499lSb7HWvduWzEbtBM6v2B00ByPnt20D9UnLJTcn3gDmhFl1/+LlGD
         04Cg394z6nJhvj14HwRnH93ANbXMxIRd4xtC8jIIfL0UtNCgComZvQTaVee4h2mOGrbY
         u6kxqmDS01Lons+qd6o7+jlzmzfLsyOaPgqUsornVUF7duvsz2HnzTJ8TMEZHUZyfRyt
         oTlfG7Gx4kxbH4X4qQgGHDE8Rx/xIbiSUVr3AD5DblMH0l5VuVyTQ2qqgNUeUanzAPV6
         c9eQ==
X-Gm-Message-State: APjAAAUpVMCl537hvIiNAqkCOUa65oUMbwwpJQpDJ/T20Wq2cL8CwBFq
        ZEUcdQgtRp5OrtN8bIFh0AN5AZJF7ntWXQ==
X-Google-Smtp-Source: APXvYqyQUJAkKVQy1DmaR6qknZYYc5WybDRZ7EEQ1APUaj4Z4dUkWM9U36oN66gBP0r1SQb+YQ44GQ==
X-Received: by 2002:a05:6402:3047:: with SMTP id bu7mr20551364edb.44.1576911296268;
        Fri, 20 Dec 2019 22:54:56 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id c24sm1249070eds.40.2019.12.20.22.54.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 22:54:56 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id d16so11417494wre.10
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 22:54:56 -0800 (PST)
X-Received: by 2002:adf:f586:: with SMTP id f6mr18456128wro.46.1576910806048;
 Fri, 20 Dec 2019 22:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <2932378.s8JBUXtX1Y@os-lin-dmo> <CAD90VcZU_jkY=wZ21R_abTnO8BrL_Sf4AO4Rfz3NP5xZMwmaHA@mail.gmail.com>
 <2584386.DF4NACHtsB@os-lin-dmo>
In-Reply-To: <2584386.DF4NACHtsB@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 21 Dec 2019 15:46:34 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DUY6jYu-kuOP9pc72dddg80gZzMktxTGdkxE_PDw1HRg@mail.gmail.com>
Message-ID: <CAAFQd5DUY6jYu-kuOP9pc72dddg80gZzMktxTGdkxE_PDw1HRg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virtio-video: Add virtio video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 21, 2019 at 12:46 AM Dmitry Sepp
<dmitry.sepp@opensynergy.com> wrote:
> On Freitag, 20. Dezember 2019 16:26:50 CET Keiichi Watanabe wrote:
> > On Thu, Dec 19, 2019 at 10:28 PM Dmitry Sepp
> > <dmitry.sepp@opensynergy.com> wrote:
> > > On Mittwoch, 18. Dezember 2019 14:02:14 CET Keiichi Watanabe wrote:
[snip]
> > > > +enum virtio_video_format {
> > > > + VIRTIO_VIDEO_FORMAT_UNDEFINED = 0,
> > > > + /* Raw formats */
> > > > + VIRTIO_VIDEO_FORMAT_NV12 = 1,
> > > > + VIRTIO_VIDEO_FORMAT_YUV420,
> > > > + VIRTIO_VIDEO_FORMAT_YVU420,
> > >
> > > Let's add some variants of RGB, like RGBA, ARGB. We need it for the
> > > encoder in particular .
> >
> > Sounds good.
> > BTW, which "ARGB8888" or "A8R8G8B8" is preferred? While the first one
> > comes from DRM's FourCC, the second one comes from virtio_gpu_formats.
> > I personally prefer the first one, then we can have a naming convention
> > like: VIRTIO_VIDEO_FORMAT_<name from drm_fourcc.h>
> >
>
> I'd go with ARGB8888 and BGRA8888 (might be with X variants).

Just to make sure we're talking about the same formats. DRM naming
convention is based on the little endian convention, which for 32-bit
formats means that you interpret the whole pixel as a packed 32-bit
word on a little endian system. For ARGB8888 that would mean (bit 31)
ARGB (bit 0) in the 32-bit word and (byte 0) B, G, R, A (byte 3) when
looking at separate bytes in memory. Does that correspond to your
expected format?

We also have to be specific about the A and X formats, as the A format
should be supported only if the hardware (host) doesn't ignore the
alpha channel. I haven't seen any hardware capable of encoding alpha
channel yet, but apparently for WebM the standard is to just encode
the alpha channel into another stream as Y, together with dummy U and
V values. [1] That sounds like something that would be handled by two
separate encoding streams and not just one that accepts RGBA on the
input.

[1] http://wiki.webmproject.org/alpha-channel

Best regards,
Tomasz
