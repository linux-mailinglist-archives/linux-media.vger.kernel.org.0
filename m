Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D92A35C492
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239900AbhDLLAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:00:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:33680 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239890AbhDLLAm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:00:42 -0400
IronPort-SDR: mueUXr1tte38fCGcx6Oc02xQvnvFNeLxNPpQHR/EYbiLgNly7xOCypLHeMpW37enI4A41H7/k1
 /T/MBrQTTQLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="192031795"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="192031795"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 04:00:23 -0700
IronPort-SDR: +S8E8BV1Dc2BzlBF8/6WPnhbTKYz9r1ME7efkhsT8jHc1YwtQorbKlYV2MeEezTE1fmx7imL74
 OF5Ro7iqytCA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="599933660"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 04:00:19 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6EF60203D0;
        Mon, 12 Apr 2021 14:00:17 +0300 (EEST)
Date:   Mon, 12 Apr 2021 14:00:17 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mitali Borkar <mitaliborkar810@gmail.com>, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/6] staging: media: intel-ipu3: replace bit shifts with
 BIT() macro
Message-ID: <20210412110017.GM3@paasikivi.fi.intel.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <cc7b827a3264f08cedb76adddd16a34df48f935f.1618180659.git.mitaliborkar810@gmail.com>
 <20210412094230.GI3@paasikivi.fi.intel.com>
 <YHQXty07oAP1L0W9@kroah.com>
 <20210412104435.GL3@paasikivi.fi.intel.com>
 <YHQnOJ2t0+q65La2@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHQnOJ2t0+q65La2@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 12, 2021 at 12:55:52PM +0200, Greg KH wrote:
> On Mon, Apr 12, 2021 at 01:44:35PM +0300, Sakari Ailus wrote:
> > Hi Greg,
> > 
> > On Mon, Apr 12, 2021 at 11:49:43AM +0200, Greg KH wrote:
> > > On Mon, Apr 12, 2021 at 12:42:30PM +0300, Sakari Ailus wrote:
> > > > Hi Mitali,
> > > > 
> > > > On Mon, Apr 12, 2021 at 04:38:39AM +0530, Mitali Borkar wrote:
> > > > > Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
> > > > > This BIT() macro from linux/bitops.h is used to define IPU3_UAPI_GRID_Y_START_EN
> > > > > and IPU3_UAPI_AWB_RGBS_THR_B_* bitmask.
> > > > > Use of macro is better and neater. It maintains consistency.
> > > > > Reported by checkpatch.
> > > > > 
> > > > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > > > ---
> > > > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 7 ++++---
> > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > index edd8edda0647..589d5ccee3a7 100644
> > > > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > @@ -5,6 +5,7 @@
> > > > >  #define __IPU3_UAPI_H
> > > > >  
> > > > >  #include <linux/types.h>
> > > > > +#include <linux/bitops.h>
> > > > >  
> > > > >  /* from /drivers/staging/media/ipu3/include/videodev2.h */
> > > > >  
> > > > > @@ -22,11 +23,11 @@
> > > > >  #define IPU3_UAPI_MAX_BUBBLE_SIZE			10
> > > > >  
> > > > >  #define IPU3_UAPI_GRID_START_MASK			((1 << 12) - 1)
> > > > > -#define IPU3_UAPI_GRID_Y_START_EN			(1 << 15)
> > > > > +#define IPU3_UAPI_GRID_Y_START_EN			BIT(15)
> > > > 
> > > > This header is used in user space where you don't have the BIT() macro.
> > > 
> > > If that is true, why is it not in a "uapi" subdir within this driver?
> > > 
> > > Otherwise it is not obvious at all that this is the case :(
> > 
> > It defines an interface towards the user space and the argument has been a
> > staging driver shouldn't be doing that (for the lack of ABI stability),
> > hence leaving it where it is currently.
> 
> I think we are talking past each other here...
> 
> If you have a userspace api, then put that in a .h file that has a
> "uapi" in the path.  Just because you have this in a staging driver does
> not mean you should not have such a thing, otherwise you are going to
> constantly fight against people sending you patches like this as there
> is no obvious way to determine this.
> 
> So how about moving this file to:
> 	drivers/staging/media/ipu3/include/uapi/intel-ipu3.h

Ah, sure! I'll send a patch.

-- 
Sakari Ailus
