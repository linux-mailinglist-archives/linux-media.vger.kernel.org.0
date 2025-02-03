Return-Path: <linux-media+bounces-25554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 276D8A255BF
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C88213A4EEE
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEDE1FF1C7;
	Mon,  3 Feb 2025 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2+ljKe0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E215288B1;
	Mon,  3 Feb 2025 09:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574600; cv=none; b=sy4jLejYR1FK9dSBkytGARtj8Jkdc+l7OaOp7XmSwP3PIxFYA0cRjXssXdT9lEpN6iiOHgYI0RAzX/3rR4cUGWtQ/hy99+K9Aj56pXWJ4M50SpBNK3zCOe/KChc/DNjs+VUnChsIJi2pQ18fl7gIoJf3qPcUMNhABgKBPvCsXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574600; c=relaxed/simple;
	bh=VbFDT5cjrVHHigACBdyZriVMCPiqVugmKlgYJpkK1oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WN5nuo2/yU7lcEcFBWdJiAJhEwAVIIj9JlVHXLnRedLj0Cf9A/wTqfOWgRPObpVzIPO/b374qi/6gooOd3pROxl5issNctHnlAMOBAAWLEVii5YJIGwMP3aKWO9kFBS4I1LjWcZETFmGLYtXFKhvsGhkCHWEhi06LWsPTpKoz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2+ljKe0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738574599; x=1770110599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VbFDT5cjrVHHigACBdyZriVMCPiqVugmKlgYJpkK1oY=;
  b=C2+ljKe0dwlck0yytXn8XKas3E4t8ZS5PVKukDGp2dkPUn4vhyThdIvU
   M8YCd61DpyAoJHQsV5AJK6P27a74R5Qv6Sbz9U16gKkodpx1HFMb48AKU
   4u5Fn/gBuOIHtlT7VV+ayJrfUoZB0CcGUU0ze1MxKxGCoGeo26YQ06gQX
   OIToHuyCsSKrz38DFX26aFiypyPM07R9gwE6Gh79YDYR8dG7ahejlgsak
   xed66hzNynrAPMz07GQVDl1U7Tbt1kIn3PHn9U8dq9ZFI6eWlLpVqY/dP
   os+84bV7Ng20rcX2t4R84jXOLCC3N5CxdMoQ6o2urHWN7T2l8jfoz1dPg
   A==;
X-CSE-ConnectionGUID: o44FPI0KSU68Es3tHDcOLw==
X-CSE-MsgGUID: /7IfYiXoQK+qC771vjkIxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="42715525"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42715525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:23:19 -0800
X-CSE-ConnectionGUID: m0M9MAp9R8OwBWrMZDL5xQ==
X-CSE-MsgGUID: OLzlCXTAQ+uSHd8kFDcFBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115209673"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:23:17 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D417311F9C3;
	Mon,  3 Feb 2025 11:23:14 +0200 (EET)
Date: Mon, 3 Feb 2025 09:23:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 07/19] media: i2c: ds90ub953: Speed-up I2C watchdog timer
Message-ID: <Z6CLAtL160DEtPfz@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-7-e0b9a1f644da@ideasonboard.com>
 <Z4fDfQcnZiHC0Fms@kekkonen.localdomain>
 <7e034745-831a-4518-8c4e-003fa7773a57@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e034745-831a-4518-8c4e-003fa7773a57@ideasonboard.com>

Moi,

On Fri, Jan 24, 2025 at 03:19:32PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 15/01/2025 16:17, Sakari Ailus wrote:
> > Moi,
> > 
> > On Fri, Jan 10, 2025 at 11:14:07AM +0200, Tomi Valkeinen wrote:
> > > From: Jai Luthra <jai.luthra@ideasonboard.com>
> > > 
> > > On the I2C bus for remote clients (sensors), by default the watchdog
> > > timer expires in 1s. To allow for a quicker system bring-up time, TI
> > > recommends to speed it up to 50us [1].
> > > 
> > > [1]: Section 7.3.1.1 - https://www.ti.com/lit/gpn/ds90ub953-q1
> > > 
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   drivers/media/i2c/ds90ub953.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> > > index 99a4852b9381..6c36980e8beb 100644
> > > --- a/drivers/media/i2c/ds90ub953.c
> > > +++ b/drivers/media/i2c/ds90ub953.c
> > > @@ -54,6 +54,10 @@
> > >   #define UB953_REG_CLKOUT_CTRL0			0x06
> > >   #define UB953_REG_CLKOUT_CTRL1			0x07
> > > +#define UB953_REG_I2C_CONTROL2			0x0a
> > > +#define UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT	4
> > > +#define UB953_REG_I2C_CONTROL2_BUS_SPEEDUP	BIT(1)
> > > +
> > >   #define UB953_REG_SCL_HIGH_TIME			0x0b
> > >   #define UB953_REG_SCL_LOW_TIME			0x0c
> > > @@ -1320,6 +1324,13 @@ static int ub953_hw_init(struct ub953_data *priv)
> > >   	if (ret)
> > >   		return ret;
> > > +	v = 0;
> > > +	v |= 1 << UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT;
> > 
> > BIT()? Or at least 1U <<< ...;.
> 
> It's a three-bit field, the value just happens to be 1. What's wrong with 1
> << SHIFT?

Shifting a signed value leads to the sign bit being undefined on some
architectures.

> 
> > 
> > > +	v |= UB953_REG_I2C_CONTROL2_BUS_SPEEDUP;
> > > +	ret = ub953_write(priv, UB953_REG_I2C_CONTROL2, v, NULL);
> > 
> > I'd just do this without a temporary variable. If you prefer to keep it, do
> > assign the first calculated value there first and remove the assignment to
> > zero.
> 
> I think we can do without.
> 
> > > +	if (ret)
> > > +		return ret;
> > 
> > No need for this.
> 
> No, but it keeps the code structure consistent and allows easy future/debug
> modifications.

Please still remove such redundancies.

-- 
Terveisin,

Sakari Ailus

