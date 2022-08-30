Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7255A625B
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 13:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiH3Lqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 07:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiH3Lqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 07:46:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09609A695
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 04:46:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D70A4481;
        Tue, 30 Aug 2022 13:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661860007;
        bh=+SbuVYQKsGy4JzgMbDt/eJXrW91pUG8zggcryk4Ta10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JBVqWMPwIkO/y8855BBQMGOIajUfMsnMIStUR6Q0KtZT+Iu2xANg/DHD9jW2pcK9C
         PpcbdMConwIx0OwVMGDW9Vc2uLX9FKqoLxCqxU6d3efl1TSczlGHbMzxRLLMIpYS2R
         Qt0Vwm/Ig8RpH+1ASLYZWZLuOzAZv1WqOsCrS3o4=
Date:   Tue, 30 Aug 2022 14:46:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v13 13/34] media: drivers: use
 video_device_pipeline_alloc_start()
Message-ID: <Yw34nM/ILtqz2x0B@pendragon.ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-14-tomi.valkeinen@ideasonboard.com>
 <YwzwpQXgDb0ulwbE@pendragon.ideasonboard.com>
 <e3035208-f26c-3c78-7c78-12c9aa76ff97@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3035208-f26c-3c78-7c78-12c9aa76ff97@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Aug 30, 2022 at 02:20:21PM +0300, Tomi Valkeinen wrote:
> On 29/08/2022 20:00, Laurent Pinchart wrote:
> > On Wed, Aug 10, 2022 at 03:11:01PM +0300, Tomi Valkeinen wrote:
> >> Use video_device_pipeline_alloc_start() instead of manually
> >> allocating/managing the media pipeline storage.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 14 +-------------
> >>   drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |  2 +-
> >>   .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |  2 +-
> >>   drivers/media/platform/ti/cal/cal-video.c          |  2 +-
> >>   drivers/media/platform/ti/cal/cal.h                |  1 -
> >>   5 files changed, 4 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> >> index 548067f19576..884875600231 100644
> >> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> >> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> >> @@ -1244,8 +1244,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
> >>   
> >>   static int rvin_set_stream(struct rvin_dev *vin, int on)
> >>   {
> >> -	struct media_pipeline *pipe;
> >> -	struct media_device *mdev;
> >>   	struct v4l2_subdev *sd;
> >>   	struct media_pad *pad;
> >>   	int ret;
> >> @@ -1273,17 +1271,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
> >>   	if (ret)
> >>   		return ret;
> >>   
> >> -	/*
> >> -	 * The graph lock needs to be taken to protect concurrent
> >> -	 * starts of multiple VIN instances as they might share
> >> -	 * a common subdevice down the line and then should use
> >> -	 * the same pipe.
> >> -	 */
> >> -	mdev = vin->vdev.entity.graph_obj.mdev;
> >> -	mutex_lock(&mdev->graph_mutex);
> >> -	pipe = media_entity_pipeline(&sd->entity) ? : &vin->vdev.pipe;
> >> -	ret = __video_device_pipeline_start(&vin->vdev, pipe);
> >> -	mutex_unlock(&mdev->graph_mutex);
> >> +	ret = video_device_pipeline_alloc_start(&vin->vdev);
> > 
> > This doesn't look right, it will use different pipeline instances for
> > difference video devices, that's a change in behaviour.
> 
> I hope not, but it's a bit difficult to be sure without having the board 
> and testing.
> 
> Afaics, the previous code uses the existing pipeline if such exists in 
> the first subdev (i.e. if media_pipeline_start has been called earlier 
> for another vdev), or if not, uses pipeline specific to the vdev.
> 
> This behavior should match the new one, although the operation 
> underneath is slightly different.

I think you're right. I'd probably feel better if we could test it :-)

> It's perhaps the name, video_device_pipeline_alloc_start, that confuses. 
> It doesn't indicate that it possibly uses an existing pipeline. But I 
> don't have any good idea for a better name. 
> video_device_pipeline_find_or_alloc_start? =) Well, it's not really 
> "finding" anything either...

Yes, I think the new threw me off, but I can't really think of a better
one right now.

> >>   	if (ret)
> >>   		return ret;
> >>   
> >> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> >> index 17ad9a3caaa5..a3e826a755fc 100644
> >> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> >> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> >> @@ -266,7 +266,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
> >>   		goto err_clear_dma_queue;
> >>   	}
> >>   
> >> -	ret = video_device_pipeline_start(&csi->vdev, &csi->vdev.pipe);
> > 
> > What ? There is a pipe embedded in video_device ? Oh my, I didn't
> > realize how messed up the V4L2 core had become :-(
> 
> That's what the current Renesas driver earlier in this patch also uses. 
> Didn't you write that code? =)

As a matter of fact, no, I didn't :-)

-- 
Regards,

Laurent Pinchart
