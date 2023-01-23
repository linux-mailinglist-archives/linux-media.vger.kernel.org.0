Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDF7678435
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbjAWSKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbjAWSKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:10:01 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D1513B
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:09:59 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412335751"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="412335751"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="769993760"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="769993760"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2023 10:09:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK1GU-00DrlS-1i;
        Mon, 23 Jan 2023 20:09:54 +0200
Date:   Mon, 23 Jan 2023 20:09:54 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y87NchQIfQ3zah+4@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-29-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

...

> +#include <asm/unaligned.h>

Usually we put linux/* followed by asm/*.

> +#include <linux/dev_printk.h>
> +#include <linux/i2c.h>
> +
> +static inline int ovxxxx_read_reg(struct i2c_client *client, u16 reg,
> +				  unsigned int len, u32 *val)
> +{
> +	struct i2c_msg msgs[2];

> +	u8 addr_buf[2] = { reg >> 8, reg & 0xff };

Let's use unaligned.h or byteorder/generic.h?

	__be16 addr_buf = cpu_to_be16(reg);

> +	u8 data_buf[4] = { 0, };

0, is not needed.

> +	int ret;
> +
> +	if (len > 4)
> +		return -EINVAL;
> +
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = ARRAY_SIZE(addr_buf);
> +	msgs[0].buf = addr_buf;

	msgs[0].buf = &addr_buf;

> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = len;

> +	msgs[1].buf = &data_buf[4 - len];

This trick I don't like. Can we have like other driver have it, i.e. switch
case for the possible length and explicit usage of the endian conversion calls?

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

> +	put_unaligned_be16(reg, buf);
> +	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);

Something similar here?

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

> +	readval &= ~mask;
> +	val &= mask;
> +	val |= readval;

Usual pattern:

	val = (readval & ~mask) | (val & mask);

> +	return ovxxxx_write_reg8(client, reg, val);
> +}

-- 
With Best Regards,
Andy Shevchenko


