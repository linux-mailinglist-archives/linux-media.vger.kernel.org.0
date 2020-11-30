Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6019B2C829B
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgK3KuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgK3KuC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:50:02 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53ADFC0613CF
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:49:22 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id b8so10757484ila.13
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FrBQ+cllYh0Y6esR/SPkKcDu8fDsRwcNF9P9vUYZvL4=;
        b=EqEeBGdID896KqQP2wGl3MacDZiftoQYvHOoa+q0ty3hiMysQXNvD+Cbzd5XWyH6oC
         /R/jipmJirrS7xxuCq09QfhPWJ6BcZs6J5DXml/OSDTep21CZvCNfFppev46/gu0R/Dp
         L8taqeCxff7s2jiuUfS1zwdg22lepLaEZGuQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FrBQ+cllYh0Y6esR/SPkKcDu8fDsRwcNF9P9vUYZvL4=;
        b=Xks4mVsojvb6aQLDTpl49SyhPcoK6PUCAE08xwnwRY+cRkiNS+kwrNF1ebQrrDH8+S
         h1U48LBzOzjz2Y19UlLHTlpoUzBc3fk7Uy6YF8Kplwc4ST1wms4yzBACjjLfoAeUPIiL
         tWNg/d9BuG9sf1JbogEilaDDj9145teIA2m7MsiYfi+o26aQSTXw2aJ6q0sRbxGTiXwO
         L21ryI8pHTdNLXSkaSF7RcjNec8VR9E4CFvNuVz5BLIGt8zB84VWHwqRoxKBXF3juBT1
         iOsXpdfxclsjROs/tc4V0l2iKkF7CuLSRC806qW6KMOOU2/1/ZU6wdNe9qDWlZhYZpXp
         s0QA==
X-Gm-Message-State: AOAM5321xyoY3UhSA+AcGyOiAQ+XAkoXQiLTXuMn56AzkcUnpCAq9M3A
        b6LjEIha0BJAKIWnJZPynHYq5xW9OxBt1Q==
X-Google-Smtp-Source: ABdhPJwF0vAAKaU7IS5RhWsb6nNEYJQx7a2qHPN0LDqE21UTAZ06lAT+tumQb/8m3FYNKO8m3hk4Kg==
X-Received: by 2002:a92:1a0d:: with SMTP id a13mr10242787ila.109.1606733361548;
        Mon, 30 Nov 2020 02:49:21 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id z7sm7177670ilu.18.2020.11.30.02.49.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 02:49:20 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id k3so3352992ioq.4
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:49:20 -0800 (PST)
X-Received: by 2002:a02:c042:: with SMTP id u2mr12243455jam.32.1606733360204;
 Mon, 30 Nov 2020 02:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
In-Reply-To: <20201130083410.GD32234@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 30 Nov 2020 11:49:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCtE3TqOK0cbw0SJ3LfqCsM3B8AFjBomfj4hcftyHXYXLg@mail.gmail.com>
Message-ID: <CANiDSCtE3TqOK0cbw0SJ3LfqCsM3B8AFjBomfj4hcftyHXYXLg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph

On Mon, Nov 30, 2020 at 9:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#ifndef CONFIG_DMA_NONCOHERENT
>
> I think you need to drop this ifdef.  This code should work just fine
> on noncoherent mips and sh platforms.
>
> > +     uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > +                                              &uvc_urb->dma,
> > +                                              gfp_flags | __GFP_NOWARN, 0);
> > +     if (!uvc_urb->pages)
> > +             return false;
> > +
> > +     uvc_urb->buffer = vmap(uvc_urb->pages,
> > +                            PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> > +                            VM_DMA_COHERENT, PAGE_KERNEL);
> > +     if (!uvc_urb->buffer) {
> > +             dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +                                    uvc_urb->pages, uvc_urb->dma);
> > +             return false;
> > +     }
> > +
> > +     if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
> > +                             PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
> > +                             stream->urb_size, GFP_KERNEL)) {
> > +             vunmap(uvc_urb->buffer);
> > +             dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +                                    uvc_urb->pages, uvc_urb->dma);
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
>
> I wonder if we should lift this into a helper.  On the one hand I had
> proliferating struct scatterlist usage, on the other hand it is all over
> the media and drm code anyway, and duplicating this doesn't help anyone.
>
> Possibly including the fallback to the coherent allocating.

Probably Sergey has best opinion of this than mine. I only had to look
into one driver, he has been working with the vb2, which uses the API
much more.



-- 
Ricardo Ribalda
