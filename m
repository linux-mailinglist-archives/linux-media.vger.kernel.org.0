Return-Path: <linux-media+bounces-17225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB092965E01
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 12:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79AF91F226DF
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 10:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40BE17B510;
	Fri, 30 Aug 2024 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9rR7XLv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE214C5A4
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012591; cv=none; b=t0uhqxOU6HeUxg4c7DCte/dr0BQW/kEyhQUM60kAnS80SDNt4BZGBJ5/XwqD9qJ+0UFk7CbLPoGUVM48UeUiOYSc01ZOaVfgMrQERYxYqozU73Eqje2+34owcGuWtFKFrSjnh2y8IRg2AHqsru3YlfWS3scwU8/VFOYMQZhQz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012591; c=relaxed/simple;
	bh=FzMa+eg/u0N2bA81VF6JqGFTQMH4Pfg9V/uEtl8jY1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQmYjLhIKGFlgPwaSzOqecrXQOPF2/s0mR7yh3mBycSFBycelB80TFMl4gGRoEUkbkM68gU+R77sN4iinVdtuPwWkfQrbmEIjygn1F3G0NO5Pau/fFT108VlfYpjS0Q6h33BvG2P5nnSR4CUdfqn+A4kSKXEJhIDPEYE4pkmULQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9rR7XLv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012590; x=1756548590;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FzMa+eg/u0N2bA81VF6JqGFTQMH4Pfg9V/uEtl8jY1A=;
  b=N9rR7XLvOcPtpKVQcU9ZBVtmw+Ik177RfFDMWCXVfZyPagiIyK1S6qWq
   mrqj7VzQCLys/2WAdly7TNSzBgzen9iaUYLDk3RvXAVTZwQgGFMlWSsLB
   xzbTsRbLWWA5G9h9FShdQ1pw1HhEuY1JoX2QydLgXJZ7bu9IPeWJ/oh2u
   O5cxQo9aKUjRNs8IhKVXInEdiBJGVkrLSp4xDnXS0p876c1VoQde3hKVy
   ChMW54mJUAfIz/pvOM0CivmNVp1/ZBR8hha5G0Ce73ay4kvlKFTkNTtOo
   nKhXERLPyeBe0/eWI+5fRrY8h4QgqNyzr+swBejjlOrmkxUGVMIlzJGWH
   Q==;
X-CSE-ConnectionGUID: DbSX9Mq3S0qVYeLNfvw68Q==
X-CSE-MsgGUID: HnG+SB4yTACtJxvWdcX8iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34807946"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34807946"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:09:49 -0700
X-CSE-ConnectionGUID: 67tJoTq6SES1jZ0EDqxrAg==
X-CSE-MsgGUID: 63oM2osqQhmr/2HRT7N4kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64200927"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.161]) ([10.245.245.161])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:09:46 -0700
Message-ID: <f1ee5ce0-39dc-4c1d-a587-7326df879dee@intel.com>
Date: Fri, 30 Aug 2024 11:09:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Invalidate media_gt TLBs in PT code
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
References: <20240826170144.2492062-1-matthew.brost@intel.com>
 <20240826170144.2492062-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240826170144.2492062-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/2024 18:01, Matthew Brost wrote:
> Testing on LNL has shown media GT's TLBs need to be invalidated via the
> GuC, update PT code appropriately.
> 
> v2:
>   - Do dma_fence_get before first call of invalidation_fence_init (Himal)
>   - No need to check for valid chain fence (Himal)
> v3:
>   - Use dma-fence-array
> 
> Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

