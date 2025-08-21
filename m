Return-Path: <linux-media+bounces-40538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD57B2F281
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453EB18821E1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B182EA170;
	Thu, 21 Aug 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJ36OBuJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3022EB10;
	Thu, 21 Aug 2025 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765204; cv=none; b=qWRjucSj3zAE8f0iUy8BXIjeYB1DeUY2K2+6HOrN0LKXSXsIGbZjsvI9egiCaGAymsbIJhTh3AEjaqMIyA8XjsWBE8zxI918rYaHCx1X2TD7c7RG15pHDJ2TVUf+HPrJ0gPScTvxifIkeBgL1oHNxMp9Gdn5OMZLjS2RsMEvge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765204; c=relaxed/simple;
	bh=dxd46luNit58LMdAutjc9LabNsuuF+LIvVeUx5hPyAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXx1CMxRErL+vGklJEu8M45fIGVMe2E5woKfZpfid6GeJ5kSO04tLE955Qaa8qkVrEdVEtYzyqt0hqrw1LbEvA9yGwTzyvQLqzt9Tlfm4nNypuTVcwbddhxBQ7ydc6e3q44nYKmI2AbQUqyKFd/kc9bCmA5XmWL26fQD/DRfFik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJ36OBuJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A20C4CEEB;
	Thu, 21 Aug 2025 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755765203;
	bh=dxd46luNit58LMdAutjc9LabNsuuF+LIvVeUx5hPyAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VJ36OBuJBSjw/Zrlwe7Kkw5XxLlDl/AqaeKCYT81qi0lK8rRQQdoHKq3jsP9P1RRR
	 CIAhb7WKIgK4RGq6Y66manRio1nOMw9SmSAftgO7PHB1wh80GccxEAsnrPqKSFLEQx
	 iI7e+RLSt+3XdYadE+zRWkyvBME/uQ16/kSrz0EqievlTpzbczAXvSrR/RLIjb/tEC
	 Uv+6rmeUNL3F7nCJtj1kd9pK1m0F1t1nEz7ZOhqMrIohrHhjmjad4QjTTTU8ULbv/U
	 mxjHiSzm0T68W+GBj4u+8sp6j0cb1xTdFMHA6qF+4nx4OgijBiRJVb2FeQxL7knAO9
	 JoUWtKM0V++Iw==
Message-ID: <2ad7377b-19df-412f-9925-40bcc232cafb@kernel.org>
Date: Thu, 21 Aug 2025 09:33:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov02c10: Support hflip and vflip
To: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Frederic Stuyk <fstuyk@runbox.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
 <RfuRq5FvTHQXv-BHz4cV7Ctpw8jXz94O7_Go72rkAMrcIyHWRfT0BYOvQidHfpbTiI2VssTEw_hMcpk4PFAgLw==@protonmail.internalid>
 <20250820-ov02c10-fix-v1-2-3fcca2cfbfbf@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250820-ov02c10-fix-v1-2-3fcca2cfbfbf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 01:13, Sebastian Reichel wrote:
> Support horizontal and vertical flip, which is necessary to handle
> upside-down mounted sensors.
> 
> Suggested-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>   drivers/media/i2c/ov02c10.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 3a02fce0a9bc0ca3ab87defe3eefd04efb4012e7..103d007415348a8bd31a09e518de23f5fd77c618 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -384,6 +384,8 @@ struct ov02c10 {
>   	struct v4l2_ctrl *vblank;
>   	struct v4l2_ctrl *hblank;
>   	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *vflip;
> 
>   	struct clk *img_clk;
>   	struct gpio_desc *reset;
> @@ -462,6 +464,16 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
>   		ret = ov02c10_test_pattern(ov02c10, ctrl->val);
>   		break;
> 
> +	case V4L2_CID_HFLIP:
> +		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
> +				BIT(3), ov02c10->hflip->val << 3, &ret);
> +		break;
> +
> +	case V4L2_CID_VFLIP:
> +		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
> +				BIT(4), ov02c10->vflip->val << 4, &ret);
> +		break;
> +
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -486,7 +498,7 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
>   	s64 exposure_max, h_blank, pixel_rate;
>   	int ret;
> 
> -	v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> +	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> 
>   	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
>   						    &ov02c10_ctrl_ops,
> @@ -537,6 +549,17 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
>   					      exposure_max,
>   					      OV02C10_EXPOSURE_STEP,
>   					      exposure_max);
> +
> +	ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (ov02c10->hflip)
> +		ov02c10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +	ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	if (ov02c10->vflip)
> +		ov02c10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
>   	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
>   				     V4L2_CID_TEST_PATTERN,
>   				     ARRAY_SIZE(ov02c10_test_pattern_menu) - 1,
> 
> --
> 2.50.1
> 
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

