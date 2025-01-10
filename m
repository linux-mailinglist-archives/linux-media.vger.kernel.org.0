Return-Path: <linux-media+bounces-24574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E7A08994
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F7F8188C680
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 08:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F9F207A2B;
	Fri, 10 Jan 2025 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfWDMX48"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C617133987;
	Fri, 10 Jan 2025 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496635; cv=none; b=URvrFYlFNzXEkA2kpmG/H18s5qmMRYQg5kNdJfRPO/LJ5fY/6ahlfMACgmpoQdyWnTgHFEcu1CPRi1meoMe0G4ej1RJVIcWZz61SI9XmFbnFOfVE+9rl8iaoSW1p0dPY6KGfwFFjrvkD/E0hS4O9QRSEvAgw5O4xw1eDdQ2aHPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496635; c=relaxed/simple;
	bh=u0SlY39EHudaIchSfeH9EDK+XhR46+IbBeM2GLNudWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dd40ly8R16vLEb5LC6556nZ6ou5bDyRSvcdYZkNMiBrHOOtOW4M/AQ9SNFlbnjks5Lld41vHRFXLQTU0501r2UAQRNsNLRN9o+9KczKZB3BlkiIA9aN9DT6yePhNm4tmq3R5t30zp+tuKyPteWSRg9HhAEe30/QRr3FKC8zNVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfWDMX48; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736496634; x=1768032634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u0SlY39EHudaIchSfeH9EDK+XhR46+IbBeM2GLNudWc=;
  b=DfWDMX4848ca10+i66lWVNuRe31S0yt2FUyhrCQFrfN9XM04W4HG0pl6
   P8miHlWVFUxBbcL/+2hQxNtqeCkl5UjPLLQKE96iVFAg7Tr2rooQAx5/G
   WRevoUBObR4pyqjOZ5sS+Ei1BVuI4rpFaCFFKzoIVue+4jzUZVSDA+gm6
   Xl3EKwWmE2CzmHy8HhRY2k7rDKXlmOZ8Cg8v8TV82KDAnwpbzafHvjIAW
   MU3cuv0C7jKcBaBPrNTR+4q4keDI/EJfM8vcECiKc6F5YmSn1nb8P/B/Q
   B8WjiQh/LWeijb2hiMJW9xYY4KcX3XYP9hWgNaK82a3Nh1WTU+WKkb9DI
   g==;
X-CSE-ConnectionGUID: gO7C2tdfRR+LeIpc5+h6oQ==
X-CSE-MsgGUID: xCrBjnMlTQm5J748OG18KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36471691"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36471691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:10:33 -0800
X-CSE-ConnectionGUID: i7ifN1BaQc2OMi34W+qoTA==
X-CSE-MsgGUID: WYJk5AcTQVGQibvApw/qYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134566256"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:10:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 91FA511F89A;
	Fri, 10 Jan 2025 10:10:27 +0200 (EET)
Date: Fri, 10 Jan 2025 08:10:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/8] media: stm32: csi / dcmipp corrections
Message-ID: <Z4DV8zVqQf9Bl0X5@kekkonen.localdomain>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
 <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>

On Fri, Jan 10, 2025 at 08:08:47AM +0000, Sakari Ailus wrote:
> Hi Alain,
> 
> On Wed, Jan 08, 2025 at 02:16:03PM +0100, Alain Volmat wrote:
> > Various fixes within the stm32 csi bindings/drivers and
> > stm32 dcmipp driver.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Thanks for the update. I tried to apply this but it doesn't, and the
> culprit appears to be this line in dcmipp_graph_notify_bound():
> 
> 	unsigned int ret;
> 
> That appears to be a bug as such. The interesting thing is that the patch
> changing things around it presumes
> 
> 	int ret;
> 
> so it won't apply. Do you already have a patch that fixes it? It should be
> cc'd to stable, too, with a Fixes: tag.

Ok, the tag isn't necessary as there lack of the sign doesn't seem to
matter in this case.

-- 
Sakari Ailus

