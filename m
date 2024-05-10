Return-Path: <linux-media+bounces-11327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF118C274F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25FF9287550
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFB617109C;
	Fri, 10 May 2024 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwYSjErf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF312C53F
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715353626; cv=none; b=i1zpg8N5vAeRCZuf5CyWbJIrbZd5SnNtRV7+mGW7N3TVJBQpgWRmNigmorDqGQ+rkyPHhDg/RbKO/4WzTGj3J67nsDfsKRmAltnPZTxKr4BaNuJp79MnA/q32yUime2iDOWua/9LKe+O24xbz3jVqmSLoI/cD2al/ZeL1qCXzoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715353626; c=relaxed/simple;
	bh=DQK/QFRdV2IMTqNzyYJ6JyIn0quOZyPUkeyidFBBr6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMZ2lCUIgCP+Sg1Kl8LPBTJKEoX1N4iF6HcKMjTcrrJ/36fTyIq4I72uiXpBDUVyqqr2nUne9reNedsQm1JowhmjloO24eorzTQ/q/21NXl8QuDtH9t7Reg9Y9fX2eW57KS07ZRPGtCQWt+Fgb7CYIFxCaB4E13IA3ora+bcBIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwYSjErf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715353626; x=1746889626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DQK/QFRdV2IMTqNzyYJ6JyIn0quOZyPUkeyidFBBr6s=;
  b=DwYSjErfWtfqlc0mrXErfMbcc/TzWWTIGsIGYwAjxovomf/RqmZJqcMV
   ezo9d+EP4f8zU2J89a+e7lUmCc6LiirW0h9/1GmS5bqAWyl9skjOzelb8
   Uuno015rgrJ8Wh98faeNu7CuTETeUaeD15XM/Wm1UAqDmekAEW/AFfejH
   7KZqnEj+allIiVhmvjiUdybr3p76Lf3em7nISgM42O3ZOvkvEU2z976yb
   W+51N++2InaCS4/7pEksNHc/T56ndJv19adtqi9NxMV8OJ0tYqoR8QGwG
   yxPEc378w6+2AjQLL1Dtc6f3llM9+l/4LINhipcfrs3QOM3nOIRo64QoF
   Q==;
X-CSE-ConnectionGUID: WV0b87jHSt+G772dgqP5mQ==
X-CSE-MsgGUID: ibCXeIhzTt2YAyIwSqEWKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11271276"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11271276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:07:05 -0700
X-CSE-ConnectionGUID: 1fJdur43RxacDKSYdGC3Qg==
X-CSE-MsgGUID: SB+CTy45Qq2r67LKqpqPwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="52857149"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:07:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5Rpt-000000068df-01yT;
	Fri, 10 May 2024 18:07:01 +0300
Date: Fri, 10 May 2024 18:07:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH] media: ipu-bridge: add mod_devicetable.h header inclusion
Message-ID: <Zj44FJHP5qUcaLmY@smile.fi.intel.com>
References: <20240510062747.3422256-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510062747.3422256-1-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 02:27:47PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> ACPI_ID_LEN is defined in mod_devicetable.h, so the header should
> be guaranteed to included in ipu-bridge.h instead of the source
> files which include ipu-bridge.h.

Right,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



