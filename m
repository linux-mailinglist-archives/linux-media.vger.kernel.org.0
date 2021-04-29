Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8333736E38B
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 05:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhD2DP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 23:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhD2DP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 23:15:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63FAC06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 20:14:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5D2DBC0;
        Thu, 29 Apr 2021 05:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619666079;
        bh=BGucD1ACeM5veqtbFDTPny+bwJvmusp55cj9lBRjKsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CT14/K31RHWu61uQovJyKmSeg9FYvfLHl+yY1vsx7XgcQWbFG5PdTcaad40orH7nZ
         fs0SRYc6niTgokrEj6Z57DSDcj0O4nr+nXxEiiru8osZfu1m730JwU2yVnrjievwNf
         P7o/d7PhPPcuvPExvbH0wggIi5DXKtUPk8x9MgJo=
Date:   Thu, 29 Apr 2021 06:14:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH 2/4] media: ti-vpe: cal: use frame desc to get vc and dt
Message-ID: <YIokmYuFq6n5HjZl@pendragon.ideasonboard.com>
References: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
 <20210427132028.1005757-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427132028.1005757-3-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Apr 27, 2021 at 04:20:26PM +0300, Tomi Valkeinen wrote:
> Use get_frame_desc() to get the frame desc from the connected source,
> and use the provided virtual channel and datatype instead of hardcoded
> ones.
> 
> get_frame_desc() works per stream, but as we don't support multiple
> streams yet, we will just always use stream 0.
> 
> If the source doesn't support get_frame_desc(), fall back to the
> previous method of always capturing virtual channel 0 and any datatype.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 26 +++++++++++
>  drivers/media/platform/ti-vpe/cal.c          | 49 +++++++++++++++++++-
>  drivers/media/platform/ti-vpe/cal.h          |  3 ++
>  3 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index a4b783e038b5..36103f5af6e9 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -583,6 +583,32 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>  	return ret;
>  }
>  
> +int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
> +				       struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct media_pad *pad;
> +	int ret;
> +
> +	if (!phy->source)
> +		return -ENODEV;
> +
> +	pad = media_entity_remote_pad(&phy->pads[CAL_CAMERARX_PAD_SINK]);
> +	if (!pad)
> +		return -ENODEV;
> +
> +	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc, pad->index,
> +			       fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		dev_err(phy->cal->dev, "Frame desc do not describe CSI-2 link");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /* ------------------------------------------------------------------
>   *	V4L2 Subdev Operations
>   * ------------------------------------------------------------------
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index fcc81024ae18..7975bb449acd 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -469,10 +469,56 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
>  	return stopped;
>  }
>  
> +static int
> +cal_get_remote_frame_desc_entry(struct cal_camerarx *phy, u32 stream,

As this isn't a camerarx function, would it be better to pass the
cal_ctx pointer instead ?

> +				struct v4l2_mbus_frame_desc_entry *entry)
> +{
> +	struct v4l2_mbus_frame_desc fd;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = cal_camerarx_get_remote_frame_desc(phy, &fd);
> +	if (ret) {
> +		if (ret != -ENOIOCTLCMD)
> +			dev_err(phy->cal->dev,
> +				"Failed to get remote frame desc: %d\n", ret);

Should we drop this message as the caller also prints one ?

> +		return ret;
> +	}
> +
> +	for (i = 0; i < fd.num_entries; i++) {
> +		if (stream == fd.entry[i].stream) {
> +			*entry = fd.entry[i];
> +			return 0;
> +		}
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  int cal_ctx_prepare(struct cal_ctx *ctx)
>  {
> +	struct v4l2_mbus_frame_desc_entry entry;
>  	int ret;
>  
> +	ret = cal_get_remote_frame_desc_entry(ctx->phy, ctx->stream, &entry);
> +
> +	if (ret == -ENOIOCTLCMD) {
> +		ctx->vc = 0;
> +		ctx->datatype = CAL_CSI2_CTX_DT_ANY;

I'd have moved this after the !ret case, but that's very personal.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	} else if (!ret) {
> +		ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
> +		       entry.stream,
> +		       entry.length,
> +		       entry.bus.csi2.vc,
> +		       entry.bus.csi2.dt);
> +
> +		ctx->vc = entry.bus.csi2.vc;
> +		ctx->datatype = entry.bus.csi2.dt;
> +	} else {
> +		ctx_err(ctx, "Failed to get remote frame desc: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ctx->use_pix_proc = !ctx->fmtinfo->meta;
>  
>  	if (ctx->use_pix_proc) {
> @@ -925,8 +971,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>  	ctx->dma_ctx = inst;
>  	ctx->csi2_ctx = inst;
>  	ctx->cport = inst;
> -	ctx->vc = 0;
> -	ctx->datatype = CAL_CSI2_CTX_DT_ANY;
> +	ctx->stream = 0;
>  
>  	ret = cal_ctx_v4l2_init(ctx);
>  	if (ret)
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 29b865d1a238..3aea444f8bf8 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -245,6 +245,7 @@ struct cal_ctx {
>  	u8			pix_proc;
>  	u8			vc;
>  	u8			datatype;
> +	u32			stream;
>  
>  	bool			use_pix_proc;
>  };
> @@ -318,6 +319,8 @@ const struct cal_format_info *cal_format_by_code(u32 code);
>  
>  void cal_quickdump_regs(struct cal_dev *cal);
>  
> +int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
> +				       struct v4l2_mbus_frame_desc *fd);
>  void cal_camerarx_disable(struct cal_camerarx *phy);
>  void cal_camerarx_i913_errata(struct cal_camerarx *phy);
>  struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,

-- 
Regards,

Laurent Pinchart
