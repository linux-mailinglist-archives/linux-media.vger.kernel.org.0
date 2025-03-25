Return-Path: <linux-media+bounces-28735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 247ECA7074B
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA87E1644D3
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAB525EF90;
	Tue, 25 Mar 2025 16:47:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588F18024;
	Tue, 25 Mar 2025 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921262; cv=none; b=btgGctFnpj3rKhp2Cbz/DdZ7jIVu5lmyhOgfF7TMryvnviGADHIAzlndeZT8ayMXGzHPYEBjHVPafkJ2/DxywDmLupQ0Yai3I20GQLHSx+SYGUsiXaLZdJeHch+s5m/zPwj/e0IiD2Xutbt+0wHwbcsOL5Yh+RIcGj2Dvli2DVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921262; c=relaxed/simple;
	bh=psTT+/ZN/yZnpHmbhPmyR19gzf+s6DhImKCH5715b+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmSlZdGgOcgSvJ0xeZsXmLZ0bo9U2cAsGxRF1dMLPaJjpQJ//4AWKIZsvJLpOwtwcDtNiEqH/YoS+NvO1COoTHz16Uznm002b7w3W+fmQvl6H2+PI0iMvwB9N24A47N1hKGlUMlm6NnYhq8FarCYAC6mzUSC03QpI5Le3kwq8fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: mxvi8VApS3mxkylYOgkqeg==
X-CSE-MsgGUID: nXjpMj8MRA6IzJYaTGbbDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55560791"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="55560791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:47:40 -0700
X-CSE-ConnectionGUID: m3vTcm0iST6rTgDliFXQmA==
X-CSE-MsgGUID: pVUOjJGxQZy1rd5QxoEeog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124955544"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:47:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tx7R9-00000005o5q-1BSU;
	Tue, 25 Mar 2025 18:47:35 +0200
Date: Tue, 25 Mar 2025 18:47:35 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/8] platform/x86: int3472: Drop unused gpio field from
 struct int3472_gpio_regulator
Message-ID: <Z-LeJyI0eNgj3j41@smile.fi.intel.com>
References: <20250325161340.342192-1-hdegoede@redhat.com>
 <20250325161340.342192-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325161340.342192-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 25, 2025 at 05:13:35PM +0100, Hans de Goede wrote:
> The gpio field in struct int3472_gpio_regulator is only briefly used to

(no need to change anything on the firs line :)

> store the gpio in skl_int3472_register_regulator() instead just store

GPIO

' instead' --> '. Instead' (otherwise it's a tautology)

> the gpio directly into cfg.ena_gpiod an drop the gpio field.

GPIO (only the first occurrence)

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



