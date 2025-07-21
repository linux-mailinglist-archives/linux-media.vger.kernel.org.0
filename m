Return-Path: <linux-media+bounces-38191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E27A3B0C997
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 19:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C37917484A
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE1A2E0908;
	Mon, 21 Jul 2025 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRc9+Xpx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F52DEA81;
	Mon, 21 Jul 2025 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753118524; cv=none; b=QDGW7yTdDp0ymCTa9ZUZfG2DiqhxPCDVcDQnhiEYNyxRY6B8Nd+eEk1yBGaaSapeOWHxZy6ae3lpEjCOFQ3qnOzZIbRSV7R5l4Hc16W+MWvXKyMVM9yU7tgrv6YpyMtwsGUOb8q3Roj+BuveS+JSn/ooL6eDqQn06ntAG9RMhBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753118524; c=relaxed/simple;
	bh=19QnsmtMaBJp/ZLnLTtT9839sTSAbE07uxa6iOYsNMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seJNKbxmmW3Gg+X45H5kLiegsEGc4EKP53SaReyB7eAoMUqWLsfBVmINXG40nAucYfVrwIjuGQuaJbCFIZ+emkuIWmgEw0wIjRqa5jrB/4JHYcIxe3ZgqQ/paK7pS873JCA5HOc+7MxfCnmG7BuSfWHsLmwllLgWfb+w1GKLKBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRc9+Xpx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753118523; x=1784654523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=19QnsmtMaBJp/ZLnLTtT9839sTSAbE07uxa6iOYsNMQ=;
  b=LRc9+XpxI2hP+C1C8fgJAU4a/79h2AmugPTeAMT8okxyZtoiZN+mzemX
   xORNfdutjA/Nr97pZZ+ceDzXfFHbNNSm6nKbPWo1seLYHE5T2RUwl/yh6
   lYKIysGwf/j+y+Oat0v6ID9E/XkJioRZsczv0EAIF60C1VK3NtP07vSBy
   c8HvVeA7L+8wZy7j+BN4Yj3ayY5pFfwABBwG0HabircZN66No7zcU/Q8n
   EobLVm/kTnFT1o87bcQEacVpgGiF4GWMC/DCbeVksDOB6wsR7CaFxT+5x
   6tgn2WqQhlXHhVJf4w6B2mYm0VsX4h21+8WRqc4XWDrXBOv6I7x8SV/ib
   A==;
X-CSE-ConnectionGUID: rCid1t7ORtukg5YQfZ3JhA==
X-CSE-MsgGUID: 8TYuxRsETnSuTf+D6l4mNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55435195"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55435195"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 10:22:02 -0700
X-CSE-ConnectionGUID: pU2NcPsoToq9C/4WY93oBg==
X-CSE-MsgGUID: 5J6kS8FAT4uXfvx9Nyvhiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="163451965"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 10:21:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uduD1-0000000HOPq-47vg;
	Mon, 21 Jul 2025 20:21:51 +0300
Date: Mon, 21 Jul 2025 20:21:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aH53L948F7m16eHZ@smile.fi.intel.com>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-3-hardevsinh.palaniya@siliconsignals.io>
 <aHe7NFJz6aCUqZXL@smile.fi.intel.com>
 <PN3P287MB351951A3DBA4FA85404DA410FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <aHjubei5Aex9n-HI@smile.fi.intel.com>
 <PN3P287MB35199EB9309448F3EDD43402FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB35199EB9309448F3EDD43402FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 17, 2025 at 01:11:53PM +0000, Hardevsinh Palaniya wrote:
> > On Thu, Jul 17, 2025 at 07:26:49AM +0000, Hardevsinh Palaniya wrote:
> > > > On Wed, Jul 16, 2025 at 07:14:17PM +0530, Hardevsinh Palaniya wrote:

...

> > > > > +static int ov2735_page_access(struct ov2735 *ov2735,
> > > > > +                           u32 reg, void *val, int *err, bool is_read)
> > > > > +{
> > > > > +     u8 page = (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;
> > > > > +     u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> > > > > +     int ret = 0;

> > > > > +     if (err && *err)
> > > > > +             return *err;

^^^ (1)

> > > > > +     mutex_lock(&ov2735->page_lock);
> > > > > +
> > > > > +     /* Perform page access before read/write */
> > > > > +     if (ov2735->current_page != page) {
> > > > > +             ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, page, &ret);
> > > > > +             if (ret)
> > > > > +                     goto err_mutex_unlock;
> > > > > +             ov2735->current_page = page;
> > > > > +     }
> > > > > +
> > > > > +     if (is_read)
> > > > > +             ret = cci_read(ov2735->cci, addr, (u64 *)val, err);
> > > > > +     else
> > > > > +             ret = cci_write(ov2735->cci, addr, *(u64 *)val, err);
> > > > > +
> > > > > +err_mutex_unlock:
> > > >
> > > > > +     if (ret && err)
> > > >
> > > > Why do you need to check for ret != 0?
> > >
> > > To prevents overwriting *err with 0 on successful operations, which could
> > > obscure previous errors.
> > 
> > Can you elaborate a bit how the *err is not 0 at this point
> > (assuming err != NULL)?
> 
> A previous operation have already failed and stored a non-
> zero error code in *err.

Right and this function is no-op already for this case.

> Assuming this function is used in a sequence of write (or read) 
> operations. If the current operation succeeds (i.e., ret == 0) and we 
> unconditionally write *err = ret, we would overwrite the 
> existing error with 0, falsely indicating that all operations 
> were successful.

I don't see this scenario. I see that we apply *err = 0 when *err == 0 already.

> Therefore, the condition if (ret && err) ensures that we only 
> update *err when there's a new error, preserving any previously 
> recorded failures.
> 
> Let me know if you have a different suggestion for how this should 
> be handled.

Have you taken into account 1) above?

-- 
With Best Regards,
Andy Shevchenko



