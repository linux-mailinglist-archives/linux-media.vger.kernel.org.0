Return-Path: <linux-media+bounces-22747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A79E5EEA
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 20:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3564A16CCE1
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 19:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1335822E417;
	Thu,  5 Dec 2024 19:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blw10fmk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD55C22E3F9;
	Thu,  5 Dec 2024 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427392; cv=none; b=ak0Kg+WhiSYc7OEbHxt6bJC5uPKMrnV1mhEvA5oKR6/ZCy90IcNkUxCMUSjXIBTbWA2XaWtFi3wE3fINEdeRcBTXYGNvrMerpb5f8oYW3F6GZGW6day7RXKyv6qI6/0QHJPHggWW4VW6OWvfqOygvx/rN477Rd5Fc/xPXAIkYGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427392; c=relaxed/simple;
	bh=wXnxGThlXwL4EGI0usWq5ydYnyQshKqw0ps6/HMOt54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QeSrXUytyod8Wv7JwIWOAN062OwNsI2A1oIsIcrUmF3wfbKJMZuYf75NdNEdp0T/nLKmlzgmRgd1H+1u3PCoqLVjaUH++rRvJOFAl8fTyMRKu1zL5zv5Y7SLLmTxas0vAYZbEF1NbSef0WTKIM14qpcZXLo6dC2s8VttMzX4NZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blw10fmk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733427391; x=1764963391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wXnxGThlXwL4EGI0usWq5ydYnyQshKqw0ps6/HMOt54=;
  b=blw10fmkC7SGgk/cvxelz3ykoW8oZYzD31lAr+iySjX2ZRFwJW3UrVGe
   4r9mIUzDrLzuJeHXFmItfGyGQDRf4dqFzOKToA8o3ueeE1/Pj/ZgEltyY
   /YYrElsyzbkONeeOhkZQN2QM46hH7Wesx6VDHrEUqqgz6Lvbswc2KN2JR
   He9X8bNH9YXO3DZf4uX1XvxhCvfgZQM+r1VkbCe3bd2lKok1SRGVMZWGF
   mppNOtvz10JIMuhpv7Rm68C5eZliwjoy3Wts9XdME3cpON1Xb8EkqKIHo
   C62UOZ/GiyrDG6DYzn3T4wbnk1wsU3/EgnR0+bTVw6QxTrG6aCWmki00s
   g==;
X-CSE-ConnectionGUID: Y4I/5UHFTaqAHcf5HnIUUg==
X-CSE-MsgGUID: HrIZs/0lTsWQqm3SgYXF4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33897926"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="33897926"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 11:36:30 -0800
X-CSE-ConnectionGUID: ATiA+V0HQfCjY9+AfMKUtg==
X-CSE-MsgGUID: l2hA2LkJQG6CmYhJe/5dhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="125021172"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 11:36:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJHeD-00000004BhA-3eta;
	Thu, 05 Dec 2024 21:36:25 +0200
Date: Thu, 5 Dec 2024 21:36:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/15] media: i2c: ds90ub960: Add support for I2C_RX_ID
Message-ID: <Z1IAucwlR031EW1y@smile.fi.intel.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <20241204-ub9xx-fixes-v3-7-a933c109b323@ideasonboard.com>
 <Z1Fk7jRVQJZzsTQp@smile.fi.intel.com>
 <fa3405ce-a9f4-402d-b29c-d900858df974@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa3405ce-a9f4-402d-b29c-d900858df974@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 05, 2024 at 03:59:58PM +0200, Tomi Valkeinen wrote:
> On 05/12/2024 10:31, Andy Shevchenko wrote:
> > On Wed, Dec 04, 2024 at 01:05:21PM +0200, Tomi Valkeinen wrote:

...

> > >   #define MHZ(v) ((u32)((v) * 1000000U))
> > 
> > Missed HZ_PER_MHZ from previous patch?
> 
> Yes, and no. I did leave the MHZ uses on purpose. I think the use of
> HZ_PER_MHZ was fine in the calculations, but when having table-ish use of
> MHZ, with hardcoded numbers, I found the MHZ() macro much nicer to read:
> 
> 	case MHZ(1200):
> 
> vs.
> 	case 1200 * HZ_PER_MHZ:

Had I talked about tables? :-)
I was only commented the calculations.

-- 
With Best Regards,
Andy Shevchenko



