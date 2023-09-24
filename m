Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F0E7ACA07
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 16:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjIXOdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 10:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjIXOdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 10:33:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2907FFA
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 07:33:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AC0C475;
        Sun, 24 Sep 2023 16:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695565884;
        bh=k5JNOhi1JvRJ9hoIGdH69dJBef/f9nFt4lclvuWXKmk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cn/VSfvClyuaVP2IT8WObCt1yHO7fM2Cgr/rb2N5Mp2oDkIqPcwcTUgDDD3449N6N
         ScPMB8lshwC3doh1lk0GD0CtWG8kgs2k+6q1CbtlIKZ0EtXyk33egTVSLOwUMyldr0
         lhQXamZ0UHetn5FxNTk+VOIJy3KzJaKb62iOPBeY=
Date:   Sun, 24 Sep 2023 17:33:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v4 06/12] media: ccs: Use sub-device active state
Message-ID: <20230924143315.GA6390@pendragon.ideasonboard.com>
References: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
 <20230922115730.251779-7-sakari.ailus@linux.intel.com>
 <20230924125743.GB4505@pendragon.ideasonboard.com>
 <ZRA9cO9kg0ROK2Uk@valkosipuli.retiisi.eu>
 <20230924135307.GT19112@pendragon.ideasonboard.com>
 <ZRBCSOw0TLOinM8r@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZRBCSOw0TLOinM8r@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sun, Sep 24, 2023 at 02:06:00PM +0000, Sakari Ailus wrote:
> On Sun, Sep 24, 2023 at 04:53:07PM +0300, Laurent Pinchart wrote:
> > > > > @@ -2579,16 +2519,19 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
> > > > >  		sel->r.top = 0;
> > > > >  	}
> > > > >  
> > > > > -	sel->r.width = min(sel->r.width, src_size->width);
> > > > > -	sel->r.height = min(sel->r.height, src_size->height);
> > > > > +	sel->r.width = min(sel->r.width, src_size.width);
> > > > > +	sel->r.height = min(sel->r.height, src_size.height);
> > > > >  
> > > > > -	sel->r.left = min_t(int, sel->r.left, src_size->width - sel->r.width);
> > > > > -	sel->r.top = min_t(int, sel->r.top, src_size->height - sel->r.height);
> > > > > +	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
> > > > > +	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
> > > > >  
> > > > >  	*crops[sel->pad] = sel->r;
> > > > 
> > > > The crops variable stores all crop rectangles for all pads, and here you
> > > > end up using the crop rectangle on sel->pad only. I understand where
> > > > ccs_get_crop_compose() comes from, with the need to manually handle the
> > > > active and try state, but now that this has gone, I would replace the
> > > > call to ccs_get_crop_compose() above with a call to
> > > > v4l2_subdev_get_pad_crop(). ccs_set_format() can be cleaned up
> > > > similarly, and actually ccs_set_compose() too. I think dropping
> > > > ccs_get_crop_compose() would now be cleaner.
> > > 
> > > There are five locations where ccs_get_crop_compose() is used. It would be
> > > possible to get rid of it, yes, but requires handling the loop (or
> > > unrolling it) in the caller functions. I'm not sure I like the idea. There
> > > might be one or two instances where a single crop rectangle is needed, in
> > > that case it would make sense to use v4l2_subdev_get_pad_crop() instead.
> > > I'd prefer to do this in la later patch though: this one is already a large
> > > enough.
> > 
> > It is used in
> > 
> > - ccs_propagate()
> > - ccs_set_format()
> > - ccs_set_compose()
> > - ccs_set_crop()
> > - __ccs_get_selection()
> > 
> > In all but ccs_propagate(), only one crop rectangle is accessed, so you
> > wouldn't need a loop. In ccs_propaget() you could simply unroll the loop
> > manually. I think it would be more readable.
> 
> Ok, fair enough. It seems the crop rectangles array is accessed on an
> index, but you could instead get the rectangle at that index. I'll post a
> patch for this on top of the set.

Thanks :-)

> > > > >  
> > > > >  	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
> > > > >  		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
> > > > > +	else if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> > > > > +		 ssd == sensor->pixel_array)
> > > > > +		sensor->pa_src = sel->r;
> > > > 
> > > > pa_src is assigned here only, and accessed in different places in the
> > > > driver. I think you can already drop the field, and access the active
> > > > state in the places where pa_src is used. The same seems to be true for
> > > > scaler_sink and src_src actually.
> > > > 
> > > > If you want to make those modifications on top I'm not opposed to it,
> > > > but they should land sooner than later, and I don't really see a reason
> > > > for not doing it now. I may be missing something of course.
> > > 
> > > As noted in the reply to your first question --- that requires changing the
> > > UAPI which is out of scope of this set.
> > 
> > Could you explain why ? I'm not getting it :-S
> 
> The media bus code on all CCS driver sub-devices is dependent on the
> flipping controls, independently of whether the state is active or try. And
> when you want to access those controls, you'll need to acquire the control
> handler's mutex.
> 
> Otherwise the driver could use a single mutex for all active states as well
> as the control handler.

The single mutex approach to cover all states and all control handlers
seems good to me. It should simplify lock handling, and shouldn't cause
any performance issue as I doubt there are use cases where two processes
will compete to access controls and selection rectangles on different
subdevs of a CCS device :-)

-- 
Regards,

Laurent Pinchart
