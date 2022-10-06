Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10CA55F6ADC
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 17:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiJFPlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 11:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiJFPll (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 11:41:41 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2634813D70
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 08:41:40 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z3so2423123edc.10
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D7q8b3nDZkIm9ICNHjTFZQ3cTkfw8Bp2ilshhXg47c0=;
        b=kDv1/wrK61iJXB3/HbWIyz9wi9oIY7CXBAwDghVlbWmI00Z8WmiiqqiCqHJvSVXzVX
         NwZ65uayNdyqR+neaXUVGLCo4syFWM/mAZMxETjjxzLjF+FmFm9j+D/njgwYllA1x7/W
         SB+Z0fUUns2i8TGO8eQSTdIy6WSB+lnokC2iCTX48kMkwM3lL8mwNwWi5DV5SYxz+uI/
         4DctL3TBIkQfq6H/9+gJpW3hmduhbONpNqGueNy27NF8m8a7ZB8d3hex6FeDgwWYvYMJ
         /VXU9Oktlo93Q7tgnndSheiNkObQZTAC/PRtciGCZiLDlPmAtarKCOoCaFdxRlx/EAWc
         b+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7q8b3nDZkIm9ICNHjTFZQ3cTkfw8Bp2ilshhXg47c0=;
        b=GFPVQhxVFi4VHy5Zit2cOJxSlR1PajDIliFYz5hYQCNF0m7WV1lMUr6SmXN97RKoU6
         ss/Pft4mgA5kqWvNc+hsi9ps797ZCuGd/Yk8uwGF1zVfSBiiR/903YIK8sROERddOgUu
         bmJbiBv6GvgR/l+whAjPm4TzxajIe4vAOhSBg+/k2OA6DJ4PsdHRfYsw7bHR8Fl3BlnS
         C07Zzl6jZYCN92IstkDySo7nXcT72Fl3OH43AoC0vkK3T6rqKr+QcdQnPbwt5zDwowUm
         ZF/EXrSRoDwKLmkK9hjKEHXITpMLIIM6C+e2V0tyCXC+cVwfpmJuieGtrwRm5NR4YwrD
         +vKA==
X-Gm-Message-State: ACrzQf2NPXl2UblCFodixPz0Csc1+tnHFbk2lEphQ2R0FOHhxmZcD5hH
        m4KasmArze0Vnln8WzK72+UFCLwxkb2+pgAGtFzH0w==
X-Google-Smtp-Source: AMsMyM7y80y1PdmczJKoxcCgiblJ0E7su66FFjI3Tj9KYw4fNTOXSVc5EkkSS9yDgZL7L2dGrwRqJjICrvYdFnSCGos=
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id
 fi14-20020a056402550e00b00456f79f2bedmr401176edb.106.1665070898634; Thu, 06
 Oct 2022 08:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-8-jacopo@jmondi.org>
In-Reply-To: <20221005190613.394277-8-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 16:41:11 +0100
Message-ID: <CAPY8ntCk0eqK33AyurewMvgyUQ=G4p4Rbr-HRFMKWg30ZpZd5g@mail.gmail.com>
Subject: Re: [PATCH 07/10] media: ar0521: Adjust exposure and blankings limits
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

Hi Jacopo

On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Adjust the control limits for V4L2_CID_VBLANK, V4L2_CID_HBLANK and
> V4L2_CID_EXPOSURE when a new format is applied to the sensor.
>
> Also update the exposure control when a new blanking value is applied.
>
> Also change the controls initialization to use valid values for the
> default format.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ar0521.c | 77 ++++++++++++++++++++++++++++----------
>  1 file changed, 57 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index b1580c99f5e3..26bb1b8f7453 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -42,7 +42,8 @@
>
>  #define AR0521_WIDTH_BLANKING_MIN     572u
>  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> -#define AR0521_TOTAL_WIDTH_MIN      2968u
> +#define AR0521_TOTAL_HEIGHT_MAX      2464u /* max value of y_addr_end reg */
> +#define AR0521_TOTAL_WIDTH_MAX       3280u /* max value of x_addr_end reg */
>
>  #define AR0521_ANA_GAIN_MIN            0x00
>  #define AR0521_ANA_GAIN_MAX            0x3f
> @@ -131,8 +132,6 @@ struct ar0521_dev {
>         struct v4l2_mbus_framefmt fmt;
>         struct ar0521_ctrls ctrls;
>         unsigned int lane_count;
> -       u16 total_width;
> -       u16 total_height;
>         struct {
>                 u16 pre;
>                 u16 mult;
> @@ -544,7 +543,8 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
>                           struct v4l2_subdev_format *format)
>  {
>         struct ar0521_dev *sensor = to_ar0521_dev(sd);
> -       int ret = 0;
> +       int exposure_max, exposure_val;
> +       int max_vblank, max_hblank;
>
>         ar0521_adj_fmt(&format->format);
>
> @@ -555,13 +555,44 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
>
>                 fmt = v4l2_subdev_get_try_format(sd, sd_state, 0 /* pad */);
>                 *fmt = format->format;
> -       } else {
> -               sensor->fmt = format->format;
> -               ar0521_calc_mode(sensor);
> +
> +               mutex_unlock(&sensor->lock);
> +
> +               return 0;
>         }
>
> +       sensor->fmt = format->format;
> +       ar0521_calc_mode(sensor);
> +
> +       /*
> +        * Update the exposure and blankings limits. Blankings are also reset
> +        * to the minimum.
> +        */
> +       max_hblank = AR0521_TOTAL_WIDTH_MAX - sensor->fmt.width;
> +       __v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> +                                sensor->ctrls.hblank->minimum,
> +                                max_hblank, sensor->ctrls.hblank->step,
> +                                sensor->ctrls.hblank->minimum);
> +       __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, sensor->ctrls.hblank->minimum);
> +
> +       max_vblank = AR0521_TOTAL_HEIGHT_MAX - sensor->fmt.height;
> +       __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> +                                sensor->ctrls.vblank->minimum,
> +                                max_vblank, sensor->ctrls.vblank->step,
> +                                sensor->ctrls.vblank->minimum);
> +       __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, sensor->ctrls.vblank->minimum);
> +
> +       exposure_max = sensor->fmt.height + AR0521_HEIGHT_BLANKING_MIN - 4;
> +       exposure_val = min(sensor->ctrls.exposure->val, exposure_max);
> +       __v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +                                sensor->ctrls.exposure->minimum,
> +                                exposure_max, sensor->ctrls.exposure->step,
> +                                exposure_val);
> +       __v4l2_ctrl_s_ctrl(sensor->ctrls.exposure, exposure_val);

Is it correct to set the value of VBLANK, HBLANK, and EXPOSURE when
changing mode? The control handler framework will handle resetting the
value if it is out of range, but my understanding is that otherwise
they should be left alone.

This is the one I've just hit with OV9282 and trying to test a
configurable HBLANK when libcamera didn't support it. Set HBLANK with
v4l2-ctl --set-ctrl, then run a libcamera app and it gets reset
because libcamera chose a mode.

> +
>         mutex_unlock(&sensor->lock);
> -       return ret;
> +
> +       return 0;
>  }
>
>  static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -573,15 +604,13 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
>         /* v4l2_ctrl_lock() locks our own mutex */
>
>         switch (ctrl->id) {
> -       case V4L2_CID_HBLANK:
>         case V4L2_CID_VBLANK:
> -               sensor->total_width = sensor->fmt.width +
> -                       sensor->ctrls.hblank->val;
> -               sensor->total_height = sensor->fmt.width +
> -                       sensor->ctrls.vblank->val;
> -               break;
> -       default:
> -               ret = -EINVAL;
> +               int exp_max = sensor->fmt.height + ctrl->val - 4;
> +               int exp_val = min(sensor->ctrls.exposure->val, exp_max);
> +               __v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +                                        sensor->ctrls.exposure->minimum,
> +                                        exp_max, sensor->ctrls.exposure->step,
> +                                        exp_val);
>                 break;
>         }
>
> @@ -633,6 +662,7 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
>         const struct v4l2_ctrl_ops *ops = &ar0521_ctrl_ops;
>         struct ar0521_ctrls *ctrls = &sensor->ctrls;
>         struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> +       int max_vblank, max_hblank, exposure_max;
>         int ret;
>
>         v4l2_ctrl_handler_init(hdl, 32);
> @@ -655,11 +685,17 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
>                                                 -512, 511, 1, 0);
>         v4l2_ctrl_cluster(3, &ctrls->gain);
>
> +       /* Initialize blanking limits using the default 2592x1944 format. */
> +       max_hblank = AR0521_TOTAL_WIDTH_MAX - AR0521_WIDTH_MAX;
>         ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> -                                         AR0521_WIDTH_BLANKING_MIN, 4094, 1,
> +                                         AR0521_WIDTH_BLANKING_MIN,
> +                                         max_hblank, 1,
>                                           AR0521_WIDTH_BLANKING_MIN);
> +
> +       max_vblank = AR0521_TOTAL_HEIGHT_MAX - AR0521_HEIGHT_MAX;

This looks lower than it should be.
AR0521_TOTAL_HEIGHT_MAX = 2464 ("max value of y_addr_end reg")
AR0521_HEIGHT_MAX = 1958
Max is therefore 506.

Except that the frame height + blanking is written to
FRAME_LENGTH_LINES (0x0340), and not y_addr_end (0x034a).
The maximum value permitted for FRAME_LENGTH_LINES is 65535, so
vblank_max = 65535 - 1958 = 63577.

>         ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> -                                         AR0521_HEIGHT_BLANKING_MIN, 4094, 2,
> +                                         AR0521_HEIGHT_BLANKING_MIN,
> +                                         max_vblank, 2,

Curious that the total height with blanking has to be a multiple of 2.

>                                           AR0521_HEIGHT_BLANKING_MIN);
>         v4l2_ctrl_cluster(2, &ctrls->hblank);
>
> @@ -669,9 +705,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
>                                            AR0521_PIXEL_CLOCK_MAX, 1,
>                                            AR0521_PIXEL_CLOCK_RATE);
>
> -       /* Manual exposure time */
> +       /* Manual exposure time: max exposure time = visible + blank - 4 */
> +       exposure_max = AR0521_HEIGHT_MAX + AR0521_HEIGHT_BLANKING_MIN - 4;
>         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
> -                                           65535, 1, 360);
> +                                           exposure_max, 1, 360);
>
>         ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
>                                         ARRAY_SIZE(ar0521_link_frequencies) - 1,
> --
> 2.37.3
>
