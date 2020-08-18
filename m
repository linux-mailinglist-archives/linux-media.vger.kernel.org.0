Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16CD24844E
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 14:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgHRMB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 08:01:28 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:54333 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgHRMBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 08:01:25 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D99D140009;
        Tue, 18 Aug 2020 12:01:20 +0000 (UTC)
Date:   Tue, 18 Aug 2020 14:05:02 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hyun Kwon <hyun.kwon@xilinx.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 4/4] media: i2c: max9286: Remove cached formats
Message-ID: <20200818120502.zadh2gm52iyu2bub@uno.localdomain>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
 <20200817143540.247340-5-jacopo+renesas@jmondi.org>
 <20200817221505.GA21736@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817221505.GA21736@xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hyun,

On Mon, Aug 17, 2020 at 03:15:05PM -0700, Hyun Kwon wrote:
> Hi Jacopo,
>
> Thanks for sharing!
>
> On Mon, Aug 17, 2020 at 07:35:40AM -0700, Jacopo Mondi wrote:
> > Now that the image stream formats are retrieved from the remote
> > sources there's no need to cache them in the driver structure.
> >
> > Remove the cached mbus frame formats and their initialization.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 17 -----------------
> >  1 file changed, 17 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index a4e23396c4b6..97dfee767bbf 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -160,8 +160,6 @@ struct max9286_priv {
> >  	struct v4l2_ctrl_handler ctrls;
> >  	struct v4l2_ctrl *pixelrate;
> >
> > -	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> > -
> >  	/* Protects controls and fmt structures */
> >  	struct mutex mutex;
> >
> > @@ -758,18 +756,6 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
> >  	.pad		= &max9286_pad_ops,
> >  };
> >
> > -static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
> > -{
> > -	fmt->width		= 1280;
> > -	fmt->height		= 800;
> > -	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
>
> There's one more hardcoded place left. This had some implication on output
> format, MAX9286_DATATYPE_YUV422_8BIT, which is programmed at 0x12.
> Now, this patch set can potentially result in a mismatch between bus format
> and acutal programmed format.

Yup, very correct, I should adjust the DT based on the deserialized
format!

Thanks for noticing!

>
> Thanks,
> -hyun
>
> > -	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
> > -	fmt->field		= V4L2_FIELD_NONE;
> > -	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
> > -	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
> > -	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
> > -}
> > -
> >  static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
> >  {
> >  	struct max9286_priv *priv = sd_to_max9286(subdev);
> > @@ -834,9 +820,6 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
> >
> >  	/* Configure V4L2 for the MAX9286 itself */
> >
> > -	for (i = 0; i < MAX9286_N_SINKS; i++)
> > -		max9286_init_format(&priv->fmt[i]);
> > -
> >  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
> >  	priv->sd.internal_ops = &max9286_subdev_internal_ops;
> >  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > --
> > 2.27.0
> >
