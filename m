Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC59E4CD425
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 13:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbiCDMWe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 07:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234968AbiCDMWd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 07:22:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB191AF8FF
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 04:21:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3210C51C;
        Fri,  4 Mar 2022 13:21:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646396504;
        bh=+/sWkafIYykGXXV68IAO5+//sEh6HhhitwIknxA0TAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uMjUq0nPGm8K5Rdd2lXTlcCpyVtfD5EUEdbtjBaHlhcxvIITGUP8koOXqGILZMEHe
         me+ozqGEy8S4xd6Pr7LeKPzFw83RbhpKn0NUJUvcBt3M7VpZGlIj/rhIFuNY1aAbIR
         BKLavyfBqSRm0UetWHkInYMVuNmLFqbtcD1eI0YU=
Date:   Fri, 4 Mar 2022 14:21:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 02/16] media: rkisp1: capture: Fix and simplify
 (un)registration
Message-ID: <YiIES2Q6G4FPTQQ8@pendragon.ideasonboard.com>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
 <20220227160116.18556-3-laurent.pinchart@ideasonboard.com>
 <20220302171040.bem4jeinzowppzx6@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220302171040.bem4jeinzowppzx6@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Wed, Mar 02, 2022 at 07:10:40PM +0200, Dafna Hirschfeld wrote:
> On 27.02.2022 18:01, Laurent Pinchart wrote:
> > The rkisp1_register_capture() and rkisp1_unregister_capture() functions
> > don't destroy the mutex (in the error path for the former). Fix this and
> > make rkisp1_unregister_capture() and rkisp1_capture_devs_unregister()
> > safe to be called on an unregistered capture node to prepare for
> > simplification of error handling at probe time.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c | 26 ++++++++++---------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 9c11f2b8e5f5..18be7c982db7 100644
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
> > @@ -1390,6 +1394,8 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> >  
> >  error:
> >  	media_entity_cleanup(&vdev->entity);
> > +	mutex_destroy(&node->vlock);
> > +	cap->rkisp1 = NULL;
> >  	return ret;
> >  }
> >  
> > @@ -1425,26 +1431,22 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
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
> > +
> >  		ret = rkisp1_register_capture(cap);
> > -		if (ret)
> > -			goto err_unreg_capture_devs;
> > +		if (ret) {
> 
> I would set 'cap->rkisp1 = NULL' here instead of in rkisp1_register_capture
> so that 'rkisp1l' field is set and unset in the same function

I'll fix that, and in the resizer patch too.

> > +			rkisp1_capture_devs_unregister(rkisp1);
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
