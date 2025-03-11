Return-Path: <linux-media+bounces-27993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7202A5B94A
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 07:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D29B1895B14
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 06:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205F21EEA23;
	Tue, 11 Mar 2025 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIge++I7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0C13C3C2;
	Tue, 11 Mar 2025 06:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741674681; cv=none; b=QxgCzNxzAmZfncMpWAWenbAI7S9qjB9ItAGNLV8ilN9Kj/lCME603hf5nrYb4GIBTZeZPM/2hXmQ/y+kGOlLnS1X4Eh8vmlAVfd4M+H4qXvdeo7aM687zKpI9Volr2AR4if13W0usgDJhtMKlsDUg/RTa4UGqSrPXwcgIf57WmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741674681; c=relaxed/simple;
	bh=Tj6GRwAfc4276fmxJMe1e6qdfR2/bWQdVsM+NYtPXxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnDzX5gnAszCXqoZOE7axd8fASk5kqtM7Uk7JUyQjDKJvDPtMaXgVW+UYOp/LlX2r9xf7jO9n9bsrm9GF7BCfotjwenCA29NQE/0eHBWrO7pXXfp4wKojOM2xSKNYtVeVNMfH74ZJSYkLHBeLwny0lfRy/4G4aI9TDgGZ8BzChw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIge++I7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741674679; x=1773210679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tj6GRwAfc4276fmxJMe1e6qdfR2/bWQdVsM+NYtPXxI=;
  b=YIge++I74jyYIF07LU26r58pD+QbJq7orvgQm3SFnGLBquxfw9J0GrDA
   4jYhu2QsUZ+MYS/AqJWmO4RmwffOc99VCCbtEIHaDlLzuUI6347VGlRt2
   WtoKM2Yuug87iB6xZCR61J1VvqD25S3wh0v3qqrFlz7vPc0kdTM9eOi4F
   ZbgeXt4e0HMwo3M6s3XStYN6yKwZ+Weip7lW+QvFiuOpRz4FXog3OhEKf
   TBT9yxrCiWbqxgBWvIEuqT1ez4b7ScXIBoWrAWA2ie/nEs2OS2W1QPIlu
   n5F/x9VeKy7H7UbeKQ/S8cTAN0u9qngufRE7+NsuZNFaALUrcP6b5rY7A
   A==;
X-CSE-ConnectionGUID: G/aDEKh7QH6W0e/sD2xFyw==
X-CSE-MsgGUID: MST9BcSvTCuuWXqerr8FXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42913383"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42913383"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 23:31:19 -0700
X-CSE-ConnectionGUID: cB+tA5cBRIap1jIur1Lk2Q==
X-CSE-MsgGUID: yR8qKjGkTCWzOnhD/4z1Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="119950963"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 23:31:16 -0700
Date: Tue, 11 Mar 2025 08:31:12 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: eugen.hristev@linaro.org, mchehab@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, andriy.shevchenko@linux.intel.com,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Convert media drivers to use devm_kmemdup_array()
Message-ID: <Z8_YsIMCJ0zirqN1@black.fi.intel.com>
References: <20250228073649.152157-1-raag.jadav@intel.com>
 <Z86KeDfg9GwFBpGQ@black.fi.intel.com>
 <Z87ExUkOnaHpfxfE@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z87ExUkOnaHpfxfE@kekkonen.localdomain>

On Mon, Mar 10, 2025 at 10:53:57AM +0000, Sakari Ailus wrote:
> Hi Raag,
> 
> On Mon, Mar 10, 2025 at 08:45:12AM +0200, Raag Jadav wrote:
> > On Fri, Feb 28, 2025 at 01:06:47PM +0530, Raag Jadav wrote:
> > > This series converts media drivers to use the newly introduced[1]
> > > devm_kmemdup_array() helper. This depends on changes available on
> > > immutable tag[2].
> > > 
> > > [1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com
> > > [2] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com
> > 
> > Bump, anything I can do to move this forward?
> 
> The patches these depend on (those adding devm_kmemdup_array()) aren't in
> the Media tree yet. They don't seem urgent though so I'd just wait.

I was hoping the immutable tag would be useful here. But sure, no problem.

> Speaking of the patches themselves: I'd use *array instead of array[0] for
> sizeof argument.

I know it doesn't matter much to the compiler but since the source itself
is an array here, doesn't [0] make more sense?

Raag

