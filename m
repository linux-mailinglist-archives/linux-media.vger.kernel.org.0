Return-Path: <linux-media+bounces-30812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB95A98A22
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C042F1894FF7
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90666BE4A;
	Wed, 23 Apr 2025 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/MDVqo4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDBC4C62;
	Wed, 23 Apr 2025 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745412691; cv=none; b=KxTv6jXVG/J3GblnvBRwMrd/rlB2tDazJH8OYscMcXTzBq8tOu5vGoKjlPJuWlD+qt8CkmWZ4pPsEraVUMNNX7ipUH6AVHpz3Hzpl3tGkQdaPDCpCEMPB4KezsP9FK3GzRpn+GrhdGIyMMcKy5RfCXaZlhFCKHFZ+w9AJr19PM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745412691; c=relaxed/simple;
	bh=O24AVo87Xl3zKaU3Z4Nac3ocv+3MkbB4zf+ZspP3r6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uF6NTOzhNs9IU9lmw51fqskrQICT9TuzHgLOVAh4fKIBueIzT4xhrjHm1/Um3kPqKp/kwe57gzFM4tShrJm81dhDTOEtSwYbNBzTgLfY5kf+LHu2EgGy4H+arr6uoCp7RZq+qZ4Q+8A7yrw8p+Dt7F7si5nq0nbBNemy1uH2NDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/MDVqo4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745412690; x=1776948690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O24AVo87Xl3zKaU3Z4Nac3ocv+3MkbB4zf+ZspP3r6c=;
  b=i/MDVqo4WT85uCQOsh9DBKxyoRCyhKMB+nOaW7lm1CMt/QUlth4vc/of
   HiBUsgL1JHJNK6TuMPSDYxIyss9U/03bvsu8iBH0QvK6xy2OBL6nst0Sr
   jCUwnEFWm2uB1dcG/VXC61hXCNlIkafjmwXMJJaWeBnfeKVEBIRzNP1Dp
   Lzv1oPvtjsPeOf8W/dFtlQHFiGa/3w9N1dEKJiVKfZ/soRW92Yr8uSLwL
   HvEysBfEGeX9ufmnLL+pJRyKE/lXPErQlJ6mIRRW2FiMb7Osf1HNsqkIP
   n0oQ84Rf/jRY4z9IirU3f4QXVF1rvTSHEBjOnYgRg74gYB9S1m606gC2c
   A==;
X-CSE-ConnectionGUID: M7bjXovzTaCWp2t5ONGCsg==
X-CSE-MsgGUID: pS0Qxy02QEWBKf/SHXQW+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50665060"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50665060"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:51:29 -0700
X-CSE-ConnectionGUID: h88h5D9OT66vHIycEe6hZw==
X-CSE-MsgGUID: OfANx+SmSLGfjdfkMYLzCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137465673"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:51:26 -0700
Date: Wed, 23 Apr 2025 15:51:21 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: eugen.hristev@linaro.org, mchehab@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, andriy.shevchenko@linux.intel.com,
	sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Convert media drivers to use devm_kmemdup_array()
Message-ID: <aAjiSa_TD1r6Sqrn@black.fi.intel.com>
References: <20250409084738.1851463-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409084738.1851463-1-raag.jadav@intel.com>

On Wed, Apr 09, 2025 at 02:17:36PM +0530, Raag Jadav wrote:
> This series converts media drivers to use the newly introduced[1]
> devm_kmemdup_array() helper.
> 
> [1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com

Bump. Any guidance on this?

Raag

