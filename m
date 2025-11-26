Return-Path: <linux-media+bounces-47765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED063C8AACB
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 16:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2A714ECF83
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A6633A6E6;
	Wed, 26 Nov 2025 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exZ223Hw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6119D33A003;
	Wed, 26 Nov 2025 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171264; cv=none; b=p3IqjZWFGz86o9tv8L07/uSlnNY2mn9rVbGsP8HaPUUaru1L98KF0Cr72bwC03EK+oXds8Wk3AqmEckGWBXphTQFQAbOTC9RTkt+ojLn5+b9CyppfQX/CELs/hBxCF4NxMkXtYJwidB4+f3w7TXGhi1WbQIO0pw0X9xAdaXgIyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171264; c=relaxed/simple;
	bh=CCug/MBOMnHF2yMXUk/0NXt665eJWKaxeq4tP0rPVE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6FdwLqCKGTUEyqys+D6pXTGN7JUo8z06NYVwZ+Wr4N6wvcIRAqiAt2YXW24XWlzBuf5XyMKF4x9UT4WkkKRWrsVoAZUb2rb/2yl1lQuGPGzDd7Q2nuERLPrr1K5E0BJKFK1jM/Oqu8ls2FqfqrCH1WMQqLBgRV+w7S3enTFHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exZ223Hw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764171262; x=1795707262;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CCug/MBOMnHF2yMXUk/0NXt665eJWKaxeq4tP0rPVE8=;
  b=exZ223Hw07yNJKukwCw8799oJHdPUHOJYvfveCujWvi+gp9uReBfnq+b
   dZKyeyUrEGsqEGYPtAXrrDC5dFGOFSOR4O7qKgroFA33LIUiv4Xhyl0aY
   0GaDPLiHneRIAlzkwylCN91BeHf4EsPjkpvqrWt4jnEZJysStiQaOJ7UW
   0ZYbVZrKnbd1kO5lfOtXE52QB4VXBbhtZK9hhj8H7lL5PpH5U3b6tWcfY
   9rS8dXahEoygFwxKVDgiu7Yh46ppN9kKEnQK1SvHu8DdSUpGpeVdLEf+N
   L7q4K/nIIo8JIl1u8Vu0yiHT23rR7WlFV5H8c0XzPWpFtSfHX21911t/2
   g==;
X-CSE-ConnectionGUID: o+MIKUsxSRO9shnV9ssikA==
X-CSE-MsgGUID: KoG/9HDuSXS54YqHxEOIVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77684742"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="77684742"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:34:21 -0800
X-CSE-ConnectionGUID: scrlhLSzSdSsZostakmPdA==
X-CSE-MsgGUID: By7fM+D4Ska02rjESYC85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216326569"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.178]) ([10.245.245.178])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:34:19 -0800
Message-ID: <7346d42b-3ad7-4170-900f-73d8ed356f71@linux.intel.com>
Date: Wed, 26 Nov 2025 16:34:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/28] drm/ttm: rework pipelined eviction fence
 handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
 <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey,

Den 2025-11-21 kl. 16:12, skrev Christian König:
> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>> Until now ttm stored a single pipelined eviction fence which means
>> drivers had to use a single entity for these evictions.
>>
>> To lift this requirement, this commit allows up to 8 entities to
>> be used.
>>
>> Ideally a dma_resv object would have been used as a container of
>> the eviction fences, but the locking rules makes it complex.
>> dma_resv all have the same ww_class, which means "Attempting to
>> lock more mutexes after ww_acquire_done." is an error.
>>
>> One alternative considered was to introduced a 2nd ww_class for
>> specific resv to hold a single "transient" lock (= the resv lock
>> would only be held for a short period, without taking any other
>> locks).
>>
>> The other option, is to statically reserve a fence array, and
>> extend the existing code to deal with N fences, instead of 1.
>>
>> The driver is still responsible to reserve the correct number
>> of fence slots.
>>
>> ---
>> v2:
>> - simplified code
>> - dropped n_fences
>> - name changes
>> v3: use ttm_resource_manager_cleanup
>> ---
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Going to push separately to drm-misc-next on Monday.
> 
Pushing this broke drm-tip, the amd driver fails to build, as it's not using the eviction_fences array.

Kind regards,
~Maarten Lankhorst

