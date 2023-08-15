Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 254C677CD77
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 15:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237312AbjHONnq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 09:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237193AbjHONnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 09:43:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D08198A
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 06:43:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BACE86E0;
        Tue, 15 Aug 2023 15:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692106923;
        bh=gHIwHXKM7hPCUjj7hYd9MrDVv2XnPJXONXIunKzrXW4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=liBpTQoXwd4foKQ7dv0oRJseqfk7NDG66XkCdjTkIEwUEh2c6PpKM4p087Xf+YkLz
         68Q3kq5ImHTYTdCnowmNS4QAEageyIRGyTf0sPia/dPf+CcZh/cSDnCVLhH6kgLKHO
         1hwbWVxHzhYL9+ixj7Sojg+IkXkk2gqHui7Je/Kc=
Date:   Tue, 15 Aug 2023 16:43:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: imx290: Convert to new CCI register access
 helpers
Message-ID: <20230815134322.GC3128@pendragon.ideasonboard.com>
References: <20230627125109.52354-1-hdegoede@redhat.com>
 <20230627125109.52354-4-hdegoede@redhat.com>
 <20230815131539.GA9702@pendragon.ideasonboard.com>
 <ZNt+S6dl/rTNLgId@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZNt+S6dl/rTNLgId@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 15, 2023 at 01:31:55PM +0000, Sakari Ailus wrote:
> On Tue, Aug 15, 2023 at 04:15:39PM +0300, Laurent Pinchart wrote:
> > On Tue, Jun 27, 2023 at 02:51:06PM +0200, Hans de Goede wrote:
> > > Use the new comon CCI register access helpers to replace the private
> > > register access helpers in the imx290 driver.
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > > Note:
> > > 1. This is untested
> > > 2. For reviewers: all the IMX290_REG_?BIT defines in both the register
> > > address defines as well as in various reg-sequences were automatically
> > > changed using search replace.
> > > ---
> > > Changes in v3:
> > > - Fixed a couple of lines > 80 chars
> > > 
> > > Changes in v2:
> > > - New patch in v2 of this series
> > > ---
> > >  drivers/media/i2c/Kconfig  |   1 +
> > >  drivers/media/i2c/imx290.c | 360 +++++++++++++++----------------------
> > >  2 files changed, 150 insertions(+), 211 deletions(-)
> > 
> > [snip]
> > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index b3f832e9d7e1..e78c7b91ae72 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -21,91 +21,86 @@
> > 
> > [snip]
> > 
> > > @@ -615,63 +605,15 @@ imx290_format_info(const struct imx290 *imx290, u32 code)
> > >  	return NULL;
> > >  }
> > >  
> > > -/* -----------------------------------------------------------------------------
> > > - * Register access
> > > - */
> > > -
> > > -static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *value)
> > > -{
> > > -	u8 data[3] = { 0, 0, 0 };
> > > -	int ret;
> > > -
> > > -	ret = regmap_raw_read(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> > > -			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> > > -	if (ret < 0) {
> > > -		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
> > > -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> > > -			 addr & IMX290_REG_ADDR_MASK, ret);
> > > -		return ret;
> > > -	}
> > > -
> > > -	*value = get_unaligned_le24(data);
> > > -	return 0;
> > > -}
> > > -
> > > -static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
> > > -{
> > > -	u8 data[3];
> > > -	int ret;
> > > -
> > > -	if (err && *err)
> > > -		return *err;
> > > -
> > > -	put_unaligned_le24(value, data);
> > 
> > We seem to be having a problem here, as the CCI helpers unconditionally
> > use big endian for the data :-(
> 
> Well spotted. This driver needs to address this.
> 
> It's a hardware issue though. It's the only sensor ever I've seen to have
> little endian registers.

I'm not sure I would call that a hardware issue. It may be a peculiarity
of this sensor, but is it really the only one ?

How would you like to see this addressed ? We could add CCI_REG*_LE
macros, but I'm not sure to like that. Setting a flag at init time would
be nicer, but there's nowhere to store it.

> > > -
> > > -	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> > > -			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> > > -	if (ret < 0) {
> > > -		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
> > > -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> > > -			 addr & IMX290_REG_ADDR_MASK, ret);
> > > -		if (err)
> > > -			*err = ret;
> > > -	}
> > > -
> > > -	return ret;
> > > -}
> > > -
> > 
> > [snip]

-- 
Regards,

Laurent Pinchart
