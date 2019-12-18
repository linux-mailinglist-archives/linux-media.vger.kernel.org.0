Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 574E012491B
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 15:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfLROIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 09:08:54 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36252 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfLROIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 09:08:53 -0500
Received: by mail-ed1-f68.google.com with SMTP id j17so1768021edp.3
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 06:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=evrYOOuomFe9tdD3KBiTjInS7pmV9ulXAvfxRSVoT44=;
        b=KCDwxgP4MCuwW63X1ZGCm58bnN4StTkBk/96kX7113sj/Vqadn+mWQcrRs3KlAYiuF
         7lnsppmTXqHYJoqAnGqyUS1RixRodmF+MbiwGBFDCXretq3LqFdouwqVCV+kSD+pLCSB
         hgEIdbgl0RE5Z1ie4ze7X7ub3G0raWHaIPads=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=evrYOOuomFe9tdD3KBiTjInS7pmV9ulXAvfxRSVoT44=;
        b=s7NUf7VYH4U4nSgm337StB+yuvdd3KOXUmbsfVacnZom87sr1V8GD3T8zLc1QUbVv8
         PYM55Wuv99nsBMeScm3+BpXaRoxMkKVFfO7xLtezZ1xqddpmbiRCUulB4Cq5ENlT7usr
         jmrPGe0ZcnpsFVyYIarpwWMK+y0InEC9kCaIbvciYvoa5XRyVU/Xfb0TuSY6cKmDCAsv
         YbHDHsX8yKmo/ran/fqbNngUgHw549rHWC5CNER09DNZ22k3kXE/qWlITB8SlGGBrenv
         rd73+M0EM8sq+BiuUeSYGybkk7anskUsyWh7s+pvEL6VTv2TTwkdrzRFecWQsAKPYNxm
         tsNg==
X-Gm-Message-State: APjAAAXrsS6+yMK+Xf7kPLkRTBcQuRG9S+3FMXOuLC3e4LJMsM8KKEt9
        eA4fILi6mOgvG+MK0iOagY6CUMzCDKulOg==
X-Google-Smtp-Source: APXvYqwVpzYJvMfqmuFu1kSlRN6LsEv3+Tgq2BHvB/3+Sz8zFwbIF7KVl1ch7DoOlItHIrHTz2Wnjw==
X-Received: by 2002:a50:d69a:: with SMTP id r26mr2639963edi.148.1576678131538;
        Wed, 18 Dec 2019 06:08:51 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id l26sm38996edq.5.2019.12.18.06.08.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 06:08:50 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 20so1924443wmj.4
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 06:08:50 -0800 (PST)
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr3560459wmk.85.1576678129975;
 Wed, 18 Dec 2019 06:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <20191218130214.170703-2-keiichiw@chromium.org> <20191218134037.3jbouht52bxqwfyy@sirius.home.kraxel.org>
In-Reply-To: <20191218134037.3jbouht52bxqwfyy@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 18 Dec 2019 23:08:37 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AEJ0sUzqrXJAmFnBn0aU8Ef6FwXYo0LgK0NO_CdWXRVg@mail.gmail.com>
Message-ID: <CAAFQd5AEJ0sUzqrXJAmFnBn0aU8Ef6FwXYo0LgK0NO_CdWXRVg@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 1/1] virtio-video: Add virtio video
 device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Enrico Granata <egranata@google.com>, fziglio@redhat.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 18, 2019 at 10:40 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > +The device MUST mark the last buffer with the
> > +VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
> > +sequence.
>
> No, that would build a race condition into the protocol.  The device
> could complete the last buffer after the driver has sent the drain
> command but before the device saw it.  So the flag would not be
> reliable.
>
> I also can't see why the flag is needed in the first place.  The driver
> should know which buffers are queued still and be able to figure
> whenever the drain is complete or not without depending on that flag.
> So I'd suggest to simply drop it.

Unfortunately video decoders are not that simple. There are always
going to be some buffers on the decoder side used as reference frames.
Only the decoder knows when to release them, as it continues decoding
the stream. Moreover, with certain features of certain codecs (e.g.
framebuffer reordering in H.264), there could be decoded frames that
need to be held by decoder, because later bitstream may contain
earlier frames.

How we defined this in the V4L2 stateful decoder interface is that if
the decoder happened to return the last framebuffer before the drain
request arrived, it would return one more, empty. From our experience
that was the easiest thing to deal with from both the driver and the
application, so I believe the same should apply to the host device
implementation and the guest driver.

>
> That is the only issue I've spotted in the protocol on a first quick
> look.  There are a few places where the spec text could be improved.
> I'll try to set aside some time to go over this in detail, but I can't
> promise I'll find the time to do that before xmas and new year.

Thanks a lot for review.

Best regards,
Tomasz
