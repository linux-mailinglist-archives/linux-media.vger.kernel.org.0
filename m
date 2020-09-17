Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7E326DB5A
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgIQMTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbgIQMTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:19:01 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B222BC061756
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 05:19:00 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id q63so1938779qkf.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 05:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bVH4jGgQihKj5QSekUnZ2zb+7aLw+KLxMSJUC/hbv48=;
        b=Fhg6lAOjlbLyEga2rG8pPURoI3htqOr2pKe+vNBAihwLsY1v7CQoxRX/649FEzDXL0
         39FqlveIvSVsbxnDqRrLJG066HQKp6GPqRPvv7sINamdCEVmQVcfibTDwqQ3GZ9hu48e
         bJWC0truOv3or+gTqYMGK8Nk/aI7LVNws/zxpIKCCcVnOEN096VUQVtTCuEGqpL/bs0b
         b7qBpYAC22kVivdgl0u4A8/znqNgMdzttibfzOG7nl4p+6OR1ajRt59PhYyeJJCeqC0/
         zbtfT2ps/ucVP4yscFeka54htZL+4FqrDY02jJyOzHv7rkq5iYcsVSz5CsB5kWcbLufb
         HzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bVH4jGgQihKj5QSekUnZ2zb+7aLw+KLxMSJUC/hbv48=;
        b=Yh5XygllEwRz6kzphRbzK29ItcOyTh91+6DzO5Zv8LvfZhAo5h8mQ9wlVZo+m8uFd0
         tY00kIvI5OpQFLaqoCqIBPs+i4lC2L5ZOVlKxEaXrDGcZ0RcGHt1qH4GbrTB9GSueRRX
         FnG4K6nlIqX+jzrav9ErxqGO0wp92c+K1H4Hzz2sF2J1rE4B9hJOyhuQ8MKS08TfrtZ/
         0wUfn8dUSL++tqI3Uf4K4iI1orEOcI98GkgCZvvsUY67hveLY9zTnMJG5uvF37xm5hIx
         4QAi6Pqg2W19EPz/nRk6y5NkV1zmRKG/x7zTjA42K9+7+9Pn4begw+fldX8Tux5EpJYh
         kPSQ==
X-Gm-Message-State: AOAM533ukY3smcjsXel3Laham2uOiubNGTrtj5+t6hOYsnb31s7Ab/E2
        XYNNhLYq/yH90G32LFNzhZJ86Q==
X-Google-Smtp-Source: ABdhPJz0GJRdg0Id6c/JdQbGUXlRLa+Wdw0oKs6yW4L3DgyAUr2dNjQnoWL5C3nALl2/OucOloGmLA==
X-Received: by 2002:a05:620a:a45:: with SMTP id j5mr28227082qka.367.1600345139834;
        Thu, 17 Sep 2020 05:18:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id 145sm22054177qkf.18.2020.09.17.05.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:18:59 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kIssM-000R84-9L; Thu, 17 Sep 2020 09:18:58 -0300
Date:   Thu, 17 Sep 2020 09:18:58 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     christian.koenig@amd.com
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917121858.GF8409@ziepe.ca>
References: <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian König wrote:
> Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
> > On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
> > 
> > > Yeah, but it doesn't work when forwarding from the drm chardev to the
> > > dma-buf on the importer side, since you'd need a ton of different
> > > address spaces. And you still rely on the core code picking up your
> > > pgoff mangling, which feels about as risky to me as the vma file
> > > pointer wrangling - if it's not consistently applied the reverse map
> > > is toast and unmap_mapping_range doesn't work correctly for our needs.
> > I would think the pgoff has to be translated at the same time the
> > vm->vm_file is changed?
> > 
> > The owner of the dma_buf should have one virtual address space and FD,
> > all its dma bufs should be linked to it, and all pgoffs translated to
> > that space.
> 
> Yeah, that is exactly like amdgpu is doing it.
> 
> Going to document that somehow when I'm done with TTM cleanups.

BTW, while people are looking at this, is there a way to go from a VMA
to a dma_buf that owns it?

Jason
