Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E71635950
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237246AbiKWKKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbiKWKI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:08:57 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4382D2611F
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:58:49 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id i85so1524708ioa.5
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6BbGk1iO/PrD9UwYD0KjYzX+CquLsoIlur2/FvmcjiM=;
        b=AfGHbRgbBN88YdfCCwrMQrSxdO6gAn/sJdqGFS8XgcVMm5nFUx4tWafIuneXIbr08h
         Ek6EnXsx3JJTEZyhE8+uO0g8Z4lRPxMudis6QGvSqKErgmovOZG/yoinIysZTbWldpJd
         0OY1uM7tQSHGGrs4CuSX2pJjIojEq9xncPc+8CGOZvb9wcLedEloa5eXeMgfLS6vz7fQ
         5Bg4ZlsCl0Ewob9ry8jvGxYMOhJgT61gJsPWWfk6aDnGcaluErZM677GuD7RptBlC2hb
         We/1uTYDY8bl9rkSVaiK4uWjbclak4wm3B4gWpXEDLb4qlYMOpraon7vjw9upWQJRFft
         CBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BbGk1iO/PrD9UwYD0KjYzX+CquLsoIlur2/FvmcjiM=;
        b=fuvjcsbDnR8H3++LxL9PnMzPXAg6gTZ7akwjoft54jVLjIKMHi2km7EGFHaaHw1pMR
         3GzitfL2Lz3+kYgHLiri+fkVq7797EGLwhiI6hNYaQd8sLz7jCbLIJ49wd1FOYeow6Nv
         YA4OMnMoxeWRFmxMBeHnkN5g1LfKvDVJZsRHb7cXi5isk4V5hHPvVhCOCvIQdZzE93mZ
         Wjholggg/Wgw/7G4QZf3rM7qpdRLDPC8A/oKfLetjkY3MpoW8yLZB+9TQsPg3z6Zecuz
         +vgiRZgIImYVdV25xD/o45ovwechAh0mMuik762rL7tzqyNdXdi7hVa1AQhmKLeO483t
         MUGA==
X-Gm-Message-State: ANoB5pkxfLwDuFenDp82g/A9xAboEtaQRl4mzGbdPnmSo3JBTlQdr6eg
        TsR0ofP7Mei4t7+/Mj9ip36PrI7sFxG875IKhToNJhtXXIs=
X-Google-Smtp-Source: AA0mqf69Ufo/XZclUjnCwqGHLGDAMdcG6uhd6jRvzK3Iu3JXaKQ//OCsghTXQK+bki6j8sHp7Su2pwopKNh9JShogs4=
X-Received: by 2002:a05:6638:252:b0:363:46aa:76e9 with SMTP id
 w18-20020a056638025200b0036346aa76e9mr4238522jaq.249.1669197528605; Wed, 23
 Nov 2022 01:58:48 -0800 (PST)
MIME-Version: 1.0
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-7-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20221122223250.21233-7-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 23 Nov 2022 09:58:31 +0000
Message-ID: <CAPY8ntD4Zo7kCmYDqS8XqH_8jp4fbkNYg5m0oqBzK_maYXoO1g@mail.gmail.com>
Subject: Re: [PATCH v1 06/15] media: i2c: imx290: Compute pixel rate and
 blanking in one place
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The hblank, vblank, pixel rate and link frequency values and limits are
> currently computed when creating controls, in imx290_ctrl_init(), and
> updated in imx290_ctrl_update(). This duplicates the logic in different
> places. Simplify the code by setting the control values and limits to
> hardcoded values when creating the controls, and call
> imx290_ctrl_update() to then update them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 46 +++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index a676ce93f96e..135ed55592a1 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -547,19 +547,6 @@ static int imx290_write_current_format(struct imx290 *imx290)
>         return 0;
>  }
>
> -static u64 imx290_calc_pixel_rate(struct imx290 *imx290,
> -                                 const struct v4l2_mbus_framefmt *format,
> -                                 const struct imx290_mode *mode)
> -{
> -       s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
> -       u64 pixel_rate;
> -
> -       /* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> -       pixel_rate = link_freq * 2 * imx290->nlanes;
> -       do_div(pixel_rate, imx290->bpp);
> -       return pixel_rate;
> -}
> -
>  /* ----------------------------------------------------------------------------
>   * Controls
>   */
> @@ -634,10 +621,15 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  {
>         unsigned int hblank = mode->hmax - mode->width;
>         unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> +       s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
> +       u64 pixel_rate;
> +
> +       /* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> +       pixel_rate = link_freq * 2 * imx290->nlanes;
> +       do_div(pixel_rate, imx290->bpp);
>
>         __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> -       __v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> -                                imx290_calc_pixel_rate(imx290, format, mode));
> +       __v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
>
>         __v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
>         __v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> @@ -646,8 +638,6 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  static int imx290_ctrl_init(struct imx290 *imx290)
>  {
>         struct v4l2_fwnode_device_properties props;
> -       unsigned int blank;
> -       u64 pixel_rate;
>         int ret;
>
>         ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> @@ -677,6 +667,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>                           V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
>                           IMX290_VMAX_DEFAULT - 2);
>
> +       /*
> +        * Set the link frequency, pixel rate, horizontal blanking and vertical
> +        * blanking it hardcoded values, they will be updated by

s/it/to
otherwise the comment makes no sense.

  Dave

> +        * imx290_ctrl_update().
> +        */
>         imx290->link_freq =
>                 v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
>                                        V4L2_CID_LINK_FREQ,
> @@ -685,28 +680,22 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>         if (imx290->link_freq)
>                 imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> -       pixel_rate = imx290_calc_pixel_rate(imx290, &imx290->current_format,
> -                                           imx290->current_mode);
>         imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>                                                V4L2_CID_PIXEL_RATE,
> -                                              1, INT_MAX, 1, pixel_rate);
> +                                              1, INT_MAX, 1, 1);
>
>         v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
>                                      V4L2_CID_TEST_PATTERN,
>                                      ARRAY_SIZE(imx290_test_pattern_menu) - 1,
>                                      0, 0, imx290_test_pattern_menu);
>
> -       blank = imx290->current_mode->hmax - imx290->current_mode->width;
>         imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -                                          V4L2_CID_HBLANK, blank, blank, 1,
> -                                          blank);
> +                                          V4L2_CID_HBLANK, 1, 1, 1, 1);
>         if (imx290->hblank)
>                 imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> -       blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
>         imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -                                          V4L2_CID_VBLANK, blank, blank, 1,
> -                                          blank);
> +                                          V4L2_CID_VBLANK, 1, 1, 1, 1);
>         if (imx290->vblank)
>                 imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> @@ -721,6 +710,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>                 return ret;
>         }
>
> +       mutex_lock(imx290->ctrls.lock);
> +       imx290_ctrl_update(imx290, &imx290->current_format,
> +                          imx290->current_mode);
> +       mutex_unlock(imx290->ctrls.lock);
> +
>         return 0;
>  }
>
> --
> Regards,
>
> Laurent Pinchart
>
