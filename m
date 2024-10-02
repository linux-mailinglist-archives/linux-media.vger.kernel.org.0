Return-Path: <linux-media+bounces-18980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B398D019
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8ACA1C217E0
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C311A2875;
	Wed,  2 Oct 2024 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/jfdI26"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83B7195FEC;
	Wed,  2 Oct 2024 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861220; cv=none; b=nm2TjrIYuYrf0n0DEW3B1A368G7uiTGSybzoB1WKGsOj24tuPe0Gh1h39EJkznnOz8ogwvg8Hu6CFADSHYDLbvGcNJPzx5OYYmWZyFgWm3atDZFTEUrtXyd/NS90ecDdZkb4CVxtbNpnw4rKvkOSOokoQ2+9o6SXfK+PyI5w82Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861220; c=relaxed/simple;
	bh=x2Lea59cyav6s4rmBPsAfXbrLXjdvVugkrjeXsbGoM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CBTWxS65i9C/0icRBjSPEiZoZ9Yz0GWQ0g9mbj8SKHaIqg9g6V41XkUsI/TNxF+8kJk5tCNr4KtlyubJzmbsIfTnU6NFp4yeInMjot3ALFqUIuixWa3QFOfEERGr1rrf5YwmxZSNoqf9sjX/4JKXEIL59L5oSrNImJUE6B0ypnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/jfdI26; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727861219; x=1759397219;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=x2Lea59cyav6s4rmBPsAfXbrLXjdvVugkrjeXsbGoM0=;
  b=M/jfdI266yA4sL4Ta4ATC11UoctgXRoMlUqd2mjQvjORzptKVrDK1RMR
   +OrqQiAAdVwxnbrjlQ9NNCb89LzyTyr+TpfHWuVmtdyqgZo5yhwLLxzbi
   EIxjbvyX/08fiBiXeO1gGP8f7CQ9w+qXSviqPEmDNkctJcpeVcYSp5TLq
   3jCbvzu1ZmB0t+1r8NRZ63mfICgTtGbays7nLbwV4ZkzmU3OpaH8uhw+H
   rAE8UKia+qUr4IZEGh1/fo5yZRdHYJTjVGjNth+5EUbR0bp7/9WpkCwV4
   1NPYe7GmXwjty/fTTZjUquHoKuqT7+5wBQ33jflydTo5zocBrN2UACdks
   A==;
X-CSE-ConnectionGUID: JqgAr/MnTvObFIDjjTA7DA==
X-CSE-MsgGUID: OlDZyG3DRaqsww6Kq/0ShA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27111938"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="27111938"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:26:58 -0700
X-CSE-ConnectionGUID: pQ2E3cIVQYGGnj+wNhQSJA==
X-CSE-MsgGUID: XK7Z7LLWTPWKx/kgKAUymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="104744897"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.49])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:26:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, =?utf-8?Q?Adri=C3=A1n?=
 Larumbe
 <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 0/5] Support fdinfo runtime and memory stats on Panthor
In-Reply-To: <20241002105715.18ec024c@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
 <20241002105715.18ec024c@collabora.com>
Date: Wed, 02 Oct 2024 12:26:49 +0300
Message-ID: <877caqvorq.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 02 Oct 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> Queued to drm-misc-next after applying the few modifications I
> mentioned. Also added Steve's ack (given on IRC) on the first patch.

Can we have the drm-tip rebuild conflict resolution too, please?

diff --cc drivers/gpu/drm/panthor/panthor_drv.c
index c520f156e2d7,f9b93f84d611..000000000000
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@@ -1383,7 -1476,7 +1476,11 @@@ static const struct file_operations pan
        .read = drm_read,
        .llseek = noop_llseek,
        .mmap = panthor_mmap,
++<<<<<<< HEAD
 +      .fop_flags = FOP_UNSIGNED_OFFSET,
++=======
+       .show_fdinfo = drm_show_fdinfo,
++>>>>>>> drm-misc/drm-misc-next
  };
  
  #ifdef CONFIG_DEBUG_FS



>
>> 
>>  .../testing/sysfs-driver-panthor-profiling    |  10 +
>>  Documentation/gpu/panthor.rst                 |  46 +++
>>  drivers/gpu/drm/panthor/panthor_devfreq.c     |  18 +-
>>  drivers/gpu/drm/panthor/panthor_device.h      |  36 ++
>>  drivers/gpu/drm/panthor/panthor_drv.c         |  73 ++++
>>  drivers/gpu/drm/panthor/panthor_gem.c         |  12 +
>>  drivers/gpu/drm/panthor/panthor_sched.c       | 384 +++++++++++++++---
>>  drivers/gpu/drm/panthor/panthor_sched.h       |   2 +
>>  8 files changed, 531 insertions(+), 50 deletions(-)
>>  create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profiling
>>  create mode 100644 Documentation/gpu/panthor.rst
>> 
>

-- 
Jani Nikula, Intel

