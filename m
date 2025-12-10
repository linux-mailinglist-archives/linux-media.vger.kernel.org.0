Return-Path: <linux-media+bounces-48511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F9CB179F
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 654E730D4C81
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FF71917F0;
	Wed, 10 Dec 2025 00:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogPcu/w3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB7146D53
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765326215; cv=none; b=QU1+sGeSmlCWxquNh1eXIZf2rmTll8yjOHpsZR7SLrLe3J8Uf9Goj+EOyZVfJPX4hFpXfyaSIX8DxoeQM2s+VeLklLQqpb2LyDWfqkTQQCWZ53w9OK4Hx4A9/u80kZMuYZN/wSALnDMsR9JDJFIBFj6r+9cZPqsVWRoEVh/deZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765326215; c=relaxed/simple;
	bh=296+5ZhMKl7ds0I3PCCkFfQ+N+J4z6bupdD4OMLItxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJkB4zlAbkTG32upaI3J0AYswz3ukMsXFKR+Uh0YohBF1CD+1BseLVFP9ytw+pjinWA2nN3/52wTRD0bYPHann82xuMZESBnJC8oqof1HYRG8nmzbgrY4qB+fokkwXSlCqlgnSNovdGKGnnsJcgTQvlcMfLuLmZiutdm7/XXnrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogPcu/w3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F57FC4CEF5;
	Wed, 10 Dec 2025 00:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326215;
	bh=296+5ZhMKl7ds0I3PCCkFfQ+N+J4z6bupdD4OMLItxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ogPcu/w3ivpQred1HsDlBZ4TGzXvJWp+QdYx0ctWFBGbcH1JKFVD3XqY+IkyZgoeu
	 wO3HQIDRKj2X4Bp6TYmKhtUw8Q65sDpRF6zaNzb85zlHAg2REqpf8avfUwurNequjB
	 r/jFQuyAMIz1kS3kUHqp3V4F/n2W+fR+LjCQT96Ol4F6NpyDtlpBbwQaPeUvGmY6Ch
	 E350l78ht8VfSdYZw2I/ikyuRKHc69FUB4zjOeemFgRI7z8uFQsFcT1HprA0b9gELe
	 F7Bm/gO0zG3btLe0DyZmit3jfSYFC8wMtfvB3SERpeiBYOBYN1XuHwqbj72oqX7EgC
	 YGM+Iyg6PVV/g==
Message-ID: <2c2dd2a4-ec2c-4ea5-81da-b4db2b529ed4@kernel.org>
Date: Wed, 10 Dec 2025 00:23:32 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: ov02c10: Adjust x-win/y-win when changing
 flipping to preserve bayer-pattern
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
 <ecTFkvqj1lBajm-tD_Qvl8JECOziWA34bhqi_IBDpSCYz0gldwyeB2aOqgRphYUK8Mn-UGYfwxmiq4oet14fAw==@protonmail.internalid>
 <20251209160621.6854-3-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251209160621.6854-3-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2025 16:06, Hans de Goede wrote:
> The ov02c10 is capable of having its (crop) window shifted around with 1
> pixel precision while streaming.
> 
> This allows changing the x/y window coordinates when changing flipping to
> preserve the bayer-pattern.
> 
> __v4l2_ctrl_handler_setup() will now write the window coordinates at 0x3810
> and 0x3812 so these can be dropped from sensor_1928x1092_30fps_setting.
> 
> Since the bayer-pattern is now unchanged, the V4L2_CTRL_FLAG_MODIFY_LAYOUT
> flag can be dropped from the flip controls.
> 
> Note the original use of the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag was
> incomplete, besides setting the flag the driver should also have reported
> a different mbus code when getting the source pad's format depending on
> the hflip / vflip settings see the ov2680.c driver for example.
> 
> Fixes: b7cd2ba3f692 ("media: ov02c10: Support hflip and vflip")
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/i2c/ov02c10.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 6369841de88b..384c2f0b1608 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -165,10 +165,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
>   	{0x3809, 0x88},
>   	{0x380a, 0x04},
>   	{0x380b, 0x44},
> -	{0x3810, 0x00},
> -	{0x3811, 0x02},
> -	{0x3812, 0x00},
> -	{0x3813, 0x01},
>   	{0x3814, 0x01},
>   	{0x3815, 0x01},
>   	{0x3816, 0x01},
> @@ -465,11 +461,15 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
>   		break;
> 
>   	case V4L2_CID_HFLIP:
> +		cci_write(ov02c10->regmap, OV02C10_ISP_X_WIN_CONTROL,
> +			  ctrl->val ? 1 : 2, &ret);
>   		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
>   				BIT(3), ov02c10->hflip->val << 3, &ret);
>   		break;
> 
>   	case V4L2_CID_VFLIP:
> +		cci_write(ov02c10->regmap, OV02C10_ISP_Y_WIN_CONTROL,
> +			  ctrl->val ? 2 : 1, &ret);
>   		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
>   				BIT(4), ov02c10->vflip->val << 4, &ret);
>   		break;
> @@ -551,13 +551,9 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
> 
>   	ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>   					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> -	if (ov02c10->hflip)
> -		ov02c10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> 
>   	ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>   					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> -	if (ov02c10->vflip)
> -		ov02c10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> 
>   	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
>   				     V4L2_CID_TEST_PATTERN,
> --
> 2.52.0
> 

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

