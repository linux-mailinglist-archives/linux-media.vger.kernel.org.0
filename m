Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8405D1C3547
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgEDJKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726467AbgEDJKe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:10:34 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC220C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 02:10:33 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id d17so19950551wrg.11
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=79ibWBkf4uUshIIunD096Enntdze4wodb2xcZMceQCc=;
        b=JyNW/Wq5jWBLtxonz0olVBOUUrXX8ONuv8I0i3wx3+GHIR0H+m669NHIGOP32Dfhbg
         /JG4WyAviCIPWbSbM1/3XPlUFxvKJTkcFdddCwNwr6CKnnZWoAXhY7PV4enxUBf+xgow
         auyvYslySI9qcdBt2mfG6ZNjhgFlKLqJsw0oAB7kOe4IGMHGYXQyQriTpLJKasnwQgAY
         DuOAWGdaA7lRlZZPK7WSfmJbeHnjXkQnf2gJmJhM0pwnx+UxhbXTcewJTMQbui0EDBoU
         tvuMIlT52KA6P61BGjszM9EIO2x9QpvI/kRQpSxmQZ3S0y5Yr2Mcc/Ul8aPFCY24gpzY
         /dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=79ibWBkf4uUshIIunD096Enntdze4wodb2xcZMceQCc=;
        b=TqagTG91vK0tX0CovmNw0fW5PZd6vtc11ul6B70RUfotftzmB7bCDESTcm4bdfK6Q+
         McPCYMhgB0oVv+U/mWzyDFwDKzOzPR08YVACYFQCnKjBJj+w7f71QAeYGpdOsXRlMFuK
         tTNheJadAbG/kqFAGv3p94vzpoU0KKnWgVs30WdNsQEn/JJk6mid1n4QkxvG945yhsmk
         ljWcYptdoQqedPvie4yy+3W3mdD4M98lFW0PkT7x8TQx8Bm4REzlzebCbZpV4gJOOkFi
         NC+3UkHuJMs+K3IrkvrPBpl7ozeLm+/rpVV2aty9i6hiMscq7ePk3ZrPEBlOh0O4KwW/
         yi1Q==
X-Gm-Message-State: AGi0Pubk/NDEwRYECvq33DXm0J4VwCLactIuIR05+AK36XdXnvQilbSt
        3dbWGZltw3MThdyJR5iib9M=
X-Google-Smtp-Source: APiQypJDl+nmuAVQNf+oDs6w2U2IoirjHCqbYBxniXZfKBtXO9dA014R4x5PqVEuFe8KPoUHDheewQ==
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr16596701wro.261.1588583432434;
        Mon, 04 May 2020 02:10:32 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id q14sm6699043wrc.66.2020.05.04.02.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:10:31 -0700 (PDT)
Date:   Mon, 4 May 2020 10:10:28 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 17/22] media: imx7: csi: Remove
 imx7_csi_get_upstream_endpoint()
Message-ID: <20200504091028.hlu7l7eav5gkrcen@arch-thunder.localdomain>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
 <20200501171556.14731-18-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501171556.14731-18-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
thanks for the work here to make imx7 better :)

On Fri, May 01, 2020 at 10:15:51AM -0700, Steve Longerbeam wrote:
> The function imx7_csi_get_upstream_endpoint() is not necessary for
> imx7. First, the imx7 CSI only receives from the CSI mux, so much of
> the code in there is pointless. Second, it is only used to determine
> whether the CSI mux has selected the CSI-2 input or the parallel input.
> This can be accomplished much more simply by getting the function type
> of selected input entity to the CSI mux.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

This all rework LGTM, and make even better makes sense.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 77 ++++------------------
>  1 file changed, 12 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 21a86fa3d89b..69f7abb32ae1 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -169,8 +169,6 @@ struct imx7_csi {
>  
>  	struct media_entity *sink;
>  
> -	struct v4l2_fwnode_endpoint upstream_ep;
> -
>  	struct v4l2_mbus_framefmt format_mbus[IMX7_CSI_PADS_NUM];
>  	const struct imx_media_pixfmt *cc[IMX7_CSI_PADS_NUM];
>  	struct v4l2_fract frame_interval[IMX7_CSI_PADS_NUM];
> @@ -435,61 +433,6 @@ static void imx7_csi_deinit(struct imx7_csi *csi)
>  	csi->is_init = false;
>  }
>  
> -static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
> -					  struct v4l2_fwnode_endpoint *ep,
> -					  bool skip_mux)
> -{
> -	struct device_node *endpoint, *port;
> -	struct media_entity *src;
> -	struct v4l2_subdev *sd;
> -	struct media_pad *pad;
> -
> -	if (!csi->src_sd)
> -		return -EPIPE;
> -
> -	src = &csi->src_sd->entity;
> -
> -	/*
> -	 * if the source is neither a mux or csi2 get the one directly upstream
> -	 * from this csi
> -	 */
> -	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
> -	    src->function != MEDIA_ENT_F_VID_MUX)
> -		src = &csi->sd.entity;
> -
> -skip_video_mux:
> -	/* get source pad of entity directly upstream from src */
> -	pad = imx_media_pipeline_pad(src, 0, 0, true);
> -	if (!pad)
> -		return -ENODEV;
> -
> -	sd = media_entity_to_v4l2_subdev(pad->entity);
> -
> -	/* To get bus type we may need to skip video mux */
> -	if (skip_mux && src->function == MEDIA_ENT_F_VID_MUX) {
> -		src = &sd->entity;
> -		goto skip_video_mux;
> -	}
> -
> -	/*
> -	 * NOTE: this assumes an OF-graph port id is the same as a
> -	 * media pad index.
> -	 */
> -	port = of_graph_get_port_by_id(sd->dev->of_node, pad->index);
> -	if (!port)
> -		return -ENODEV;
> -
> -	endpoint = of_get_next_child(port, NULL);
> -	of_node_put(port);
> -	if (!endpoint)
> -		return -ENODEV;
> -
> -	v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), ep);
> -	of_node_put(endpoint);
> -
> -	return 0;
> -}
> -
>  static int imx7_csi_link_setup(struct media_entity *entity,
>  			       const struct media_pad *local,
>  			       const struct media_pad *remote, u32 flags)
> @@ -556,23 +499,27 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_format *sink_fmt)
>  {
>  	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
> -	struct v4l2_fwnode_endpoint upstream_ep = {};
> +	struct media_pad *pad;
>  	int ret;
>  
>  	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
>  	if (ret)
>  		return ret;
>  
> -	ret = imx7_csi_get_upstream_endpoint(csi, &upstream_ep, true);
> -	if (ret) {
> -		v4l2_err(&csi->sd, "failed to find upstream endpoint\n");
> -		return ret;
> -	}
> +	if (!csi->src_sd)
> +		return -EPIPE;
> +
> +	/*
> +	 * find the entity that is selected by the CSI mux. This is needed
> +	 * to distinguish between a parallel or CSI-2 pipeline.
> +	 */
> +	pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
> +	if (!pad)
> +		return -ENODEV;
>  
>  	mutex_lock(&csi->lock);
>  
> -	csi->upstream_ep = upstream_ep;
> -	csi->is_csi2 = (upstream_ep.bus_type == V4L2_MBUS_CSI2_DPHY);
> +	csi->is_csi2 = (pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE);
>  
>  	mutex_unlock(&csi->lock);
>  
> -- 
> 2.17.1
>
> 
