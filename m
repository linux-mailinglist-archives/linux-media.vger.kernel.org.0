Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F074B5A66
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 20:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiBNTFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 14:05:45 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiBNTFj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 14:05:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07CD8594D;
        Mon, 14 Feb 2022 11:05:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8961847F;
        Mon, 14 Feb 2022 20:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644865302;
        bh=HaePsS3lXNpHcPj5MPmXkT342o0zhEQout96BKmcGfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DVZ/ILvxxW3X4E8dem/WjuOYpafbvnIvf4TYhA/KEYE24g7k7byr7cTV94RGQC9lT
         4zOQ7MNsybURE0h0YS57sz6MGWYcjssC8xdVU7UeqRw2+JV/h6yIotI0ew8GUH0e2w
         7TAU6lOn/13+Lzl24I7pjGI3wCK+nxyX3zaEwbKo=
Date:   Mon, 14 Feb 2022 21:01:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] media: imx: Store the type of hardware
 implementation
Message-ID: <YgqnEFhdBIAqnYXv@pendragon.ideasonboard.com>
References: <20220211142752.779952-1-alexander.stein@ew.tq-group.com>
 <20220211142752.779952-2-alexander.stein@ew.tq-group.com>
 <20220214185035.uomrdkzth7adkw5c@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214185035.uomrdkzth7adkw5c@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 14, 2022 at 07:50:35PM +0100, Jacopo Mondi wrote:
> On Fri, Feb 11, 2022 at 03:27:44PM +0100, Alexander Stein wrote:
> > From: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> >
> > The driver covers i.MX5/6, as well as i.MX7/8 hardware.
> > Those implementations differ, e.g. in the sizes of buffers they accept.
> >
> > Some functionality should be abstracted, and storing type achieves that.
> >
> > Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Switch back to using enum
> >
> >  drivers/staging/media/imx/imx-ic-prpencvf.c   | 3 ++-
> >  drivers/staging/media/imx/imx-media-capture.c | 5 ++++-
> >  drivers/staging/media/imx/imx-media-csi.c     | 3 ++-
> >  drivers/staging/media/imx/imx-media.h         | 8 +++++++-
> >  drivers/staging/media/imx/imx7-media-csi.c    | 3 ++-
> >  5 files changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> > index 9b81cfbcd777..671bb9a681aa 100644
> > --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> > +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> > @@ -1266,7 +1266,8 @@ static int prp_registered(struct v4l2_subdev *sd)
> >
> >  	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
> >  						   &ic_priv->sd,
> > -						   PRPENCVF_SRC_PAD, true);
> > +						   PRPENCVF_SRC_PAD, true,
> > +						   DEVICE_TYPE_IMX56);
> >  	if (IS_ERR(priv->vdev))
> >  		return PTR_ERR(priv->vdev);
> >
> > diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> > index 93ba09236010..65dc95a48ecc 100644
> > --- a/drivers/staging/media/imx/imx-media-capture.c
> > +++ b/drivers/staging/media/imx/imx-media-capture.c
> > @@ -34,6 +34,7 @@ struct capture_priv {
> >
> >  	struct imx_media_video_dev vdev;	/* Video device */
> >  	struct media_pad vdev_pad;		/* Video device pad */
> > +	enum imx_media_device_type type;	/* Type of hardware implementation */
> >
> >  	struct v4l2_subdev *src_sd;		/* Source subdev */
> >  	int src_sd_pad;				/* Source subdev pad */
> > @@ -957,7 +958,8 @@ EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
> >
> >  struct imx_media_video_dev *
> >  imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
> > -			      int pad, bool legacy_api)
> > +			      int pad, bool legacy_api,
> > +			      enum imx_media_device_type type)
> >  {
> >  	struct capture_priv *priv;
> >  	struct video_device *vfd;
> > @@ -972,6 +974,7 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
> >  	priv->src_sd_pad = pad;
> >  	priv->dev = dev;
> >  	priv->legacy_api = legacy_api;
> > +	priv->type = type;
> >
> >  	mutex_init(&priv->mutex);
> >  	INIT_LIST_HEAD(&priv->ready_q);
> > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > index bd7f156f2d52..d5557bb4913d 100644
> > --- a/drivers/staging/media/imx/imx-media-csi.c
> > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > @@ -1803,7 +1803,8 @@ static int csi_registered(struct v4l2_subdev *sd)
> >  	}
> >
> >  	priv->vdev = imx_media_capture_device_init(priv->sd.dev, &priv->sd,
> > -						   CSI_SRC_PAD_IDMAC, true);
> > +						   CSI_SRC_PAD_IDMAC, true,
> > +						   DEVICE_TYPE_IMX56);
> >  	if (IS_ERR(priv->vdev)) {
> >  		ret = PTR_ERR(priv->vdev);
> >  		goto free_fim;
> > diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> > index f263fc3adbb9..e4c22b3ccd57 100644
> > --- a/drivers/staging/media/imx/imx-media.h
> > +++ b/drivers/staging/media/imx/imx-media.h
> > @@ -96,6 +96,11 @@ enum imx_pixfmt_sel {
> >  	PIXFMT_SEL_ANY = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB | PIXFMT_SEL_BAYER,
> >  };
> >
> > +enum imx_media_device_type {
> > +	DEVICE_TYPE_IMX56,
> > +	DEVICE_TYPE_IMX78,
> > +};
> > +
> 
> Isn't this too coarse as a distinction ?
> 
> I tried adding per-soc identifiers here:
> https://lore.kernel.org/linux-media/20220214184318.409208-5-jacopo@jmondi.org/T/#u
> 
> Maybe they can help ?

I'd really prefer not mixing the two. This enumeration is meant to
select which backend to use in helpers that should not be shared in the
first place. I've started decoupling the i.MX6 and i.MX7+ code, but it
will still take some time (the work in progress is available at [1] if
anyone is interested). In the meantime I'm OK with this patch, but any
need for additional device identification should be limited to the
imx7-media-csi driver or the i.MX6-specific code, not added to shared
helpers.

[1] https://gitlab.com/ideasonboard/nxp/linux/-/tree/pinchartl/csi-bridge/destage

> >  struct imx_media_buffer {
> >  	struct vb2_v4l2_buffer vbuf; /* v4l buffer must be first */
> >  	struct list_head  list;
> > @@ -282,7 +287,8 @@ int imx_media_ic_unregister(struct v4l2_subdev *sd);
> >  /* imx-media-capture.c */
> >  struct imx_media_video_dev *
> >  imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
> > -			      int pad, bool legacy_api);
> > +			      int pad, bool legacy_api,
> > +			      enum imx_media_device_type type);
> >  void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
> >  int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
> >  				      u32 link_flags);
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index 32311fc0e2a4..173dd014c2d6 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -1039,7 +1039,8 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
> >  	}
> >
> >  	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
> > -						  IMX7_CSI_PAD_SRC, false);
> > +						  IMX7_CSI_PAD_SRC, false,
> > +						  DEVICE_TYPE_IMX78);
> >  	if (IS_ERR(csi->vdev))
> >  		return PTR_ERR(csi->vdev);
> >

-- 
Regards,

Laurent Pinchart
