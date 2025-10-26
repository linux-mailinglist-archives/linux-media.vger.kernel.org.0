Return-Path: <linux-media+bounces-45594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D557FC0B827
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 01:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44C33BC3B4
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 00:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AECA302143;
	Mon, 27 Oct 2025 00:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gLxxpakx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0048C303A33;
	Mon, 27 Oct 2025 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761523210; cv=none; b=NSvmfqlU2DdaCbIRu2QsHB+PmrLu9D/XAhQwCfTDxf873VG8xpFq8bhr3POVsgZpAYwVnw3M1Tjrgtt4gtyAsGT9OTZ83v+bLTm7yIHa2xNhX9DyLKVCKHzpCBm/Y6rGmgqLxX5eh7f0XYCs5kXqHdPh4TV6DXmVTPauM5rSlFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761523210; c=relaxed/simple;
	bh=2LEzP3txFu5ErcmDdC5BABECgcH7F5vf2cMFAPsu270=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCgwhHH8jSP1QzE8VJdGAWBLx9jQntsw2fZxBZlERY840BgPyyh8H2bTNCyOvT4N8pigI2o2UaFwN4Ujnhiy+6HzjmNp0l6My/d+PdHjZwsEG8brAc4pFa91YfxTrbchlznUpytNi6Oj0Q3TVOAwukAKUmd+VCnHMiCv4Jc4CiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gLxxpakx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4411CE9B;
	Mon, 27 Oct 2025 00:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761523098;
	bh=2LEzP3txFu5ErcmDdC5BABECgcH7F5vf2cMFAPsu270=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLxxpakxqUgpog66O8G7I2uQM4WUbF4UeXljNud5eTWUlQ6iKLdaBfmzHzaKUwiVl
	 H4P8o1LyEeFyV7zungjl6PzoY5UWYmO5oFgR2RQ2RK2K//LcBk7qyiBTKtjKbFKlcw
	 WkMGRjfcHurfqs+cBb8VXdXbF0raanqgkLPbSgSs=
Date: Mon, 27 Oct 2025 01:59:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] media: imx8mq-mipi-csi2: Implement
 .get_frame_desc subdev callback
Message-ID: <20251026235951.GL13023@pendragon.ideasonboard.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-4-e04a6fc593bd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-csi2_imx8mq-v5-4-e04a6fc593bd@nxp.com>

Hi Guoniu,

Thank you for the patch.

On Wed, Aug 20, 2025 at 07:04:59PM +0800, Guoniu Zhou wrote:
> Implement .get_frame_desc subdev callback since downstream subdev
> need to get frame description.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 529928b94a193e02177f8773a0e68375b59b0a08..a28ccdeef8521c0e00d13b1860eadef5f2118651 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -648,6 +648,37 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int imx8mq_mipi_csi_get_frame_desc(struct v4l2_subdev *sd,
> +					  unsigned int pad,
> +					  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
> +	const struct csi2_pix_format *csi2_fmt;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +
> +	if (pad != MIPI_CSI2_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SOURCE);
> +	csi2_fmt = find_csi2_format(fmt->code);
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (!csi2_fmt)
> +		return -EPIPE;
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	entry->flags = 0;
> +	entry->pixelcode = csi2_fmt->code;
> +	entry->bus.csi2.vc = 0;
> +	entry->bus.csi2.dt = media_bus_fmt_to_csi2_dt(csi2_fmt->code);
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
>  	.s_stream	= imx8mq_mipi_csi_s_stream,
>  };
> @@ -656,6 +687,7 @@ static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
>  	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
>  	.get_fmt		= v4l2_subdev_get_fmt,
>  	.set_fmt		= imx8mq_mipi_csi_set_fmt,
> +	.get_frame_desc		= imx8mq_mipi_csi_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {

-- 
Regards,

Laurent Pinchart

