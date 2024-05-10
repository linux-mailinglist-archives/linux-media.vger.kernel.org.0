Return-Path: <linux-media+bounces-11341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D00AC8C2847
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CCE8B25837
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8B6172764;
	Fri, 10 May 2024 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3EJexqL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32912C49A;
	Fri, 10 May 2024 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356527; cv=none; b=E9XzjwaHQPpL2IYy2a/vL4GtVkojul3kyFOxSw/nbjJTeNHD9MxKf96jpzWlXI9Hzstg4vXTj+syJck0avliYUqvyyv00gJhU2pxPMgkMAlyBjH2k1TjHzCivOBvJTmvDYnvBm4ybwPBlXHwoo6jn7dcC404scLXaHL+RWemn5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356527; c=relaxed/simple;
	bh=j+PEZx8467CAXDutqvKyg1G+wTPrUXhPSpI3yRUttds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NI4+5FUgG5psGjQ4QWdi1KbMlB9/tLYBbBqlMASmjA8JvqUqq6EuUQkQePRqgNODwa3pth058ecyrNzV8w6raDAp/8K4kIGgarv+K+//x3boItegJy1mTP1r6lcJtLzA+TzFAYFWoocbb+hbrr36FAEmSSD+oIK0/yYUUpF5XYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3EJexqL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715356526; x=1746892526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j+PEZx8467CAXDutqvKyg1G+wTPrUXhPSpI3yRUttds=;
  b=a3EJexqLq9CD85OUp8dGYNvQUSFs7yaVCTv2JhFAhWRTcYLYj6PDSkh5
   r9HRGGGLEzUOG3ytgk0aleoI05KBlqk7KJnTWz1O6Y9Wsp3LsB8wvCO0l
   zQFBwp7qgHewerXiBASSAraBKwMHzRRFh1v/xf+evOwuLFbzZXlguZMVY
   62O6we5WqvCq9ndEgzAsXosCyCHYWXlg2hAQXYt+EWmmT7+qeW+DqZzFt
   O+t2MCUzhGrqXh/nbZZl/r7bSJTXINET+PLHU36yuAksOXQTH0kn97WGa
   C73fZkk9ttaKW52Ls//h2pPFgolHcuDyVDt9Brvxr3rsShSiOd3gCYUHv
   w==;
X-CSE-ConnectionGUID: Ay0D0ftWT4Stikvob9tD9w==
X-CSE-MsgGUID: O0V4t7U2TheHwv2J9t1w0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15156304"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="15156304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:55:25 -0700
X-CSE-ConnectionGUID: whxk1HeLTWmDvmtnEXGwlQ==
X-CSE-MsgGUID: eJFq66uXTs2bxZHOT4FK7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="52869228"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:55:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5Sae-000000069Ys-0KtG;
	Fri, 10 May 2024 18:55:20 +0300
Date: Fri, 10 May 2024 18:55:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <Zj5DZ4ORVfeCZSsV@smile.fi.intel.com>
References: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 06:43:31PM +0300, Dan Carpenter wrote:
> Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.

LGTM, but I leave the main Q "Is it really the error case?" to the maintainers.
I would imagine the use case where either from the following may happen:
1) the sensors are all new and not listed as supported;
2) there no sensors connected for real.

In both cases I don't see this as a critical error that we can't enumerate
the bridge itself.

-- 
With Best Regards,
Andy Shevchenko



