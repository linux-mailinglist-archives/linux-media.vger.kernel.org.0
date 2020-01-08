Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B711D134449
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 14:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgAHNvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 08:51:13 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33629 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgAHNvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 08:51:12 -0500
Received: by mail-lj1-f193.google.com with SMTP id y6so3443901lji.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 05:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j2tbKyq2TJuMrRgt3tLabvZZ7HDbQHaIINM/EQteRrE=;
        b=QvhtXlgwALbRSIkFIh+z8nhyio+0jkI8xfs2zTf2Vk+w5YCHv6RFeXYrHcoqreGyfN
         keKfDlQxzWDLUPrrXuxjo7qlVy7kPkZEqorZ46fcP4oj4PmgIOQRqFc4OdT1MrOGYVVH
         fFqHLpQhtz/arlwgBv2VFJrvZHENZn49U7m9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j2tbKyq2TJuMrRgt3tLabvZZ7HDbQHaIINM/EQteRrE=;
        b=iszkCBFhDTLagSlfMANP8fZFFdorF8EzPyEE6tRNDl57PMv/hZutmDLw6yqbqovEwz
         uCr6DKmOj1LfWYyxFr6aXmiIYz8VYsg/wD+1puCsbOXMI76fH1KAFyBJ5CF7W0dndB7B
         9X67PVyfBQC7OwgFU7ov1f/qfA24P4PQS4upNu2vjQik+QJSU2oo6rhrrLLJBcaV6Abq
         J8H/2PtH6j16kJxGQ1FsqsW0l4A9OFI+k+lKZWYksjaeVp8ZCUrPJEDFGu+q/YTJ1+X3
         KykHBM9eMqMDK8tKqon13rGPOXCA2qOlfkMyt4alTVLUqmC5NI58aFdh0wdr51xPhQmc
         wGkg==
X-Gm-Message-State: APjAAAVAOLTBQlbVw7RpfOSATFpcSVdfy8Z7oLHHGnpev4D2WHQ/KX3x
        cniiMGTyU7ZYlZJQRz9Oz+F2WybyMsaOHFEIih/omw==
X-Google-Smtp-Source: APXvYqzAqTuo6bT4pNcKKL/sbaXHTO9l8rt9Z1w/LBzLQ0DT4qTftXan2TkzSFVCaphzTNcDj/6OZOE97YR+mLjrQw0=
X-Received: by 2002:a2e:9cd8:: with SMTP id g24mr2921078ljj.243.1578491470700;
 Wed, 08 Jan 2020 05:51:10 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <CAAFQd5AEJ0sUzqrXJAmFnBn0aU8Ef6FwXYo0LgK0NO_CdWXRVg@mail.gmail.com>
 <20191219074639.kdkrqxwb6fdb67hu@sirius.home.kraxel.org> <3550989.gzE5nMqd4t@os-lin-dmo>
 <20191219130158.7rzdkyemupreudko@sirius.home.kraxel.org>
In-Reply-To: <20191219130158.7rzdkyemupreudko@sirius.home.kraxel.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Wed, 8 Jan 2020 22:50:59 +0900
Message-ID: <CAD90VcYcXniT-HV09LJoMkm8JWZ1c9et829wBdHUx9xwx3ya=Q@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 1/1] virtio-video: Add virtio video
 device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Tomasz Figa <tfiga@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
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

Hi Gerd,
Thank you so much for the review. I'm sorry for not replying earlier.

On Thu, Dec 19, 2019 at 10:02 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > Not clearly defined in the spec:  When is the decoder supposed to send
> > > the response for a queue request?  When it finished decoding (i.e. frame
> > > is ready for playback), or when it doesn't need the buffer any more for
> > > decoding (i.e. buffer can be re-queued or pages can be released)?

The answer is "when it doesn't need the buffer any more for decoding".
The device can access buffer contents from when a queue request is
sent until the device responds it. So, the device must not responds a
queue request before finishing all process that requires the buffer
content.

Actually, the first one "When it finished decoding (i.e. frame is
ready for playback)" doesn't make much sense, as it's not necessary to
have a one-to-one correspondence between an input bitstream buffer and
a decoded frame.
It's okay to decode one input buffer contains bitstream data for two
frames. Also, a user can pass bitstream for one frame as two input
buffers.

I'll document it in the spec.

Best regards,
Keiichi

> > In my eyes the both statements mean almost the same and both are valid.
>
> Well, no.  When the device decoded a P-Frame it can notify the device,
> saying "here is your decoded frame".  But the device might still need
> the buffer with the decoded frame to properly decode the following B/I
> Frames which reference the P-Frame.
>
> cheers,
>   Gerd
>
