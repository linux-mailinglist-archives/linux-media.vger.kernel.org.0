Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2CC3D523C
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 06:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhGZDai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 23:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhGZDac (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 23:30:32 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D50DC061760
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:11:02 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id p5-20020a17090a8685b029015d1a9a6f1aso12007221pjn.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T6pXQ274+tm0xEUoPst1AwOmm3LyiPdeK2tCknxdY/8=;
        b=PTMlvlj4IXXZoeYutqxMswKdE9Lamr3rwEIKMHHlvdzTkFcjtfUOx8IDHAhFT2KuA8
         GvXPhaJz+4L3n4hSQjZlLNEjicQAvE+KySBwwdoDBe1uquHlTdsuQDlOTGgUO97z+3hp
         Sk3AejYKD3id3iQZB8ECQT5qQxGYGfL/tPsg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T6pXQ274+tm0xEUoPst1AwOmm3LyiPdeK2tCknxdY/8=;
        b=ks1F/kr8uv88lFfLQ84AqRs1v5EHmccBoE2SVzl1l8ZneXbyRzKKp7NybRIPx0Ciew
         rJjdHgiIBorsj4zsZQayZ7SjTG2bkYvRnPHV2Sq9M35JQo0yr1KVc3x5YN/vDgrEyPpg
         ST8wkMP03YAU5ya2yYTYxJz1R3lqOVctKLCo88E7zpLUU/yWWr5oDZSFawDeHN9FyM/9
         R43MUUCAxVr49JAXeP2i8SBTAlKpKfr/XqVD5Yi6H0SrjpX3/CrAEEZQN914mnP8uu5+
         GnDY9LCgbP7GWSTfHFBzksMa0RZzOb9Q5dNzOJWBD3ayHC29k74faem957k6Jp7Fj/9z
         wMOA==
X-Gm-Message-State: AOAM532Z2xAwFek2QdALmuZUPjN6e1hTJPLjK3sLuF/Hrb0gMAGFvHtH
        M53XFQPEKv+2l+neGJqUZ+1Eog==
X-Google-Smtp-Source: ABdhPJzLHxyOsoB3lyDZ0bUuL8EPe88cSCE3RuGlECE6gOfG3iSF0pOqhCg4yS99qn5RgV4P2s4MJA==
X-Received: by 2002:a17:90a:bd98:: with SMTP id z24mr2676573pjr.99.1627272661385;
        Sun, 25 Jul 2021 21:11:01 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:d699:4331:827:4150])
        by smtp.gmail.com with ESMTPSA id g19sm11815718pjl.25.2021.07.25.21.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 21:11:01 -0700 (PDT)
Date:   Mon, 26 Jul 2021 13:10:55 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
Subject: Re: [PATCHv3 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YP41zzARXEXESEXE@google.com>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-9-senozhatsky@chromium.org>
 <3c80786a-7422-3736-7261-8605260eb99f@collabora.com>
 <YP4zHRh+jHJGbNHz@google.com>
 <CAAFQd5D6hSoLJaBMdV-fpzn43Y6qRULR4ckejrJp_89Qpe6Xnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5D6hSoLJaBMdV-fpzn43Y6qRULR4ckejrJp_89Qpe6Xnw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/26 13:04), Tomasz Figa wrote:
> On Mon, Jul 26, 2021 at 12:59 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > On (21/07/22 19:26), Dafna Hirschfeld wrote:
> > > Also, the 'cookie' cb returns buf->dma_addr which is not initialized for
> > > the noncontiguous api. So it is not clear how drivers should use the new api.
> > > Many drivers call vb2_dma_contig_plane_dma_addr which returns the cookie.
> >
> > Hmm, that's a good find. Is ->dma_addr the same as what we have in
> > sgt.sgl->dma_address for non-contig?
> 
> Yes. As per [1]:
> 
> "The return sg_table is guaranteed to have 1 single DMA mapped segment
> as indicated by sgt->nents, but it might have multiple CPU side
> segments as indicated by sgt->orig_nents."

Thanks. So the fix can look as follows:

---

static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
{
        struct vb2_queue *q = buf->vb->vb2_queue;

        buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
                                               buf->size,
                                               buf->dma_dir,
                                               GFP_KERNEL | q->gfp_flags,
                                               buf->attrs);
        if (!buf->dma_sgt)
                return -ENOMEM;

+        buf->dma_addr = sg_dma_address(buf->dma_sgt->sgl);

---
