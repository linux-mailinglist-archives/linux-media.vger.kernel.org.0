Return-Path: <linux-media+bounces-51706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO6DEZPxeGmGuAEAu9opvQ
	(envelope-from <linux-media+bounces-51706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 18:10:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B36983ED
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 18:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46B77303E2D3
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AA0363C53;
	Tue, 27 Jan 2026 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfxzEiyi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0873D3624B8;
	Tue, 27 Jan 2026 17:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533622; cv=none; b=lQcmL9LCwgMRACQLeMwNFCokTBqyTiPpZASrqlP2TFkjGWbb2SqJLrgl6oqrkM7QPUxl9aXSFhmTD41Ri8nY7ZXFoysQMbrWG0cULDSEW4xt8oQl8e6Bpk3whcMbmg0pYVI4FPuOaoPifqybLfmKIURV9uD9VGH/PbrGj7K0Phg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533622; c=relaxed/simple;
	bh=rTeakHWNKALUrBibETYJJNW2olbrl/Lrqdq8FlKwVuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQMc87knnqJIbtyfZTZ2zwi9rwuWX6COj+oP8wx8pAdWHbBUv6PRmCH0cWOy0M1BF03NPNNao93Mvla0lSHTSil43uOIXdE1JqddhyXJq5q2C5kJKVFpcpWZmitpdmI4aJnJs/YxgLU2U4KRQhMBloJu7V3n5V5HvHRCDWfuOPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfxzEiyi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769533621; x=1801069621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rTeakHWNKALUrBibETYJJNW2olbrl/Lrqdq8FlKwVuc=;
  b=PfxzEiyicHKELYhjNtC4mud4mDfd3ruaFB4Y7VAAaen8xW6AtIrVChpL
   wFu4Ber0ib/todiaoPBxS4HDO4yNqdbdEosl4lZIEuVxkcEYA5lRCt/99
   J727YRDg30oq8KG6CrjShuOTtsWZhZYAE173RmdT+qZ99F/2cx1E7Ql9b
   4Se4XN3QLhIypPV6sPPYE6jHLv09GtXLAtHoVWC2Ug6TKfrf1ddD8R0aW
   zQPr+qdBqXwnEC0IHUHxvVFAsAgrRYadQ2cZHlfKbdkHZ4d4sJYOl8LZM
   JLrg8HyjhpZvFGRriGRgO42iIyt9qOCAg3Hj3Kt7DZHkqPahx/4tXa4M8
   Q==;
X-CSE-ConnectionGUID: 9WDjYUcGQiCeUwfcEc3Fuw==
X-CSE-MsgGUID: G0rAPgAGSI2gVGPXh6wvwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93394389"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="93394389"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 09:07:00 -0800
X-CSE-ConnectionGUID: QeijQR3aSMiKnHvKtoJoaQ==
X-CSE-MsgGUID: MXJeOtn/R6aSpuFdbwylFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207271208"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.22])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 09:06:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E372E11FCD3;
	Tue, 27 Jan 2026 19:07:00 +0200 (EET)
Date: Tue, 27 Jan 2026 19:07:00 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Saikiran <bjsaikiran@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
	bod@kernel.org, vladimir.zapolskiy@linaro.org, hansg@kernel.org,
	mchehab@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence
 and timing
Message-ID: <aXjwtBey0MRP0c7f@kekkonen.localdomain>
References: <20260127165024.46156-1-bjsaikiran@gmail.com>
 <20260127165024.46156-3-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127165024.46156-3-bjsaikiran@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-51706-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99B36983ED
X-Rspamd-Action: no action

HI Saikiran,

On Tue, Jan 27, 2026 at 10:20:24PM +0530, Saikiran wrote:
> The previous power-on sequence did not strictly follow the hardware timing
> requirements (T1), potentially leading to initialization failures on some
> platforms.
> 
> Update the sequence to match the datasheet and maintainer recommendations:
> 1. Assert XSHUTDOWN (reset) for 5ms (T1 >= 5ms) before enabling power
>    resources.
> 2. Enable clock and regulators in the standard order.
> 3. De-assert XSHUTDOWN.
> 4. Wait 5ms (T2 >= 5ms) for sensor boot before I2C access (using a wider
>    range for timer coalescing).
> 
> This ensures the sensor enters a clean state during cold boot.
> 
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/media/i2c/ov02c10.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index fa7cc48b769a..3bfbd0deb126 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -676,6 +676,12 @@ static int ov02c10_power_on(struct device *dev)
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>  	int ret;
>  
> +	/* Assert reset for 5ms to ensure sensor is in reset state */
> +	if (ov02c10->reset) {
> +		gpiod_set_value_cansleep(ov02c10->reset, 1);

Is this needed? Isn't XSHUTDOWN already asserted here?

> +		usleep_range(5000, 6000);
> +	}
> +
>  	ret = clk_prepare_enable(ov02c10->img_clk);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to enable imaging clock: %d", ret);
> @@ -691,10 +697,8 @@ static int ov02c10_power_on(struct device *dev)
>  	}
>  
>  	if (ov02c10->reset) {
> -		/* Assert reset for at least 2ms on back to back off-on */
> -		usleep_range(2000, 2200);
>  		gpiod_set_value_cansleep(ov02c10->reset, 0);
> -		usleep_range(5000, 5100);
> +		usleep_range(5000, 5500);

According to the datasheet you seem to need 8192 XVCLK cycles after
deasserting XSHUTDOWN before proceeding with I²C access.

>  	}
>  
>  	return 0;

-- 
Regards,

Sakari Ailus

