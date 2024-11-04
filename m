Return-Path: <linux-media+bounces-20803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EAE9BB581
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 14:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40FAB1F22094
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA031BBBDD;
	Mon,  4 Nov 2024 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLH6ndK8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC091BBBC9
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730725952; cv=none; b=g4oKEfFqgg+7EeZVEZ56kFWMiJ6EEg15k0EdWH5Hog9fV8NinyK6vr+hxx+3IntpbkMGag7zTSSjfYvcckAOwiDmWCC6IZYktMqjjH+O8f9uZD+jZaTsubhcjbpFJZAjgowtk5b36RFqPcKZhcunTCrU8uGOhRY2gY+1zgUhQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730725952; c=relaxed/simple;
	bh=sSULQ88VHCCbn81N2He1y0rKpW+nMIvJ+jya3R8y67E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFMY+dGCY3k3PcZprp3pECTBciEP9nzRqDqS0qtsWb5r4UYfEm5K5IDtQrnMdDBDy1k7fqQehJAAflpi4oFpp/brQIiE+mrXOWQPQLW5ZWYNPDUs42fF+fLHU0dDiLUhRxOooWbs3w73kh7MLKmAq4BZQ2hEnPXB9lGw+2vhvlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLH6ndK8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730725951; x=1762261951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sSULQ88VHCCbn81N2He1y0rKpW+nMIvJ+jya3R8y67E=;
  b=bLH6ndK8px1xqCFZlvo6ekbfqPhc++05vxJ49cuSAYBQDgwaykFbo6dH
   rAGsmWsX9MmprGBRGlV6cRkHrg+oqeYs6J2CXWrgZGP4ktVjMZfNFz9rn
   lLt6Jh9IQHfNROwQ/8sd0sZvDW9BsNQBkb759ulJGRN4Kk0vlWlSyu0KW
   IhSjKzIIMZnY/8OnGmxlwjc7G1eNRMk0Ra8JTtCWO3+Q9Hpn0Grmr9wEF
   bE3reMUqBkws6VOEz60uqlIrHsi3UtMOpjxpPeLLOGaee91lufOusS2Gx
   mD8Q3Bkt8RDFMW8Si67zadQfRFmvFBavCOOEvMnaIBtcssmcZOeSrFuRB
   A==;
X-CSE-ConnectionGUID: pd91zpWwT3GjqhbwZqay8w==
X-CSE-MsgGUID: bKUohPWMT7KDd+/+YeqP2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41526431"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41526431"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:12:30 -0800
X-CSE-ConnectionGUID: BU5T0UL+Siq0m94a+TuiwQ==
X-CSE-MsgGUID: 0KWJ51NNSKuUzlG/wR/ugg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="84468017"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:12:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7wsb-0000000B4Xu-2ZPN;
	Mon, 04 Nov 2024 15:12:25 +0200
Date: Mon, 4 Nov 2024 15:12:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Remove gmin_platform Asus T100TA quirks
Message-ID: <ZyjIObShDnwYaJFj@smile.fi.intel.com>
References: <20241104123832.5539-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104123832.5539-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 01:38:32PM +0100, Hans de Goede wrote:
> The Asus T100TA quirks set the same values as the defaults,
> so they are not necessary. Remove them.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



