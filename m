Return-Path: <linux-media+bounces-39793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C96BDB246E4
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 599937A80C6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4372D6E4A;
	Wed, 13 Aug 2025 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyIAA4Nk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6DE23D7FB
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080137; cv=none; b=QnFSog0IHnF9sLhdHVRru2z5MQJjkBBI4M8REfvKGOHBLUCeMGmTZQNQw4CYAlkvRGJ42jDX5gZiszo0AN8IdUVdp4Bhj33ugESpKFXHybZ3oQRuklw2TR5RgZgkTiQmhJ4BCU+wV4yJLmrkpKPea1sV+HBjTV0BrlLzdeJAlxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080137; c=relaxed/simple;
	bh=mZbrRnj/TsVP1nfny16y0ycXMcOnbphtTRgYoszFtno=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=A+PES92JPfZ1Sbqw8g8nPCum6Urq9wzEjcleaXVzssMVF74k2UiwRVjnDH3Cs6esGh2Cd19VS/zTVwWbWFAB1T1C5pd5u5X5J79ijsAvKanH1XJOOaF3m1CzeDvAnjJ0JJpHO9Ko10UDkUHb70m1AOgdDRXwVwGdWGYnsMSC+eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyIAA4Nk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E268C4CEEB;
	Wed, 13 Aug 2025 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755080136;
	bh=mZbrRnj/TsVP1nfny16y0ycXMcOnbphtTRgYoszFtno=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=YyIAA4NkxFpu1Y8rtBsWYuvatzolOfGUA4ZO5iIC0A6unBSRBSmSFqUeJh7jfXf5y
	 lCug/tiee0SaIV4O0sOR+gzMAuidK0SXc5LleqKLwWQlaOeaODhrkddnNMpnAA/oTq
	 AGTBvvsclbpCwuDUq4BAjB7qu57t31Vu7sm7E+BAwobxiaCGLMqnNIUwo9a6aT4prq
	 qw9tYdvdCo1Dq3u6y59Ojr2E9Rc/lB2y5Eg5BPDq/0zn17/En6/SEOb7Ik96gM/esp
	 lD1MpM3QTVVWdADkSH45toyF/kagR2jY/eWxNGuWZ98aSCt2CVn9tvFqpl4qUi8C8x
	 +H/OMlGAmed8A==
Message-ID: <cd5ac9a7-ada2-4bdf-bc81-8290f0eb88d6@kernel.org>
Date: Wed, 13 Aug 2025 12:15:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining
 the clock producer
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com, arnd@arndb.de,
 alain.volmat@foss.st.com, andrzej.hajda@intel.com,
 benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
 hansg@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, khalasa@piap.pl, mani@kernel.org,
 m.felsch@pengutronix.de, matthias.fend@emfend.at, mchehab@kernel.org,
 michael.riesch@collabora.com, naush@raspberrypi.com, nicholas@rothemail.net,
 nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
 dan.scally@ideasonboard.com, pavel@kernel.org, rashanmu@gmail.com,
 ribalda@chromium.org, slongerbeam@gmail.com,
 tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
 linux-media@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi, Sakari, Laurent,

On 26/06/2025 15:33, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as devm_clk_get() except where there is
> no clock producer like in ACPI-based platforms.
> 
> For ACPI-based platforms the function will read the "clock-frequency"
> ACPI _DSD property and register a fixed frequency clock with the frequency
> indicated in the property.
> 
> This function also handles the special ACPI-based system case where:
> The clock-frequency _DSD property is present.
> A reference to the clock producer is present, where the clock is provided
> by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> In this case try to set the clock-frequency value to the provided clock.

On irc I wondered about the name of the new function since it is sensor
specific, and if it can also be used for e.g. video receivers, then it
should be renamed to something more generic.

According to Laurent there is no ACPI standard for video receivers, so
that's the reason this is sensor specific.

I'd like to see that documented in this patch. Either in the commit log,
or, preferred, in the header in the function description.

I made a suggestion below.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 27 ++++++++++++++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c

<snip>

> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..1c79ca4d5c73 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
>  struct v4l2_device;
>  struct v4l2_subdev;
>  struct v4l2_subdev_ops;
> +struct clk;
>  
>  /* I2C Helper functions */
>  #include <linux/i2c.h>
> @@ -620,6 +621,32 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  			     unsigned int num_of_driver_link_freqs,
>  			     unsigned long *bitmap);
>  
> +/**
> + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> + *	for a camera sensor.
> + *
> + * @dev: device for v4l2 sensor clock "consumer"
> + * @id: clock consumer ID
> + *
> + * This function behaves the same way as devm_clk_get() except where there
> + * is no clock producer like in ACPI-based platforms.
> + *
> + * For ACPI-based platforms, the function will read the "clock-frequency"
> + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> + * in the property.
> + *
> + * This function also handles the special ACPI-based system case where:
> + *
> + * * The clock-frequency _DSD property is present.
> + * * A reference to the clock producer is present, where the clock is provided
> + *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> + *
> + * In this case try to set the clock-frequency value to the provided clock.

    *
    * While ACPI has standardized sensor support, there is no standard support for
    * e.g. video receivers. So this function is specific to sensors, hence the
    * chosen function name.

Better suggestions are welcome.

If it is just adding a paragraph, then I can just add that manually. If the change
is more involved, then a v2.1 for just this patch should be posted.

Other than this, the series looks good.

Regards,

	Hans

> + *
> + * Returns a pointer to a struct clk on success or an error pointer on failure.
> + */
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> +
>  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
>  	/*


