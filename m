Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C91E122CB0
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 14:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbfLQNQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 08:16:13 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46092 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbfLQNQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 08:16:13 -0500
Received: by mail-ed1-f65.google.com with SMTP id m8so7960947edi.13
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 05:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6WQl0PRUEhaXlPsBOZs45R+KlV8M2VaJbDwobeEyETI=;
        b=bzctSbhhGOS6SX7VGZzvSGQLQIEgw4gBRD6xeLcwEah6Jl3IJBpN55Po+kUoDtPSIK
         q1j/7QvVDRyPX9pq4yJb8ar1XvGf1WZ3Ibf/JBLc8QwVjlrzey9MH7uYETQNS5G/nOkD
         BRUSh9skWEn9btuHy/SGuxpVXgu7h0feM9wHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6WQl0PRUEhaXlPsBOZs45R+KlV8M2VaJbDwobeEyETI=;
        b=DCMOw3r/4FgjsTyyXIs7ecbJi8XAInuJhx+uZq+LUYDjkzPVRrnc3NhYw6cBYZ7tmz
         8DuWmgSHByVQlXfL4q1b6a8RpcAJTaCe5s/0R5dUzuHAG5SnDZyXSk7fWq7S7+omMbo5
         v5hifC1/Kp6/DZHfh9AYzB8jjPPZaZG4rAU9dbndpdvSwPkN54/gqElG9yfe7NhpDN7U
         QJsX/eMH4G+1lZZIbLGih5S8Ex98Dy+YdoFB5aDiDaNgDKsGn5IvUF00KhdN4CdJ7cgG
         CuAG8jKRJ6Ai2RDvb2+RuEUKnST1uDAqEZ3DF2BU7YDdpUgD7WLYYRlYqvRHoVxPn6fs
         +b+w==
X-Gm-Message-State: APjAAAVMvX2D9d7FRb1SVuMaFlAxko/OfqXRvk6UOm7aZFEtGvpRweFU
        7+9uJ32qiKLsNbzvDnDd2HTZ55iI4AG0SA==
X-Google-Smtp-Source: APXvYqwLgsO8iDf3IVIL9Dze6wTQBDsAPgmeQW1N8hsEYvx78BoOXwwXVrFflRxD/b1C1HswBRJGfQ==
X-Received: by 2002:a17:906:2e46:: with SMTP id r6mr5136348eji.310.1576588570291;
        Tue, 17 Dec 2019 05:16:10 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id h61sm719645edd.49.2019.12.17.05.16.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 05:16:09 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id b72so3114404wme.4
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 05:16:08 -0800 (PST)
X-Received: by 2002:a1c:e916:: with SMTP id q22mr5423008wmc.92.1576588567759;
 Tue, 17 Dec 2019 05:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org> <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
 <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org> <CAAFQd5Bs6NnsoOP1NFLREQSLNJs-K33ZvW5ZcdAZTv95WHmPBA@mail.gmail.com>
 <20191216103236.ugjorzq5pntc7gtt@sirius.home.kraxel.org>
In-Reply-To: <20191216103236.ugjorzq5pntc7gtt@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 17 Dec 2019 22:15:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BN+enTk3-4aUCCB+ZUA+7ZsOP=zndXh4Y=a8faoRk1Pw@mail.gmail.com>
Message-ID: <CAAFQd5BN+enTk3-4aUCCB+ZUA+7ZsOP=zndXh4Y=a8faoRk1Pw@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 16, 2019 at 7:32 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > Hmm, modern GPUs support both encoding and decoding ...
> >
> > Many SoC architectures have completely separate IP blocks for encoding
> > and decoding. Similarly, in GPUs those are usually completely separate
> > parts of the pipeline.
>
> In the OS there is one driver per GPU handling both ...
>

That's usually only the case for the desktop PC-style GPUs. That said,
it probably doesn't matter from the protocol point of view how it's
handled in the host. At least it is definitely safe to assume that the
host provides functionality for independently decoding and encoding
things from different processes, which is enough to implement virtio
decoder and encoder as separate devices.

> > > I don't think we should bake that restriction into the specification.
> > > It probably makes sense to use one virtqueue per function though, that
> > > will simplify dispatching in both host and guest.
> > >
> >
> > Wouldn't it make the handling easier if we had one virtio device per function?
>
> I don't think there is much of a difference between one device per
> function and one virtqueue per function.  You'll probably have a single
> driver for both anyway, to share common code for buffer management etc.
>

The semantics of the encoder and decoder on the driver side, at least
on Linux where V4L2 is used, are different enough for much of the code
to be separated.

That said, even with separate devices, the same driver can be
instantiated multiple times, which is a common case in Linux, handled
by the driver core. That basically gives us the ability to have as
many instances of whatever function we want for free, without the need
to explicitly handle multiple functions in one device in the driver.
So that clearly equals simpler driver code.

On the host side, the encode and decode APIs are different as well, so
having separate implementation decoder and encoder, possibly just
sharing some helper code, would make much more sense.

> > > Use separate pixel_format (fourcc) and stream_format (H.264 etc.) enums?
> >
> > I'd specifically avoid FourCC here, as it's very loosely defined and
> > could introduce confusion.
>
> I don't think using fourcc is a problem, and given that both drm and
> v4l2 use fourcc already this would be a good choice I think.

Both DRM and V4L2 use two mutually incompatible sets of FourCCs, so
I'm not sure how it could be a good choice. At least unless we decide
to pick a specific set of FourCC. It doesn't help that Windows/DirectX
has its own set of FourCCs that's again slightly different than the
two mentioned before.

>
> But the definition should be more specific than just "fourcc".  Best
> would be to explicitly list and define each format supported by the
> spec.

Why not be consistent with virtio-gpu and just define new formats as
we add support for them as sequential integers?

Best regards,
Tomasz
