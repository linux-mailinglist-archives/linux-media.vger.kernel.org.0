Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F201A77CDFD
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 16:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235590AbjHOOWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 10:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237577AbjHOOVo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 10:21:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497EC173F
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 07:21:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DF225A4;
        Tue, 15 Aug 2023 16:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692109229;
        bh=JIFRdnTw0n2AgQuM1GItvyLiZXu08y8jYSi15h8+YOw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eALWhcN5dqZBQRV4hf9jqnV2NDpCmn8IQCezJ6RPh0H3ZRdl4jVNVwDvd8Xs8ww9H
         hOiiiYAZIMJmN+MtRprUEENEeZfmz8fkyzf8AgMUid+bR8q/q5tHZoewN5C+5cEpIa
         bI68XpYY3FtFzr0DEqUB04tyek7Q6dGshdZONOcw=
Date:   Tue, 15 Aug 2023 17:21:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: imx290: Convert to new CCI register access
 helpers
Message-ID: <20230815142148.GF3128@pendragon.ideasonboard.com>
References: <20230627125109.52354-1-hdegoede@redhat.com>
 <20230627125109.52354-4-hdegoede@redhat.com>
 <20230815131539.GA9702@pendragon.ideasonboard.com>
 <6e13f1d6-190a-eb2a-8dfc-2f9d35c7bc24@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e13f1d6-190a-eb2a-8dfc-2f9d35c7bc24@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Aug 15, 2023 at 04:15:39PM +0200, Hans de Goede wrote:
> On 8/15/23 15:15, Laurent Pinchart wrote:
> > On Tue, Jun 27, 2023 at 02:51:06PM +0200, Hans de Goede wrote:
> >> Use the new comon CCI register access helpers to replace the private
> >> register access helpers in the imx290 driver.
> >>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> Note:
> >> 1. This is untested
> >> 2. For reviewers: all the IMX290_REG_?BIT defines in both the register
> >> address defines as well as in various reg-sequences were automatically
> >> changed using search replace.
> >> ---
> >> Changes in v3:
> >> - Fixed a couple of lines > 80 chars
> >>
> >> Changes in v2:
> >> - New patch in v2 of this series
> >> ---
> >>  drivers/media/i2c/Kconfig  |   1 +
> >>  drivers/media/i2c/imx290.c | 360 +++++++++++++++----------------------
> >>  2 files changed, 150 insertions(+), 211 deletions(-)
> > 
> > [snip]
> > 
> >> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> >> index b3f832e9d7e1..e78c7b91ae72 100644
> >> --- a/drivers/media/i2c/imx290.c
> >> +++ b/drivers/media/i2c/imx290.c
> >> @@ -21,91 +21,86 @@
> > 
> > [snip]
> > 
> >> @@ -615,63 +605,15 @@ imx290_format_info(const struct imx290 *imx290, u32 code)
> >>  	return NULL;
> >>  }
> >>  
> >> -/* -----------------------------------------------------------------------------
> >> - * Register access
> >> - */
> >> -
> >> -static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *value)
> >> -{
> >> -	u8 data[3] = { 0, 0, 0 };
> >> -	int ret;
> >> -
> >> -	ret = regmap_raw_read(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> >> -			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> >> -	if (ret < 0) {
> >> -		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
> >> -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> >> -			 addr & IMX290_REG_ADDR_MASK, ret);
> >> -		return ret;
> >> -	}
> >> -
> >> -	*value = get_unaligned_le24(data);
> >> -	return 0;
> >> -}
> >> -
> >> -static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
> >> -{
> >> -	u8 data[3];
> >> -	int ret;
> >> -
> >> -	if (err && *err)
> >> -		return *err;
> >> -
> >> -	put_unaligned_le24(value, data);
> > 
> > We seem to be having a problem here, as the CCI helpers unconditionally
> > use big endian for the data :-(
> 
> That is because that is what the specification says, from the MIPI CSI spec:
> 
> """
> 6.3.2 The Transmission Byte Order for Multi-byte Register Values
> 
> This is a normative section.
> 
> The first byte of a CCI message is always the MS byte of a multi-byte
> register and the last byte is always the LS byte.
> """
> 
> So it seems that the IMX sensors are special here and it might be best
> to just revert the conversion to the CCI helpers?

I'm fine with reverting for v6.6, as we're close to the release of v6.5.

> Alternative would be to make devm_cci_regmap_init_i2c() return a newly
> allocated struct which contains both a struct regmap * and a long
> flags and make the helpers take a pointer to that struct, combined
> with adding an endianess flag to the flags member.

I think I like the idea, it will probably help adding support for
various device-specific quirks in the future.

> >> -
> >> -	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> >> -			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> >> -	if (ret < 0) {
> >> -		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
> >> -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> >> -			 addr & IMX290_REG_ADDR_MASK, ret);
> >> -		if (err)
> >> -			*err = ret;
> >> -	}
> >> -
> >> -	return ret;
> >> -}
> >> -

-- 
Regards,

Laurent Pinchart
