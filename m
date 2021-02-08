Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338D6313106
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 12:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhBHLhd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 06:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbhBHLfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 06:35:13 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9D3C061788
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 03:34:05 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id l25so6766756eja.9
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 03:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SIdoO/BXrCF5ZGx1sncTZthErRH1ESME+fQ4iZ40G4Y=;
        b=R4FfWcgnRp7kfMDn8OHGmLFT1VfRqhYLNtKbqtkWdlb75NiARoNYeuQ8plgw69PUvK
         SrMHBkIe3taDYqbOgv3c7/zQ+MxGUpsl5Jfwyzx4OaASuL8ztU0r+HTymMJR6J0YvC16
         zIfDdvWJe+eVik/zwfB7GuuftSM9ixQbVyhf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SIdoO/BXrCF5ZGx1sncTZthErRH1ESME+fQ4iZ40G4Y=;
        b=QxZycEde94AKfSmbfLIQPUVC//VOs9PhqLatW6FuMqN4xsW2qKiye/9udWMsD7ArI/
         37i/5B3UF5uDyV6QcCCqgUgrh/PjWtCGpaQtGTzf4YLH8a34ijb1X2zXNg6NSw8fYAGv
         eRWrEBj9VuPzQhkiaeSq4yt3mu09XT5wLKTwfhiZxJJ+LCn/j+l1xPO5UVrkAYnBjPJ8
         wsHdNNTmaC4a4YZ4/414wGElHcKtWlFYR0/2jprOyDiJlyOF+tKNHYxpIW7Rn0M+T+tp
         2enUHwU7HZM0YMgiSdxobMDY+GLyZxnwaz/SO1yskMYhoXkeL3v1KjpUpfO3aiUUQ2Q3
         ig9w==
X-Gm-Message-State: AOAM530RwSTPFrum1ONzXEU3HFCLPstoT81Ip/ntwaQB3orSAcuOFM/I
        fZ8AJPd98rKAbFp3H3Xitd4blJDCFChmag==
X-Google-Smtp-Source: ABdhPJzR8Tw2jdZ6eg+ipD1YwtKFopE9Tuu/sPOSmq8PcJpDRl/idH7p0h4re8fUoQIOPO9bKcB64Q==
X-Received: by 2002:a17:906:607:: with SMTP id s7mr16286026ejb.301.1612784044210;
        Mon, 08 Feb 2021 03:34:04 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id e24sm3751326ejb.121.2021.02.08.03.34.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 03:34:03 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id r21so415478wrr.9
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 03:34:03 -0800 (PST)
X-Received: by 2002:a5d:6404:: with SMTP id z4mr6111438wru.103.1612784042646;
 Mon, 08 Feb 2021 03:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
In-Reply-To: <20210207184855.GA27553@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 8 Feb 2021 20:33:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
Message-ID: <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph,

On Mon, Feb 8, 2021 at 3:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Any comments?
>

Sorry for the delay. The whole series looks very good to me. Thanks a lot.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> On Tue, Feb 02, 2021 at 10:51:03AM +0100, Christoph Hellwig wrote:
> > Hi all,
> >
> > this series adds the new noncontiguous DMA allocation API requested by
> > various media driver maintainers.
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
