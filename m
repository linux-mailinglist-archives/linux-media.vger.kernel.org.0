Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B67F3EEC00
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 13:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239706AbhHQL5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 07:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235554AbhHQL5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 07:57:39 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448ECC061764
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 04:57:06 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id w6so17622312plg.9
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5eVWcqoojYYHru/CT40TixXoXoJZblc78933GWI+qc4=;
        b=Z+URnrGA0iYXyqx0+EwysvNVtOVd/Qg1weNCKom9Cykq/vKnuc/3Ozg0SuDdh8H9Jl
         INx88aBuUSjXb+wrOFcWiXYtydeSGYZgbe7lq/4+OzyaYskq1ZNsFNjU63ZBOSFtNX2q
         sva2h9Tucj6yOM3qYeQPRZlfOV0RjZlGok/fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5eVWcqoojYYHru/CT40TixXoXoJZblc78933GWI+qc4=;
        b=BOMPFlbhpI92AIiWqV0LSOJUzVKYLhJm4zvQjWvswBFpbdpJnsCpTFLausvjYI1lBJ
         bO0XcEevJQ98LCttO2nb1m9StM6sD6Hp0dQKyurmRmX3DlIf0YGDjHBkNwAJ8ViASoPn
         SkhgIXkp+PnFa98pN5e+w8lHU/+s5TL/yu3tTZWpCSniztH/EWPyGny0vIlN5KRar0jp
         YT6O8ceKlPHjhl3AqgU7H+0h/7MntjFTWQ1tEiYnWscXt+L3f06ZV8UfKrXEJHbCwy8B
         /AfmUiMDUUpPz5ujgq2iPcLtAX9eu1+yb6NF9HPthWon78X2qmU83H1wiWcuGnjz/wa4
         duzw==
X-Gm-Message-State: AOAM530f9u7goEifNF3D12VsVd0RwqBDC2i0mh9LRoeihs68gqRnX2xK
        mF/txNUvDM8+lDbTse7X6lXGmQ==
X-Google-Smtp-Source: ABdhPJyELtpHZ2cwJXA+46vVbt40ueVOgtpSjStycCk1fXsL7JKuECiBqUZZ+dxXVh6iLCDlkTKYGw==
X-Received: by 2002:a17:902:f688:b0:12d:7aa6:1e44 with SMTP id l8-20020a170902f68800b0012d7aa61e44mr2773102plg.8.1629201425796;
        Tue, 17 Aug 2021 04:57:05 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8aab:cb84:5fe8:99dd])
        by smtp.gmail.com with ESMTPSA id y5sm2200275pjy.37.2021.08.17.04.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 04:57:05 -0700 (PDT)
Date:   Tue, 17 Aug 2021 20:56:59 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YRukCziknzz/3/sV@google.com>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-9-senozhatsky@chromium.org>
 <fd1e8bbe-4cbe-9586-7c8f-0896af043d4a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd1e8bbe-4cbe-9586-7c8f-0896af043d4a@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On (21/08/03 12:15), Hans Verkuil wrote:
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
> > +	if (!buf->coherent_mem)
> > +		buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
> > +						    buf->dma_sgt);
> >  	return buf->vaddr;
> >  }
> 
> This function really needs a bunch of comments.
> 
> What I want to see here specifically is under which circumstances this function
> can return NULL.
> 
> - dma_buf_vmap returns an error
> - for non-coherent memory dma_vmap_noncontiguous returns an error
> - coherent memory with DMA_ATTR_NO_KERNEL_MAPPING set.

OK, I added some comments.

> In the latter case, if a buffer with coherent memory and DMA_ATTR_NO_KERNEL_MAPPING
> is exported as a dma_buf, and dma_buf_vmap is called by the importer of this dma-buf,
> what happens then? I think that in that case dma_buf_vmap should return an error?

Should we error out in vb2_dc_vaddr() in this case?

---

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index d4089d0b5ec5..e1d8ae1548fa 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -102,6 +102,9 @@ static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
        if (buf->db_attach) {
                struct dma_buf_map map;
 
+               if (WARN_ON(buf->attrs & DMA_ATTR_NO_KERNEL_MAPPING))
+                       return NULL;
+
                if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
                        buf->vaddr = map.vaddr;
 

---


[..]
> > @@ -362,7 +451,7 @@ static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
> >  {
> >  	struct vb2_dc_buf *buf = dbuf->priv;
> >  
> > -	dma_buf_map_set_vaddr(map, buf->vaddr);
> > +	dma_buf_map_set_vaddr(map, vb2_dc_vaddr(buf->vb, buf));
> 
> vb2_dc_vaddr() can return NULL, shouldn't this function return an error in that case?

Done, thanks.

> BTW, looking at where vb2_plane_vaddr() is called in drivers I notice that most (all?)
> drivers do not check for NULL. Somewhat scary, to be honest. That's a separate issue, though.

I may have some time in the future and can add missing if-s to the
drivers.
