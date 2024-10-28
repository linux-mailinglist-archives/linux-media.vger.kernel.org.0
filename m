Return-Path: <linux-media+bounces-20392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C08B9B2908
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 08:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 693371C20385
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 07:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929E515EFA1;
	Mon, 28 Oct 2024 07:34:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FB21CCB22;
	Mon, 28 Oct 2024 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100843; cv=none; b=mSeWgJG0VBwtcngKEQ/TmTaFGuOBPWPX0Sy1n5qRuDaC2/5kxW69VtJIdf7O2XQ4wNGHCLKi8uwLwTY6rdN6QJz8ZMHorsEoBhHWjRD8zte2UG7vvUNpJNlfv92j3rndXH8ijtsVOjP01pzsolAm+MPFYhw8HoBNC+M/uE+Zh0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100843; c=relaxed/simple;
	bh=hhhokTgB41HNiwxQHxzrT9DyEMc8KUFWeNfl5JWCsoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGut+S0T+po6PIlFcgeibLrwQvTuQHQESZUjEp7BiZgHe5E6Cf2ddPxzv4dMGyKF4xanAfyK+73Qt5NOhFeGQevfQE46k0elqxzmexRYKsv6y6WzgYaznq9eqv6zIg2Mpk2Mdw5v6Zr+UJw9eTrH2baTSJd5ku+YrjdDqqRd2J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E8CC4CEC3;
	Mon, 28 Oct 2024 07:33:59 +0000 (UTC)
Message-ID: <269ea671-e7cb-41fa-95a8-6d0a4cffff46@xs4all.nl>
Date: Mon, 28 Oct 2024 08:33:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 2/4] media: vivid: Add an rectangle control
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241022084040.3390878-1-ming.qian@nxp.com>
 <20241022084040.3390878-3-ming.qian@nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241022084040.3390878-3-ming.qian@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2024 10:40, Ming Qian wrote:
> From: Yunke Cao <yunkec@google.com>
> 
> This control represents a generic read/write rectangle.
> It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This patch should come after patch 3/4 since it relies on the new
V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX flag introduced in 3/4.

Regards,

	Hans

> ---
>  .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index 8bb38bc7b8cc..bed5f4fb0c69 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -37,6 +37,7 @@
>  #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
>  #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
>  #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
> +#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
>  
>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
> @@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
>  	.step = 1,
>  };
>  
> +static const struct v4l2_rect rect_def = {
> +	.top = 100,
> +	.left = 200,
> +	.width = 300,
> +	.height = 400,
> +};
> +
> +static const struct v4l2_rect rect_min = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 1,
> +	.height = 1,
> +};
> +
> +static const struct v4l2_rect rect_max = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 1000,
> +	.height = 2000,
> +};
> +
> +static const struct v4l2_ctrl_config vivid_ctrl_rect = {
> +	.ops = &vivid_user_gen_ctrl_ops,
> +	.id = VIVID_CID_RECT,
> +	.name = "Rect",
> +	.type = V4L2_CTRL_TYPE_RECT,
> +	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
> +	.p_def.p_const = &rect_def,
> +	.p_min.p_const = &rect_min,
> +	.p_max.p_const = &rect_max,
> +};
> +
>  /* Framebuffer Controls */
>  
>  static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
>  	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);


