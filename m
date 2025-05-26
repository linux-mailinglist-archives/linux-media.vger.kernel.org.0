Return-Path: <linux-media+bounces-33353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0C2AC3B05
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 10:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD30A3A6146
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE021E1DE2;
	Mon, 26 May 2025 07:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmlXhR5O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F47A1D86F2;
	Mon, 26 May 2025 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246393; cv=none; b=as3OcZNFl+g7dCOseDV1HhL4L57Ixm/tMSzD0tjSM3NUu0RRZcJ/ZyNCypml5dknSrZI4i06eIVSxnF/TW/iIFdV9OqqH0LRhnxRZyrsdNbsT1ltkT0mhFSW4KDIjSvMCpEfj7ugKwPFav9rYVyWofBh5IL3wW6JeJg4KSi0j8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246393; c=relaxed/simple;
	bh=lUJabraH+umfXqZ+TEDjGiBZ/4W1YWpIBsX4q0UA45M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glCJ7OhKxliCxg9JG+PmZos1JQyrObndvGYI221RTwSaoTyu2YzVtbK+HpglaqP6+TnZTY3nizh6Qb0y+33MPZGQnaZX+inN5cDJE4/qnRziYgvT0odbd5FUxOVpM2qiqLCiODI5pali3xtGGb2Q/SrZKjuaeuxW7jOIwurhbKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmlXhR5O; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748246392; x=1779782392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lUJabraH+umfXqZ+TEDjGiBZ/4W1YWpIBsX4q0UA45M=;
  b=mmlXhR5OPOM3253qIOyP3kvRXJvw8MyUwNjt1MPMSlrY0WIQPKYofrYS
   80C+OthObxaaxEIoLkSnv6v1Yciuh5/D8tcDKY4kHNUmTyHK1IKHLPEUa
   8BQi+hz90D+L6bU69n9OWInTzYm785K4NVhuolONwwLz5vjYjXliQY2yu
   bAqSmSe2ddAjDPD9jVhCnA2c28QZoQlNDHcCsGjvEdTXxpw4WzVOKm+Bu
   VsrDTZkpmXkermtoMjUo0t+8co2amP/6AtjYxT5eRWPxdUYmjnncXV3G7
   O0oD5sTqdvukfZeQY/IInFFzQQ//en9VDsNpORBZEFy6RIm0otgXlolFV
   w==;
X-CSE-ConnectionGUID: jOVa+kgLQ1izzwA/l005uw==
X-CSE-MsgGUID: oqGbZOcDTQiWry0MIe+1Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="75604407"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="75604407"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 00:59:51 -0700
X-CSE-ConnectionGUID: njG0Di+JRbK2Mei9scI/0w==
X-CSE-MsgGUID: E9FON2noQ/qU5pueYxmkdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142643089"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 00:59:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8D0FC11F738;
	Mon, 26 May 2025 10:59:46 +0300 (EEST)
Date: Mon, 26 May 2025 07:59:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, tomm.merciai@gmail.com,
	martin.hecht@avnet.eu, michael.roeder@avnet.eu
Subject: Re: [PATCH v3] MAINTAINERS: Update my email address to gmail.com
Message-ID: <aDQfcnIzJDLcK-U-@kekkonen.localdomain>
References: <20250515145150.1419247-2-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515145150.1419247-2-mhecht73@gmail.com>

Hi Martin,

On Thu, May 15, 2025 at 04:51:50PM +0200, Martin Hecht wrote:
> Replace my corporate email address by @gmail.com.
> 
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>

I've picked this patch but do the other instances also need updating?

-- 
Sakari Ailus

