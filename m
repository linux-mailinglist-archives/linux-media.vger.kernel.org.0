Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A259306078
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 17:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236959AbhA0QCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 11:02:37 -0500
Received: from verein.lst.de ([213.95.11.211]:53502 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236827AbhA0P4x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 10:56:53 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5554C68AFE; Wed, 27 Jan 2021 16:56:08 +0100 (CET)
Date:   Wed, 27 Jan 2021 16:56:08 +0100
From:   ". Christoph Hellwig" <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     ". Christoph Hellwig" <hch@lst.de>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
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
Message-ID: <20210127155608.GA20272@lst.de>
References: <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de> <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com> <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de> <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com> <20210111083614.GA27589@lst.de> <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com> <20210126170659.GA9104@lst.de> <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 27, 2021 at 12:29:08AM +0100, Ricardo Ribalda wrote:
> - Is there any platform where dma_alloc_noncontiguos can fail?
> This is, !ops->alloc_noncontiguous and !dev->coherent_dma_mask
> If yes then we need to add a function to let the driver know in
> advance that it has to use the coherent allocator (usb_alloc_coherent
> for uvc)

dev->coherent_dma_mask is set by the driver.  So the only reason why
dma_alloc_noncontiguos will fail is because is because it can't
allocate any memory.

> - In dma_alloc_noncontiguos, on the dma_alloc_pages fallback. If we
> have a device where the dma happens in only one direction, could not
> get more performance with DMA_FROM/TO_DEVICE instead of
> DMA_BIDIRECTIONAL ?

Yes, we could probably do that.

> 
> 
> Then I have tried to use the API, and I have encountered a problem: on
> uvcvideo the device passed to the memory allocator is different for
> DMA_PAGES and NON_CONTIGUOUS:
> https://github.com/ribalda/linux/blob/042cd497739f71c8d4a83a67ee970369e2baca4a/drivers/media/usb/uvc/uvc_video.c#L1236
> 
> I need to dig a bit tomorrow to figure out why this is, I have
> hardware to test both paths, so it should not be too difficult.

I always found the USB dma alloc API a little weird, but we might have
to follow the scheme of the usb coherent wrappers there.
