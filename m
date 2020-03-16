Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4284186720
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 09:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbgCPI4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 04:56:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40864 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730075AbgCPI4p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 04:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=7pDz5ADqTojT39uknaN/wTkWGyi3TS8NPv+4TYh5v3I=; b=bq/MSiU2m4+OhStcr92bexqdrY
        xXm4OjEzLuxQccuIZxS2Cnmc8fEo5hGe7oYOJVyK8LhJ0aLuhZit23uhRss8ySr2gjqIXvgUEGeAH
        6gHAckpYmwaW/45GXPI0wcFT5dQ7S+Da0TG1mTuoUNNoDlBV2kkM4q9xt9zGfzg82h9SOocWDINfn
        ttGpiVHVYNl6xPM8SNEQ75FyeWTPPZavoTVk2y8/VRk1J+W1G1ndVrYASq1frz5nEAQv6ZlHaMg1t
        L446+ceQ1rBHrOfA5i1JC6PntL5GoRHacJZ94WgN9/8nUOjxhofZ6gHyqrOQTvEjp3lO7hTA2BExY
        RN1PPV4A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jDlYB-0004si-0O; Mon, 16 Mar 2020 08:56:43 +0000
Date:   Mon, 16 Mar 2020 01:56:42 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David1.Zhou@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200316085642.GC1831@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
 <20200312141928.GK31668@ziepe.ca>
 <20200313112139.GA4913@infradead.org>
 <20200313121742.GZ31668@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313121742.GZ31668@ziepe.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 13, 2020 at 09:17:42AM -0300, Jason Gunthorpe wrote:
> On Fri, Mar 13, 2020 at 04:21:39AM -0700, Christoph Hellwig wrote:
> > On Thu, Mar 12, 2020 at 11:19:28AM -0300, Jason Gunthorpe wrote:
> > > The non-page scatterlist is also a big concern for RDMA as we have
> > > drivers that want the page list, so even if we did as this series
> > > contemplates I'd have still have to split the drivers and create the
> > > notion of a dma-only SGL.
> > 
> > The drivers I looked at want a list of IOVA address, aligned to the
> > device "page size".  What other data do drivers want?  Execept for the
> > software protocol stack drivers, which of couse need pages for the
> > stack futher down.
> 
> In principle it is possible to have just an aligned page list -
> however the page size is variable, following certain rules, and today
> the drivers still determine the correct page size largely on their
> own.  
> 
> Some progress was made recently to consolidate this, but more is
> needed.
> 
> If the common code doesn't know the device page size in advance then
> today's approach of sending largest possible dma mapped SGLs into the
> device driver is best. The driver only has to do splitting.

The point was that drivers don't need pages, drivers need IOVAs.  In
what form they are stuffed into the hardware is the drivers problem.
