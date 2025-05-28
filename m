Return-Path: <linux-media+bounces-33533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5BAC6C61
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 16:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 591477A233E
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 14:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1010E28B507;
	Wed, 28 May 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lFf2y0TB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7361F9A8B;
	Wed, 28 May 2025 14:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444332; cv=none; b=Lpi7uM6mDnsyjDw5Kd8QUYjSwB4Us2qL205dznPhYTF1WuFEYBJht4FYm3R1VtbdIeJ/BUnSWOpXEdU7U/20MCPj9AGtZUHnI6jV8foyedvYj+upXP191S9hC+ItYltJ2IhtJNJjNUFPKG3CrwtxtknyXl3bI/EsmQtk4Bp0R5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444332; c=relaxed/simple;
	bh=Uh/l+wvpAdNyLfvb76dyVZNoJjcLs7n/j2LBZoLIqyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEkEa+s/LOgHjc7ERKpWZsaQvoivuxwsV2tsfNPKgPJfaq3DTI6c4XBkvl7DbTFT0gLfEt7wnDxq1qa43svwpvgQDzv4D9l/3dbyp9RmoYiJ7rXNhKU8o0WO4sYfj+bNHVGslqLsmNFkRCZxpcabT81zoUPemMgzrGkNuDnAssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lFf2y0TB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-143-118.net.vodafone.it [5.90.143.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D7FAFE;
	Wed, 28 May 2025 16:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748444302;
	bh=Uh/l+wvpAdNyLfvb76dyVZNoJjcLs7n/j2LBZoLIqyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFf2y0TB7zddeCfAWzXepQorMjvFDlDUACtEt3f5JkTVZd8oyrXpYWHbwU+cqeCwB
	 a5dQ4O6ppqwyje01SZPt1CkBQkC4SvqIbIopSEEzt51SFGRoOlngsdfeYYpHqStQxU
	 4S7TaLG/Fu+khj6R90RpYJb0PSqTMgeJCQ1ZLi4A=
Date: Wed, 28 May 2025 16:58:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 5/7] media: renesas: vsp1: Fix RWPF media bus code and
 frame size enumeration
Message-ID: <nury6gimeh45moskbhhqtjzpb3uoqhqhrj3hw7cbm2fetiuub7@jmbq2762qfw2>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-6-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429235322.29826-6-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Apr 30, 2025 at 02:53:20AM +0300, Laurent Pinchart wrote:
> The RWPF can't freely convert between all input and output formats. They
> support RGB <-> YUV conversion, but HSV formats can't be converted. Fix
> the media bus code and frame size enumeration to take this into account
> on the source pad.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 80 +++++++++++++++++--
>  1 file changed, 74 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 61f7e13ebeee..bd97fc75eb5b 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -21,29 +21,97 @@
>   * V4L2 Subdevice Operations
>   */
>
> +/* Keep HSV last. */
>  static const unsigned int rwpf_codes[] = {
> +	MEDIA_BUS_FMT_AYUV8_1X32,
>  	MEDIA_BUS_FMT_ARGB8888_1X32,
>  	MEDIA_BUS_FMT_AHSV8888_1X32,
> -	MEDIA_BUS_FMT_AYUV8_1X32,
>  };
>
>  static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
>  				    struct v4l2_subdev_state *sd_state,
>  				    struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->index >= ARRAY_SIZE(rwpf_codes))
> +	struct vsp1_entity *entity = to_vsp1_entity(subdev);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *format;

minor nit: could you move this one line up for ... reverse xmas tree
ordering :)

> +
> +	if (code->pad == RWPF_PAD_SINK)
> +		return vsp1_subdev_enum_mbus_code(subdev, sd_state, code);
> +
> +	state = vsp1_entity_get_state(entity, sd_state, code->which);
> +	if (!state)
>  		return -EINVAL;
>
> -	code->code = rwpf_codes[code->index];
> +	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
>
> -	if (code->pad == RWPF_PAD_SOURCE &&
> -	    code->code == MEDIA_BUS_FMT_AYUV8_1X32)
> +	guard(mutex)(&entity->lock);
> +
> +	/*
> +	 * The RWPF supports conversion between RGB and YUV formats, but HSV
> +	 * formats can't be converted.
> +	 */
> +	if (format->code == MEDIA_BUS_FMT_AHSV8888_1X32) {
> +		if (code->index)
> +			return -EINVAL;
> +
> +		code->code = MEDIA_BUS_FMT_AHSV8888_1X32;
> +	} else {
> +		if (code->index >= ARRAY_SIZE(rwpf_codes) - 1)
> +			return -EINVAL;
> +
> +		code->code = rwpf_codes[code->index];
> +	}
> +
> +	if (code->code == MEDIA_BUS_FMT_AYUV8_1X32)
>  		code->flags = V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
>  			    | V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
>
>  	return 0;
>  }
>
> +static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
> +				     struct v4l2_subdev_state *sd_state,
> +				     struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct vsp1_entity *entity = to_vsp1_entity(subdev);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *format;
> +
> +	if (fse->pad == RWPF_PAD_SINK)
> +		return vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
> +
> +	if (fse->index)
> +		return -EINVAL;
> +
> +	state = vsp1_entity_get_state(entity, sd_state, fse->which);
> +	if (!state)
> +		return -EINVAL;
> +
> +	format = v4l2_subdev_state_get_format(state, 0);

Could you use RWPF_PAD_SINK ?

> +
> +	guard(mutex)(&entity->lock);

As a general question, shouldn't we use the state lock ?
> +
> +	/*
> +	 * The RWPF supports conversion between RGB and YUV formats, but
> +	 * HSV formats can't be converted.
> +	 */
> +	if ((format->code == MEDIA_BUS_FMT_AHSV8888_1X32) !=
> +	    (fse->code == MEDIA_BUS_FMT_AHSV8888_1X32))
> +		return -EINVAL;
> +
> +	/*
> +	 * The size on the source pad is fixed and always identical to
> +	 * the sink pad.
> +	 */
> +	fse->min_width = format->width;
> +	fse->max_width = format->width;
> +	fse->min_height = format->height;
> +	fse->max_height = format->height;
> +
> +	return 0;
> +}

All minors
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> +
>  static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  				struct v4l2_subdev_state *sd_state,
>  				struct v4l2_subdev_format *fmt)
> @@ -275,7 +343,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
>
>  static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
>  	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
> -	.enum_frame_size = vsp1_subdev_enum_frame_size,
> +	.enum_frame_size = vsp1_rwpf_enum_frame_size,
>  	.get_fmt = vsp1_subdev_get_pad_format,
>  	.set_fmt = vsp1_rwpf_set_format,
>  	.get_selection = vsp1_rwpf_get_selection,
> --
> Regards,
>
> Laurent Pinchart
>
>

