Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36D6620FA2
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 12:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbiKHL52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 06:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234013AbiKHL5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 06:57:23 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40391274F
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 03:57:21 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id f27so37983896eje.1
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 03:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szz95XzUEXMlGtxY/VFyj+6TN5Zg355w2hU+YpO+3AI=;
        b=lvFLLuEZGQwHfXjc2wvjMWIh7iyUXC6qzRC1c+tZZzbC6ag+xzsNieubrBJxALh0YD
         NhluKKuKSFabfBPhMs4qmv6IGW+nznUNxmY3ptG1oNU6jpWT1Ji7b+fltPPYRTLkmxi1
         ClVdevyW1GRSeLqmCAjRrYUd/HN3v3PcBAGIWu8vUqd3tLeQn676VPQIjn32o+EMECAx
         cxJG9FlJZcEwcy3BOXGVfIpMGK/pU5VDP0/kX6PbGjmj45oVo42UgoXxP2A9Gn/+lJlm
         AL7DLOJZFB0OZwmzbfByJJHCPuNf/4Olsr2iiPY9WkzlXdPfpkAS3onzQef1NDIh+XyG
         Hw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szz95XzUEXMlGtxY/VFyj+6TN5Zg355w2hU+YpO+3AI=;
        b=uGNKJnS8q/qp5bTswaw/2R/S0liOXkfBPzZSVrJJQSc8AuQ8Mn5rMuhnDBQUjPAw5F
         KnTCSEix02ZdaaFVi6VZwURy4qOyUb7umtH8nY6nXPry7tHtEehvJtBwTU1/ch4vTxmJ
         m7B9jwcbTokwv4UOCLWWtNXm4zW2xoUYBW6K8ann2d+fgXuI07cjxgf0EIqBX0pDysZR
         25TcWoFj4zJkum3e/OmQe5VDzbiOEUdsigRbXwQRCvHOuXJqiCsKFHJvlr75io3XIY7h
         HGkvDzYeS5lL76gtgjpBUk9GPgI2jr6NcC9QviGqC2gTF3GEqtUdvKDiazcQBgFUP7LB
         wkRw==
X-Gm-Message-State: ACrzQf2vOuox0npwjUiA6rplpoF6K41D7cT8UaFVK6uev+teXswTWNya
        A8RoPVg4Jhlz1XDpTlUkRFoiWZ+RZKppo1j0U9xSGfw4WsLIyw==
X-Google-Smtp-Source: AMsMyM6stgqnnTuq/K11QpQOEBry/l2h9dToelR4I6C25BFrVQen8YNEChNJoqcr4AcnMUsFF1abj3S5ysZfRq7iL6Y=
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr53390749ejb.294.1667908640391; Tue, 08
 Nov 2022 03:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20221107204959.37691-1-jacopo@jmondi.org> <20221107204959.37691-3-jacopo@jmondi.org>
In-Reply-To: <20221107204959.37691-3-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 8 Nov 2022 11:57:04 +0000
Message-ID: <CAPY8ntDZPox8as7YtJhqjHOBteViKsDni=7Hp9AeHPAE931jiA@mail.gmail.com>
Subject: Re: [PATCH 2/3] documentation: media: camera_sensor: Document
 blankings handling
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

Thanks for the patch.

On Mon, 7 Nov 2022 at 20:50, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> When a new image format is applied on the sensor it is necessary to
> update the vertical and horizontal blanking limits, to comply with the
> new visibile sizes.
>
> Add that part to the documentation of camera sensor subdevices.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../driver-api/media/camera-sensor.rst        | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index bb7d62db4cd1..31f74f85ebc5 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -107,6 +107,35 @@ The first entity in the linear pipeline is the pixel array. The pixel array may
>  be followed by other entities that are there to allow configuring binning,
>  skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
>
> +Blankings initialization and reconfiguration
> +""""""""""""""""""""""""""""""""""""""""""""
> +
> +The value used to initialize the vertical and horizontal blanking controls
> +should be selected in order to realize, in association with the driver default
> +format and default pixel rate, a reasonable frame rate output, usually one of
> +the standard 15, 30 or 60 frame per second.
> +
> +When a new frame size is applied on the subdevice sensor drivers are requested

s/requested/required. There's no option about it - if the ranges
change then the limits must be updated.

> +to update the limits of their blankings controls.
> +
> +The V4L2 control framework provides the ``v4l2_ctrl_modify_range()`` function
> +(and the unlocked ``__v4l2_ctrl_modify_range()`` counterpart) to assist drivers
> +in re-computing the controls limits.
> +
> +The new maximum limit for the controls should be re-calculated using the
> +newly applied visibile width and height

s/visibile/visible

However that depends on whether patch 1 is correct or not.

> +
> +.. code-block:: c
> +
> +       max_vblank = MAX_VTS - sensor->fmt.height;
> +       ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> +                                      sensor->ctrls.vblank->minimum,
> +                                      max_vblank, sensor->ctrls.vblank->step,
> +                                      sensor->ctrls.vblank->minimum);
> +
> +The blankings default value is reset to the control minimum and the V4L2
> +control framework automatically clamps the control's value in the new limits.

So this raises the question we debated previously - what should the
default signify, and does it need to change?

  Dave

> +
>  USB cameras etc. devices
>  ~~~~~~~~~~~~~~~~~~~~~~~~
>
> --
> 2.38.1
>
