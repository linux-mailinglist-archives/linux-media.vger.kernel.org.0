Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A05599838
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 11:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346915AbiHSI5G convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 19 Aug 2022 04:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346616AbiHSI5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 04:57:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4789BEF029
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 01:57:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oOxoK-00016s-4O; Fri, 19 Aug 2022 10:57:00 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oOxoI-000g6G-Vf; Fri, 19 Aug 2022 10:56:58 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oOxoI-0003l2-5I; Fri, 19 Aug 2022 10:56:58 +0200
Message-ID: <b77936e0227d7046fa97433128b56c752dba1fde.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: Use get_mbus_config instead of parsing
 upstream DT endpoints
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Date:   Fri, 19 Aug 2022 10:56:58 +0200
In-Reply-To: <20220819080347.wvzb6avyaperfcy2@uno.localdomain>
References: <20220818124253.753080-1-p.zabel@pengutronix.de>
         <20220819080347.wvzb6avyaperfcy2@uno.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fr, 2022-08-19 at 10:03 +0200, Jacopo Mondi wrote:
> Hi Philipp
> 
> On Thu, Aug 18, 2022 at 02:42:53PM +0200, Philipp Zabel wrote:
[...]
> > -static int csi_get_upstream_endpoint(struct csi_priv *priv,
> > -				     struct v4l2_fwnode_endpoint *ep)
> > +static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > +					struct v4l2_mbus_config *mbus_cfg)
> >  {
> > -	struct fwnode_handle *endpoint;
> > -	struct v4l2_subdev *sd;
> > -	struct media_pad *pad;
> > +	struct v4l2_subdev *sd, *remote_sd;
> > +	struct media_pad *remote_pad;
> > +	int ret;
> > 
> >  	if (!IS_ENABLED(CONFIG_OF))
> >  		return -ENXIO;
> 
> Is this still necessary ?

I think not. I will drop it.

> > @@ -206,19 +204,21 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
> >  	}
> > 
> >  	/* get source pad of entity directly upstream from sd */
> > -	pad = imx_media_pipeline_pad(&sd->entity, 0, 0, true);
> > -	if (!pad)
> > -		return -ENODEV;
> > -
> > -	endpoint = imx_media_get_pad_fwnode(pad);
> > -	if (IS_ERR(endpoint))
> > -		return PTR_ERR(endpoint);
> > +	remote_pad = media_entity_remote_pad_unique(&sd->entity,
> > +						    MEDIA_PAD_FL_SOURCE);
> > +	if (IS_ERR(remote_pad))
> > +		return PTR_ERR(remote_pad);
> > 
> > -	v4l2_fwnode_endpoint_parse(endpoint, ep);
> > +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> > 
> > -	fwnode_handle_put(endpoint);
> > +	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > +			       remote_pad->index, mbus_cfg);
> > +	if (ret == -ENOIOCTLCMD)
> > +		v4l2_err(&priv->sd,
> > +			 "upstream entity %s does not implement get_mbus_config()\n",
> > +			 remote_pad->entity->name);
> 
> This makes mandatory for the remote to implement .get_mbus_config().
> I think it is fine, even more this is staging, and I don't think you
> can use any meaningful default in case the op is not implemented...

Yes. Many of the relevant drivers already implement this (adv7180,
tc358743, tvp5150), but it's missing from ov5640 and some of the other
ovti drivers.

> > @@ -1254,13 +1246,13 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
> >  		break;
> >  	case CSI_SRC_PAD_DIRECT:
> >  	case CSI_SRC_PAD_IDMAC:
> > -		ret = csi_get_upstream_endpoint(priv, &upstream_ep);
> > +		ret = csi_get_upstream_mbus_config(priv, &mbus_cfg);
> >  		if (ret) {
> >  			v4l2_err(&priv->sd, "failed to find upstream endpoint\n");
> 
> Should the error message be updated ?

Indeed, I updated one and forgot about the rest. I'll update them all.

[...]
> 
> 
> All minors, with the error messages fixed
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thank you for the review!

regards
Philipp
