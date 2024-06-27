Return-Path: <linux-media+bounces-14226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A17D919FB2
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 08:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A55681F26846
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 06:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D629E446DE;
	Thu, 27 Jun 2024 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmeFPXXu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC554436C
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 06:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471490; cv=none; b=G+8ElPNZ1dA9ooM1JXfEE16uYNGBGCqHV0qlMYGZyax5MsNbAIIG6JRMLJNrQx7h09hxGmm8fQgLpCvSr0EjH6U7hvoEw5k5z2sqm2QViYDlWz+6OyxE8BmUwqDy1GtFS9p+emTyXCXNVbBI/4nwp1DhHN8IVGT+8xAg85KNpSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471490; c=relaxed/simple;
	bh=1mo0f2zzgFgi5gIJqfh3ehgjJ0FRzCPeEa+6YkrWqvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAu+/VfNWiO4jGgKcmCJ87H0dmpEYY4dZkLGRN13cdySpyqBOS6TlUntqym05I+LgyjQGrcRwota1q3XQIZsaS4lCZBFvLwNHoYv4FlZavfjWWDRO11csLAhoRbK7GiKvxriimIAOkJm3c5IGhRaek+jyWuZTfwMyb44SuHuaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmeFPXXu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719471489; x=1751007489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1mo0f2zzgFgi5gIJqfh3ehgjJ0FRzCPeEa+6YkrWqvQ=;
  b=hmeFPXXu1yHH5m9I9GRrpKo/TZpN4mauvtZWIWc5k6B+GKoP2QPCko5/
   0s64UdVswkMpUDR+gLgj9zXZvkA4+IYpjkxqGcToIWPskGDAjBvINHZ4Y
   dNyED/+EZR14XzSpOYEkiwSanwcVvn+KKobjWJw4hwjOC9BLnb892i8u4
   UCfCdkqwk5hRHbHWCaub9TKQm7pgViW2DmVJhl+mYdd+f7ZTS9w+aJbuh
   ZTs2kd2vbzPcVXy8NILDh5eanQ9gTD9la7vwg6JFptyByX5gszBCYhnrE
   8ppxbc/3hH1TIy09nHisgGzSRu4JwCk9CeDh+1lL4qMwAthOtclO+0vg8
   A==;
X-CSE-ConnectionGUID: iUqv0A9gR/CXkmqzOdHX3g==
X-CSE-MsgGUID: 8u7fMa4nT82RJXhgFrVOYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34032871"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="34032871"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 23:58:08 -0700
X-CSE-ConnectionGUID: GSnQIUpvRNazHWKw/1ApEA==
X-CSE-MsgGUID: antbG8AxRZOeJ6bTpv1WzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="49241129"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 23:58:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CA7F411F965;
	Thu, 27 Jun 2024 09:58:03 +0300 (EEST)
Date: Thu, 27 Jun 2024 06:58:03 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 10/26] media: mc: Clear minor number reservation at
 unregistration time
Message-ID: <Zn0NezVBinBib84r@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-11-sakari.ailus@linux.intel.com>
 <32455d69-1bb0-4318-a2b6-92335ed0b7cc@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32455d69-1bb0-4318-a2b6-92335ed0b7cc@xs4all.nl>

Hi Hans,

On Thu, Jun 27, 2024 at 08:43:47AM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > Clear the media device's minor number reservation at unregister time as
> > there's no need to keep it reserved for longer. This makes it possible to
> > reserve the same minor right after unregistration.
> 
> Have you tested this?

By unbinding and re-binding a device while file handles to the old Media
device one are still around.

> 
> I'm not certain whether this won't cause kobject errors. If an app has the
> media device open when the device is unbound, then the old device node still
> is around until the application closes the fh. I'm not sure if you can create
> a new device node with the same minor while an old device node with the same
> minor is still around.

I added the patch based on Laurent's comments
<URL:https://lore.kernel.org/linux-media/20240207100810.GG23702@pendragon.ideasonboard.com/>.

> 
> V4L2 and CEC definitely both keep the old minor until the last user has gone.

-- 
Kind regards,

Sakari Ailus

