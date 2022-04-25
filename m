Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6C850E79D
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 19:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244152AbiDYSA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 14:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236650AbiDYSAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 14:00:55 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044822458D
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 10:57:50 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dk23so7817547ejb.8
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JCjlGnHKHnW4/pOpYFE/CsWBIrhVJah2oiJj+BaNdHg=;
        b=dFXfWRg6bSMS2j0moQajQU7MLOwMjf5HWQ6eZH85Mhj9vF9Wf2tjR7dCVzgf9K2QIV
         tUc/kgXe68f6/BbIrs1CNG6dhsX8z2vZA9qHVOPlm7VrzBakDi7lUHAys/CbQZa3ifw3
         fr97Tq+Uy6dfTE/BxJ5kcFOglFj4P/OyN6CNVQWL6NrWCJzPUg6CAod5fEpuk4CLNJZ3
         ZtRQ47/ZG61HqB2AGzD57PgaYnC1Lv1jPQ/xfhpDyiSlGgnlEneBj1ohUw6F/5QsCmko
         b5aggsvFb+9PklBoZCm1pr0zO7xkxqFwI8qRvemzd8m3vpxnkfREWq3C8seXMWUWPo74
         AUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCjlGnHKHnW4/pOpYFE/CsWBIrhVJah2oiJj+BaNdHg=;
        b=Cy26qmbgu7Pkz9LXeHAYqCwlErKiYLOUV+1g/nb7YwN8gM//ZvAlUQmzUNEvtIKIWW
         mM9KHoVbIcBFWEscGpeNR4jj7jDU0uxGbKbdPw48OX75ZCYPO8KxyZwWVBYmaXvvBF+T
         xc9oiBIxTNPIAGF1dUKf5iiAEP0ubWB7fyrVx0f8HamkNmzNaHFD+ENha1Ure3wi1pBe
         SPWpCGZjnRRp4stKSob7j8QXuSVZ5rxuHdCTge0M33MFD7qMK1FEQW0tD8UyJBuUvtUE
         viYmhzRuDrmjJzoRgO5M5Qa5MIAXLABgVkUgwMR9BbrfpaKS2a0+CVaISQtuQfYMZaLP
         Klbg==
X-Gm-Message-State: AOAM530IC+pniUOzuCeF/Q07WdyZGX6xTfBWNsyKMUNGC95vCYjGcies
        cVk/5IbdNGwFEAx1dTdNpY0DheDry3NlF7ccs9lo2Q==
X-Google-Smtp-Source: ABdhPJzbeQ3iBIqhmoSVw5GjDOSjZgyGxoCc7b4IGgbcRK95kZQjLFojI7tp18pOWjX2H1DgPmukIpXCkda5KXSgGZo=
X-Received: by 2002:a17:907:60cc:b0:6e0:dab3:ca76 with SMTP id
 hv12-20020a17090760cc00b006e0dab3ca76mr17780769ejc.154.1650909468541; Mon, 25
 Apr 2022 10:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220412135534.2796158-1-aford173@gmail.com> <20220412135534.2796158-4-aford173@gmail.com>
 <CAPY8ntCfL=ZPwPr_1N-m_J1FTq+V77-3fggY-joZCyyu-k_qvQ@mail.gmail.com>
 <CAPY8ntCuTt65-ELTV8_n+-7=n306p5+HmF3HcMd-8arCTVLezQ@mail.gmail.com> <CAHCN7xLThYzFFsS1pgHztOTjKAvP8ka+pPAya4wf4aSfvCWWGg@mail.gmail.com>
In-Reply-To: <CAHCN7xLThYzFFsS1pgHztOTjKAvP8ka+pPAya4wf4aSfvCWWGg@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 25 Apr 2022 18:57:32 +0100
Message-ID: <CAPY8ntAwe24LQCNWHbChAAGPo+UUiMXBeUrLU=XnoW00pHXdhQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: i2c: imx219: Enable variable XCLK
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Tim Harvey <tharvey@gateworks.com>,
        cstevens@beaconembedded.com,
        Adam Ford-BE <aford@beaconembedded.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 25 Apr 2022 at 18:28, Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Apr 25, 2022 at 11:13 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi again
> >
> > On Mon, 25 Apr 2022 at 16:58, Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Adam
> > >
> > > I have no way of testing with an alternate XCLK value, so I'm working
> > > based on the datasheet only.
> > >
> > > On Tue, 12 Apr 2022 at 14:55, Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > The datasheet shows the external clock can be anything
> > > > from 6MHz to 27MHz, but EXCK, PREPLLCK_VT_DIV and
> > > > PREPLLCK_OP_DIV need to change based on the clock, so
> > > > create helper functions to set these registers based on
> > > > the rate of xclk.
> > > >
> > > > Move the validation of the clock rate into imx219_check_hwcfg
> > > > which means delaying the call to it until after xclk has been
> > > > determined.
> > > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 79 ++++++++++++++++++++++++++++++--------
> > > >  1 file changed, 63 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index d13ce5c1ece6..08e7d0e72430 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -39,8 +39,12 @@
> > > >  #define IMX219_REG_CHIP_ID             0x0000
> > > >  #define IMX219_CHIP_ID                 0x0219
> > > >
> > > > -/* External clock frequency is 24.0M */
> > > > -#define IMX219_XCLK_FREQ               24000000
> > > > +/* Default external clock frequency is 24.0M */
> > > > +#define IMX219_XCLK_MIN_FREQ           6000000
> > > > +#define IMX219_XCLK_MAX_FREQ           27000000
> > > > +#define IMX219_REG_EXCK                        0x012a
> > > > +#define IMX219_REG_PREPLLCK_VT_DIV     0x0304
> > > > +#define IMX219_REG_PREPLLCK_OP_DIV     0x0305
> > > >
> > > >  /* Pixel rate is fixed for all the modes */
> > > >  #define IMX219_PIXEL_RATE              182400000
> > > > @@ -166,8 +170,6 @@ static const struct imx219_reg pll_clk_table[] = {
> > > >
> > > >         {0x0301, 0x05}, /* VTPXCK_DIV */
> > > >         {0x0303, 0x01}, /* VTSYSCK_DIV */
> > > > -       {0x0304, 0x03}, /* PREPLLCK_VT_DIV 0x03 = AUTO set */
> > > > -       {0x0305, 0x03}, /* PREPLLCK_OP_DIV 0x03 = AUTO set */
> > > >         {0x0306, 0x00}, /* PLL_VT_MPY */
> > > >         {0x0307, 0x39},
> > > >         {0x030b, 0x01}, /* OP_SYS_CLK_DIV */
> > > > @@ -182,7 +184,6 @@ static const struct imx219_reg pll_clk_table[] = {
> > > >   */
> > > >  static const struct imx219_reg mode_3280x2464_regs[] = {
> > > >         {0x0128, 0x00},
> > > > -       {0x012a, 0x18},
> > > >         {0x012b, 0x00},
> > > >         {0x0164, 0x00},
> > > >         {0x0165, 0x00},
> > > > @@ -222,7 +223,6 @@ static const struct imx219_reg mode_3280x2464_regs[] = {
> > > >
> > > >  static const struct imx219_reg mode_1920_1080_regs[] = {
> > > >         {0x0128, 0x00},
> > > > -       {0x012a, 0x18},
> > > >         {0x012b, 0x00},
> > > >         {0x0162, 0x0d},
> > > >         {0x0163, 0x78},
> > > > @@ -262,7 +262,6 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
> > > >
> > > >  static const struct imx219_reg mode_1640_1232_regs[] = {
> > > >         {0x0128, 0x00},
> > > > -       {0x012a, 0x18},
> > > >         {0x012b, 0x00},
> > > >         {0x0164, 0x00},
> > > >         {0x0165, 0x00},
> > > > @@ -302,7 +301,6 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
> > > >
> > > >  static const struct imx219_reg mode_640_480_regs[] = {
> > > >         {0x0128, 0x00},
> > > > -       {0x012a, 0x18},
> > > >         {0x012b, 0x00},
> > > >         {0x0162, 0x0d},
> > > >         {0x0163, 0x78},
> > > > @@ -1015,6 +1013,50 @@ static int imx219_configure_lanes(struct imx219 *imx219)
> > > >         return ret;
> > > >  };
> > > >
> > > > +static int imx219_set_exck_freq(struct imx219 *imx219)
> > > > +{
> > > > +       int ret;
> > > > +       /* The imx219 registers need MHz not Hz */
> > > > +       u8 clk = (u8) (imx219->xclk_freq/1000000U);
> > > > +
> > > > +       /* Set the clock frequency in MHz */
> > > > +       ret = imx219_write_reg(imx219, IMX219_REG_EXCK,
> > > > +                              IMX219_REG_VALUE_08BIT, clk);
> >
> > In reviewing your other patch I noticed that the EXCK register is
> > actually a 16 bit value. The integer part is in 0x012a, and the
> > fractional part (1/256) in 0x012b, which is currently initialised from
> > the mode tables.
> > Your division discards the fractional part totally, so if the
> > configured frequency was 19.2MHz, then it would be programmed
> > incorrectly.
> >
> > The value for register 0x012b needs to be computed and set here.
>
> That makes sense.
> I am understanding your comment about register 0x12b, would the
> example frequency of 19.2MHz translate to 51 for register 12b?

Yes, AIUI 19.2MHz would be 0x13 0x33 (decimal 19 and 51 / 256).
The datasheet lists the default as being a 7.6MHz clock with register
values 0x07 0x99 (7 and 153/256, or 7.5976MHz)

> Part of me thinks I should drop this patch because I have no real way
> to test it, and I don't like writing 'theoretical' code.

I have some reservations over it for the same reasons.
If you haven't got an actual use case for it, then drop it for now.

  Dave

> adam
> >
> > > > +
> > > > +       /* Configure the PREPLLCK_VT_DIV and PREPLLCK_OP_DIV for automatic */
> > > > +       switch (clk) {
> > > > +       case 6 ... 11:
> > > > +               ret = imx219_write_reg(imx219, IMX219_REG_PREPLLCK_VT_DIV,
> > > > +                              IMX219_REG_VALUE_08BIT, 0x01);
> > > > +               if (ret)
> > > > +                       return ret;
> > > > +               ret = imx219_write_reg(imx219, IMX219_REG_PREPLLCK_OP_DIV,
> > > > +                              IMX219_REG_VALUE_08BIT, 0x01);
> > > > +               return ret;
> > > > +       case 12 ... 23:
> > > > +               ret = imx219_write_reg(imx219, IMX219_REG_PREPLLCK_VT_DIV,
> > > > +                              IMX219_REG_VALUE_08BIT, 0x02);
> > > > +               if (ret)
> > > > +                       return ret;
> > > > +
> > > > +               ret = imx219_write_reg(imx219, IMX219_REG_PREPLLCK_OP_DIV,
> > > > +                              IMX219_REG_VALUE_08BIT, 0x02);
> > > > +
> > > > +               return ret;
> > > > +       case 24 ... 27:
> > > > +               ret = imx219_write_reg(imx219, IMX219_REG_PREPLLCK_VT_DIV,
> > > > +                              IMX219_REG_VALUE_08BIT, 0x03);
> > > > +               if (ret)
> > > > +                       return ret;
> > > > +               ret = imx219_write_reg(imx219, IMX219_REG_PREPLLCK_OP_DIV,
> > > > +                              IMX219_REG_VALUE_08BIT, 0x03);
> > > > +               return ret;
> > > > +       default:
> > > > +               /* Should never get here */
> > > > +               return -EINVAL;
> > > > +       }
> > > > +}
> > > > +
> > > >  static int imx219_start_streaming(struct imx219 *imx219)
> > > >  {
> > > >         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > > > @@ -1039,6 +1081,9 @@ static int imx219_start_streaming(struct imx219 *imx219)
> > > >                 goto err_rpm_put;
> > > >         }
> > > >
> > > > +       /* Configure clock based on reference clock frequency */
> > > > +       imx219_set_exck_freq(imx219);
> > >
> > > You're not checking the return value from this function, so any I2C
> > > failures will be ignored.
> > >
> > > > +
> > > >         /* Apply default values of current mode */
> > > >         reg_list = &imx219->mode->reg_list;
> > > >         ret = imx219_write_regs(imx219, reg_list->regs, reg_list->num_of_regs);
> > > > @@ -1428,6 +1473,13 @@ static int imx219_check_hwcfg(struct imx219 *imx219)
> > > >                 return -EINVAL;
> > > >         }
> > > >
> > > > +       if ((imx219->xclk_freq < IMX219_XCLK_MIN_FREQ) ||
> > > > +            imx219->xclk_freq > IMX219_XCLK_MAX_FREQ) {
> > > > +               dev_err(&client->dev, "xclk frequency not supported: %d Hz\n",
> > >
> > > imx219->xclk_freq is unsigned, so %u
> > >
> > > > +                       imx219->xclk_freq);
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > >         return 0;
> > > >  }
> > > >
> > > > @@ -1478,10 +1530,6 @@ static int imx219_probe(struct i2c_client *client)
> > > >         if (ret)
> > > >                 return ret;
> > > >
> > > > -       /* Check the hardware configuration in device tree */
> > > > -       if (imx219_check_hwcfg(imx219))
> > > > -               return -EINVAL;
> > > > -
> > > >         /* Get system clock (xclk) */
> > > >         imx219->xclk = devm_clk_get(dev, NULL);
> > > >         if (IS_ERR(imx219->xclk)) {
> > > > @@ -1490,11 +1538,10 @@ static int imx219_probe(struct i2c_client *client)
> > > >         }
> > > >
> > > >         imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > >
> > > My bug admittedly, but clk_get_rate returns an unsigned long, but
> > > imx219->xclk_freq is u32.
> > > Ideally imx219->xclk_freq should be unsigned long to match, and the
> > > dev_err I commented on earlier should be %lu.
> > >
> > > Cheers.
> > >   Dave
> > >
> > > > -       if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> > > > -               dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > > > -                       imx219->xclk_freq);
> > > > +
> > > > +       /* Check the hardware configuration in device tree */
> > > > +       if (imx219_check_hwcfg(imx219))
> > > >                 return -EINVAL;
> > > > -       }
> > > >
> > > >         ret = imx219_get_regulators(imx219);
> > > >         if (ret) {
> > > > --
> > > > 2.34.1
> > > >
