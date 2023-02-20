Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C53069D2A3
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 19:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbjBTSSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 13:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjBTSSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 13:18:33 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC56CC3F
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 10:18:31 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id x40so100416uaf.2
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 10:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UymYn69lMQOhe7iLTnfYmgqG2LpP5P/nl6iJ11BJBmY=;
        b=Gobu8qzr1qFh0tDHeyjqsDELlbcT0bn9lvT7ADq4m9nP0hlSTp36VRly5e3jEWvwOR
         4EIeyVYXNEr+eYW1ZnUXTEnG2jbjVb2vxgbJUmFR5e5xdW0xitvaJ/g0n6j7RGPw8TlK
         FLFDD8LwNvsGlxsXbix6vbWHrQwd8+xR84KYAiP4FyS2QuvDaww2qKUJHHWbLYOtitph
         /xne3g+KoUzC0LOyZKgdDyzmrGNCS2NWh3v3QfReNk69BSoFaSF5yCL4easJWSK8COpI
         NrLo9CfSI3Tjjkh1EmKGruUKT1SvHtDGY+ePd6iV2kLuZUnwRVZQIsG33cTVjNNOZue4
         XymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UymYn69lMQOhe7iLTnfYmgqG2LpP5P/nl6iJ11BJBmY=;
        b=VBkO1Jwcm4e1CSWJG1N0fP03PUMfPhXB0P63qPJJaGYjilp1yQORBqwCNzzeeVJyPo
         xZ1olMUVsIdIBtt60Y2BekaPDtBrBQ0HTfrj+XLgXVSgbgPWRVL7rqumOKddjMIanfcT
         FxJvrTofvduiIpGEv5kLrEOL4PKW79Wz69QjnXDxcJrgBmYheuF6RkOGBG0OqKjgVHuN
         xtYAaCq5pwPRipKtNV7m5tlgzMINLWazWM5NKhP+TeBr9NkgUFy7KOlOvSDMbQpwseWL
         jicItkCiMdCnKlSCcpc62JQ9fGzWwurBSBl1lOhnRZG0THihdipiM1BXD6KDbPK25xa7
         bYcQ==
X-Gm-Message-State: AO0yUKVHD7IFC4XOF5u7nV+yW+MTBrNSnPr4i9moiGcLfZLzwOi1KDal
        Dz+awL3VRA8mzIeTRzSyQwH0IZ0Cz+IEhCSdKeOle6zx21x6rayW
X-Google-Smtp-Source: AK7set8qD5meqhFHGYZrU0ET1eTQDfmOdX5riQF6Tqt+M0N5vjMsL79axNehWTrQ9nSvtTNd/eS4FYeCfdjkr+SldU4=
X-Received: by 2002:ab0:5658:0:b0:68b:923a:d6f4 with SMTP id
 z24-20020ab05658000000b0068b923ad6f4mr474669uaa.2.1676917110635; Mon, 20 Feb
 2023 10:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com> <20230220124041.1010289-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230220124041.1010289-1-jacopo.mondi@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 20 Feb 2023 18:18:14 +0000
Message-ID: <CAPY8ntAqsL+Z-yM71keTcafxW6WDnzG4hFDq+AWk31jUjr3qGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov5647: Add test pattern control
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
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

Hi Jacopo

On Mon, 20 Feb 2023 at 12:40, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Valentine Barshak <valentine.barshak@cogentembedded.com>
>
> This adds V4L2_CID_TEST_PATTERN control support.
>
> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 847a7bbb69c5..0b88ac6dee41 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -58,6 +58,7 @@
>  #define OV5647_REG_MIPI_CTRL00         0x4800
>  #define OV5647_REG_MIPI_CTRL14         0x4814
>  #define OV5647_REG_AWB                 0x5001
> +#define OV5647_REG_ISPCTRL3D           0x503d
>
>  #define REG_TERM 0xfffe
>  #define VAL_TERM 0xfe
> @@ -116,6 +117,22 @@ static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
>         return container_of(sd, struct ov5647, sd);
>  }
>
> +static const char * const ov5647_test_pattern_menu[] = {
> +       "Disabled",
> +       "Color Bars",
> +       "Color Squares",
> +       "Random Data",
> +       "Input Data"

"Input Data" appears to give me just a black image. Have I missed
something? What's it meant to be the input to?
Is it worth adding 0x92 for a black and white checkboard as well?

Whichever way:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Just as a note, the test patterns appear to be valid only if 0x3820
bit 1 = 0 and 0x3821 bit 1 = 1 (V & H flips respectively).
The sensor appears to be assuming one particular colour pattern (BGGR)
when producing a test pattern, so flips altering the format give some
very weird effects. I do have patches that add the V4L2 flip controls,
so those expose some interesting effects :-/

  Dave

> +};
> +
> +static u8 ov5647_test_pattern_val[] = {
> +       0x00,   /* Disabled */
> +       0x80,   /* Color Bars */
> +       0x82,   /* Color Squares */
> +       0x81,   /* Random Data */
> +       0x83,   /* Input Data */
> +};
> +
>  static const struct regval_list sensor_oe_disable_regs[] = {
>         {0x3000, 0x00},
>         {0x3001, 0x00},
> @@ -1242,6 +1259,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
>                                      sensor->mode->format.height + ctrl->val);
>                 break;
> +       case V4L2_CID_TEST_PATTERN:
> +               ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
> +                                  ov5647_test_pattern_val[ctrl->val]);
> +               break;
>
>         /* Read-only, but we adjust it based on mode. */
>         case V4L2_CID_PIXEL_RATE:
> @@ -1270,7 +1291,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>         struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>         int hblank, exposure_max, exposure_def;
>
> -       v4l2_ctrl_handler_init(&sensor->ctrls, 8);
> +       v4l2_ctrl_handler_init(&sensor->ctrls, 9);
>
>         v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>                           V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1314,6 +1335,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>                                            sensor->mode->vts -
>                                            sensor->mode->format.height);
>
> +       v4l2_ctrl_new_std_menu_items(&sensor->ctrls, &ov5647_ctrl_ops,
> +                                    V4L2_CID_TEST_PATTERN,
> +                                    ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
> +                                    0, 0, ov5647_test_pattern_menu);
> +
>         if (sensor->ctrls.error)
>                 goto handler_free;
>
> --
> 2.39.0
>
