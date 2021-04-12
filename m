Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312AA35C2F5
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242162AbhDLJxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:53:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242552AbhDLJu2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DCCC61245;
        Mon, 12 Apr 2021 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618220986;
        bh=STkQ8+IugJsod09/b3SSA8/zerHQtq0zCVlHXClktnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rrU/vBGLpFGNXCdED1p2vyNrtl79FV3jbKkAogjLsxwjdkJ+p4144siTcql0FGob4
         6ESq0N9PAbCIC1nWPLffd5WI+s85MjgDizjSArtwXvrrLHrVtG76XlYJyJO5xGOQhr
         ovSIoOvwQefqyegTKi2qTXT2ebr5rlaq9E4EA47g=
Date:   Mon, 12 Apr 2021 11:49:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mitali Borkar <mitaliborkar810@gmail.com>, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 1/6] staging: media: intel-ipu3: replace bit shifts with
 BIT() macro
Message-ID: <YHQXty07oAP1L0W9@kroah.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <cc7b827a3264f08cedb76adddd16a34df48f935f.1618180659.git.mitaliborkar810@gmail.com>
 <20210412094230.GI3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412094230.GI3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 12, 2021 at 12:42:30PM +0300, Sakari Ailus wrote:
> Hi Mitali,
> 
> On Mon, Apr 12, 2021 at 04:38:39AM +0530, Mitali Borkar wrote:
> > Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
> > This BIT() macro from linux/bitops.h is used to define IPU3_UAPI_GRID_Y_START_EN
> > and IPU3_UAPI_AWB_RGBS_THR_B_* bitmask.
> > Use of macro is better and neater. It maintains consistency.
> > Reported by checkpatch.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/ipu3/include/intel-ipu3.h | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > index edd8edda0647..589d5ccee3a7 100644
> > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > @@ -5,6 +5,7 @@
> >  #define __IPU3_UAPI_H
> >  
> >  #include <linux/types.h>
> > +#include <linux/bitops.h>
> >  
> >  /* from /drivers/staging/media/ipu3/include/videodev2.h */
> >  
> > @@ -22,11 +23,11 @@
> >  #define IPU3_UAPI_MAX_BUBBLE_SIZE			10
> >  
> >  #define IPU3_UAPI_GRID_START_MASK			((1 << 12) - 1)
> > -#define IPU3_UAPI_GRID_Y_START_EN			(1 << 15)
> > +#define IPU3_UAPI_GRID_Y_START_EN			BIT(15)
> 
> This header is used in user space where you don't have the BIT() macro.

If that is true, why is it not in a "uapi" subdir within this driver?

Otherwise it is not obvious at all that this is the case :(

thanks,

greg k-h
