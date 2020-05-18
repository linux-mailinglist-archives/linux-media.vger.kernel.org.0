Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1111D7696
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 13:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgERLRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 07:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgERLRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 07:17:15 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9C1C061A0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 04:17:14 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id x22so4095079otq.4
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g503Ck8Hmnwm3Mle9RPu3pG4Ds3hYRoRksfGfnX5Wtc=;
        b=IboKzie54ObNPp3JiHhtIQ8kPbLLNHmAcRRYDKnk1oArIjZ+GMd10k4aYMJSRPb9zG
         17F0resl74uiihv4gxGIutzAXhic+K18i7W3hyGwgMfTt8nCdTFLiRiH/3M90+eJtdp8
         NOtY1+r+bXRxOoYA/CFBWd3Y29PGDF37HlePI4bTyWF2JDP4nX+bpXNsXdtCMybiKvJk
         3xL5+CrFHGwbOdHy5qb3FBbTBNIDGk7CJwhLUp4tig7HJTZMNmUt4I/ZmlrsqxCOu96c
         odlDwjvWGdMjf7bSEZvSr2V+hOQ8gJPE9TtlDbNnG+73EW9FbfvLzrsTUZwGJeNQoI66
         xWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g503Ck8Hmnwm3Mle9RPu3pG4Ds3hYRoRksfGfnX5Wtc=;
        b=pNMm63pSEVRaBaS2xFEb0hEUA6zS1DJqWP917QUtaXjwFFVtCl3gqGjE097ImOOWWD
         YTpkItsvpfVVOf+ET7tkMXZCyHbsvQFcdWbIJ2C5QuW7sAifSQC+KMBTPJ2sAAe4dtG6
         orc0UU7ZTDL+DtwmZR4Ikodrb6R3LpwxbVjutB7p/ijXDmM/ptC79kT6qjzOwhWsX4rA
         Zz8lCHWYt9cCFgd+OQHSut8ePL1HiW8gLnAHtUPxIy/LRKbeEJhZ9eipMSSa63+vTZLe
         hZnvjVxR9LTceRM+eDCMQ9v5En0eg4JV7mE7wf9US4jT6kfMOIsLoaa2ctjtvM2F9w55
         1L0w==
X-Gm-Message-State: AOAM530YriDERfq4p7uCkIlJetmQ882pEja08927AsghdptYAR+s+M/8
        IflyXhH4D+5WZu99PzN9Sx6D8VmctA/CWuGxiBdNmA==
X-Google-Smtp-Source: ABdhPJwl5rqs5VWO5Jkao2XeEWkRX+lCx01ip7F50tguMxrw+WswGeYLG9OGd+5XHn6jnx/Q1aQbMIwBn56Y/9LJcLA=
X-Received: by 2002:a9d:ec7:: with SMTP id 65mr11530376otj.164.1589800633898;
 Mon, 18 May 2020 04:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org> <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
 <20200514123007.GP206103@phenom.ffwll.local> <CAD=HUj7452eFfn9i=JWm54Mke3Lew-7AWYeoKZLAjCSg7eLO6A@mail.gmail.com>
 <20200515140306.GF206103@phenom.ffwll.local>
In-Reply-To: <20200515140306.GF206103@phenom.ffwll.local>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Mon, 18 May 2020 16:47:02 +0530
Message-ID: <CAO_48GG85PhyoZ1yzXuwv8tT12V4dkDsXc8_RaMd--oinkpN2g@mail.gmail.com>
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

Hello David,

On Fri, 15 May 2020 at 19:33, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, May 15, 2020 at 02:07:06PM +0900, David Stevens wrote:
> > On Thu, May 14, 2020 at 9:30 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, May 14, 2020 at 05:19:40PM +0900, David Stevens wrote:
> > > > Sorry for the duplicate reply, didn't notice this until now.
> > > >
> > > > > Just storing
> > > > > the uuid should be doable (assuming this doesn't change during the
> > > > > lifetime of the buffer), so no need for a callback.
> > > >
> > > > Directly storing the uuid doesn't work that well because of
> > > > synchronization issues. The uuid needs to be shared between multiple
> > > > virtio devices with independent command streams, so to prevent races
> > > > between importing and exporting, the exporting driver can't share the
> > > > uuid with other drivers until it knows that the device has finished
> > > > registering the uuid. That requires a round trip to and then back from
> > > > the device. Using a callback allows the latency from that round trip
> > > > registration to be hidden.
> > >
> > > Uh, that means you actually do something and there's locking involved.
> > > Makes stuff more complicated, invariant attributes are a lot easier
> > > generally. Registering that uuid just always doesn't work, and blocking
> > > when you're exporting?
> >
> > Registering the id at creation and blocking in gem export is feasible,
> > but it doesn't work well for systems with a centralized buffer
> > allocator that doesn't support batch allocations (e.g. gralloc). In
> > such a system, the round trip latency would almost certainly be
> > included in the buffer allocation time. At least on the system I'm
> > working on, I suspect that would add 10s of milliseconds of startup
> > latency to video pipelines (although I haven't benchmarked the
> > difference). Doing the blocking as late as possible means most or all
> > of the latency can be hidden behind other pipeline setup work.
> >
> > In terms of complexity, I think the synchronization would be basically
> > the same in either approach, just in different locations. All it would
> > do is alleviate the need for a callback to fetch the UUID.
>
I think I agree with Daniel there - this seems best suited for code
within virtio.

> Hm ok. I guess if we go with the older patch, where this all is a lot more
> just code in virtio, doing an extra function to allocate the uuid sounds
> fine. Then synchronization is entirely up to the virtio subsystem and not
> a dma-buf problem (and hence not mine). You can use dma_resv_lock or so,
> but no need to. But with callbacks potentially going both ways things
> always get a bit interesting wrt locking - this is what makes peer2peer
> dma-buf so painful right now. Hence I'd like to avoid that if needed, at
> least at the dma-buf level. virtio code I don't mind what you do there :-)
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

Best,
Sumit.
