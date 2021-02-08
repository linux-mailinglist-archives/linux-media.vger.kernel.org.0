Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B28314147
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 22:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhBHVHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 16:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235224AbhBHVGu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 16:06:50 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3A8C061786
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 13:06:10 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id l19so4649576oih.6
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 13:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vQz50O/ktJ04W7QSg0aQ+K5LizhyaY13N/jjRfnL8MQ=;
        b=VrgGYFARM6Ani9Qes+VGPFt+MtqItSmYYxUeYwlIhRCQqMDqT5A5dW9uoAuc4n4Lmb
         HOzyq4tL31RhQQ2JNHlodj/G4uJ9HJyq5nE93+DiaCDyo79ticWaFtY/q5J/LQvrS8Qq
         tWCIL98eTNQBCIg5qB9ZFRe7q0paeE3NdXwbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vQz50O/ktJ04W7QSg0aQ+K5LizhyaY13N/jjRfnL8MQ=;
        b=dAfbI6x/6aIrncCg17beTZG92n1PB3C6/t3FrWbzUpIdCnSAO0A2izISeoGbRGDh5L
         d3lTVfaA2qxQ00lTiCexIjFknsGP/+ITqH8vy2up3bAGLD4wYMK1rYsuHYTZfP+rNANN
         dB09RMEvd+J8i/kI7uinodJoCiNv/LlBX6S4dxMnxHxBW2Z5mF+sne+bKUtO/LMNqBBt
         n6spv1ByxL9v5D4BwwBeewhrc1ujgN9+uWhBvc4xKk5J8xAdwX5ME/9AKk/9uFcfCuuj
         fMDYdxHVUqQS/jljk2hf0VjVh1IGuTAnSQUbJ9UXw4qt1oh4hjygFtEsNAhABnloaVox
         fhGw==
X-Gm-Message-State: AOAM531EElcI4D3wpmWeO+O3vtiEmXx5rxWKaMNEz4x/etAoSqo+dar1
        wxtagdbk6TIQTYIiG5KT3gF5ohChw1sh9JBS7axffw==
X-Google-Smtp-Source: ABdhPJxXb5B/81zAt68xBP4U4swR34xTMrllQbQD2cTBMCEgDgID6RHPJmVY8X+xFjUiEHTQz30hepiShmiZprp8dv8=
X-Received: by 2002:aca:1906:: with SMTP id l6mr410002oii.101.1612818369680;
 Mon, 08 Feb 2021 13:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org> <YCENrGofdwVg2LMe@phenom.ffwll.local>
 <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com>
In-Reply-To: <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 8 Feb 2021 22:05:58 +0100
Message-ID: <CAKMK7uECMOO5jx4433uDuMq=MBaBEYaLe6ysrT_pshrr6Bf9dA@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
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

On Mon, Feb 8, 2021 at 9:51 PM John Stultz <john.stultz@linaro.org> wrote:
> On Mon, Feb 8, 2021 at 2:08 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Sat, Feb 06, 2021 at 05:47:48AM +0000, John Stultz wrote:
> > > By default dma_buf_export() sets the exporter name to be
> > > KBUILD_MODNAME. Unfortunately this may not be identical to the
> > > string used as the heap name (ie: "system" vs "system_heap").
> > >
> > > This can cause some minor confusion with tooling, and there is
> > > the future potential where multiple heap types may be exported
> > > by the same module (but would all have the same name).
> > >
> > > So to avoid all this, set the exporter exp_name to the heap name.
> > >
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Liam Mark <lmark@codeaurora.org>
> > > Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> > > Cc: Laura Abbott <labbott@kernel.org>
> > > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > Cc: Hridya Valsaraju <hridya@google.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Sandeep Patil <sspatil@google.com>
> > > Cc: Daniel Mentz <danielmentz@google.com>
> > > Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: James Jones <jajones@nvidia.com>
> > > Cc: linux-media@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> >
> > Looks reasonable to me.
> >
> > I guess the main worry is "does this mean heap names become uapi", in
> > which case I'm maybe not so sure anymore how this will tie into the
> > overall gpu memory accounting story.
> >
> > Since for dma-buf heaps one name per buffer is perfectly fine, since
> > dma-buf heaps aren't very dynamic. But on discrete gpu drivers buffers
> > move, so baking in the assumption that "exporter name =3D resource usag=
e for
> > this buffer" is broken.
>
> I suspect I'm missing a subtlety in what you're describing. My sense
> of the exporter name doesn't account for a buffer's usage, it just
> describes what code allocated it and implicitly which dmabuf_ops
> handles it.  Maybe could you give a more specific example of what
> you're hoping to avoid?

Just paranoia really - on the linux side where we allocate most
buffers (even shared ones) with the driver, that allocator info isn't
that meaningful, it really just tells you which code
allocated/exported that dma-buf.

But on Android, where all shared buffers come from specific heaps, it
is rather meaningful information. So I wondered whether e.g. the
android dmabuf debug tool uses that to collect per-heap stats, but
sounds like no right now. Plus with the chat we've had I think we have
a long-term plan for how to expose that information properly.

> To me this patch is mostly just a consistency/least-surprise thing, so
> the heaps exporter name matches the string used for the heap's chardev
> device (the interface used to allocate it) in output like
> debugfs/dma_buf/bufinfo.

Yeah for debug this makes sense. a-b: me if you want that somewhere on
the patches.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
