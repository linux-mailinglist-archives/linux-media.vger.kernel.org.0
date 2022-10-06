Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DC75F69EA
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 16:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbiJFOpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 10:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbiJFOpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 10:45:19 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFFF193E5
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 07:45:13 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w10so3164048edd.4
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCnRLBaE24ShVQbIcI7nH+0RNKgMWYks9VcOc3BY/FU=;
        b=OK+oI5si3PTwf4u+RNSP2oFCLJ/fAIjY3C6maCqX5/P6rGB6Bg/+7YrhcZeaUzKqQ0
         7RXAuQTvINhTJDofxu88u8UxX21e7FItgtbQ1OI2ShQ0BjYp1PwHlL7uj9wEqvr0wq8/
         rb5+NUo3c/i9PiEW1hJ/VYlMAKoZvTTi3KMsChosK6CMoEWHknsG4kKqLUwyqEp0RXUg
         0boqi+Gc1z7rQFI9JH5uUUlj5yGoy1Hh4qDI/88BSjlKlbXpEjsQNHUHcqAquCyUeWlQ
         cHeLru7/Yy9e6fi3z5yRvSYgYZEtEsffCbK5kWL5lsVlYfau4e1LNFsJvqsYBBmYsd97
         1W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCnRLBaE24ShVQbIcI7nH+0RNKgMWYks9VcOc3BY/FU=;
        b=d/HL9tAUenKu9LDfyyydgzermlC/8kje6Ywc23TmxbcgWwVjyrcYKEqHtxvcM3NEb5
         2h89qBQL3xN+QCjm7Jo0E5oB8kkK2/Vg5t677WLyM8W+sYVAM1j0ptx5CoxLR3e8W7yK
         55Pptve2FqjBaRnH/nuBxkZRB93BRg2Qk8xs/nXEvPTlqu/YgHMJe1IrG8Oxm2wIZyvC
         1YZRm2KdTqkqVT6CdEt0Q3SUengknPmGJfpn5tgaBIPN0ffvk3orhKDvxXaVHzRHoUA5
         U6Qr1GaEZNXs/0ZxGvORhglhz/Hk5sKRejG9sQCcrqYBqX3OLlDRPyFka2AgZkdgctfE
         ZIJQ==
X-Gm-Message-State: ACrzQf281YElUKXu5PIn9FiLAkNyFwAK/5eECZJvrRnwJ5tQECflE1Wr
        L34TVcGX4p5Sw+kZKSWvEZgkRsJFW2utlvwStXzaIw==
X-Google-Smtp-Source: AMsMyM6kSPOTEjhJUVKWGsZ2REMWFa0Uo7HUId4L0Woh3lMXgwU8oWBIUYNMPTUEVadlBPk1c+J4TMotUw2RNZKkHYA=
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id
 fi14-20020a056402550e00b00456f79f2bedmr130725edb.106.1665067511968; Thu, 06
 Oct 2022 07:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-3-jacopo@jmondi.org>
In-Reply-To: <20221005190613.394277-3-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 15:44:54 +0100
Message-ID: <CAPY8ntB48837t+UN_6k5DJ6QBJvgz0Ohc4w4=7044amrdCy1=A@mail.gmail.com>
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Add support for V4L2_CID_ANALOG_GAIN. The control programs the global
> gain register which applies to all color channels.
>
> As both the global digital and analog gains are controlled through a
> single register, in order not to overwrite the configured digital gain
> we need to read the current register value before modifying it.
>
> Implement a function to read register values and use it before applying
> the new analog gain.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ar0521.c | 64 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 89f3c01f18ce..581f5e42994d 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -5,6 +5,8 @@
>   * Written by Krzysztof Ha=C5=82asa
>   */
>
> +#include <asm/unaligned.h>
> +
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
> @@ -35,6 +37,11 @@
>  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
>  #define AR0521_TOTAL_WIDTH_MIN      2968u
>
> +#define AR0521_ANA_GAIN_MIN            0x00
> +#define AR0521_ANA_GAIN_MAX            0x3f
> +#define AR0521_ANA_GAIN_STEP           0x01
> +#define AR0521_ANA_GAIN_DEFAULT                0x00
> +
>  /* AR0521 registers */
>  #define AR0521_REG_VT_PIX_CLK_DIV              0x0300
>  #define AR0521_REG_FRAME_LENGTH_LINES          0x0340
> @@ -55,6 +62,7 @@
>  #define AR0521_REG_RED_GAIN                    0x305A
>  #define AR0521_REG_GREEN2_GAIN                 0x305C
>  #define AR0521_REG_GLOBAL_GAIN                 0x305E
> +#define AR0521_REG_GLOBAL_GAIN_ANA_MASK                0x3f
>
>  #define AR0521_REG_HISPI_TEST_MODE             0x3066
>  #define AR0521_REG_HISPI_TEST_MODE_LP11                  0x0004
> @@ -77,6 +85,7 @@ static const char * const ar0521_supply_names[] =3D {
>
>  struct ar0521_ctrls {
>         struct v4l2_ctrl_handler handler;
> +       struct v4l2_ctrl *ana_gain;
>         struct {
>                 struct v4l2_ctrl *gain;
>                 struct v4l2_ctrl *red_balance;
> @@ -167,6 +176,36 @@ static int ar0521_write_reg(struct ar0521_dev *senso=
r, u16 reg, u16 val)
>         return ar0521_write_regs(sensor, buf, 2);
>  }
>
> +static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
> +{
> +       struct i2c_client *client =3D sensor->i2c_client;
> +       unsigned char buf[2];
> +       struct i2c_msg msg;
> +       int ret;
> +
> +       msg.addr =3D client->addr;
> +       msg.flags =3D client->flags;
> +       msg.len =3D sizeof(u16);
> +       msg.buf =3D buf;
> +       put_unaligned_be16(reg, buf);
> +
> +       ret =3D i2c_transfer(client->adapter, &msg, 1);
> +       if (ret < 0)
> +               return ret;
> +
> +       msg.len =3D sizeof(u16);
> +       msg.flags =3D client->flags | I2C_M_RD;
> +       msg.buf =3D buf;
> +
> +       ret =3D i2c_transfer(client->adapter, &msg, 1);
> +       if (ret < 0)
> +               return ret;
> +
> +       *val =3D get_unaligned_be16(buf);
> +
> +       return 0;
> +}
> +
>  static int ar0521_set_geometry(struct ar0521_dev *sensor)
>  {
>         /* All dimensions are unsigned 12-bit integers */
> @@ -187,6 +226,21 @@ static int ar0521_set_geometry(struct ar0521_dev *se=
nsor)
>         return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
>  }
>
> +static int ar0521_set_analog_gain(struct ar0521_dev *sensor)
> +{
> +       u16 global_gain;
> +       int ret;
> +
> +       ret =3D ar0521_read_reg(sensor, AR0521_REG_GLOBAL_GAIN, &global_g=
ain);
> +       if (ret)
> +               return ret;
> +
> +       global_gain &=3D ~AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> +       global_gain |=3D sensor->ctrls.ana_gain->val & AR0521_REG_GLOBAL_=
GAIN_ANA_MASK;
> +
> +       return ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, global_ga=
in);

Does this work without nasty interactions?

The register reference I have says that the bits 6:0 of 0x3056,
0x3058, 0x305a, 0x305c, and 0x305e are all aliased to register 0x3056.
That means that the writes from ar0521_set_gains for GAIN,
RED_BALANCE, and BLUE_BALANCE will stomp over your ANALOGUE_GAIN.

I also don't see a call to __v4l2_ctrl_handler_setup from
ar0521_set_stream, so whilst there is an explicit call to
ar0521_set_gains, ANALOGUE_GAIN won't be set.

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ar0521.=
c#L190

> +}
> +
>  static int ar0521_set_gains(struct ar0521_dev *sensor)
>  {
>         int green =3D sensor->ctrls.gain->val;
> @@ -456,6 +510,9 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_VBLANK:
>                 ret =3D ar0521_set_geometry(sensor);
>                 break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               ret =3D ar0521_set_analog_gain(sensor);
> +               break;
>         case V4L2_CID_GAIN:
>         case V4L2_CID_RED_BALANCE:
>         case V4L2_CID_BLUE_BALANCE:
> @@ -499,6 +556,13 @@ static int ar0521_init_controls(struct ar0521_dev *s=
ensor)
>         /* We can use our own mutex for the ctrl lock */
>         hdl->lock =3D &sensor->lock;
>
> +       /* Analog gain */
> +       ctrls->ana_gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE=
_GAIN,
> +                                           AR0521_ANA_GAIN_MIN,
> +                                           AR0521_ANA_GAIN_MAX,
> +                                           AR0521_ANA_GAIN_STEP,
> +                                           AR0521_ANA_GAIN_DEFAULT);
> +
>         /* Manual gain */
>         ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511=
, 1, 0);
>         ctrls->red_balance =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_B=
ALANCE,
> --
> 2.37.3
>
