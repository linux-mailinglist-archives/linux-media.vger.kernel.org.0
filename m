Return-Path: <linux-media+bounces-17222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20168965C8B
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 11:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFAC3B20D63
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C7F16FF26;
	Fri, 30 Aug 2024 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tg+Ro4j5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0AD4DA14;
	Fri, 30 Aug 2024 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009576; cv=none; b=ttle+TNUtKFes9dwQ9skc8kt1Dr/Xh4+LF0Juv/Pdegml1PjFPI7JLkHVcCvN0tMsDsISaSA1c6GzcmjVFKyYcuMNbXIOglxTwWkran5VcaJdP1pSYaVMIGM+utswov6Tz+l/xTI7ZIftr2I3y5/Yr4CwE/oFhDgzinA9FnCssE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009576; c=relaxed/simple;
	bh=urmcvdOimGsw7Gg1WZA8Ka8BcDiVmhV8gSvHBzv6u0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX7MciL8ptYnXgMtguONHjJFftvzsuWUBRHc3riBcxNC3P/1DtoicLOaLzU/OERt43Cr4EMEEnoEB41fZ8bQ2VsXJYuAsJ21ZEGOs9KJnkLEL2M2ZPXFQpePpM0Ht5nzP7VE93MYHI49ibDGxb0MNZVK/s4FS7q0lEaLkS2NG/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tg+Ro4j5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725009575; x=1756545575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=urmcvdOimGsw7Gg1WZA8Ka8BcDiVmhV8gSvHBzv6u0o=;
  b=Tg+Ro4j5oKgvGxIK/6uCQDAejmahLzBEBCk2xUVKuH2uuton4e09n/yj
   3aI1pDBsl8p7nI/sWjY0ya5JDRv/WMcrwqneYPZvjxEAmImew5PYY9CgV
   q6sSIdT01WE3kRY3ckCfVoHHQmYjyPSjTdrJcVcGP5KzRHJ0bxycyLeYw
   swLXuLJtMJylwGS0tOxJta9CC6mAYVuRQJBkIyITiAVOehT3uPbhFrWyg
   o6OrMnvYx0qD6zi8giRBcF/YLZ3k+4jThuj4JzokP542sJFTnL0n/VWWS
   Dq9dIZUeeKIEvPvFcF5Bf0GPfP5F7IET4CdMdEbUdUdrBNZQVG9qiDDRW
   g==;
X-CSE-ConnectionGUID: fokmyzKgRfeqn6asd34sUQ==
X-CSE-MsgGUID: ZFMBpkn6TtiL5RBQQ7bytQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23524209"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23524209"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 02:18:26 -0700
X-CSE-ConnectionGUID: lXgEindTS9eBo+mXGcN0DA==
X-CSE-MsgGUID: 72fEWxUZR0aSwXiKzlJcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68685247"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 02:18:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 41E5A11F843;
	Fri, 30 Aug 2024 12:18:21 +0300 (EEST)
Date: Fri, 30 Aug 2024 09:18:21 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: i2c: og01a1b: Add support of xvclk supply
 clock in power management
Message-ID: <ZtGOXaMlHbzrzlbY@kekkonen.localdomain>
References: <20240830063459.3088895-1-vladimir.zapolskiy@linaro.org>
 <20240830063459.3088895-5-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830063459.3088895-5-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

On Fri, Aug 30, 2024 at 09:34:57AM +0300, Vladimir Zapolskiy wrote:
> @@ -970,13 +978,32 @@ static int og01a1b_check_hwcfg(struct device *dev)
>  /* Power/clock management functions */
>  static int og01a1b_power_on(struct device *dev)
>  {
> -	/* Device is already turned on by i2c-core with ACPI domain PM. */
> +	unsigned long delay = DIV_ROUND_UP(8192 * USEC_PER_SEC, OG01A1B_MCLK);

This is a problem, the first argument overflows. I'll just add UL specifier
to the value to fix it if that's ok.

-- 
Sakari Ailus

