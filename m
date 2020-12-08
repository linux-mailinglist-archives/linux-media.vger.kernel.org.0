Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F992D2415
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 08:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgLHHOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 02:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgLHHOE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 02:14:04 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6775EC061749;
        Mon,  7 Dec 2020 23:13:24 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id m9so11383862pgb.4;
        Mon, 07 Dec 2020 23:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xWmdWORP2xSA8SF/fBBpyGpTlHNeOKrylAwBcpLi8AI=;
        b=HWBopCdK/zYKNU9XaTrzy+MvtNpyCzBNPw+Hr87VL7ax98P0PaHHUB3zs5RMNX7zHk
         4TrRqWtPDyjZXCoHrQ9UVGcxOAO8JgmPGuWGifb8DUnD4ZRhCNeyZy4+rK57tubOe5bJ
         i0V5lBf891j+bWsiMGfTsYrwgmSt3efjd1iBNxQ06w8xK5G9Kmb3Q/hQ3TG+/mnXRBkD
         tEbPtduFckcWYZ/PEqAGU5KAt0t0pEuZ5Hg7F1fg7ADzL0BW2ezb9lWesvuOefxrY6+z
         Fi81gVrQVzuyYD+u/jNoPIBWqjwvjhlru/bwulBAWT8lUHF+bAeGj/a8cEK65NUd4NO6
         hkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xWmdWORP2xSA8SF/fBBpyGpTlHNeOKrylAwBcpLi8AI=;
        b=gUHhc7jB/IwYVkwRV6USL/sIPy2d4Xo2e3XyIMhH8rlSvr5btsMcTucs3JDkilsNM6
         Yur93tJnn8RVJ1ktNTQ12obhVNQ5oSooWgpu3qldw1KI26EBxb2lNLpdil4sqz1lhr2y
         1auRRScNHllTZDz6cD6k7zHihE6a4H3ogUj7Y6PGHdHwk/lkF94OJLFmTIE3Zk1WbDBo
         epJ1u6mNRMVM7DQLPK6WP12GWOc5UF069VSWHBFudA4JAJ1K5kFdNQi09OAzcdpSJ+dP
         ebSPdL1TcysbmnXTBenwUwOWLYf5UKjtN4M3LTZz5n4Nr6jqyf6ps0zf4HlICVDHakrm
         vwdg==
X-Gm-Message-State: AOAM531ryoS1/JYnOEJLe+4HyIohX6li/2bwSabHxu+h84juqVx7aD7m
        KCX3aQfm4VfXs7qaujwbCPTW3Ovwsxs=
X-Google-Smtp-Source: ABdhPJwzvlkqPw8IlSOUgigm/jQwVrd9OMVHM0DBNKMKS8I45sshs8/gAeGFl1eTOVhtP+3DgSeZPg==
X-Received: by 2002:a63:b554:: with SMTP id u20mr21681043pgo.249.1607411603843;
        Mon, 07 Dec 2020 23:13:23 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id b14sm15074971pgj.9.2020.12.07.23.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 23:13:22 -0800 (PST)
Date:   Tue, 8 Dec 2020 16:13:20 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        ". Christoph Hellwig" <hch@lst.de>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201208071320.GA1667627@google.com>
References: <20201125221917.150463-1-ribalda@chromium.org>
 <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com>
 <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/12/08 13:54), Tomasz Figa wrote:
> 
> In any case, Sergey is going to share a preliminary patch on how the
> current API would be used in the V4L2 videobuf2 framework. That should
> give us more input on how such a helper could look.

HUGE apologies for the previous screw up! I replied in the
gmail web-interface and that did not work out as expected
(at all, big times).

I'm sorry about that!

Take two, no html this time around.

---

My current WIP (deep WIP) series can be found at [0]. The patch that adds new
DMA API support is at the head of the series [1]. New DMA API requires us to
have several internal videobuf2 API changes before we can proceed [2]: v4l2 and
videobuf2 core do not pass enough information to the vb2 allocators now. Previously,
if user space requests non-coherent allocation v4l2 would set queue dma_attr bit,
videobuf2 core would pass queue->dma_attrs to vb2 allocator, which would 
those dma_attrs for dma_alloc(). So everything was transparent (sort of). Since we
don't have that dma_attr flag anymore, there is no way for v4l2 to pass the request
information (coherent or non-coherent) to the vb2 allocator. Hence we need to rework
the vb2 allocator API. I currently pass vb2 pointer, but we decided to rework it again
and to pass dedicated VB2_ALLOC_FLAGS from the videobuf2 core to the 
allocator. This is still in my private tree and not completely ready, will push those
patches to github later.

Another thing to notice is that the new API requires us to have two execution branches
in allocators - one for the current API; and one for the new API (if it's supported and
if user-space requested non-coherent allocation).

[0] https://github.com/sergey-senozhatsky/linux-next-ss/commits/master
[1] https://github.com/sergey-senozhatsky/linux-next-ss/commit/a45f48b483daee59594c62e4aaf01790aab960c8
[2] https://github.com/sergey-senozhatsky/linux-next-ss/commit/b784145101c398da7fe9e2608b6001e58e05a9b5

	-ss
