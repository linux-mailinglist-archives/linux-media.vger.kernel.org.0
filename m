Return-Path: <linux-media+bounces-40160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65427B2AA93
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDE491BA7DB5
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F589322DA5;
	Mon, 18 Aug 2025 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km5u9DAj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F76931E115;
	Mon, 18 Aug 2025 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526109; cv=none; b=Qn0e9UpZfle8CMc90Osnias9BuhAhd9EJseXGte14e6rr+KKTNf7tz8ihFXXFrqsNfwp3jxYfCdKuzXlnt+/+YUm0k1fjLUpDbT3pcoGawvn+uxX7HgKGA6Unk4IgjpEX+t6CZENkcnTE5A9WaqDKSEb2h1Wa8J9E4YY9rQgmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526109; c=relaxed/simple;
	bh=AusUFo1aAO3tCckVZFsza0m/s9/T5RMu9QrGt8c7f4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BU49L8dY06QOfkBLhkurg0X19f5srtLUV6VCrQdMgNdjhfNw23n0uP5crfBh3ZM3hxf8QOmxro5qcbQ5lIUp7LjK5jOZ1H+/yQFDY1hPOD+V6M2TVMEUqHRjVgVm0PB8KwFxrROCA8+7S2ejT0sWIIrmurw0tTerZfAZNlSQfLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Km5u9DAj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755526109; x=1787062109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AusUFo1aAO3tCckVZFsza0m/s9/T5RMu9QrGt8c7f4M=;
  b=Km5u9DAj5XLcNMt8Jmtd+wJKJrBrjc6uwHy+W5t01Y08ST8Jur2H8qLG
   g4CRfIrCfLTomVtoq2X2S9+O9cxVjt66MHcPXlLg13fd37IRCwdvr7NDt
   qQywXkgov2Z6CfX0DJ5MCC2+fKJNlKUWmYmvxjcTTzcdAShnXXL8WjjiD
   21BceuEEBQ8yHjT28ENDO7ENW3XZLYKwzSO3t3kLrDN1XW9qczhMwC555
   YKbAxLJOS/ik+rmI632Q4JtZK3snPjP9EnLevVg9kIYpAo7S1MJyH/DqO
   b47SRm5hfF+XUd62evhBwUEpS3nATIy0RtJjOE+pooO8iE4CeSsEee/yY
   w==;
X-CSE-ConnectionGUID: 9hrleFycRRmmXl6Y3DPHHg==
X-CSE-MsgGUID: T0wpiXUYRCCgkfQXqxRt/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69198574"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69198574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:08:28 -0700
X-CSE-ConnectionGUID: ufZnYX3OSRWI53WUPd34TA==
X-CSE-MsgGUID: I+RxtllzQu27n+KGpviA+w==
X-ExtLoop1: 1
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:08:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A132112031C;
	Mon, 18 Aug 2025 17:08:23 +0300 (EEST)
Date: Mon, 18 Aug 2025 14:08:23 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g1: Fix duster register address
Message-ID: <aKMz1xtvXvMLKUZ9@kekkonen.localdomain>
References: <20250818-vd55g1_fix_duster-v1-1-1b9d115dee87@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-vd55g1_fix_duster-v1-1-1b9d115dee87@foss.st.com>

Hi Benjamin,

On Mon, Aug 18, 2025 at 03:50:58PM +0200, Benjamin Mugnier wrote:
> The duster register needs to be disabled on test patterns. While the
> code is correctly doing so, the register address contained a typo, thus
> not disabling the duster correctly. Fix the typo.
> 
> Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")
> 

Extra newline; I'll remove it while applying.

> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  drivers/media/i2c/vd55g1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index b89fff7e11f891dea04a0085a9e7aac841b6643d..cf35f73fdd1086c6d4d76f67c2b6e4cf66eadff8 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -66,7 +66,7 @@
>  #define VD55G1_REG_READOUT_CTRL				CCI_REG8(0x052e)
>  #define VD55G1_READOUT_CTRL_BIN_MODE_NORMAL		0
>  #define VD55G1_READOUT_CTRL_BIN_MODE_DIGITAL_X2		1
> -#define VD55G1_REG_DUSTER_CTRL				CCI_REG8(0x03ea)
> +#define VD55G1_REG_DUSTER_CTRL				CCI_REG8(0x03ae)
>  #define VD55G1_DUSTER_ENABLE				BIT(0)
>  #define VD55G1_DUSTER_DISABLE				0
>  #define VD55G1_DUSTER_DYN_ENABLE			BIT(1)
> 

-- 
Regards,

Sakari Ailus

