Return-Path: <linux-media+bounces-24543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9AAA07DD2
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 17:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A3543A45EF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 16:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951EF22371C;
	Thu,  9 Jan 2025 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbLyf6K9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63611223710
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 16:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736440660; cv=none; b=sSm45CGKyy239he4Ld4n0Pv2RcpV1DUZw85Qo88vG0TGBecxYYCfdeRPS95ra3OXNX8MKrDZ/azQ5P4zVnsnoReWAvOgKDx2SsyEipF83rGvV/hRiFPnm1yx+cw5i2Z2WpR/1A20K6r7df8ltkUa4cnAUaQ0Kktyg8Glb0hDTQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736440660; c=relaxed/simple;
	bh=ARRcUPi2Wu0rud0AgY9YQaV8YRgaDLqfxYzzPZJO/w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIfxsUv1TXmljZWzr5kkwl+J/i4SX54eCiHQdl+GiFV37lxMfLLYgzfxTQUW2CLo3mpvloyS2QmfIKUd5ysHrblRMSQRbi+CdE+uLiEvD5S3vVmzWSlKR6yKnU3bcCArXrCX8w8INIzRvWs5p3BbF9n3BPpnSpqK7PGbOsetrIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbLyf6K9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736440658; x=1767976658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ARRcUPi2Wu0rud0AgY9YQaV8YRgaDLqfxYzzPZJO/w4=;
  b=MbLyf6K9Jim/lLVyup5JyEcIGARqrThqSFq4yUdRxFbTZ1buaxtfHtdu
   mt8O0P3wLD2x/lSx/1gfS7ugUMccE3aFx/xSXiZfFzB208xEhCOjY/KSh
   xBCw+gM2PzT//8bRaHDOkH4hrBJpb0Iu0tcqErKFeDMzsij0HH6WqXEdF
   JimUNHQM5TuBYK5U+pFMgaGPyNq+/ZExoIXYEpjsMwtN6AosQu0Z7YJKT
   QFTaNq5SCDeLsGlj//woJt1bO6q0dQQEJuDXJw0h6BpJk9E+t56GnXHYv
   PcRyaDGjwNl+4NT5R1ku1M5WDTmaZEbhUcghUPjWufaxfX1hCk1jb2wIS
   w==;
X-CSE-ConnectionGUID: FbYDO/EUQxKZes8YAUlQGQ==
X-CSE-MsgGUID: HPjuk4pHTISb/bnGtq4NvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36734435"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36734435"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:37:36 -0800
X-CSE-ConnectionGUID: 4ikPCyR6QFCV+MEjSmEXoA==
X-CSE-MsgGUID: mn0oPO1ORD276SvEBPnOww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="108365672"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:37:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 11C8E11F951;
	Thu,  9 Jan 2025 18:37:32 +0200 (EET)
Date: Thu, 9 Jan 2025 16:37:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 08/10] media: ov08x40: Add missing
 ov08x40_identify_module() call on stream-start
Message-ID: <Z3_7TAXXUlqkUcwY@kekkonen.localdomain>
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <20241220144130.66765-9-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220144130.66765-9-hdegoede@redhat.com>

Hi Hans,

On Fri, Dec 20, 2024 at 03:41:28PM +0100, Hans de Goede wrote:
> The driver might skip the ov08x40_identify_module() on probe() based on
> the acpi_dev_state_d0() check done in probe().
> 
> If the ov08x40_identify_module() call is skipped on probe() it should
> be done on the first stream start. Add the missing call.
> 
> Note ov08x40_identify_module() will only do something on its first call,
> subsequent calls are no-ops.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'll add:

Fixes: b1a42fde6e07 ("media: ov08x40: Avoid sensor probing in D0 state")
Cc: stable@vger.kernel.org

> ---
>  drivers/media/i2c/ov08x40.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 39430528f54f..7d00740222c1 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1973,6 +1973,10 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
>  		if (ret < 0)
>  			goto err_unlock;
>  
> +		ret = ov08x40_identify_module(ov08x);
> +		if (ret)
> +			goto err_rpm_put;
> +
>  		/*
>  		 * Apply default & customized values
>  		 * and then start streaming.

-- 
Sakari Ailus

