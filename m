Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384C5747231
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 15:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjGDNFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 09:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjGDNE6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 09:04:58 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF7F1980
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 06:04:25 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-47e746f9560so125344e0c.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688475864; x=1691067864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Je2IixiKUbt9NqSRg4gDrVP8T4/tNCU78MaXm4X340k=;
        b=oKvtHkdj4yN43IFV4ScgtWN4e346FcYRethiN1fZhu8pZGtLmHbwde39e98T9oy4z7
         1Wwg4Q3Wqh7zFxc6tFnzZmqdCDQvrJ8K74Kzi4Ev8VXvZY/JtLxZIXTMbH1EoSeDst8T
         WB67GPYmHO0ExldyeY+Q6Jr2ySoQFPGJsWheBXM0eYA7FpvbIWwSLe/fBa9GGl1Jz1TU
         /xWKeujhPqVRTbj72SwFcp2ancm/Q3HbzxH+nKEMvendr3f0LvwsG1sy7oVLOdpNmBfC
         nCwD7imHQ9h6Cd78SZumvCmiKa1Tkr11Q4YY1CX0XqW2DnCvzq+0j1XpUYnAgC0KhJd7
         ZCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688475864; x=1691067864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Je2IixiKUbt9NqSRg4gDrVP8T4/tNCU78MaXm4X340k=;
        b=V1zR9npviz0ebuzoM/xYA95cxfBFMmRYvkJ95mE1Aij8wlhiWdiInDNEFBUpoSs6n9
         M5zpm+gm7LDLlbFfkxPvrYyYg1i6CaDBKYdUgnNXNnr62paShB0efGLqtXhL7I2CraZR
         ETfkNKnMhGDP/2dhRjcnDF9v48mT/U98sbgCVfQ2YmzEN/KhGEUxY9Wl7u3/jRKcRfNY
         E7l6GecCcpG2ExN5MpHytF+/0w1wD1kUnYgR6r88FGbZOb5aR8DSGyLZLJoqWBgzlbum
         /5FHSp4WknpWFT1ta7En5Sqpt/3MvzfvehjJmwIDWd0gnBr53u0bTevHTvga9KgPmQP2
         JrHw==
X-Gm-Message-State: ABy/qLahMr5w9m9l1paElKZZYBauD/9AzhtJGhfsSWs79EoLTLNwVq6G
        rLWZBgUtTmS7O+r4mQofthZcvNrmqHGUFNSqCWip32hcT6c6IEfL
X-Google-Smtp-Source: APBJJlF7nTnW5BQ6Djycb5X/rsMYdBFk3iRl7ptjiit/AxEitYFpSPFU5EWrwca7RDCD4XGqRvIn1ydwEw39J0WbxVY=
X-Received: by 2002:a05:6102:50d:b0:443:6082:1436 with SMTP id
 l13-20020a056102050d00b0044360821436mr6758242vsa.6.1688475863889; Tue, 04 Jul
 2023 06:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230704123819.156418-1-jacopo.mondi@ideasonboard.com> <20230704123819.156418-3-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230704123819.156418-3-jacopo.mondi@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 14:04:08 +0100
Message-ID: <CAPY8ntA7DjyDstTjhpGiau2ppkEs45-y5QygqtB96cLE8_f-Yg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Documentation: v4l: Exposure/gain for camera sensor
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 4 Jul 2023 at 13:38, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Document the suggested way to exposure controls for exposure and gain
> for camera sensor drivers.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../driver-api/media/camera-sensor.rst        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index 7516d61a903d..fb70d55f6671 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -189,3 +189,30 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
>  a flip can potentially change the output buffer content layout. Flips should
>  also be taken into account when enumerating and handling media bus formats
>  on the camera sensor source pads.
> +
> +Exposure and Gain Control
> +-------------------------
> +
> +Camera sensor drivers that allow applications to control the image exposure
> +and gain should do so by exposing dedicated controls to applications.
> +
> +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> +The control definition does not specify a unit to allow maximum flexibility
> +for multiple device types, but when used for camera sensor drivers it should be
> +expressed in unit of lines whenever possible.
> +
> +To convert lines into units of time, the total line length (visible and
> +not visible pixels) has to be divided by the pixel rate::
> +
> +        line duration = total line length / pixel rate
> +                      = (image width + horizontal blanking) / pixel rate
> +
> +Camera sensor driver should try whenever possible to distinguish between the
> +analogue and digital gain control functions. Analogue gain is a multiplier

nit: multiplication factor

> +factor applied to all color channels on the pixel array before they get
> +converted in the digital domain. It should be made controllable by

nit: converted into the digital domain

> +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> +specific gain code. Digital gain control is optional and should be exposed to
> +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> +discouraged from using ``V4L2_CID_GAIN`` as it doesn't allow differentiation of
> +analogue vs digital gain.

Sorry to have missed those first time around. With or without:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> --
> 2.40.1
>
