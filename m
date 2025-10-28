Return-Path: <linux-media+bounces-45838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA2EC1589F
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD081B2648C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 15:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEC1225416;
	Tue, 28 Oct 2025 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJ+K8PfR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7333DEFF;
	Tue, 28 Oct 2025 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665943; cv=none; b=XwMS1MGhygs5LpHFjA155l0XeSvkFlRR3fSOvVKXCywtlei0p93iArPNWnomzuERF27ss8U1+iMmyULWR3IrI5DK89r3doyrGkCTe63ATVH9PqzxZrH4oWQ275Htct+0Gw0k9WxJhyQTl6D6eRKKffyFeiqJdCRZ5olxu+g9x0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665943; c=relaxed/simple;
	bh=uNq4/grTUoOn7xuEYoyJcMwb3W0Znfn1AyShE67IVy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN5m6IMDyixsXFiXRB/BvK2rGS7NrG64RBUW5Mui/ElX8QsAqrJPEYp53K6R8H0B6mMaiPC47KuE5JPtRhkmWfBAVhguQAXciFB5rpmIlP/Tvq8WzWv4PrrT/sWgdknUyGJTd9u0fyL3/CrYDLVK/hZ1cOROlyA7HgbtOZVK1vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJ+K8PfR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761665941; x=1793201941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uNq4/grTUoOn7xuEYoyJcMwb3W0Znfn1AyShE67IVy4=;
  b=HJ+K8PfR3QTMlZxBiUqG+2uUhlaSNJ122RnGI+88cR2NPmGaHVIV9RZd
   2A6Md3wPseUBdYOSsVrpqs2eXsMCF+Zi8EJulGCF8bYwsAxR5UgEqYUB0
   y3uQnJ5/JR6kEbOdYjzg9aOX25nNzGIZW9z83WpxY5P5QHgAXQKTpAEMM
   y9Zf22YSUkeVhjP7AnszryCNhbAahZjAIqj43kXY+R/EHDMv5DHc8HcBu
   fXgv0x2UUvPRHY5jRSM9xcp7OAZKoFxLAtUI0Gqy3SogAeV2HHVzfdwYK
   8wzLwHh+QXJfLaSwPJ5YoBBmpEgqTjZX+lffUeDIEts0BdNCPQ6mE9B3o
   Q==;
X-CSE-ConnectionGUID: qlomovmLTnGVdTLDpqHa9Q==
X-CSE-MsgGUID: TByw1hyzQlqCx3NzwljftA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66385655"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="66385655"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 08:39:00 -0700
X-CSE-ConnectionGUID: tb7h1PexQ6mCT9VPFQnUIg==
X-CSE-MsgGUID: bbGztI/0S5GHYGh3e0mPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="186128533"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 08:38:59 -0700
Date: Tue, 28 Oct 2025 16:38:52 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 06/25] media: i2c: ov01a10: Fix test-pattern disabling
Message-ID: <jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-7-hansg@kernel.org>
 <rywqbh2ku7aexskohujwsiv7yzgn7lipgdqol3rqtkcvqrmn3q@c6oe7wc45hti>
 <8718bd8e-12b0-4c4e-9155-7e394f0d5a16@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8718bd8e-12b0-4c4e-9155-7e394f0d5a16@kernel.org>

Hi Hans,

On Tue, Oct 28, 2025 at 03:38:28PM +0100, Hans de Goede wrote:
> Hi Mehdi,
> 
> Thank you for all the reviews and testing.
> 
> On 28-Oct-25 1:08 PM, Mehdi Djait wrote:
> > Hi Hans,
> > 
> > Thank you for the patches!
> > 
> > On Tue, Oct 14, 2025 at 07:40:14PM +0200, Hans de Goede wrote:
> >> When the test-pattern control gets set to 0 (Disabled) 0 should be written
> >> to the test-pattern register, rather then doing nothing.
> >>
> > 
> > A small question: Do you see any difference between test_pattern 1 and
> > test_pattern 2 or I did not look hard enough at the screen ?
> 
> IIRC the one has the colors fading (a bit) from left to right and
> the other from top to bottom ?

I see:
1 and 2 are the same ?!
3 fading from left -> right
4 fading from top  ->  bottom

--
Kind Regards
Mehdi Djait

