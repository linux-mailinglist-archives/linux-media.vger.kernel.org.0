Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB12326C12F
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 11:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgIPJyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 05:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgIPJyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 05:54:10 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA876C061788
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 02:54:05 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z9so2322080wmk.1
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 02:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2iYj6uXZfdILOqgogXly8EZQExVDmJHzJxebCj3FO2Y=;
        b=kLEN0BssrrGNNSneN66oFCjjAadmKcUDJz92qqA1hlRweOfcEvHYpQdfeRRtwkF4EQ
         dcUsTbuHAmwH/0mnTlAiojEnwfsHgztTx14z7ldzdOZ3sB9zWn6RU/pryOBlEtk4a/OV
         Z84xyaG+7QYeXaJ7WzDVD282q5e3iYHLjHFlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=2iYj6uXZfdILOqgogXly8EZQExVDmJHzJxebCj3FO2Y=;
        b=aVepjHKyRu0S4tnSgqBaLQAyhFZVO/kpl0sQZ3C2+38P9773qliYnrXYXCKrCAVqyo
         vB8fje/sqoOGhxKlU9AckdQTv+OocxYOhX5RNRt/rv/m3Wsw/5YuZ/ZB+CXc3aFDxPiO
         UDxkeIiMBYaKj20oeUw3OAGCs58EBpjPwFm+MEx7FhgZQsmHET7BSgmO++UZZ9/EpCnr
         mRyraPudmG3Dy9bSpZxe+m5sSn7cFgIZiY26eD5w7Fv+qTuonKfD8VNQzPaImeeK0iKm
         cW33tuwmLrZZVt0DsGb96lwjpPS8Za+To2di4Bg25s5QmXng/Vfje0BOUt5io98zWljr
         Lf0w==
X-Gm-Message-State: AOAM531QvFn64PCQHpOUD6O/ZJ1qswlzkLK6abojVbAJzx0o13zIlB9g
        uvVuOXJqt1XkFOZ5n7bBm/8aikCbtIiKJyx0
X-Google-Smtp-Source: ABdhPJx8T8vv6SboEWDzt863SflX4VsUCD5E76qf3ZL+BjSfaIFA4+TQRt4D0/rFrg4RphT0bDAcYQ==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr3807909wme.124.1600250042604;
        Wed, 16 Sep 2020 02:54:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i83sm4609049wma.22.2020.09.16.02.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 02:54:01 -0700 (PDT)
Date:   Wed, 16 Sep 2020 11:53:59 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     Jason Gunthorpe <jgg@ziepe.ca>, akpm@linux-foundation.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200916095359.GD438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
        akpm@linux-foundation.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 14, 2020 at 08:26:47PM +0200, Christian König wrote:
> Am 14.09.20 um 16:06 schrieb Jason Gunthorpe:
> > On Mon, Sep 14, 2020 at 03:30:47PM +0200, Christian König wrote:
> > > Am 14.09.20 um 15:29 schrieb Christian König:
> > > > Hi Andrew,
> > > > 
> > > > I'm the new DMA-buf maintainer and Daniel and others came up with
> > > > patches extending the use of the dma_buf_mmap() function.
> > > > 
> > > > Now this function is doing something a bit odd by changing the
> > > > vma->vm_file while installing a VMA in the mmap() system call
> > It doesn't look obviously safe as mmap_region() has an interesting mix
> > of file and vma->file
> > 
> > Eg it calls mapping_unmap_writable() using both routes
> 
> Thanks for the hint, going to take a look at that code tomorrow.
> 
> > What about security? Is it OK that some other random file, maybe in
> > another process, is being linked to this mmap?
> 
> Good question, I have no idea. That's why I send out this mail.
> 
> > > > The background here is that DMA-buf allows device drivers to
> > > > export buffer which are then imported into another device
> > > > driver. The mmap() handler of the importing device driver then
> > > > find that the pgoff belongs to the exporting device and so
> > > > redirects the mmap() call there.
> > So the pgoff is some virtualized thing?
> 
> Yes, absolutely.

Maybe notch more context. Conceptually the buffer objects we use to manage
gpu memory are all stand-alone objects, internally refcounted and
everything. And if you export them as a dma-buf, then they are indeed
stand-alone file descriptors like any other.

But within the driver, we generally need thousands of these, and that
tends to bring fd exhaustion problems with it. That's why all the private
buffer objects which aren't shared with other process or other drivers are
handles only valid for a specific fd instance of the drm chardev (each
open gets their own namespace), and only for ioctls done on that chardev.
And for mmap we assign fake (but unique across all open fd on it) offsets
within the overall chardev. Hence all the pgoff mangling and re-mangling.

Now for unmap_mapping_range we'd like it to find all such fake offset
aliases pointing at the one underlying buffer object:
- mmap on the dma-buf fd, at offset 0
- mmap on the drm chardev where the buffer was originally allocated, at some unique offset
- mmap on the drm chardev where the buffer was imported, again at some
  (likely) different unique (for that chardev) offset.

So to make unmap_mapping_range work across the entire delegation change
we'd actually need to change the vma->vma_file and pgoff twice:
- once when forwarding from the importing drm chardev to the dma-buf
- once when forwarding from the dma-buf to the exported drm chardev fake
  offset, which (mostly for historical reasons) is considered the
  canonical fake offset

We can't really do the delegation in userspace because:
- the importer might not have access to the exporters drm chardev, it only
  gets the dma-buf. If we'd give it the underlying drm chardev it could do
  stuff like issue rendering commands, breaking the access model.
- the dma-buf fd is only used to establish the sharing, once it's imported
  everywhere it generally gets closed. Userspace could re-export it and
  then call mmap on that, but feels a bit contrived.
- especially on SoC platforms this has already become uapi. It's not a big
  problem because the drivers that really need unmap_mapping_range to work
  are the big gpu drivers with discrete vram, where mappings need to be
  invalidate when moving buffer objects in/out of vram.

Hence why we'd like to be able to forward aliasing mappings and adjust the
file and pgoff, while hopefully everything keeps working. I thought this
would work, but Christian noticed it doesn't really.

Cheers, Daniel


> 
> Christian.
> 
> > 
> > Jason
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
