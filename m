Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4978217E67
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 06:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgGHEfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 00:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728688AbgGHEfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 00:35:45 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E90C061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 21:35:45 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id h17so36775817oie.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 21:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1XbR8hdW5apDShmwJkURNynuMtZvWuauFKyiRicLKLU=;
        b=MBI7kpBNnws2lkIkxAI1TXg9weVckgH+DRh2jmehNAenn5bPaJ4jWIsQ/c90i+jL/N
         NuKhC9K/Ig3wSNwm7Q9KA4UDPwGAhAsMMWlZjC8GPgaJuNW/EiAwQhGFHDZofgYFQUKK
         s+woVolBF3XOCdip/4eD2tuXgFnTznjiaeeLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1XbR8hdW5apDShmwJkURNynuMtZvWuauFKyiRicLKLU=;
        b=tQOuaicvplbSAFFWSxPkZkEKbvV3SAuOoZamzkbr2MVX6cAYddoy67flZr66EvZRBv
         LYP/euclm9YgXPcQvCwxJq3NjODVx2UTMuZUP3uAx2V+oEmgLlg8Ya5qYNEkx1Hei7PX
         2GqQgV9e91O2y0dUYbg6rUwI34/OH2M/kCd67gab4Taj4yGuTkS0mPfe6cDuVAL0Xw87
         pYikPAagm0zlJ9refqDwmkJDvHuzyGbwO/1D4zP7fQGVJMIT60eN7ZDrm7E964sT6vQP
         PeLqqOjAQ33jMuJEjLMN93pnc29/IaB1drZw3FgVPPFDYb8JoNqvu92i1VZoIHhqBIsG
         v0Lw==
X-Gm-Message-State: AOAM532VDuyCZ9kNUrwcN4XfpSFw4zGvcoD823pQNvCysa1cHPw9aJrM
        lvtevgtp8UR9aj0SnLWmF8byewGTewtTwg==
X-Google-Smtp-Source: ABdhPJx3PJfgyUUmKnVeBydSV8Yju3977+Mn5NTSggS3ccxNldNWGcDX0m0JSpGHxyY0XwT9bKFb0g==
X-Received: by 2002:aca:4905:: with SMTP id w5mr6048726oia.172.1594182944268;
        Tue, 07 Jul 2020 21:35:44 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id r25sm579272oot.38.2020.07.07.21.35.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 21:35:42 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id x83so29208904oif.10
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 21:35:42 -0700 (PDT)
X-Received: by 2002:a05:6808:646:: with SMTP id z6mr5797953oih.71.1594182941910;
 Tue, 07 Jul 2020 21:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200623111325.237158-1-keiichiw@chromium.org>
 <2850781.lI95146Gml@os-lin-dmo> <CAD90VcbmrismAXW0t7K6M-=a2-P+OCOw8PvBr6r8S_3LNYu=pw@mail.gmail.com>
 <3163123.i8GTTo9gJ5@os-lin-dmo> <CAPBb6MWqYHidfaaTKq43yDtjOmKEi=AMC3O9vLdWpPBd_vFrUA@mail.gmail.com>
 <20200703051756-mutt-send-email-mst@kernel.org> <CAPBb6MXju_cc3FdWF60Ndx6aYfHmaGbQxu2a3QMxTfnLrXJxYQ@mail.gmail.com>
 <CAAFQd5CQuDgvZrYC53yKEYBY1LOX2QO8+7eRAscN5wQFmHmkZQ@mail.gmail.com>
In-Reply-To: <CAAFQd5CQuDgvZrYC53yKEYBY1LOX2QO8+7eRAscN5wQFmHmkZQ@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 8 Jul 2020 13:35:29 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXMFQe2Qg1_O01-9OcOEOwv+A0UFu9wBf1ctjVevHAWrg@mail.gmail.com>
Message-ID: <CAPBb6MXMFQe2Qg1_O01-9OcOEOwv+A0UFu9wBf1ctjVevHAWrg@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/1] Virtio Video Device Specification
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
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
        David Stevens <stevensd@chromium.org>, uril@redhat.com,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 3, 2020 at 6:55 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Fri, Jul 3, 2020 at 11:27 AM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > On Fri, Jul 3, 2020 at 6:18 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Fri, Jul 03, 2020 at 02:45:15PM +0900, Alexandre Courbot wrote:
> > > > Hi Dmitry,
> > > >
> > > > On Thu, Jul 2, 2020 at 10:47 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
> > > > >
> > > > > Hi Keiichi,
> > > > >
> > > > > Thanks for the clarification. I believe we should explicitly describe this in
> > > > > the VIRTIO_VIDEO_CMD_RESOURCE_ATTACH section. And I also still see a problem
> > > > > there. If it is a guest allocated resource, we cannot consider it to be free
> > > > > until the device really releases it. And it won't happen until we issue the
> > > > > next ATTACH call. Also, as we discussed before, it might be not possible to
> > > > > free individual buffers, but the whole queue only.
> > > >
> > > > In the case of the encoder, a V4L2 driver is not supposed to let
> > > > user-space dequeue an input frame while it is used as reference for
> > > > the encoding process. So if we add a similar rule in the virtio-video
> > > > specification, I suppose this would solve the problem?
> > > >
> > > > For the decoder case, we have a bigger problem though. Since DMABUFs
> > > > can be arbitrarily attached to any V4L2 buffer ID, we may end up
> > > > re-queueing the DMABUF of a decoded frame that is still used as
> > > > reference under a different V4L2 buffer ID. In this case I don't think
> > > > the driver has a way to know that the memory resource should not be
> > > > overwritten, and it will thus happily use it as a decode target. The
> > > > easiest fix is probably to update the V4L2 stateful specification to
> > > > require that reused DMABUFs must always be assigned to the same V4L2
> > > > buffer ID, and must be kept alive as long as decoding is in progress,
> > > > or until a resolution change event is received. We can then apply a
> > > > similar rule to the virtio device.
> > >
> > >
> > > Sounds like a generic kind of problem - how do other devices solve it?
> >
> > Most users of V4L2 drivers use MMAP buffers, which don't suffer from
> > this problem: since MMAP buffers are managed by V4L2 and the same V4L2
> > buffer ID always corresponds to the same backing memory, the driver
> > just needs to refrain from decoding into a given V4L2 buffer as long
> > as it is used as a reference frames. This is something that all
> > drivers currently do AFAICT.
> >
> > The problem only occurs if you let userspace map anything to V4L2
> > buffers (USERPTR or DMABUF buffers). In order to guarantee the same
> > reliable behavior as with MMAP buffers, you must enforce the same
> > rule: always the same backing memory for a given V4L2 buffer.
> >
> > ... or you can rotate between a large enough number of buffers to
> > leave enough space for the reference tag to expire on your frames, but
> > that's clearly not a good way to address the problem.
>
> FWIW, it's typically solved with regular devices by completely
> disallowing the DMABUF/USERPTR modes and only allowing the
> V4L2-managed MMAP mode for affected buffer queues.
>
> However, that's quite a severe limitation and with a careful API
> extension, DMABUF could be still handled. Namely:
>  - pre-registration of buffers at initialization time: that would
> likely mean mandating VIDIOC_QBUF for all indexes before any
> decoding/encoding can start,

Can't we get around this by just requiring that DMABUFs passed to
VIDIOC_QBUFs are always the same for a given index? Why would it be
necessary to require all buffers to be queued before starting the
codec?

>  - enforcement of index-buffer mapping: VIDIOC_QBUF would have to fail
> if one attempts to queue another buffer at the same index,
>  - ability to explicitly release existing buffers: there is
> VIDIOC_RELEASE_BUF in the works which could be used to release a
> specific index,
>  - ability to explicitly add new buffers: a combination of
> VIDIOC_CREATEBUFS + VIDIOC_QBUF could be already used to achieve this.

Even without these I guess we can probably get something working at
the cost of higher restrictions to clients (i.e. purely static set of
buffers).

>
> Best regards,
> Tomasz
