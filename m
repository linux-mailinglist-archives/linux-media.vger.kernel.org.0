Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FCB341DC4
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 14:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhCSNKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 09:10:48 -0400
Received: from verein.lst.de ([213.95.11.211]:46143 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhCSNKQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 09:10:16 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3E99C68BFE; Fri, 19 Mar 2021 14:10:12 +0100 (CET)
Date:   Fri, 19 Mar 2021 14:10:11 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 6/6] media: uvcvideo: Use dma_alloc_noncontiguous API
Message-ID: <20210319131011.GA3372@lst.de>
References: <20210312235521.1408503-1-ribalda@chromium.org> <CANiDSCunsYwjB=PYYJnpaEnB3pg7No40gOE1jTVwxJkJJpE2Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCunsYwjB=PYYJnpaEnB3pg7No40gOE1jTVwxJkJJpE2Nw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 19, 2021 at 02:05:21PM +0100, Ricardo Ribalda wrote:
> > +                                   uvc_urb->sgt,
> > +                                   uvc_stream_dir(uvc_urb->stream));
> > +       return usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> > +}
> 
> We should have mem_flags instead of GFP_KERNEL here
> 
> 
> Is it too late to fix it in your tree? Do I need to send a patch to fix it?

As far as I know we don't have anything that has pulled in the tree yet,
so I can just fold the fix in.
