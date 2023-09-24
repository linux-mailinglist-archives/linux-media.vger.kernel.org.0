Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B097AC9E8
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 16:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjIXOGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 10:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjIXOGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 10:06:11 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2D8DA
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 07:06:04 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4Rtnpx5YjFzyVk;
        Sun, 24 Sep 2023 17:06:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1695564361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bsDBkpOeM08PhE65kjuvQCY7uedm47daafNGX6GZAGY=;
        b=gOlEgDIXMh8uC/iCB3AlFCK+9tDqb0ZiqutFiscsJj99Bt6qEMoOkpYXIcFUFPZp//lyVp
        uLHcfnoPCcypRtRSZD1pyriI7kdmL+nFdcee1Ckkr49ip76+H3HizxNXjfwoEHUJwAWSZh
        8O+HfZB1CIFY81elFHtlD0mGDk7JgPA=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1695564361; a=rsa-sha256; cv=none;
        b=k2r8KLKZPUq5TrxDPEUrrYQXSXl8usKwbmkgeuqYoYxXiwKgykg+IaHr1fSH3mUnhnbZ8+
        vC6VHQZeFcsDvXMy3lS88m30lq8rDv49WGn1tx7LNjXSIr1aXhDPZrUuY9of9pNL56b3ag
        qz4e+y9iaRnopTDnhYHLj+6ucH/pQkc=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1695564361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bsDBkpOeM08PhE65kjuvQCY7uedm47daafNGX6GZAGY=;
        b=hu3kOxHBfAUPYV7Wt1c/3ivwCgRaOh8VG6qiD7lLJdVLzm4B3q+ctqgMqromKL5NR26nTV
        PhAk7CVKLDkJfRs4ct9ShZQmfUVhjuUDRzjXf8kTbBDWJbSZEspkMzepfpTVIcHpMHDJbU
        blQ85dLxw1E2TauHFt6U0CYvVuiEJfs=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 42895634C93;
        Sun, 24 Sep 2023 17:06:01 +0300 (EEST)
Date:   Sun, 24 Sep 2023 14:06:00 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v4 06/12] media: ccs: Use sub-device active state
Message-ID: <ZRBCSOw0TLOinM8r@valkosipuli.retiisi.eu>
References: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
 <20230922115730.251779-7-sakari.ailus@linux.intel.com>
 <20230924125743.GB4505@pendragon.ideasonboard.com>
 <ZRA9cO9kg0ROK2Uk@valkosipuli.retiisi.eu>
 <20230924135307.GT19112@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924135307.GT19112@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Sep 24, 2023 at 04:53:07PM +0300, Laurent Pinchart wrote:
> > > > @@ -2579,16 +2519,19 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
> > > >  		sel->r.top = 0;
> > > >  	}
> > > >  
> > > > -	sel->r.width = min(sel->r.width, src_size->width);
> > > > -	sel->r.height = min(sel->r.height, src_size->height);
> > > > +	sel->r.width = min(sel->r.width, src_size.width);
> > > > +	sel->r.height = min(sel->r.height, src_size.height);
> > > >  
> > > > -	sel->r.left = min_t(int, sel->r.left, src_size->width - sel->r.width);
> > > > -	sel->r.top = min_t(int, sel->r.top, src_size->height - sel->r.height);
> > > > +	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
> > > > +	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
> > > >  
> > > >  	*crops[sel->pad] = sel->r;
> > > 
> > > The crops variable stores all crop rectangles for all pads, and here you
> > > end up using the crop rectangle on sel->pad only. I understand where
> > > ccs_get_crop_compose() comes from, with the need to manually handle the
> > > active and try state, but now that this has gone, I would replace the
> > > call to ccs_get_crop_compose() above with a call to
> > > v4l2_subdev_get_pad_crop(). ccs_set_format() can be cleaned up
> > > similarly, and actually ccs_set_compose() too. I think dropping
> > > ccs_get_crop_compose() would now be cleaner.
> > 
> > There are five locations where ccs_get_crop_compose() is used. It would be
> > possible to get rid of it, yes, but requires handling the loop (or
> > unrolling it) in the caller functions. I'm not sure I like the idea. There
> > might be one or two instances where a single crop rectangle is needed, in
> > that case it would make sense to use v4l2_subdev_get_pad_crop() instead.
> > I'd prefer to do this in la later patch though: this one is already a large
> > enough.
> 
> It is used in
> 
> - ccs_propagate()
> - ccs_set_format()
> - ccs_set_compose()
> - ccs_set_crop()
> - __ccs_get_selection()
> 
> In all but ccs_propagate(), only one crop rectangle is accessed, so you
> wouldn't need a loop. In ccs_propaget() you could simply unroll the loop
> manually. I think it would be more readable.

Ok, fair enough. It seems the crop rectangles array is accessed on an
index, but you could instead get the rectangle at that index. I'll post a
patch for this on top of the set.

> 
> > > >  
> > > >  	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
> > > >  		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
> > > > +	else if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> > > > +		 ssd == sensor->pixel_array)
> > > > +		sensor->pa_src = sel->r;
> > > 
> > > pa_src is assigned here only, and accessed in different places in the
> > > driver. I think you can already drop the field, and access the active
> > > state in the places where pa_src is used. The same seems to be true for
> > > scaler_sink and src_src actually.
> > > 
> > > If you want to make those modifications on top I'm not opposed to it,
> > > but they should land sooner than later, and I don't really see a reason
> > > for not doing it now. I may be missing something of course.
> > 
> > As noted in the reply to your first question --- that requires changing the
> > UAPI which is out of scope of this set.
> 
> Could you explain why ? I'm not getting it :-S

The media bus code on all CCS driver sub-devices is dependent on the
flipping controls, independently of whether the state is active or try. And
when you want to access those controls, you'll need to acquire the control
handler's mutex.

Otherwise the driver could use a single mutex for all active states as well
as the control handler.

-- 
Regards,

Sakari Ailus
