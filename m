Return-Path: <linux-media+bounces-37059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6AAFC4FC
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D3903B52D1
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17C829AB02;
	Tue,  8 Jul 2025 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgSUVYWV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9C29A9FE
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961849; cv=none; b=pxYWL3xYj4hLCcsHyz/mmWR0c/iQf6SaqSYqLbqpsGo7jZxp3qJTbcVQBKOu5dSgI2wlGeTQ+TY5H7G+A4c3MOtkNy6KyRT04597NoSesQdgZnjQnxVZCCysXTsgmG6MMNEDXgUBleWJIu0KH5n4eSEXi7zw3z2pXfnT9sY99rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961849; c=relaxed/simple;
	bh=4vMpqOrDlN29qP+1/MNcq0CSkKLp1dWgHqjTaKBYHTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1zS26BwljXLbJe+M2RPdNE4iWjBlJR1c4ojH4tuUcj2bhJKQQ8hElk9hwNLBp2WhfSKx6O+rh0aeuq2yk9UGvVSz/Im6SXgf1hoPKt52QYQBEJw3yHHq4ldZHeHd57Dpi8VQZ2IFCEWTIYNSzt6njoA89JYiyWCHba2VJy4VUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgSUVYWV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751961848; x=1783497848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4vMpqOrDlN29qP+1/MNcq0CSkKLp1dWgHqjTaKBYHTs=;
  b=QgSUVYWVOSfqCug8MMiyCk8arZyhJPrWzSIQgxU3V3eoLGzr/yEpUc4a
   olKBzInY7jDJnuA4tYj8s/nWMsei1GWdYJByaig+xBTQbPMlWExp0J9TW
   IBN7w2Fla6eLN/xi6+Sv1gWJ/wskb7RlalSnaS7gpTMxmPpb9CtI8vJIz
   PIzqlWcu9Q3RPQBTbB+ZN7JrNaUCB2pNnyiUeRO2AdrAK0WF5Ld6EtWSK
   kuPNaWKdbcIXTYd3aHDgYiAgeEMscgnNxiE0ijvpDHXpokVQwr+kG2loh
   Rwpzelphg+NrxmB2p2dmjoSQSRd404dzK1Gtr2admdT7jVbwzHqVpuPmg
   g==;
X-CSE-ConnectionGUID: RdVV50dfQy2WriIh68T6HQ==
X-CSE-MsgGUID: 1dTuXo4cSl26vHYltM1rKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76740247"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="76740247"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:04:07 -0700
X-CSE-ConnectionGUID: q04dNPkzSxejXcX1tvgFjg==
X-CSE-MsgGUID: /su0Pv/sR8CKFVpiMoEObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="154844038"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.230])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:04:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 76ACA11F8A6;
	Tue,  8 Jul 2025 11:04:02 +0300 (EEST)
Date: Tue, 8 Jul 2025 08:04:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 07/23] media: atomisp: gc0310: Add link-frequency and
 pixelrate controls
Message-ID: <aGzQ8vAZ6x9IOIiw@kekkonen.localdomain>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-8-hdegoede@redhat.com>
 <aCsWY1ICUoHTq07L@smile.fi.intel.com>
 <3bb4690c-eedf-4cb6-8779-2ea1004510e2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bb4690c-eedf-4cb6-8779-2ea1004510e2@kernel.org>

On Sun, Jul 06, 2025 at 11:57:17AM +0200, Hans de Goede wrote:
> Hi Andy,
> 
> On 19-May-25 1:30 PM, Andy Shevchenko wrote:
> > On Sat, May 17, 2025 at 01:40:50PM +0200, Hans de Goede wrote:
> >> Add support for the pixelrate control as expected by libcamera,
> >> while at it also add the link-frequency control.
> > 
> > ...
> > 
> >> +/*
> >> + * The actual PLL output rate is unknown, the datasheet
> >> + * says that the formula for the frame-time in pixels is:
> >> + * rowtime = win-width + hblank + sh-delay + 4
> >> + * frametime = rowtime * (win-height + vblank)
> >> + * Filling this in and multiplying by 30 fps gives:
> >> + * pixelrate = (660 + 178 + 42 + 4) * (498 + 27) * 30 = 13923000
> >> + */
> >> +#define GC0310_PIXELRATE			13923000
> > 
> > Why not utilise the preprocessor to calculate the above?
> > I mean we can define an arithmetic expression instead of the result
> > (which is mentioned in the comments anyway).
> 
> I don't really see any added value in using the pre-processor
> for this, it just makes the #define line unnecessarily long.

My suggestion would be the same as Andy's. If you think the calculated
value should appear there as well, then I'd put it in a comment.

-- 
Sakari Ailus

