Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78594268CDD
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 16:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgINOHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 10:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgINOGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 10:06:36 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965ECC06174A
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 07:06:35 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t18so16238587ilp.5
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1e7EGdpnwDvG5r/s0x2CkKUWWFCbx737ZFsalB8mkco=;
        b=a39sUxr3jeP/BLuXvYZo5sQYTUREOKDSpSwalRJaZBhMGYM+lo31MmddPsUALNOng5
         /pZZXE7TPZHU3Szy3pZ0M+Y7rQU5RZzpYMQik6eioTzucTKTD+y67pI5dGdksh+4k+fZ
         YrXO59uQCWgPiDFnRS4rhoWXqM0kmjSKBsbv15/QISxk14r7m+ZcNfvQ/z6PVkxyIoJy
         UbnYIurXjHDP+sSpVVlq9lVeKT91leZtIS+xsjXHznwlopScLnrz8829U/bsElTDP4YP
         /IGmxLr/+zpukVDvwgZ00Fe6hMFMlGuwgSNLlOKiT95ofedRBEkBwZuwNBkv2+haVnAW
         jlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1e7EGdpnwDvG5r/s0x2CkKUWWFCbx737ZFsalB8mkco=;
        b=J8OBlXiwTesITKGyRtF6QKP9AeT8pzxvv71/i7hzpCv1XPuEX73iaiqwU9dzvMsdUV
         r283N36WQn/MwnWHKBUYtQbNqC5NRIHhMywTnyunecdB0yOgTprvyOqjr2p9o1MANBY1
         gn+x1+AyC5dE+YZR9C4MHytEwUifHljLigXjgtaS9lrdlJK/UNGOoqbpVBsjItL9XpP3
         GSU/JWMo6gFNXI7793yPc5f4U+AFpzwquUJPQTZrSCAOyP+g1RhESA6hn/UPQmz66h+t
         OqjcLumpi5Ub2DabmbSUyqKhu4FQSdGWxUTiTvuZmyiG0Oqd9IQMAd6BYjcnUeV4L75/
         W/dg==
X-Gm-Message-State: AOAM530wQgBkfoE31KYHi8rhMmT5ZCgv7CaCrHFpTreiA5ADSj+h0tuM
        MnCR77+w9P6jD29m/J9ieoAwWTJ3pdApXQ==
X-Google-Smtp-Source: ABdhPJyF/sDYVopZg/BDQqrwTkESVkwSEOqsuOwDOcgGLzbWX7RzPa41tgaMCaw6uC7C6w4gVaxWqg==
X-Received: by 2002:a05:6e02:5a5:: with SMTP id k5mr11987669ils.28.1600092394945;
        Mon, 14 Sep 2020 07:06:34 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id v14sm5988511iol.17.2020.09.14.07.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:06:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kHp7o-005y7Z-Sl; Mon, 14 Sep 2020 11:06:32 -0300
Date:   Mon, 14 Sep 2020 11:06:32 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     akpm@linux-foundation.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200914140632.GD1221970@ziepe.ca>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 14, 2020 at 03:30:47PM +0200, Christian König wrote:
> Am 14.09.20 um 15:29 schrieb Christian König:
> > Hi Andrew,
> > 
> > I'm the new DMA-buf maintainer and Daniel and others came up with
> > patches extending the use of the dma_buf_mmap() function.
> > 
> > Now this function is doing something a bit odd by changing the
> > vma->vm_file while installing a VMA in the mmap() system call

It doesn't look obviously safe as mmap_region() has an interesting mix
of file and vma->file

Eg it calls mapping_unmap_writable() using both routes

What about security? Is it OK that some other random file, maybe in
another process, is being linked to this mmap?

> > The background here is that DMA-buf allows device drivers to
> > export buffer which are then imported into another device
> > driver. The mmap() handler of the importing device driver then
> > find that the pgoff belongs to the exporting device and so
> > redirects the mmap() call there.

So the pgoff is some virtualized thing?

Jason
