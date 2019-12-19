Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF2E1125E69
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 11:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfLSKAQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 05:00:16 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37585 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfLSKAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 05:00:15 -0500
Received: by mail-ed1-f68.google.com with SMTP id cy15so4256694edb.4
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kptvJQiwY0f0jKPZaorew/kszDrUaorltfUPXLGjup4=;
        b=nO0b7djIoFaOvx66XsstxLKhuKj0P8rEKwUMKYwb0zRK9ftZR4GmE5ExTT7jO1V5DV
         JuKTws8eHMuGgBuyAHWvFyf+jiivO0ykarHkxypviMNkqDfKt1aozB12FqzBeFTZV/hh
         /wrtx1UVos9y2NibHVStuulHHWoaZZVXKjJ2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kptvJQiwY0f0jKPZaorew/kszDrUaorltfUPXLGjup4=;
        b=Uun+LwKZf9ve1CxJHt/xV49DVLR/xAZvSC927BgSjGl8DFRY53LgjtFZYSHzze8nqA
         TMHCLKyCE+r04mklhiO68JMdC+z/GUkvMvznsnor1CFSNcVJSZtMmZThprAtOZirxoi7
         JvLU5GLDedwPzy3jESCZ7e99lJuJMkq85t9SelJnWQOw1k62R1CE6R1FSsYzjACa4OlY
         i2o09iLDrEf6+bj6SV0I6Bz2pFS34stxKybqxYsMI8LXVZ8QhfBcw7b9CLLyHxSerAhM
         6x1kkVbFUiIkDXr+bYe9j81YqPclNbsO8iz7V2XyKlE5iqS2DP3Sdfi22ijUdld8WOgE
         kqXA==
X-Gm-Message-State: APjAAAX4XpsS37DNKbs22SU74zEZR9KCUTG4VBI1k6jfwMVblo5+11MI
        jrL6lA1Vo/pwj0h+fFt6QvLHxVL2IAGbKg==
X-Google-Smtp-Source: APXvYqw9uP5CVg3Uv4i+y25Obv+008X3dAd00rieWhII2RcnmQJ4pPDlJXf1SKDPcLEF1QoI7HQaaA==
X-Received: by 2002:a17:906:af8d:: with SMTP id mj13mr8414393ejb.156.1576749613677;
        Thu, 19 Dec 2019 02:00:13 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id x41sm268194ede.27.2019.12.19.02.00.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 02:00:12 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id f129so4938205wmf.2
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 02:00:12 -0800 (PST)
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr9136717wmk.85.1576749612032;
 Thu, 19 Dec 2019 02:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <20191218130214.170703-2-keiichiw@chromium.org> <20191218134037.3jbouht52bxqwfyy@sirius.home.kraxel.org>
 <2570078.xtWa8k4VtA@os-lin-dmo>
In-Reply-To: <2570078.xtWa8k4VtA@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 19 Dec 2019 18:59:59 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CVkcQmMt=H74E4uHE26jidTfg2neJ6sYGKRa9XRxYxwQ@mail.gmail.com>
Message-ID: <CAAFQd5CVkcQmMt=H74E4uHE26jidTfg2neJ6sYGKRa9XRxYxwQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virtio-video: Add virtio video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
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

On Thu, Dec 19, 2019 at 6:26 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Gerd,
>
> On Mittwoch, 18. Dezember 2019 14:40:37 CET Gerd Hoffmann wrote:
> >   Hi,
> >
> > > +The device MUST mark the last buffer with the
> > > +VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
> > > +sequence.
> >
> > No, that would build a race condition into the protocol.  The device
> > could complete the last buffer after the driver has sent the drain
> > command but before the device saw it.  So the flag would not be
> > reliable.
> No, then it means the device was not in drain, but, for example, hit a
> resolution change in the stream and tells us that this is the last buffer with
> the old resolution.
>
> >
> > I also can't see why the flag is needed in the first place.  The driver
> > should know which buffers are queued still and be able to figure
> > whenever the drain is complete or not without depending on that flag.
> > So I'd suggest to simply drop it.
> This flag is used not for drain only. In marks the completion of whatever
> specific buffer sequence, like a full end-of-stream, resolution change, drain
> etc. We also need this to handle nested sequences. For instance, a resolution
> change event might happen while in drain.

Good point. The resolution change event is in a different virtqueue,
so it's not serialized with the request completions.
