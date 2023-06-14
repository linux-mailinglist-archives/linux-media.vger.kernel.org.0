Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20495730910
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 22:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236658AbjFNUR5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 16:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234231AbjFNUR4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 16:17:56 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081D6DC
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:17:55 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-62df2192d13so19644636d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686773875; x=1689365875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcxmApFT/6N8Ux8uKEd+kIHHnNW0VdSxY9Wd4h8kjmQ=;
        b=XKvpV6Vxb6yq8nkKex1VmbCMS4fcHsBaIQasOW/mUyAjFf2ywkP0HQzzJWwxseuUAK
         fvV/0zrK3vYYZJ7jhwYrqvZCLMXS5wO4r64EtcsUJ+oK/S48uDiosZWBZ99UdXtrLlsT
         eE6pku75LNV3jbC1tLsA3ubnKnwIK1GLDlGo3cIk/tfnDDG6hJWD7muD/IVMwLLwyR2M
         2q1oXB9Y0maM/tT3oMUfhtHsimI4SaeE6Tb7c13tlY5QqfP+SH7fFD0J8qKBtMKOWLiw
         uYB2dZPNp2MxiArUkG8uZWEw4XoYRbxGLTjVgN3PyFkDWSOsfI1br8wsGT70LUOFOFf3
         UmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686773875; x=1689365875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcxmApFT/6N8Ux8uKEd+kIHHnNW0VdSxY9Wd4h8kjmQ=;
        b=Ndd4zwb4AKsM2jMClImLxTQDuc3Fgy5vFlCBji6eP6KD5EKy1/jhKMw/vK0ECHLQSJ
         GEqfWa2f3k+QPpvr6dSdJF1Czc6v+hhqGpiU3AWtGanR0gEGiyokhhc5L1XvRqqDMF3M
         iYCmXtjkWpiQRcZbXnNX3bqb8/uQO0AygLEG2cpbOgKMI96eNzFXewACssa00lulM8QW
         ZaY6Y5bfp7gQ5gJ2QuYsWbSJ8/Ces/r+87LIhPKG67kq91PONst26Yn/lhCZs3nPe0po
         PZfYfGCIdGbXBC3l1QDeO3EAJpee1s69Qe2ugWLT5rSgVLbvOmN1S5EauOiLilRSXw4o
         ivsg==
X-Gm-Message-State: AC+VfDyyfFH0zP0AHpyXUFRCbDVzZp6SnFWQ4IpIUJvS3bbz/o4tGdor
        xgSr97FMW/YgIo1eqUhrE6hHAi7wDbnm6ilOZn4=
X-Google-Smtp-Source: ACHHUZ4uXSSN8SGKDRw8J19z0FuD3/Ui50D/nXealhufqZ3C9Cx+jbrPe6Y/NtwNb104Mk9Tkbf5k9wiKyjrRDAS0rc=
X-Received: by 2002:a05:6214:411e:b0:62d:eae2:a441 with SMTP id
 kc30-20020a056214411e00b0062deae2a441mr11193201qvb.64.1686773875064; Wed, 14
 Jun 2023 13:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230614192343.57280-1-hdegoede@redhat.com> <20230614192343.57280-6-hdegoede@redhat.com>
In-Reply-To: <20230614192343.57280-6-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Jun 2023 23:17:18 +0300
Message-ID: <CAHp75Vfua83tY7bwXgwkxBk=T6mPazxZ5GYex8Qywhdw6jmRUA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: Remove ov_16bit_addr_reg_helpers.h
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
> The helpers in this header are not used anywhere anymore,
> they have been superseded by the new CCI register access helpers.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  include/media/ov_16bit_addr_reg_helpers.h | 92 -----------------------
>  1 file changed, 92 deletions(-)
>  delete mode 100644 include/media/ov_16bit_addr_reg_helpers.h
>
> diff --git a/include/media/ov_16bit_addr_reg_helpers.h b/include/media/ov=
_16bit_addr_reg_helpers.h
> deleted file mode 100644
> index 1c60a50bd795..000000000000
> --- a/include/media/ov_16bit_addr_reg_helpers.h
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * I2C register access helpers for Omnivision OVxxxx image sensors which=
 expect
> - * a 16 bit register address in big-endian format and which have 1-3 byt=
e
> - * wide registers, in big-endian format (for the higher width registers)=
.
> - *
> - * Based on the register helpers from drivers/media/i2c/ov2680.c which i=
s:
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
> -                                 unsigned int len, u32 *val)
> -{
> -       u8 addr_buf[2], data_buf[4] =3D { };
> -       struct i2c_msg msgs[2];
> -       int ret;
> -
> -       if (len > 4)
> -               return -EINVAL;
> -
> -       put_unaligned_be16(reg, addr_buf);
> -
> -       msgs[0].addr =3D client->addr;
> -       msgs[0].flags =3D 0;
> -       msgs[0].len =3D ARRAY_SIZE(addr_buf);
> -       msgs[0].buf =3D addr_buf;
> -
> -       msgs[1].addr =3D client->addr;
> -       msgs[1].flags =3D I2C_M_RD;
> -       msgs[1].len =3D len;
> -       msgs[1].buf =3D &data_buf[4 - len];
> -
> -       ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> -       if (ret !=3D ARRAY_SIZE(msgs)) {
> -               dev_err(&client->dev, "read error: reg=3D0x%4x: %d\n", re=
g, ret);
> -               return -EIO;
> -       }
> -
> -       *val =3D get_unaligned_be32(data_buf);
> -
> -       return 0;
> -}
> -
> -#define ov_read_reg8(s, r, v)  ov_read_reg(s, r, 1, v)
> -#define ov_read_reg16(s, r, v) ov_read_reg(s, r, 2, v)
> -#define ov_read_reg24(s, r, v) ov_read_reg(s, r, 3, v)
> -
> -static inline int ov_write_reg(struct i2c_client *client, u16 reg,
> -                                  unsigned int len, u32 val)
> -{
> -       u8 buf[6];
> -       int ret;
> -
> -       if (len > 4)
> -               return -EINVAL;
> -
> -       put_unaligned_be16(reg, buf);
> -       put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> -       ret =3D i2c_master_send(client, buf, len + 2);
> -       if (ret !=3D len + 2) {
> -               dev_err(&client->dev, "write error: reg=3D0x%4x: %d\n", r=
eg, ret);
> -               return -EIO;
> -       }
> -
> -       return 0;
> -}
> -
> -#define ov_write_reg8(s, r, v) ov_write_reg(s, r, 1, v)
> -#define ov_write_reg16(s, r, v)        ov_write_reg(s, r, 2, v)
> -#define ov_write_reg24(s, r, v)        ov_write_reg(s, r, 3, v)
> -
> -static inline int ov_update_reg(struct i2c_client *client, u16 reg, u8 m=
ask, u8 val)
> -{
> -       u32 readval;
> -       int ret;
> -
> -       ret =3D ov_read_reg8(client, reg, &readval);
> -       if (ret < 0)
> -               return ret;
> -
> -       val =3D (readval & ~mask) | (val & mask);
> -
> -       return ov_write_reg8(client, reg, val);
> -}
> -
> -#endif
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
