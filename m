Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD823AB0EE
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 12:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhFQKJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 06:09:07 -0400
Received: from verein.lst.de ([213.95.11.211]:58078 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229872AbhFQKJG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 06:09:06 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 01E6E68C4E; Thu, 17 Jun 2021 12:06:57 +0200 (CEST)
Date:   Thu, 17 Jun 2021 12:06:56 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <20210617100656.GA11107@lst.de>
References: <20210427131344.139443-1-senozhatsky@chromium.org> <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl> <YMsAIVs7G2hUDR2F@google.com> <20210617080107.GA1422@lst.de> <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com> <20210617085233.GA4702@lst.de> <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 06:40:58PM +0900, Tomasz Figa wrote:
> Sorry, I meant dma_alloc_attrs() and yes, it's indeed a misnomer. Our
> use case basically has no need for the additional coherent mapping, so
> creation of it can be skipped to save some vmalloc space. (Yes, it
> probably only matters for 32-bit architectures.)

Yes, that is the normal use case, and it is solved by using
dma_alloc_noncoherent or dma_alloc_noncontigous without the vmap
step.
