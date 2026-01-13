Return-Path: <linux-media+bounces-50491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA908D16600
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 03:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 316A73031378
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 02:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571A92F39A4;
	Tue, 13 Jan 2026 02:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAqx/vLd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0062E2DFB
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768272768; cv=none; b=UvmE/asHMHQ9wlLkBgW2+tiDEg1yNi9AjbfSh6vz+xj9u7w5tFpX1MUMSQt0Po8/LTWWOcG3MWiNOzGhR44vsqnoZD4BqSDG+1FRLwjjv1YHcyof3N5p1fUGI33gx9QUhQ9p+a8wQEjBpoljs1k8TzvQxjjCGZCOBKsiIwZd3N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768272768; c=relaxed/simple;
	bh=J+xOhwgTbVhgCqZ1CnKNxuBgKAtVOrN9Qm/iBzHRrPY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oNjSeaCfWQXb2PUNdus/P5PksQpdKBaHJtcrwJ6Q29RANdtPHO4qqeAMfhYuONjPdD0t+qHwL3mzkp2qIlvRe7QvLkvQUR+d5nzjPJQP1ef86Fdiqots5S/KGEZONPqbI81/OvE6EQf0wCYPfFtm6QSBSg8/RkKhCi4t47xpT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAqx/vLd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768272767; x=1799808767;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=J+xOhwgTbVhgCqZ1CnKNxuBgKAtVOrN9Qm/iBzHRrPY=;
  b=MAqx/vLd/8WMJmdMMuOJGEK/wNkeunLYCdAyzOR7X/qHi8ZgihFdxRfY
   GW/TRIW9mOE3u4VRJWv63CE/g8mXCYpaEbXGKMfZYNRLfBGg6xSeGUV02
   Cu2i0ht8qc/9lgxYDQPXB0Qin4xnBY0K33jTGLN9e/yV3DxFOUlg1bxQ3
   heAk67dXuv6zMzlGMDlH0QtsErMY8s/ewYCX76ZrOY8t9QJ7R9bm12uJ8
   TNfksodfeDnh1WIUlP7AiUtW6rjL7mCeEIV19VgX7XWLldHNzlc3pTbxw
   GhSRnNo7TN3eWXCf3hna7xAPOVWXBCJJDqwL+n69hiU90D8XghUO/7Wom
   w==;
X-CSE-ConnectionGUID: G1oljLEfQWuWngZ/zRo1OQ==
X-CSE-MsgGUID: iy51nl4QTNmHlG2dstshAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80197535"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80197535"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 18:52:47 -0800
X-CSE-ConnectionGUID: 6oiL6ZcqRCCTVsLkTRRe3g==
X-CSE-MsgGUID: AYbbD0CnSt2Oss6sjacWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208775915"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 18:52:44 -0800
Subject: Re: [PATCH v2 03/23] media: i2c: ov01a10: Fix analogue gain range
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>, Hans de Goede <hansg@kernel.org>,
 mehdi.djait@intel.com
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
 <20260112095949.3851-4-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <66c81d74-6d50-2a34-a4d7-65d9d0865d37@linux.intel.com>
Date: Tue, 13 Jan 2026 10:42:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260112095949.3851-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari and Hans,

Thanks for the fix.
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>


On 1/12/26 5:59 PM, Sakari Ailus wrote:
> From: Hans de Goede <hansg@kernel.org>
> 
> A analogue maximum gain of 0xffff / 65525 seems unlikely and testing
> indeed shows that the gain control wraps-around at 16383, so set the
> maximum gain to 0x3fff / 16383.
> 
> The minimum gain of 0x100 is correct. Setting bits 8-11 to 0x0 results
> in the same gain values as setting these bits to 0x1, with bits 0-7
> still increasing the gain when going from 0x000 - 0x0ff in the exact
> same range as when going from 0x100 - 0x1ff.
> 
> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> [Sakari Ailus: mention analogue gain and update the limit from 4096.]
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov01a10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index 0b1a1ecfffd0..834ca46acb75 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -48,7 +48,7 @@
>  /* analog gain controls */
>  #define OV01A10_REG_ANALOG_GAIN		0x3508
>  #define OV01A10_ANAL_GAIN_MIN		0x100
> -#define OV01A10_ANAL_GAIN_MAX		0xffff
> +#define OV01A10_ANAL_GAIN_MAX		0x3fff
>  #define OV01A10_ANAL_GAIN_STEP		1
>  
>  /* digital gain controls */
> 

-- 
Best regards,
Bingbu Cao

