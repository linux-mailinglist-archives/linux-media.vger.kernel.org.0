Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CF6314870
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 07:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhBIGDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 01:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhBIGDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 01:03:44 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A26BC061788
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 22:03:04 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p21so26572289lfu.11
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 22:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gmQ70ZY+hZdLsMMGo2UlngmwDHJDaZ+KuDOOqW/O4fM=;
        b=MSe2G+QZ4H3yrCs40Y5Q5On9j3E2n6s1kR+l1TyP9LSx6o/ikcpalBDd2YZQe46vT+
         GeVCN17ebjtonmJ2kYBXgQyerjf/Gbqiwu5y0ZrHvAQihLvREjxIoF/OLK15kR014pNe
         6rdtN1/I7UJAtlgctWSVwRKheyKAdVDtrOkhNeflbhdt3r7/eRKlOT+olNYurUaBsTpV
         pv/Y454SwLRK0+GCmgCnwXzgPbR1cgGVB12Lm/jf0Kgchkwohp7oboCaaQm+3se9XXrc
         nms4ILFJWvdzXW/nGc6KFL3pgQmcAkgSIq+B25dz25SiBFwNa3O+wSLkU9dn5mR/hJOi
         T7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gmQ70ZY+hZdLsMMGo2UlngmwDHJDaZ+KuDOOqW/O4fM=;
        b=o3wSewr3QGlvQTu3+3CASvJTNUpLI0UznFbz0k61d6P9rzRcksOSqo22+ul0h0nt68
         aBPAuLkybyUt3wEwgfFn72WU2WMqEOh8nEU9SMMwEEiKtkMARRPJ1MhxBMRbexYDwJXN
         IWEakaehAvYgl3eurLt7u4pF86CmxceHemMLbeeb7NaEgHQMJxKUdKsCsbY7q8sucA+4
         4OC2eIo+8sJCtqt2U/aau7Kk77CIbfe7iYrajnE57DPHsjlUlXtzAmPtEs8ya2qvUz/o
         WtQYOpK0eqNqahVeQiHWlV2dTjHeX8PTVzAMcuFMCgc9p4MgfRRwfebKVuqV0/lVkvJ2
         oMYQ==
X-Gm-Message-State: AOAM533rki1p2FWNDQ1w8rnl0mrQKSK9jaeIXFKCDX5H3NINUrf5Wr09
        G1aM4VwnJG+rv5Tv8uiJWPn6UIaiKNcqih3jZEmAtg==
X-Google-Smtp-Source: ABdhPJzoEMSmKAOK750m9HyqOcDgOs0oLbBXoG2DDtIm7KWVsrpz7mJHR5AQVFQuTkIp0l0LCzkHGQvJ3hpQ9BYXkko=
X-Received: by 2002:a19:cc7:: with SMTP id 190mr4816030lfm.361.1612850582683;
 Mon, 08 Feb 2021 22:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org> <YCENrGofdwVg2LMe@phenom.ffwll.local>
 <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com> <CAKMK7uECMOO5jx4433uDuMq=MBaBEYaLe6ysrT_pshrr6Bf9dA@mail.gmail.com>
In-Reply-To: <CAKMK7uECMOO5jx4433uDuMq=MBaBEYaLe6ysrT_pshrr6Bf9dA@mail.gmail.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 9 Feb 2021 11:32:50 +0530
Message-ID: <CAO_48GGA9FajZ3FE---udupHTGSkafTf7MK01H4h4-NfR1DerA@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     John Stultz <john.stultz@linaro.org>,
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

Hi Daniel,

On Tue, 9 Feb 2021 at 02:36, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Feb 8, 2021 at 9:51 PM John Stultz <john.stultz@linaro.org> wrote=
:
> > On Mon, Feb 8, 2021 at 2:08 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Sat, Feb 06, 2021 at 05:47:48AM +0000, John Stultz wrote:
> > > > By default dma_buf_export() sets the exporter name to be
> > > > KBUILD_MODNAME. Unfortunately this may not be identical to the
> > > > string used as the heap name (ie: "system" vs "system_heap").
> > > >
> > > > This can cause some minor confusion with tooling, and there is
> > > > the future potential where multiple heap types may be exported
> > > > by the same module (but would all have the same name).
> > > >
> > > > So to avoid all this, set the exporter exp_name to the heap name.
> > > >
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: Liam Mark <lmark@codeaurora.org>
> > > > Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> > > > Cc: Laura Abbott <labbott@kernel.org>
> > > > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > > Cc: Hridya Valsaraju <hridya@google.com>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Sandeep Patil <sspatil@google.com>
> > > > Cc: Daniel Mentz <danielmentz@google.com>
> > > > Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > > > Cc: Simon Ser <contact@emersion.fr>
> > > > Cc: James Jones <jajones@nvidia.com>
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > >
> > > Looks reasonable to me.
> > >
> > > I guess the main worry is "does this mean heap names become uapi", in
> > > which case I'm maybe not so sure anymore how this will tie into the
> > > overall gpu memory accounting story.
> > >
> > > Since for dma-buf heaps one name per buffer is perfectly fine, since
> > > dma-buf heaps aren't very dynamic. But on discrete gpu drivers buffer=
s
> > > move, so baking in the assumption that "exporter name =3D resource us=
age for
> > > this buffer" is broken.
> >
> > I suspect I'm missing a subtlety in what you're describing. My sense
> > of the exporter name doesn't account for a buffer's usage, it just
> > describes what code allocated it and implicitly which dmabuf_ops
> > handles it.  Maybe could you give a more specific example of what
> > you're hoping to avoid?
>
> Just paranoia really - on the linux side where we allocate most
> buffers (even shared ones) with the driver, that allocator info isn't
> that meaningful, it really just tells you which code
> allocated/exported that dma-buf.
>
> But on Android, where all shared buffers come from specific heaps, it
> is rather meaningful information. So I wondered whether e.g. the
> android dmabuf debug tool uses that to collect per-heap stats, but
> sounds like no right now. Plus with the chat we've had I think we have
> a long-term plan for how to expose that information properly.
>
> > To me this patch is mostly just a consistency/least-surprise thing, so
> > the heaps exporter name matches the string used for the heap's chardev
> > device (the interface used to allocate it) in output like
> > debugfs/dma_buf/bufinfo.
>
> Yeah for debug this makes sense. a-b: me if you want that somewhere on
> the patches.

Great that this got sorted; I'll apply both the patches of this series
to drm-misc-next, with your a-b.

> -Daniel

Best
Sumit.

> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Thanks and regards,

Sumit Semwal
Linaro Consumer Group - Tech Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
