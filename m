Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63C935C479
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238999AbhDLK4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 06:56:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:51184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238214AbhDLK4M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 06:56:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66C0B61241;
        Mon, 12 Apr 2021 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618224955;
        bh=aB95kWMNAXrwLQ8EZE2R9Q6SELn4hSsYTEVZtDp+QTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hhxe+VouqAXKE4yzXmh1cofs+D/yKh5VxL+zo/lYhsgTuU8TbzH2Lx8XNNhH7hfAZ
         pECgOp1QRqRpPzPdp6VXI/MeNWHRvNuf7HaQP+J8fIn74O2bRmC7VfSdc6x+zexTZ2
         pXay2yJkEYpZdUPzOMY3ISHdKr+VL4e4nkeZZ+Rs=
Date:   Mon, 12 Apr 2021 12:55:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mitali Borkar <mitaliborkar810@gmail.com>, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/6] staging: media: intel-ipu3: replace bit shifts with
 BIT() macro
Message-ID: <YHQnOJ2t0+q65La2@kroah.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <cc7b827a3264f08cedb76adddd16a34df48f935f.1618180659.git.mitaliborkar810@gmail.com>
 <20210412094230.GI3@paasikivi.fi.intel.com>
 <YHQXty07oAP1L0W9@kroah.com>
 <20210412104435.GL3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412104435.GL3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 12, 2021 at 01:44:35PM +0300, Sakari Ailus wrote:
> Hi Greg,
> 
> On Mon, Apr 12, 2021 at 11:49:43AM +0200, Greg KH wrote:
> > On Mon, Apr 12, 2021 at 12:42:30PM +0300, Sakari Ailus wrote:
> > > Hi Mitali,
> > > 
> > > On Mon, Apr 12, 2021 at 04:38:39AM +0530, Mitali Borkar wrote:
> > > > Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
> > > > This BIT() macro from linux/bitops.h is used to define IPU3_UAPI_GRID_Y_START_EN
> > > > and IPU3_UAPI_AWB_RGBS_THR_B_* bitmask.
> > > > Use of macro is better and neater. It maintains consistency.
> > > > Reported by checkpatch.
> > > > 
> > > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > > ---
> > > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > index edd8edda0647..589d5ccee3a7 100644
> > > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > @@ -5,6 +5,7 @@
> > > >  #define __IPU3_UAPI_H
> > > >  
> > > >  #include <linux/types.h>
> > > > +#include <linux/bitops.h>
> > > >  
> > > >  /* from /drivers/staging/media/ipu3/include/videodev2.h */
> > > >  
> > > > @@ -22,11 +23,11 @@
> > > >  #define IPU3_UAPI_MAX_BUBBLE_SIZE			10
> > > >  
> > > >  #define IPU3_UAPI_GRID_START_MASK			((1 << 12) - 1)
> > > > -#define IPU3_UAPI_GRID_Y_START_EN			(1 << 15)
> > > > +#define IPU3_UAPI_GRID_Y_START_EN			BIT(15)
> > > 
> > > This header is used in user space where you don't have the BIT() macro.
> > 
> > If that is true, why is it not in a "uapi" subdir within this driver?
> > 
> > Otherwise it is not obvious at all that this is the case :(
> 
> It defines an interface towards the user space and the argument has been a
> staging driver shouldn't be doing that (for the lack of ABI stability),
> hence leaving it where it is currently.

I think we are talking past each other here...

If you have a userspace api, then put that in a .h file that has a
"uapi" in the path.  Just because you have this in a staging driver does
not mean you should not have such a thing, otherwise you are going to
constantly fight against people sending you patches like this as there
is no obvious way to determine this.

So how about moving this file to:
	drivers/staging/media/ipu3/include/uapi/intel-ipu3.h

thanks,

greg k-h
