Return-Path: <linux-media+bounces-26819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8DA41EDA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A063AEC2B
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322EA219300;
	Mon, 24 Feb 2025 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3Fp8gjJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B771A3174;
	Mon, 24 Feb 2025 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399595; cv=none; b=l9zTi87xNkxxwiUuBesRu7lwXzyj6bEK1ekWI0NDg8EXjNSlp4BmgRpXHwENH+t3CpzcFhjnODnbbKk6YbUj56V5cZCc1nkTRwYZdhCZQK2wlvIdx3TOSnFoinKPhz3Z71ViFSKgt6GTRA/HssUqg4beY2bJcb2fLEvFACIbKAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399595; c=relaxed/simple;
	bh=6BmGyMMS27SVlVYPnXA5Rl27H1w216df0y02GFQxmHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UF4Wt7MO0n5dtePzadPTJT1UMQkAE3ncXjECZbHGruyQTHswah8AZRYex7gZUzsisWMDBxzfy+a3jhKeO692brCeh4YCGTlQgPrx/KP62RI2vnq9YS1XMyMZqs3iB3ZCqTswLEblj0HhLbLbl4Oxph1e7zgxu6XPswDyUeNIy+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3Fp8gjJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740399594; x=1771935594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6BmGyMMS27SVlVYPnXA5Rl27H1w216df0y02GFQxmHg=;
  b=I3Fp8gjJySrOhQFDCYJOEaY8xsqLHJA561YXy+HYKcK+I7Va4X8orfJQ
   xz4cUQGNiei2qUOMnCTAgSqlY2TwyZJL/VXpp/pmMzicAsk3qFng1dr6T
   e0xRrxuPVTPyWFvh2gG2dyLkNYqqKWXq9khioKyDIKFepm+dqHge2t3AV
   WV7bvDByIFpvfU4upqzfjdO9BmKf9WthN4PvbVMKWF8HpPE8PtfBVwFlA
   fTA/+/epI9oKILO2mdE+qO2OzrImhHfWmjHmfCYschwRZip2b/1G+bjSg
   In6WonwAcj1pJ5ztkOZAmlfPNUAX/ifQUyZKl4hdW2TgPJPP6KvkRQa9o
   g==;
X-CSE-ConnectionGUID: NTVB2L39QyuoQkhqi0UObQ==
X-CSE-MsgGUID: TL2nCt+0QnC/RhPhoeJjlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40338503"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="40338503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:19:53 -0800
X-CSE-ConnectionGUID: WFFN2HW+SBuJndhyZd7bOg==
X-CSE-MsgGUID: MR/s5Z0XSEas4p1OJ4fgNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="120954994"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:19:52 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 45BB411F944;
	Mon, 24 Feb 2025 14:19:48 +0200 (EET)
Date: Mon, 24 Feb 2025 12:19:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shravan.Chippa@microchip.com
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com,
	Praveen.Kumar@microchip.com
Subject: Re: [PATCH V4] media: i2c: imx334: Add support for 1280x720 &
 640x480 resolutions
Message-ID: <Z7xj5JJe27L39wCG@kekkonen.localdomain>
References: <20250218093356.3608409-1-shravan.chippa@microchip.com>
 <Z7cr8x6i8NZbdjIQ@kekkonen.localdomain>
 <PH0PR11MB5611074F959638A90A7160E381C02@PH0PR11MB5611.namprd11.prod.outlook.com>
 <Z7xCY2c8AvdgFNfm@kekkonen.localdomain>
 <PH0PR11MB561150AEB8471B346304FBDF81C02@PH0PR11MB5611.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB561150AEB8471B346304FBDF81C02@PH0PR11MB5611.namprd11.prod.outlook.com>

Hi Shravan,

On Mon, Feb 24, 2025 at 11:07:58AM +0000, Shravan.Chippa@microchip.com wrote:
> > > > Please split this into two to make it more reviewable: splitting
> > > > register lists into two and then to adding new modes.
> > >
> > > I will try to make one patch for common register values One more patch
> > > for new modes of 640x480 and 1280x720
> > 
> > Please add one for the hblank changes and more if there are similar cases.
> 
> Date sheet is not clear to me to understand the horizontal blank change value dynamically.
> And do not have proper equipment (hardware) to measure horizontal blank values by change the register values.

Ok, fair enough. Maybe it'd be better to leave it as-is if there's no need
to change it? Many Omnivision sensors use some other, non-line/pixel based
unit for blankings indeed.

-- 
Regards,

Sakari Ailus

