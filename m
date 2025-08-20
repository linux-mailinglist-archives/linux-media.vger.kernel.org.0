Return-Path: <linux-media+bounces-40422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A7B2DD60
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94574E0F24
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287FC31AF25;
	Wed, 20 Aug 2025 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRgyYHls"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF2311C14;
	Wed, 20 Aug 2025 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695271; cv=none; b=gV2S+DbHB5os+LTOi9hsmSmbamME0dntxXjqlD1o0nAITaFZezac/pb1LNK4m29saGtCPz3KEmVEHw1KajTeLXPXqbwr++bhv+EGUMf/qltOYvteyDEDpZwSANa5l63/okLr2xYQpXwgSJmG5guk+tSDTdICtHabg6kOE5Wdrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695271; c=relaxed/simple;
	bh=6nKp9OvM0U/PQRaCIknwXCchajckybqXNIeJit8niKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkUa2SCJFDDy0GRbIpf2UIv004/yYw1Z49v41mzcVATOilLFLAUqKwLa5ldUhH2PhS9SeBT37CSKSoKFWGC6pQED7E3wSvwrVllt65WVUD6id6W0ND6mmfwVHzzugVsvD6huAU9C9Tf4EOqPVkPkmmjoZ+5sUFgOHCwEqCwHUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRgyYHls; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755695270; x=1787231270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6nKp9OvM0U/PQRaCIknwXCchajckybqXNIeJit8niKQ=;
  b=eRgyYHlsRXo8lUwNPk1jQ4XMpNEiUv6qO5ObE0heQZopWmxVsLnT8tk0
   FL0/8+hGjEdYT5p7kahVWS9iFFLOUIyYIThJ43Vp2gaEwX3m1I8RP5SfQ
   /iPl9ZPBs8p5rPekh92kB4doPtYGUUV2I/SiMnnITbfjO2X7CDGVj7g5A
   4hr5pY81vP2LOJYbFDzU9N7r1UJGhZ4bldhn0eWcHL8hfOLvNNnzeu9n1
   dFskNpnmMAxzs1YB02uEl/+IQ3CK4Uhghy7XvxzgZlHprJZpsrUjezC9T
   1tSl/qf2/GVZqgZXk5IRhJQfFDk0Bgf2k9gGP+27L4jkNzfuGEHa0zsfZ
   A==;
X-CSE-ConnectionGUID: saWzepcfR5KWIFadb0AMSw==
X-CSE-MsgGUID: gXyNqGG5SGaIQJBl3fsW6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80552354"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="80552354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:07:49 -0700
X-CSE-ConnectionGUID: DPltBdiPTy620o+AQugqkQ==
X-CSE-MsgGUID: KigNau3YQdii6MUjwXm2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168039808"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:07:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uoiXY-00000006rMw-3Kjk;
	Wed, 20 Aug 2025 16:07:44 +0300
Date: Wed, 20 Aug 2025 16:07:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Whitespaces style cleanup in
 gdc.c
Message-ID: <aKXIoFpHUjSdCbHY@smile.fi.intel.com>
References: <20250820124519.2287171-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820124519.2287171-1-abarnas@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 20, 2025 at 12:45:19PM +0000, Adrian Barnaś wrote:
> NFC: This patch cleans up coding style whitespace issues
> in drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
> 
> Fixes include:
>  - removal of unnecessary line breaks
>  - correcting spacing around operators
>  - correcting spaces between types and names

...

> -static inline void gdc_reg_store(
> -    const gdc_ID_t		ID,
> -    const unsigned int	reg,
> -    const hrt_data		value);
> +static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int reg,
> +				 const hrt_data value);

Can you rather refactor code to get rid of the forward declaration?

...

> +static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int	reg,

This still is wrong, shouldn't be any tabs here.

> +				 const hrt_data value)

-- 
With Best Regards,
Andy Shevchenko



