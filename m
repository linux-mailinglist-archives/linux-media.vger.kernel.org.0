Return-Path: <linux-media+bounces-10810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BAA8BC3DE
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 23:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A5E2827A2
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 21:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCEC7605E;
	Sun,  5 May 2024 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="joeSctA5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68817602F;
	Sun,  5 May 2024 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714943271; cv=none; b=bRnzeMg30GFw9sT0W5cRJ4/lnlkgS7qvaDUv83Zr5Son5Yr2Xphb/F0z3Brz8yxRoSiV+rRv7pHP9xrz066KqNIMZgxDmovhkeBgekPv56HUpmKe9wKqc2ZZDJHKtvLwAfjtYlJKHfsZAGGrAnjm5Q7I0EoMEibqJp4la3e8SNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714943271; c=relaxed/simple;
	bh=cvrXpwqWQyAqUU7JIJ7xerIFjAk3BD8JhJTrtW8aXJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrJckg82l33unyJw7rDeTTdFXuk+HY5ANE+mRv0y/Kh4AH/p2qlFEhdnkBog/ANfsUX9Sr8oPK/imwLvkLIb+4zz77qwzIQ2rMbWJFT7POfWJF8k63SEvYzdZRg/d6PlZFIOFdO+W1rrmbdji6ThE7A8CBsgn1dK/Du7ItLkRYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=joeSctA5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2657363B;
	Sun,  5 May 2024 23:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714943267;
	bh=cvrXpwqWQyAqUU7JIJ7xerIFjAk3BD8JhJTrtW8aXJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joeSctA5YFVjUemebUOUQ9bqXNPPJy+UFCN1B+Llh3XKL6uLBXFwKiNhFWaWKSgLf
	 362U9zGkyyg2sNQE3Uq3N+ePgGSSIKoDYUgVQuhkmg4u4i8b7BhPtLRK3NtMb+ECTM
	 isyh66pbwDVHu+MDm7PqImM1GwUGv0/jSh1X7mVI=
Date: Mon, 6 May 2024 00:07:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/11] media: adv748x-csi2: Implement enum_mbus_codes
Message-ID: <20240505210740.GD23227@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-7-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-7-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:21PM +0200, Jacopo Mondi wrote:
> Define a list of supported mbus codes for the TXA and TXB CSI-2
> transmitters and implement the enum_mbus_code operation.

The commit message should explain why, not just what. Explaining why the
formats for TXA and TXB differ would also be useful.

> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 35 ++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 9da7f6742a2b..219417b319a6 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -21,6 +21,18 @@ static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
>  	.field = V4L2_FIELD_NONE,
>  };
>  
> +static const unsigned int adv748x_csi2_txa_fmts[] = {
> +	MEDIA_BUS_FMT_YUYV8_1X16,
> +	MEDIA_BUS_FMT_YUYV10_1X20,

CSI-2 uses UYVY, not YUYV.

> +	MEDIA_BUS_FMT_RGB565_1X16,
> +	MEDIA_BUS_FMT_RGB666_1X18,
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +};
> +
> +static const unsigned int adv748x_csi2_txb_fmts[] = {
> +	MEDIA_BUS_FMT_YUYV8_1X16,
> +};
> +
>  int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
>  {
>  	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
> @@ -146,6 +158,28 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
>   * But we must support setting the pad formats for format propagation.
>   */
>  
> +static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *sd_state,
> +				       struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> +	const unsigned int *codes = is_txa(tx) ?
> +				    adv748x_csi2_txa_fmts :
> +				    adv748x_csi2_txb_fmts;
> +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> +
> +	if (code->pad != ADV748X_CSI2_SOURCE)
> +		return -EINVAL;
> +
> +	if (code->index >= num_fmts)
> +		return -EINVAL;
> +
> +	code->code = codes[code->index];
> +
> +	return 0;
> +}
> +
>  static struct v4l2_mbus_framefmt *
>  adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *sd_state,
> @@ -235,6 +269,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
>  }
>  
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
> +	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
>  	.get_fmt = adv748x_csi2_get_format,
>  	.set_fmt = adv748x_csi2_set_format,
>  	.get_mbus_config = adv748x_csi2_get_mbus_config,

-- 
Regards,

Laurent Pinchart

