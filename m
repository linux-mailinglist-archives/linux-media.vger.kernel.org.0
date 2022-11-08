Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC2E620F55
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 12:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbiKHLmT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 06:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbiKHLmR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 06:42:17 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232122EF52
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 03:42:15 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id v27so22051067eda.1
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/2Zcin6SfWccAKAue0SGPxAi2+yFI7Ic/3HoFRhGq4=;
        b=WEvfJGGWXkATwBTKvIjt389c3uQJa+zfbVOasdGo+52pIQbSy8XldEUhT1lkpvDtEy
         MvU4UgsUsX1QzwEg0AahjzvY3SPZgD2WchfzN0wAy33AbFbUxNCQhub012+sR3DPB2XM
         gv6aVL88DxBaCaJi3mckG7zEW0XouI7QGRbdqk+AYSqKaKF8S2hwBoBQpSQcRqhxKaWj
         b8ZnRxggh94Rq4uY7HQmzuQAzLR2v6M8U3X+Lwgf2hnYk01MWWeC0B31LEejHPdrvgGz
         s/fymTHJzS/IUjebDRUZJbOcn0hIOvoLFgWuvADGCTTV8lEizgdqRL8b1dVw31Z/xXxA
         YH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/2Zcin6SfWccAKAue0SGPxAi2+yFI7Ic/3HoFRhGq4=;
        b=kQ+dPd3f2Y5AWVr3dFlYzjewxHP9TNyem8jHGedGIIMMYsz1w53KS/Pp2KTZSJTIBr
         +nXgUBcZraa2SLIRFyggH0KG0wzPzj7JzReUbNS2mOx7I4nN9ogeXG00aEdc82DiYO2R
         kOSmaimgRkHb2uSSCongU7CY5jRIsnTnvcML7O2EhiQjSNlL/CqDfdxEGpx75HPkSL++
         BhTUco4Y1fOWSJ7RaBlORkkjo1RqYb8kXaY9jMvKo+eVsaMkx5Ko4Vj+/Ym9neX8N0uJ
         eqWtjiqcIIqjYYY1jvTkSFjGjaOG5R2WrTeAUb+GLT4o9kZKa4tbX3wMc4XByz7F9ChV
         0p6A==
X-Gm-Message-State: ACrzQf15n79K2ZB5MlERJI+ZcQBG34ee5fnkqPTozHxQH6E1ecnmxfxX
        4t2IAb7HfRYYpmzHCI4t+v7zSJsCtCa02B+vHF9p7OdpNqnb2g==
X-Google-Smtp-Source: AMsMyM58JzHgdQyaBVjjVZJb5Z+31zeau8C1XwsOl7RaziTl1bTA+XQ9yBJq+W5QSTj7wf8YX+w0j3WT92pu3F3eY+w=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr24116304edb.86.1667907733681; Tue, 08
 Nov 2022 03:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20221107204959.37691-1-jacopo@jmondi.org> <20221107204959.37691-2-jacopo@jmondi.org>
In-Reply-To: <20221107204959.37691-2-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 8 Nov 2022 11:41:58 +0000
Message-ID: <CAPY8ntDJVJftyxRsRg+cdbPfLpFXP4Mijy8F5ZOWLTtPqUt-LA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: media: camera-sensor: Correct frame interval
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo.

On Mon, 7 Nov 2022 at 20:50, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> The formula to compute the frame interval uses the analogue crop
> rectangle dimensions to compute the total frame size in conjunction with
> blankings.
>
> Horizontal and vertical blankings are realized by extending the time
> interval during which no valid pixels are sent on the bus between
> visible lines and between consecutive frames, whose size is smaller than
> the analogue crop rectangle if any additional cropping or pixel
> subsampling is applied on the sensor processing pipeline.
>
> Correct the documentation to use the visible line length and frame
> height instead of the analogue crop dimensions.

I'll defer to Sakari on this, but I think the original text is correct.

Consider something like CCS where you have a separate array with
analogue crop, and then binning and scaling steps. AIUI the pixel rate
and [HV]BLANK will be defined for the array, not on the binned and
scaled values which finally give the visible frame. See [1].

For the majority of sensors where analogue cropping, binning, and
scaling are not broken out separately, then it may well have been
incorrectly implemented as they do often look at the output
width/height. Should they be using the w/h values returned by
V4L2_SEL_TGT_CROP on V4L2_SUBDEV_FORMAT_ACTIVE for the sensor modes
instead? Quite probably, but that also makes the userspace more
complex (and probably needs fixing).

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ccs/ccs-core.c#L734

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/driver-api/media/camera-sensor.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index c7d4891bd24e..bb7d62db4cd1 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -87,12 +87,11 @@ less all modern raw camera sensors.
>
>  The frame interval is calculated using the following equation::
>
> -       frame interval = (analogue crop width + horizontal blanking) *
> -                        (analogue crop height + vertical blanking) / pixel rate
> +       frame interval = (visible width + horizontal blanking) *
> +                        (visibile height + vertical blanking) / pixel rate
>
>  The formula is bus independent and is applicable for raw timing parameters on
> -large variety of devices beyond camera sensors. Devices that have no analogue
> -crop, use the full source image size, i.e. pixel array size.
> +large variety of devices beyond camera sensors.
>
>  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
>  ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> --
> 2.38.1
>
