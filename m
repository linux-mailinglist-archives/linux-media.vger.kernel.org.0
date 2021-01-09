Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA6D2EFC6E
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 01:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbhAIAtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 19:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbhAIAtj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 19:49:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D9BC061573
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 16:48:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75E0CDA;
        Sat,  9 Jan 2021 01:48:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610153331;
        bh=KdcRoywM9vVka8P43ilbCtE+//b/ZYRsbGGPBHraZQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=REeydAKyTHATTcD/J/K7q2F8DKO/4CIwXbw8CFSNeCWcfProSMFdgn6B33M2aYsiM
         KV7hMR+QwkFT2rBxDDIqoBnfgjoMwKXMqZwu9dB3CcztKU9Gz0z6x459lC0bhBvPW5
         WDwl+mu7Eb0RAWUm45BnVEaaDEIY+3p0c85ufF+k=
Date:   Sat, 9 Jan 2021 02:48:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 31/75] media: imx: capture: Support creating immutable
 link to capture device
Message-ID: <X/j9ZtwmDkpjr7Ke@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-32-laurent.pinchart@ideasonboard.com>
 <1d2eb33ad845e09313cd25e7d5fb35527f29b880.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d2eb33ad845e09313cd25e7d5fb35527f29b880.camel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, Jan 08, 2021 at 02:37:54PM -0300, Ezequiel Garcia wrote:
> Hi Laurent,
> 
> On Tue, 2021-01-05 at 17:28 +0200, Laurent Pinchart wrote:
> > When the subdevice connected to the capture device has a single possible
> > sink, there's no point in making the link mutable. Support creating
> > immutable links.
> 
> Does this apply to csi2_notify_bound as welll
> that is, is there any point in making the sensor link mutable?

We could have multiple sensors connected to the same CSI-2 receiver,
with all but one always in reset (not a recommended hardware design, but
it has been done and can work in some cases).

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/imx-ic-prpencvf.c   | 2 +-
> >  drivers/staging/media/imx/imx-media-capture.c | 7 +++++--
> >  drivers/staging/media/imx/imx-media-csi.c     | 2 +-
> >  drivers/staging/media/imx/imx-media.h         | 3 ++-
> >  drivers/staging/media/imx/imx7-media-csi.c    | 2 +-
> >  5 files changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> > index 88d69425e1b3..6c9c75ffb30c 100644
> > --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> > +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> > @@ -1269,7 +1269,7 @@ static int prp_registered(struct v4l2_subdev *sd)
> >         if (IS_ERR(priv->vdev))
> >                 return PTR_ERR(priv->vdev);
> >  
> > -       ret = imx_media_capture_device_register(priv->vdev);
> > +       ret = imx_media_capture_device_register(priv->vdev, false);
> 
> Maybe it's just me, but I dislike this boolean parameter pattern,
> as opposed to passing the flags directly, or some other MUTABLE/IMMUTABLE
> enum value.

Something along these lines ?

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 88d69425e1b3..d990553de87b 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1269,7 +1269,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	if (IS_ERR(priv->vdev))
 		return PTR_ERR(priv->vdev);

-	ret = imx_media_capture_device_register(priv->vdev);
+	ret = imx_media_capture_device_register(priv->vdev, 0);
 	if (ret)
 		goto remove_vdev;

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 04eb612ff1fa..a17e087a0d02 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -898,7 +898,9 @@ static int capture_init_format(struct capture_priv *priv)
 	return 0;
 }

-int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
+int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
+				      u32 link_flags)
+				      bool immutable)
 {
 	struct capture_priv *priv = to_capture_priv(vdev);
 	struct v4l2_subdev *sd = priv->src_sd;
@@ -927,8 +929,10 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 		 video_device_node_name(vfd));

 	/* Create the link from the src_sd devnode pad to device node. */
+	if (link_flags & MEDIA_LNK_FL_IMMUTABLE)
+		link_flags |= MEDIA_LNK_FL_ENABLED;
 	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
-				    &vfd->entity, 0, 0);
+				    &vfd->entity, 0, link_flags);
 	if (ret) {
 		dev_err(priv->dev, "failed to create link to device node\n");
 		video_unregister_device(vfd);
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index cfad000d9352..ce64f3da81f7 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1788,7 +1788,7 @@ static int csi_registered(struct v4l2_subdev *sd)
 		goto free_fim;
 	}

-	ret = imx_media_capture_device_register(priv->vdev);
+	ret = imx_media_capture_device_register(priv->vdev, 0);
 	if (ret)
 		goto remove_vdev;

diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 2ea2e62ddf86..492d9a64e704 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -288,7 +288,8 @@ struct imx_media_video_dev *
 imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 			      int pad, bool legacy_api);
 void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
-int imx_media_capture_device_register(struct imx_media_video_dev *vdev);
+int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
+				      u32 link_flags);
 void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
 struct imx_media_buffer *
 imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index afd1a7e35bfe..1b13347bd0a0 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1093,7 +1093,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);

-	ret = imx_media_capture_device_register(csi->vdev);
+	ret = imx_media_capture_device_register(csi->vdev, 0);
 	if (ret)
 		imx_media_capture_device_remove(csi->vdev);

-- 
Regards,

Laurent Pinchart
