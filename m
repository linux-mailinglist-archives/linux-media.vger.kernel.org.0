Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0472C24C9D
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 12:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbfEUK1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 06:27:31 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:46213 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbfEUK1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 06:27:31 -0400
Received: by mail-ed1-f48.google.com with SMTP id f37so28529120edb.13
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+22UkhN/tOYW4WS1K+jp/ETLxt04l9i88C3Tz9m8vuY=;
        b=LBvSqpgyDw0awr64Wy7NZcEzkh1r7x5YaCw5HIoqL+wwVz1OJSBUS+fqSTFDmwl6P7
         FIBLD8IYE0jchdFGQX1vQhkOKUIevgeiikAUVV9yNhXjzw/E71Qgj93KYdSl3Zm47ZUu
         LOgZxhFSAivQoHFJ+xh2OttvxAyyOVXvNUPDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+22UkhN/tOYW4WS1K+jp/ETLxt04l9i88C3Tz9m8vuY=;
        b=cJM/QoOuoeVMM9qcSnOwkfvsYDb5zBAf7335YmfJ4qgt8ol/EybMU91fJru3u155HC
         pFxsFUp5LJK8QySULNQz1+YvfWnBMkPwG/iP0M9q40yAYEQkwa0pRzF94hGTxwHNpCII
         ZP65xHZtpLwPvkZljglt/UbcdyjwqOJKaIaUt0zN7XVE45WHWOkbaEc8RAN69C1bMVS8
         S3Nhs8qKUaTSDumwA8gUABhZaxrdJhsSM2A5aiQ9TtKD8d5AZjJ+EWwMsczB265YiCCy
         xV+DRB8TS6rwnyypyzREaYWiPMpl43CK9Tj23sgusGet3WJX32b71rDKzgXrcHa+pSGw
         tyew==
X-Gm-Message-State: APjAAAX1EIEgxBpRwgjeUWKfOxF2XUTyqwBm3PAE8A8uhnnzBN5JMOxX
        c/VjVgA5xnwRNLwVuP2B/kBxHcIuabqYfw==
X-Google-Smtp-Source: APXvYqx66GT7RsK/u0gvLjODcx93tqUqJRj3lqviebEf/Iana8AaX2XkgIYkz1FIpM1WTO41gGm9nA==
X-Received: by 2002:a50:9818:: with SMTP id g24mr63570457edb.35.1558434449191;
        Tue, 21 May 2019 03:27:29 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id z37sm6252955edd.26.2019.05.21.03.27.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 03:27:28 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id w8so17971973wrl.6
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 03:27:27 -0700 (PDT)
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr38019802wrr.149.1558434446649;
 Tue, 21 May 2019 03:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca> <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
In-Reply-To: <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 21 May 2019 19:27:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com>
Message-ID: <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 16, 2019 at 2:43 AM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=A9crit=
 :
> > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=A9c=
rit :
> > > Hi,
> > >
> > > With the Rockchip stateless VPU driver in the works, we now have a
> > > better idea of what the situation is like on platforms other than
> > > Allwinner. This email shares my conclusions about the situation and h=
ow
> > > we should update the MPEG-2, H.264 and H.265 controls accordingly.
> > >
> > > - Per-slice decoding
> > >
> > > We've discussed this one already[0] and Hans has submitted a patch[1]
> > > to implement the required core bits. When we agree it looks good, we
> > > should lift the restriction that all slices must be concatenated and
> > > have them submitted as individual requests.
> > >
> > > One question is what to do about other controls. I feel like it would
> > > make sense to always pass all the required controls for decoding the
> > > slice, including the ones that don't change across slices. But there
> > > may be no particular advantage to this and only downsides. Not doing =
it
> > > and relying on the "control cache" can work, but we need to specify
> > > that only a single stream can be decoded per opened instance of the
> > > v4l2 device. This is the assumption we're going with for handling
> > > multi-slice anyway, so it shouldn't be an issue.
> >
> > My opinion on this is that the m2m instance is a state, and the driver
> > should be responsible of doing time-division multiplexing across
> > multiple m2m instance jobs. Doing the time-division multiplexing in
> > userspace would require some sort of daemon to work properly across
> > processes. I also think the kernel is better place for doing resource
> > access scheduling in general.
>
> I agree with that yes. We always have a single m2m context and specific
> controls per opened device so keeping cached values works out well.
>
> So maybe we shall explicitly require that the request with the first
> slice for a frame also contains the per-frame controls.
>

Agreed.

One more argument not to allow such multiplexing is that despite the
API being called "stateless", there is actually some state saved
between frames, e.g. the Rockchip decoder writes some intermediate
data to some local buffers which need to be given to the decoder to
decode the next frame. Actually, on Rockchip there is even a
requirement to keep the reference list entries in the same order
between frames.

Best regards,
Tomasz
