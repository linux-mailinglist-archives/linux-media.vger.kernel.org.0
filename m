Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9FB1620FDA
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 13:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiKHMIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 07:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233643AbiKHMH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 07:07:56 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41D043841
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 04:07:54 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id b2so38017113eja.6
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 04:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Z+VqEVGxax0T9YlY34K07GIZeOFCnBQE1ZUl1Y6CkU=;
        b=gBcdYOQug3dyeSS1ABmn/BaYNodmzzyRn26egBIphVjtD4wpUH+F524LRcAaGxMY//
         +B9vhnWmk2mmPAIcpbKhvYSrJwkJv4SpWO77mtKJeKNUH9FScJdVqx9NR2WQweibLUE2
         JbkZaACQDlhhTt50sBfnbIJAX+7yw2k4CQWWYjf7iDj+JHEWltxpGd7+EFkgUcOYcZw1
         5F+MbNxWDUwdmXWTG2E9N+20bhu1DHLLsEwsVa/rhoQf9wJEeSijhovYyAJjZRXOs5JU
         z7XZRPDUpkE8E/xTjpK4WeHGpmw7Xb+pYQi7Ckkg+w066xbOmrCGY/0SG3EM5VKEisEx
         A5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Z+VqEVGxax0T9YlY34K07GIZeOFCnBQE1ZUl1Y6CkU=;
        b=OBfX3EeI+GM+At4Biu8WFSXHEIfvzoFeJNGwCS/6z2ZItYQEiK7rZXVHE5gM9TQVei
         OohKSJutaLRqiMyv64GnWmyrCyQ4kuk2hGVfB1kB2MJhyia0ijeE9pU1Sit3lNMK3ka9
         cKC8JscJqhd0SK8GzLPqCtM1C2INl8yTvRDzkuQHaRh7GbEk5/71Pt9dEKR+CFz93hM8
         NCaIE/Z9KFm/tKK+cs02fdwhSoHTm3UNPTO6UGFoXXmluSUuijoRNjSvA0OeBOXH1jmd
         /XC2RNgAYV+XqjBA1Ta6q/Ycq+KKB3GtyGWsBDCQP1iHUJxLs5m8kHY3PpRvIMMwCCBX
         AK3g==
X-Gm-Message-State: ACrzQf1KnBoTykV5xm0Hezkap8sHiWRleIOpqkBm+Z6cvqn+SEHz/kq8
        aIyicznf4b2ju6/OIm8tqfP3S2K4Tsjr0ll2OZZSiLtb/pONNQ==
X-Google-Smtp-Source: AMsMyM5557SgTmYVL+2v1RoYhkzVjzqfb8O3eWUn3hcm7Xm6AmVUrHV84oOQCx0HcIuOh3aiaSV4Kki7uJIa4SBJaFw=
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr53441444ejb.294.1667909273304; Tue, 08
 Nov 2022 04:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20221107204959.37691-1-jacopo@jmondi.org> <20221107204959.37691-4-jacopo@jmondi.org>
In-Reply-To: <20221107204959.37691-4-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 8 Nov 2022 12:07:37 +0000
Message-ID: <CAPY8ntDR9_57zntidEPY0aCQKZ88Uu94wOrfbtNYoR7qFnePLA@mail.gmail.com>
Subject: Re: [PATCH 3/3] documentation: media: camera_sensor: Update exposure
 on blanking change
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Mon, 7 Nov 2022 at 20:50, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> The maximum achieable exposure time in a camera sensor is usually

s/achieable/achievable

> bound by the total frame height (visible + blankings) minus a fixed
> sensor-speific offset.

s/speific/specific

visible, or analogue crop?

> When the vertical blanking control value is changed, the exposure
> control limits should be updated as well.
>
> Add this to the camera sensor documentation.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../driver-api/media/camera-sensor.rst        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index 31f74f85ebc5..76206c7647d6 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -179,3 +179,36 @@ used to obtain device's power state after the power state transition:
>  The function returns a non-zero value if it succeeded getting the power count or
>  runtime PM was disabled, in either of which cases the driver may proceed to
>  access the device.
> +
> +Resetting exposure on vertical blanking update

Resetting exposure limits on vertical blanking update
You don't want to update the value (unless it is now outside the
permissible range).

> +""""""""""""""""""""""""""""""""""""""""""""""
> +
> +The sensor exposure time, specified by the ``V4L2_CID_EXPOSURE`` control, is
> +usually limited by a maximum value which is equal to maximum vertical blankings
> +minus a known offset usually specified in the chip programming manual.

limited to a maximum value related to the frame interval. Frequently
it is a number of lines less than the frame length that will be
specified in the sensor documentation.

> +When a new ``V4L2_CID_VBLANK`` value is applied, regardless of it being actually
> +programmed to the hardware or not, the limits of the ``V4L2_CID_EXPOSURE``
> +control should be updated as well.
> +
> +The typical coding pattern that realizes that in the ``.s_ctrl`` callback
> +handler is:
> +
> +.. code-block:: c
> +

#define SENSOR_EXPOSURE_OFFSET   <see sensor documentation>

> +       static int s_ctrl(struct v4l2_ctrl *ctrl)
> +       {
> +               int exp_max;
> +
> +               switch (ctrl->id) {
> +               case V4L2_CID_VBLANK:
> +                       exp_max = sensor->fmt.height + ctrl->val - 4;

sensor->fmt.height + ctrl->val - SENSOR_EXPOSURE_OFFSET.

Discussion on patch 1 over the use of sensor->fmt.height.

  Dave

> +                       __v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +                       sensor->ctrls.exposure->minimum,
> +                       exp_max, sensor->ctrls.exposure->step,
> +                       sensor->ctrls.exposure->default_value);
> +                       break;
> +               }
> +
> +               if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
> +                       return 0;
> --
> 2.38.1
>
