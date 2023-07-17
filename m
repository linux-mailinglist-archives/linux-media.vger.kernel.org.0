Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F791756059
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 12:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbjGQKY1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 06:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjGQKY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 06:24:26 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683021BE
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 03:24:25 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4R4J9217X1zyTs;
        Mon, 17 Jul 2023 13:24:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1689589463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V7hh6AkdtGtk9LsIq45ZVnSVk2WFDPhUiEjlaJwVm9Q=;
        b=y+AXP5dZUl6UoGxuZPdtFc8ReVDFJ5dcydO+Vt64dIlKuHl6vd3x/p8WbIaBzxx6v/L2B7
        CBznR+0EP0c9ucJLcCjm3eOs0Gr0mL4mHRMVNUtBmXMO6q058IsVyS9yoiwgt6dmq6uEyg
        Stwp5D/TWMFWxgUhWFrNV+kyG1+qR3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1689589463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V7hh6AkdtGtk9LsIq45ZVnSVk2WFDPhUiEjlaJwVm9Q=;
        b=sSgFgr0uIcddOnDhtPJvlaSRYLJHpGQjjBMFRRLgWtvQr+z99ak4kTB6+X9RSm+VA6/w6B
        KK60TGVwZV1o/0lKAoAbzhP5/ywWyNo5RCe9DfGpG/4rGKbIdtvfA8kbNVXWT/x1FcxewH
        GsFrrDhI3vcH0JMFg/DSE6aUCMxAhao=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1689589463; a=rsa-sha256; cv=none;
        b=jhUnRtdMSun3EA0rOuhyIdqJPqOBE1sY2uwYFqgoAEnpIIJ+G7R1eM+kmTAYgF3fNGcDso
        suJQzupbf04080KSxXm0sgpXyjzDiNRPqzI4yFh+dGZqNxDgkYRwtP0ZMI5ZT3MiY4vM9r
        77zjAkmcyPnlPjiTWOTbbhAIiRuizX0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 66C74634C92;
        Mon, 17 Jul 2023 13:24:21 +0300 (EEST)
Date:   Mon, 17 Jul 2023 10:24:21 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 2/2] Documentation: v4l: Exposure/gain for camera
 sensor
Message-ID: <ZLUW1eBTH3GpnSlW@valkosipuli.retiisi.eu>
References: <20230710132240.7864-1-jacopo.mondi@ideasonboard.com>
 <20230710132240.7864-3-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230710132240.7864-3-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Jul 10, 2023 at 03:22:40PM +0200, Jacopo Mondi wrote:
> Document the suggested way to exposure controls for exposure and gain
> for camera sensor drivers.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../driver-api/media/camera-sensor.rst        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index cd915ca119ea..67fe77b1edb9 100644
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

This part of the documentation applies to both raw and SoC cameras.

Should the exposure unit be something more user-friendly for SoC cameras?

We have two exposure controls now, V4L2_CID_EXPOSURE and
V4L2_CID_EXPOSURE_ABSOLUTE. The former doesn't specity a unit whereas the
latter suggests the unit of 100 µs.

As exposure is specific to cameras, I think at least a part of this should
make it to the controls documentation. The UVC, for instance, uses
EXPOSURE_ABSOLUTE.

Could we document V4L2_CID_EXPOSURE is in lines (if possible)?

> +
> +To convert lines into units of time, the total line length (visible and
> +not visible pixels) has to be divided by the pixel rate::
> +
> +        line duration = total line length / pixel rate
> +                      = (image width + horizontal blanking) / pixel rate
> +
> +Camera sensor driver should try whenever possible to distinguish between the
> +analogue and digital gain control functions. Analogue gain is a multiplication
> +factor applied to all color channels on the pixel array before they get
> +converted into the digital domain. It should be made controllable by

The analogue gain may not be linear. This depends on the sensor. I'd thus
drop the wording related to multiplication factor.

> +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> +specific gain code. Digital gain control is optional and should be exposed to
> +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> +discouraged from using ``V4L2_CID_GAIN`` as it doesn't allow differentiation of
> +analogue vs digital gain.

-- 
Kind regards,

Sakari Ailus
