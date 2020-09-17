Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D8A26DB7D
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgIQM1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgIQM1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:27:35 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A39C06178B
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 05:26:40 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z1so1866957wrt.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=776kE571jxALYsOg06ejCyM2zHb/SfLHRc5/m8v10ss=;
        b=IVQpQa30jthrbYlgwDGmu0dc3mjMkTqbdMKMaSnRvLnHMKlNvHBoPDQ8r760u+SVPm
         59vgHhoVxmVxKNvGKFX9QbbbOEpWzNWMXSHfbRt/bDygT1XUo/rI/mTP8lwcUxWU928G
         cOYIpmnvb7A0tsT+gMKdSIF7Iz7lnU7Ky2wTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=776kE571jxALYsOg06ejCyM2zHb/SfLHRc5/m8v10ss=;
        b=rh0bi/fqnEQnFrqpotmMaXT2zEQrH7WLyytSBMs0DTKn4jAladZBYHmXwqbzx+Hd0Q
         bvOL753qp9mVFVVdYYz3MFFm3KVN89ECxIgZBKaxvy3HcuXn6entByro2+XvvOHY0v/Q
         pKTjKsUdqKeUlG/5ySoEX/F9fvdzQb5CORRaL3EvWM8/qETcNr3x4QoqLZRGqq4LrIni
         lK1so+3kDVD3FDOZhoBWyrszAfi7h4qy6x1YLVtx1+Je23sdG2nC2P3mrcGF2jdwX61/
         FMMyNrtECSb5a6PwcATAAWJLVf2ZCTFJCN52sxFYxequQqIB8zfFXFpKMh4PU+k1S85K
         zxww==
X-Gm-Message-State: AOAM5337E2Zb30KySZafsdL/4TJM7tzkhJEfxxNE+7Q1w/PDynhKSXZl
        idaGkDyPv226WcO86JToURPfjw==
X-Google-Smtp-Source: ABdhPJxsVUfr3DZLp2Gh7FRSChhAJlPPexeSjbdhob6/sk140ihZIXopzA3J7Zp+4xfpjlTSOU6Fyg==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr34943739wrs.153.1600345599608;
        Thu, 17 Sep 2020 05:26:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u186sm10458866wmu.34.2020.09.17.05.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:26:38 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:26:36 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917122636.GW438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 02:24:29PM +0200, Christian König wrote:
> Am 17.09.20 um 14:18 schrieb Jason Gunthorpe:
> > On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian König wrote:
> > > Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
> > > > On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
> > > > 
> > > > > Yeah, but it doesn't work when forwarding from the drm chardev to the
> > > > > dma-buf on the importer side, since you'd need a ton of different
> > > > > address spaces. And you still rely on the core code picking up your
> > > > > pgoff mangling, which feels about as risky to me as the vma file
> > > > > pointer wrangling - if it's not consistently applied the reverse map
> > > > > is toast and unmap_mapping_range doesn't work correctly for our needs.
> > > > I would think the pgoff has to be translated at the same time the
> > > > vm->vm_file is changed?
> > > > 
> > > > The owner of the dma_buf should have one virtual address space and FD,
> > > > all its dma bufs should be linked to it, and all pgoffs translated to
> > > > that space.
> > > Yeah, that is exactly like amdgpu is doing it.
> > > 
> > > Going to document that somehow when I'm done with TTM cleanups.
> > BTW, while people are looking at this, is there a way to go from a VMA
> > to a dma_buf that owns it?
> 
> Only a driver specific one.
> 
> For TTM drivers vma->vm_private_data points to the buffer object. Not sure
> about the drivers using GEM only.

For gem drivers (which includes the ones using vram helpers, which uses
ttm internally) that points at the drm_gem_object pointer. I guess that
might be something we can unify a bit on the ttm mmap paths of the
remaining driver, now that there's a drm_gem_object embedded anyway.
-Daniel

> 
> Why are you asking?
> 
> Regards,
> Christian.
> 
> > 
> > Jason
> > _______________________________________________
> > Linaro-mm-sig mailing list
> > Linaro-mm-sig@lists.linaro.org
> > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
