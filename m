Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2EA5B04C5
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 15:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiIGNKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 09:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiIGNJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 09:09:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2993F641D;
        Wed,  7 Sep 2022 06:09:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C12DADD;
        Wed,  7 Sep 2022 15:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662556192;
        bh=TgDjbh1X5PWwjOUrKcdMzSbSbh7ByQ7P8DVTSSqcvhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B0ZEiYkpfOdxlUi2625QZOk1BNbHkCzOlXhEZhssODDTrqiQEfw7Oha+QJ0whJkCd
         qTrzYLNrWfxhQTGIXSbfdrr2IMN58MjWI9n1vcMXSnFliM5Dh2eg95gCwnAeyN1A3p
         H8EVUN7QKwgZNSm4D/ZQSt0mcfhQdNQDlnaBVVtU=
Date:   Wed, 7 Sep 2022 16:09:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/intel-ipu3: Finalize subdev
 initialization to allcoate active state
Message-ID: <YxiYD6PVYG19EJ5q@pendragon.ideasonboard.com>
References: <20220907123359.1275322-1-luzmaximilian@gmail.com>
 <a194a9c5-ac8e-cf86-34cd-4f3a3cb6f6ec@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a194a9c5-ac8e-cf86-34cd-4f3a3cb6f6ec@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 03:46:26PM +0300, Tomi Valkeinen wrote:
> Hi Maximilian,
> 
> On 07/09/2022 15:33, Maximilian Luz wrote:
> > Commit f69952a4dc1e ("media: subdev: add active state to struct
> > v4l2_subdev") introduced the active_state member to struct v4l2_subdev.
> > This state needs to be allocated via v4l2_subdev_init_finalize(). The
> > intel-ipu3 driver unfortunately does not do that, due to which,
> 
> That is fine, a driver only needs to allocate the active state if it uses
> the active state.
> 
> > active_state is NULL and we run into an oops (NULL pointer dereference)
> > when that state is accessed.
> > 
> > In particular, this happens subdev in IOCTLs as commit 3cc7a4bbc381
> > ("media: subdev: pass also the active state to subdevs from ioctls")
> > passes that state on to the subdev IOCTLs. An example scenario where
> > this happens is running libcamera's qcam or cam on a device with IPU3,
> > for example the Microsoft Surface Book 2. In this case, the oops is
> > reproducibly in v4l2_subdev_get_try_crop(), called via
> > imgu_subdev_set_selection().
> > 
> > To fix this, allocate the active_state member via
> > v4l2_subdev_init_finalize().
> 
> This is not a correct fix. Sakari has sent (and maybe pushed?) this:
> 
> https://lore.kernel.org/all/20220825190351.3241444-1-sakari.ailus@linux.intel.com/

This being said, it would be nice to convert drivers to use the active
state, but that's not related to fixing this issue.

> > Link: https://github.com/linux-surface/linux-surface/issues/907
> > Fixes: 3cc7a4bbc381 ("media: subdev: pass also the active state to subdevs from ioctls")
> > Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> > ---
> >   drivers/staging/media/ipu3/ipu3-v4l2.c | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > index d1c539cefba8..84ab98ba9a2e 100644
> > --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> > +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > @@ -1093,10 +1093,18 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
> >   			"failed to create subdev v4l2 ctrl with err %d", r);
> >   		goto fail_subdev;
> >   	}
> > +
> > +	r = v4l2_subdev_init_finalize(&imgu_sd->subdev);
> > +	if (r) {
> > +		dev_err(&imgu->pci_dev->dev,
> > +			"failed to initialize subdev (%d)\n", r);
> > +		goto fail_subdev;
> > +	}
> > +
> >   	r = v4l2_device_register_subdev(&imgu->v4l2_dev, &imgu_sd->subdev);
> >   	if (r) {
> >   		dev_err(&imgu->pci_dev->dev,
> > -			"failed initialize subdev (%d)\n", r);
> > +			"failed to register subdev (%d)\n", r);
> >   		goto fail_subdev;
> >   	}
> >   
> > @@ -1104,6 +1112,7 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
> >   	return 0;
> >   
> >   fail_subdev:
> > +	v4l2_subdev_cleanup(&imgu_sd->subdev);
> >   	v4l2_ctrl_handler_free(imgu_sd->subdev.ctrl_handler);
> >   	media_entity_cleanup(&imgu_sd->subdev.entity);
> >   
> > @@ -1275,6 +1284,7 @@ static void imgu_v4l2_subdev_cleanup(struct imgu_device *imgu, unsigned int i)
> >   	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[i];
> >   
> >   	v4l2_device_unregister_subdev(&imgu_pipe->imgu_sd.subdev);
> > +	v4l2_subdev_cleanup(&imgu_pipe->imgu_sd.subdev);
> >   	v4l2_ctrl_handler_free(imgu_pipe->imgu_sd.subdev.ctrl_handler);
> >   	media_entity_cleanup(&imgu_pipe->imgu_sd.subdev.entity);
> >   }
> 

-- 
Regards,

Laurent Pinchart
