Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAC0B726547
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 17:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237287AbjFGP5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 11:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241546AbjFGP5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 11:57:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE6A2134
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 08:57:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126233170111.36.openmobile.ne.jp [126.233.170.111])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51EBA2B6;
        Wed,  7 Jun 2023 17:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686153429;
        bh=v9v26PQfNol8Lhxvbnqw6bvx4VvQvhSIL/5ftJFwuJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oowm01eLLBDmJJLzPp+hzvKvIacLlWnmK4PrgzdW4VibY0ThIrP9laLfnHK7SPOJW
         gt7lDsSSCtdt4/iKPAQRugTfBqLzM4HjSn2TAdiIaSeIVCB9CKWBonITM8HdSuMEFv
         6pxUW0eFe6JhGiNC8tZnTuIRcg3u/MmQljqfXI00=
Date:   Wed, 7 Jun 2023 18:57:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: Remove ov_16bit_addr_reg_helpers.h
Message-ID: <20230607155731.GG22127@pendragon.ideasonboard.com>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230606165808.70751-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jun 06, 2023 at 06:58:08PM +0200, Hans de Goede wrote:
> The helpers in this header are not used anywhere anymore,
> they have been superseded by the new CCI register access helpers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'm happy to see a nicer API taking over :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/ov_16bit_addr_reg_helpers.h | 92 -----------------------
>  1 file changed, 92 deletions(-)
>  delete mode 100644 include/media/ov_16bit_addr_reg_helpers.h
> 
> diff --git a/include/media/ov_16bit_addr_reg_helpers.h b/include/media/ov_16bit_addr_reg_helpers.h
> deleted file mode 100644
> index 1c60a50bd795..000000000000
> --- a/include/media/ov_16bit_addr_reg_helpers.h
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * I2C register access helpers for Omnivision OVxxxx image sensors which expect
> - * a 16 bit register address in big-endian format and which have 1-3 byte
> - * wide registers, in big-endian format (for the higher width registers).
> - *
> - * Based on the register helpers from drivers/media/i2c/ov2680.c which is:
> - * Copyright (C) 2018 Linaro Ltd
> - */
> -#ifndef __OV_16BIT_ADDR_REG_HELPERS_H
> -#define __OV_16BIT_ADDR_REG_HELPERS_H
> -
> -#include <asm/unaligned.h>
> -#include <linux/dev_printk.h>
> -#include <linux/i2c.h>
> -
> -static inline int ov_read_reg(struct i2c_client *client, u16 reg,
> -				  unsigned int len, u32 *val)
> -{
> -	u8 addr_buf[2], data_buf[4] = { };
> -	struct i2c_msg msgs[2];
> -	int ret;
> -
> -	if (len > 4)
> -		return -EINVAL;
> -
> -	put_unaligned_be16(reg, addr_buf);
> -
> -	msgs[0].addr = client->addr;
> -	msgs[0].flags = 0;
> -	msgs[0].len = ARRAY_SIZE(addr_buf);
> -	msgs[0].buf = addr_buf;
> -
> -	msgs[1].addr = client->addr;
> -	msgs[1].flags = I2C_M_RD;
> -	msgs[1].len = len;
> -	msgs[1].buf = &data_buf[4 - len];
> -
> -	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> -	if (ret != ARRAY_SIZE(msgs)) {
> -		dev_err(&client->dev, "read error: reg=0x%4x: %d\n", reg, ret);
> -		return -EIO;
> -	}
> -
> -	*val = get_unaligned_be32(data_buf);
> -
> -	return 0;
> -}
> -
> -#define ov_read_reg8(s, r, v)	ov_read_reg(s, r, 1, v)
> -#define ov_read_reg16(s, r, v)	ov_read_reg(s, r, 2, v)
> -#define ov_read_reg24(s, r, v)	ov_read_reg(s, r, 3, v)
> -
> -static inline int ov_write_reg(struct i2c_client *client, u16 reg,
> -				   unsigned int len, u32 val)
> -{
> -	u8 buf[6];
> -	int ret;
> -
> -	if (len > 4)
> -		return -EINVAL;
> -
> -	put_unaligned_be16(reg, buf);
> -	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> -	ret = i2c_master_send(client, buf, len + 2);
> -	if (ret != len + 2) {
> -		dev_err(&client->dev, "write error: reg=0x%4x: %d\n", reg, ret);
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
> -#define ov_write_reg8(s, r, v)	ov_write_reg(s, r, 1, v)
> -#define ov_write_reg16(s, r, v)	ov_write_reg(s, r, 2, v)
> -#define ov_write_reg24(s, r, v)	ov_write_reg(s, r, 3, v)
> -
> -static inline int ov_update_reg(struct i2c_client *client, u16 reg, u8 mask, u8 val)
> -{
> -	u32 readval;
> -	int ret;
> -
> -	ret = ov_read_reg8(client, reg, &readval);
> -	if (ret < 0)
> -		return ret;
> -
> -	val = (readval & ~mask) | (val & mask);
> -
> -	return ov_write_reg8(client, reg, val);
> -}
> -
> -#endif

-- 
Regards,

Laurent Pinchart
