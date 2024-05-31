Return-Path: <linux-media+bounces-12367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF08D684B
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 19:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 243A4B23CCB
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 17:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB0417C7D3;
	Fri, 31 May 2024 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/LaKBFL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739C176223;
	Fri, 31 May 2024 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177295; cv=none; b=aShquHmSFgSRsmGN4UjZjk5rinRQ8qm9cPyf9kC8ps1KmhluFXZscgRqElssqCvfwYFWM17q7caqsSE4nyDcN+HkRtWG+esTYkbN806vrGzKGdTDHmmSZc7iq/SLfN0Cptd9Aiy5p+eT8j6THTWIWs9UrLIe3Me8gbRYKqG43Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177295; c=relaxed/simple;
	bh=2HRzJhB6DkzhhkkR2uYIgH8e1uDb/Hk6QCHWQxk39lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VA6IcVRItWSW5i1nPrSGvpNDl2xqmDaTZON2TU9jXN5J6xNGuu4G0QxhUZHSSEg64BBtDkL0tY5NTvhWkGfSXW7CpdE22YtNMt72ILCziaA5gFefh2zu7crdFZKj/U4Co6dRsoVfZbPIQ/QkzyTeXtruwiaExZWBZp/tIouAPZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/LaKBFL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717177294; x=1748713294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2HRzJhB6DkzhhkkR2uYIgH8e1uDb/Hk6QCHWQxk39lQ=;
  b=I/LaKBFLryQOV0btZlFnVjF6ZzSsRvAOZQ/M50O90iBzhN4S3b7VhW1j
   xpGg9NbSSM0L7daAl/3KVgy2w25Gjf6PcSBsyScuvm/eL3DAIU75rtzZw
   ENrQMMOSunto7p2/ZqKeUFgpVybXEecYIPYtEKlCiwub9QIACtOxzRxn+
   iXEQ7CVhjS5A1LdYzZRCBPXwo6TLPNSSugIzLwP88Yv1Lg9uKeOmYH+pQ
   CZB/W94WY/peG/lGmTshOHhrcZgRl/Be6hnwlyOSxAgN3xz+AMkssbgX1
   a86fXPBHVwqQjtv8La5QRcKiG9S+tkpNQ21yLx/IGDts881wg8qV0QoRN
   A==;
X-CSE-ConnectionGUID: tT3Di7AUTnKKAAXgS14bZg==
X-CSE-MsgGUID: hSiOuXUSSOe4gpKtZmK41A==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13925768"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="13925768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:41:33 -0700
X-CSE-ConnectionGUID: BZzVMnL5RcWCcpKzcVOs3w==
X-CSE-MsgGUID: BexCsHAHSTi2YIp+Lx3NEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36312479"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:41:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD6Fm-0000000CXaK-0IEU;
	Fri, 31 May 2024 20:41:22 +0300
Date: Fri, 31 May 2024 20:41:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	corbet@lwn.net, broonie@kernel.org, rdunlap@infradead.org,
	linux-doc@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, davidgow@google.com, dlatypov@google.com
Subject: Re: [PATCH v11 07/11] Documentation: core-api: Add math.h macros and
 functions
Message-ID: <ZloLwasJUEWR-2-L@smile.fi.intel.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171220.1295881-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531171220.1295881-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 31, 2024 at 10:42:20PM +0530, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and difference,
> 32-bit division related macros and functions exported by math.h header
> file.

As long as it renders correctly, fine to me
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



