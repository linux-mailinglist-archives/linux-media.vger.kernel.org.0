Return-Path: <linux-media+bounces-34571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E7AD67F2
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 374563ADDCC
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 06:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181B11F0E2E;
	Thu, 12 Jun 2025 06:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPpp/nZF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3141E25F2;
	Thu, 12 Jun 2025 06:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749709472; cv=none; b=pB+APXxYzlQGi/vBDGZQpbJZugw46a42y/PDUlaChiIZWq+ilCGc+Y/g0hvWK6U2OLnGURttyzFl3cVo1dw6v8mjaVWfoftDnPsuvrHhjWfJlkxZPipFaeNZ5utB/guLPIZ6cEtBowIrAa54UObUx2zAY+QYC02TdVT2NUtXm5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749709472; c=relaxed/simple;
	bh=OgD5PfJ7RkF4cltRjCNted+cVCACXZ3aGl6DSN+4esU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdwNQ9IM8tK0TJ7y56uMJRqdMnz23kU6IYQV4nhxrQ4H2+CPzY+u+wZeXdZ/WMSHYH1RO8OCe/hAYLYh7T6U/pVYVJXlTLV2pgcgTVIvwu6fD8fhm+OHmmnCtwv8/zePWw8kqQXMhafnk082qL+VYMtdWvM5ryNMlqgGXsov8wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPpp/nZF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749709461; x=1781245461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OgD5PfJ7RkF4cltRjCNted+cVCACXZ3aGl6DSN+4esU=;
  b=NPpp/nZFQJXlp7ppGnGJyta5Bg7Oy0agWJJYbq2qMJRdpNronh+Tkzwz
   Clph4M51AJoezEFNeWlyat1TZ0CLY2xxTYWnj6CLffDfHSNeCaorBs3kY
   vfiUhJIzkprdmuu3TJb5cHm7KpLBbtbfW/Bds2mXlfidRwmFxU1qAVHHw
   /4Gj4Iez4ETCV50i06jj5s9KxDoKZL6mKKufZdZejBy/mFl8IMTWnumwF
   gmcWmNGjN9VRe4Kkr4n/vvUnBh415+Z4X3Z13NHHQJuHzvL3azd1N6Kmg
   7yruNuJj6BE0oYHV8YAy+zbUnLS5hREaejM24EckV04jHlR6vqeh9/gfA
   w==;
X-CSE-ConnectionGUID: fRzzeF5GTKir5gXcZ7/NKA==
X-CSE-MsgGUID: tufYOHFJQxW+ldlN+AqpCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63282559"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="63282559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:24:20 -0700
X-CSE-ConnectionGUID: 08ANS45JSiGmB5hVd8pfRA==
X-CSE-MsgGUID: L0T30c5mR8+S1pxFhHA26w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152190013"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:24:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9628111FBC0;
	Thu, 12 Jun 2025 09:24:16 +0300 (EEST)
Date: Thu, 12 Jun 2025 06:24:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: i2c: vd55g1: Fix RATE macros not being
 expressed in bps
Message-ID: <aEpykCRKpJ9pA9sN@kekkonen.localdomain>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
 <20250609-fix_vd55g1-v1-1-594f1134e3fb@foss.st.com>
 <aEf0gdJ0hA2dNQoH@kekkonen.localdomain>
 <e080a28c-9ec7-46bd-8bcd-49b48bd9ab94@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e080a28c-9ec7-46bd-8bcd-49b48bd9ab94@foss.st.com>

On Tue, Jun 10, 2025 at 11:31:09AM +0200, Benjamin Mugnier wrote:
> On 6/10/25 11:01, Sakari Ailus wrote:
> > On Mon, Jun 09, 2025 at 03:46:21PM +0200, Benjamin Mugnier wrote:
> >> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >> ---
> >>  drivers/media/i2c/vd55g1.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> >> index 25e2fc88a0367bf6a28bb22d209323ace99299f2..78dd22d9cab03edf4ff3e5a301f8d045e930c997 100644
> >> --- a/drivers/media/i2c/vd55g1.c
> >> +++ b/drivers/media/i2c/vd55g1.c
> >> @@ -129,8 +129,8 @@
> >>  #define VD55G1_FWPATCH_REVISION_MINOR			9
> >>  #define VD55G1_XCLK_FREQ_MIN				(6 * HZ_PER_MHZ)
> >>  #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
> >> -#define VD55G1_MIPI_RATE_MIN				(250 * HZ_PER_MHZ)
> >> -#define VD55G1_MIPI_RATE_MAX				(1200 * HZ_PER_MHZ)
> >> +#define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
> >> +#define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
> > 
> > As the meaning of Hz is just /s, I don't think the use of HZ_PER_MHZ was
> > wrong in any way above.
> > 
> 
> Should I just drop this patch then ?

Up to you.

-- 
Sakari Ailus

