Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D404CFF11
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 13:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242503AbiCGMrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 07:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238963AbiCGMrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 07:47:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F6788793
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 04:46:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D994332;
        Mon,  7 Mar 2022 13:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646657186;
        bh=Fg1LF1bHUSB7eD7+efDuX6LXsMYP2G6NkYIetOcfW4I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dYaQhv5JLbjp65x//H0glu3xEUNC8Abm+E1Lq6i8JtGmnLfvronJ4LD0G8+ca+UdF
         2rAIyJwi6ZZdu8/MXCFO4UAzrMDP0GTzFAMDhCCaUPLUOxIvVf/2xuZ+gIUcVNFQAB
         hYBcz8x/9NSrautuRZTVr3PIfXuIEVk2SkOUkx9U=
Date:   Mon, 7 Mar 2022 14:46:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 02/17] media: rkisp1: capture: Fix and simplify
 (un)registration
Message-ID: <YiX+lAeD6FMd7+sx@pendragon.ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
 <20220304171925.1592-3-laurent.pinchart@ideasonboard.com>
 <20220307114530.e3u4oqsburizcig6@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220307114530.e3u4oqsburizcig6@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Mar 07, 2022 at 12:45:30PM +0100, Jacopo Mondi wrote:
> On Fri, Mar 04, 2022 at 07:19:10PM +0200, Laurent Pinchart wrote:
> > The rkisp1_register_capture() and rkisp1_unregister_capture() functions
> > don't destroy the mutex (in the error path for the former). Fix this and
> > make rkisp1_unregister_capture() and rkisp1_capture_devs_unregister()
> > safe to be called on an unregistered capture node to prepare for
> > simplification of error handling at probe time.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Reset cap->rkisp1 in rkisp1_capture_devs_register()
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c | 26 ++++++++++---------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 9c11f2b8e5f5..96a7e6c0a622 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -1312,8 +1312,12 @@ static const struct v4l2_file_operations rkisp1_fops = {
> >
> >  static void rkisp1_unregister_capture(struct rkisp1_capture *cap)
> >  {
> > +	if (!cap->rkisp1)
> > +		return;
> > +
> >  	media_entity_cleanup(&cap->vnode.vdev.entity);
> >  	vb2_video_unregister_device(&cap->vnode.vdev);
> > +	mutex_destroy(&cap->vnode.vlock);
> >  }
> >
> >  void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1)
> > @@ -1390,6 +1394,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> >
> >  error:
> >  	media_entity_cleanup(&vdev->entity);
> > +	mutex_destroy(&node->vlock);
> >  	return ret;
> >  }
> >
> > @@ -1425,26 +1430,23 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
> >
> >  int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
> >  {
> > -	struct rkisp1_capture *cap;
> > -	unsigned int i, j;
> > +	unsigned int i;
> >  	int ret;
> >
> >  	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
> > +		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
> > +
> >  		rkisp1_capture_init(rkisp1, i);
> > -		cap = &rkisp1->capture_devs[i];
> >  		cap->rkisp1 = rkisp1;
> 
> This is set by rkisp1_capture_init() already

This isn't introduced by this patch, but indeed, I can remove it here.

> > +
> >  		ret = rkisp1_register_capture(cap);
> > -		if (ret)
> > -			goto err_unreg_capture_devs;
> > +		if (ret) {
> > +			cap->rkisp1 = NULL;
> 
> Is this correct ?
> 
> As:
> > +			rkisp1_capture_devs_unregister(rkisp1);
> 
> Calls
> rkisp1_capture_devs_unregister():
>         rkisp1_unregister_capture():
>                 if (!cap->rkisp1)
>                         return 0;
> 
> Effectively making rkisp1_capture_devs_unregister() a nop.

It will be a nop for the rkisp1_capture that fails to register here
(which shouldn't be an issue as rkisp1_register_capture() cleans up
internally when failing), but will still call
rkisp1_unregister_capture() on any rkisp1_capture previously registered
successfully (in practice that would be the MP only).

> > +			return ret;
> > +		}
> >  	}
> >
> >  	return 0;
> >
> > -err_unreg_capture_devs:
> > -	for (j = 0; j < i; j++) {
> > -		cap = &rkisp1->capture_devs[j];
> > -		rkisp1_unregister_capture(cap);
> > -	}
> > -
> > -	return ret;
> >  }

-- 
Regards,

Laurent Pinchart
