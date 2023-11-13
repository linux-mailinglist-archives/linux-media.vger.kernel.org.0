Return-Path: <linux-media+bounces-253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A74297E9E2F
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D569C1C20969
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FD7210E3;
	Mon, 13 Nov 2023 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ec3/dl1W"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167DB33C9
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 14:08:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454F9D4C
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 06:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699884534; x=1731420534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WO8YGEKwYPmrT/paF0tEkPIPQwjhjbsofXgRRyE04YQ=;
  b=ec3/dl1W5JpYM5FW6zVvGwaH0oQ5VzgPIebDvnyoM3LU0kxYx2tkASgA
   RXR/yCJZzKg6VlG6oYH+ync+LgnfsYS19ZPjKvhs50lX4rdpdWvUG6f4O
   /0fdqptdyd+1AZzwi2vfWGEYrWxtiFv9nank+c07Dc7tS6xY80sKrJ4lZ
   EnKqAdo2Io4oTKAjDPiSoClYNnGfpy1MjRvmX6fVnKVJlj3ekcIPqb2b7
   5IjL+Ikl9YIdGqVxtJI+f/8DMCWTSrzjKzEpIS4pyEmecZTimkif0LlM9
   19Dgbb1FUQNu7Qf/qW4jPWPIwYeo6m6Ys7LLUWGalvJ822RG+ampjRVeV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="370638878"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="370638878"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 06:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="757814006"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="757814006"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 06:08:52 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D762111F7D1;
	Mon, 13 Nov 2023 16:08:49 +0200 (EET)
Date: Mon, 13 Nov 2023 14:08:49 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v2 5/6] media: ccs: Better separate CCS static data access
Message-ID: <ZVIt8Z_1FpxN2ooz@kekkonen.localdomain>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
 <20231113134458.1423754-6-sakari.ailus@linux.intel.com>
 <20231113135710.GG24338@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113135710.GG24338@pendragon.ideasonboard.com>

On Mon, Nov 13, 2023 at 03:57:10PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Nov 13, 2023 at 03:44:57PM +0200, Sakari Ailus wrote:
> > Separate CCS static data read-only register access in ccs-reg-access.c by
> > naming them differently.
> 
> "naming the access functions differently"
> 
> > The code in this file generally deals with reading and writing registers
> > where as static data (when it comes to ccs_static_read_only()) contains
> > the read-only register values but no hardware registers are accessed in
> > that case.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../driver-api/media/drivers/ccs/mk-ccs-regs  |  2 +-
> >  drivers/media/i2c/ccs/ccs-reg-access.c        | 20 +++++++++----------
> >  2 files changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> > index 01252ee6062b..3d3152b45821 100755
> > --- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> > +++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> > @@ -136,7 +136,7 @@ if (! defined $kernel) {
> >  
> >  print $H "#define CCS_FL_FLOAT_IREAL	" . flag_str(\$flag, \$all_flags) . "\n";
> >  print $H "#define CCS_FL_IREAL		" . flag_str(\$flag, \$all_flags) . "\n";
> > -print $H "#define CCS_BUILD_BUG \
> > +print $H "#define CCS_BUILD_BUG \\
> 
> This doesn't seem related.

Oops. This was meant to go to the previous patch. I'll address this in
v3...

> 
> >  	BUILD_BUG_ON(~CCI_REG_PRIVATE_MASK & ($all_flags))\n"
> >      if defined $kernel;
> >  
> > diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
> > index 25993445f4fe..652d705a2ef5 100644
> > --- a/drivers/media/i2c/ccs/ccs-reg-access.c
> > +++ b/drivers/media/i2c/ccs/ccs-reg-access.c
> > @@ -197,8 +197,8 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
> >  	return 0;
> >  }
> >  
> > -static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
> > -			   u32 reg, u32 *val)
> > +static int __ccs_static_read_only(struct ccs_reg *regs, size_t num_regs,
> 
> "static read only" sounds weird when interpreting "read" as a verb. And
> if "read" is not a verb, you're missing a verb :-) Maybe
> __ccs_read_state_data() would be a better name ? Same below.

Why state_data? I prefer to use terms used in the spec, not come up with
new ones.

There are also other blocks in static data beseides read-only register
values.

How about ccs_static_data_read_only_reg(), would that be more informative
in your opinion?

> 
> > +				  u32 reg, u32 *val)
> >  {
> >  	unsigned int width = ccs_reg_width(reg);
> >  	size_t i;
> > @@ -235,16 +235,16 @@ static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
> >  	return -ENOENT;
> >  }
> >  
> > -static int ccs_read_data(struct ccs_sensor *sensor, u32 reg, u32 *val)
> > +static int ccs_static_read_only(struct ccs_sensor *sensor, u32 reg, u32 *val)
> >  {
> > -	if (!__ccs_read_data(sensor->sdata.sensor_read_only_regs,
> > -			     sensor->sdata.num_sensor_read_only_regs,
> > -			     reg, val))
> > +	if (!__ccs_static_read_only(sensor->sdata.sensor_read_only_regs,
> > +				    sensor->sdata.num_sensor_read_only_regs,
> > +				    reg, val))
> >  		return 0;
> >  
> > -	return __ccs_read_data(sensor->mdata.module_read_only_regs,
> > -			       sensor->mdata.num_module_read_only_regs,
> > -			       reg, val);
> > +	return __ccs_static_read_only(sensor->mdata.module_read_only_regs,
> > +				      sensor->mdata.num_module_read_only_regs,
> > +				      reg, val);
> >  }
> >  
> >  static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
> > @@ -253,7 +253,7 @@ static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
> >  	int rval;
> >  
> >  	if (data) {
> > -		rval = ccs_read_data(sensor, reg, val);
> > +		rval = ccs_static_read_only(sensor, reg, val);
> >  		if (!rval)
> >  			return 0;
> >  	}
> 

-- 
Regards,

Sakari Ailus

