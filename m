Return-Path: <linux-media+bounces-38005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA3B08D1B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6795A3BC057
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913522D46B3;
	Thu, 17 Jul 2025 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NA6MKTWF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710C2C17B4;
	Thu, 17 Jul 2025 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755834; cv=none; b=WKYu5aX7hXEoVy8Wv+FCnbGfFUehI/v1r9j1CuWLALaBoVwxHjx5IuYn39LeZ6t2B//KprKrDAItwhdQOGIv0cxpqt4xL79OceURFqTZK7GlfpsQePR2KXAnzVao3FZkvy046gJD4sXoLvQDpQbUtOjVaA8ulLf/J0nUBzSuRxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755834; c=relaxed/simple;
	bh=q6OlBUDuVsfygeY0tYb2ASXQcxuOHlFVK01o86c9Ah0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHAiG7uo1ij9QfcXdhK80uSU3pHZgvvk7jEjQleYyQID5h7NgLGyP+Od3o4JwSzcm69l7EnJenHU2HUlESuPAQrZkBE7U5T6wHvcp0ZXt2eu+NWndpD1qQZJq/HW/fLXwQF4TeGzmL/Ex9k498xy61BdQZqSHNAtyZJPi4foTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NA6MKTWF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752755832; x=1784291832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q6OlBUDuVsfygeY0tYb2ASXQcxuOHlFVK01o86c9Ah0=;
  b=NA6MKTWFzeCGMNHCEIeAumkAWvDbHfn6JxrHGUQsUZltOvak280TKJPA
   L70+k08cV4WUf5UXenuWBEQMBx/TqU+qHIWEaB1xQwauP//p/si+zOqsC
   rpsXRC0RtoEpmtO57ctKqXtMfTZkNRvk3aHsTJMoWiPX7v+AIxM7ePKiT
   eKIg1k534iAMb/ye7pZkymneeMdGkUuwBIsIQxYy81eYmQ2XYhsZ/AekI
   vy0SGabSlZDVzTNsp0RLr2Xl31HHD+oEjRY7I79gbUS6M1s13SNLR6dOM
   rFLnu5c8cacgY2hf1qT4t/VyVgZXYRcjwEiqR6YuiQkq5FNLvyF4QKHUc
   Q==;
X-CSE-ConnectionGUID: hBtETDJUQTmpoGjaZOog7Q==
X-CSE-MsgGUID: hesVyZiXSr2s1irgbzC+pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65287731"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="65287731"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 05:37:11 -0700
X-CSE-ConnectionGUID: b/g5b8dvT4a/3YrLCEJvBQ==
X-CSE-MsgGUID: mgLCb2elRau0EXs++y+oVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="162074429"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 05:37:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ucNrB-0000000GEkT-1bFt;
	Thu, 17 Jul 2025 15:37:01 +0300
Date: Thu, 17 Jul 2025 15:37:01 +0300
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
Message-ID: <aHjubei5Aex9n-HI@smile.fi.intel.com>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-3-hardevsinh.palaniya@siliconsignals.io>
 <aHe7NFJz6aCUqZXL@smile.fi.intel.com>
 <PN3P287MB351951A3DBA4FA85404DA410FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB351951A3DBA4FA85404DA410FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 17, 2025 at 07:26:49AM +0000, Hardevsinh Palaniya wrote:
> > On Wed, Jul 16, 2025 at 07:14:17PM +0530, Hardevsinh Palaniya wrote:

...

> > > +static int ov2735_page_access(struct ov2735 *ov2735,
> > > +                           u32 reg, void *val, int *err, bool is_read)
> > > +{
> > > +     u8 page = (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;
> > > +     u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> > > +     int ret = 0;
> > > +
> > > +     if (err && *err)
> > > +             return *err;
> > > +
> > > +     mutex_lock(&ov2735->page_lock);
> > > +
> > > +     /* Perform page access before read/write */
> > > +     if (ov2735->current_page != page) {
> > > +             ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, page, &ret);
> > > +             if (ret)
> > > +                     goto err_mutex_unlock;
> > > +             ov2735->current_page = page;
> > > +     }
> > > +
> > > +     if (is_read)
> > > +             ret = cci_read(ov2735->cci, addr, (u64 *)val, err);
> > > +     else
> > > +             ret = cci_write(ov2735->cci, addr, *(u64 *)val, err);
> > > +
> > > +err_mutex_unlock:
> > 
> > > +     if (ret && err)
> > 
> > Why do you need to check for ret != 0?
> 
> To prevents overwriting *err with 0 on successful operations, which could 
> obscure previous errors. 

Can you elaborate a bit how the *err is not 0 at this point
(assuming err != NULL)?

-- 
With Best Regards,
Andy Shevchenko



