Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E143D497210
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 15:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236737AbiAWOYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 09:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbiAWOYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 09:24:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B93C06173B;
        Sun, 23 Jan 2022 06:24:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1E0F25E;
        Sun, 23 Jan 2022 15:24:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642947856;
        bh=9rYDagVYV9xz3DYJCJqnRGtConwCIoUg66z7JXwQv84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=heo7Rk9I+cxR15VXuM6p/1MIYqu6RRqxiXh2KuBZF4dIAUZHSpGI4HVsh5N8bXP/E
         68S4qKsQ/pYriMYJC2+Mf0467I9ViWfHX43WXLDMq4RJeOm42t+fb/qiryowmp/2F4
         MP3jIFYGvkpu3vXMEslHLJP4GkIe0/6Z38vCPQcU=
Date:   Sun, 23 Jan 2022 16:23:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 11/13] media: rcar-csi2: Config by using the remote
 frame_desc
Message-ID: <Ye1k/z+hon26apv6@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211017182449.64192-12-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Oct 17, 2021 at 08:24:47PM +0200, Jacopo Mondi wrote:
> Configure the CSI-2 receiver by inspecting the remote subdev frame_desc.
> 
> Configure the link clock rate, field handling and CSI-2 Virtual Channel
> and DT filtering using the frame descriptor retrieved from the
> transmitter.
> 
> This change also makes mandatory for any subdevice that operates with
> the R-Car CSI-2 receiver to implement the .get_frame_desc() operation.
> 
> [based on a patch from]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> [rework based on lates multistream support]
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 145 +++++++++++++++-----
>  1 file changed, 110 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index b60845b1e563..4ef7b9cb1ab7 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -69,10 +69,7 @@ struct rcar_csi2;
>  #define FLD_REG				0x1c
>  #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
>  #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
> -#define FLD_FLD_EN4			BIT(3)
> -#define FLD_FLD_EN3			BIT(2)
> -#define FLD_FLD_EN2			BIT(1)
> -#define FLD_FLD_EN			BIT(0)
> +#define FLD_FLD_EN(n)			BIT((n) & 0xf)
>  
>  /* Automatic Standby Control */
>  #define ASTBY_REG			0x20
> @@ -339,6 +336,17 @@ static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
>  	return NULL;
>  }
>  
> +static const struct rcar_csi2_format *rcsi2_datatype_to_fmt(unsigned int dt)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rcar_csi2_formats); i++)
> +		if (rcar_csi2_formats[i].datatype == dt)
> +			return &rcar_csi2_formats[i];
> +
> +	return NULL;
> +}
> +
>  enum rcar_csi2_pads {
>  	RCAR_CSI2_SINK,
>  	RCAR_CSI2_SOURCE_VC0,
> @@ -370,8 +378,6 @@ struct rcar_csi2 {
>  	struct v4l2_subdev *remote;
>  	unsigned int remote_pad;
>  
> -	struct v4l2_mbus_framefmt mf;
> -
>  	struct mutex lock;
>  	int stream_count;
>  
> @@ -421,6 +427,32 @@ static int rcsi2_exit_standby(struct rcar_csi2 *priv)
>  	return 0;
>  }
>  
> +static int rcsi2_get_remote_frame_desc(struct rcar_csi2 *priv,
> +				       struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct media_pad *pad;
> +	int ret;
> +
> +	if (!priv->remote)
> +		return -ENODEV;
> +
> +	pad = media_entity_remote_pad(&priv->pads[RCAR_CSI2_SINK]);
> +	if (!pad)
> +		return -ENODEV;
> +
> +	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
> +			       pad->index, fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		dev_err(priv->dev, "Frame desc do not describe CSI-2 link");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
>  				unsigned int lanes)
>  {
> @@ -460,11 +492,14 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  	return 0;
>  }
>  
> -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> -			   unsigned int lanes)
> +static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
> +			   struct v4l2_mbus_frame_desc *fd, unsigned int lanes)
>  {
> +	const struct v4l2_mbus_frame_desc_entry_csi2 *csi2_desc;
> +	const struct rcar_csi2_format *format;
>  	struct v4l2_subdev *source;
>  	struct v4l2_ctrl *ctrl;
> +	unsigned int i;
>  	u64 mbps;
>  
>  	if (!priv->remote)
> @@ -480,12 +515,30 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  		return -EINVAL;
>  	}
>  
> +	/* Verify that all remote streams send the same datatype. */

I don't think that's a good idea. Capturing image data and embedded data
is a common use case, and those use different data types.

> +	csi2_desc = NULL;
> +	for (i = 0; i < fd->num_entries; i++) {
> +		struct v4l2_mbus_frame_desc_entry_csi2 *stream_desc;
> +
> +		stream_desc = &fd->entry[i].bus.csi2;
> +		if (!csi2_desc)
> +			csi2_desc = stream_desc;
> +
> +		if (csi2_desc->dt != stream_desc->dt) {
> +			dev_err(priv->dev,
> +				"Remote streams with different DT: %u - %u\n",
> +				csi2_desc->dt, stream_desc->dt);
> +			return -EINVAL;
> +		}
> +	}
> +	format = rcsi2_datatype_to_fmt(csi2_desc->dt);
> +
>  	/*
>  	 * Calculate the phypll in mbps.
>  	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
>  	 * bps = link_freq * 2
>  	 */
> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> +	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
>  	do_div(mbps, lanes * 1000000);
>  
>  	return mbps;
> @@ -541,49 +594,64 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  
>  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  {
> -	const struct rcar_csi2_format *format;
> +	const struct v4l2_subdev_stream_configs *configs;
> +	struct v4l2_subdev_state *state;
>  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> +	struct v4l2_mbus_frame_desc fd;
>  	unsigned int lanes;
>  	unsigned int i;
>  	int mbps, ret;
>  
> -	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> -		priv->mf.width, priv->mf.height,
> -		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
> -
> -	/* Code is validated in set_fmt. */
> -	format = rcsi2_code_to_fmt(priv->mf.code);
> +	/* Get information about multiplexed link. */
> +	ret = rcsi2_get_remote_frame_desc(priv, &fd);
> +	if (ret)
> +		return ret;
>  
> -	/*
> -	 * Enable all supported CSI-2 channels with virtual channel and
> -	 * data type matching.
> -	 *
> -	 * NOTE: It's not possible to get individual datatype for each
> -	 *       source virtual channel. Once this is possible in V4L2
> -	 *       it should be used here.
> -	 */
> -	for (i = 0; i < priv->info->num_channels; i++) {
> +	for (i = 0; i < fd.num_entries; i++) {
> +		struct v4l2_mbus_frame_desc_entry *entry = &fd.entry[i];
>  		u32 vcdt_part;
>  
> -		vcdt_part = VCDT_SEL_VC(i) | VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
> -			VCDT_SEL_DT(format->datatype);
> +		vcdt_part = VCDT_SEL_VC(entry->bus.csi2.vc) |
> +			    VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
> +			    VCDT_SEL_DT(entry->bus.csi2.dt);
>  
>  		/* Store in correct reg and offset. */
> -		if (i < 2)
> -			vcdt |= vcdt_part << ((i % 2) * 16);
> +		if (entry->bus.csi2.vc < 2)
> +			vcdt |= vcdt_part <<
> +				((entry->bus.csi2.vc % 2) * 16);
>  		else
> -			vcdt2 |= vcdt_part << ((i % 2) * 16);
> +			vcdt2 |= vcdt_part <<
> +				((entry->bus.csi2.vc % 2) * 16);
> +
> +		dev_dbg(priv->dev, "VC: %d datatype: 0x%x\n",
> +			entry->bus.csi2.vc, entry->bus.csi2.dt);
>  	}
>  
> -	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
> -		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
> -			| FLD_FLD_EN;
> +	/*
> +	 * Configure field handling inspecting the formats of the
> +	 * sink pad streams.
> +	 */
> +	state = v4l2_subdev_lock_active_state(&priv->subdev);
> +	configs = &state->stream_configs;
> +	for (i = 0; i < configs->num_configs; ++i) {
> +		const struct v4l2_subdev_stream_config *config = configs->configs;
> +
> +		if (config->pad != RCAR_CSI2_SINK)
> +			continue;
> +
> +		if (config->fmt.field != V4L2_FIELD_ALTERNATE)
> +			continue;
>  
> -		if (priv->mf.height == 240)
> +		fld |= FLD_DET_SEL(1);
> +		fld |= FLD_FLD_EN(config->stream);
> +
> +		/* PAL vs NTSC. */
> +		if (config->fmt.height == 240)
>  			fld |= FLD_FLD_NUM(0);
>  		else
>  			fld |= FLD_FLD_NUM(1);
>  	}
> +	v4l2_subdev_unlock_state(state);
>  
>  	/*
>  	 * Get the number of active data lanes inspecting the remote mbus
> @@ -596,7 +664,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  	phycnt = PHYCNT_ENABLECLK;
>  	phycnt |= (1 << lanes) - 1;
>  
> -	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	mbps = rcsi2_calc_mbps(priv, &fd, lanes);
>  	if (mbps < 0)
>  		return mbps;
>  
> @@ -894,6 +962,13 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
>  	struct rcar_csi2 *priv = notifier_to_csi2(notifier);
>  	int pad;
>  
> +	if (!v4l2_subdev_has_op(subdev, pad, get_frame_desc)) {
> +		dev_err(priv->dev,
> +			"Subdev %s bound failed: missing get_frame_desc()\n",
> +			subdev->name);
> +		return -EINVAL;
> +	}
> +
>  	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
>  					  MEDIA_PAD_FL_SOURCE);
>  	if (pad < 0) {

-- 
Regards,

Laurent Pinchart
