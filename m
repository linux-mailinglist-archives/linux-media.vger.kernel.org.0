Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE7E5F69BC
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 16:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiJFOhp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 10:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbiJFOhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 10:37:43 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15325A8CFD
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 07:37:42 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z97so3110190ede.8
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lvUrAGy5LfUdk7RQ9JAQrxj7aTDm46YDkzZc56WPEX8=;
        b=mAkQsqmnvH0aoS5810oSJ3QK8/60QqZ8Vx9/ChlgSbm8oKO/mrYKCqmkgNGqEeyVc3
         b/j9ByQauhPX4ukluczYYOWes0riFKC2JXJaHCBhOAEVeZnU/It4pUAP4rStmTk+wzyp
         ZxGgkuJfCzcu3qhjtOuj6WatPR7ZB7sX6Eb24N5gFhwLLjFTBogDFj4UNzaaDJVp7c5/
         LjJfiNfCI5/6GPZM6O8hS6xh55ShDeQiD2OmcOx65O/D+4LvabRclUxmJnbn3davgXIy
         ebRINNyBYNgeaQBCp54lkO+tlBCp+t3DfW6p/uFeh4/fhnuPvNfL7xb472j7a+WBK3TR
         g0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvUrAGy5LfUdk7RQ9JAQrxj7aTDm46YDkzZc56WPEX8=;
        b=aNUW0tzYmXGImR/JEpTy7lysz64ivjQ6+Xp0bZcV0WMhZLb70VDuCLHX9PvRnKlPip
         xhPneclP/NfDpGIYcMrzWaoCV1JelCQ7YzY61iRFFj4DYveAl9mau1k7Rh/G6+SpSGYc
         9LOa56GNyiOv0sUs/tFRAzfZT6oLSc4Q3Q6He/4OnRgZi9V0EZZOsqC4hHjLLVhqeY6M
         oOdeSPcb+Z6dFLuG5jOdrYVDpvX1y8cMKzeTDM8zjqwc9sKbzLxH9fheowv/7oiAgQK0
         tGn6Yhny55bc7LnAcKDan+qq7eF+QzuvWTMf41mwlzm8gZJS2ekYYhg44i0y1+404EW/
         RL6g==
X-Gm-Message-State: ACrzQf0ugYCfTiHXVEXqUMM65UMoSXxm6bREPXOqQwjR5Dw3PNSAZEqC
        chU0O7EJQkmTxNyryUIVAkIY2d+ZgQ/ZZ1RYHN+6Kg==
X-Google-Smtp-Source: AMsMyM5rg7SSifar3NxKoLRu3V3PQ+c9Wj94mdOHKtyNgi3BAAlsM81xXwWAYivpJ+vxCZCVG7RbnkQ8CB6c9aqGBnM=
X-Received: by 2002:aa7:c60a:0:b0:458:d707:117 with SMTP id
 h10-20020aa7c60a000000b00458d7070117mr83179edq.258.1665067060587; Thu, 06 Oct
 2022 07:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-2-jacopo@jmondi.org>
In-Reply-To: <20221005190613.394277-2-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 15:37:05 +0100
Message-ID: <CAPY8ntBcMMCv_8ipi_9H3dfdaaJZAbWtd6nESO8jmVp8Bm0KFg@mail.gmail.com>
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
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
> Implement the enum_frame_size pad operation.
>
> The sensor supports a continuous size range of resolutions.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Looks reasonable based on the driver.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ar0521.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index c7bdfc69b9be..89f3c01f18ce 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -798,6 +798,24 @@ static int ar0521_enum_mbus_code(struct v4l2_subdev *sd,
>         return 0;
>  }
>
> +static int ar0521_enum_frame_size(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *sd_state,
> +                                 struct v4l2_subdev_frame_size_enum *fse)
> +{
> +       if (fse->index)
> +               return -EINVAL;
> +
> +       if (fse->code != MEDIA_BUS_FMT_SGRBG8_1X8)
> +               return -EINVAL;
> +
> +       fse->min_width = AR0521_WIDTH_MIN;
> +       fse->max_width = AR0521_WIDTH_MAX;
> +       fse->min_height = AR0521_HEIGHT_MIN;
> +       fse->max_height = AR0521_HEIGHT_MAX;
> +
> +       return 0;
> +}
> +
>  static int ar0521_pre_streamon(struct v4l2_subdev *sd, u32 flags)
>  {
>         struct ar0521_dev *sensor = to_ar0521_dev(sd);
> @@ -864,6 +882,7 @@ static const struct v4l2_subdev_video_ops ar0521_video_ops = {
>
>  static const struct v4l2_subdev_pad_ops ar0521_pad_ops = {
>         .enum_mbus_code = ar0521_enum_mbus_code,
> +       .enum_frame_size = ar0521_enum_frame_size,
>         .get_fmt = ar0521_get_fmt,
>         .set_fmt = ar0521_set_fmt,
>  };
> --
> 2.37.3
>
