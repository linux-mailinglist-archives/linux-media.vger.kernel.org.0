Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8384E3C18
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 11:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbiCVKDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 06:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiCVKDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 06:03:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63F17DAAA
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 03:02:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01AF49DE;
        Tue, 22 Mar 2022 11:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647943329;
        bh=7+BsU3jsCMljdwgQ/u/uOUEzx4PQEdU9rrXgt0tO/Pc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QJWaqjqr5gA+fhrSNP8zW57eJZikGGJEjM3QGM1rbAVqyvWmDHQpqf1uNU9YBwKF7
         ntfM84KXujAABa9HDvTLktU850o4N+dfHP/rPYJ2mJN1xuSoLFjuCIZ62vfevI89m3
         pWWfD2qF/qtrD/ORsxSdPyhjnF1YgFshfjvddTIE=
Date:   Tue, 22 Mar 2022 12:01:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 05/17] media: rkisp1: params: Fix and simplify
 (un)registration
Message-ID: <YjmekPN/JnTtDWlk@pendragon.ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-6-laurent.pinchart@ideasonboard.com>
 <20220322042726.ifcrbleogwedgebe@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220322042726.ifcrbleogwedgebe@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Mar 22, 2022 at 06:27:26AM +0200, Dafna Hirschfeld wrote:
> On 19.03.2022 18:30, Laurent Pinchart wrote:
> > The rkisp1_params_register() and rkisp1_params_unregister() functions
> > don't destroy the mutex (in the error path for the former). Fix this,
> > simplify error handling at registration time as media_entity_cleanup()
> > can be called on an uninitialized entity, and make
> > rkisp1_params_unregister() safe to be called on an unregistered params
> > node to prepare for simplification of error handling at probe time.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-params.c      | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 8f62f09e635f..d41823c861ca 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -1844,16 +1844,21 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
> >  	node->pad.flags = MEDIA_PAD_FL_SOURCE;
> >  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> >  	if (ret)
> > -		return ret;
> > +		goto error;
> > +
> >  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >  	if (ret) {
> >  		dev_err(rkisp1->dev,
> >  			"failed to register %s, ret=%d\n", vdev->name, ret);
> > -		goto err_cleanup_media_entity;
> > +		goto error;
> >  	}
> > +
> >  	return 0;
> > -err_cleanup_media_entity:
> > +
> > +error:
> >  	media_entity_cleanup(&vdev->entity);
> > +	mutex_destroy(&node->vlock);
> > +	params->rkisp1 = NULL;
> >  	return ret;
> >  }
> >  
> > @@ -1863,6 +1868,10 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
> >  	struct rkisp1_vdev_node *node = &params->vnode;
> >  	struct video_device *vdev = &node->vdev;
> >  
> > +	if (!params->rkisp1)
> > +		return;
> > +
> 
> For the capture devices, you did:
>        if (!video_is_registered(&cap->vnode.vdev))
>                return;
> Better be consistend and do the same here and for stats?

I'll do that.

> >  	vb2_video_unregister_device(vdev);
> >  	media_entity_cleanup(&vdev->entity);
> > +	mutex_destroy(&node->vlock);
> >  }

-- 
Regards,

Laurent Pinchart
