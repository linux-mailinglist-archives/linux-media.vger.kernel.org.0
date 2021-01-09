Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373ED2EFC49
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 01:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbhAIAme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 19:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbhAIAme (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 19:42:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B08DC061573
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 16:41:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD799DA;
        Sat,  9 Jan 2021 01:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610152913;
        bh=ZNfbKUVfb7ySthJ39KA20oO/xcn5foKLB72UE78qjD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g9srSkLcg2YjxucEqgrG5RbeJY09eNwP1/8nToxsDpDIJEFajZm2gb1y+kbW6C96t
         Zm9uLkBTPnEMQsc+h5xHjrPDcLX/ka6tax8N9exnyYFyvct00/qDQ8XGE+KJ9c/uBB
         0nbS9Y5sPnciDM4CuDVThLJ/JQlWOOCzzZ9ykYF4=
Date:   Sat, 9 Jan 2021 02:41:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 31/75] media: imx: capture: Support creating immutable
 link to capture device
Message-ID: <X/j7xDVQ31ZxyodN@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-32-laurent.pinchart@ideasonboard.com>
 <10de5176-d699-231a-9415-b6730d8eedfa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10de5176-d699-231a-9415-b6730d8eedfa@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Wed, Jan 06, 2021 at 09:44:37AM -0800, Steve Longerbeam wrote:
> On 1/5/21 7:28 AM, Laurent Pinchart wrote:
> > When the subdevice connected to the capture device has a single possible
> > sink, there's no point in making the link mutable. Support creating
> > immutable links.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/staging/media/imx/imx-ic-prpencvf.c   | 2 +-
> >   drivers/staging/media/imx/imx-media-capture.c | 7 +++++--
> >   drivers/staging/media/imx/imx-media-csi.c     | 2 +-
> >   drivers/staging/media/imx/imx-media.h         | 3 ++-
> >   drivers/staging/media/imx/imx7-media-csi.c    | 2 +-
> >   5 files changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> > index 88d69425e1b3..6c9c75ffb30c 100644
> > --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> > +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> > @@ -1269,7 +1269,7 @@ static int prp_registered(struct v4l2_subdev *sd)
> >   	if (IS_ERR(priv->vdev))
> >   		return PTR_ERR(priv->vdev);
> >   
> > -	ret = imx_media_capture_device_register(priv->vdev);
> > +	ret = imx_media_capture_device_register(priv->vdev, false);
> 
> Might as well go ahead and pass true here now, to make the prpenc and 
> prpvf links to the capture device immutable, since there is only one 
> source and sink in this case.

This patch only adds the infrastructure to create immutable links, but
doesn't make use of it. Subsequent patches change that. I can add
another patch for the prpenc and prpvf.

> >   	if (ret)
> >   		goto remove_vdev;
> >   
> > diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> > index 04eb612ff1fa..c6991e8f151c 100644
> > --- a/drivers/staging/media/imx/imx-media-capture.c
> > +++ b/drivers/staging/media/imx/imx-media-capture.c
> > @@ -898,12 +898,14 @@ static int capture_init_format(struct capture_priv *priv)
> >   	return 0;
> >   }
> >   
> > -int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
> > +int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
> > +				      bool immutable)
> >   {
> >   	struct capture_priv *priv = to_capture_priv(vdev);
> >   	struct v4l2_subdev *sd = priv->src_sd;
> >   	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
> >   	struct video_device *vfd = vdev->vfd;
> > +	u32 flags;
> >   	int ret;
> >   
> >   	/* get media device */
> > @@ -927,8 +929,9 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
> >   		 video_device_node_name(vfd));
> >   
> >   	/* Create the link from the src_sd devnode pad to device node. */
> > +	flags = immutable ? MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE : 0;
> >   	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
> > -				    &vfd->entity, 0, 0);
> > +				    &vfd->entity, 0, flags);
> >   	if (ret) {
> >   		dev_err(priv->dev, "failed to create link to device node\n");
> >   		video_unregister_device(vfd);
> > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > index 436f3d7160fa..d54d2a3789c0 100644
> > --- a/drivers/staging/media/imx/imx-media-csi.c
> > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > @@ -1796,7 +1796,7 @@ static int csi_registered(struct v4l2_subdev *sd)
> >   		goto free_fim;
> >   	}
> >   
> > -	ret = imx_media_capture_device_register(priv->vdev);
> > +	ret = imx_media_capture_device_register(priv->vdev, false);
> >   	if (ret)
> >   		goto remove_vdev;
> >   
> > diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> > index 16ab879e0084..4efc4d186c0a 100644
> > --- a/drivers/staging/media/imx/imx-media.h
> > +++ b/drivers/staging/media/imx/imx-media.h
> > @@ -288,7 +288,8 @@ struct imx_media_video_dev *
> >   imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
> >   			      int pad, bool legacy_api);
> >   void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
> > -int imx_media_capture_device_register(struct imx_media_video_dev *vdev);
> > +int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
> > +				      bool immutable);
> >   void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
> >   struct imx_media_buffer *
> >   imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index afd1a7e35bfe..c087a212efdd 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -1093,7 +1093,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
> >   	if (IS_ERR(csi->vdev))
> >   		return PTR_ERR(csi->vdev);
> >   
> > -	ret = imx_media_capture_device_register(csi->vdev);
> > +	ret = imx_media_capture_device_register(csi->vdev, false);
> >   	if (ret)
> >   		imx_media_capture_device_remove(csi->vdev);
> >   

-- 
Regards,

Laurent Pinchart
