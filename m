Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09AAD4D07A8
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 20:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238392AbiCGT0k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 14:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiCGT0j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 14:26:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B24865D3C
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 11:25:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74264332;
        Mon,  7 Mar 2022 20:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646681141;
        bh=dyuboutjHd1c2rGzLWKoRv634oPAsaabNo2cKHBGys4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MEWw+WCb+x4qJU9GvXZ1vRPBnnSW1zv+ijLTHeJymTFHDDrV2zzBTQe4i8p4lMkqU
         7oFw1N0NP3irPwuKmxQuasZB7/pRusMIPPKeqdC88SVlUfpb8dClpGQ7ztpAa6mi6p
         U07nhh8wVaxeJRLtI3sRC8W7P9dMFLpSYAxMy86I=
Date:   Mon, 7 Mar 2022 21:25:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 01/17] media: rkisp1: capture: Initialize entity
 before video device
Message-ID: <YiZcJys8+GiXWhgE@pendragon.ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
 <20220304171925.1592-2-laurent.pinchart@ideasonboard.com>
 <4f76307485579893114ae4fb9e07cdeb83fd9383.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f76307485579893114ae4fb9e07cdeb83fd9383.camel@ndufresne.ca>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Mon, Mar 07, 2022 at 02:15:32PM -0500, Nicolas Dufresne wrote:
> Hi Laurent,
> 
> Le vendredi 04 mars 2022 à 19:19 +0200, Laurent Pinchart a écrit :
> > The media_entity embedded in the video_device needs to be initialized
> > before registering the video_device. Do so.
> 
> We've seen the same bug in MTK vcodec topology. Any idea if that could be catch
> this at lower level to prevent invalid path being populated in the media
> controller over and over ?

I think the pad should be moved to the video_device structure and
initialized unconditionally internally. It makes little sense to force
drivers to do this manually.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c   | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index c95c00a91180..9c11f2b8e5f5 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -1372,22 +1372,25 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> >  
> >  	vdev->queue = q;
> >  
> > +	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >  	if (ret) {
> >  		dev_err(cap->rkisp1->dev,
> >  			"failed to register %s, ret=%d\n", vdev->name, ret);
> > -		return ret;
> > +		goto error;
> >  	}
> > +
> >  	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
> >  		  vdev->num);
> >  
> > -	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> > -	if (ret) {
> > -		video_unregister_device(vdev);
> > -		return ret;
> > -	}
> > -
> >  	return 0;
> > +
> > +error:
> > +	media_entity_cleanup(&vdev->entity);
> > +	return ret;
> >  }
> >  
> >  static void

-- 
Regards,

Laurent Pinchart
