Return-Path: <linux-media+bounces-19519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F408E99BDC8
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 04:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D4728126B
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 02:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD583D97A;
	Mon, 14 Oct 2024 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BK431Rtt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3B1C149
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 02:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728873151; cv=none; b=tIkJe3+VbsUlyy9jeUCotPD5FaO5+wIFF+wltnN51L4fjl+OQoRtp96UD7P9dB80vgVOeFaXd9xjSXcEeuoNDfZeSTJ5WHHuE7zAICD/sFDcq4rDJYKozS+q/KWmMrt+NjgljWVGnTxF47OsmwetV2FziWSYhyxVaELYzcsCFrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728873151; c=relaxed/simple;
	bh=nMqtkTR+bCIrZzIHo5Tf8DkHI43tB6jpooKH4aVYDhY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Neb5WVngH4aDayHnhWgANCP66+jvAkOB4xqTXjeUgQ6o2YsYIsR1KtOIv5A2Am3HFskIVzvAp9dAkAX8e3iW/RA4Rs5AAwt7I/xIQlx+uVqKl7PfHtTf5ZqZvT/IZpfZSjdRN8fyGk+fCUOAhzbOfE0nZGBhYPAekxMErcQXjWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BK431Rtt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728873150; x=1760409150;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nMqtkTR+bCIrZzIHo5Tf8DkHI43tB6jpooKH4aVYDhY=;
  b=BK431Rtt6AyBgCdxIxBaPEr5oJreAR/pI8LQqJO3zv1TWSnMVXQdaORu
   ZkAYMcw0O90gsK1uiQ253MnniZ0Yc6Xhp3I5oyVRpDNPGMSHJHMJvMFQ0
   kOXikK0vlVWEXH7h6oMzOUGgnuw3Ehnzg1ycL/fqZhK+DbFsBDu1A4jzj
   qyZIjrsP44w+jvraY6KxOHgKXTIwwz1kenyJ5U1zySQYEkMVlsegw8lk5
   q0Oilm72yulXsFu8r5nlXibP2PopkMXgGHhebPOb/sZ15BXbcUus2sQJ8
   Jy9/X0SNH9SrF5H7WQg9cuWqp26DsRLgeE5V0YPOdIy3NErJr3G4eQjk2
   w==;
X-CSE-ConnectionGUID: GWYWHYN7SYuBwRKkF//oqA==
X-CSE-MsgGUID: cGzTOt+WTkOD/JQK1Gaiiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="15834571"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="15834571"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 19:32:29 -0700
X-CSE-ConnectionGUID: DrAFe927SzW2F4rqmjhqVg==
X-CSE-MsgGUID: 2zYzj1geQu2K1GCJLeKlww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="81428412"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 19:32:27 -0700
Subject: Re: [PATCH] media: ov2740: Don't log ov2740_check_hwcfg() errors
 twice
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241012160803.75939-1-hdegoede@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <3d6b803e-1b53-d394-8720-1c4dcbb24535@linux.intel.com>
Date: Mon, 14 Oct 2024 10:29:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241012160803.75939-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans,

Thanks for the patch.

On 10/13/24 12:08 AM, Hans de Goede wrote:
> All ov2740_check_hwcfg() error-exit paths already log a detailed reason,
> logging a second generic "failed to check HW configuration" error is
> not useful, drop this.
> 
> The one exception is the -EPROBE_DEFER exit on
> fwnode_graph_get_next_endpoint() returning NULL.
> 
> Call dev_err_probe() there to register the reason for deferring the probe,
> this is used if the endpoint is still not there after 30 seconds, e.g. :
> 
>  i2c-INT3474:00: deferred probe pending: waiting for fwnode graph endpoint
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2740.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index bd0b2f0f0d45..387c529d9736 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -1132,7 +1132,8 @@ static int ov2740_check_hwcfg(struct device *dev)
>  	 */
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep)
> -		return -EPROBE_DEFER;
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
>  
>  	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
>  	if (ret) {
> @@ -1330,7 +1331,7 @@ static int ov2740_probe(struct i2c_client *client)
>  
>  	ret = ov2740_check_hwcfg(dev);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to check HW configuration\n");
> +		return ret;
>  
>  	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(ov2740->reset_gpio)) {
> 

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao

