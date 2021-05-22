Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330F838D51B
	for <lists+linux-media@lfdr.de>; Sat, 22 May 2021 12:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhEVK2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 May 2021 06:28:46 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:46844 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230164AbhEVK2o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 May 2021 06:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1621679054; bh=pntNiNl8/Dy7MmFkZk90RCYekpUw7OpnE3Bh9rZfsrs=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=Ntbz0bvETVPb0AyKaKgAeslcMbFFk96gBIBfjhpZnBmFyJJNVTMXpIU5moLBCHuXU
         DrHgo9EtIoxtYOIEA6RlCgHHHA5EFefYnZkImM9Awpq2EYxffbHK9kRYTXLq4xZfNR
         e9AReyCIhZwK9Fv/sOURTwlcKlLniHkj1Hfs892w=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 22 May 2021 12:24:14 +0200 (CEST)
X-EA-Auth: Tbm0ZmgWJ2lRn83pNiRISkvsn2jiX5I1Pm4oL+z5hTnUI1vLy1APkXX+TLRcfHhthKDWrWBPIwpyshC0UipINY1FVWqqdgXh
Date:   Sat, 22 May 2021 15:54:06 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: media: atomisp: code formatting changes
 sh_css_params.c
Message-ID: <YKjbxhzD/yKQ6B2R@dU2104>
References: <cover.1619850663.git.drv@mailo.com>
 <6bc123d66150ccaa6dc6fdf2f11c8669e2f493e2.1619850663.git.drv@mailo.com>
 <20210521105222.GJ1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521105222.GJ1955@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 01:52:22PM +0300, Dan Carpenter wrote:
> On Sat, May 01, 2021 at 12:16:07PM +0530, Deepak R Varma wrote:
> > @@ -1562,8 +1544,10 @@ ia_css_isp_3a_statistics_map_allocate(
> >  	base_ptr = me->data_ptr;
> >  
> >  	me->size = isp_stats->size;
> > -	/* GCC complains when we assign a char * to a void *, so these
> > -	 * casts are necessary unfortunately. */
> > +	/*
> > +	 * GCC complains when we assign a char * to a void *, so these
> > +	 * casts are necessary unfortunately.
> > +	 */
> 
> Not related to your patch, but assigning a char pointer to a void
> pointer is fine and GCC will not complain.  The problem is that
> me->dmem_stats is not a void pointer.  Someone should delete that
> nonsense comment.

I agree. Well caught. I will remove these comments and send v2. Waiting for feedback
on other patches of this series.

deepak.

> 
> >  	me->dmem_stats    = (void *)base_ptr;
> >  	me->vmem_stats_hi = (void *)(base_ptr + isp_stats->dmem_size);
> >  	me->vmem_stats_lo = (void *)(base_ptr + isp_stats->dmem_size +
> 
> regards,
> dan carpenter


