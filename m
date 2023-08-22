Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05357848DD
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 19:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjHVR7H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 13:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjHVR7H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 13:59:07 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888D893
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 10:59:04 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-44d3fceb567so1811002137.0
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692727143; x=1693331943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Noo0iSUeC57/zTbz1+TUamDPB9e2cfoVHr9nhpC128=;
        b=X/HWikpXUCBsUo2UkPd5Wz2v/33Oyguc4aQOpAJ+TuYwpqUqIrN+f/3vriWsnUXn4G
         yiV4f47GLg50jWYBgnTtKsixkQBJP9dEwXDn7w8I1h1PHdwV86gD7b9E+sSd4fK5twa1
         utKWrw0CN1hMjtKvCKbuImFnmHEdYklXtuThzIREAbIotaydvMyKrjCWkIbWCdldN2vA
         5h9jBDCAbYO3DKqAHmaJaeyV/j+TxD7Zu1c5VSm5Q5mZEm3U9h5BJXVGTZrlOF8xczwC
         /lDVa1i1uimYjjyorskq1n91hr03R8rQbFpLHzuJskbxf8SGbJfJXWGWdHAya2C7/NJI
         nNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692727143; x=1693331943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Noo0iSUeC57/zTbz1+TUamDPB9e2cfoVHr9nhpC128=;
        b=lG14xePEp9+9oU+bHim7+YkspMJRbQbfVBo+PLIR5ZVHXVtI5/7eP7pMwdsOvrcJOU
         vblAADp62g+Flajw7nygBDNZSbwOX0N+tUFzqnZE/HbmS2I0tct3M7Y6THNWQqfdKpfL
         AFjYLJFBouFE/JEI8Z4PeIWY/+VBY7nXUpycqXOfyXYNw+I/BDR1AsbGDy4MiohSXQ3M
         JORuZ73zcMtgroGQL2oNups++bNscAKTaI6YA8r4kO8Lo4uzrdUk9IQ1FX7NNZ90oAGr
         ZrkPafhCRTnp6NaBukKBmwR6Grcc4FAPN9ayQN8LfjxLvDSq1PBmjyDsl4Ys07lo7q6z
         /TdA==
X-Gm-Message-State: AOJu0YzHeSENStXrNt2palIcYaIvJLiHlioCF1J+jVk1q97msAnAQfzX
        51CC+j5wtnNTDVugI+9S9eP1Nz7Qa3aGXGWhbPt3ypOBQ0+2eGBnUIc=
X-Google-Smtp-Source: AGHT+IGhxqLEyPbnhBkksenXLNOAxzV3e8pzGD2uPEaBl+fQqtuceX2+BKS0pGcZcO208/UW98oo4P0qdTbShYeKOrw=
X-Received: by 2002:a05:6102:3230:b0:44e:837a:25e with SMTP id
 x16-20020a056102323000b0044e837a025emr53388vsf.11.1692727143589; Tue, 22 Aug
 2023 10:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-15-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-15-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 18:58:47 +0100
Message-ID: <CAPY8ntBX5P5SOitehxN-AGb9OaGQkSaW-z4a2R+HZ7LiKDP_Tg@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] media: i2c: imx219: Drop system suspend/resume operations
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> There is no need to stop streaming at system suspend time, or restart it
> when the system is resumed, as the host-side driver is responsible for
> stopping and restarting the pipeline in a controlled way by calling the
> .s_stream() operation. Drop the system suspend and resume handlers, and
> simplify the .s_stream() handler as a result.

I'll believe you, but the docs for power management in camera sensor
drivers [1] state
"Please see examples in e.g. drivers/media/i2c/ov8856.c and
drivers/media/i2c/ccs/ccs-core.c. The two drivers work in both ACPI
and DT based systems."

Looking at CCS we find the suspend hook stopping streaming [2], and
resume hook starting it [3]. Same in ov8856 [4].

Could you reference the documentation that states that the host-side
driver is responsible for starting and stopping? Is this an ACPI vs DT
difference?

Functionally the patch does what you say, so would get a R-b tag otherwise.

  Dave

[1] https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#power-management
[2] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ccs/ccs-core.c#L3155-L3173
[3] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ccs/ccs-core.c#L3185-L3186
[4] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov8856.c#L2128-L2164

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 56 ++------------------------------------
>  1 file changed, 2 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 227c227cf4ce..da2a8d0210fa 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -359,9 +359,6 @@ struct imx219 {
>         struct v4l2_ctrl *vblank;
>         struct v4l2_ctrl *hblank;
>
> -       /* Streaming on/off */
> -       bool streaming;
> -
>         /* Two or Four lanes */
>         u8 lanes;
>  };
> @@ -764,24 +761,11 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>
>         state = v4l2_subdev_lock_and_get_active_state(sd);
>
> -       if (imx219->streaming == enable)
> -               goto unlock;
> -
> -       if (enable) {
> -               /*
> -                * Apply default & customized values
> -                * and then start streaming.
> -                */
> +       if (enable)
>                 ret = imx219_start_streaming(imx219, state);
> -               if (ret)
> -                       goto unlock;
> -       } else {
> +       else
>                 imx219_stop_streaming(imx219);
> -       }
>
> -       imx219->streaming = enable;
> -
> -unlock:
>         v4l2_subdev_unlock_state(state);
>         return ret;
>  }
> @@ -1015,41 +999,6 @@ static int imx219_power_off(struct device *dev)
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
>  /* -----------------------------------------------------------------------------
>   * Probe & remove
>   */
> @@ -1295,7 +1244,6 @@ static const struct of_device_id imx219_dt_ids[] = {
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
