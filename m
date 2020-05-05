Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420611C51D6
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 11:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgEEJYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 05:24:51 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38374 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgEEJYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 05:24:50 -0400
Received: by mail-oi1-f193.google.com with SMTP id r66so1396581oie.5;
        Tue, 05 May 2020 02:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fA6tjdmApvG0BpsjkTdWv9/ZTQZ9vjPp82obp9l863E=;
        b=KuMdbSTevVVyIcYYwphkz89h1ykWQxiWyG2eWWDmtjnV+yzVc4tt2q8+BeaOpzjM1U
         yCoOgzHHy2BrTq5b3au0LHxkOhhw4Z9k4bLPrwuO/lytRpt6mL2+haUmOV1DQFjy4VXY
         1zNA43sIG/9b81RppTbGgEmH5N581W6CE9EUyScqWgQDE38GaloJ9gt4wTnypxmoQDsX
         W+EQyre3gBrosnxRDrqg2St+AdOSbKgPKyhqcbTzAvNrNJSivm/xbeBfql/gQdM9KVsk
         5WZzmCaE6u3AfXJXu/yrUHpSwZrvhJLLQ1magehi2GgProOFXFZOm/8Ymn6xRHF42yyh
         iMdw==
X-Gm-Message-State: AGi0PuarmqkJr6sohlcUqKgki7AcwsDBScsPOP4hlxLXa1y4giZPspff
        9/bcY/NHnL9l35nLVGTQwfX7b/e+jS736vysKlk=
X-Google-Smtp-Source: APiQypKOjAo7caYTLLrvaP2LfYH11Xj01QYaa+uBtqm/9mZJ41Mdkz0F6pXJ47B38HgwsYDHPLvoSnLN/Mh8S4elUzU=
X-Received: by 2002:aca:f541:: with SMTP id t62mr1674694oih.148.1588670688206;
 Tue, 05 May 2020 02:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <CGME20200505084634eucas1p1e0ea160dd77afbf6d2f7e6154ded40d0@eucas1p1.samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com> <20200505084614.30424-18-m.szyprowski@samsung.com>
In-Reply-To: <20200505084614.30424-18-m.szyprowski@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 May 2020 11:24:37 +0200
Message-ID: <CAMuHMdVisnijasoxazj+6kUFM3UrTYkVo6kC1dxZv5zK0yD7TQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/25] drm: rcar-du: fix common struct sg_table related issues
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linaro-mm-sig@lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Tue, May 5, 2020 at 10:48 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
> numer of the created entries in the DMA address space. However the
> subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
> called with the original number of the entries passed to dma_map_sg. The
> sg_table->nents in turn holds the result of the dma_map_sg call as stated
> in include/linux/scatterlist.h. A common mistake was to ignore a result
> of the dma_map_sg function and don't use the sg_table->orig_nents at all.
>
> To avoid such issues, lets use common dma-mapping wrappers operating
> directly on the struct sg_table objects and adjust references to the
> nents and orig_nents respectively.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
> vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187

For the modern lore-users:
https://lore.kernel.org/r/20200505083926.28503-1-m.szyprowski@samsung.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
