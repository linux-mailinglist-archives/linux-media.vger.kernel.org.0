Return-Path: <linux-media+bounces-77-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F18DF7E8506
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BF86B20C45
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDDC3C68F;
	Fri, 10 Nov 2023 21:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ab15hHT9"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C7E3B2A3
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 21:24:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4A84205
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 13:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699651476; x=1731187476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l+Yi3vTxzI24jRhHcVnHRAngclaxcmwk1qHw14ssVKQ=;
  b=ab15hHT9XDCaKyFqlDlE+8taH+rfPVMRDwn0l69LMGxXn6D4kI3eTy+V
   xzsPDvM7vuzHP4K6m1HpLdAmoZCtRUkTZg1kpS40u6edupBgxYUTtWq4g
   1iaPFx2k/zATpp8MKWKVVA/mHo6zsBV0E8XCDNHKq94YIivM9wKrwOl3X
   NRiNtdcHms+6gZpJ+4GqDvxfZnjkH1FZXMLI5Ni+1fWp5NvTABo+5n3iu
   K89ARoic1E6y30fImpV+uNryeqzIfKDOoIBbDpyt7DPwlzeDKUE9mnbOv
   m4AvpPhM5EY4y8nXNkhY4TNpOjVo1UK9BQwrTfcQIPSFVDaeQZdux6AdC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421326295"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="421326295"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:24:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937256407"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="937256407"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:24:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8B9E611F894;
	Fri, 10 Nov 2023 23:24:31 +0200 (EET)
Date: Fri, 10 Nov 2023 21:24:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 5/6] media: ccs: Better separate CCS static data access
Message-ID: <ZU6fjzCsopXJPesg@kekkonen.localdomain>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-6-sakari.ailus@linux.intel.com>
 <20231110144622.GD21167@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110144622.GD21167@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Nov 10, 2023 at 04:46:22PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Nov 10, 2023 at 11:47:04AM +0200, Sakari Ailus wrote:
> > Separate CCS static data read-only register access in ccs-reg-access.c.
> 
> Please explain why. I don't have enough information to review this
> patch.

You could read the spec. ;-)

I had to read the code to figure out what it was supposed to do, as it
wasn't apparent frome the function names: virtually all functions in the
file somehow deal with reading or writing registers. CCS static data is
used to store, among other things, values of read-only registers, and this
is what is being accessed here.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs/ccs-reg-access.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
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

