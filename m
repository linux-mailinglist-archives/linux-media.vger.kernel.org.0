Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935B17308F5
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 22:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234541AbjFNUKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 16:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236405AbjFNUJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 16:09:57 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501DFDC
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:09:55 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-62de0ed7462so19604776d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686773394; x=1689365394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmdItJpp2F0zwCr+6znkgE6GjMR6MCKCMMpJbDJTRkQ=;
        b=ijpJoAtijsLhujER3/ylnUFtPLJ8lkPYrc7+m89NoWhubCtkOPXskZqIbsq+SC/lx3
         ewsW07hGJHAJIk6BhI5HSxEbz6RZmp779bhT9Ikpmk3VdYDufw7m7qoTz4gppCKosraO
         zi58r8VOpOmompRvBmah7B2y7KCHX8IzeIgBhJO7LNwn+52VYr52b/pA4mgM/fEwQVXX
         TqrGX8N6IjmT6HIgRjemCA58PCfqKDKezvxqsXB1Ob586oNB7mvRWhH7VEUukF5HdvSx
         FMNDqBnG0rk3w+VPtrzw5AFVOZI7I5kv+SajImGskK2n1vVtFgmW4eb7Zjx5E6BtrlOe
         DNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686773394; x=1689365394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmdItJpp2F0zwCr+6znkgE6GjMR6MCKCMMpJbDJTRkQ=;
        b=IOq4jlaWkXq+FcsEQ1V9hGIv3p2/7kNUCKONpQ7vG3jrAi0QwogZyVtqrpVR7VNmlA
         Catt9kD+VIMpgsUxmQJlzHg1ZmEaYcska/7+3CBA9Ms5JPYDvbTwbu9i/zDPB3F31vO9
         yZh/TiffE/WHJG4TMqvrXcjYu/dCHS9sOraB/TQoK4rTpVp6loyxjQ9Ob1g1xUxNBJaK
         4QjZrmJCuLvabOt517jLNlHutbcqQV+5v60qwwDrS1iQEARCX8CjPDE4SME+vE/5bkjF
         6f8p7Et8jqhjRLLCIIsdwRvxGmf1igj5/PndMQ+YrCR3yYaMh1SdeufLAh6qiIGE8msU
         3fWg==
X-Gm-Message-State: AC+VfDx2GLypXIeKiCrRKfaOsvjUohm4H+jeQwrpKk914vJx3haH86Z/
        5wdKUDKEpLXN3lk1NT6fmR/fKLR2onNYRRnUvEw=
X-Google-Smtp-Source: ACHHUZ5LlTptv6x1F1Z+9Ls5Xc9OpzRL96Yny/6UI04qDXAllO5wuZbMnlG0lKwzjPGhKLLGX0wlEC8AJmMXy/7Qwf4=
X-Received: by 2002:a05:6214:2627:b0:626:3375:6fea with SMTP id
 gv7-20020a056214262700b0062633756feamr21483376qvb.22.1686773394235; Wed, 14
 Jun 2023 13:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230614192343.57280-1-hdegoede@redhat.com> <20230614192343.57280-2-hdegoede@redhat.com>
In-Reply-To: <20230614192343.57280-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Jun 2023 23:09:17 +0300
Message-ID: <CAHp75VftCyBKjY5_nkm4s8-_ckUDnXergN7u62LirujAhzSEqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper functions
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 14, 2023 at 10:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> The CSI2 specification specifies a standard method to access camera senso=
r
> registers called "Camera Control Interface (CCI)".
>
> This uses either 8 or 16 bit (big-endian wire order) register addresses
> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
>
> Currently a lot of Linux camera sensor drivers all have their own custom
> helpers for this, often copy and pasted from other drivers.
>
> Add a set of generic helpers for this so that all sensor drivers can
> switch to a single common implementation.
>
> These helpers take an extra optional "int *err" function parameter,
> this can be used to chain a bunch of register accesses together with
> only a single error check at the end, rather then needing to error

than

> check each individual register access. The first failing call will
> set the contents of err to a non 0 value and all other calls will
> then become no-ops.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

In case we need 48-bit accessors, we also have respective
get_unaligned_*48()/put_unaligned_*48() APIs.

> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-3955132=
9cd0a@redhat.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Drop cci_reg_type enum
> - Make having an encoded reg-width mandatory rather then using 0 to encod=
e
>   8 bit width making reg-addresses without an encoded width default to
>   a width of 8
> - Add support for 64 bit wide registers
> - Introduce a new cci_reg_sequence struct with 64 bit reg values for 64 b=
it
>   support and without the delay_us field
> - Various kerneldoc updates
> - Stop supporting delays in cci_multi_reg_write()
> - Some includes cleanups
> - Disable regmap locking
> ---
>  Documentation/driver-api/media/v4l2-cci.rst  |   5 +
>  Documentation/driver-api/media/v4l2-core.rst |   1 +
>  drivers/media/v4l2-core/Kconfig              |   5 +
>  drivers/media/v4l2-core/Makefile             |   1 +
>  drivers/media/v4l2-core/v4l2-cci.c           | 157 +++++++++++++++++++
>  include/media/v4l2-cci.h                     | 121 ++++++++++++++
>  6 files changed, 290 insertions(+)
>  create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
>  create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
>  create mode 100644 include/media/v4l2-cci.h
>
> diff --git a/Documentation/driver-api/media/v4l2-cci.rst b/Documentation/=
driver-api/media/v4l2-cci.rst
> new file mode 100644
> index 000000000000..dd297a40ed20
> --- /dev/null
> +++ b/Documentation/driver-api/media/v4l2-cci.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +V4L2 CCI kAPI
> +^^^^^^^^^^^^^
> +.. kernel-doc:: include/media/v4l2-cci.h
> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation=
/driver-api/media/v4l2-core.rst
> index 1a8c4a5f256b..239045ecc8f4 100644
> --- a/Documentation/driver-api/media/v4l2-core.rst
> +++ b/Documentation/driver-api/media/v4l2-core.rst
> @@ -22,6 +22,7 @@ Video4Linux devices
>      v4l2-mem2mem
>      v4l2-async
>      v4l2-fwnode
> +    v4l2-cci
>      v4l2-rect
>      v4l2-tuner
>      v4l2-common
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kc=
onfig
> index 348559bc2468..523ba243261d 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -74,6 +74,11 @@ config V4L2_FWNODE
>  config V4L2_ASYNC
>         tristate
>
> +config V4L2_CCI
> +       tristate
> +       depends on I2C
> +       select REGMAP_I2C
> +
>  # Used by drivers that need Videobuf modules
>  config VIDEOBUF_GEN
>         tristate
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/M=
akefile
> index 41d91bd10cf2..be2551705755 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -25,6 +25,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) +=3D v4l2-i2c.o
>  # (e. g. LC_ALL=3DC sort Makefile)
>
>  obj-$(CONFIG_V4L2_ASYNC) +=3D v4l2-async.o
> +obj-$(CONFIG_V4L2_CCI) +=3D v4l2-cci.o
>  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) +=3D v4l2-flash-led-class.o
>  obj-$(CONFIG_V4L2_FWNODE) +=3D v4l2-fwnode.o
>  obj-$(CONFIG_V4L2_H264) +=3D v4l2-h264.o
> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core=
/v4l2-cci.c
> new file mode 100644
> index 000000000000..94764f3ebc6c
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MIPI Camera Control Interface (CCI) register access helpers.
> + *
> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#include <asm/unaligned.h>
> +
> +#include <media/v4l2-cci.h>
> +
> +int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> +{
> +       int len, ret;
> +       u8 buf[8];
> +
> +       if (err && *err)
> +               return *err;
> +
> +       len =3D FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> +       reg =3D FIELD_GET(CCI_REG_ADDR_MASK, reg);
> +
> +       ret =3D regmap_bulk_read(map, reg, buf, len);
> +       if (ret) {
> +               dev_err(regmap_get_device(map), "Error reading reg 0x%4x:=
 %d\n", reg, ret);
> +               goto out;
> +       }
> +
> +       switch (len) {
> +       case 1:
> +               *val =3D buf[0];
> +               break;
> +       case 2:
> +               *val =3D get_unaligned_be16(buf);
> +               break;
> +       case 3:
> +               *val =3D get_unaligned_be24(buf);
> +               break;
> +       case 4:
> +               *val =3D get_unaligned_be32(buf);
> +               break;
> +       case 8:
> +               *val =3D get_unaligned_be64(buf);
> +               break;
> +       default:
> +               dev_err(regmap_get_device(map), "Error invalid reg-width =
%d for reg 0x%04x\n",
> +                       len, reg);
> +               ret =3D -EINVAL;
> +               break;
> +       }
> +
> +out:
> +       if (ret && err)
> +               *err =3D ret;
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(cci_read);
> +
> +int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
> +{
> +       int len, ret;
> +       u8 buf[8];
> +
> +       if (err && *err)
> +               return *err;
> +
> +       len =3D FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> +       reg =3D FIELD_GET(CCI_REG_ADDR_MASK, reg);
> +
> +       switch (len) {
> +       case 1:
> +               buf[0] =3D val;
> +               break;
> +       case 2:
> +               put_unaligned_be16(val, buf);
> +               break;
> +       case 3:
> +               put_unaligned_be24(val, buf);
> +               break;
> +       case 4:
> +               put_unaligned_be32(val, buf);
> +               break;
> +       case 8:
> +               put_unaligned_be64(val, buf);
> +               break;
> +       default:
> +               dev_err(regmap_get_device(map), "Error invalid reg-width =
%d for reg 0x%04x\n",
> +                       len, reg);
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       ret =3D regmap_bulk_write(map, reg, buf, len);
> +       if (ret)
> +               dev_err(regmap_get_device(map), "Error writing reg 0x%4x:=
 %d\n", reg, ret);
> +
> +out:
> +       if (ret && err)
> +               *err =3D ret;
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(cci_write);
> +
> +int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int =
*err)
> +{
> +       u64 readval;
> +       int ret;
> +
> +       ret =3D cci_read(map, reg, &readval, err);
> +       if (ret)
> +               return ret;
> +
> +       val =3D (readval & ~mask) | (val & mask);
> +
> +       return cci_write(map, reg, val, err);
> +}
> +EXPORT_SYMBOL_GPL(cci_update_bits);
> +
> +int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequenc=
e *regs,
> +                       int num_regs, int *err)
> +{
> +       int i, ret;
> +
> +       for (i =3D 0; i < num_regs; i++) {
> +               ret =3D cci_write(map, regs[i].reg, regs[i].val, err);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(cci_multi_reg_write);
> +
> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_ad=
dr_bits)
> +{
> +       struct regmap_config config =3D {
> +               .reg_bits =3D reg_addr_bits,
> +               .val_bits =3D 8,
> +               .reg_format_endian =3D REGMAP_ENDIAN_BIG,
> +               .disable_locking =3D true,
> +       };
> +
> +       return devm_regmap_init_i2c(client, &config);
> +}
> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> new file mode 100644
> index 000000000000..5d8fdff086db
> --- /dev/null
> +++ b/include/media/v4l2-cci.h
> @@ -0,0 +1,121 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * MIPI Camera Control Interface (CCI) register access helpers.
> + *
> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
> + */
> +#ifndef _V4L2_CCI_H
> +#define _V4L2_CCI_H
> +
> +#include <linux/types.h>
> +
> +struct i2c_client;
> +struct reg_sequence;
> +struct regmap;
> +
> +/**
> + * struct cci_reg_sequence - An individual write from a sequence of CCI =
writes
> + *
> + * @reg: Register address, use CCI_REG#() macros to encode reg width
> + * @val: Register value
> + *
> + * Register/value pairs for sequences of writes.
> + */
> +struct cci_reg_sequence {
> +       u32 reg;
> +       u64 val;
> +};
> +
> +/*
> + * Macros to define register address with the register width encoded
> + * into the higher bits.
> + */
> +#define CCI_REG_ADDR_MASK              GENMASK(15, 0)
> +#define CCI_REG_WIDTH_SHIFT            16
> +#define CCI_REG_WIDTH_MASK             GENMASK(19, 16)
> +
> +#define CCI_REG8(x)                    ((1 << CCI_REG_WIDTH_SHIFT) | (x)=
)
> +#define CCI_REG16(x)                   ((2 << CCI_REG_WIDTH_SHIFT) | (x)=
)
> +#define CCI_REG24(x)                   ((3 << CCI_REG_WIDTH_SHIFT) | (x)=
)
> +#define CCI_REG32(x)                   ((4 << CCI_REG_WIDTH_SHIFT) | (x)=
)
> +#define CCI_REG64(x)                   ((8 << CCI_REG_WIDTH_SHIFT) | (x)=
)
> +
> +/**
> + * cci_read() - Read a value from a single CCI register
> + *
> + * @map: Register map to read from
> + * @reg: Register address to read, use CCI_REG#() macros to encode reg w=
idth
> + * @val: Pointer to store read value
> + * @err: optional pointer to store errors, if a previous error is set
> + *       then the read will be skipped
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_read(struct regmap *map, u32 reg, u64 *val, int *err);
> +
> +/**
> + * cci_write() - Write a value to a single CCI register
> + *
> + * @map: Register map to write to
> + * @reg: Register address to write, use CCI_REG#() macros to encode reg =
width
> + * @val: Value to be written
> + * @err: optional pointer to store errors, if a previous error is set
> + *       then the write will be skipped
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_write(struct regmap *map, u32 reg, u64 val, int *err);
> +
> +/**
> + * cci_update_bits() - Perform a read/modify/write cycle on a single CCI=
 register
> + *
> + * @map: Register map to update
> + * @reg: Register address to update, use CCI_REG#() macros to encode reg=
 width
> + * @mask: Bitmask to change
> + * @val: New value for bitmask
> + * @err: optional pointer to store errors, if a previous error is set
> + *       then the update will be skipped
> + *
> + * Note this uses read-modify-write to update the bits, atomicity wrt ot=
her
> + * cci_*() register access functions is NOT guaranteed.
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int =
*err);
> +
> +/**
> + * cci_multi_reg_write() - Write multiple registers to the device
> + *
> + * @map: Register map to write to
> + * @regs: Array of structures containing register-address, value pairs t=
o be written
> + *        register-addresses use CCI_REG#() macros to encode reg width
> + * @num_regs: Number of registers to write
> + * @err: optional pointer to store errors, if a previous error is set
> + *       then the write will be skipped
> + *
> + * Write multiple registers to the device where the set of register, val=
ue
> + * pairs are supplied in any order, possibly not all in a single range.
> + *
> + * Use of the CCI_REG#() macros to encode reg width is mandatory.
> + *
> + * For raw lists of register-address, -value pairs with only 8 bit
> + * wide writes regmap_multi_reg_write() can be used instead.
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequenc=
e *regs,
> +                       int num_regs, int *err);
> +
> +/**
> + * cci_regmap_init_i2c() - Create regmap to use with cci_*() register ac=
cess functions
> + *
> + * @client: i2c_client to create the regmap for
> + * @reg_addr_bits: register address width to use (8 or 16)
> + *
> + * Note the memory for the created regmap is devm() managed, tied to the=
 client.
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_ad=
dr_bits);
> +
> +#endif
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
