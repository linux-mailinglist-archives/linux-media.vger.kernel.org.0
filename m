Return-Path: <linux-media+bounces-44489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3581BDC30C
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 04:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7898420E44
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 02:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F51030CDB8;
	Wed, 15 Oct 2025 02:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnXNnPQt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64A2EAB64;
	Wed, 15 Oct 2025 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496165; cv=none; b=iVaUF8fINWiLGTBZJqv4CQiE5faeHM7/0dnSeSSQIpxiafZVKosW9ix2uvYiM6ZwKkwxbHLlxArm5K823bGRD4rqSUZmrE43ngDTPBmcJ51JOxOmkApU+dIXhEcj01IZKBgSMElCXbQUJT3ZqXTlKgYaCXqTm0GMS4/v8UVsF7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496165; c=relaxed/simple;
	bh=VQAmfiULKGSIMUXpEHNtsMp0XigNzorMHabNtZB4bwM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PU1lin48VdEY+vZeDn9Axl/z0ymgNqeqvdCCOvbz5x6sT66yDdeODQAsF3N3UELNqlv+jSblwglk2biM2vEvDk6cq7TS/BOg1gm82g9hGITiJNzZiTkdtJPk9bccA+uI9ChvYR6li0wBOTc/redAXDwEZ/h5JlXj+JYOwt+4gyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnXNnPQt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760496162; x=1792032162;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=VQAmfiULKGSIMUXpEHNtsMp0XigNzorMHabNtZB4bwM=;
  b=BnXNnPQtMXUWp4MxfDfaLiY5NJ107u1VG4O3QscxEw4NL51fPMM9NUo5
   OBlTclIKfuQJ7O3hFmn0kT4/GZdhtthnnfxhZltQMU5TEJ6oHQ9LmzL+j
   IC7dbn0K/NtpHHr8ZDO0TCw0uCYR3SO8LjFTIDP+lkm057Otrb5vyMnRG
   qzO0MhJZ3sRKg7ahVTJPd7J5O7IQsV8bhXxmU1N4ReT5Kn9t5nuPToEuM
   yAYQMoacrqV1BMS8QDYG6b03LcT6jezqMx0wrZuHUb/gzXBgHKMENqta+
   Qp2tB9rEJ2rcLezLsfrNr/I5G8z+btpzHDCtH8j8ixQhCoZ+ERV5dqoHa
   g==;
X-CSE-ConnectionGUID: /ax6LiCFTfG/Lb/SAd6cNw==
X-CSE-MsgGUID: woJWNJHOTymc7WDhvz2LeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62574179"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62574179"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 19:42:42 -0700
X-CSE-ConnectionGUID: qof2c9nNSqG7tqKaBRq/gQ==
X-CSE-MsgGUID: HQqb0SA4TdmsENOHSvajRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="187135642"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 19:42:41 -0700
Subject: Re: [PATCH 06/25] media: i2c: ov01a10: Fix test-pattern disabling
To: Hans de Goede <hansg@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-7-hansg@kernel.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d457cad8-f833-c9a2-5710-ad538080d9f1@linux.intel.com>
Date: Wed, 15 Oct 2025 10:34:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251014174033.20534-7-hansg@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans,

Thank you for the fix. 
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 10/15/25 1:40 AM, Hans de Goede wrote:
> When the test-pattern control gets set to 0 (Disabled) 0 should be written
> to the test-pattern register, rather then doing nothing.
> 
> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/i2c/ov01a10.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index 0405ec7c75fd..733e5bf0180c 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -406,10 +406,8 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
>  
>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
>  {
> -	if (!pattern)
> -		return 0;
> -
> -	pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
> +	if (pattern)
> +		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
>  
>  	return ov01a10_write_reg(ov01a10, OV01A10_REG_TEST_PATTERN, 1, pattern);
>  }
> 

-- 
Best regards,
Bingbu Cao

