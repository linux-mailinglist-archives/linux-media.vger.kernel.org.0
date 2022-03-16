Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30FC4DAC32
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 09:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242259AbiCPIFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 04:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237841AbiCPIFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 04:05:43 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E558B5E773
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 01:04:29 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 75AC820B21;
        Wed, 16 Mar 2022 10:04:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1647417867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SfC0TV4jGxLS+sCGag4EFcmiFeKayyLwllvD8xMOiB0=;
        b=sWjRPxPN111nQ5xc6pSofjJ1IrfJsRp2I+epoYk9xhLtH4XatXwNG/Zzdda5UjqfxplUd6
        /30XOJcpV51pd3Ml0s6vei12NnnNe1aZEcYuu/vw/revb1Ltc/SZ2kr6jufk7Qru+27Dv7
        JFNA+o8RDOw1qkC4f5k9GwKly7TCM2w=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A738C634C90;
        Wed, 16 Mar 2022 10:04:26 +0200 (EET)
Date:   Wed, 16 Mar 2022 10:04:26 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 3/8] media: i2c: ov5670: Probe clocks with OF
Message-ID: <YjGaCjIjs3u10JY5@valkosipuli.retiisi.eu>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-4-jacopo@jmondi.org>
 <YjBKQrdiOo1/EWck@pendragon.ideasonboard.com>
 <20220315084618.ol6ekvgvn5ldgif7@uno.localdomain>
 <YjBUybAyqnBRdI+v@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjBUybAyqnBRdI+v@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1647417867; a=rsa-sha256; cv=none;
        b=EG3fvNLqOtL4ZPSWOOX8V3TGwbVRKZu539NwFVEexsRUCu8WJuRU72Lz3yuQd34ApJBai3
        RDGZrhwxXnOJ3G1+7szv+Ewece7EWxuPWWebzwLnw1/KbQpn8GFAX8+M7feXKSNNvmubUt
        xHwuK0zzJnvTLzFh3vIhgvCnUb3gi0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1647417867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SfC0TV4jGxLS+sCGag4EFcmiFeKayyLwllvD8xMOiB0=;
        b=k6SIrRPTfl3iKzyE3vlqLWvjtJY3B0WFUeJAjxgfS8pDEQws2CtPsVOtdJAYUYDwU1++zV
        6Zor9N2OXorboL6WFknOxg/RlsoBVhCTdVAquSx8SqYkS7RbYlXZuKRLuyMamSFN/T6pIb
        3cJm//APazXJRH83CPxsplisgeEX6+o=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Jacopo,

On Tue, Mar 15, 2022 at 10:56:41AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Tue, Mar 15, 2022 at 09:46:18AM +0100, Jacopo Mondi wrote:
> > On Tue, Mar 15, 2022 at 10:11:46AM +0200, Laurent Pinchart wrote:
> > > On Mon, Mar 14, 2022 at 05:27:09PM +0100, Jacopo Mondi wrote:
> > > > Add support for probing the main system clock using the common clock
> > > > framework and its OF bindings.
> > > >
> > > > Maintain ACPI compatibility by falling back to parse 'clock-frequency'
> > > > if the no clock device reference is available.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  drivers/media/i2c/ov5670.c | 21 +++++++++++++++++----
> > > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > > > index 721441024598..25d792794fc7 100644
> > > > --- a/drivers/media/i2c/ov5670.c
> > > > +++ b/drivers/media/i2c/ov5670.c
> > > > @@ -2,6 +2,7 @@
> > > >  // Copyright (c) 2017 Intel Corporation.
> > > >
> > > >  #include <linux/acpi.h>
> > > > +#include <linux/clk.h>
> > > >  #include <linux/i2c.h>
> > > >  #include <linux/mod_devicetable.h>
> > > >  #include <linux/module.h>
> > > > @@ -1819,6 +1820,8 @@ struct ov5670 {
> > > >  	struct v4l2_subdev sd;
> > > >  	struct media_pad pad;
> > > >
> > > > +	struct clk *clk;
> > > > +
> > > >  	struct v4l2_ctrl_handler ctrl_handler;
> > > >  	/* V4L2 Controls */
> > > >  	struct v4l2_ctrl *link_freq;
> > > > @@ -2478,10 +2481,6 @@ static int ov5670_probe(struct i2c_client *client)
> > > >  	bool full_power;
> > > >  	int ret;
> > > >
> > > > -	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
> > > > -	if (input_clk != 19200000)
> > > > -		return -EINVAL;
> > > > -
> > > >  	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
> > > >  	if (!ov5670) {
> > > >  		ret = -ENOMEM;
> > > > @@ -2489,6 +2488,20 @@ static int ov5670_probe(struct i2c_client *client)
> > > >  		goto error_print;
> > > >  	}
> > > >
> > > > +	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
> > > > +	ov5670->clk = devm_clk_get_optional(&client->dev, NULL);
> > > > +	if (IS_ERR(ov5670->clk))
> > > > +		return dev_err_probe(&client->dev, PTR_ERR(ov5670->clk),
> > > > +				     "error getting clock\n");
> > > > +
> > > > +	if (ov5670->clk)
> > > > +		input_clk = clk_get_rate(ov5670->clk);
> > > > +	else
> > > > +		device_property_read_u32(&client->dev, "clock-frequency",
> > > > +					 &input_clk);
> > >
> > > This will try to use the clock-frequency property on OF-based systems if
> > > no clock is specified. Could we instead have
> > 
> > 'clocks' is listed as a required property in the OF bindings and my
> > understanding is that driver assume DTS are correct.
> > 
> > > 	if (probed through OF) {
> > 
> > Otherwise yes, I can check for dev->of_node
> > But again, I don't think drivers should have to work-around broken DTS
> 
> Not working around, but if we fail when DT is broken, it can help
> avoiding broken DT spreading in the wild, which we would then need to
> support forever.

If you think this is necessary (I'm not all that sure), then please check
this using is_of_node().

There are other drivers that could take clock-frequency from DT (grep for
reading clock-frequency with more indentation than one tab stop), too, even
if the bindings don't document that. I wouldn't expect that anyway since
clock control won't work there anyway.

-- 
Regards,

Sakari Ailus
