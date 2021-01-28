Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94FCE307095
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 09:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhA1IDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 03:03:11 -0500
Received: from verein.lst.de ([213.95.11.211]:56319 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231846AbhA1IAJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 03:00:09 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 18E2068C4E; Thu, 28 Jan 2021 08:57:38 +0100 (CET)
Date:   Thu, 28 Jan 2021 08:57:37 +0100
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
Message-ID: <20210128075737.GA28741@lst.de>
References: <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com> <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de> <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com> <20210111083614.GA27589@lst.de> <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com> <20210126170659.GA9104@lst.de> <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com> <20210127155608.GA20272@lst.de> <CANiDSCsHquQWgeGurmh83UDm3xPzkzaRTV0EOKQs=Q_a349f=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsHquQWgeGurmh83UDm3xPzkzaRTV0EOKQs=Q_a349f=Q@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 27, 2021 at 10:35:02PM +0100, Ricardo Ribalda wrote:
> I have used the current API here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/log/?h=uvc-noncontiguous
> 
> And I think the result is very clean. Great work!
> 
> I have tested it in X86 and in arm64, with similar performance as the
> previous patchset.
> 
> Maybe you want to cherry pick that commit into your series I can also
> send the patch to the list for review if you prefer so.
> 
> At least in 5.11 rc5 I the same dmadev worked in arm64 and x86.

Given that Sergey mentioned the v4l patchset needs more work I'll
use your commit as the example for sending out my series.

Thanks for all the work!
