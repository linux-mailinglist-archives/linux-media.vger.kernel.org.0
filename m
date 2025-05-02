Return-Path: <linux-media+bounces-31598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA9FAA74A3
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B858167DDC
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4022571A9;
	Fri,  2 May 2025 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8N9LONN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E1256C83;
	Fri,  2 May 2025 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195213; cv=none; b=q977fB7Hiyp1P7gmTjpwMvEyFtYGIdgn4lZ3G271R+6XmQS4YbM3znB6ESJ8Lct+Q+WbI0cR4mkcUZMvEfYCTbE+n0WjQomNiX+QQcv3xTwWTG07l+1u0QwyGePkp89J6uSlzKFRg3CpTAUvk8ln3sZ69okqc3pxDB7w8wNvq/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195213; c=relaxed/simple;
	bh=5JzCMHX6bjeSohaxdz5Ag1i/r2BJ6vmxOEY+6s5GOSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKz8JxfKeD0wpo9OyVFxo+MVTpie2gLsgoG+NThYrx997322zOBWAuisGuRgaTFw1WavnKM6aBbfGjJkZir3Yfv4kjfYFUFZY4u6PQyKxKLLs7azYjZAVfCewKNwIlb1oJ0xG/IwfKDN6s0e+NCnOk5i8y55Ae45JGEHXFGy7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8N9LONN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195212; x=1777731212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5JzCMHX6bjeSohaxdz5Ag1i/r2BJ6vmxOEY+6s5GOSw=;
  b=Q8N9LONN5YBG1v4UER0wpeF4z6VZAbLHgcy5jSmwtfsbajAXg6Kt30yH
   u6p8PR/x/Cz7OfV1+acUGbab1nOsxBP5FCRdm4+bYPCdk6jAKgzmzcEXJ
   r02psyca7MsdVoJZUg6Vi7bBf5uxwbt8HoYbUC+5Tgl9rXuMNUcw5cR0Y
   k6yH/1506APJe6YFX3Sr1R37yyB2vo49aaEnk4uHZUwIA1Ynpr8NSRw/x
   zwGkFTWW9xoOmAX5RCU569pYyXTXfwUvKoX1Lu6vIGjFM8uMTBA/Qn1MI
   sTcVU7safumH4ylUeAWw8EYT7LGUH1uURJLNKK9v2s4zv6P5FcN/b/bVc
   Q==;
X-CSE-ConnectionGUID: 8tTKBystRS24a239RjupyA==
X-CSE-MsgGUID: 21w8QHbBSfqdv3TlATxBLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58084957"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58084957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:13:31 -0700
X-CSE-ConnectionGUID: 23XAoTcvRg+8lRfJozEiLQ==
X-CSE-MsgGUID: arH7ouwMQ9eXdop3XldAWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135161499"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:13:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr8o-00000002Dko-3cfO;
	Fri, 02 May 2025 17:13:26 +0300
Date: Fri, 2 May 2025 17:13:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: acopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 1/1] media: i2c: rdacm2x: Make use of device properties
Message-ID: <aBTTBouss5fhHauo@smile.fi.intel.com>
References: <20250331083511.4005934-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331083511.4005934-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 11:35:04AM +0300, Andy Shevchenko wrote:
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.

Any comments? Can it be applied?

-- 
With Best Regards,
Andy Shevchenko



