Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C64B1D2FB6
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 14:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgENMaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 08:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726056AbgENMaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 08:30:12 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82B9C061A0E
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:30:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so3856155wru.0
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=J2ZtatzqD3OE8VdsdW4HBUMkQqixlxQVBQrLMq5CUUY=;
        b=cna/1t9SJDeWhOllSyrFsbKx0FpSu+qU5vcjm9dCmgeETaVbC4scdE9YaQZa7xAhkr
         jHrdBmIyDJ83s6hG2UqR5xnjB9KlJDeexh3TNwXFT20K9xALDBUx8a5xF63UB4ckWqdz
         rmeI0Urauv7XBVMJ/YekgTPyJ+K5u+QxcAMms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=J2ZtatzqD3OE8VdsdW4HBUMkQqixlxQVBQrLMq5CUUY=;
        b=FYlmdK/Veig5aLbkcPOiLfyDJwrfZTEVqKn4ptTujo6qyIi5JhgoYptKPI0ueMpf6t
         h09obfuQT2zkXAone7//4XgeVboSPgE2DZeLZuI39Shy0kzFmHV/Po/7oGeZcWdCIT76
         w2pOtc0v/hEmQg2Y7dXhZQRmWCRFon+GPH6D7MSG/VVnYX+nPRRbZWxM80IZwjEKRK5G
         WMD88LlKubcQ9CtQLSfMDssMMMr0lb+sVGsboK3yNOfmxSS1IM5jKdKeOXP89qC2eTXE
         OKwpNljlxhUXiv+OQe2YyqTsIV8cZoS7moxV9FIMPnLmTgTmkXjZhRnPpPgS/N9VoCQ7
         2Isg==
X-Gm-Message-State: AOAM531/dfZnwyPgW1jZIv3foa0Gd5FcU/OA69CZGkJfkan9Nn8K0qwA
        HRUooXMglLXICqCjPicmaLC4+A==
X-Google-Smtp-Source: ABdhPJxzzUZ9N249No4GSzh95gQlAWDkP3vcLToZAWmJAuT2AF/3WaSYIEjZHpBOhUMq5YlyAgExqA==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr5203956wru.62.1589459410673;
        Thu, 14 May 2020 05:30:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p7sm4269731wmg.38.2020.05.14.05.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 05:30:09 -0700 (PDT)
Date:   Thu, 14 May 2020 14:30:07 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     David Stevens <stevensd@chromium.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>,
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
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200514123007.GP206103@phenom.ffwll.local>
Mail-Followup-To: David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
        David Airlie <airlied@linux.ie>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        virtio-dev@lists.oasis-open.org
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 05:19:40PM +0900, David Stevens wrote:
> Sorry for the duplicate reply, didn't notice this until now.
> 
> > Just storing
> > the uuid should be doable (assuming this doesn't change during the
> > lifetime of the buffer), so no need for a callback.
> 
> Directly storing the uuid doesn't work that well because of
> synchronization issues. The uuid needs to be shared between multiple
> virtio devices with independent command streams, so to prevent races
> between importing and exporting, the exporting driver can't share the
> uuid with other drivers until it knows that the device has finished
> registering the uuid. That requires a round trip to and then back from
> the device. Using a callback allows the latency from that round trip
> registration to be hidden.

Uh, that means you actually do something and there's locking involved.
Makes stuff more complicated, invariant attributes are a lot easier
generally. Registering that uuid just always doesn't work, and blocking
when you're exporting?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
