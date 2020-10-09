Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730E12886DC
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 12:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731806AbgJIK0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 06:26:25 -0400
Received: from mga02.intel.com ([134.134.136.20]:10549 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgJIK0Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 06:26:25 -0400
IronPort-SDR: LPfa59hPFwgp+Bsl9d5U2xPLk1xCRIfgN/2Hxq6i2IcIoaYuKFfbHMFywqh8PJcAUz4tia8Ar8
 49FymNMHHcpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="152387720"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="152387720"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 03:26:24 -0700
IronPort-SDR: vPYLwIEg3J5Wrexl3zxyyeeXarj1luumI0WFRXrr9jGuWR8qN3/MSqj0YiYfRmmrrCNSPEy5t0
 w9pq3qaTELPw==
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="312504156"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 03:26:22 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A108420728; Fri,  9 Oct 2020 13:26:20 +0300 (EEST)
Date:   Fri, 9 Oct 2020 13:26:20 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 01/10] media: ipu3-cio2: Simplify cleanup code
Message-ID: <20201009102620.GS26842@paasikivi.fi.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20201009005716.GD12857@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009005716.GD12857@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent and Andy,

On Fri, Oct 09, 2020 at 03:57:16AM +0300, Laurent Pinchart wrote:
> Hi Andy,
> 
> Thank you for the patch. Glad to see interest in the CIO2 driver :-)
> 
> On Mon, Aug 17, 2020 at 07:07:24PM +0300, Andy Shevchenko wrote:
> > The code looks more nicer if we use:
> > 	while (i--)
> > instead:
> > 	for (i = i - 1; i >= 0; i--)
> > 
> > This would also allow making 'i' unsigned again.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: converted i to unsigned (Sakari)
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index 92f5eadf2c99..cb74d49934f1 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -847,7 +847,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
> >  	unsigned int lops = DIV_ROUND_UP(pages + 1, entries_per_page);
> >  	struct sg_table *sg;
> >  	struct sg_dma_page_iter sg_iter;
> > -	int i, j;
> > +	unsigned int i, j;
> >  
> >  	if (lops <= 0 || lops > CIO2_MAX_LOPS) {
> >  		dev_err(dev, "%s: bad buffer size (%i)\n", __func__,
> > @@ -887,7 +887,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
> >  	b->lop[i][j] = cio2->dummy_page_bus_addr >> PAGE_SHIFT;
> >  	return 0;
> >  fail:
> > -	for (i--; i >= 0; i--)
> > +	while (i--)
> >  		dma_free_coherent(dev, CIO2_PAGE_SIZE,
> >  				  b->lop[i], b->lop_bus_addr[i]);
> 
> Looks good to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> There's an additional issue though, if vb2_dma_sg_plane_desc() fails, we
> should free all the allocated memory.

These patches have been merged some time ago. Further changes should be on
top of this set.

-- 
Sakari Ailus
