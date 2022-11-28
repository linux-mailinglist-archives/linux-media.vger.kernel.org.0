Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4383D63A986
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbiK1NbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbiK1Nay (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:30:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5198E1E701
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:30:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8838501;
        Mon, 28 Nov 2022 14:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669642251;
        bh=3x6S0F5Y1hSjPvL9oIzcFkhveW/TYxJ/GmweavKKHyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T5Z3t4ywVbfIZrHQFY6t9Qg4u3U8Kc6ujS6IYGcOroKTqUIGPjvisP1qetqrWknMr
         XuGieYziXhB+3WiciwbCjfU+K5sSzF5u1trIGeltKpxjVzgyFdHYXmtnISBXw7WGzi
         ByHnGDl1gtv68qCnEkko6xwZVsROLXF8KYLVFHeI=
Date:   Mon, 28 Nov 2022 15:30:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v1 2/5] media: i2c: imx492: driver's header
Message-ID: <Y4S3/UVEPZscrbag@pendragon.ideasonboard.com>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
 <20221125153120.541298-3-petko.manolov@konsulko.com>
 <166963964534.1079859.8944627251139157210@Monstersaurus>
 <Y4S0MinGKoYW3Bfq@bender.k.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4S0MinGKoYW3Bfq@bender.k.g>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 28, 2022 at 03:14:26PM +0200, Petko Manolov wrote:
> On 22-11-28 12:47:25, Kieran Bingham wrote:
> > Quoting Petko Manolov (2022-11-25 15:31:17)
> > > The header.  For the moment only two modes are supported.
> > > 
> > > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > > ---
> > >  drivers/media/i2c/imx492.h | 555 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 555 insertions(+)
> > >  create mode 100644 drivers/media/i2c/imx492.h
> > > 
> > > diff --git a/drivers/media/i2c/imx492.h b/drivers/media/i2c/imx492.h
> > > new file mode 100644
> > > index 000000000000..301fd66c77d5
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/imx492.h
> > > @@ -0,0 +1,555 @@
> > > +#ifndef        __imx492_h__
> > > +#define        __imx492_h__
> > > +
> > > +struct imx492_reg {
> > > +       u16 address;
> > > +       u8 val;
> > > +};
> > > +
> > > +static const struct imx492_reg mode_17to9_regs[] = {
> > 
> > Why is this table in the header? Should it be available in multiple locations?
> 
> Nope, but there are multiple modes that will eventually be in use and scrolling
> down a couple of seconds until one gets to the code started to get a bit boring.

Ideally we should get rid of those tables and use logic to compute
register values :-) That's a dream only at this point though.

I agree with Kieran that everything could be in the same file, and I
also agree with you that it's not nice to have a large list of registers
at the beginning of the driver. I'm thus fine with either option.

> > I think it is likely better in the driver itself.
> 
> Will put register definitions in the .c file for the time being.

-- 
Regards,

Laurent Pinchart
