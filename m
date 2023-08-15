Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED49677CD35
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 15:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbjHONPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 09:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237455AbjHONPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 09:15:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951C919AD
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 06:15:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1DA45A4;
        Tue, 15 Aug 2023 15:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692105262;
        bh=oPXp6yolBibySv1On7Jq0SVPqhdgr1wrDV5rS2BJ8+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mDntOBpwi9cDR0BIoSX2iaY7F9oX3ZeG9rFLtXJZRkeMZ8K1FftGtf+HgmrCJreys
         WemrSXPnCeSRjWBtbjx2zmUYVX1zeg+5RLPW5R7P5veziCh2Lo3EkJDdEOaNNRNRBt
         gK+4N/+7J6Qic7fgIByfYupiMGW3OyTIwhUT4VIQ=
Date:   Tue, 15 Aug 2023 16:15:39 +0300
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
Message-ID: <20230815131539.GA9702@pendragon.ideasonboard.com>
References: <20230627125109.52354-1-hdegoede@redhat.com>
 <20230627125109.52354-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230627125109.52354-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jun 27, 2023 at 02:51:06PM +0200, Hans de Goede wrote:
> Use the new comon CCI register access helpers to replace the private
> register access helpers in the imx290 driver.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note:
> 1. This is untested
> 2. For reviewers: all the IMX290_REG_?BIT defines in both the register
> address defines as well as in various reg-sequences were automatically
> changed using search replace.
> ---
> Changes in v3:
> - Fixed a couple of lines > 80 chars
> 
> Changes in v2:
> - New patch in v2 of this series
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx290.c | 360 +++++++++++++++----------------------
>  2 files changed, 150 insertions(+), 211 deletions(-)

[snip]

> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index b3f832e9d7e1..e78c7b91ae72 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -21,91 +21,86 @@

[snip]

> @@ -615,63 +605,15 @@ imx290_format_info(const struct imx290 *imx290, u32 code)
>  	return NULL;
>  }
>  
> -/* -----------------------------------------------------------------------------
> - * Register access
> - */
> -
> -static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *value)
> -{
> -	u8 data[3] = { 0, 0, 0 };
> -	int ret;
> -
> -	ret = regmap_raw_read(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> -			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> -	if (ret < 0) {
> -		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
> -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> -			 addr & IMX290_REG_ADDR_MASK, ret);
> -		return ret;
> -	}
> -
> -	*value = get_unaligned_le24(data);
> -	return 0;
> -}
> -
> -static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
> -{
> -	u8 data[3];
> -	int ret;
> -
> -	if (err && *err)
> -		return *err;
> -
> -	put_unaligned_le24(value, data);

We seem to be having a problem here, as the CCI helpers unconditionally
use big endian for the data :-(

> -
> -	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> -			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> -	if (ret < 0) {
> -		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
> -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> -			 addr & IMX290_REG_ADDR_MASK, ret);
> -		if (err)
> -			*err = ret;
> -	}
> -
> -	return ret;
> -}
> -

[snip]

-- 
Regards,

Laurent Pinchart
