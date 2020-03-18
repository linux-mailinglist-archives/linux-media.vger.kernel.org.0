Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDBB189DB6
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 15:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgCROUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 10:20:06 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:44431 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCROUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 10:20:06 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id DFE26200017;
        Wed, 18 Mar 2020 14:20:00 +0000 (UTC)
Date:   Wed, 18 Mar 2020 15:22:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] media: i2c: max9286: Parse overlap window value
Message-ID: <20200318142257.a2pvikx4jddq4ej2@uno.localdomain>
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
 <20200316202757.529740-4-jacopo+renesas@jmondi.org>
 <2b648a3f-f7e6-f994-ae2e-1746e2bbf4ba@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b648a3f-f7e6-f994-ae2e-1746e2bbf4ba@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Mar 18, 2020 at 09:50:22AM +0000, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 16/03/2020 20:27, Jacopo Mondi wrote:
> > Parse the 'maxim,overlap-window' property value and cache its
> > content to later program registers 0x63 and 0x64.
> >
> > As specified by the bindings documentation, the property is mandatory as
> > long as a default value cannot be established to guarantee DTB backward
> > compatibility.
>
> Well, we don't yet have the DTB bindings 'in' I don't believe so I don't
> think we need to worry about backwards compatibility yet...
>
> Oh, or do you mean in the future it wouldn't have to be mandatory
> perhaps ...

I meant in future. As we don't know now what an opportune default is
for this un-documented setting, I think having all DTBs using this
first version fully specified will make any decision we take in future
easier to implement in a back-ward compatible way.

>
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 06edd8bd3e82..0357515860b2 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -117,6 +117,9 @@
> >  #define MAX9286_REV_FLEN(n)		((n) - 20)
> >  /* Register 0x49 */
> >  #define MAX9286_VIDEO_DETECT_MASK	0x0f
> > +/* Register 0x64 */
> > +#define MAX9286_OVLP_WINDOWH_MASK	GENMASK(4, 0)
> > +
> >  /* Register 0x69 */
> >  #define MAX9286_LFLTBMONMASKED		BIT(7)
> >  #define MAX9286_LOCKMONMASKED		BIT(6)
> > @@ -164,6 +167,8 @@ struct max9286_priv {
> >  	unsigned int csi2_data_lanes;
> >  	struct max9286_source sources[MAX9286_NUM_GMSL];
> >  	struct v4l2_async_notifier notifier;
> > +
> > +	u32 overlap_window;
> >  };
> >
> >  static struct max9286_source *next_source(struct max9286_priv *priv,
> > @@ -895,6 +900,11 @@ static int max9286_setup(struct max9286_priv *priv)
> >  	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> >  		      MAX9286_FSYNCMETH_AUTO);
> >
> > +	/* Configure overlap window. */
> > +	max9286_write(priv, 0x63, priv->overlap_window);
> > +	max9286_write(priv, 0x64, (priv->overlap_window >> 8) &
> > +				  MAX9286_OVLP_WINDOWH_MASK);
> > +
> >  	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> >  	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> >  		      MAX9286_HVSRC_D14);
> > @@ -1041,8 +1051,24 @@ static int max9286_parse_dt(struct max9286_priv *priv)
> >  	struct device_node *i2c_mux;
> >  	struct device_node *node = NULL;
> >  	unsigned int i2c_mux_mask = 0;
> > +	int ret;
> >
> >  	of_node_get(dev->of_node);
> > +
> > +	/*
> > +	 * FIXM: Require overlap window value to be specified by DTS as long as
>
> /FIXM/FIXME/
>
> > +	 * the control function is not clarified. As soon as a default
> > +	 * behaviour can be established drop this requirement, while older
>
> /established/established,/
> /requirement,/requirement/
>
>
> > +	 * DTBs are guaranteed to be fully specified.
> > +	 */
> > +	ret = of_property_read_u32(dev->of_node, "maxim,overlap-window",
> > +				   &priv->overlap_window);
> > +	if (ret) {
> > +		dev_err(dev, "Missing property \"maxim,overlap-window\"\n");
> > +		of_node_put(dev->of_node);
> > +		return -EINVAL;
> > +	}
> > +
>
> Other wise, this looks fine except for my concerns and wondering if this
> could be approached by defining a property of the requirements in the
> serializer and parsing that in some form.

As per my previous reply, I had the same concern but mostly for the
reverse channel setting. This is a configuration that applies solely
to the deserializer (at least, that's my understanding not knowing
exactly what this property controls)

>
>
> --
> Kieran
>
> >  	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> >  	if (!i2c_mux) {
> >  		dev_err(dev, "Failed to find i2c-mux node\n");
> >
>
