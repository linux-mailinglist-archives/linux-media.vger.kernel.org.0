Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7327B13444E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 14:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgAHNw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 08:52:29 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43625 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727456AbgAHNw3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 08:52:29 -0500
Received: by mail-lf1-f67.google.com with SMTP id 9so2486167lfq.10
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 05:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gREgVfNHkrnImh18R6g4ghj10okoL/GHfD2UjRLPdA0=;
        b=A11jpJ+00gSOHB4pIP5SpNG4HWfLUBIhw2k0vgU4zLFNCAj1WTdiYRswhhwTccNk3i
         WZutgP0MR+iN7hzA2QZYi0GcFgtEGZCGiHR2GsPsRLEyOdY6psdkhHmrNiDmJie7/T1Y
         wuZb0IILLOH6DcaDOSCSRhg3W1DBx1ofXWLlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gREgVfNHkrnImh18R6g4ghj10okoL/GHfD2UjRLPdA0=;
        b=mCXmlnAG5DcFpDy8UYltp5JgEDgzUhuvKpszN4PkzaDXzXIEJyzUtJrOOnOR6xXtHA
         XsCpeN8sGWoFivb57c/upF5jYcDCYE1BiQKYgZzWXJZjvoMwSTRtkzTYtZQ9/WXv8PYM
         RYzUSQeB6H+lC46TxnqHTishHh5ArwsPhkHq6gqU0U00yM7iC7bbthy719faYgxMUWyt
         gJz1fjCZgdWs6it2H7QoR1RjN5I8JFUSGrOMjL5U8yGkCn/LnIjvsTFp1g6Q91d2KMjp
         G+gWIfyypx54UGIq6a2eHthFUoVqWVgDPh/In+xHPoqnIKnuZv4SvAFtl1hMGpmowLQQ
         SYow==
X-Gm-Message-State: APjAAAUB3goE2YbfvGb2TnclP3JcxplxcpL50XDqNp5n/Nloxx3K1xL5
        p6fhM2dfaoltLYCxh4PTMtOYeEihXQamKWlda/VdPA==
X-Google-Smtp-Source: APXvYqxT0+1T5zXeB+Bka51eCtxJvOSOH6wawbBWn4yF/znOVkEXzEw9qpv/KD/+IXn5iC3Lw09Y4IPbxGkInxQyYeE=
X-Received: by 2002:a19:a408:: with SMTP id q8mr2843544lfc.174.1578491547417;
 Wed, 08 Jan 2020 05:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <3550989.gzE5nMqd4t@os-lin-dmo> <CAAFQd5BgkEUwBFWdv2ZH98egjm=u0dBRgtexqkzjES+J1SEmag@mail.gmail.com>
 <3878267.TzG3DlCiay@os-lin-dmo> <20191219131234.wm24cazvc7zrnhpn@sirius.home.kraxel.org>
In-Reply-To: <20191219131234.wm24cazvc7zrnhpn@sirius.home.kraxel.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Wed, 8 Jan 2020 22:52:16 +0900
Message-ID: <CAD90Vcb4Vb49uHGRRg0nJaKo=goH6zOxdQR2d7piLH_byxDYyw@mail.gmail.com>
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

On Thu, Dec 19, 2019 at 10:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > However that still doesn't let the driver know which buffers will be
> > > dequeued when. A simple example of this scenario is when the guest is
> > > done displaying a frame and requeues the buffer back to the decoder.
> > > Then the decoder will not choose it for decoding next frames into as
> > > long as the frame in that buffer is still used as a reference frame,
> > > even if one sends the drain request.
> > It might be that I'm getting your point wrong, but do you mean some hardware
> > can mark a buffer as ready to be displayed yet still using the underlying
> > memory to decode other frames?
>
> Yes, this is how I understand Tomasz Figa.
>
> > This means, if you occasionally/intentionally
> > write to the buffer you mess up the whole decoding pipeline.
>
> And to avoid this the buffer handling aspect must be clarified in the
> specification.  Is the device allowed to continue using the buffer after
> finishing decoding and completing the queue request?  If so, how do we
> hand over buffer ownership back to the driver so it can free the pages?
> drain request?  How do we handle re-using buffers?  Can the driver
> simply re-queue them and expect the device figures by itself whenever it
> can use the buffer or whenever it is still needed as reference frame?

The device shouldn't be able to access buffers after it completes a
queue request.
The device can touch buffer contents from when a queue request is sent
until the device responds it.
In contrast, the driver must not modify buffer contents in that period.

Regarding re-using, the driver can simply re-queue buffers returned by
the device. If the device needs a buffer as reference frame, it must
not return the buffer.
I'll describe this rule in the next version of the patch.

Best regards,
Keiichi

>
> cheers,
>   Gerd
>
