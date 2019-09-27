Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69B6EC04DA
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 14:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfI0MJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 08:09:31 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56421 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfI0MJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 08:09:31 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iDp3n-0003Xe-P3; Fri, 27 Sep 2019 14:09:19 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iDp3l-0006LG-MZ; Fri, 27 Sep 2019 14:09:17 +0200
Date:   Fri, 27 Sep 2019 14:09:17 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 13/14] media: tvp5150: add support to limit sdtv
 standards
Message-ID: <20190927120917.6t7hg2wnwrzf6ds4@pengutronix.de>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
 <20190830101646.6530-14-m.felsch@pengutronix.de>
 <3a04cee0-0d2a-d727-8a88-61370e71db0f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a04cee0-0d2a-d727-8a88-61370e71db0f@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:08:50 up 132 days, 18:26, 86 users,  load average: 0.08, 0.07,
 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 19-09-27 10:52, Hans Verkuil wrote:
> Hi Marco,
> 
> On 8/30/19 12:16 PM, Marco Felsch wrote:
> > The tvp5150 accepts NTSC(M,J,4.43), PAL (B,D,G,H,I,M,N) and SECAM video
> > data and is able to auto-detect the input signal. The auto-detection
> > does not work if the connector does not receive an input signal and the
> > tvp5150 might not be configured correctly. This misconfiguration leads
> > into wrong decoded video streams if the tvp5150 gets powered on before
> > the video signal is present.
> > 
> > Limit the supported sdtv standards according to the actual selected
> > connector to avoid a misconfiguration.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> checkpatch gave a bunch of warnings:
> 
> WARNING: line over 80 characters
> #97: FILE: drivers/media/i2c/tvp5150.c:1393:
> +                       decoder->cur_connector->base.connector.analog.sdtv_stds);
> 
> WARNING: line over 80 characters
> #107: FILE: drivers/media/i2c/tvp5150.c:1613:
> +                               decoder->connectors[i].base.connector.analog.sdtv_stds);
> 
> CHECK: Alignment should match open parenthesis
> #107: FILE: drivers/media/i2c/tvp5150.c:1613:
> +                       tvp5150_s_std(sd,
> +                               decoder->connectors[i].base.connector.analog.sdtv_stds);
> 
> I think it would be best to introduce a local pointer to
> decoder->connectors[i].base.connector.analog.

I fixed it, thanks.

Regards,
  Marco 

> 
> Regards,
> 
> 	Hans
> 
> > ---
> > [1] https://patchwork.kernel.org/cover/10794703/
> > 
> > v8:
> > - adapt commit message
> > - fix rebasing issue
> > - apdapt to new v4l2_fwnode_connector_analog naming
> > - fix cur_connector update during tvp5150_link_setup()
> >   -> Only update if we have of-connectors.
> > - fix supported_stds detection during tvp5150_s_std()
> >   -> use connectors_num to detect of-connectors presence
> > 
> > v5:
> > - probe() initialize supported tv-norms according the given connectors
> >   if they are available.
> > - check if media-controller is used. Don't limit the norm if it isn't
> >   used.
> > - add more logic to be smarter during connector changing so it is
> >   intuitiver for the user space.
> > 
> > v2-v4:
> > - nothing since the patch was squashed from series [1] into this
> >   series.
> > 
> >  drivers/media/i2c/tvp5150.c | 78 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 76 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > index d7079809f33f..da7e7fe16f89 100644
> > --- a/drivers/media/i2c/tvp5150.c
> > +++ b/drivers/media/i2c/tvp5150.c
> > @@ -32,6 +32,13 @@
> >  #define TVP5150_MBUS_FMT	MEDIA_BUS_FMT_UYVY8_2X8
> >  #define TVP5150_FIELD		V4L2_FIELD_ALTERNATE
> >  #define TVP5150_COLORSPACE	V4L2_COLORSPACE_SMPTE170M
> > +#define TVP5150_STD_MASK	(V4L2_STD_NTSC     | \
> > +				 V4L2_STD_NTSC_443 | \
> > +				 V4L2_STD_PAL      | \
> > +				 V4L2_STD_PAL_M    | \
> > +				 V4L2_STD_PAL_N    | \
> > +				 V4L2_STD_PAL_Nc   | \
> > +				 V4L2_STD_SECAM)
> >  
> >  #define TVP5150_MAX_CONNECTORS	3 /* Check dt-bindings for more information */
> >  
> > @@ -64,6 +71,7 @@ struct tvp5150 {
> >  
> >  	struct media_pad pads[TVP5150_NUM_PADS];
> >  	struct tvp5150_connector connectors[TVP5150_MAX_CONNECTORS];
> > +	struct tvp5150_connector *cur_connector;
> >  	unsigned int connectors_num;
> >  
> >  	struct v4l2_ctrl_handler hdl;
> > @@ -783,17 +791,33 @@ static int tvp5150_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
> >  static int tvp5150_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
> >  {
> >  	struct tvp5150 *decoder = to_tvp5150(sd);
> > +	struct tvp5150_connector *cur_con = decoder->cur_connector;
> > +	v4l2_std_id supported_stds;
> >  
> >  	if (decoder->norm == std)
> >  		return 0;
> >  
> > +	/* In case of no of-connectors are available no limitations are made */
> > +	if (!decoder->connectors_num)
> > +		supported_stds = V4L2_STD_ALL;
> > +	else
> > +		supported_stds = cur_con->base.connector.analog.sdtv_stds;
> > +
> > +	/*
> > +	 * Check if requested std or group of std's is/are supported by the
> > +	 * connector.
> > +	 */
> > +	if ((supported_stds & std) == 0)
> > +		return -EINVAL;
> > +
> >  	/* Change cropping height limits */
> >  	if (std & V4L2_STD_525_60)
> >  		decoder->rect.height = TVP5150_V_MAX_525_60;
> >  	else
> >  		decoder->rect.height = TVP5150_V_MAX_OTHERS;
> >  
> > -	decoder->norm = std;
> > +	/* Set only the specific supported std in case of group of std's. */
> > +	decoder->norm = supported_stds & std;
> >  
> >  	return tvp5150_set_std(sd, std);
> >  }
> > @@ -1331,6 +1355,8 @@ static int tvp5150_link_setup(struct media_entity *entity,
> >  			  TVP5150_BLACK_SCREEN, 0);
> >  
> >  	if (flags & MEDIA_LNK_FL_ENABLED) {
> > +		u32 new_norm;
> > +
> >  		/*
> >  		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
> >  		 * Both links must be enabled in one-shot regardless which link
> > @@ -1342,6 +1368,29 @@ static int tvp5150_link_setup(struct media_entity *entity,
> >  			if (err)
> >  				return err;
> >  		}
> > +
> > +		if (!decoder->connectors_num)
> > +			return 0;
> > +
> > +		/* Update the current connector */
> > +		decoder->cur_connector =
> > +			container_of(remote, struct tvp5150_connector, pad);
> > +
> > +		/*
> > +		 * Do nothing if the new connector supports the same tv-norms as
> > +		 * the old one.
> > +		 */
> > +		new_norm = decoder->norm &
> > +			decoder->cur_connector->base.connector.analog.sdtv_stds;
> > +		if (decoder->norm == new_norm)
> > +			return 0;
> > +
> > +		/*
> > +		 * Fallback to the new connector tv-norms if we can't find any
> > +		 * common between the current tv-norm and the new one.
> > +		 */
> > +		tvp5150_s_std(sd, new_norm ? new_norm :
> > +			decoder->cur_connector->base.connector.analog.sdtv_stds);
> >  	}
> >  
> >  	return 0;
> > @@ -1559,6 +1608,9 @@ static int tvp5150_registered(struct v4l2_subdev *sd)
> >  				TVP5150_COMPOSITE1;
> >  
> >  			tvp5150_selmux(sd);
> > +			decoder->cur_connector = &decoder->connectors[i];
> > +			tvp5150_s_std(sd,
> > +				decoder->connectors[i].base.connector.analog.sdtv_stds);
> >  		}
> >  	}
> >  
> > @@ -1848,6 +1900,13 @@ tvp5150_add_connector(struct tvp5150 *decoder, struct device_node *np,
> >  		goto err;
> >  	}
> >  
> > +	if (!(vc->connector.analog.sdtv_stds & TVP5150_STD_MASK)) {
> > +		dev_err(dev, "Unsupported tv-norm on connector %s\n",
> > +			remote_np->name);
> > +		ret = -EINVAL;
> > +		goto err;
> > +	}
> > +
> >  	c->ent.flags = MEDIA_ENT_FL_CONNECTOR;
> >  	c->ent.name = vc->label;
> >  	c->ent.name = kasprintf(GFP_KERNEL, "%s %s", remote_np->name,
> > @@ -1945,6 +2004,7 @@ static int tvp5150_probe(struct i2c_client *c)
> >  	struct v4l2_subdev *sd;
> >  	struct device_node *np = c->dev.of_node;
> >  	struct regmap *map;
> > +	unsigned int i;
> >  	int res;
> >  
> >  	/* Check if the adapter supports the needed features */
> > @@ -1989,7 +2049,21 @@ static int tvp5150_probe(struct i2c_client *c)
> >  	if (res < 0)
> >  		return res;
> >  
> > -	core->norm = V4L2_STD_ALL;	/* Default is autodetect */
> > +	/*
> > +	 * Iterate over all available connectors in case they are supported and
> > +	 * successfully parsed. Fallback to default autodetect in case they
> > +	 * aren't supported.
> > +	 */
> > +	for (i = 0; i < core->connectors_num; i++) {
> > +		struct v4l2_fwnode_connector *vc;
> > +
> > +		vc = &core->connectors[i].base;
> > +		core->norm |= vc->connector.analog.sdtv_stds;
> > +	}
> > +
> > +	if (!core->connectors_num)
> > +		core->norm = V4L2_STD_ALL;
> > +
> >  	core->detected_norm = V4L2_STD_UNKNOWN;
> >  	core->input = TVP5150_COMPOSITE1;
> >  	core->enable = true;
> > 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
