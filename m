Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114932FD6C7
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 18:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391733AbhATRSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 12:18:44 -0500
Received: from verein.lst.de ([213.95.11.211]:56843 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391740AbhATRSj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 12:18:39 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2631968B05; Wed, 20 Jan 2021 18:17:49 +0100 (CET)
Date:   Wed, 20 Jan 2021 18:17:48 +0100
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
Message-ID: <20210120171748.GA24290@lst.de>
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de> <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de> <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com> <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de> <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com> <20210111083614.GA27589@lst.de> <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 15, 2021 at 02:08:14PM +0100, Ricardo Ribalda wrote:
> > > Did you have time to look into this?
> > >
> > > No hurry, I just want to make sure that I didn't miss anything ;)
> >
> > Haven't managed to get to it, sorry.
> 
> No worries!, is there something we can do to help you with this?

Not yet.  I hope to get to it in the next days, and then soon I'll
need all the help you can give me for feedback and testing.
