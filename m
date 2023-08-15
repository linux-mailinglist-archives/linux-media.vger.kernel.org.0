Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE9677CD95
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 15:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237405AbjHONyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 09:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237457AbjHONyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 09:54:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23A6198C
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 06:54:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F29C5A4;
        Tue, 15 Aug 2023 15:52:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692107574;
        bh=kCGCHiCZYKD/Q+nNsFIT5TsFWyu3HmNo41Gb6rlQ+Ik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cv29W0NF6Z2Ow8OvDHYz3mROuNS/UnBbUQiyqOFm29/4t88SVtP8GCLo7L57xhJIC
         GulnBHJeq5opQ3HShWWqtiKISHKGBd9j1V9ALl+tew4xMLAgYnUiO0GxCP6c5GpEzv
         mOxR+oVNg4GLeKJ6k5c9dulNbdBkv1UoQbP2TJnU=
Date:   Tue, 15 Aug 2023 16:54:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: imx290: Convert to new CCI register access
 helpers
Message-ID: <20230815135413.GD3128@pendragon.ideasonboard.com>
References: <20230627125109.52354-1-hdegoede@redhat.com>
 <20230815131539.GA9702@pendragon.ideasonboard.com>
 <ZNt+S6dl/rTNLgId@kekkonen.localdomain>
 <2156749.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2156749.irdbgypaU6@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 15, 2023 at 03:48:53PM +0200, Alexander Stein wrote:
> Am Dienstag, 15. August 2023, 15:31:55 CEST schrieb Sakari Ailus:
> > On Tue, Aug 15, 2023 at 04:15:39PM +0300, Laurent Pinchart wrote:
> > > On Tue, Jun 27, 2023 at 02:51:06PM +0200, Hans de Goede wrote:
> > > > Use the new comon CCI register access helpers to replace the private
> > > > register access helpers in the imx290 driver.
> > > > 
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > ---
> > > > Note:
> > > > 1. This is untested
> > > > 2. For reviewers: all the IMX290_REG_?BIT defines in both the register
> > > > address defines as well as in various reg-sequences were automatically
> > > > changed using search replace.
> > > > ---
> > > > Changes in v3:
> > > > - Fixed a couple of lines > 80 chars
> > > > 
> > > > Changes in v2:
> > > > - New patch in v2 of this series
> > > > ---
> > > > 
> > > >  drivers/media/i2c/Kconfig  |   1 +
> > > >  drivers/media/i2c/imx290.c | 360 +++++++++++++++----------------------
> > > >  2 files changed, 150 insertions(+), 211 deletions(-)
> > > 
> > > [snip]
> > > 
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index b3f832e9d7e1..e78c7b91ae72 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -21,91 +21,86 @@
> > > 
> > > [snip]
> > > 
> > > > @@ -615,63 +605,15 @@ imx290_format_info(const struct imx290 *imx290, u32 code)
> > > > 
> > > >  	return NULL;
> > > >  
> > > >  }
> > > > 
> > > > -/* -----------------------------------------------------------------------------
> > > > - * Register access
> > > > - */
> > > > -
> > > > -static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *value)
> > > > -{
> > > > -	u8 data[3] = { 0, 0, 0 };
> > > > -	int ret;
> > > > -
> > > > -	ret = regmap_raw_read(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> > > > -			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> > > > -	if (ret < 0) {
> > > > -		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
> > > > -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> > > > -			 addr & IMX290_REG_ADDR_MASK, ret);
> > > > -		return ret;
> > > > -	}
> > > > -
> > > > -	*value = get_unaligned_le24(data);
> > > > -	return 0;
> > > > -}
> > > > -
> > > > -static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
> > > > -{
> > > > -	u8 data[3];
> > > > -	int ret;
> > > > -
> > > > -	if (err && *err)
> > > > -		return *err;
> > > > -
> > > > -	put_unaligned_le24(value, data);
> > > 
> > > We seem to be having a problem here, as the CCI helpers unconditionally
> > > use big endian for the data :-(
> > 
> > Well spotted. This driver needs to address this.
> > 
> > It's a hardware issue though. It's the only sensor ever I've seen to have
> > little endian registers.

The IMX296 and IMX297 seem to also have little-endian register values.

> It's getting even worse: There are cameras using this sensor when bulk read is 
> broken (VC MIPI IMX327 C, Laurent knows about this peculiar hardware), so 
> regmap_config.use_single_read has to be set to true. This is currently not 
> possible anymore insode this driver.

I think this could be fixed by passing a flag to the init function. Or,
possibly better, the init function could read a DT property and set the
flag automatically.

> > > > -
> > > > -	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> > > > -			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> > > > -	if (ret < 0) {
> > > > -		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
> > > > -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> > > > -			 addr & IMX290_REG_ADDR_MASK, ret);
> > > > -		if (err)
> > > > -			*err = ret;
> > > > -	}
> > > > -
> > > > -	return ret;
> > > > -}
> > > > -
> > > 
> > > [snip]

-- 
Regards,

Laurent Pinchart
