Return-Path: <linux-media+bounces-24999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA03FA171A3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 18:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F085E188165D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 17:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADE01EC017;
	Mon, 20 Jan 2025 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajU7H16X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2041E47A3
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393870; cv=none; b=BGRWPwlNjKH1qSMw8JjcZwsaM5mZzKjmzwaWfGR7tYSTyMNqEAJCIsk3xqCsNn2CRjRYaUg7P8VBCr7/yYba2REsWodsLwjGBT3+V48IQNxOszL5yAsFldmWxRvwR8i3Gf8EUEoSNRM96M0TE9ML5cF6XK11MOACsjxCyacYoWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393870; c=relaxed/simple;
	bh=pCKD/dQrEuBRNxAem9uNuLur/WpA1cML7WjkOp96Tqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElEhJGRyEViToLjfelEXBKBtvFTYxHqTaLOGO7YG0vISw0/cwsAbERnQXIH0sXyP2fKeCTyLSsU7DdeQI546gg6ShvGwUCzlSDVXJqAbpXUtk2Ikygtn2sMMoppZDaBdJ/+ajN9T+6JFH6Yi6mgFcRQPPk8DH2z/sZjcctTm3IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajU7H16X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737393869; x=1768929869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pCKD/dQrEuBRNxAem9uNuLur/WpA1cML7WjkOp96Tqo=;
  b=ajU7H16XxVU0pMyhk5ISW+5ZcZS/1J+/PEO3Cc47mE6gqCnOra53jV5r
   UHl2ecVFVV4gt7sZ0Rg5MmaCgO0Cg7t97EWtBQhPcQbOrMPfKbsQKaN0d
   v79IihYFoqWglVpXFgF3jALhGw31AKsek2WVLeQSVj7yictLRo+rNOmQg
   mMPBpeLmbIwL/7IWF7geEuaDsGU+AQYGr/8yhBdMYZklbPRpbIX5ABBGa
   eLZu09hRYzvlXH/G+Ca4arZRbBOxByLBmztfAfIimI8VbFqfx8M9ZZ/rV
   FClJ/NVJAyW00flDf2abe3GVveoe2cMcudvfMsJVqRxIwVzCOrUhsnKIA
   A==;
X-CSE-ConnectionGUID: VKVlDlhQTBWruFxhENHSeQ==
X-CSE-MsgGUID: 0MGdfw5/TOu/J5+0Kx7Fyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55207054"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="55207054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:24:29 -0800
X-CSE-ConnectionGUID: Eisiz6WGQ1aPgmUVGTZVvQ==
X-CSE-MsgGUID: PMS2XsU0TIqA0C+08sC/Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110622690"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:24:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tZvVg-00000003VP9-28sm;
	Mon, 20 Jan 2025 19:24:24 +0200
Date: Mon, 20 Jan 2025 19:24:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] media: i2c: ov7251: Set enable GPIO low in probe
Message-ID: <Z46GyGL2K5s7Rw3d@smile.fi.intel.com>
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 20, 2025 at 12:11:22PM +0200, Sakari Ailus wrote:
> Set the enable GPIO low when acquiring it.

...

> -	ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);

Fine with me, but it's not helpful for MS Surface family of the devices anyway.

-- 
With Best Regards,
Andy Shevchenko



