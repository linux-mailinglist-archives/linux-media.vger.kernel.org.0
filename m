Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5AD337A2F
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 17:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhCKQ6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 11:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhCKQ6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 11:58:10 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A89DC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 08:58:10 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id y20so4331497iot.4
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 08:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIw9mpEdtb6xII0/h1pkc9zwar1BCKRrPfEkXgVTjbI=;
        b=AIAwsmpNhzzKXCSsCR+48hrHBgLwiA3le2y40XyItCCiAznTDaLmhQioZKLeYJvj5l
         sYEbViFUJgais0HaTWgDIKrsLRgDvtzoSnhADRD5JFma2Nxe/M4xvkYsCOdCEa2pYKHu
         jWNVeYX37GDpBx1ePo+F+81oLh3OgZLt4anZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIw9mpEdtb6xII0/h1pkc9zwar1BCKRrPfEkXgVTjbI=;
        b=aDsB4R8XeU1OhmSXMFo5K62Wc/xcubSp8+3LymywEYLxytmJI2vuInXeT+851QoC1j
         8K1EnuZo80HFzOInErMZUqJgkF16Mu06Ks3Mz6szCwEaq6C1uHtE/7HLG47YNPdEzM2d
         /spudSZj5os49zh5wgeSgHkz3Voi3V2Al+JGZRWDupUbkNs6OgbFHhG4K/TQKAgUbltq
         EhWF123JEmtvChZumUOy4e0tJaqporWISb+iZ89tVum6XVcE+qSc6MgZhaB2aF0NRVc+
         MeHtWNTJGRELXZX7LGkx8ThrGmM/BhbPDTHgIxMOziT9u+PV/KkvnzLFLLjLPYf8tzQj
         f2ug==
X-Gm-Message-State: AOAM530wUl4MCdo56HDNvMtlhYG9J6z4s9nA0VDY1rpI5zXB3lj9kLPq
        fM7hL+6J6sRL5Cpr3QEVLWoJJKNOoTPO+iWQ
X-Google-Smtp-Source: ABdhPJzAbZkCSspLEOURAJ/7cRiezUMTUriFpFqL3YFQu6I5LA5W4ElvZlNgo4amgX1J7fQmPt1p3g==
X-Received: by 2002:a6b:f708:: with SMTP id k8mr6908982iog.187.1615481889462;
        Thu, 11 Mar 2021 08:58:09 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id b9sm1637462ioz.49.2021.03.11.08.58.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 08:58:08 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id m7so3609321iow.7
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 08:58:08 -0800 (PST)
X-Received: by 2002:a05:6638:2711:: with SMTP id m17mr4497331jav.115.1615481887730;
 Thu, 11 Mar 2021 08:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20210301085236.947011-1-hch@lst.de> <20210311165250.GB25023@lst.de>
In-Reply-To: <20210311165250.GB25023@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Mar 2021 17:57:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCuFkTYMGeL8WK_3VkYy4a1h3hY4NKWTtz=bho844Fa2zw@mail.gmail.com>
Message-ID: <CANiDSCuFkTYMGeL8WK_3VkYy4a1h3hY4NKWTtz=bho844Fa2zw@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v3
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph

I tried to run it in an arm device and it worked fine.


On Thu, Mar 11, 2021 at 5:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Any comments?  Especially on the uvcvideo conversion?
>
> On Mon, Mar 01, 2021 at 09:52:30AM +0100, Christoph Hellwig wrote:
> > Hi all,
> >
> > this series adds the new noncontiguous DMA allocation API requested by
> > various media driver maintainers.
> >
> > Changes since v2:
> >  - rebased to Linux 5.12-rc1
> >  - dropped one already merged patch
> >  - pass an attrs argument to dma_alloc_noncontigous
> >  - clarify the dma_vmap_noncontiguous documentation a bit
> >  - fix double assignments in uvcvideo
> >
> > Changes since v1:
> >  - document that flush_kernel_vmap_range and invalidate_kernel_vmap_range
> >    must be called once an allocation is mapped into KVA
> >  - add dma-debug support
> >  - remove the separate dma_handle argument, and instead create fully formed
> >    DMA mapped scatterlists
> >  - use a directional allocation in uvcvideo
> >  - call invalidate_kernel_vmap_range from uvcvideo
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> ---end quoted text---



-- 
Ricardo Ribalda
