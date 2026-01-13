Return-Path: <linux-media+bounces-50492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE309D16603
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 03:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D132430365BF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 02:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587802F532C;
	Tue, 13 Jan 2026 02:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQeL3ZiN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF92E8B8B
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768272788; cv=none; b=cCJ79wzPV/N+yrvfNGQBvlSiy1MFGFikAbwxEWvHKNID8+VCTvm4UCxGY69JBPlIQyTk4AoEuKGrZsBrgQ1hRg7dmyA03X+v0D0L37HT3ObLcsX8+Ey2EbRFhISTVAfAHlE/xh1dsC7DFcc/DwP5PLWfrA4B8aiia+vbt/JClvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768272788; c=relaxed/simple;
	bh=HbQeUrjle4nTCdI4K/iMlg2AeOsiSsrkfRV4IeVee5U=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uwKygWm0vPKbmzhQDcYuUH9JLm6/0CqDWTxiBXQQP2ZP6iXjdRpMoYAjAlWVKyvn3A+Jnox0qhXLP4l6m2W5VSUn6pSf4OZ1yXgXO6v0RTo7yQfjZ1hrJYuQm1gwgOYsNHNNYqIsEhpz985VzHX5VPv7JQr6dy5BJ50H4nd+jCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQeL3ZiN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768272787; x=1799808787;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=HbQeUrjle4nTCdI4K/iMlg2AeOsiSsrkfRV4IeVee5U=;
  b=AQeL3ZiNB4nTAehA7ZdorABKgbTIfJgCL6u8Qu62MIZhm3u70HPiKha5
   5exZYcJ7vInhYI+719g4Kh57Bi1lGnBXWUrc4QRM1hppAgwhD6id7TNSw
   SB2kNt2Pms3M29ZKmKL8XK+SqPqsVQlPJOjwQLdOSuAglqDDzZbgMgHsm
   EPAbojmneMvsmvQVjKDX+BbDxNxq8CylZ+h3g5MjlVTcM7j8e9IMIuyxw
   ZiLAPzOJfT80McKu+CGlmnan5C981Bs0VOowdgQ4PeGR0Rz+bVkqbSMCD
   YGsEnFfhPgGize27IROrm22Bx3dPc8K8IsPIcrB0JPV1e1oYbib6y59qI
   w==;
X-CSE-ConnectionGUID: 55t0wusjQdaWiH+JV2Hdtw==
X-CSE-MsgGUID: HwlxUmHrSFG3YOFsjtjOnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80197557"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80197557"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 18:53:07 -0800
X-CSE-ConnectionGUID: mSsVHRAQSvK60JhqPXVWTQ==
X-CSE-MsgGUID: QHIlQNy8QXKctvgV36pFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208776003"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 18:53:05 -0800
Subject: Re: [PATCH v2 02/23] media: i2c: ov01a10: Fix reported pixel-rate
 value
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>, Hans de Goede <hansg@kernel.org>,
 mehdi.djait@intel.com
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
 <20260112095949.3851-3-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d82ec41e-55c0-2175-6317-c8b2efcef21c@linux.intel.com>
Date: Tue, 13 Jan 2026 10:43:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260112095949.3851-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/12/26 5:59 PM, Sakari Ailus wrote:
> From: Hans de Goede <hansg@kernel.org>
> 
> CSI lanes are double-clocked so with a single lane at 400MHZ the resulting
> pixel-rate for 10-bits pixels is 400 MHz * 2 / 10 = 80 MHz, not 40 MHz.
> 
> This also matches with the observed frame-rate of 60 fps with the default
> vblank setting: 80000000 / (1488 * 896) = 60.
> 
> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov01a10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index e5df01f97978..0b1a1ecfffd0 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -16,7 +16,7 @@
>  #include <media/v4l2-fwnode.h>
>  
>  #define OV01A10_LINK_FREQ_400MHZ	400000000ULL
> -#define OV01A10_SCLK			40000000LL
> +#define OV01A10_SCLK			80000000LL
>  #define OV01A10_DATA_LANES		1
>  
>  #define OV01A10_REG_CHIP_ID		0x300a
> 

-- 
Best regards,
Bingbu Cao

