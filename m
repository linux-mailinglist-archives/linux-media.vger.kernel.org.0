Return-Path: <linux-media+bounces-32771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63507ABBCDF
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C6E97A409E
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC5C2750FA;
	Mon, 19 May 2025 11:44:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A04275112
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655065; cv=none; b=NutH7LQbp1Eu96EGmuAsos7LBI7XucfS/mJ3d0XF4WEayVl83D/8NlGHVccFYfg9USV6S5Nal4XQ6Sonjgj14dUVVW7EknX0bjXrLK3t9RWCqL3HQEUjzfZ0bZTsZkgGwKrcKkbiylHrydBlI40c6Ui+iVbwfhykfhhmiAyeTrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655065; c=relaxed/simple;
	bh=L/SrPQXmwBivskgeVW69UuD0jXMmA4aDy5Tx2qNPU84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CL6HTEM7bcrF9/wDednRuO+cBwJ9vlrLg8UQG/Ex18ajqG5OwBg2rSffgspAuriKJcpL8LnZK0xGzxdjHGbRyFmtp2AFawEyRcBXPsrq22YEpH/Z6ZPLNsq3h0FMSe4fjtugmHLmSdpifrvoxDYgPZk4Rl4OCxDMLVxLKt3smtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: lxaqkQ7yQPW49c/+oecWDw==
X-CSE-MsgGUID: UWgnhIvCT3GsiOLrs1THXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="52181765"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="52181765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:44:24 -0700
X-CSE-ConnectionGUID: IuZwhEFpQSqTVQ+/XbsRgA==
X-CSE-MsgGUID: SsPTwdF4QymSFc9iC4m6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="140235549"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:44:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGyup-000000031Nl-0ocg;
	Mon, 19 May 2025 14:44:19 +0300
Date: Mon, 19 May 2025 14:44:18 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 15/23] media: atomisp: gc0310: Switch to using the
 sub-device state lock
Message-ID: <aCsZklaaHaPvgpzq@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-16-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-16-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:40:58PM +0200, Hans de Goede wrote:
> Switch to using the sub-device state lock and properly call
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
> remove().

Ah, cool! But can this patch be put before the previous one which adds some
locking?

-- 
With Best Regards,
Andy Shevchenko



