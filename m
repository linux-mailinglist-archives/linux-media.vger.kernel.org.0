Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E513D4E3C0C
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 10:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbiCVJ7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 05:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbiCVJ7y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 05:59:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5571AF28
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 02:58:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE8DB9DE;
        Tue, 22 Mar 2022 10:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647943103;
        bh=DswX2kfrS856LewmIspY3LDA5hl7TTAsCqlFb8OGsXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i9p00CH3tl3GZbk78BA5JXsM8SvA5qcNbMrIZ2Tdfdb0HbClRSaSUFirifQ9lRBeV
         d+f7qEJEMVIuy/lML9yAvaKw2BqtoFuavEy1u8UvDlVIhsx+4cEaBA9MdNl4DWzfX+
         yKHh1GgPlsu4P7vsi0OcDZtsgtxiP3jFUUY1T8Tc=
Date:   Tue, 22 Mar 2022 11:58:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v3 03/17] media: rkisp1: isp: Fix and simplify
 (un)registration
Message-ID: <Yjmdri0OAHOeaej0@pendragon.ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-4-laurent.pinchart@ideasonboard.com>
 <20220322042305.fcriktxrjd4vfbfo@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220322042305.fcriktxrjd4vfbfo@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Mar 22, 2022 at 06:23:05AM +0200, Dafna Hirschfeld wrote:
> On 19.03.2022 18:30, Laurent Pinchart wrote:
> > The rkisp1_isp_register() and rkisp1_isp_unregister() functions don't
> > destroy the mutex (in the error path for the former). Fix this, simplify
> > error handling at registration time as media_entity_cleanup() can be
> > called on an uninitialized entity, and make rkisp1_isp_unregister() and
> > safe to be called on an unregistered isp subdev to prepare for
> > simplification of error handling at probe time.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 20 ++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 2a35bf24e54e..f84e53b60ee1 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -1090,29 +1090,35 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
> >  	mutex_init(&isp->ops_lock);
> >  	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
> >  	if (ret)
> > -		return ret;
> > +		goto error;
> >  
> >  	ret = v4l2_device_register_subdev(&rkisp1->v4l2_dev, sd);
> >  	if (ret) {
> >  		dev_err(rkisp1->dev, "Failed to register isp subdev\n");
> > -		goto err_cleanup_media_entity;
> > +		goto error;
> >  	}
> >  
> >  	rkisp1_isp_init_config(sd, &state);
> > +
> >  	return 0;
> >  
> > -err_cleanup_media_entity:
> > +error:
> >  	media_entity_cleanup(&sd->entity);
> 
> I remember long ago that Ezequiel suggested removing that
> 'media_entity_cleanup' since it was never implemented which
> indicates there is probably no need for it.

The function is empty indeed, but I'd rather keep it. If we happen to
need to cleanup anything in the future, having to patch all drivers to
add media_entity_cleanup() calls would be very painful.

> > -
> > +	mutex_destroy(&isp->ops_lock);
> > +	isp->sd.flags = 0;
> >  	return ret;
> >  }
> >  
> >  void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
> >  {
> > -	struct v4l2_subdev *sd = &rkisp1->isp.sd;
> > +	struct rkisp1_isp *isp = &rkisp1->isp;
> >  
> > -	v4l2_device_unregister_subdev(sd);
> > -	media_entity_cleanup(&sd->entity);
> > +	if (!isp->sd.flags)
> 
> We assume no flags means that the device is not registered. This might
> stop working if we ever decide to remove the existing flags.
> So better "if (!isp->sd.v4l2_dev)" ?

Good point. I'll change that.

> > +		return;
> > +
> > +	v4l2_device_unregister_subdev(&isp->sd);
> > +	media_entity_cleanup(&isp->sd.entity);
> > +	mutex_destroy(&isp->ops_lock);
> >  }
> >  
> >  /* ----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
