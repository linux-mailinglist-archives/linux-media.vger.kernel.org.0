Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4A0281BB5
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 21:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388538AbgJBTWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 15:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388451AbgJBTWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 15:22:18 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FA9C0613D0;
        Fri,  2 Oct 2020 12:22:15 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id g26so621628ooa.9;
        Fri, 02 Oct 2020 12:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtkiGjkyzPqhHXvj+x4KevVCs1UVs2TLajO5QFK46lc=;
        b=pyCYGPD3z231H+FQCXNEMLBtwRoKmxKBpFEKm871TgQU8g0X8z2LzGq3oGkeS5tId6
         2OjBG9lDxg08oGQpJZn5YUoFRjrDuVdqQVFb4w+hBOrxNG6DqBJwawSIiKC9egvCjB02
         Xw0waBU/U8aGynIrCK89k3Jdpw7z3gEFzB4jasOXhXEyNbxDcZrLX7dRpFGKQoKw1Tws
         aLL3JDgghZLFX8ZY8jZDZOeRMejsM+55Cdtpn64aGJMuNlg/C9MwjlV2q4dNBpKlf7yk
         7CMS1H3Bkbl6Ac+k8YwG1V0D40n/6TqKugG/Uh9B1bMTgFcoERjMQ390o1uoJ6zqs1ZP
         ObOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtkiGjkyzPqhHXvj+x4KevVCs1UVs2TLajO5QFK46lc=;
        b=IlKRih1aUtcUykxiNm2BBs0g4FhIG2XCowYqCpAmBRYlL2Pj8xSc7Y/+l2d6rE4taX
         uwwFwDIWidpN3G585JF5lBD3PSkE+T8+sDt/yt0PHzFjzYwp0JYKDyIKvGHcRCXkCOKi
         ULNPFo2hjchogUW43sNZCQPLs18VPKWCImgJh3CeQKzacg8sOgiLy3YskjgU5wh+0IRY
         Fu2ox1mOr0lnL/X0QImD8A502xoC7n6VIKHbNPfpQ+eG9IsMUzCXFluo+f2BEYDQqSB2
         u9oiO9OvRP5oHNhg6AOQYD1PyIlOh0g3VvBEJvo0JoQo1xPnWx3WW/vdcclxpsXXArVY
         drPw==
X-Gm-Message-State: AOAM533ldunzwLVuaadzIGaDmllZAZh5+LEvyW9ZCs8AoiJfkgjWeueg
        0sty1Oo11Tl1A75EWCavJkCVh9T75Oy3RFbNRRY=
X-Google-Smtp-Source: ABdhPJx7YX8zviFjrOEhTKLkYmCq2KlFovtI8luMYDcSxruAN3b9De/JFEEiXwNOCHvtvZ+X9imhz+Hlu9vqUFcQCHI=
X-Received: by 2002:a4a:d509:: with SMTP id m9mr3027482oos.77.1601666534935;
 Fri, 02 Oct 2020 12:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch> <CAAFQd5AsFOau=m_3UPh2tKqwiUJaY4NH9HHrHJ17gbCLDgTNCQ@mail.gmail.com>
In-Reply-To: <CAAFQd5AsFOau=m_3UPh2tKqwiUJaY4NH9HHrHJ17gbCLDgTNCQ@mail.gmail.com>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Fri, 2 Oct 2020 22:21:47 +0300
Message-ID: <CAFCwf12zK9oLoShj9C71Bysg4Sd0VCaOHqPRJznZa_+SpB4j-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/frame-vec: Drop gup_flags from get_vaddr_frames()
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 2, 2020 at 9:23 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Fri, Oct 2, 2020 at 7:53 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > FOLL_WRITE | FOLL_FORCE is really the only reasonable thing to do for
> > simple dma device that can't guarantee write protection. Which is also
> > what all the callers are using.
> >
> > So just simplify this.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Pawel Osciak <pawel@osciak.com>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Tomasz Figa <tfiga@chromium.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Oded Gabbay <oded.gabbay@gmail.com>
> > Cc: Omer Shpigelman <oshpigelman@habana.ai>
> > Cc: Tomer Tayar <ttayar@habana.ai>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Pawel Piskorski <ppiskorski@habana.ai>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-mm@kvack.org
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_g2d.c           | 3 +--
> >  drivers/media/common/videobuf2/videobuf2-memops.c | 3 +--
> >  drivers/misc/habanalabs/common/memory.c           | 3 +--
> >  include/linux/mm.h                                | 2 +-
> >  mm/frame_vector.c                                 | 4 ++--
> >  5 files changed, 6 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > index 967a5cdc120e..ac452842bab3 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > @@ -480,8 +480,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
> >                 goto err_free;
> >         }
> >
> > -       ret = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
> > -               g2d_userptr->vec);
> > +       ret = get_vaddr_frames(start, npages, g2d_userptr->vec);
> >         if (ret != npages) {
> >                 DRM_DEV_ERROR(g2d->dev,
> >                               "failed to get user pages from userptr.\n");
> > diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
> > index 6e9e05153f4e..9dd6c27162f4 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-memops.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-memops.c
> > @@ -40,7 +40,6 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
> >         unsigned long first, last;
> >         unsigned long nr;
> >         struct frame_vector *vec;
> > -       unsigned int flags = FOLL_FORCE | FOLL_WRITE;
> >
> >         first = start >> PAGE_SHIFT;
> >         last = (start + length - 1) >> PAGE_SHIFT;
> > @@ -48,7 +47,7 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
> >         vec = frame_vector_create(nr);
> >         if (!vec)
> >                 return ERR_PTR(-ENOMEM);
> > -       ret = get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
> > +       ret = get_vaddr_frames(start & PAGE_MASK, nr, vec);
> >         if (ret < 0)
> >                 goto out_destroy;
> >         /* We accept only complete set of PFNs */
>
> For drivers/media/common/videobuf2/:
>
> Acked-by: Tomasz Figa <tfiga@chromium.org>
>
> Best regards,
> Tomasz

For drivers/misc/habanalabs:
Acked-by: Oded Gabbay <oded.gabbay@gmail.com>

Thanks,
Oded
