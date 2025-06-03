Return-Path: <linux-media+bounces-33997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74343ACC4C8
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 12:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B593A2DCB
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 10:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F0C22B8BD;
	Tue,  3 Jun 2025 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LTHKCU7I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACBF21C177
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948363; cv=none; b=rHlEpUygnfLGUVTQY8EPT0Fwp5wHqsUdJrYH6osuHWBRH1k1Lv5XlfBlObcSq+9/WyGe57f1ZbqQEp/RW1I/dWijOCSTcfE2SXUSjYmb3slRJ80ZhFj8qe9BaelmG6viC6MpRigQmasXPWeKYlwTk6F+QYHl5hD9tcOC5TNaco8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948363; c=relaxed/simple;
	bh=fn5AHrpLzkKx9K/JN+trZDaIPkEpXyM36qeQYlKsKx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnOzy9oOGDNONjYvRp19+9IQglw4U3VDaU5mxiUakMerDaGBJHyTwt5O/TNUdHqhIReXwfad8bgt2iEXEO/Z8Gvm5ujJRL2NcXkO1Nm23cm1/K1Di8bwoGI8UtgGstdM1GIY2byc7RMsmat1GY89cYwyXPamS2z1C1uHao7VbAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LTHKCU7I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29EC0496;
	Tue,  3 Jun 2025 12:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748948357;
	bh=fn5AHrpLzkKx9K/JN+trZDaIPkEpXyM36qeQYlKsKx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTHKCU7ICgeeDXZGK1kAHXixz4cZwGmaigS/NaG7T769rFNwXUJWkMnR2U4fRXpP6
	 U9G0ZWYrK3XWnnYBXrsrm+yGZ7pGmKQ2dCM94xThNKu8O/pNfTJ5SGyrTl0roGb1DU
	 SOh2qXdCBn5bLkWaGd5LLBtu+PcGwO0kJUsbEbWQ=
Date: Tue, 3 Jun 2025 13:59:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 08/12] media: mt9m114: Put sensor in reset on
 power-down
Message-ID: <20250603105908.GB27361@pendragon.ideasonboard.com>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-9-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250531163148.83497-9-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Sat, May 31, 2025 at 06:31:43PM +0200, Hans de Goede wrote:
> Put sensor back in reset on power-down.

The commit message should explain why. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
> Changes in v2
> - After setting reset high wait 20 clk cycles before disabling
>   the clk and regulators
> ---
>  drivers/media/i2c/mt9m114.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index fe30b9ff84ad..7a1451006cfe 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -2207,6 +2207,13 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>  
>  static void mt9m114_power_off(struct mt9m114 *sensor)
>  {
> +	unsigned int duration;
> +
> +	gpiod_set_value(sensor->reset, 1);
> +	/* Power off takes 10 clock cycles. Double it to be safe. */
> +	duration = DIV_ROUND_UP(2 * 10 * 1000000, sensor->clk_freq);
> +	fsleep(duration);
> +
>  	clk_disable_unprepare(sensor->clk);
>  	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
>  }

-- 
Regards,

Laurent Pinchart

