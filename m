Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68349746E3E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbjGDKGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjGDKGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:06:00 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EF8E3
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:05:59 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4719341c9d0so1431427e0c.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688465158; x=1691057158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cvQ8S8SiKF4o7UANTxKPFHGfPxl5S0G/nAvOwQA516g=;
        b=iPKdcUd1hU7M3k1z0TmbTSdAn4I8zRg2OlQrGt0zaf/VXfmK8XstiZDPPp4t2wSSKt
         PKUjV//s6Upqc0IJk2oLtIKT6dvme6sEOJCWG8+dtxgcPCT8v23ZqTsMl/r8azjmFx6h
         g+W2CLXUM+d4YHL7lf1Z+X13qPCPUla1t/IdDY2l01s7nGF3i5qLrByLNEacw0j+j8pi
         xRDzDRvDBg+aD/IiCWN/RzS9KJ6Un3+h93JuOfb/zCGvEvpPahwD2XzBVFlp1T+SF3qi
         RGOn0szBj36qMK/A+AKeyB7PwB+QvhiAYlcFe12h8RpOIoeDEG3lw2vpauEnER37iuka
         ftbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688465158; x=1691057158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvQ8S8SiKF4o7UANTxKPFHGfPxl5S0G/nAvOwQA516g=;
        b=f9W7x9yLPPjpOiULjodm+OD14VDWqSQ3M9Q7GS5aAV2FwCMfVS3bhHSASD9g4oiFr5
         7ghkNhX5MeP7jBpSe7iIjACDSbyTjbMA7eqQF+mHtweZWrBub9+7xa67TfJs94EM0g58
         sEX7+9Sg01Jo0uWhlPE+2nUTmGNGgka+Taom+j1/OlXPYJRxZ+XL0jR3vbWwUeodb5bX
         rHpS49RCyh8VNJixOv9Ca8mDYU/j0Q9lcW+bG/m0QrfkhwmENlfZyT2xlJ/G6ho2dCiy
         DCtAokfqJjb5iSEB4QU4xYIk/G0jN+pgJro+QPVMaxirIw6Xwbi0aFFVyXySLtoznmXn
         xI1A==
X-Gm-Message-State: ABy/qLZRvv0Psz3ZdbO2gcmoWQ0qiypU0Jy0471JfwjcqbK3fTBXrH3M
        ta7aiUybPJG+YzKJzzYRijZMPqpSzE2DoD4m3YzydDluJUE041LjSmM=
X-Google-Smtp-Source: APBJJlF+jp0mIv9A7yu+ekV/OP7hSD0+U39l0R1UURuX4MaVqCdTtqNXSzaEYRM5z0L6517awG7VnhKfeY9HbOhpM60=
X-Received: by 2002:a1f:5c0c:0:b0:47e:22fd:7b65 with SMTP id
 q12-20020a1f5c0c000000b0047e22fd7b65mr3272003vkb.14.1688465158089; Tue, 04
 Jul 2023 03:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com> <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 11:05:42 +0100
Message-ID: <CAPY8ntCZs9N368-3R8HP0brG6FWXb0erSGt1pjTDEQkUFE4PgA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
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

Hi Jacopo

On Mon, 3 Jul 2023 at 21:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Document the suggested way to exposure controls for exposure and gain
> for camera sensor drivers.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../driver-api/media/camera-sensor.rst        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index ee4a7fe5f72a..dfe8f35aecea 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -189,3 +189,22 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
>  a flip can potentially change the output buffer content layout. Flips should
>  also be taken into account when enumerating and handling media bus formats
>  on the camera sensor source pads.
> +
> +Exposure and Gain Control
> +-------------------------
> +
> +Camera sensor drivers that allows applications to control the image exposure

s/allows/allow

> +and gain should do so by exposing dedicated controls to applications.
> +
> +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> +The control definition does not specify a unit to allow maximum flexibility
> +for multiple device types, but when used for camera sensor driver it should be

s/driver/drivers

> +expressed in unit of lines whenever possible.

s/unit/units

Possibly clarify that lines can be converted into units of time by
using V4L2_CID_PIXEL_RATE and (image width + V4L2_CID_HBLANK).

> +
> +Camera sensor driver should try whenever possible to distinguish between the
> +analogue and digital gain control functions. Analogue gain is a multiplier
> +factor applied to all color channels on the pixel array before they get
> +converted in the digital domain. It should be be made controllable by
> +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> +specific gain code. Digital gain control is optional and should be exposed to
> +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are

Something appears to be truncated here.

  Dave

> --
> 2.40.1
>
