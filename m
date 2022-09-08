Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AE25B132E
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 06:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiIHEM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 00:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiIHEMz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 00:12:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964FC7AC19
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 21:12:54 -0700 (PDT)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0FC46CC;
        Thu,  8 Sep 2022 06:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662610372;
        bh=megtpx1tdT+6t+GxRB65VxGI2QvVOt5TXi2nAlzAUdA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vRUENnmbWw+TX6zfzucrrREYhkHplKN5Ao3c0lgzZxSgnqyu0KN0w+PxpCf9zsd6B
         4ZRCBWb5o4RbAW2YwmrRsL9hblpF2qpGLa0SMorOi6KAL6HwXU5QT7XjWDuM+fdiRT
         Ff9YlK9eVzZ0L8g18LPTL2nHVSOaD7stH4cZGqMA=
Date:   Thu, 8 Sep 2022 13:12:43 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 5/6] staging: media: imx: Drop unused helper functions
Message-ID: <20220908041243.GI1140330@pyrite.rasen.tech>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
 <20220907200424.32136-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907200424.32136-6-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 11:04:23PM +0300, Laurent Pinchart wrote:
> The imx_media_find_subdev_by_fwnode(),
> imx_media_find_subdev_by_devname(), imx_media_pipeline_csi2_channel()
> and imx_media_pipeline_video_device() helper functions are not used.
> Drop them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx-media-utils.c | 68 ---------------------
>  drivers/staging/media/imx/imx-media.h       | 10 ---
>  2 files changed, 78 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 294c808b2ebe..07770b47e19b 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -626,36 +626,6 @@ void imx_media_grp_id_to_sd_name(char *sd_name, int sz, u32 grp_id, int ipu_id)
>  }
>  EXPORT_SYMBOL_GPL(imx_media_grp_id_to_sd_name);
>  
> -struct v4l2_subdev *
> -imx_media_find_subdev_by_fwnode(struct imx_media_dev *imxmd,
> -				struct fwnode_handle *fwnode)
> -{
> -	struct v4l2_subdev *sd;
> -
> -	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
> -		if (sd->fwnode == fwnode)
> -			return sd;
> -	}
> -
> -	return NULL;
> -}
> -EXPORT_SYMBOL_GPL(imx_media_find_subdev_by_fwnode);
> -
> -struct v4l2_subdev *
> -imx_media_find_subdev_by_devname(struct imx_media_dev *imxmd,
> -				 const char *devname)
> -{
> -	struct v4l2_subdev *sd;
> -
> -	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
> -		if (!strcmp(devname, dev_name(sd->dev)))
> -			return sd;
> -	}
> -
> -	return NULL;
> -}
> -EXPORT_SYMBOL_GPL(imx_media_find_subdev_by_devname);
> -
>  /*
>   * Adds a video device to the master video device list. This is called
>   * when a video device is registered.
> @@ -756,25 +726,6 @@ find_pipeline_entity(struct media_entity *start, u32 grp_id,
>  	return pad ? pad->entity : NULL;
>  }
>  
> -/*
> - * Find the upstream mipi-csi2 virtual channel reached from the given
> - * start entity in the current pipeline.
> - * Must be called with mdev->graph_mutex held.
> - */
> -int imx_media_pipeline_csi2_channel(struct media_entity *start_entity)
> -{
> -	struct media_pad *pad;
> -	int ret = -EPIPE;
> -
> -	pad = imx_media_pipeline_pad(start_entity, IMX_MEDIA_GRP_ID_CSI2,
> -				     0, true);
> -	if (pad)
> -		ret = pad->index - 1;
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(imx_media_pipeline_csi2_channel);
> -
>  /*
>   * Find a subdev reached upstream from the given start entity in
>   * the current pipeline.
> @@ -794,25 +745,6 @@ imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
>  }
>  EXPORT_SYMBOL_GPL(imx_media_pipeline_subdev);
>  
> -/*
> - * Find a subdev reached upstream from the given start entity in
> - * the current pipeline.
> - * Must be called with mdev->graph_mutex held.
> - */
> -struct video_device *
> -imx_media_pipeline_video_device(struct media_entity *start_entity,
> -				enum v4l2_buf_type buftype, bool upstream)
> -{
> -	struct media_entity *me;
> -
> -	me = find_pipeline_entity(start_entity, 0, buftype, upstream);
> -	if (!me)
> -		return ERR_PTR(-ENODEV);
> -
> -	return media_entity_to_video_device(me);
> -}
> -EXPORT_SYMBOL_GPL(imx_media_pipeline_video_device);
> -
>  /*
>   * Find a fwnode endpoint that maps to the given subdevice's pad.
>   * If there are multiple endpoints that map to the pad, only the
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index 5e794f291da6..5a1436dbb12d 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -201,24 +201,14 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  				  const struct imx_media_pixfmt *cc);
>  void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
>  				 u32 grp_id, int ipu_id);
> -struct v4l2_subdev *
> -imx_media_find_subdev_by_fwnode(struct imx_media_dev *imxmd,
> -				struct fwnode_handle *fwnode);
> -struct v4l2_subdev *
> -imx_media_find_subdev_by_devname(struct imx_media_dev *imxmd,
> -				 const char *devname);
>  void imx_media_add_video_device(struct imx_media_dev *imxmd,
>  				struct imx_media_video_dev *vdev);
> -int imx_media_pipeline_csi2_channel(struct media_entity *start_entity);
>  struct media_pad *
>  imx_media_pipeline_pad(struct media_entity *start_entity, u32 grp_id,
>  		       enum v4l2_buf_type buftype, bool upstream);
>  struct v4l2_subdev *
>  imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
>  			  bool upstream);
> -struct video_device *
> -imx_media_pipeline_video_device(struct media_entity *start_entity,
> -				enum v4l2_buf_type buftype, bool upstream);
>  struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad);
>  
>  struct imx_media_dma_buf {
