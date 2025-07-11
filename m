Return-Path: <linux-media+bounces-37482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9C3B01BF4
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30AAF3B6116
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41272298CAC;
	Fri, 11 Jul 2025 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNApxfJH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F394A24;
	Fri, 11 Jul 2025 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236820; cv=none; b=BpWvlW2ojXAJoAvvqAH16ifj3hEyHSMsXsJifKTjPO+V0Jx9ZYdlORtLj5ce1daq3+3+vHi6uyJvvZhhyR8ONNwSDt7ZQQfnCQiEKPkGtie0nil9ka6k0EnXMOxZq1jv+bR3abYcrHXkBjH9itsLRz08tBuSHFZhcZyAK0Ja5w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236820; c=relaxed/simple;
	bh=PwPblxCQiG8QR9cpfkd31MjigdRdcRoUtdKO5axKO/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP5Hld2mNlciiOzSg51OuoOU4a2ihFRldfqdv1jTHX0dUbP4oQMNODR4sPEkRTtbYrTMkvtB7wmGItT+KCodjpqR3JYVOQg/pP5suSmLY8+KJSFRxN9PD3TN8xsHxpy3Hbhvdp4ydX5N6zgp3Zegv1h5QInmWTZdMFeLVBwPss0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNApxfJH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752236820; x=1783772820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PwPblxCQiG8QR9cpfkd31MjigdRdcRoUtdKO5axKO/A=;
  b=hNApxfJHzgE6yN79GmEW259jGNCd35fWZ2QliKbnXkj+b0fnvuL+1GUQ
   epJ1QivTKie1FGipfv/UqujHlFKOzdu9zbcagBeFlDhbzHDJ1JQsgBtVn
   WxECePWaRPITlqa+nuO2EIUQX6so+ST5axRLPQ39sOQt9fqzEdTF0Ma/2
   gmLgjycUXilrKUHN7hKcmpTODj11dk6fFc1ctFiL0ps8+eeKxdmgZI4X5
   Urio1UUGblXWlta7M/n/1Kk/7bMRjCqH2eyJJTWUdxUmJBCerK7Nvnd/U
   RQ8v03GVyUfl1Uj5hf92zVODSenGjcG3L0DgR0kCaeqRQ50siMLYRwl+S
   g==;
X-CSE-ConnectionGUID: LwqWdZj/QDSK0q+i1UwLxg==
X-CSE-MsgGUID: LisvGWw4QXaqEIC8pBDPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54250651"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="54250651"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:26:59 -0700
X-CSE-ConnectionGUID: 7GL8snfGRKmGw+Qdsgi3eg==
X-CSE-MsgGUID: mrYMQaYnSiWpiu7DkY/k5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="160657843"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:26:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uaCq5-0000000EWO6-209g;
	Fri, 11 Jul 2025 15:26:53 +0300
Date: Fri, 11 Jul 2025 15:26:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v9 3/3] staging: media: atomisp: fix indentation in bh
Message-ID: <aHEDDc1CPDDwwtsH@smile.fi.intel.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
 <20250711-new_atomisp-v9-3-a9dd62425ef6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-new_atomisp-v9-3-a9dd62425ef6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 11, 2025 at 07:54:38PM +0800, LiangCheng Wang wrote:
> This patch fixes tab/space indentation issues in bh
> following kernel coding style guidelines.
> 
> No functional logic changes were made.

Since the changes are all similar, I suggest to squash all three to one patch.
I hope Hnas won't object this. The code looks good to me in all three with
the small nit-picks and Link tag usage.

-- 
With Best Regards,
Andy Shevchenko



