Return-Path: <linux-media+bounces-15427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5168B93F05A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8189C2819AE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 08:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413D413D516;
	Mon, 29 Jul 2024 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a04HCsw+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048A139D12;
	Mon, 29 Jul 2024 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722243248; cv=none; b=gpa3cfroN9oajxjx+bkZ17Wxleb58z5QzvEj3uCO4ncp+rGP6lGfWUudPcAl91jT5fkW+zVtsKcGsQElPMEpHBXwbmXN2V4xsIo3whtiV36+IV2lZhVl3iQ03GP1ke66hvly+TNl4mef/F2jDdYLNIGNrfi3ztUMoE2u+ZlnQR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722243248; c=relaxed/simple;
	bh=HtVBAWtDEH5I+MZkrhj9Sz1E0W6aztlJa5SmKJFVE5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOVNZkqBQHVSAh5DiV18VkO+cycgac4Y0acxyAgy+8plstVKUeLJqIGeDWA4Uvbdn3gHafbLIJczb0rmzHONXnE6qV/5hJtk1Wk9IM/BCWUwsaDBaRTJsx1MHNTOY5tyDSGBtIo6+JfJWeIJ3vfzvcSu1KWGmix33qhmvr51Qqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a04HCsw+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722243246; x=1753779246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HtVBAWtDEH5I+MZkrhj9Sz1E0W6aztlJa5SmKJFVE5k=;
  b=a04HCsw+IbVecNa+KWT4LxpmNRuA6ecgzfr0fBbuNnx0/+Okl/kDN4aU
   RANseGpEG4BC6ZCoAj/b/2ZawRGvjbKCdyNV7pfPQUiL01w9fh3Y+k6Wx
   AL795QCdqXn1w7SNDvp1XGlmJ3u/Qvxv9rFZvG0X8DEyFWShzgdNpYCWf
   qZ+2VulguQ/gBQWoY2YnQ3ecP2Pu61UHfGOooz4TaSC0e6qxzAPhrDY3/
   +A1ckyw49T9v3kdR/B4bqpPL1SuVgRwDhv0fAjV8zLOI0dfRjYkl8JYPM
   ZyIEeb/wtAkcaDUhS1WwWmZ0g4LuiXmIvhugvlJy3BXaLxYzQGbGqjogH
   g==;
X-CSE-ConnectionGUID: AzDoteHSRGeyOtzNdzy1FA==
X-CSE-MsgGUID: j6hKJ3OiQ9SLJAj+f8+uDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23846422"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="23846422"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 01:54:05 -0700
X-CSE-ConnectionGUID: X9Fhro2jQBa9GRDGeebyzQ==
X-CSE-MsgGUID: AjiEVMVnRhu0DiGqjCr8Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="58753781"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 01:54:04 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DB1AD11F8A8;
	Mon, 29 Jul 2024 11:54:01 +0300 (EEST)
Date: Mon, 29 Jul 2024 08:54:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	open list <linux-kernel@vger.kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH] media: imx335: Fix reset-gpio handling
Message-ID: <ZqdYqaMDWjHrNXPh@kekkonen.localdomain>
References: <20240729060535.3227-1-umang.jain@ideasonboard.com>
 <ZqdHpx7k6gzf-jSb@kekkonen.localdomain>
 <2dc31ed8-ad83-4051-8de3-6efaf1538714@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dc31ed8-ad83-4051-8de3-6efaf1538714@ideasonboard.com>

Hi Umang,

On Mon, Jul 29, 2024 at 02:19:32PM +0530, Umang Jain wrote:
> Hi Sakari
> 
> On 29/07/24 1:11 pm, Sakari Ailus wrote:
> > Hi Umang,
> > 
> > Thanks for the patch.
> > 
> > On Mon, Jul 29, 2024 at 11:35:35AM +0530, Umang Jain wrote:
> > > The imx335 reset-gpio is initialised with GPIO_OUT_LOW during probe.
> > Should it be initialised to high instead, to enable reset?
> 
> This initialization matches the physical line status, which is low in this
> case.

Documentation/driver-api/gpio/consumer.rst:

	* GPIOD_OUT_LOW to initialize the GPIO as output with a value of 0.

...

	Note that the initial value is *logical* and the physical line
	level depends on whether the line is configured active high or
	active low (see :ref:`active_low_semantics`).

-- 
Sakari Ailus

