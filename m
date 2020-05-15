Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3335C1D4508
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 07:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgEOFHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 01:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726000AbgEOFHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 01:07:20 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84878C05BD09
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 22:07:20 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id f189so1369473qkd.5
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 22:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfF55UVZjZM13JJTcnu7JHGlCcIWGQ0KC6+T1Qa4Oq4=;
        b=AUvyL4TrY/k0uZRpPONkWX0+DRa3JypYhUj9VUTVReBzRNCwB1qGlwB9+xMr/5qKUx
         662uoI0vmPYDQnkLnnoPeZk/8z5J82Bqaw2vZ2igGOXzasFB4XeQNy5SnPAM3aL8d+dm
         HgPH9ubkVbJpPFnpDTFwU2IAAxWbjm6erdork=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfF55UVZjZM13JJTcnu7JHGlCcIWGQ0KC6+T1Qa4Oq4=;
        b=eW7up0tA/LTFSO5LCiL8USdVGGr5KC4iWrSARFjlwmRvOSStx/5SMnOw41TE622vOl
         vi1+OoIBqF1/XZ6tJvdbcWO9eOCELRYn/URQG/rzEr/zUlv/WbaDyALtr+Ff9+UTYYOC
         +Xv63m7g0HmtfoX1pcTTGlw8xSbyIg7NoY01ydhcDApto1MZcZCLM+u+wsFraPEe/I66
         3Gc0s6DDZCurajXbAT1wrZqBLZ+CHQWnRX0K5KonYKZ47NfsHHJSmeEmxvUjqnWnQmJ0
         09M6oAixIeStV2BRoAtNhZBG6GuF8ATH8PydMIQl2IBkIBhEte4JSUZyCWWEI8x51yL6
         0lGQ==
X-Gm-Message-State: AOAM533UhEw1aopZfmD4k1CjJWBr1M42WWYiGGwogTcYDSKLyZSI0xu4
        seNdR2EOcf2H8nTVIHbcqfViC+gNaNX4HjwaOQe3hw==
X-Google-Smtp-Source: ABdhPJyqOHTg5AoTGt1Wmzq0ZYIgGB8E4GOtO/n0hCoWBO8WJJlXQqAIbxufbFlLVFtiOfb9I3n6izakdsqzpPkbIcE=
X-Received: by 2002:a37:a3d6:: with SMTP id m205mr1607571qke.241.1589519239498;
 Thu, 14 May 2020 22:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org> <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com> <20200514123007.GP206103@phenom.ffwll.local>
In-Reply-To: <20200514123007.GP206103@phenom.ffwll.local>
From:   David Stevens <stevensd@chromium.org>
Date:   Fri, 15 May 2020 14:07:06 +0900
Message-ID: <CAD=HUj7452eFfn9i=JWm54Mke3Lew-7AWYeoKZLAjCSg7eLO6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
To:     David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        David Airlie <airlied@linux.ie>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 9:30 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, May 14, 2020 at 05:19:40PM +0900, David Stevens wrote:
> > Sorry for the duplicate reply, didn't notice this until now.
> >
> > > Just storing
> > > the uuid should be doable (assuming this doesn't change during the
> > > lifetime of the buffer), so no need for a callback.
> >
> > Directly storing the uuid doesn't work that well because of
> > synchronization issues. The uuid needs to be shared between multiple
> > virtio devices with independent command streams, so to prevent races
> > between importing and exporting, the exporting driver can't share the
> > uuid with other drivers until it knows that the device has finished
> > registering the uuid. That requires a round trip to and then back from
> > the device. Using a callback allows the latency from that round trip
> > registration to be hidden.
>
> Uh, that means you actually do something and there's locking involved.
> Makes stuff more complicated, invariant attributes are a lot easier
> generally. Registering that uuid just always doesn't work, and blocking
> when you're exporting?

Registering the id at creation and blocking in gem export is feasible,
but it doesn't work well for systems with a centralized buffer
allocator that doesn't support batch allocations (e.g. gralloc). In
such a system, the round trip latency would almost certainly be
included in the buffer allocation time. At least on the system I'm
working on, I suspect that would add 10s of milliseconds of startup
latency to video pipelines (although I haven't benchmarked the
difference). Doing the blocking as late as possible means most or all
of the latency can be hidden behind other pipeline setup work.

In terms of complexity, I think the synchronization would be basically
the same in either approach, just in different locations. All it would
do is alleviate the need for a callback to fetch the UUID.

-David
