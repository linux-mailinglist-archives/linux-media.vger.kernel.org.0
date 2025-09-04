Return-Path: <linux-media+bounces-41754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CFFB43481
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 09:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61EA117C18C
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 07:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C72E29B796;
	Thu,  4 Sep 2025 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emV2isz6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7CDBE5E;
	Thu,  4 Sep 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756972098; cv=none; b=FRZ2IIyL7remXo241FVxQOMLGu0IRNQ8KFXTDNhX5Yu3BFHO8zmzIDf36fCk7xbjduwgsD8JaWcx+RKumKTTT+zMcMgvsjWTWH9lwtqSjszMO+n46xkMJ8W/sQgvH+u+r9OZQtEke9D1htAuqjD7SupRjMp+v8xmOprjSXxck5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756972098; c=relaxed/simple;
	bh=ZC+WVshZrhZh5+K/oAuQIuFO1mXnL5Mq5cuBTwheGb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhRAIiQbxC+gjgug/3c+OMTYpftDgnkETu1Rxyl2p9FvEaQTvXRAW4E/t4ux+xlx29M2Hc2sFZ971MSfixW3AIVnxidV2Omnk2VEFjV38iHXm6m/ZHt/9F5Fy32YAwoPsung6qvIXNroSPthx3wcfyrsZ92EJHjB7AazXydhuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emV2isz6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756972096; x=1788508096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZC+WVshZrhZh5+K/oAuQIuFO1mXnL5Mq5cuBTwheGb4=;
  b=emV2isz6sMSZ1fwXPg1ehjRdsAJcyhMaT8T61SmaKvS3MwIKZSHFh5d/
   J862W3AfCWq0WVtdHsn9hmIT1bb/Gad3au5joSo2fuGNWFefNjUj+ZljA
   Z1NA21uvtJcMUowKQ/K/6pGwhD0gOIGNbVFw2cMHyYBXsfewZcjVda3xR
   yfB8WggOop+oAvG2XFRj34OSjkJ4yPxIqxXi/NialLP2n6unf+lfWfQ/c
   KkH16FqjLHMNSvwYdoF6k4v4h0J8WtX9O1p93PbtgouJ0vlT0480iFG8Q
   XF9UkJX9766TIAeay3dFrSOSeDh8GrUt8LdO+et5JG+NWpqJEzJ+x2Bxn
   A==;
X-CSE-ConnectionGUID: OryHhI2zSyiDVAHv3Or53Q==
X-CSE-MsgGUID: xjdSRMqqTf6yr+wAptFgsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59243159"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="59243159"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 00:48:15 -0700
X-CSE-ConnectionGUID: noDkDOW7T+KfV0sx0rwuKA==
X-CSE-MsgGUID: 8XsIk3l/SGGFYWt7Q5CUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="171934358"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 00:48:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uu4hW-0000000BCYb-0xMg;
	Thu, 04 Sep 2025 10:48:10 +0300
Date: Thu, 4 Sep 2025 10:48:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/2] staging: media: atomisp: Change name to
 better follow its behavior
Message-ID: <aLlEOYZqT07r6G_V@smile.fi.intel.com>
References: <20250903092754.2751556-1-abarnas@google.com>
 <20250903092754.2751556-2-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903092754.2751556-2-abarnas@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 03, 2025 at 09:27:53AM +0000, Adrian Barnaś wrote:
> Change name to clearly states what function does.

The Subject and the body of the commit message should be more specific.

Missing blank line.

> Signed-off-by: Adrian Barnaś <abarnas@google.com>

-- 
With Best Regards,
Andy Shevchenko



