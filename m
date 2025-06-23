Return-Path: <linux-media+bounces-35657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B1AAE470F
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A8024A1E27
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0685025C6FC;
	Mon, 23 Jun 2025 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeoQ0xYT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0802A25C701;
	Mon, 23 Jun 2025 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689158; cv=none; b=p+G/52EFyUEHmXJn6wODkCNAa8Ypp9F8V56BEXQQ8Xuw+58u5Dh6DknFP7CYyEW6HtLXm0ikURH2rFmEIwRHGeynr3gWmwVxz48+Oe5wGpKUyZykOwPnqlIFHwt7GjJ23NwlZjTATw666ncx2Lcd6DTnoYLTlPzzdGr1ZhV3OKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689158; c=relaxed/simple;
	bh=vMTcLD498Wk13c0JEhQoB7DOAQr9EqJCvaELj4r63kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAOSEJqqFyKCUrOigHuODkLI8G/TZPUkfuubEc/GwhiHomT6ZKSTPgkXYsOF6enKksvh/gEerJYo+WmNTAgxBcS7I1nQrn1G6XeJyE8C7PktLiIs6nphoFKezHGs7AGguF3a6i4fe2tDd8r54UCIONio4FzhWIVcNz5TKCeoPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeoQ0xYT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750689157; x=1782225157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vMTcLD498Wk13c0JEhQoB7DOAQr9EqJCvaELj4r63kM=;
  b=eeoQ0xYTKzq32qWITCsK+RnpxZBcroJb0tFbG4iL7BHUNgD3yuxQZ/EU
   tAV4jjjPZMQbpi6l9y3lRDzZTEv3H8YeH7OedMCOYk2spcYtMuod7brWt
   1R/RDy7Jl2wGCMNiJb64QDLKyNDQDCe7sf6VJzDYDH+tNJ4sYX8Svthh4
   dQ+Ww8SBD7it7SAkqLIeemoY0wcySeUD/PASRBNUfbxL9FeO0uV/rgJet
   /faG5rGLyxq9D6wMG0tm/CX4K71AW6olgUfZmlWQzzAD8z+mPJT7sJ8uX
   uX0R7aI2wiaWkOkIxvDR/ZRdqcR68RviCv2m5OIeRh0lG6WPo8vRgb7g0
   w==;
X-CSE-ConnectionGUID: YayzGHU6T/yM/XmahRrq+g==
X-CSE-MsgGUID: lzFGmGRZQ3mFEDGAXj5ZXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="75431898"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="75431898"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:32:37 -0700
X-CSE-ConnectionGUID: 43BbV4pWQ/uKWUbuioHfkg==
X-CSE-MsgGUID: T0AY/+3qRD69iPCJBY0IVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152135974"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:32:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uTiDm-00000009CSC-1JdB;
	Mon, 23 Jun 2025 17:32:30 +0300
Date: Mon, 23 Jun 2025 17:32:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, andy@kernel.org,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
Message-ID: <aFllforMcR-WStUf@smile.fi.intel.com>
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
 <a2a67998-f67e-4677-a348-780bf640bfc3@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2a67998-f67e-4677-a348-780bf640bfc3@suswa.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 23, 2025 at 05:16:57PM +0300, Dan Carpenter wrote:
> On Sat, Jun 21, 2025 at 09:24:40PM +0300, Andy Shevchenko wrote:
> > On Sat, Jun 21, 2025 at 9:30 AM Abdelrahman Fekry

...

> > > -       ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> > > -       if (ret <= 0)
> > > -               return 0;
> > > -
> > > -       index1 += ret;
> > > +       offset += sysfs_emit(buf, "type pgnr\n");
> > 
> > This changes the behaviour in case the sysfs_emit() fails. Not that
> > this is a big issue, but it should be pointed out somewhere.
> 
> Neither scnprintf() nor sysfs_emit() can return negatives.

Good, that's what I asked the author to investigate and add the respective
comment / update commit message accordingly.

-- 
With Best Regards,
Andy Shevchenko



