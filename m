Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF161D06E
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 22:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfENUTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 16:19:08 -0400
Received: from casper.infradead.org ([85.118.1.10]:33160 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfENUTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 16:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Is01q5I7Un1/V4HlbxwG1kyytwiirjymaFeQ7+PpAG0=; b=Ld0PLzmmiqhUDFlBxq1fxHRMmk
        k4i+e4BoQAOBVeDNuvAsCroh4ayNl+jrwn4Or2Xx09XEBeqm6W1Nh/WQzaMnoy2NNHstgoXvSnj5K
        0heKfx/FlNtVbzhuCzSDy7wlnzuiO63haEMxCQ3QJDqziXUeJYnft8tOO4n246uWL9H7Gw4xsOME8
        ynOfPcV6g+CM3pzsTalTtO/ROkF9kYCGjqDFYhsI3zyEqlmvRWvD1IIjgU9dwxiPnnfsYJFO4iycC
        oHhxQrrliOX2ZoC+ZZPobqNqmoSOepIvrs5cKLtsn/e2Deq7hETZJ4+q5ngnXvma54tPV1OoZazuC
        Un/IkD6w==;
Received: from [179.179.44.200] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hQdsx-0000EE-TO; Tue, 14 May 2019 20:18:52 +0000
Date:   Tue, 14 May 2019 17:18:45 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v6 13/13] media: tvp5150: make debug output more
 readable
Message-ID: <20190514171845.0eafb6f8@coco.lan>
In-Reply-To: <20190506133905.gvdgrei5n6crbwxc@uno.localdomain>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
        <20190415124413.18456-14-m.felsch@pengutronix.de>
        <20190506133905.gvdgrei5n6crbwxc@uno.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 6 May 2019 15:39:05 +0200
Jacopo Mondi <jacopo@jmondi.org> escreveu:

> Hi Marco,
>   thanks
> 
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Looks ok to me too.

> 
> On Mon, Apr 15, 2019 at 02:44:13PM +0200, Marco Felsch wrote:
> > The debug output for tvp5150_selmux() isn't really intuitive. Register
> > values are printed decimal formatted and the input/output driver states
> > are printed as enum. Even more the "normal" output enum mapps to zero so
> > a active output will printing output=0 and a inactive output=1.
> >
> > Change this by brinting the register values hex formatted and the states
> > as more readable string.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/media/i2c/tvp5150.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > index c0ee08546643..13ee6d781efb 100644
> > --- a/drivers/media/i2c/tvp5150.c
> > +++ b/drivers/media/i2c/tvp5150.c
> > @@ -302,9 +302,12 @@ static void tvp5150_selmux(struct v4l2_subdev *sd)
> >  		break;
> >  	}
> >
> > -	dev_dbg_lvl(sd->dev, 1, debug, "Selecting video route: route input=%i, output=%i => tvp5150 input=%i, opmode=%i\n",
> > -			decoder->input, decoder->output,
> > -			input, opmode);
> > +	dev_dbg_lvl(sd->dev, 1, debug,
> > +		    "Selecting video route: route input=%s, output=%s => tvp5150 input=0x%02x, opmode=0x%02x\n",
> > +		    decoder->input == 0 ? "aip1a" :
> > +		    decoder->input == 2 ? "aip1b" : "svideo",
> > +		    decoder->output == 0 ? "normal" : "black-frame-gen",
> > +		    input, opmode);
> >
> >  	regmap_write(decoder->regmap, TVP5150_OP_MODE_CTL, opmode);
> >  	regmap_write(decoder->regmap, TVP5150_VD_IN_SRC_SEL_1, input);
> > --
> > 2.20.1
> >  



Thanks,
Mauro
