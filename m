Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60635F6AF1
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 17:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbiJFPqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 11:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbiJFPp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 11:45:56 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6497BC14B9
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 08:45:49 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a2so5416359ejx.10
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fmWg90VyNJ0/WDlZumIDyKrOe0jhHs2hmJfpjx1jR38=;
        b=H8f1+SBkGxdpMWTwjZsXRZYOunOI2iUf8jpryBUWA8LEavjxuisM68BsevJdO0pGSQ
         d5rAC0wKuxbd7n0yP7uZgiMFy2amMmAiX/FQiIhSClM0BYrvZtn8dPKASWTeCPKV40DH
         wqEtzwZydjfX3zyqCRn9VlqdZfR4WS7hHk/f4Y1PbI/h/cIULoHu8ixrRzlpmWE4uIU2
         8Xkfn00TvCNu3uJAZ9WQSfkM+lOaxANKP0PCtkFuEvN8vRT1ss5z1rmbkUHpQIb6AfCA
         5lj5X9ve7DRaNHVvruHMdrl9wkU5gko59LIAS9yQz5T9TK1ObdL3kf7pOWo4GTjj5Jx5
         bgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmWg90VyNJ0/WDlZumIDyKrOe0jhHs2hmJfpjx1jR38=;
        b=kcV0F4T3ZKtJS2TcOmD4LbsCNOdf5yzKw+cQ2IeOVorESy1bWd6GfDBeROVYyCzcnM
         ccbYzd7E2EDWGvZRHBWPJEMLh+6c6KI82eSeezU4t5sPM3pqfB9KdaOoSfcHF0g5aD4H
         8EFY/qyMswa+7gietq326PAxIzGUEnDNoDKIcJI0PIN60l4Gro96OSphtc5PbrxdlTJ4
         AgJk/PXqonXiKGL3L8rdkYoiu8+0fK9dmkyGX2ogWanLBCr9IUQUpPsWg3Io9HFwIhv6
         ukeWSNKbPDTNRGUxS86pCR3D+xipr9FVZVwxoyeog185VuNOdFBDVOjTWAKcNffaPJhh
         s5jQ==
X-Gm-Message-State: ACrzQf0KDlNOMNc/b0j+37zDydVElJ5y7DlI+v1nMmFM6gJbAm9iSw20
        WUKSOez9NGnpM6wfBEtzOE7CEHMPu3pynKp0hWlmma6IR8U=
X-Google-Smtp-Source: AMsMyM5+TkNRmPGoHB2b6P0Gu7AOHe8gTTuTZENRMJx0U7utOlD13e+wkHKtMTWJelK+MB75TLVFZxZDeMhtP+/wBDs=
X-Received: by 2002:a17:907:8b0f:b0:783:6169:5bc5 with SMTP id
 sz15-20020a1709078b0f00b0078361695bc5mr435698ejc.200.1665071147193; Thu, 06
 Oct 2022 08:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-10-jacopo@jmondi.org>
In-Reply-To: <20221005190613.394277-10-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 16:45:30 +0100
Message-ID: <CAPY8ntCOR7CnhL7JXpA-MNij8o9uK856bbf2_eC0-mj+B-3dkA@mail.gmail.com>
Subject: Re: [PATCH 09/10] media: ar0521: Rework startup sequence
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> The ar0521_write_mode() function explicitly programs the exposure time
> register and the test pattern register, which are now setup by the call
> to __v4l2_ctrl_handler_setup() in ar0521_set_stream().
>
> Removing those register writes from ar0521_write_mode() reduces the
> function to two operations: geometry configuration and pll
> configuration.
>
> Move those operations in the ar0521_set_stream() caller and remove
> ar0521_write_mode(). However maintain the ar0521_calc_pll() function
> separated as it is used during pad format configuration to update the
> PIXEL_RATE control value.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Looks good.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ar0521.c | 50 ++++++++++++--------------------------
>  1 file changed, 16 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index d46a51332964..670fa33acc6f 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -329,7 +329,7 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult
>         return pll;
>  }
>
> -static void ar0521_calc_mode(struct ar0521_dev *sensor)
> +static void ar0521_calc_pll(struct ar0521_dev *sensor)
>  {
>         unsigned int pixel_clock;
>         unsigned int link_freq;
> @@ -403,7 +403,7 @@ static void ar0521_calc_mode(struct ar0521_dev *sensor)
>         sensor->pll.mult = sensor->pll.mult2 = mult;
>  }
>
> -static int ar0521_write_mode(struct ar0521_dev *sensor)
> +static int ar0521_pll_config(struct ar0521_dev *sensor)
>  {
>         __be16 pll_regs[] = {
>                 be(AR0521_REG_VT_PIX_CLK_DIV),
> @@ -414,36 +414,9 @@ static int ar0521_write_mode(struct ar0521_dev *sensor)
>                 /* 0x308 */ be(sensor->pll.vt_pix * 2), /* op_pix_clk_div = 2 * vt_pix_clk_div */
>                 /* 0x30A */ be(1)  /* op_sys_clk_div */
>         };
> -       int ret;
> -
> -       /* Stop streaming for just a moment */
> -       ret = ar0521_write_reg(sensor, AR0521_REG_RESET,
> -                              AR0521_REG_RESET_DEFAULTS);
> -       if (ret)
> -               return ret;
> -
> -       ret = ar0521_set_geometry(sensor);
> -       if (ret)
> -               return ret;
> -
> -       ret = ar0521_write_regs(sensor, pll_regs, ARRAY_SIZE(pll_regs));
> -       if (ret)
> -               return ret;
> -
> -       ret = ar0521_write_reg(sensor, AR0521_REG_COARSE_INTEGRATION_TIME,
> -                              sensor->ctrls.exposure->val);
> -       if (ret)
> -               return ret;
> -
> -       ret = ar0521_write_reg(sensor, AR0521_REG_RESET,
> -                              AR0521_REG_RESET_DEFAULTS |
> -                              AR0521_REG_RESET_STREAM);
> -       if (ret)
> -               return ret;
>
> -       ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE,
> -                              sensor->ctrls.test_pattern->val);
> -       return ret;
> +       ar0521_calc_pll(sensor);
> +       return ar0521_write_regs(sensor, pll_regs, ARRAY_SIZE(pll_regs));
>  }
>
>  static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
> @@ -455,8 +428,17 @@ static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
>                 if (ret < 0)
>                         return ret;
>
> -               ar0521_calc_mode(sensor);
> -               ret = ar0521_write_mode(sensor);
> +               /* Stop streaming for just a moment */
> +               ret = ar0521_write_reg(sensor, AR0521_REG_RESET,
> +                                      AR0521_REG_RESET_DEFAULTS);
> +               if (ret)
> +                       return ret;
> +
> +               ret = ar0521_set_geometry(sensor);
> +               if (ret)
> +                       return ret;
> +
> +               ret = ar0521_pll_config(sensor);
>                 if (ret)
>                         goto err;
>
> @@ -562,7 +544,7 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
>         }
>
>         sensor->fmt = format->format;
> -       ar0521_calc_mode(sensor);
> +       ar0521_calc_pll(sensor);
>
>         /*
>          * Update the exposure and blankings limits. Blankings are also reset
> --
> 2.37.3
>
