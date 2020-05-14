Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0BB1D2506
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 04:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgENCJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 22:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726061AbgENCJG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 22:09:06 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91C9C061A0E
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 19:09:04 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id 59so948034qva.13
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 19:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iwY0Acbl9lzYaC/I7H5xpC4oYprSXfs6U4SArioBGuQ=;
        b=P3DlHD88DQf0dE0yDif2sw8Rynd10kLlNJTPW+b9QzdH57TyxXfF5ZNS/0Fw6PFJCG
         QW3kwdavSpCzJ1MTCu5QDGOqFbkR1lWztvohYFPSV6iT0JGQlY5iifKdUt621KTCAsGm
         9eeWjr+VlkkDTRsgo5ySgNBAgv+vYZS8h+BUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iwY0Acbl9lzYaC/I7H5xpC4oYprSXfs6U4SArioBGuQ=;
        b=DJ5HYRwNhKCpQ8E6S5VWKuE/l5y1853FC8GhVchzV29xbCv/YO8AjGurkToJ7BleRW
         o8Jhib0vGzsyQJ37bJSOLSZjP73YVOeJH9FBKkXvhBMawuA5c9UbSpIxpE23nvWyVTZH
         NhPZRVaRka+19smRUXNRp7wpVzSIKqzZA7FMv2oPJvRpLkFFe1iPK/jQEk3KWAyz3OGp
         wyUqqkTAoF8XC0yRYTcUc96iXdby93aO49Su47pM8tKNVu0fUfNBrQNuwer5T1pGqc7H
         /mzuVtsmgHTqYDaxZbdwAqcKF0XiVnJt6ShJofVIYfQ66CMfywoOzyBpNqFTlT1MRhOy
         Z2rQ==
X-Gm-Message-State: AOAM533ZG/v46yXw9ajM7Aerym6HjwF8tiowYoYPyyma/3eatv8KBALz
        jBI95w7RrRJbVxUcYK0jRei+SthjQzJFLpuUWmma4Q==
X-Google-Smtp-Source: ABdhPJx+twxQTtW8B+vhkz+0GPec5WaIV3J1v01kZlo95nTGu9ZPy4033fzgt5ebh+V0OgPHFEM+9syC1+lXQmTric4=
X-Received: by 2002:a05:6214:506:: with SMTP id v6mr2657680qvw.70.1589422143646;
 Wed, 13 May 2020 19:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org> <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
In-Reply-To: <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 14 May 2020 11:08:52 +0900
Message-ID: <CAD=HUj6d9gdZegTGad6thKdHv5b+qOZnkCv5VcWo9AcHifR9uA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Tomasz Figa <tfiga@chromium.org>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 12:45 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Mar 11, 2020 at 12:20 PM David Stevens <stevensd@chromium.org> wrote:
> >
> > This change adds a new dma-buf operation that allows dma-bufs to be used
> > by virtio drivers to share exported objects. The new operation allows
> > the importing driver to query the exporting driver for the UUID which
> > identifies the underlying exported object.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
>
> Adding Tomasz Figa, I've discussed this with him at elce last year I
> think. Just to make sure.
>
> Bunch of things:
> - obviously we need the users of this in a few drivers, can't really
> review anything stand-alone

Here is a link to the usage of this feature by the currently under
development virtio-video driver:
https://markmail.org/thread/j4xlqaaim266qpks

> - adding very specific ops to the generic interface is rather awkward,
> eventually everyone wants that and we end up in a mess. I think the
> best solution here would be if we create a struct virtio_dma_buf which
> subclasses dma-buf, add a (hopefully safe) runtime upcasting
> functions, and then a virtio_dma_buf_get_uuid() function. Just storing
> the uuid should be doable (assuming this doesn't change during the
> lifetime of the buffer), so no need for a callback.

So you would prefer a solution similar to the original version of this
patchset? https://markmail.org/message/z7if4u56q5fmaok4
