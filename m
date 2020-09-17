Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C97726DA40
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 13:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgIQLcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 07:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgIQLbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 07:31:14 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB85C061756
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 04:31:13 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id o5so1751456qke.12
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nZ4b46gqz9ZMj0oSIJhPTVW/Re5tOMNlNB8GqNDw+ps=;
        b=e9KgBjbTETq6hYc5oIxWtFuYQ1SoFGsGWxA4kvhtekqf6V6CMOH9pXjfTbuISASPWo
         4bZVeYOehOgOJ0u5bY/YPUtEgF4XQ19vKp8V/0m/N+sT6mdaGe9qVo9Gk0v4qi3fFJBN
         X0VFFFaoBVE1uVC0GdBYcfidqaVtx/8FIVkJLSOxg2eoJAkBgMswVryFqbAy2jhDn0Zm
         fimV1f+uedJRyrixr5wV3m+byauc/VMYGq6ivkwH0zO3SoZxBRNiWufSKrH3LcQiqEiP
         33anbnVMCvQ5wFzEuBZcN7VD9OgD57QNEm4Y1vFAatti5FabHopW0XlrAe28+0EdKa45
         YASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nZ4b46gqz9ZMj0oSIJhPTVW/Re5tOMNlNB8GqNDw+ps=;
        b=ieQr2j6xlE66PA27pMVDaeSnhRc2TcrTlAU07bwtrVw8k/keaMcGOrZ+DpIACY9BoQ
         bmHXKj1ZoteHireaX/fWytDXjy5oNvk4MHLtDYFNnv/IwwMCfE3o2Ltx1uBi/dPtb60U
         5jhkD1OjdW+3WVB/+938iC7Ba4esN6haN9QLVT6BsKPC9LEYIc1LTQ/wW79VJgH99AVX
         SHIH6YgjVHlgPZ05URddQmNtJyxel8uByATUwoVJ0/gsBGzJsANl7yyk0bC74ze+UKfU
         HgcSz1NsFWE9N5l7J+CJS0zEuhdNJJrb9HhMBtnsI5dashYyUeOVwLB/Ib+qm1CeUzR6
         /Z7g==
X-Gm-Message-State: AOAM531ngVepzBQzPekIezeeiAV9ZKfyk0e2K9arcfYp1CK2+eFVlrvC
        G09dlXfAjX4j2CRePHf7w+6Hpg==
X-Google-Smtp-Source: ABdhPJw56svcIeAcnROGFmKsbmVXol3TtQXkSVG9MOLdgGF5odtIzCjySvHoBe12rG9qsPWph3HcsA==
X-Received: by 2002:a37:814:: with SMTP id 20mr27843480qki.142.1600342272474;
        Thu, 17 Sep 2020 04:31:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id y73sm21206411qkb.23.2020.09.17.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:31:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kIs86-000Q7S-Qt; Thu, 17 Sep 2020 08:31:10 -0300
Date:   Thu, 17 Sep 2020 08:31:10 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917113110.GE8409@ziepe.ca>
References: <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:

> Yeah, but it doesn't work when forwarding from the drm chardev to the
> dma-buf on the importer side, since you'd need a ton of different
> address spaces. And you still rely on the core code picking up your
> pgoff mangling, which feels about as risky to me as the vma file
> pointer wrangling - if it's not consistently applied the reverse map
> is toast and unmap_mapping_range doesn't work correctly for our needs.

I would think the pgoff has to be translated at the same time the
vm->vm_file is changed?

The owner of the dma_buf should have one virtual address space and FD,
all its dma bufs should be linked to it, and all pgoffs translated to
that space.

Jason
