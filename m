Return-Path: <linux-media+bounces-38170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA2EB0C3A9
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2F3C17C916
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03F22BF016;
	Mon, 21 Jul 2025 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDaazon4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A02576;
	Mon, 21 Jul 2025 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753098664; cv=none; b=KrxEHqwwVOz45gDPCL9gHs5OshG3FMG2YJeWq4iT/uUV2stL7JOUAZH71Hce+TFi9aauaL2Gyco1DCr7akwM5R7kPz8jQhDlpDSaMXLV45Mam6A1owe5p6+gCw1GQVkSl07VODTAWdu8CaumI6vkybFKtkZGaECpgmmiMB5bgqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753098664; c=relaxed/simple;
	bh=IIOg+n003vrX7OOqFRa61XOd+zP+EXdAny96ulao+2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCM/W7+wEpE/7tNboljg/6znV+aqIkQhuXw/GcUvTwquMJS/9PFSzPdB+1a3i0iJZBJrCczt0G2TS3TLbI5dzI72T/5PtcB6RdK1AHKPIFxupgV1wJ18Ur7LiFsg6mFuyKOF106Sb3BrElpYcG2lYld2EuWIHNjjxgCS31GWcDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDaazon4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CFDC4CEED;
	Mon, 21 Jul 2025 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753098663;
	bh=IIOg+n003vrX7OOqFRa61XOd+zP+EXdAny96ulao+2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WDaazon4OqT1y0z5AtlH4mVeLrw2dkbCcvefey11ZTbUagBemFYY2QgLRZ9+S1kJ/
	 sABHCEj5Xn5mjkMXTKpeJastww1PzoyJ4w6iZSm1xmss7FRBtcKR9l0C1OopR+RvPF
	 88LxIvJ6R5+IDZIdcgupzkNVT/oS+n2q4DxVBfph4jiMIGcM1eyDRbNvI3cgF+xc4c
	 VCNa6Cw6ZWSc66NkRqbdQaIjhO9MkkeKAPRxmQcnw4GIkwVPOuS8UCOcmA20k6CJVv
	 xLXM3gClwTSSTYTvk0tmFNFqskxHGuEmwB58D6qKQlvEdvXC9shte5iBQ2j4L7AwTP
	 y0t9wUEDuUf9w==
Message-ID: <7ebb8be3-ce67-4989-bae6-8459aef74528@kernel.org>
Date: Mon, 21 Jul 2025 13:51:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ov8865: Preserve hflip in
 ov8865_mode_binning_configure
To: Allen Ballway <ballway@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250717-su-v1-1-0f740fd8bfb6@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250717-su-v1-1-0f740fd8bfb6@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Jul-25 11:07 PM, Allen Ballway wrote:
> Prevents ov8865_mode_binning_configure from overwriting the hflip
> register values. Allows programs to configure the hflip.
> 
> Signed-off-by: Allen Ballway <ballway@chromium.org>

Thank you for your patch.

> ---
>  drivers/media/i2c/ov8865.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..40a852d31f13aff960acfd09b378d71525e19332 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -1746,7 +1746,13 @@ static int ov8865_mode_binning_configure(struct ov8865_sensor *sensor,
>  	if (ret)
>  		return ret;
>  
> -	value = OV8865_FORMAT2_HSYNC_EN;
> +	ret = ov8865_read(sensor, OV8865_FORMAT2_REG, &value);
> +	if (ret)
> +		return ret;
> +
> +	value &= OV8865_FORMAT2_FLIP_HORZ_ISP_EN |
> +		  OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN;
> +	value |= OV8865_FORMAT2_HSYNC_EN;
>  
>  	if (mode->binning_x)
>  		value |= OV8865_FORMAT2_FST_HBIN_EN;

this change should not be necessary. Lets assume we start
with the sensor runtime-suspended, then ov8865_resume()
will call:

ov8865_sensor_power(true)
ov8865_sensor_init()
  ov8865_state_configure()
    ov8865_mode_configure()
      ov8865_mode_binning_configure()
__v4l2_ctrl_handler_setup()

Where the __v4l2_ctrl_handler_setup() call will apply
all control settings including hflip.

So unless you manage to hit a code-path where somehow
ov8865_state_configure() gets called without calling
__v4l2_ctrl_handler_setup() afterwards then this should
not be necessary.

Note the whole runtime-pm / calling of ov8865_sensor_init() /
ov8865_state_configure() code in this driver is somewhat
unusual. So it could be there is a bug there.

But I don't believe that this patch is the correct fix.

Regards,

Hans





> 
> ---
> base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> change-id: 20250717-su-94b187fa3d1e
> 
> Best regards,


