Return-Path: <linux-media+bounces-23418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB79F2049
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 19:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B05E7A06DE
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 18:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E695F1A76B5;
	Sat, 14 Dec 2024 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEgnwbDB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A99EBE;
	Sat, 14 Dec 2024 18:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734200688; cv=none; b=dcP2gI6FOYvd+vZmnPhYgu4DFoqoTuJIaR8hWYgG5+lC9aZsTHaxowUAn1Q9Zhmv/z8N36gwGuL0iYoWO3mbj0tYN4pARlScEa9rHwkUEZwK3EC9RY9/GHF2Ilvq1PbQtrKwtjsif7lKuTwG5LSTzCU35kmHB/R6WQ6mrXk89bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734200688; c=relaxed/simple;
	bh=rkwGtrWDCdbAeKieQRFgAUPsVjiN+kA5BqHtRH2QCjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPBJC1R0X57EhUcQk17F1tZYHnx/kfTH0nmHIVPjL87HPqxda2kNpdD9KM8mzNlT3G4tpRqT0WGJ99XTLKRwoDUc4AGywqke5okY8/Mlrae7bZ0Dw24tOC5TeSYIHtjgnYmE2VIJDb+Jd+M/xtvtaaKbGTV5ufRm1wOxznkCvyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEgnwbDB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734200686; x=1765736686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rkwGtrWDCdbAeKieQRFgAUPsVjiN+kA5BqHtRH2QCjM=;
  b=NEgnwbDBeY6bRhjRdqa4ap/h7EXJhIzNAH0neR8bZEHDNLP76tnJS2K2
   yNbN/Z1fI9pGhOsM93R+yIMIOCBrVaaWcclGw+djxrY6PtHvPGsnIrp5S
   lvbJOH3/VJhV5wrXtiooIBXAyfErFQlaRGLl2c3ddT6D32UHVWns1HY6U
   2Q/qOXtD0fv3dhD4EwQZqC5m/q7m55h352+JBYXNJicH/7GGabpRUeZUI
   QbgB1LWG7DQ/FWE9c/Lu767MTpJg+VPQ6TDSJhDEEUPL/loIyagM+f493
   YK9P8oeVcacP+ujrSoKiJalxy1AqloMgIb9CgDWMbWh6v/iW2PqmeUkK3
   g==;
X-CSE-ConnectionGUID: R8hbgOxKTwqYcqFbcf7ZSw==
X-CSE-MsgGUID: E+tdDXHKT4+8SgWzulp43g==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46028473"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46028473"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 10:24:46 -0800
X-CSE-ConnectionGUID: czWEcPrpRoq7LPrU2O+scQ==
X-CSE-MsgGUID: rwUZy1B4QMuZgJ2nVitDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134166558"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 10:24:42 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5934611FA2A;
	Sat, 14 Dec 2024 20:24:39 +0200 (EET)
Date: Sat, 14 Dec 2024 18:24:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
	monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
	stable@kernel.org, Sam Bobrowicz <sam@elite-embedded.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	"open list:V4L2 CAMERA SENSOR DRIVERS" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] media: ov5640: fix get_light_freq on auto
Message-ID: <Z13NZ0lTeTecuC57@kekkonen.localdomain>
References: <2e79be9185cbb0dbe40e670eee996cf290bab0a6.1732264079.git.michal.simek@amd.com>
 <Z1v2VRzgUVpHZvXR@kekkonen.localdomain>
 <05ce02de-6eed-4f28-8052-56ca9cac4b64@amd.com>
 <2024121303-arrange-hydration-7cf4@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024121303-arrange-hydration-7cf4@gregkh>

Hi Greg,

On Fri, Dec 13, 2024 at 12:12:18PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Dec 13, 2024 at 11:30:38AM +0100, Michal Simek wrote:
> > Hi Ailus, +Greg
> > 
> > On 12/13/24 09:54, Sakari Ailus wrote:
> > > Hi Michal,
> > > 
> > > Thanks for the patch.
> > > 
> > > On Fri, Nov 22, 2024 at 09:28:01AM +0100, Michal Simek wrote:
> > > > From: Sam Bobrowicz <sam@elite-embedded.com>
> > > > 
> > > > Light frequency was not properly returned when in auto
> > > > mode and the detected frequency was 60Hz.
> > > > 
> > > > Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> > > > Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
> > > > Signed-off-by: Michal Simek <michal.simek@amd.com>
> > > > Cc: <stable@kernel.org>
> 
> That address is totally acceptable.

The documentation (Documentation/process/stable-kernel-rules.rst) tells to
use stable@vger.kernel.org nevertheless (we're not discussing the latter
option here):

To have a patch you submit for mainline inclusion later automatically picked up
for stable trees, add this tag in the sign-off area::

  Cc: stable@vger.kernel.org

Use ``Cc: stable@kernel.org`` instead when fixing unpublished vulnerabilities:
it reduces the chance of accidentally exposing the fix to the public by way of
'git send-email', as mails sent to that address are not delivered anywhere.

> 
> > > Cc: stable@vger.kernel.org
> > > 
> > > And right after the Fixes: tag.
> > > 
> > > I fixed it this time.
> 
> Neither is required at all.

Right, I must have confused this with Reported-by: and Closes:.

> 
> > Thanks for this. I was trying to find out if this is described anywhere
> > because in stable tree both ways are used. Also Greg's script didn't report
> > any issue with it. Is it a rule for media tree or your rule or described
> > somewhere?
> 
> It's not a rule anywhere, and the use of stable@kernel.org is also
> documented (it routes to /dev/null and can be used just to tag stuff, no
> one is going to answer that email at all.)
> 
> > I have no problem with that rule but just want to understand where this
> > request is coming from.
> 
> No idea, I have no such rule, and in fact I use stable@kernel.org all
> the time for my subsystems.
> 
> thanks,
> 
> greg k-h

-- 
Regards,

Sakari Ailus

