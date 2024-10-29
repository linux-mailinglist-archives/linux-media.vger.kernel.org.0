Return-Path: <linux-media+bounces-20479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFEA9B4281
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 07:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C552828377D
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 06:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADF3201260;
	Tue, 29 Oct 2024 06:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eb82Xyp6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD0DDBE;
	Tue, 29 Oct 2024 06:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184172; cv=none; b=mQrNbhyV7tkFAJ7MP8BoHf4Y5s2fbUq1+nIUrwHasfnpgsE+VNxA9vtG/3K6KkBZwrIqAal1UEvt07aHsoldcCL/eH0qSTb6yndrtkyQsxDbKe2eWCIwpi+QnCJ+36hYz5xtqLUxIsAvRl4vSE4cAF+oVF+IS2B7NvutyIvuGDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184172; c=relaxed/simple;
	bh=mcfxO2DreSfqWmbcfpBE+IzAG4t4aFmUKargdh8nYq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDZQZIWu/63G2SY6V8V0kk7MCo8v5tWz2LKk85DGegoGd0zvYSaVSdvl+GL7ipBIUU63UTpKlNM2OnkiOnCLYHM/EjNOh+jCGVl6GlcmUVA+b48xRqMh7c3BSSOF7Jc7Ehcw/IAW8a9rm5epNS6pvJ/N2VLqLWAs72GLLJQx5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eb82Xyp6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730184170; x=1761720170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mcfxO2DreSfqWmbcfpBE+IzAG4t4aFmUKargdh8nYq8=;
  b=Eb82Xyp6OYzVTzFNVzQDpgGBeHLB94Td/wVqFNDsuqsYbqTYQxAb8HpU
   NS7C4LgJgM2wTaJbPgGDmc0d0h91hM1Q4ZDeBuoq55FNWxaEqmANQH06z
   jXVWbLkF4nJYPG3++MQFFb25fjlee2NRTeORBsqpsSwAEN3IgeZuBdafo
   4lqz7/HIkxIFvJjdkqlMp/hqIEgWuyOV/AsrL0v//3nd6CMBVvmITAWCT
   NYLRJAiXs//0py27ajU1bO36CxM0tTcOIhYJ5IXwZjod+S7s5Y0rPSdDD
   a7SutdR9x+2B4Ie4v8/INFz+0rQRXVDrIjrRNGK+YSZ6/1satcyR/ox4I
   w==;
X-CSE-ConnectionGUID: u9mCB850RKCi1UZEOsHA8Q==
X-CSE-MsgGUID: ulLxCktXR2ifMHc7p2xsSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40424907"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40424907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 23:42:49 -0700
X-CSE-ConnectionGUID: WMoSkcIhTCyGcVjoNQKsrA==
X-CSE-MsgGUID: HUtW+nA/R1yAGi+wKNZ41w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82274412"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 23:42:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5B62811F91A;
	Tue, 29 Oct 2024 08:42:44 +0200 (EET)
Date: Tue, 29 Oct 2024 06:42:44 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Refactor events
Message-ID: <ZyCD5O7BjtvPbFw-@kekkonen.localdomain>
References: <20241020163534.1720297-1-tomm.merciai@gmail.com>
 <20241020164354.GG7770@pendragon.ideasonboard.com>
 <ZxX2SVl/p0i7Nemi@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241021073034.GC14328@pendragon.ideasonboard.com>
 <Zx/KsKBtVBWfziXo@tom-desktop>
 <20241028183657.GE26852@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028183657.GE26852@pendragon.ideasonboard.com>

On Mon, Oct 28, 2024 at 08:36:57PM +0200, Laurent Pinchart wrote:
> > > What I meant is looking at the I2C sensor drivers that currently
> > > 
> > > - call v4l2_subdev_init_finalize()
> > > - set V4L2_SUBDEV_FL_HAS_EVENTS
> > > - set the .subscribe_event() and .unsubscribe_event() handlers
> > > 
> > > and dropping the flag and handlers from them. Is that what you plan to
> > > work on ?
> > 
> > It's ok for you per/driver patch or you prefer a big single patch?
> 
> I'm fine either way. Maybe one large patch to address all the drivers
> where the flag and handlers are simply dropped, and then one patch per
> driver where changes are larger (such as adding calls to
> v4l2_subdev_init_finalize()) ?

Sounds good to me.

-- 
Sakari Ailus

