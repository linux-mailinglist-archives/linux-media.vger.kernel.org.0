Return-Path: <linux-media+bounces-48514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D0CB17BD
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C211930D7425
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EF319C54F;
	Wed, 10 Dec 2025 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTlb+OVC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1DB322A
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765326483; cv=none; b=mm1gcODu6O1xUgZgjfyDoCHm3RNhwTHNHFW3giPwB/doZS1KprKQQpjr1RGvYQRfLIi2YEON2dvtjJJnz5rcNFaA6Rd6oJ9mx7bp+Tn3zyOoMI0VrhmM5vJQAhOIp5hwUtp/Ioq75kg6mhhtbrMUbdRvFyzWzPyhgTdfk78eGhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765326483; c=relaxed/simple;
	bh=gxMmORYTqml82auV8H5d3H/UEI8MA/fMxXRIyO1+NJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G31XeEltNGulo4IPVVv3da4V9gPtx8LSwAh5IuLOuVL35KtZylTT81QcD4egeYVB/gBhGPVDWHCUy1yOn0QSw8muYpoZ7t5LgACFwTi3puEj9JxbFvEKsqlan3R2wjKakqnPSFOV8fTQb+n1kNSGWUgh5mrzRR/gCkT4elGDQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTlb+OVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072F9C4CEF5;
	Wed, 10 Dec 2025 00:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326482;
	bh=gxMmORYTqml82auV8H5d3H/UEI8MA/fMxXRIyO1+NJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lTlb+OVCMIa3JOQO5JvsDitOuN1ZQP++PSSY5I94S2n1rJqLYd6ZxNAp48S8e9HM/
	 srVFt5NzlaZzlPox3n1iEBaBG1oRj+EJ0BfXUhjqOfan8Pp8724WukAlXLVsoyHOia
	 NDXpWdq4UBkbJtBCHH3Z4RHA0rM9xF/xovIFHICCbkGRuBcKK/H2c+9dgc+QeWC4cw
	 KuvB8IrwPlTiTQz+TTkfwF68DWUUVb5BGCk5H9fy1RimBF+SpbyFvelR7SJ71f69Zb
	 SJ3+vUvGMQiXs79rMK8TrsURMZISbGotEpw3uuwUI4LNh4hHtJSpjiPum13SvQpo90
	 U8pgdSfXeg48A==
Message-ID: <bbb10fce-4aae-4a72-893a-683cb2f060d5@kernel.org>
Date: Wed, 10 Dec 2025 00:27:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: ov02c10: Remove unnecessary hflip and vflip
 pointers
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
 <xGJ3ea-PMmYRyaaJHu2gMOt01f5y4epMsys07JuygJmH_HL9XIqZMCjPOImxZX68Dh-7gPjjCkXNv0xwhI49GQ==@protonmail.internalid>
 <20251209160621.6854-6-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251209160621.6854-6-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2025 16:06, Hans de Goede wrote:
> The cci_update_bits() inside ov02c10_set_ctrl() can used the passed
> in ctrk argument to access the vflip control value.

use the passed <data> in the ctrl argument

> 
> After changing this there is no need to store a pointer to the hflip
> and vflip controls inside struct ov02c10, drop these.
> 
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/i2c/ov02c10.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index f912ae142040..cf93d36032e1 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -381,8 +381,6 @@ struct ov02c10 {
>   	struct v4l2_ctrl *vblank;
>   	struct v4l2_ctrl *hblank;
>   	struct v4l2_ctrl *exposure;
> -	struct v4l2_ctrl *hflip;
> -	struct v4l2_ctrl *vflip;
> 
>   	struct clk *img_clk;
>   	struct gpio_desc *reset;
> @@ -471,7 +469,7 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
>   		cci_write(ov02c10->regmap, OV02C10_ISP_Y_WIN_CONTROL,
>   			  ctrl->val ? 2 : 1, &ret);
>   		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
> -				BIT(4), ov02c10->vflip->val << 4, &ret);
> +				BIT(4), ctrl->val << 4, &ret);
>   		break;
> 
>   	default:
> @@ -549,11 +547,11 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
>   					      OV02C10_EXPOSURE_STEP,
>   					      exposure_max);
> 
> -	ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> -					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_HFLIP,
> +			  0, 1, 1, 0);
> 
> -	ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> -					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_VFLIP,
> +			  0, 1, 1, 0);
> 
>   	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
>   				     V4L2_CID_TEST_PATTERN,
> --
> 2.52.0
> 

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

