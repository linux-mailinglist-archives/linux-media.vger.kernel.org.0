Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2823C1FF1
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 09:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhGIHXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 03:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbhGIHXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 03:23:19 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973D0C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 00:20:35 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id x16so3678065plg.3
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wfVRDCn12PvjlI/4gGcypwOenkONM+SKIDRbqQICJ/w=;
        b=MExi26fU8r+DPQ3PGXA4FDAN7ifJLx45Gvgv9i5LYPl/+FZg0b/Tiebkbctj1AfWua
         VcV7+4INK5iSHWC1zl3aZ70cmFN0+kJBfUqNPEvoWi/VhMUZWabV+WaHm8kzAJ1xqvBu
         /W1TLeyxj79l6n1XLm/5ujeR4vwHnzqnRkw4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wfVRDCn12PvjlI/4gGcypwOenkONM+SKIDRbqQICJ/w=;
        b=X5uRjuHLR3VdfEADuyK/VNKOh9DYa6o5+PKhyv6H05F8koJKjIwm6jsO1W42c5Qrzp
         M/TW2p4FhG5BdDVZ9i5DEHNO0xRUAv6pQ+Df5/8JLsaIqj07eNpu0PMSyRwX2mQjztsf
         cw2SJk/b2BvNAae5zEXI1KbGVB//wu7ueQg29Q/TmMzjb0cEicQF3/GkEg1m0maNHTX4
         Ar2PaBLOhrCPYXtZKKFyh3vdONvcY7GR5YshLUfZhbcUXPwEErf77J7ySW/E5CfQ7YOW
         goy93bBiCr3yaQbiwlGO5Zr3WccpHBqeldh+XDgOt0g4wcUUm9rj/lNXcrrDiAyfFp8J
         W2eQ==
X-Gm-Message-State: AOAM533QNBEFmDBZkueXcgi5ceDeK5P3MHy9uARfnFLsi56hLnffSLVF
        9XDaDTvjCDeviVJaUzZFm0w6Dw==
X-Google-Smtp-Source: ABdhPJze9epknpvE6W/UqRj8DzBUd2K+lgb9x5VCG+ErVveN15EM76unXCMQ/WR6gtw5sqdRRsW8yA==
X-Received: by 2002:a17:90a:a4c2:: with SMTP id l2mr2697048pjw.159.1625815235102;
        Fri, 09 Jul 2021 00:20:35 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:a30d:fc4:7834:ee08])
        by smtp.gmail.com with ESMTPSA id b10sm5062208pfi.122.2021.07.09.00.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 00:20:34 -0700 (PDT)
Date:   Fri, 9 Jul 2021 16:20:28 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YOf4vH24LFhUcL9Q@google.com>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org>
 <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com>
 <YNVJJhP69KPJ+DHv@google.com>
 <CAAFQd5BB6JghdgGf9SjAWYuZFsZaAeU11rV1a1xrwws=w7j7_w@mail.gmail.com>
 <YOWsNa0Zaf9UuGWH@google.com>
 <CAAFQd5DDpxXBb=eJpzLPOhGQAgtBKnn0aTo=3Vs-rf44cu8OQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DDpxXBb=eJpzLPOhGQAgtBKnn0aTo=3Vs-rf44cu8OQA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/07 23:10), Tomasz Figa wrote:
> > > >
> > > > I guess this should address the case when
> > > >
> > > > "after allocating the buffer, the buffer is exported as a dma_buf and
> > > > another device calls dma_buf_ops vb2_dc_dmabuf_ops_vmap, which in turn
> > > > calls dma_buf_map_set_vaddr(map, buf->vaddr); with a NULL buf->vaddr"
> > >
> > > Sorry, I fail to get what this is about. Where does this quote come from?
> >
> > Bottom half of https://lore.kernel.org/lkml/10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl/
> 
> I see, thanks for the pointer. Yes, vb2_dc_dmabuf_ops_vmap() needs to
> be changed so that it calls vb2_dc_vaddr() internally instead of
> relying on buf->vaddr directly.

Done.
