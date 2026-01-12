Return-Path: <linux-media+bounces-50486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA1D14E1E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 20:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B90930329E6
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 19:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30303168E5;
	Mon, 12 Jan 2026 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6H8xOmN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10531313E3B;
	Mon, 12 Jan 2026 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245278; cv=none; b=qBOYBZJLm8xwg7Cmqibl4WVBdjATAyBt+5ELFLKNgvLqbjphqplVJJW40W5zTjsX461vdBecyioEuqLPCXWuP9IKi6SiMFan2PYgWJhjvQVqS/KFxVYDr/Jhb5GVzx3bZBBN/FtSe5d+cgn+yhnkvNELneF7a3dVcluI6V1RTOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245278; c=relaxed/simple;
	bh=wYfDdLx/4JSmg6tJY61YxZ4KT957t04ctEuzTLzPXRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMdM3/nm8uYVs9/9zdP9uZ1jfEwY0zuKyAsmBB+4+iEJcsM44wifoJ/lT/ynw4jj8/GQ4BKhk872v+EkCjztJ2n4hscINPNEM1rEKRExPOQ7+M/zb1+r6Z3yrVaxoNijNKjKqGLKotRf8bi9J/mDUzS7MjSSH4PHIDiTeEt16iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6H8xOmN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768245277; x=1799781277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wYfDdLx/4JSmg6tJY61YxZ4KT957t04ctEuzTLzPXRU=;
  b=A6H8xOmNJlJ9o37qa7RwF1zM1bXjDkHdd4pSWYE7695BXN0+KRy1R5NV
   X+tMs3H4z4gl5vgFmOTmqgx85RBd0ZXF/qHgiL4ICV7QcK/Pje44hVYPa
   h/G+7tdzpsMmkz/Xbie2VWe90lVnIHcFiOpgVzd6S313Io8zFf09aCsgO
   oJ27QiyfMmuezmpl15OtDBn7NSUB2/HwoI5E79OTmkX3GO1pWhruCkn4D
   pmigIGpKwf0c0UeNj+a2pLuBLHpy6nZNzC7arVIXVGBEXNTEe5IfHKRmo
   EYriQjSwingd0xs4RQwBIyubEVqZfAvlUuj4cPOUxDkc1RJ/0Rs5Q6OJH
   A==;
X-CSE-ConnectionGUID: z8IYxdSYTDe2pHS+M/6IGQ==
X-CSE-MsgGUID: fmA1FzKvRv+WlJsuCI8Upg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80167994"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80167994"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:14:36 -0800
X-CSE-ConnectionGUID: JNf8IDcOTO+J7fuiKp1NOw==
X-CSE-MsgGUID: /zsTxTl/TfaY+JjOeFViDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="234877873"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:14:34 -0800
Date: Mon, 12 Jan 2026 21:14:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anubhav Kokane <dev.anubhavk@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to
 sizeof(*ptr)
Message-ID: <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
References: <20260112190054.9828-1-dev.anubhavk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112190054.9828-1-dev.anubhavk@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 12, 2026 at 07:00:53PM +0000, Anubhav Kokane wrote:
> Use the variable name in sizeof() operator instead of the struct type.
> This prevents errors if the type of the variable is changed in future.
> 
> This fixes checkpatch checks:
> "CHECK: Prefer kzalloc(sizeof(*ptr)...) over
> kzalloc(sizeof(struct type)...)"

Yeah, but in all cases the whole buffers are less than a page and hence instead
of doing that the preferred way is to switch to use kcalloc() in all three
places.

So you should have something like

		x = kcalloc(count, sizeof(*...), ...);
		if (!x)
			...handle error...

		while (count--) {
			...
		}
		...
err:
		list_for_each... {
			...
		}
		kfree(x);


-- 
With Best Regards,
Andy Shevchenko



