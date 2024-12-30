Return-Path: <linux-media+bounces-24173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5999FE730
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 15:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 956723A1CEE
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 14:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5DB1AAA0D;
	Mon, 30 Dec 2024 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9zpLxV8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C602525948F
	for <linux-media@vger.kernel.org>; Mon, 30 Dec 2024 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735569278; cv=none; b=iuLwbkF8YHA0A8CM9rWjNy6nVlLp8/UNlLjP9K6l9Jz7pdE6e2xS4TrKAorDRvk5OOOW/OsPskaL4rIJ/9rIjMlAAq96Fd1KayqVxX4M1FoY+TbxRe3mFGEKylmZhAhIN01JH6HwNSTjqzyeE61Cm6Ho+Fg2qqNOTxHznM23SeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735569278; c=relaxed/simple;
	bh=rIntRNnOttznCDMdhQKbsUM6ixES4VV01lYopRVfuYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QYBPs42HxLyD0+cF1vDdZTYohwV2Kp/mPyjwwL077CleU+YJlreulOAnsGWZRpNxYk+uio+OqiCJiz2cPNUFxylHyXhcIIOKVt3WIp9KFmf+4e19to2FAx6ko+1sTWjivu0Yoy4FaTtAbx1PCFPXEevh2DiSs1JhWrCa5uQsqgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9zpLxV8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735569276; x=1767105276;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=rIntRNnOttznCDMdhQKbsUM6ixES4VV01lYopRVfuYY=;
  b=E9zpLxV8RrnBFKSY/nd7BTRSir/pMsVhHlpZkta9fWUkYIpTqW5MOl3n
   SS6fh5d59oAv4X//1Ze1oGmA0f2El+S12Z3e4UuKhDLSm1d7d5r766kgU
   wHFqViCfs917nK+uUiWC9+bvE7KMT5vCjDyfivBaVsFo+j717BN1fYYIs
   EUwqKzl7opacm4W2PQyts2fRlLdCCC8wMt6LKnUnELyPvKa7Iw7kTNw2o
   mf8gdgqggVOeNT9ElhpTAZQGbIGyAj+54A4WaG3mICXHuZRr/GGY6mxH+
   9SoqhWOpq8zTQlI3Bbv3jeg3XW8aQOL8FsP34cKZqAhz6Q7/bRvsPttx6
   g==;
X-CSE-ConnectionGUID: bLKCrZMwRd2JryuC41FPNw==
X-CSE-MsgGUID: G9u/anafRpCjdPcFx7dhGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35733557"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="35733557"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 06:34:35 -0800
X-CSE-ConnectionGUID: FJ3NU2bBQZSUHTjLGYF+WQ==
X-CSE-MsgGUID: u/MPyJTBTaO5249o6yYdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="101312298"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.167])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 06:34:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2] media: cec: include linux/debugfs.h and
 linux/seq_file.h where needed
In-Reply-To: <20241217100024.1858704-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241217100024.1858704-1-jani.nikula@intel.com>
Date: Mon, 30 Dec 2024 16:34:30 +0200
Message-ID: <871pxpp7d5.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 17 Dec 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Having cec.h include linux/debugfs.h leads to all users of all cec
> headers include and depend on debugfs.h and its dependencies for no
> reason. Drop the include from cec.h, and include debugfs.h and
> seq_file.h where needed.
>
> Sort all the modified include lists while at it.
>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Ping?

>
> ---
>
> v2: Rebase, update cec-pin-error-inj.c and cec-gpio.c too
>
> Depends on commit ae19ba915eb7 ("drm/i915/display: include
> media/cec-notifier.h and linux/debugfs.h where needed") in v6.13-rc1
> ---
>  drivers/media/cec/core/cec-adap.c              | 5 +++--
>  drivers/media/cec/core/cec-core.c              | 5 +++--
>  drivers/media/cec/core/cec-pin-error-inj.c     | 3 ++-
>  drivers/media/cec/core/cec-pin.c               | 3 ++-
>  drivers/media/cec/platform/cec-gpio/cec-gpio.c | 7 ++++---
>  include/media/cec.h                            | 1 -
>  6 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index c7d36010c890..ba6828ef540e 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -7,12 +7,13 @@
>  
>  #include <linux/errno.h>
>  #include <linux/init.h>
> -#include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/kmod.h>
>  #include <linux/ktime.h>
> -#include <linux/slab.h>
>  #include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  
> diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
> index ca0db8d457b4..e10bd588a586 100644
> --- a/drivers/media/cec/core/cec-core.c
> +++ b/drivers/media/cec/core/cec-core.c
> @@ -5,13 +5,14 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/errno.h>
>  #include <linux/init.h>
> -#include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/kmod.h>
> -#include <linux/slab.h>
>  #include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  
> diff --git a/drivers/media/cec/core/cec-pin-error-inj.c b/drivers/media/cec/core/cec-pin-error-inj.c
> index fc0968b9d40e..6e61a04b8168 100644
> --- a/drivers/media/cec/core/cec-pin-error-inj.c
> +++ b/drivers/media/cec/core/cec-pin-error-inj.c
> @@ -4,8 +4,9 @@
>   */
>  
>  #include <linux/delay.h>
> -#include <linux/slab.h>
>  #include <linux/sched/types.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
>  
>  #include <media/cec-pin.h>
>  #include "cec-pin-priv.h"
> diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
> index 330d5d5d86ab..a70451d99ebc 100644
> --- a/drivers/media/cec/core/cec-pin.c
> +++ b/drivers/media/cec/core/cec-pin.c
> @@ -4,8 +4,9 @@
>   */
>  
>  #include <linux/delay.h>
> -#include <linux/slab.h>
>  #include <linux/sched/types.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
>  
>  #include <media/cec-pin.h>
>  #include "cec-pin-priv.h"
> diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
> index cf64e8871fe5..50cdc557c943 100644
> --- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
> +++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
> @@ -3,11 +3,12 @@
>   * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> -#include <linux/module.h>
> -#include <linux/interrupt.h>
>  #include <linux/delay.h>
> -#include <linux/platform_device.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
>  #include <media/cec-notifier.h>
>  #include <media/cec-pin.h>
>  
> diff --git a/include/media/cec.h b/include/media/cec.h
> index 16b412b3131b..0c8e86115b6f 100644
> --- a/include/media/cec.h
> +++ b/include/media/cec.h
> @@ -10,7 +10,6 @@
>  
>  #include <linux/poll.h>
>  #include <linux/fs.h>
> -#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/cdev.h>
>  #include <linux/kthread.h>

-- 
Jani Nikula, Intel

