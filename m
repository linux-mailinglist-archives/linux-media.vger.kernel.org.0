Return-Path: <linux-media+bounces-9403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B668F8A5596
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 16:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6973B2856EB
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38DB71B4F;
	Mon, 15 Apr 2024 14:51:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B51E52A
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713192662; cv=none; b=FobfSffF0rFtU/jAHYe5k+HtS5d5WPfRahbS9CvEzHcSom98MWxmA87GnjuEiaS0xpV8QPRciqbZS7DRmFl2DQI5pbzxm9yllhNKsOFrsPM75rt21/Z2Dhnf2O1n90jG5mw4B605A79Dq0aXoAvVnoYpeun51HvIt1Q63yYC3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713192662; c=relaxed/simple;
	bh=FViy2vf9oyiBlDzPB1JuRggbF7n1kNyWG01Gxvl2PZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hg1VI+3OzGvzo5iI5MEXjjtwX3SOP1qiOAHHA4qwd44sQxLpicl2Av+GD040/wB/Q4mDBaFKyB+z0tc1PHl/eI4vKukHxLWR33hlQeH8OnXDfKLLRnItYQ31KaTaBP84s7aBLSG7XZVRabiwBi5T1IncK//uy0JvoMlJLMPZ+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: ooRWowHmQBW7quTx9Iyyeg==
X-CSE-MsgGUID: W+gPHTQFTxeniPyOZi8jFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8447851"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8447851"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:51:01 -0700
X-CSE-ConnectionGUID: XF4vqvLfR3O8TwVhxs54Zg==
X-CSE-MsgGUID: 8eN5oh0+TZyGhL4iQ1/Ofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="53133969"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:50:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rwNfb-00000004RBO-3rWl;
	Mon, 15 Apr 2024 17:50:55 +0300
Date: Mon, 15 Apr 2024 17:50:55 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 13/23] media: atomisp: Drop the atomisp custom lm3554
 flash driver
Message-ID: <Zh0-z6vAoigEHtHC@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-14-hdegoede@redhat.com>
 <Zh0-fU8_iq_g5vR4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh0-fU8_iq_g5vR4@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 15, 2024 at 05:49:33PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 15, 2024 at 02:02:10PM +0200, Hans de Goede wrote:
> > Drop the atomisp custom lm3554 flash driver, support for flash drivers
> > using the custom atomisp flash interface is going to be removed from
> > the atomisp driver.
> > 
> > If flash supports for the lm3554 turns out to be necessary on some
> > atomisp devices in the future then this should be re-implemented
> > using the new include/linux/led-class-flash.h APIs.
> > 
> > The atomisp specific lm3554 driver could still be usable as a reference
> > for how to use / driver the lm3554 for a future re-implementation
> > using standardized APIs, but for that it can be retrieved from
> > the git history.
> 
> FYI: The driver is already there as drivers/leds/leds-lm355x.c.
> It might still need the binding to v4l2 subsystem, but still...

Wow, it even *was* there when AtomISP has been added:

 commit b98d13c725920e9ab7696e0d7d19c4db1bdf6737
 Author: G.Shark Jeong <gshark.jeong@gmail.com>
 Date:   Wed Sep 5 15:05:58 2012 +0800

-- 
With Best Regards,
Andy Shevchenko



