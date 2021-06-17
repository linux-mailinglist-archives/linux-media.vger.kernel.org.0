Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4483AAE17
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 09:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhFQH6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 03:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhFQH6b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 03:58:31 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA73C06175F
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 00:56:22 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id h16so3311844pjv.2
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 00:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sdiMUTIyPJj8g1PDcfcn82Go3ufrdVKwIXswDiKJXKo=;
        b=OvuTaEokEl9rKO7QnpAerU5cGgTd2y46wi+4kK3tVRt9qo+Vv5OURDuwuKNSm+avWC
         wh2pSZ2HKaAcsLEg70xDFEmNwkJ1Wg/nj3jWaPs20yDp/g75EDkD6TZ3/NYq+JfXVkX4
         Xdd9YzK4TCZu9Yc9hSH3YK5CC2NXveOPuQ+sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sdiMUTIyPJj8g1PDcfcn82Go3ufrdVKwIXswDiKJXKo=;
        b=oJXlKPyhcHTlECrMp/g3kjVl+BnTUTZ+IAjarA2elxEfJF/U8lgNjA3aCjsZn94qOS
         v2uib0/B0VRNwMoDgAFA7OP4sSZPZjWsmdQcD28Fmxnxxf2cBInt3UXGc4UhrAEnCSmy
         p3PU2G/DpngAfCdKvkm+5Pp7IkwosVtoMVbt9CgE3Q3r73Ij12AZ2W03U3vuy0C21xsl
         6oZ/CNd92hAWpQ1dLFMyrumhW/l7F5PQw0Dpa8+0iKOVylONxH95fvxFwRJeCuaF40Iv
         huEY24GMP8ERb1uSiQfBoTPhTb4pwuwAt7BS9q5hAYH09sRIRS29HVB8OKUgEocI6ivj
         1FlQ==
X-Gm-Message-State: AOAM5309GBmvsuH+5EH3tI+HqtgKQCbsB1z1JoS0P9GTZ1uqzbo9M5oE
        7BMryt5fmOnOlr4wtH1wSiWNTQ==
X-Google-Smtp-Source: ABdhPJx5dzmBapOrX5N9Bqqu48BExWv5NIvWw/wsDPG3r+vNYvaXUMTgM2vdXE4F4nGAZ7TfgB+bsQ==
X-Received: by 2002:a17:90a:d18f:: with SMTP id fu15mr4239392pjb.78.1623916582471;
        Thu, 17 Jun 2021 00:56:22 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:32ae:4292:bec1:e4])
        by smtp.gmail.com with ESMTPSA id o16sm3998163pfu.75.2021.06.17.00.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 00:56:21 -0700 (PDT)
Date:   Thu, 17 Jun 2021 16:56:17 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YMsAIVs7G2hUDR2F@google.com>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org>
 <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/06/03 13:59), Hans Verkuil wrote:
[[.]
> >  static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
> >  {
> >  	struct vb2_dc_buf *buf = buf_priv;
> > -	struct dma_buf_map map;
> > -	int ret;
> >  
> > -	if (!buf->vaddr && buf->db_attach) {
> > -		ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
> > -		buf->vaddr = ret ? NULL : map.vaddr;
> > +	if (buf->vaddr)
> > +		return buf->vaddr;
> > +
> > +	if (buf->db_attach) {
> > +		struct dma_buf_map map;
> > +
> > +		if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
> > +			buf->vaddr = map.vaddr;
> > +
> > +		return buf->vaddr;
> >  	}
> >  
> > +	/* Non-coherent memory */
> > +	buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size, buf->dma_sgt);
> > +
> 
> This function can use some comments. What is happening AFAICS is that
> buf->vaddr is either set in vb2_dc_alloc_coherent (unless
> DMA_ATTR_NO_KERNEL_MAPPING was set), it is obtained through dma_buf_vmap()
> if the buffer was attached to a dma_buf, or it is allocated via
> dma_vmap_noncontiguous() for non-coherent memory.

Yeah, it's complicated. Maybe we can make things more symmetrical.

> But this leaves coherent memory with DMA_ATTR_NO_KERNEL_MAPPING set, what
> is vaddr in that case? I think it will call dma_vmap_noncontiguous()
> incorrectly in that case, shouldn't there be a check for !buf->coherent_mem
> before the call to dma_vmap_noncontiguous()?

Thanks a lot for looking into it.

So vb2_dc_vaddr() can look like this:

static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
{
        struct vb2_dc_buf *buf = buf_priv;

        if (buf->vaddr)
                return buf->vaddr;

        if (buf->db_attach) {
                struct dma_buf_map map;

                if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
                        buf->vaddr = map.vaddr;

                return buf->vaddr;
        }

        if (!buf->coherent_mem)
                buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
                                                    buf->dma_sgt);
        return buf->vaddr;
}

And in vb2_dc_alloc functions set vaddr for !DMA_ATTR_NO_KERNEL_MAPPING
in both coherent and non-coherent. So that we probably can have less
branches when ->vaddr is NULL for one type of allocations, and is not
NULL for another.

static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
{
        struct vb2_queue *q = buf->vb->vb2_queue;

        buf->cookie = dma_alloc_attrs(buf->dev,
                                      buf->size,
                                      &buf->dma_addr,
                                      GFP_KERNEL | q->gfp_flags,
                                      buf->attrs);
        if (!buf->cookie)
                return -ENOMEM;

        if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
                return 0;

        buf->vaddr = buf->cookie;
        return 0;
}

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

        if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
                return 0;

        buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size, buf->dma_sgt);
        if (!buf->vaddr) {
                dma_free_noncontiguous(buf->dev, buf->size,
                                       buf->dma_sgt, buf->dma_addr);
                return -ENOMEM;
        }
        return 0;
}
