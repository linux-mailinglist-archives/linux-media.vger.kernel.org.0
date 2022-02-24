Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B244C24E1
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 09:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiBXIJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 03:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiBXIJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 03:09:12 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B461C65F5
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 00:08:42 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9AA1A1BF208;
        Thu, 24 Feb 2022 08:08:36 +0000 (UTC)
Date:   Thu, 24 Feb 2022 09:08:34 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 18/27] media: ov5640: Implement init_cfg
Message-ID: <20220224080834.j4yvwxyyjj22rquk@uno.localdomain>
References: <20220223145603.121603-1-jacopo@jmondi.org>
 <20220223145603.121603-19-jacopo@jmondi.org>
 <YhaYKpI88/1k1fbE@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YhaYKpI88/1k1fbE@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Feb 23, 2022 at 10:25:14PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Feb 23, 2022 at 03:55:54PM +0100, Jacopo Mondi wrote:
> > Implement the init_cfg pad operation to initialize the subdev state
> > format to the default one.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 34 ++++++++++++++++++++++++----------
> >  1 file changed, 24 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 6c2c76b61140..c1fc2ab1e0cf 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -408,6 +408,18 @@ static inline bool ov5640_is_csi2(const struct ov5640_dev *sensor)
> >   * over i2c.
> >   */
> >  /* YUV422 UYVY VGA@30fps */
> > +
> > +static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
> > +	.code = MEDIA_BUS_FMT_UYVY8_2X8,
> > +	.width = 640,
> > +	.height = 480,
> > +	.colorspace = V4L2_COLORSPACE_SRGB,
> > +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
> > +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> > +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
> > +	.field = V4L2_FIELD_NONE,
> > +};
> > +
> >  static const struct reg_value ov5640_init_setting[] = {
> >  	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> >  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
> > @@ -3515,6 +3527,16 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
> >  	return ret;
> >  }
> >
> > +static int ov5640_init_cfg(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_state *state)
> > +{
> > +	struct v4l2_mbus_framefmt *fmt = v4l2_subdev_get_try_format(sd, state, 0);
>
> Could you run
>
> 	$ ./scripts/checkpatch.pl --strict --max-line-length=80
>
> on the entire set, and see what else is trivial to fix?
>

I was asked the same by Laurent, and I was honestly surprised as I
thought from our last discussions that 100 cols limit was encouraged.

Oh well, I suspect that' the price for having dropped the ball with
"[PATCH] media: Document coding style requirements"

I'll check with 80 cols limits.

Thanks
   j

> > +
> > +	*fmt = ov5640_default_fmt;
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
> >  	.s_power = ov5640_s_power,
> >  	.log_status = v4l2_ctrl_subdev_log_status,
>
> --
> Regards,
>
> Sakari Ailus
