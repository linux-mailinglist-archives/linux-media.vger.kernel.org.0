Return-Path: <linux-media+bounces-32769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04634ABBCCE
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F0803A483C
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890EA274FCD;
	Mon, 19 May 2025 11:40:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8708269B03
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654837; cv=none; b=Ei48nTaJnth7PnmkYgZjEC7im7EQOFB1ITTs0VobjOtka3WEefyJS5XMNAfZwO0qRoGXtqKoKN9pJMvKzOA1eqt+dhNPZ47676SPixl+PrJw4OLtpsFr9UbfLt7O7nDBNSPyS8267+/ZDjL/7boOS7esjSa6SSCcAP165PzOb6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654837; c=relaxed/simple;
	bh=ZmawNIVrz/8Dn8F9jn46O6sJo/sTde6Y3rbU+jPMJE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3Oo/c02ZC+qNrpNAIgUkqdKReD5hPM1+HzUL7zGmQ7tRfFhpqR33/PCa3sAy4qiYFOw+yyYu27DbrphORwYOBMkjnS+yYzASBkZYdcLyDe7crGDe7zYlvFkYcyLS0KP/S2VYmpR8i8p+txudeewJjDKouzWqaK7NjWzQkz4sdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: cXOwYBvOSxmnQFiDNJQkEw==
X-CSE-MsgGUID: i+fr2jwyTzSUZxHXP+h8iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49480259"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49480259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:40:35 -0700
X-CSE-ConnectionGUID: OoxpXqYcR5uwDiGQcHd3lA==
X-CSE-MsgGUID: IIZxdR5ySsq6bzMCish1vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144223544"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:40:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGyr9-000000031KA-21KI;
	Mon, 19 May 2025 14:40:31 +0300
Date: Mon, 19 May 2025 14:40:31 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 12/23] media: atomisp: gc0310: Fix power on/off sleep
 times
Message-ID: <aCsYrw3TVk1bIxEK@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-13-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-13-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:40:55PM +0200, Hans de Goede wrote:
> Reduce the unnecessary long msleep(100) done on stream start to 10 ms and
> move this to gc0310_resume() so that it is also done on the initial
> power-up done by gc0310_detect(), which should fix gc0310_detect()
> sometimes failing.
> 
> While at it switch the sleeps from msleep() / usleep_range() to fsleep().

...

> +	fsleep(10000);

> +	fsleep(10000);

> +	fsleep(10000);

fsleep(10 * USEC_PER_MSEC) ?

This way it helps to get immediately that we want 10ms sleep.

-- 
With Best Regards,
Andy Shevchenko



