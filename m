Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889027A1CD4
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 12:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbjIOKyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 06:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjIOKyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 06:54:14 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A192AA1
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 03:54:09 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-44d3a5cd2f9so1017552137.3
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 03:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1694775248; x=1695380048; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QBHinWSfk/iQm+fsCywxUfyF5X1BLlmvENcNZGQqLp0=;
        b=n4ht2tcEU2Y5Niid4zMxbyBuJTy1H05dguDVoCo/FMMOgdrqzHZ+ZSefY+5jkFbcAz
         KONePB3222It+oM6Ycd8EMYLPrj4vgo9kBQKi+WN5VkyvUtzJPPY6XHiLVfV72D8T7IY
         t5+H3d41TgKWimulC6n/oo/0KsAgWB/wqGm7+amjeSTk+qxEPD/oE1DVmAbcoxCgO6vr
         /giOxHJNWsBSq68o5hthjiZfuGTCv6auNRGUovLv9gPP/ZVYIXQdOiu8VMclhhbI9xfe
         FXkaIAQLDw21L0AKcwFoCH+B90jh66nynypOyDDuRMCFY57JAYoZErIidPpa3SaCHNFD
         XzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694775248; x=1695380048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBHinWSfk/iQm+fsCywxUfyF5X1BLlmvENcNZGQqLp0=;
        b=i6f8Saoeb34HfslcltVMx+ZgxKLEr0V5lY3s4pczMZ3CKwhhNyoMGaBwn+Xu+XLyxk
         3dzxaFzYoeEkfrHHik8ingDV5Do7sxNHd64s0yZo9gZWwxf3q8FhsMB3xFP2mw+WWsou
         CAIrae0mZ2SHso3Rt9lWkbUjWW1uKsKM2Z2G9YZwjkiiOL1i9hUz04qhdnuxOdJit+j7
         2j5FwJxqTAbOmkULK+sAyhhKxPL5yNXWzwFfYq+yt0hpav2MNR/ZE/y7XbPcuKHlqjTL
         CLR0AmKhR7B4tUunNczvAcM66ihfYeTRVUWKAclAce3fGaSPN2Dcm6wpHiL7BFXcNW09
         4X+g==
X-Gm-Message-State: AOJu0YyRuyTR0VSqRPhFPZ2vGklcI/bIdDzunZF4X5eRA8xI6U7FKQpl
        kQTRTqu9/ZaNMwHwOWKwZoIcuMtxl5vM09i+2zHZpw==
X-Google-Smtp-Source: AGHT+IHUvzsL1wwboWffprM10tx80tmGmpro4oboyhNT0NbOL0oK69F6Lsd1XS55FcucDTE0hd9x9Ld0Y7oBtFmyUVo=
X-Received: by 2002:a05:6102:34da:b0:440:a8c8:f34 with SMTP id
 a26-20020a05610234da00b00440a8c80f34mr1422690vst.3.1694775248747; Fri, 15 Sep
 2023 03:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com> <20230914181704.4811-43-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230914181704.4811-43-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 15 Sep 2023 11:53:53 +0100
Message-ID: <CAPY8ntBVEn7DtFu7Z0-nT4ObrH9Wz=uRKOhhkz=0di+1v3zZVA@mail.gmail.com>
Subject: Re: [PATCH 42/57] media: i2c: imx219: Drop system suspend and resume handlers
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 14 Sept 2023 at 19:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Stopping streaming on a camera pipeline at system suspend time, and
> restarting it at system resume time, requires coordinated action between
> the bridge driver and the camera sensor driver. This is handled by the
> bridge driver calling the sensor's .s_stream() handler at system suspend
> and resume time. There is thus no need for the sensor to independently
> implement system sleep PM operations. Drop them.
>
> The streaming field of the driver's private structure is now unused,
> drop it as well.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Presumably this is superseding effectively the same patch in your
other imx219 series [1]
That's fine by me, just an observation.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20230913135638.26277-16-laurent.pinchart@ideasonboard.com/

> ---
>  drivers/media/i2c/imx219.c | 41 --------------------------------------
>  1 file changed, 41 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 5715bbbc0820..a431dace0f33 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -479,9 +479,6 @@ struct imx219 {
>         /* Current mode */
>         const struct imx219_mode *mode;
>
> -       /* Streaming on/off */
> -       bool streaming;
> -
>         /* Two or Four lanes */
>         u8 lanes;
>  };
> @@ -991,8 +988,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>                 imx219_stop_streaming(imx219);
>         }
>
> -       imx219->streaming = enable;
> -
>  unlock:
>         v4l2_subdev_unlock_state(state);
>         return ret;
> @@ -1044,41 +1039,6 @@ static int imx219_power_off(struct device *dev)
>         return 0;
>  }
>
> -static int __maybe_unused imx219_suspend(struct device *dev)
> -{
> -       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> -       struct imx219 *imx219 = to_imx219(sd);
> -
> -       if (imx219->streaming)
> -               imx219_stop_streaming(imx219);
> -
> -       return 0;
> -}
> -
> -static int __maybe_unused imx219_resume(struct device *dev)
> -{
> -       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> -       struct imx219 *imx219 = to_imx219(sd);
> -       struct v4l2_subdev_state *state;
> -       int ret;
> -
> -       if (imx219->streaming) {
> -               state = v4l2_subdev_lock_and_get_active_state(sd);
> -               ret = imx219_start_streaming(imx219, state);
> -               v4l2_subdev_unlock_state(state);
> -               if (ret)
> -                       goto error;
> -       }
> -
> -       return 0;
> -
> -error:
> -       imx219_stop_streaming(imx219);
> -       imx219->streaming = false;
> -
> -       return ret;
> -}
> -
>  static int imx219_get_regulators(struct imx219 *imx219)
>  {
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> @@ -1464,7 +1424,6 @@ static const struct of_device_id imx219_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, imx219_dt_ids);
>
>  static const struct dev_pm_ops imx219_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(imx219_suspend, imx219_resume)
>         SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
>  };
>
> --
> Regards,
>
> Laurent Pinchart
>
