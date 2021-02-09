Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E021314874
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 07:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhBIGHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 01:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhBIGHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 01:07:30 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61415C061786
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 22:06:50 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id e18so20797979lja.12
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 22:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bFTwqrQOTlvInkNf0kKdtf4ltTQxpHoLu4FqF5dCdQo=;
        b=rdjuJ2gtSC65AiMzUutBnOi521KBaQqXUXIZ75BtduxsdrzHOoc8/KEGR8b0fL2OTD
         NqoRxhDmDihdffowk+nfprgxDkneP/ClGEH0Rw3QS07+TjhqaIQao7u8SmPkKAlvmF2j
         02STEAAA2wlu5SieMs4bzC2IYvMXYHPHtN40kV9bhdTyzPFI9xd+4a2qI9NJ01NYnsiX
         z3R+bCwu/RAonK7HoH20rp9LOPvI8CGgO+NSkouNuToG000yqFJoVzNWHwRx0OP/UV+0
         SnVOi5NjKPpapwoM7wYFCqr6wp3QXMGwzeqYTX/WNxhpMN7sUabhtsxgREVD7frjlZzX
         HMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bFTwqrQOTlvInkNf0kKdtf4ltTQxpHoLu4FqF5dCdQo=;
        b=XVXbV8gBPYEm23Hzo/lwJp80NZwtzskriWa69RDG7gGeVFaO2WaDnW7ZoUhpXNaXnG
         rlrkj7OyympYYNTAnaejlOd2wzFtmJFamygLKLQE0s6rDJqGqI9Z5JZBG+Sx8OF+/rWe
         +vEL9gnoPbeHKuetScN1oon0+vMXiHIV+rnmomsLP388FMi77uzY0Ouy8Y+bDRAUK3vA
         r25zEVb2iYZs7NgmPOkfBBoAElyZMuMZfWTU4xSwancn10SN1uxui997FkkV+OswcI48
         OmrHgj6vmxLQwXVx6FvQ0mRWr0juRvF1jo9AJeT/dLGlXdivQbJqzshw6JzQx9StGdN7
         bFLA==
X-Gm-Message-State: AOAM5318rqbZGRLYe1+V9l7Bw5FcD5imMdzhYRPP+pvsDh/DHM5mFa85
        2YKWDxZ9q4UKFHXIFC5PxZcHV5oi/J7yW4KGUETIgQ==
X-Google-Smtp-Source: ABdhPJyN4XoqzaWGUvPkIR0yrDQgDnrzfxCrV90pQln7s/bGvUOeWk45ZzLS/ufx3d3XNszY+sRsl+X5orkFZeOpMQI=
X-Received: by 2002:a2e:3018:: with SMTP id w24mr13882499ljw.333.1612850808847;
 Mon, 08 Feb 2021 22:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org> <YCENrGofdwVg2LMe@phenom.ffwll.local>
 <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com>
 <CAKMK7uECMOO5jx4433uDuMq=MBaBEYaLe6ysrT_pshrr6Bf9dA@mail.gmail.com> <CAO_48GGA9FajZ3FE---udupHTGSkafTf7MK01H4h4-NfR1DerA@mail.gmail.com>
In-Reply-To: <CAO_48GGA9FajZ3FE---udupHTGSkafTf7MK01H4h4-NfR1DerA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 8 Feb 2021 22:06:36 -0800
Message-ID: <CALAqxLXo3-2a5uOnmUd1WGfwtkb=5=2kauzgwi5CQzj=-K9k9Q@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 8, 2021 at 10:03 PM Sumit Semwal <sumit.semwal@linaro.org> wrot=
e:
>
> Hi Daniel,
>
> On Tue, 9 Feb 2021 at 02:36, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Feb 8, 2021 at 9:51 PM John Stultz <john.stultz@linaro.org> wro=
te:
> > > On Mon, Feb 8, 2021 at 2:08 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Sat, Feb 06, 2021 at 05:47:48AM +0000, John Stultz wrote:
> > > > > By default dma_buf_export() sets the exporter name to be
> > > > > KBUILD_MODNAME. Unfortunately this may not be identical to the
> > > > > string used as the heap name (ie: "system" vs "system_heap").
> > > > >
> > > > > This can cause some minor confusion with tooling, and there is
> > > > > the future potential where multiple heap types may be exported
> > > > > by the same module (but would all have the same name).
> > > > >
> > > > > So to avoid all this, set the exporter exp_name to the heap name.
> > > > >
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > Cc: Liam Mark <lmark@codeaurora.org>
> > > > > Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> > > > > Cc: Laura Abbott <labbott@kernel.org>
> > > > > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > > > Cc: Hridya Valsaraju <hridya@google.com>
> > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > Cc: Sandeep Patil <sspatil@google.com>
> > > > > Cc: Daniel Mentz <danielmentz@google.com>
> > > > > Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> > > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > Cc: Simon Ser <contact@emersion.fr>
> > > > > Cc: James Jones <jajones@nvidia.com>
> > > > > Cc: linux-media@vger.kernel.org
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > >
> > > > Looks reasonable to me.
> > > >
> > > > I guess the main worry is "does this mean heap names become uapi", =
in
> > > > which case I'm maybe not so sure anymore how this will tie into the
> > > > overall gpu memory accounting story.
> > > >
> > > > Since for dma-buf heaps one name per buffer is perfectly fine, sinc=
e
> > > > dma-buf heaps aren't very dynamic. But on discrete gpu drivers buff=
ers
> > > > move, so baking in the assumption that "exporter name =3D resource =
usage for
> > > > this buffer" is broken.
> > >
> > > I suspect I'm missing a subtlety in what you're describing. My sense
> > > of the exporter name doesn't account for a buffer's usage, it just
> > > describes what code allocated it and implicitly which dmabuf_ops
> > > handles it.  Maybe could you give a more specific example of what
> > > you're hoping to avoid?
> >
> > Just paranoia really - on the linux side where we allocate most
> > buffers (even shared ones) with the driver, that allocator info isn't
> > that meaningful, it really just tells you which code
> > allocated/exported that dma-buf.
> >
> > But on Android, where all shared buffers come from specific heaps, it
> > is rather meaningful information. So I wondered whether e.g. the
> > android dmabuf debug tool uses that to collect per-heap stats, but
> > sounds like no right now. Plus with the chat we've had I think we have
> > a long-term plan for how to expose that information properly.
> >
> > > To me this patch is mostly just a consistency/least-surprise thing, s=
o
> > > the heaps exporter name matches the string used for the heap's charde=
v
> > > device (the interface used to allocate it) in output like
> > > debugfs/dma_buf/bufinfo.
> >
> > Yeah for debug this makes sense. a-b: me if you want that somewhere on
> > the patches.
>
> Great that this got sorted; I'll apply both the patches of this series
> to drm-misc-next, with your a-b.

Before you do, let me spin a v2 as I got some minor tweaks needed
(using const char*) to fix the kbuild bot errors.

thanks
-john
