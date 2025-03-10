Return-Path: <linux-media+bounces-27939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63131A5925F
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC2721889846
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 11:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA527227EB2;
	Mon, 10 Mar 2025 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ0f2W+o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5FB227581;
	Mon, 10 Mar 2025 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741605090; cv=none; b=Gtq4YhrPWeyCnIUtGxICKjIV7BAHObZogo8LkWv8d5StnPJBbBrZ5atj0ieLUokEL19CG6xsoQm/zGnoduHBGBbbe97TO7+AnDkm6kE6cJkHPTAxoRMCbgtABPBWsSvR0KJl1SgaCriTq6EFXXXvv3ZNrJnq5iDkBPw8NU4qbRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741605090; c=relaxed/simple;
	bh=UxOUffZNESsbT7Z8GSqYcfxxCZg7cmpwRMjI71zfCXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTgNNY1U10lLLKKdCqJIQEejzSQbRvKw/TPdoEnFCEjgZhOv/0O0r/+N6sdTnwa723lSJ5jiQfTPKHERs/CUY7xyCNeftN8j4LiOWIwqDurIO6vUMMsov9zMHCGS8u11vjrd7ypuvgWYJCCUgFVf1R+8Hsi4EkKqUc1jiPY3rJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ0f2W+o; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741605089; x=1773141089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UxOUffZNESsbT7Z8GSqYcfxxCZg7cmpwRMjI71zfCXU=;
  b=KQ0f2W+oybCtodNpu8GCcIfn/wRVmgtldIHQnRmjrHAE98ufhCZxZzsf
   Yx88d/FtsOV9kRI8nGbren/4ZxiaqED6UVVghaMywdmuwi4KS/ZuTuRu7
   bLdftLGPqEef36DUqIAqyQCizBzSFF6tfSEXEfQSoWFf1FLa0m5nTR640
   +6QsylhDBiEfvvJxkGjirytYsyJy72lNy+dMvV5/Fp1emnUKfC1nY0uLh
   IdGoDxerNFGSNx9P8l9330RgDYuaZcpgW4dQwOPtF5Z8vbz1PKkAGuPhr
   wD/L2hBCWXZi9cT5omPBTDjVH0rmIENnZFtaN8ZGX4XmY9shwdKYDrYax
   A==;
X-CSE-ConnectionGUID: cfJMhILOTze/KIu9RTA/5g==
X-CSE-MsgGUID: goA/J/jWR1KLeUnKX4daCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42787617"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42787617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 04:11:28 -0700
X-CSE-ConnectionGUID: qJDWkpdYR4WjODFSm7tG8A==
X-CSE-MsgGUID: lkCayGBqTPmjAy8j5OjF3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="120668568"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 04:11:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A323A11F7F0;
	Mon, 10 Mar 2025 13:11:23 +0200 (EET)
Date: Mon, 10 Mar 2025 11:11:23 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/4] media: i2c: imx214: Add support for 23.88MHz
 clock
Message-ID: <Z87I2xh0HY-YD_tZ@kekkonen.localdomain>
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>

Hi André,

On Sat, Mar 08, 2025 at 10:47:54PM +0100, André Apitzsch via B4 Relay wrote:
> The imx214 driver currently supports only a 24MHz external clock. But
> there are devices, like Qualcomm-MSM8916-based phones, which cannot
> provide this frequency. To make the sensor usable by those devices, add
> support for 23.88MHz clock.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
> André Apitzsch (4):
>       media: i2c: imx214: Calculate link bit rate from clock frequency
>       media: i2c: imx214: Prepare for variable clock frequency
>       media: i2c: imx214: Read clock frequency from device tree
>       media: i2c: imx214: Add support for 23.88MHz clock
> 
>  drivers/media/i2c/imx214.c | 188 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 146 insertions(+), 42 deletions(-)

Thanks for the patches.

Do you think the driver could use the CCS PLL calculator? The PLL appears
to be compliant. The AR0234 driver will do the same. (The sensor might just
work with the CCS driver, too, but that's another discussion.)

-- 
Kind regards,

Sakari Ailus

