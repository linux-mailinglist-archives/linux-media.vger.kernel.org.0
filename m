Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D759E7907C6
	for <lists+linux-media@lfdr.de>; Sat,  2 Sep 2023 14:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344841AbjIBMKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Sep 2023 08:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjIBMK3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Sep 2023 08:10:29 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516F4E58
        for <linux-media@vger.kernel.org>; Sat,  2 Sep 2023 05:10:26 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RdDHd168nz49Q2P;
        Sat,  2 Sep 2023 15:10:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1693656621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Lz6v5S1HVdiZvJNiXVJ+ycK6ldDdyLI/IcCTfmTRr+I=;
        b=AJFKOb9DX2UuTHKj8N76as/FGXLgUYLwzeb2aoYBVzrSGejFEqUqkPT7D+xtPZz6Xu1oNC
        x+F/IoD5VDRzfLQpDuQ3s9sd/IWTwHp34fgfVi8vMjFXPQzWn29XV1weoy7jtSK2W2tas6
        mEZi0FM6kNeptsS5tIys5KtUjs3duFTO2F+AAOkmi+4QggTgG8gtmBB++OxnFTHC5m94h/
        hpEyT7VCnur/saBrO/sDOtc4MNUjUaRFiRU1cgnCnIYROxIW3S/Ddz2yT7Gl35MVVnFkUw
        nicUzzZZwpcBQjgB3fcQ0gGoifqb6hbhdOFnySePF59ZwNf429a4IQBHEyg2Pw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1693656621; a=rsa-sha256;
        cv=none;
        b=ZKwWLJ0Vgj/iraxp0JmJY6nOqe7mPlSyhzdV4Z7zdLsRSx/kUq2iQcnpv9SH57jnWTSGS4
        tT+gaY6l6T7MbiKwyCEZu/5uW2dCEp5hG9UJykBsEDjdS9TI6FMTj9bKZH5jzyBYO0+2LG
        O7UXiGlb5vuwIzkkSZzxpc1+ylQWprgASIL5Aa9BMMbIWfOn8xb6T7VYg5+IuQ5xED7Dxb
        O3gchTvspHQvDlIK9/L/RwiEZH+YNmrh84FbWEGV9VwYjytM3x7xZA9h4moscHzaJNXQAT
        aSGY9jfvyvXPQjfA/eXOGp7bkPEWJikLvIK15AkUGSC91khGdtemCVt07TIkcQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1693656621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Lz6v5S1HVdiZvJNiXVJ+ycK6ldDdyLI/IcCTfmTRr+I=;
        b=r0Dev6PBAA06Jiu03i1STZmhW4Veqo8Z2u7xGl5uumvpWGsP4xAlD8z9vMw5btlkqPqld9
        p8AS5wmnW01XklkdFJFyCB1O2mPCHBPeelzK/0UjtkKtNV9TiDzlK8L/CnAI7RyDn7i8Ho
        bEXrdA8K2PfdWD1bzuneof0W1Ik7vp1R7KunfykSYYuTZX8qrwOozmhlN758LwsG6GvjLw
        GB6hgVIMYlK5jgnN0+whHMPjFOJysnZGjhb9IxeWnvyrjw09j9HmEEEllfxbKf4KkIVU/S
        TuSEub+0wshbRCccec3mNjeIzW/Tlfk2Mi23hqz1XNv/9LDVt3VO4bqi9spDTQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6CBB2634C95;
        Sat,  2 Sep 2023 15:10:20 +0300 (EEST)
Date:   Sat, 2 Sep 2023 12:10:20 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Document that routing support
 depends on streams
Message-ID: <ZPMmLDvCuibZNFkZ@valkosipuli.retiisi.eu>
References: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
 <ZN+Z4aYPNp+ymIw6@valkosipuli.retiisi.eu>
 <20230820225604.GB10135@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820225604.GB10135@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Aug 21, 2023 at 01:56:04AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Aug 18, 2023 at 04:18:41PM +0000, Sakari Ailus wrote:
> > On Fri, Aug 18, 2023 at 06:55:18PM +0300, Laurent Pinchart wrote:
> > > Routing support, through the subdev .set_routing() operation, requires
> > > the subdev to support streams. This is however not clearly documented
> > > anywhere. Fix it by expanding the operation's documentation to indicate
> > > that subdevs must set the V4L2_SUBDEV_FL_STREAMS flag.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  include/media/v4l2-subdev.h | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index b325df0d54d6..0b04ed1994b6 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -822,8 +822,9 @@ struct v4l2_subdev_state {
> > >   *		     operation shall fail if the pad index it has been called on
> > >   *		     is not valid or in case of unrecoverable failures.
> > >   *
> > > - * @set_routing: enable or disable data connection routes described in the
> > > - *		 subdevice routing table.
> > > + * @set_routing: Enable or disable data connection routes described in the
> > > + *		 subdevice routing table. Subdevs that implement this operation
> > > + *		 must set the V4L2_SUBDEV_FL_STREAMS flag.
> > 
> > Could we set the flag in the core when this op exists for a sub-device?
> 
> That won't work in all cases, as a driver could expose immutable routes
> by creating them in the .init_cfg() function, without implementing
> .set_routing().
> 
> Another option would be to check if the drivers has created routes after
> the .init_cfg() called (indirectly) from v4l2_subdev_init_finalize(). It
> may be a bit fragile though.

If you have either, then the sub-device does support streams. As otherwise,
there are no streams exposed to the user space. Right?

> 
> > We could do similarly for events when the sub-device has a control handler.
> 
> A subdev could generate non-control events too. In most cases I suppose
> it would still create a control handler, but I don't think we should
> require that.

I suggested this mainly as there are tonnes of drivers that expose controls
(and thus control events) but do not have the events flag set. Doing this
automatically for almost all drivers would reduce bugs.

> 
> > The device node should probably exist in almost all cases, but I'm not sure
> > right now whether there is a reasonable test for it.

-- 
Regards,

Sakari Ailus
