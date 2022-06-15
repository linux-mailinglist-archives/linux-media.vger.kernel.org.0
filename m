Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E6E54D59C
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 02:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241580AbiFOX7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 19:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbiFOX7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 19:59:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED74B41985
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 16:59:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACFE3A49;
        Thu, 16 Jun 2022 01:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655337582;
        bh=Do5GQ/GhhhITu4xzg0TsY4VKbh3h6q/B4zn5AjeGyLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C1whCT1PsZA1g2uXigioEjfTeEhxHQ+J8LO+eszaIwaXpF9lJ8SSdja1gogz8wg/d
         uTggP3Mey1Q4b5HHcuFi9KKa5eW2ty7cdKusy//cF61xpH5nnyZZW8/JF7HWpBWIMd
         nxHmyZkzkYrMfolwV5u+zD6Wjx2vkIgOiVcqI6mA=
Date:   Thu, 16 Jun 2022 02:59:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 3/4] media: imx: imx-mipi-csis: Implement the
 .get_frame_desc() operation
Message-ID: <YqpyZOvD3f9MFq39@pendragon.ideasonboard.com>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
 <20220615192602.25472-4-laurent.pinchart@ideasonboard.com>
 <20220615235314.umyosoxusngzmvey@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615235314.umyosoxusngzmvey@arch-thunder>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Thu, Jun 16, 2022 at 12:53:14AM +0100, Rui Miguel Silva wrote:
> On Wed, Jun 15, 2022 at 10:26:01PM +0300, Laurent Pinchart wrote:
> > The CSIS is connected to its sink through an SoC-specific gasket that
> > needs to be configured. Depending on the platform, the gasket
> > configuration requires knowing the CSI-2 DT. To provide the needed
> > information, implement the .get_frame_desc() operation.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 27 ++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 8674aaad5fa0..905072871ed2 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -1160,6 +1160,32 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >  
> > +static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +				    struct v4l2_mbus_frame_desc *fd)
> > +{
> > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > +	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
> 
> Think that you should check *fd before use here, other than that.

fd isn't supposed to be null, the same way sd isn't, or the various
format pointers passed to other subdev operations aren't. We don't check
those either, that's why I haven't checked fd here.

> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> 
> > +
> > +	if (pad != CSIS_PAD_SOURCE)
> > +		return -EINVAL;
> > +
> > +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> > +	fd->num_entries = 1;
> > +
> > +	memset(entry, 0, sizeof(*entry));
> > +
> > +	mutex_lock(&csis->lock);
> > +
> > +	entry->flags = 0;
> > +	entry->pixelcode = csis->csis_fmt->code;
> > +	entry->bus.csi2.vc = 0;
> > +	entry->bus.csi2.dt = csis->csis_fmt->data_type;
> > +
> > +	mutex_unlock(&csis->lock);
> > +
> > +	return 0;
> > +}
> > +
> >  static int mipi_csis_log_status(struct v4l2_subdev *sd)
> >  {
> >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > @@ -1184,6 +1210,7 @@ static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
> >  	.enum_mbus_code		= mipi_csis_enum_mbus_code,
> >  	.get_fmt		= mipi_csis_get_fmt,
> >  	.set_fmt		= mipi_csis_set_fmt,
> > +	.get_frame_desc		= mipi_csis_get_frame_desc,
> >  };
> >  
> >  static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {

-- 
Regards,

Laurent Pinchart
