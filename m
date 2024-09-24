Return-Path: <linux-media+bounces-18533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE9D984E35
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37B28B229DF
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EF3183CB4;
	Tue, 24 Sep 2024 22:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JZTGJLWz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0679918308A;
	Tue, 24 Sep 2024 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218551; cv=none; b=F6se4msT/g2UhvaK/U3nE0ltU4Px5v6hHbpSG/m+cBik7xG6DABVxP19IAlO28nq2QysJNPvcKTLAPWygFHaUXoTFqX0SYBt7ACcPRKVeaGlFvcy22CyGr9GATSJMVwFGkJQy/IIhut3Na+Q8deBQuVzMIsfl12pKvV1EGeN7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218551; c=relaxed/simple;
	bh=NN1DjooGHxfFNdIG/PuNIR/rBiHxbIazdx8EsEzgGrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZEok8yJNORBnoDdB1M6iP8snC+KoxjMc+VFSGnMXeEdyyvLAjXW+2RuDQqPotDvv5B+2LMo5sR4mw6EapGMNlzAsy9s09UDHGoF9ibwpcMo6AlyuVoSFXNRRbVbyzc8iYgHO0mcXN0nyPDzIsvm/KInnNUL08WiAk4m4LGIcmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JZTGJLWz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E51567E2;
	Wed, 25 Sep 2024 00:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727218461;
	bh=NN1DjooGHxfFNdIG/PuNIR/rBiHxbIazdx8EsEzgGrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZTGJLWzgxiRXrRktII0RhCJrNAPotrT3wwLyQSu2xDNif4zo7fq6VKmAmUA0/b3q
	 rKutEcFNxAEHRbSRGtI32EDs7gJRlM6vaqYV5UaSplonGl3OAV4hbm/qsBVF40c9dm
	 6aR69fL7wpqtl4+poxSDhz+YZ64dErlJHKZjf+5s=
Date: Wed, 25 Sep 2024 01:55:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 08/11] media: i2c: ov5645: Switch to
 {enable,disable}_streams
Message-ID: <20240924225515.GQ7165@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-9-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:06:07PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Switch from s_stream to enable_streams and disable_streams callbacks.

Here too you should explain why. The "why" is the most important part of
any commit message.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 90 +++++++++++++++++++-------------------
>  1 file changed, 46 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 9497ec737cb7..dc93514608ee 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -923,71 +923,71 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
> +static int ov5645_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>  {
> -	struct ov5645 *ov5645 = to_ov5645(subdev);
> -	struct v4l2_subdev_state *state;
> +	struct ov5645 *ov5645 = to_ov5645(sd);
>  	int ret;
>  
> -	state = v4l2_subdev_lock_and_get_active_state(&ov5645->sd);
> -
> -	if (enable) {
> -		ret = pm_runtime_resume_and_get(ov5645->dev);
> -		if (ret < 0) {
> -			v4l2_subdev_unlock_state(state);
> -			return ret;
> -		}
> +	ret = pm_runtime_resume_and_get(ov5645->dev);
> +	if (ret < 0)
> +		return ret;
>  
> -		ret = ov5645_set_register_array(ov5645,
> +	ret = ov5645_set_register_array(ov5645,
>  					ov5645->current_mode->data,
>  					ov5645->current_mode->data_size);
> -		if (ret < 0) {
> -			dev_err(ov5645->dev, "could not set mode %dx%d\n",
> -				ov5645->current_mode->width,
> -				ov5645->current_mode->height);
> -			goto err_rpm_put;
> -		}
> -		ret = __v4l2_ctrl_handler_setup(&ov5645->ctrls);
> -		if (ret < 0) {
> -			dev_err(ov5645->dev, "could not sync v4l2 controls\n");
> -			goto err_rpm_put;
> -		}
> -
> -		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x45);
> -		if (ret < 0)
> -			goto err_rpm_put;
> -
> -		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> -				       OV5645_SYSTEM_CTRL0_START);
> -		if (ret < 0)
> -			goto err_rpm_put;
> -	} else {
> -		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
> -		if (ret < 0)
> -			goto stream_off_rpm_put;
> +	if (ret < 0) {
> +		dev_err(ov5645->dev, "could not set mode %dx%d\n",
> +			ov5645->current_mode->width,
> +			ov5645->current_mode->height);
> +		goto err_rpm_put;
> +	}
> +	ret = __v4l2_ctrl_handler_setup(&ov5645->ctrls);
> +	if (ret < 0) {
> +		dev_err(ov5645->dev, "could not sync v4l2 controls\n");
> +		goto err_rpm_put;
> +	}
>  
> -		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> -				       OV5645_SYSTEM_CTRL0_STOP);
> +	ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x45);
> +	if (ret < 0)
> +		goto err_rpm_put;
>  
> -		goto stream_off_rpm_put;
> -	}
> +	ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> +			       OV5645_SYSTEM_CTRL0_START);
> +	if (ret < 0)
> +		goto err_rpm_put;
>  
> -	v4l2_subdev_unlock_state(state);
>  	return 0;
>  
>  err_rpm_put:
>  	pm_runtime_put_sync(ov5645->dev);
>  	return ret;
> +}
> +
> +static int ov5645_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct ov5645 *ov5645 = to_ov5645(sd);
> +	int ret;
> +
> +	ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
> +	if (ret < 0)
> +		goto rpm_put;
> +
> +	ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> +			       OV5645_SYSTEM_CTRL0_STOP);
>  
> -stream_off_rpm_put:
> +rpm_put:
>  	pm_runtime_mark_last_busy(ov5645->dev);
>  	pm_runtime_put_autosuspend(ov5645->dev);
> -	v4l2_subdev_unlock_state(state);
> +
>  	return ret;
>  }
>  
>  static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> -	.s_stream = ov5645_s_stream,
> +	.s_stream = v4l2_subdev_s_stream_helper,
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> @@ -996,6 +996,8 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ov5645_set_format,
>  	.get_selection = ov5645_get_selection,
> +	.enable_streams = ov5645_enable_streams,
> +	.disable_streams = ov5645_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_core_ops ov5645_core_ops = {

-- 
Regards,

Laurent Pinchart

