Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E06968EC31
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 10:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjBHJxH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 04:53:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjBHJwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 04:52:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D403C2BF
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 01:52:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (233.56-78-194.adsl-static.isp.belgacom.be [194.78.56.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76122496;
        Wed,  8 Feb 2023 10:52:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675849953;
        bh=WveqdO5eNIVUmUK6G4qv4Ws7cmir9rPCQX2NNIXVURg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AkxnV/BlHKVq07aki7CX/oD7UOAMEXet08VkpJJEevExrSJlCl9p/1D3FmdjImKe2
         BRKy3o+5WexRlVGEgX35oV0gVdNc0IuRZ7/QeaOJVQkKhzkonNdwY+HMMhhK8dWobS
         oez2xkvgo0xVH2DJiqm43I2HHPaWxO/0IqsepE/M=
Date:   Wed, 8 Feb 2023 11:52:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-29-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> 
> as well as various "atomisp" sensor drivers in drivers/staging, *all*
> use register access helpers with the following function prototypes:
> 
> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
>                     unsigned int len, u32 *val);
> 
> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
>                      unsigned int len, u32 val);
> 
> To read/write registers on Omnivision OVxxxx image sensors wich expect
> a 16 bit register address in big-endian format and which have 1-3 byte
> wide registers, in big-endian format (for the higher width registers).
> 
> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> versions of these register access helpers, so that this code duplication
> can be removed.

Any reason to hand-roll those instead of using regmap ? Also, may I
suggest to have a look at drivers/media/i2c/imx290.c for an example of
how registers of different sizes can be handled in a less error-prone
way, using single read/write functions that adapt to the size
automatically ?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  include/media/ovxxxx_16bit_addr_reg_helpers.h | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 include/media/ovxxxx_16bit_addr_reg_helpers.h
> 
> diff --git a/include/media/ovxxxx_16bit_addr_reg_helpers.h b/include/media/ovxxxx_16bit_addr_reg_helpers.h
> new file mode 100644
> index 000000000000..e2ffee3d797a
> --- /dev/null
> +++ b/include/media/ovxxxx_16bit_addr_reg_helpers.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * I2C register access helpers for Omnivision OVxxxx image sensors which expect
> + * a 16 bit register address in big-endian format and which have 1-3 byte
> + * wide registers, in big-endian format (for the higher width registers).
> + *
> + * Based on the register helpers from drivers/media/i2c/ov2680.c which is:
> + * Copyright (C) 2018 Linaro Ltd
> + */
> +#ifndef __OVXXXX_16BIT_ADDR_REG_HELPERS_H
> +#define __OVXXXX_16BIT_ADDR_REG_HELPERS_H
> +
> +#include <asm/unaligned.h>
> +#include <linux/dev_printk.h>
> +#include <linux/i2c.h>
> +
> +static inline int ovxxxx_read_reg(struct i2c_client *client, u16 reg,
> +				  unsigned int len, u32 *val)
> +{
> +	struct i2c_msg msgs[2];
> +	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
> +	u8 data_buf[4] = { 0, };
> +	int ret;
> +
> +	if (len > 4)
> +		return -EINVAL;
> +
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = ARRAY_SIZE(addr_buf);
> +	msgs[0].buf = addr_buf;
> +
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = len;
> +	msgs[1].buf = &data_buf[4 - len];
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret != ARRAY_SIZE(msgs)) {
> +		dev_err(&client->dev, "read error: reg=0x%4x: %d\n", reg, ret);
> +		return -EIO;
> +	}
> +
> +	*val = get_unaligned_be32(data_buf);
> +
> +	return 0;
> +}
> +
> +#define ovxxxx_read_reg8(s, r, v)	ovxxxx_read_reg(s, r, 1, v)
> +#define ovxxxx_read_reg16(s, r, v)	ovxxxx_read_reg(s, r, 2, v)
> +#define ovxxxx_read_reg24(s, r, v)	ovxxxx_read_reg(s, r, 3, v)
> +
> +static inline int ovxxxx_write_reg(struct i2c_client *client, u16 reg,
> +				   unsigned int len, u32 val)
> +{
> +	u8 buf[6];
> +	int ret;
> +
> +	if (len > 4)
> +		return -EINVAL;
> +
> +	put_unaligned_be16(reg, buf);
> +	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> +	ret = i2c_master_send(client, buf, len + 2);
> +	if (ret != len + 2) {
> +		dev_err(&client->dev, "write error: reg=0x%4x: %d\n", reg, ret);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +#define ovxxxx_write_reg8(s, r, v)	ovxxxx_write_reg(s, r, 1, v)
> +#define ovxxxx_write_reg16(s, r, v)	ovxxxx_write_reg(s, r, 2, v)
> +#define ovxxxx_write_reg24(s, r, v)	ovxxxx_write_reg(s, r, 3, v)
> +
> +static inline int ovxxxx_mod_reg(struct i2c_client *client, u16 reg, u8 mask, u8 val)
> +{
> +	u32 readval;
> +	int ret;
> +
> +	ret = ovxxxx_read_reg8(client, reg, &readval);
> +	if (ret < 0)
> +		return ret;
> +
> +	readval &= ~mask;
> +	val &= mask;
> +	val |= readval;
> +
> +	return ovxxxx_write_reg8(client, reg, val);
> +}
> +
> +#endif

-- 
Regards,

Laurent Pinchart
