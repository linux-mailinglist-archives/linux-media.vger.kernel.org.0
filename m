Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916DF3AAECD
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 10:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhFQIch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 04:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbhFQIcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 04:32:33 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26A7C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 01:30:25 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r7so2775394edv.12
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aCrVXPjPleKRWCwRkIC1bYwcah/f3G21T+lRBwgsVZA=;
        b=Pq/9zMv+/ARBkhNnWG4THdQB8bofy/At19gV8bdA1AYnGgM1Y+ZCqupZ59ExgV0TsW
         jo/1MnZ5o7eW/siImByLzN0YUEjf6ZmYzdLHjI5qnJB8NW8Q6ltuE/Om5r0dolVo0KSi
         8g+dpvas04ZWyRtIYuwghQACK06a9/bSZKCiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aCrVXPjPleKRWCwRkIC1bYwcah/f3G21T+lRBwgsVZA=;
        b=pOZ67OYez368z/4CQcyRqQyn7XZhbjtnru0vG47/2l8sjgaLy520uLUKIPB3605dww
         Z/oBHoZpg+HNOwXKbGeCXozmyxtBkR7sCjPFN/Zh6L/Yz0NEtrrJ4x2jY9lsNcTWGO2h
         MBcUcDKDJkuBvYzaQaozI+ZEaXS94L4GvUaK1zQXSllUyInEmbMPRe5FRRw3eAfHtSR6
         YrLACLVXSiNRycjxUWK2V4Hu47aBFBEOVnF1LQtiBkD5HZ+j5BHVtfUcoEo0+eVWd2Mf
         e10hF04aqNemaqQSmKn6FP/V2xvMN6iR4pVblaSaNGw4EWfK+cnJW1W2KSLT0F6muX3W
         i0DQ==
X-Gm-Message-State: AOAM5315CeM9DAOWRiLXJJ4EyRJGiN6sOwbxJe0/j1YCsfytAn5NkHK6
        8c7IAw7butuEAVL+7cYdy4a+GtZLxnDAVg==
X-Google-Smtp-Source: ABdhPJz2ZnKKFOU5iGLdmgJQWgVskJX/0avWXtzemtSpsiXPN7MG1Ksnc9nXUPj2uAt/oCsWvz4Q2w==
X-Received: by 2002:aa7:c256:: with SMTP id y22mr1463383edo.177.1623918624034;
        Thu, 17 Jun 2021 01:30:24 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id f11sm3172917edd.74.2021.06.17.01.30.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 01:30:23 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id r9so5717381wrz.10
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 01:30:23 -0700 (PDT)
X-Received: by 2002:a05:6000:551:: with SMTP id b17mr4171056wrf.32.1623918622627;
 Thu, 17 Jun 2021 01:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com> <20210617080107.GA1422@lst.de>
In-Reply-To: <20210617080107.GA1422@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 17 Jun 2021 17:30:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com>
Message-ID: <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 5:01 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jun 17, 2021 at 04:56:17PM +0900, Sergey Senozhatsky wrote:
> > > This function can use some comments. What is happening AFAICS is that
> > > buf->vaddr is either set in vb2_dc_alloc_coherent (unless
> > > DMA_ATTR_NO_KERNEL_MAPPING was set), it is obtained through dma_buf_vmap()
> > > if the buffer was attached to a dma_buf, or it is allocated via
> > > dma_vmap_noncontiguous() for non-coherent memory.
> >
> > Yeah, it's complicated. Maybe we can make things more symmetrical.
> >
> > > But this leaves coherent memory with DMA_ATTR_NO_KERNEL_MAPPING set, what
> > > is vaddr in that case? I think it will call dma_vmap_noncontiguous()
> > > incorrectly in that case, shouldn't there be a check for !buf->coherent_mem
> > > before the call to dma_vmap_noncontiguous()?
> >
> > Thanks a lot for looking into it.
>
> Can we just kill off DMA_ATTR_NO_KERNEL_MAPPING in v4l now?  There really is
> no good reason to use that with dma_alloc_noncoherent/noncontiguous
> available, and I plan to eventually remove that interface entirely.

We still have use cases for dma_alloc_coherent() and DMA_ATTR_NO_KERNEL_MAPPING.

Perhaps the way to handle this would be to make the
dma_alloc_coherent() behave the same way as dma_alloc_noncontiguous(),
where it just allocates the memory without handling the kernel
mapping?

Best regards,
Tomasz
