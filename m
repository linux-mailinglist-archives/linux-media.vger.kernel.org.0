Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F49378AE98
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 13:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjH1LQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 07:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjH1LQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 07:16:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C418ACA;
        Mon, 28 Aug 2023 04:16:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B117B4E6;
        Mon, 28 Aug 2023 13:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693221299;
        bh=wAOvC7LAehxVYXk6M4iIL52K0KDU5VksYyIuhU3qATY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jxIvWgITwBDI06yIRviN0q0gXqxt5EeuBkFTeTXTwYV76N64UfrUO2/vfc7mfeZMd
         JPPLO+k6kyHM9LUApJhUOUUTKdd3R/tqye3/Qq4rGRsf2CCk5dLJmSIZz+H9i9pwdc
         NNCQbF9fG/kmovIhcyf2ueqsq4d2gSaHQEjsZxEc=
Date:   Mon, 28 Aug 2023 14:16:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: rdacm2: Remove an incorrect
 fwnode_handle_put() call
Message-ID: <20230828111630.GH14596@pendragon.ideasonboard.com>
References: <d9230082aefcb7bab6363c51c08598eb5ab62cfc.1693037086.git.christophe.jaillet@wanadoo.fr>
 <zijwh5kcrfsg4q4pmxtkzia7tdpg4wnau53npe2y2xe4j7n7wy@zqwigtmyftu3>
 <20230828105723.GF14596@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230828105723.GF14596@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 28, 2023 at 01:57:24PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 28, 2023 at 09:48:10AM +0200, Jacopo Mondi wrote:
> > Hi Christophe
> > 
> > On Sat, Aug 26, 2023 at 10:05:06AM +0200, Christophe JAILLET wrote:
> > > The commit in Fixes has removed an fwnode_handle_put() call in the error
> > > handling path of the probe.
> > >
> > > Remove the same call from the remove function.
> > >
> > > Fixes: 1029939b3782 ("media: v4l: async: Simplify async sub-device fwnode matching")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > 
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> The subject line should read "rdacm21", not "rdacm2". with that fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > > ---
> > > /!\   This patch is highly speculative. Review with care.   /!\
> > >
> > > If it is correct, it is likely that other similar issue lurk in commit
> > > 1029939b3782. I've not looked in detail and my cocci script did not
> > > trigger on them but drivers/media/i2c/max9286.c also looks like a
> > > similar candidate.
> > 
> > I think the call to  fwnode_handle_put(priv->sd.fwnode) in
> > max9286_v4l2_unregister() can indeed be removed, yes!
> 
> I agree.

drivers/media/platform/nxp/imx-mipi-csis.c also needs a fix.

Christophe, do you plan to send patches for those ? If not, I can handle
it.

> > > ---
> > >  drivers/media/i2c/rdacm21.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > > index a36a709243fd..3e22df36354f 100644
> > > --- a/drivers/media/i2c/rdacm21.c
> > > +++ b/drivers/media/i2c/rdacm21.c
> > > @@ -608,7 +608,6 @@ static void rdacm21_remove(struct i2c_client *client)
> > >  	v4l2_async_unregister_subdev(&dev->sd);
> > >  	v4l2_ctrl_handler_free(&dev->ctrls);
> > >  	i2c_unregister_device(dev->isp);
> > > -	fwnode_handle_put(dev->sd.fwnode);
> > >  }
> > >
> > >  static const struct of_device_id rdacm21_of_ids[] = {

-- 
Regards,

Laurent Pinchart
