Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8CA724E47
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 22:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238338AbjFFUod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 16:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234109AbjFFUoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 16:44:32 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE721E7E
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 13:44:30 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-75d5051fad3so444557185a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686084270; x=1688676270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9jUYpbnnEOgZBHWl/FhL4Lx4icrApJwqHlbj5Wh0MY=;
        b=aSKO/cGsoYq+hUXW/4sHXzy3DjU+tNx+WnCrUDR3tpUNUVYtVUMTbjdlvSZbv3tmDC
         5VfPBAVzRaj6VJuSu++WCe3mJraTsUu0I26ad9LtBsggKMjNaMrE19iziMIZCBImmD3B
         4joKSt8IjT02Zuw9ZjcyezkTi5nrhxCdtoOfKYPyfuOWSb6gTCffIs1tHqMR6tXg6uVn
         1NcxrcMjr+4dOHVuJx+rlqqjEcqLjDJxnHLsIcuJGmRsfALRtleK3YmZaxaUAwf+2cvi
         FsgE4pT3L60U8Edt6zr2f1ucnOSkxOg5ZtbqkriD+Od3RuVLuIqRyd1KAFkc5pNbidOl
         YbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686084270; x=1688676270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9jUYpbnnEOgZBHWl/FhL4Lx4icrApJwqHlbj5Wh0MY=;
        b=eGLAt+lpJgafAKOlKnEpwths5iOUExjKzLXmQQPqqBaRqgNqXmt+Iyd5XZ9u8i3xGW
         092etCiopqy3X9ajVNzit8VTiXLme4SMa+IweRuWrlJna80xfsc2O3A+W/sj+whhHd8q
         Yisi/LRPgvylbNzF+NdXhCh5/3gH3EyNPGxLJ4PBeEydFJcNz58xROjjGonEFWDgakl8
         BA3ubROa9ekL+WhHzAi6PYBc5hKMTjL0ZlrveUoPPUSDK9IWcHwLeuSdrie7Zswi3W42
         +zIh40/ylA94z8E0IOrhWcO3Zztj7Yh0NjbTmlUN5bBWIwM3MLRgYBV5NHfQwaMdCicY
         AEQg==
X-Gm-Message-State: AC+VfDxhOwUOBsJWy0JnyNo4PaplbRAXMBJ1VyGCefGx0pDGCbsCpuHh
        B94ssa7Cb3OOyfgguIHChJqcQMfUdn3vFBMUP8PijJlnjPmT7Q==
X-Google-Smtp-Source: ACHHUZ6ZT3RfPuy58aLy8hcPTQRPbGCzazr6sJzPIShfg9h7i/P4VXkij+KQoISsdxANHzWwr8iFGFaBgsM1Wj3ayL8=
X-Received: by 2002:a05:620a:8e07:b0:75e:d534:8cff with SMTP id
 re7-20020a05620a8e0700b0075ed5348cffmr907107qkn.20.1686084269864; Tue, 06 Jun
 2023 13:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230606165808.70751-1-hdegoede@redhat.com> <20230606165808.70751-2-hdegoede@redhat.com>
In-Reply-To: <20230606165808.70751-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 6 Jun 2023 23:43:53 +0300
Message-ID: <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
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

On Tue, Jun 6, 2023 at 7:58=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
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
> check each individual register access. The first failing call will
> set the contents of err to a non 0 value and all other calls will
> then become no-ops.

...

> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>

+ types.h

> +#include <media/v4l2-cci.h>

> +int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
> +{
> +       int i, len, ret;
> +       u8 buf[4];
> +
> +       if (err && *err)
> +               return *err;
> +
> +       /* Set len to register width in bytes */
> +       len =3D ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
> +       reg &=3D CCI_REG_ADDR_MASK;
> +
> +       ret =3D regmap_bulk_read(map, reg, buf, len);
> +       if (ret) {
> +               dev_err(regmap_get_device(map), "Error reading reg 0x%4x:=
 %d\n", reg, ret);
> +               if (err)
> +                       *err =3D ret;
> +
> +               return ret;
> +       }
> +
> +       *val =3D 0;
> +       for (i =3D 0; i < len; i++) {
> +               *val <<=3D 8;
> +               *val |=3D buf[i];
> +       }

I really prefer to see put_unaligned() here depending on the length.
Note, that on some CPUs it might be one assembly instruction or even
none, depending on how the result is going to be used.

> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(cci_read);

Can we have it namespaced?

> +int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
> +{
> +       int i, len, ret;
> +       u8 buf[4];
> +
> +       if (err && *err)
> +               return *err;
> +
> +       /* Set len to register width in bytes */
> +       len =3D ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
> +       reg &=3D CCI_REG_ADDR_MASK;
> +
> +       for (i =3D 0; i < len; i++) {
> +               buf[len - i - 1] =3D val & 0xff;
> +               val >>=3D 8;
> +       }
> +
> +       ret =3D regmap_bulk_write(map, reg, buf, len);
> +       if (ret) {
> +               dev_err(regmap_get_device(map), "Error writing reg 0x%4x:=
 %d\n", reg, ret);
> +               if (err)
> +                       *err =3D ret;
> +       }
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(cci_write);

Same comments as per above function.

...

> +               if (regs[i].delay_us)

I'm wondering why fsleep() doesn't have this check? Or does it?

> +                       fsleep(regs[i].delay_us);

...

> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_ad=
dr_bits)
> +{
> +       struct regmap_config config =3D {
> +               .reg_bits =3D reg_addr_bits,
> +               .val_bits =3D 8,
> +               .reg_format_endian =3D REGMAP_ENDIAN_BIG,

Is the lock required?
If so, how is it helpful?

Can we move this outside as static const?

> +       };
> +
> +       return devm_regmap_init_i2c(client, &config);
> +}

...

> +#ifndef _V4L2_CCI_H
> +#define _V4L2_CCI_H

+ bits.h

> +#include <linux/regmap.h>

Not used, rather requires forward declarations of

struct regmap
struct reg_sequence

Also note missing i2c_client forward declaration.

> +#include <linux/types.h>
> +
> +/*
> + * Note cci_reg_8 deliberately is 0, not 1, so that raw
> + * (not wrapped in a CCI_REG*() macro) register addresses
> + * do 8 bit wide accesses. This allows unchanged use of register
> + * initialization lists of raw address, value pairs which only
> + * do 8 bit width accesses. Which makes porting drivers easier.
> + */
> +enum cci_reg_type {
> +       cci_reg_8 =3D 0,

But this is guaranteed by the C standard... See also below.

> +       cci_reg_16,

But this one becomes 1, so the above comment doesn't clarify why it's
okay to have it 1 and not 2.

> +       cci_reg_24,
> +       cci_reg_32,
> +};

--=20
With Best Regards,
Andy Shevchenko
