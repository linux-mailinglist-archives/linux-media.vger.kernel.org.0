Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E6242BFF5
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 14:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbhJMMaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 08:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbhJMMaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 08:30:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14B0C061753
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 05:28:14 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id y3so7863064wrl.1
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GBfsD8UcuCc9Dt0hmFf6Zq9716ejUwy0ObqDAs31b9M=;
        b=OnPrdqkeW6KK+v4GtIWQEAP/y0NXlBOJfLLip0R6eL/o1mtuFJTFgay4jHqZMrnEbV
         BFk19Yq0fbDLBwYgTb5OKhRnhJB10Hph+fkhm/ziLAE0zS4ujDGvrciDKTMlZzk1p1xS
         fkEP/26CUSLtkv8wmM7jqKgBsivsz9/KAQcJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=GBfsD8UcuCc9Dt0hmFf6Zq9716ejUwy0ObqDAs31b9M=;
        b=X00ijH+h52jWx1fAveriwCML3OkN8hDGcO84lyD5G0zjuU28lkeMlwnv/tUmjU1n3q
         0sseawWebG3+72yOrXqmJfQsX41HStZqstazS+ZqOS97rBIvtoZBcDg4tKxyXqackAC3
         26jZRnBT66MSkh8Ryzgfhizhlz52nWYgFAWBBt5yTRwAUgobGLRraO+CALMwPK+OWct/
         6l8gnYYm9BiBalmlvR3AL5WmyIVLYRKsHtWjFY8mlF6bL/voEObWIdzvJq+JBztJu1RS
         kZYdORrONlATT/AOHVraFY4Tf6/wzTUVzRjEB5P4pg0BfBh5y6lS7htN7LBwPS8eSGOg
         tHXQ==
X-Gm-Message-State: AOAM531xQgT6AhnZ+DlQIGRE6cWTbeI18Pkgox2jV45AFkgnpGQ45W4V
        e3lrTITdVEy3pX+Ns8DytzxlhQ==
X-Google-Smtp-Source: ABdhPJz8xtdME6jjgj/yh0FBDVkiYhtiLOa+f1ojHCjME36GpjcRyNASGQaKNjCalwH1kesstw0dwQ==
X-Received: by 2002:a05:600c:1989:: with SMTP id t9mr12250949wmq.48.1634128093632;
        Wed, 13 Oct 2021 05:28:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k10sm12930288wrh.64.2021.10.13.05.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 05:28:13 -0700 (PDT)
Date:   Wed, 13 Oct 2021 14:28:11 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Shunsuke Mie <mie@igel.co.jp>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Update obsoluted comments on
 dma_buf_vmap/vunmap()
Message-ID: <YWbQ28oOQnzg9cJS@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Shunsuke Mie <mie@igel.co.jp>,
        Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
References: <20211008112009.118996-1-mie@igel.co.jp>
 <5ae41c5a-0ff4-5a82-2100-56bc415b5638@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ae41c5a-0ff4-5a82-2100-56bc415b5638@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 08, 2021 at 02:09:41PM +0200, Christian König wrote:
> Am 08.10.21 um 13:20 schrieb Shunsuke Mie:
> > A comment for the dma_buf_vmap/vunmap() is not catching up a
> > corresponding implementation.
> > 
> > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

You're also pushing?
-Daniel

> 
> > ---
> >   drivers/dma-buf/dma-buf.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index beb504a92d60..7b619998f03a 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1052,8 +1052,8 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> >    *
> >    *   Interfaces::
> >    *
> > - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
> > - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vaddr)
> > + *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct dma_buf_map \*map)
> > + *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct dma_buf_map \*map)
> >    *
> >    *   The vmap call can fail if there is no vmap support in the exporter, or if
> >    *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
