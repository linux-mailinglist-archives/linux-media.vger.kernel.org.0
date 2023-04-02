Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10DB36D35E8
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 09:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjDBH1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 03:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBH1l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 03:27:41 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88501D856
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 00:27:38 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id bz27so25601242qtb.1
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680420458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCm2i1F1GYoIhWVkmcmuavPRRnanhk5YK3O7/MzQJtg=;
        b=pkEeqWOAXGlqhME8jWi4l5jrdaIR/yKGUGBd4xt5rLBZCD9cziLLGhnWLG/5cLxD1+
         o4Ak22s+5zsIeE2nyQojdKjmpR8jYJZFZtyFvhVfNi3d/GlBZ834ZqKuDgMG+uqZLX6m
         YO/LnnVv4EMlsAXU1DtMtN0RtWbRUcqSgDz0GzY0hhcLMlBEJFY0elQRtt6Y0k5UUXKJ
         JxziY8VNUlHZ0ZCmv2N62wJRsl3sQQW/9d9tVsBLtBN0wdwO9qUEV8kY3I4wziLE1/Uo
         kFT5pbcw6ynwygKXGMT7q50pErd5akSKWsMQ6RNjKWQwDueyiz1j2f9miHOVdKJVo8Jq
         QAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680420458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCm2i1F1GYoIhWVkmcmuavPRRnanhk5YK3O7/MzQJtg=;
        b=dBPdZ/B+Xd6ozQfREeydhzETbwApngDeolhY4ngG4cl6S3AqioYxTUCKbgUudUXH4x
         Eo2hwnIodaKpLUUMmf7xaBzXnUSEJwxEfbY/1bhX0Yr+oagImsWqT3E1mA9YN5lmvGIv
         YrbBumQD0wZcV/F8Ru7RnWLCoTZ1mk3unXvsI3DKIe5SBzlWsX5HFwneLRJJsU6HkfNv
         avMvnAuzxDCXpHPwmLXULIPJZOaLaBUGoe4PXWZmWs6t5QIhO9RKh/qPYB1JTzPfJUtu
         WXv5v0RTrbnevvCYFj2pQhi9p9tNYtSjqhCo+zth1Z+jJRylj3Lsp1Q9ar8Tp6nD3EAp
         YwMg==
X-Gm-Message-State: AAQBX9dbSLCv9PpJxbbAzih1ErmNgDDaueEPXoL5ncWDQJGYqZhIZ2MU
        YgmatgB+wu2448KDBON2VkHaFR8/+O57ELkpfhA=
X-Google-Smtp-Source: AK7set8TdUdTjATNKbWfeJiqpLnUXEYGyh854f29990dk7Xae1j44AyaADEqIGgl9MDfuumSR7kvlY8eahMdUIm5cco=
X-Received: by 2002:ac8:5905:0:b0:3de:1720:b54b with SMTP id
 5-20020ac85905000000b003de1720b54bmr11804401qty.0.1680420457956; Sun, 02 Apr
 2023 00:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-8-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-8-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 09:27:02 +0200
Message-ID: <CAHp75Vd5t73x=bSDFfCXnbmQ_3sWvedUdO7ssWHVX_BeLvQEJw@mail.gmail.com>
Subject: Re: [PATCH 07/28] media: atomisp: gc0310: Remove enum gc0310_tok_type
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> enum gc0310_tok_type / the data_length read/write parameter
> is always GC0310_8BIT, drop this.
>
> Note for the register-lists the indentation is also fixed and
> c++ style comments are converted to regular C-style /* */ comments.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-gc0310.c        |  72 ++---
>  drivers/staging/media/atomisp/i2c/gc0310.h    | 302 +++++++++---------
>  2 files changed, 167 insertions(+), 207 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 5974dd5bd95e..4e92268da32a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -35,8 +35,7 @@
>  #include "gc0310.h"
>
>  /* i2c read/write stuff */
> -static int gc0310_read_reg(struct i2c_client *client,
> -                          u16 data_length, u8 reg, u8 *val)
> +static int gc0310_read_reg(struct i2c_client *client, u8 reg, u8 *val)
>  {
>         int err;
>         struct i2c_msg msg[2];
> @@ -48,12 +47,6 @@ static int gc0310_read_reg(struct i2c_client *client,
>                 return -ENODEV;
>         }
>
> -       if (data_length !=3D GC0310_8BIT) {
> -               dev_err(&client->dev, "%s error, invalid data length\n",
> -                       __func__);
> -               return -EINVAL;
> -       }
> -
>         memset(msg, 0, sizeof(msg));
>
>         msg[0].addr =3D client->addr;
> @@ -65,7 +58,7 @@ static int gc0310_read_reg(struct i2c_client *client,
>         data[0] =3D (u8)(reg & 0xff);

Do we need the casting and  & 0xff part? (see below)

>         msg[1].addr =3D client->addr;
> -       msg[1].len =3D data_length;
> +       msg[1].len =3D 1;
>         msg[1].flags =3D I2C_M_RD;
>         msg[1].buf =3D data;
>
> @@ -78,11 +71,7 @@ static int gc0310_read_reg(struct i2c_client *client,
>                 return err;
>         }
>
> -       *val =3D 0;
> -       /* high byte comes first */
> -       if (data_length =3D=3D GC0310_8BIT)
> -               *val =3D (u8)data[0];
> -
> +       *val =3D (u8)data[0];

Do we need casting?

>         return 0;
>  }
>
> @@ -101,25 +90,17 @@ static int gc0310_i2c_write(struct i2c_client *clien=
t, u16 len, u8 *data)
>         return ret =3D=3D num_msg ? 0 : -EIO;
>  }
>
> -static int gc0310_write_reg(struct i2c_client *client, u16 data_length,
> -                           u8 reg, u8 val)
> +static int gc0310_write_reg(struct i2c_client *client, u8 reg, u8 val)
>  {
>         int ret;
>         unsigned char data[2] =3D {0};
>         u8 *wreg =3D (u8 *)data;

Oh, this looks like a candidate to the proper helpers (as you made
somewhere else for other sensor drivers).



> -       const u16 len =3D data_length + sizeof(u8); /* 8-bit address + da=
ta */
> -
> -       if (data_length !=3D GC0310_8BIT) {
> -               dev_err(&client->dev,
> -                       "%s error, invalid data_length\n", __func__);
> -               return -EINVAL;
> -       }
> +       const u16 len =3D 1 + sizeof(u8); /* 8-bit address + data */
>
>         /* high byte goes out first */
>         *wreg =3D (u8)(reg & 0xff);

No casting?


> -       if (data_length =3D=3D GC0310_8BIT)
> -               data[1] =3D (u8)(val);
> +       data[1] =3D (u8)(val);

Ditto.

And so on.

>         ret =3D gc0310_i2c_write(client, len, data);
>         if (ret)
> @@ -142,7 +123,7 @@ static int gc0310_write_reg_array(struct i2c_client *=
client,
>         int i, err;
>
>         for (i =3D 0; i < count; i++) {
> -               err =3D gc0310_write_reg(client, GC0310_8BIT, reglist[i].=
reg, reglist[i].val);
> +               err =3D gc0310_write_reg(client, reglist[i].reg, reglist[=
i].val);
>                 if (err)
>                         return err;
>         }
> @@ -173,14 +154,12 @@ static int gc0310_set_gain(struct v4l2_subdev *sd, =
int gain)
>         dev_dbg(&client->dev, "gain=3D0x%x again=3D0x%x dgain=3D0x%x\n", =
gain, again, dgain);
>
>         /* set analog gain */
> -       ret =3D gc0310_write_reg(client, GC0310_8BIT,
> -                              GC0310_AGC_ADJ, again);
> +       ret =3D gc0310_write_reg(client, GC0310_AGC_ADJ, again);
>         if (ret)
>                 return ret;
>
>         /* set digital gain */
> -       ret =3D gc0310_write_reg(client, GC0310_8BIT,
> -                              GC0310_DGC_ADJ, dgain);
> +       ret =3D gc0310_write_reg(client, GC0310_DGC_ADJ, dgain);
>         if (ret)
>                 return ret;
>
> @@ -197,15 +176,11 @@ static int __gc0310_set_exposure(struct v4l2_subdev=
 *sd, int coarse_itg,
>         dev_dbg(&client->dev, "coarse_itg=3D%d gain=3D%d digitgain=3D%d\n=
", coarse_itg, gain, digitgain);
>
>         /* set exposure */
> -       ret =3D gc0310_write_reg(client, GC0310_8BIT,
> -                              GC0310_AEC_PK_EXPO_L,
> -                              coarse_itg & 0xff);
> +       ret =3D gc0310_write_reg(client, GC0310_AEC_PK_EXPO_L, coarse_itg=
 & 0xff);
>         if (ret)
>                 return ret;
>
> -       ret =3D gc0310_write_reg(client, GC0310_8BIT,
> -                              GC0310_AEC_PK_EXPO_H,
> -                              (coarse_itg >> 8) & 0x0f);
> +       ret =3D gc0310_write_reg(client, GC0310_AEC_PK_EXPO_H, (coarse_it=
g >> 8) & 0x0f);
>         if (ret)
>                 return ret;
>
> @@ -280,16 +255,12 @@ static int gc0310_q_exposure(struct v4l2_subdev *sd=
, s32 *value)
>         int ret;
>
>         /* get exposure */
> -       ret =3D gc0310_read_reg(client, GC0310_8BIT,
> -                             GC0310_AEC_PK_EXPO_L,
> -                             &reg_v);
> +       ret =3D gc0310_read_reg(client, GC0310_AEC_PK_EXPO_L, &reg_v);
>         if (ret)
>                 goto err;
>
>         *value =3D reg_v;
> -       ret =3D gc0310_read_reg(client, GC0310_8BIT,
> -                             GC0310_AEC_PK_EXPO_H,
> -                             &reg_v);
> +       ret =3D gc0310_read_reg(client, GC0310_AEC_PK_EXPO_H, &reg_v);
>         if (ret)
>                 goto err;
>
> @@ -654,14 +625,12 @@ static int gc0310_detect(struct i2c_client *client)
>         if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
>                 return -ENODEV;
>
> -       ret =3D gc0310_read_reg(client, GC0310_8BIT,
> -                             GC0310_SC_CMMN_CHIP_ID_H, &high);
> +       ret =3D gc0310_read_reg(client, GC0310_SC_CMMN_CHIP_ID_H, &high);
>         if (ret) {
>                 dev_err(&client->dev, "read sensor_id_high failed\n");
>                 return -ENODEV;
>         }
> -       ret =3D gc0310_read_reg(client, GC0310_8BIT,
> -                             GC0310_SC_CMMN_CHIP_ID_L, &low);
> +       ret =3D gc0310_read_reg(client, GC0310_SC_CMMN_CHIP_ID_L, &low);
>         if (ret) {
>                 dev_err(&client->dev, "read sensor_id_low failed\n");
>                 return -ENODEV;
> @@ -691,22 +660,20 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, =
int enable)
>
>         if (enable) {
>                 /* enable per frame MIPI and sensor ctrl reset  */
> -               ret =3D gc0310_write_reg(client, GC0310_8BIT,
> -                                      0xFE, 0x30);
> +               ret =3D gc0310_write_reg(client, 0xFE, 0x30);
>                 if (ret) {
>                         mutex_unlock(&dev->input_lock);
>                         return ret;
>                 }
>         }
>
> -       ret =3D gc0310_write_reg(client, GC0310_8BIT,
> -                              GC0310_RESET_RELATED, GC0310_REGISTER_PAGE=
_3);
> +       ret =3D gc0310_write_reg(client, GC0310_RESET_RELATED, GC0310_REG=
ISTER_PAGE_3);
>         if (ret) {
>                 mutex_unlock(&dev->input_lock);
>                 return ret;
>         }
>
> -       ret =3D gc0310_write_reg(client, GC0310_8BIT, GC0310_SW_STREAM,
> +       ret =3D gc0310_write_reg(client, GC0310_SW_STREAM,
>                                enable ? GC0310_START_STREAMING :
>                                GC0310_STOP_STREAMING);
>         if (ret) {
> @@ -714,8 +681,7 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, in=
t enable)
>                 return ret;
>         }
>
> -       ret =3D gc0310_write_reg(client, GC0310_8BIT,
> -                              GC0310_RESET_RELATED, GC0310_REGISTER_PAGE=
_0);
> +       ret =3D gc0310_write_reg(client, GC0310_RESET_RELATED, GC0310_REG=
ISTER_PAGE_0);
>         if (ret) {
>                 mutex_unlock(&dev->input_lock);
>                 return ret;
> diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging=
/media/atomisp/i2c/gc0310.h
> index a2734934fc6a..0ff2d93cbcbf 100644
> --- a/drivers/staging/media/atomisp/i2c/gc0310.h
> +++ b/drivers/staging/media/atomisp/i2c/gc0310.h
> @@ -138,20 +138,14 @@ struct gc0310_device {
>         bool power_on;
>  };
>
> -enum gc0310_tok_type {
> -       GC0310_8BIT  =3D 0x0001,
> -};
> -
>  /**
>   * struct gc0310_reg - MI sensor  register format
> - * @type: type of the register
>   * @reg: 16-bit offset to register
>   * @val: 8/16/32-bit register value
>   *
>   * Define a structure for sensor register initialization values
>   */
>  struct gc0310_reg {
> -       enum gc0310_tok_type type;
>         u8 reg;
>         u8 val; /* @set value for read/mod/write, @mask */
>  };
> @@ -165,181 +159,181 @@ static const struct gc0310_reg gc0310_reset_regis=
ter[] =3D {
>  /////////////////////////////////////////////////
>  /////////////////      system reg      /////////////////
>  /////////////////////////////////////////////////
> -       {GC0310_8BIT, 0xfe, 0xf0},
> -       {GC0310_8BIT, 0xfe, 0xf0},
> -       {GC0310_8BIT, 0xfe, 0x00},
> -
> -       {GC0310_8BIT, 0xfc, 0x0e}, //4e
> -       {GC0310_8BIT, 0xfc, 0x0e}, //16//4e // [0]apwd [6]regf_clk_gate
> -       {GC0310_8BIT, 0xf2, 0x80}, //sync output
> -       {GC0310_8BIT, 0xf3, 0x00}, //1f//01 data output
> -       {GC0310_8BIT, 0xf7, 0x33}, //f9
> -       {GC0310_8BIT, 0xf8, 0x05}, //00
> -       {GC0310_8BIT, 0xf9, 0x0e}, // 0x8e //0f
> -       {GC0310_8BIT, 0xfa, 0x11},
> +       { 0xfe, 0xf0 },
> +       { 0xfe, 0xf0 },
> +       { 0xfe, 0x00 },
> +
> +       { 0xfc, 0x0e }, /* 4e */
> +       { 0xfc, 0x0e }, /* 16//4e // [0]apwd [6]regf_clk_gate */
> +       { 0xf2, 0x80 }, /* sync output */
> +       { 0xf3, 0x00 }, /* 1f//01 data output */
> +       { 0xf7, 0x33 }, /* f9 */
> +       { 0xf8, 0x05 }, /* 00 */
> +       { 0xf9, 0x0e }, /* 0x8e //0f */
> +       { 0xfa, 0x11 },
>
>  /////////////////////////////////////////////////
>  ///////////////////   MIPI      ////////////////////
>  /////////////////////////////////////////////////
> -       {GC0310_8BIT, 0xfe, 0x03},
> -       {GC0310_8BIT, 0x01, 0x03}, ///mipi 1lane
> -       {GC0310_8BIT, 0x02, 0x22}, // 0x33
> -       {GC0310_8BIT, 0x03, 0x94},
> -       {GC0310_8BIT, 0x04, 0x01}, // fifo_prog
> -       {GC0310_8BIT, 0x05, 0x00}, //fifo_prog
> -       {GC0310_8BIT, 0x06, 0x80}, //b0  //YUV ISP data
> -       {GC0310_8BIT, 0x11, 0x2a},//1e //LDI set YUV422
> -       {GC0310_8BIT, 0x12, 0x90},//00 //04 //00 //04//00 //LWC[7:0]  //
> -       {GC0310_8BIT, 0x13, 0x02},//05 //05 //LWC[15:8]
> -       {GC0310_8BIT, 0x15, 0x12}, // 0x10 //DPHYY_MODE read_ready
> -       {GC0310_8BIT, 0x17, 0x01},
> -       {GC0310_8BIT, 0x40, 0x08},
> -       {GC0310_8BIT, 0x41, 0x00},
> -       {GC0310_8BIT, 0x42, 0x00},
> -       {GC0310_8BIT, 0x43, 0x00},
> -       {GC0310_8BIT, 0x21, 0x02}, // 0x01
> -       {GC0310_8BIT, 0x22, 0x02}, // 0x01
> -       {GC0310_8BIT, 0x23, 0x01}, // 0x05 //Nor:0x05 DOU:0x06
> -       {GC0310_8BIT, 0x29, 0x00},
> -       {GC0310_8BIT, 0x2A, 0x25}, // 0x05 //data zero 0x7a de
> -       {GC0310_8BIT, 0x2B, 0x02},
> -
> -       {GC0310_8BIT, 0xfe, 0x00},
> +       { 0xfe, 0x03 },
> +       { 0x01, 0x03 }, /* mipi 1lane */
> +       { 0x02, 0x22 }, /* 0x33 */
> +       { 0x03, 0x94 },
> +       { 0x04, 0x01 }, /* fifo_prog */
> +       { 0x05, 0x00 }, /* fifo_prog */
> +       { 0x06, 0x80 }, /* b0  //YUV ISP data */
> +       { 0x11, 0x2a }, /* 1e //LDI set YUV422 */
> +       { 0x12, 0x90 }, /* 00 //04 //00 //04//00 //LWC[7:0] */
> +       { 0x13, 0x02 }, /* 05 //05 //LWC[15:8] */
> +       { 0x15, 0x12 }, /* 0x10 //DPHYY_MODE read_ready */
> +       { 0x17, 0x01 },
> +       { 0x40, 0x08 },
> +       { 0x41, 0x00 },
> +       { 0x42, 0x00 },
> +       { 0x43, 0x00 },
> +       { 0x21, 0x02 }, /* 0x01 */
> +       { 0x22, 0x02 }, /* 0x01 */
> +       { 0x23, 0x01 }, /* 0x05 //Nor:0x05 DOU:0x06 */
> +       { 0x29, 0x00 },
> +       { 0x2A, 0x25 }, /* 0x05 //data zero 0x7a de */
> +       { 0x2B, 0x02 },
> +
> +       { 0xfe, 0x00 },
>
>  /////////////////////////////////////////////////
>  /////////////////      CISCTL reg      /////////////////
>  /////////////////////////////////////////////////
> -       {GC0310_8BIT, 0x00, 0x2f}, //2f//0f//02//01
> -       {GC0310_8BIT, 0x01, 0x0f}, //06
> -       {GC0310_8BIT, 0x02, 0x04},
> -       {GC0310_8BIT, 0x4f, 0x00}, //AEC 0FF
> -       {GC0310_8BIT, 0x03, 0x01}, // 0x03 //04
> -       {GC0310_8BIT, 0x04, 0xc0}, // 0xe8 //58
> -       {GC0310_8BIT, 0x05, 0x00},
> -       {GC0310_8BIT, 0x06, 0xb2}, // 0x0a //HB
> -       {GC0310_8BIT, 0x07, 0x00},
> -       {GC0310_8BIT, 0x08, 0x0c}, // 0x89 //VB
> -       {GC0310_8BIT, 0x09, 0x00}, //row start
> -       {GC0310_8BIT, 0x0a, 0x00}, //
> -       {GC0310_8BIT, 0x0b, 0x00}, //col start
> -       {GC0310_8BIT, 0x0c, 0x00},
> -       {GC0310_8BIT, 0x0d, 0x01}, //height
> -       {GC0310_8BIT, 0x0e, 0xf2}, // 0xf7 //height
> -       {GC0310_8BIT, 0x0f, 0x02}, //width
> -       {GC0310_8BIT, 0x10, 0x94}, // 0xa0 //height
> -       {GC0310_8BIT, 0x17, 0x14},
> -       {GC0310_8BIT, 0x18, 0x1a}, //0a//[4]double reset
> -       {GC0310_8BIT, 0x19, 0x14}, //AD pipeline
> -       {GC0310_8BIT, 0x1b, 0x48},
> -       {GC0310_8BIT, 0x1e, 0x6b}, //3b//col bias
> -       {GC0310_8BIT, 0x1f, 0x28}, //20//00//08//txlow
> -       {GC0310_8BIT, 0x20, 0x89}, //88//0c//[3:2]DA15
> -       {GC0310_8BIT, 0x21, 0x49}, //48//[3] txhigh
> -       {GC0310_8BIT, 0x22, 0xb0},
> -       {GC0310_8BIT, 0x23, 0x04}, //[1:0]vcm_r
> -       {GC0310_8BIT, 0x24, 0x16}, //15
> -       {GC0310_8BIT, 0x34, 0x20}, //[6:4] rsg high//range
> +       { 0x00, 0x2f }, /* 2f//0f//02//01 */
> +       { 0x01, 0x0f }, /* 06 */
> +       { 0x02, 0x04 },
> +       { 0x4f, 0x00 }, /* AEC 0FF */
> +       { 0x03, 0x01 }, /* 0x03 //04 */
> +       { 0x04, 0xc0 }, /* 0xe8 //58 */
> +       { 0x05, 0x00 },
> +       { 0x06, 0xb2 }, /* 0x0a //HB */
> +       { 0x07, 0x00 },
> +       { 0x08, 0x0c }, /* 0x89 //VB */
> +       { 0x09, 0x00 }, /* row start */
> +       { 0x0a, 0x00 },
> +       { 0x0b, 0x00 }, /* col start */
> +       { 0x0c, 0x00 },
> +       { 0x0d, 0x01 }, /* height */
> +       { 0x0e, 0xf2 }, /* 0xf7 //height */
> +       { 0x0f, 0x02 }, /* width */
> +       { 0x10, 0x94 }, /* 0xa0 //height */
> +       { 0x17, 0x14 },
> +       { 0x18, 0x1a }, /* 0a//[4]double reset */
> +       { 0x19, 0x14 }, /* AD pipeline */
> +       { 0x1b, 0x48 },
> +       { 0x1e, 0x6b }, /* 3b//col bias */
> +       { 0x1f, 0x28 }, /* 20//00//08//txlow */
> +       { 0x20, 0x89 }, /* 88//0c//[3:2]DA15 */
> +       { 0x21, 0x49 }, /* 48//[3] txhigh */
> +       { 0x22, 0xb0 },
> +       { 0x23, 0x04 }, /* [1:0]vcm_r */
> +       { 0x24, 0x16 }, /* 15 */
> +       { 0x34, 0x20 }, /* [6:4] rsg high//range */
>
>  /////////////////////////////////////////////////
>  ////////////////////   BLK      ////////////////////
>  /////////////////////////////////////////////////
> -       {GC0310_8BIT, 0x26, 0x23}, //[1]dark_current_en [0]offset_en
> -       {GC0310_8BIT, 0x28, 0xff}, //BLK_limie_value
> -       {GC0310_8BIT, 0x29, 0x00}, //global offset
> -       {GC0310_8BIT, 0x33, 0x18}, //offset_ratio
> -       {GC0310_8BIT, 0x37, 0x20}, //dark_current_ratio
> -       {GC0310_8BIT, 0x2a, 0x00},
> -       {GC0310_8BIT, 0x2b, 0x00},
> -       {GC0310_8BIT, 0x2c, 0x00},
> -       {GC0310_8BIT, 0x2d, 0x00},
> -       {GC0310_8BIT, 0x2e, 0x00},
> -       {GC0310_8BIT, 0x2f, 0x00},
> -       {GC0310_8BIT, 0x30, 0x00},
> -       {GC0310_8BIT, 0x31, 0x00},
> -       {GC0310_8BIT, 0x47, 0x80}, //a7
> -       {GC0310_8BIT, 0x4e, 0x66}, //select_row
> -       {GC0310_8BIT, 0xa8, 0x02}, //win_width_dark, same with crop_win_w=
idth
> -       {GC0310_8BIT, 0xa9, 0x80},
> +       { 0x26, 0x23 }, /* [1]dark_current_en [0]offset_en */
> +       { 0x28, 0xff }, /* BLK_limie_value */
> +       { 0x29, 0x00 }, /* global offset */
> +       { 0x33, 0x18 }, /* offset_ratio */
> +       { 0x37, 0x20 }, /* dark_current_ratio */
> +       { 0x2a, 0x00 },
> +       { 0x2b, 0x00 },
> +       { 0x2c, 0x00 },
> +       { 0x2d, 0x00 },
> +       { 0x2e, 0x00 },
> +       { 0x2f, 0x00 },
> +       { 0x30, 0x00 },
> +       { 0x31, 0x00 },
> +       { 0x47, 0x80 }, /* a7 */
> +       { 0x4e, 0x66 }, /* select_row */
> +       { 0xa8, 0x02 }, /* win_width_dark, same with crop_win_width */
> +       { 0xa9, 0x80 },
>
>  /////////////////////////////////////////////////
>  //////////////////      ISP reg  ///////////////////
>  /////////////////////////////////////////////////
> -       {GC0310_8BIT, 0x40, 0x06}, // 0xff //ff //48
> -       {GC0310_8BIT, 0x41, 0x00}, // 0x21 //00//[0]curve_en
> -       {GC0310_8BIT, 0x42, 0x04}, // 0xcf //0a//[1]awn_en
> -       {GC0310_8BIT, 0x44, 0x18}, // 0x18 //02
> -       {GC0310_8BIT, 0x46, 0x02}, // 0x03 //sync
> -       {GC0310_8BIT, 0x49, 0x03},
> -       {GC0310_8BIT, 0x4c, 0x20}, //00[5]pretect exp
> -       {GC0310_8BIT, 0x50, 0x01}, //crop enable
> -       {GC0310_8BIT, 0x51, 0x00},
> -       {GC0310_8BIT, 0x52, 0x00},
> -       {GC0310_8BIT, 0x53, 0x00},
> -       {GC0310_8BIT, 0x54, 0x01},
> -       {GC0310_8BIT, 0x55, 0x01}, //crop window height
> -       {GC0310_8BIT, 0x56, 0xf0},
> -       {GC0310_8BIT, 0x57, 0x02}, //crop window width
> -       {GC0310_8BIT, 0x58, 0x90},
> +       { 0x40, 0x06 }, /* 0xff //ff //48 */
> +       { 0x41, 0x00 }, /* 0x21 //00//[0]curve_en */
> +       { 0x42, 0x04 }, /* 0xcf //0a//[1]awn_en */
> +       { 0x44, 0x18 }, /* 0x18 //02 */
> +       { 0x46, 0x02 }, /* 0x03 //sync */
> +       { 0x49, 0x03 },
> +       { 0x4c, 0x20 }, /* 00[5]pretect exp */
> +       { 0x50, 0x01 }, /* crop enable */
> +       { 0x51, 0x00 },
> +       { 0x52, 0x00 },
> +       { 0x53, 0x00 },
> +       { 0x54, 0x01 },
> +       { 0x55, 0x01 }, /* crop window height */
> +       { 0x56, 0xf0 },
> +       { 0x57, 0x02 }, /* crop window width */
> +       { 0x58, 0x90 },
>
>  /////////////////////////////////////////////////
>  ///////////////////   GAIN      ////////////////////
>  /////////////////////////////////////////////////
> -       {GC0310_8BIT, 0x70, 0x70}, //70 //80//global gain
> -       {GC0310_8BIT, 0x71, 0x20}, // pregain gain
> -       {GC0310_8BIT, 0x72, 0x40}, // post gain
> -       {GC0310_8BIT, 0x5a, 0x84}, //84//analog gain 0
> -       {GC0310_8BIT, 0x5b, 0xc9}, //c9
> -       {GC0310_8BIT, 0x5c, 0xed}, //ed//not use pga gain highest level
> -       {GC0310_8BIT, 0x77, 0x40}, // R gain 0x74 //awb gain
> -       {GC0310_8BIT, 0x78, 0x40}, // G gain
> -       {GC0310_8BIT, 0x79, 0x40}, // B gain 0x5f
> -
> -       {GC0310_8BIT, 0x48, 0x00},
> -       {GC0310_8BIT, 0xfe, 0x01},
> -       {GC0310_8BIT, 0x0a, 0x45}, //[7]col gain mode
> -
> -       {GC0310_8BIT, 0x3e, 0x40},
> -       {GC0310_8BIT, 0x3f, 0x5c},
> -       {GC0310_8BIT, 0x40, 0x7b},
> -       {GC0310_8BIT, 0x41, 0xbd},
> -       {GC0310_8BIT, 0x42, 0xf6},
> -       {GC0310_8BIT, 0x43, 0x63},
> -       {GC0310_8BIT, 0x03, 0x60},
> -       {GC0310_8BIT, 0x44, 0x03},
> +       { 0x70, 0x70 }, /* 70 //80//global gain */
> +       { 0x71, 0x20 }, /* pregain gain */
> +       { 0x72, 0x40 }, /* post gain */
> +       { 0x5a, 0x84 }, /* 84//analog gain 0  */
> +       { 0x5b, 0xc9 }, /* c9 */
> +       { 0x5c, 0xed }, /* ed//not use pga gain highest level */
> +       { 0x77, 0x40 }, /* R gain 0x74 //awb gain */
> +       { 0x78, 0x40 }, /* G gain */
> +       { 0x79, 0x40 }, /* B gain 0x5f */
> +
> +       { 0x48, 0x00 },
> +       { 0xfe, 0x01 },
> +       { 0x0a, 0x45 }, /* [7]col gain mode */
> +
> +       { 0x3e, 0x40 },
> +       { 0x3f, 0x5c },
> +       { 0x40, 0x7b },
> +       { 0x41, 0xbd },
> +       { 0x42, 0xf6 },
> +       { 0x43, 0x63 },
> +       { 0x03, 0x60 },
> +       { 0x44, 0x03 },
>
>  /////////////////////////////////////////////////
>  /////////////////      dark sun   //////////////////
>  /////////////////////////////////////////////////
> -       {GC0310_8BIT, 0xfe, 0x01},
> -       {GC0310_8BIT, 0x45, 0xa4}, // 0xf7
> -       {GC0310_8BIT, 0x46, 0xf0}, // 0xff //f0//sun value th
> -       {GC0310_8BIT, 0x48, 0x03}, //sun mode
> -       {GC0310_8BIT, 0x4f, 0x60}, //sun_clamp
> -       {GC0310_8BIT, 0xfe, 0x00},
> +       { 0xfe, 0x01 },
> +       { 0x45, 0xa4 }, /* 0xf7 */
> +       { 0x46, 0xf0 }, /* 0xff //f0//sun value th */
> +       { 0x48, 0x03 }, /* sun mode */
> +       { 0x4f, 0x60 }, /* sun_clamp */
> +       { 0xfe, 0x00 },
>  };
>
>  static struct gc0310_reg const gc0310_VGA_30fps[] =3D {
> -       {GC0310_8BIT, 0xfe, 0x00},
> -       {GC0310_8BIT, 0x0d, 0x01}, //height
> -       {GC0310_8BIT, 0x0e, 0xf2}, // 0xf7 //height
> -       {GC0310_8BIT, 0x0f, 0x02}, //width
> -       {GC0310_8BIT, 0x10, 0x94}, // 0xa0 //height
> -
> -       {GC0310_8BIT, 0x50, 0x01}, //crop enable
> -       {GC0310_8BIT, 0x51, 0x00},
> -       {GC0310_8BIT, 0x52, 0x00},
> -       {GC0310_8BIT, 0x53, 0x00},
> -       {GC0310_8BIT, 0x54, 0x01},
> -       {GC0310_8BIT, 0x55, 0x01}, //crop window height
> -       {GC0310_8BIT, 0x56, 0xf0},
> -       {GC0310_8BIT, 0x57, 0x02}, //crop window width
> -       {GC0310_8BIT, 0x58, 0x90},
> -
> -       {GC0310_8BIT, 0xfe, 0x03},
> -       {GC0310_8BIT, 0x12, 0x90},//00 //04 //00 //04//00 //LWC[7:0]  //
> -       {GC0310_8BIT, 0x13, 0x02},//05 //05 //LWC[15:8]
> -
> -       {GC0310_8BIT, 0xfe, 0x00},
> +       { 0xfe, 0x00 },
> +       { 0x0d, 0x01 }, /* height */
> +       { 0x0e, 0xf2 }, /* 0xf7 //height */
> +       { 0x0f, 0x02 }, /* width */
> +       { 0x10, 0x94 }, /* 0xa0 //height */
> +
> +       { 0x50, 0x01 }, /* crop enable */
> +       { 0x51, 0x00 },
> +       { 0x52, 0x00 },
> +       { 0x53, 0x00 },
> +       { 0x54, 0x01 },
> +       { 0x55, 0x01 }, /* crop window height */
> +       { 0x56, 0xf0 },
> +       { 0x57, 0x02 }, /* crop window width */
> +       { 0x58, 0x90 },
> +
> +       { 0xfe, 0x03 },
> +       { 0x12, 0x90 }, /* 00 //04 //00 //04//00 //LWC[7:0]  */
> +       { 0x13, 0x02 }, /* 05 //05 //LWC[15:8] */
> +
> +       { 0xfe, 0x00 },
>  };
>
>  static struct gc0310_resolution gc0310_res_preview[] =3D {
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
