Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F27746E16
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 11:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjGDJ6a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 05:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbjGDJ63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 05:58:29 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A4AE9
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 02:58:27 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7656652da3cso456865185a.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688464706; x=1691056706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wHCMRKfe3LQ2erqyd+8zsUh201HN65kvgaq0Qf2+R/M=;
        b=OzjaPqQG5QcMsRldZQfDp3qwhr0qFzS+OVIiavVe1Ud4Q/MM2+ZZSR/dZjLMDLTlUE
         l1r3EhGXYony/TMX+m7H2RvkhSvGa/hpVTs9NTvuh5V6/nzBkU+74kc3y5Rl+mRI67Fp
         6ymNHQh7Q4pGgEY16cbXjTLu50ZfHrqvUoDUCEJr7zRj5vPkeif9xOALENgOT/YYtNRc
         /cdP0Jwb5fOt9iyZK7bxWeT8WCfKxp1Q6Qa1p1W4BvSHCpnj7Tdl6ZpbB/nF+vN1rMLy
         5h2z5YQ16BoNYkGFTBKyuBLen5hbOSWB7GywB5FvFR2JnCHxxQsqbfk2MfUsRAXDyFP3
         UTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688464706; x=1691056706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHCMRKfe3LQ2erqyd+8zsUh201HN65kvgaq0Qf2+R/M=;
        b=E1IjhsqrcNQZP3YLt0aWooD3RESWWG+1iD+SlWw3Xwgc1SZvGyyufyQe/ZcoPqZ1Iq
         B4C+xYDkxOPxkg27fY+k2s/UaHcqlms6GXfPxreTiR05ZEv/zTpp3t7JG7yoVfKBUDrT
         ujd4hlk7rkTdEppoMadyUG2I0EOb4mkfdvC/K0fFQzGgDyVRueks9HoY4TxwuzMxxog8
         Ir08dNpxiOlo3Onb+Af7CwMYhZvTCBtgmqwCC0NXOhZeX92CJBVzRXkRHZomB7h5gDOu
         rcb7ZJzp0eoe41f5WvrMqMdjVQBzbAgQU8f9g4MzIe8PhsW2n2kH72ZitoAr10KToWjN
         JDMQ==
X-Gm-Message-State: AC+VfDy1S6NChUu4O1Vd2ExEp11NLvfvxlPP+v2mTzFAWvqsyjhfJMmB
        Iun+xptLNMRPnHZnrnM5OllPg4BPxDMTvXPLBDcvdmSCxTfgj3ecz/U=
X-Google-Smtp-Source: ACHHUZ7hDgDPNL3fgYZ+yX2EOB8ORSMyNcZY0sl2V9gUCXuClTgmAPtHrWnzP+PYRzm8pTsvysbuMZxfBpvQiplPNkA=
X-Received: by 2002:a05:620a:454a:b0:767:117c:f57b with SMTP id
 u10-20020a05620a454a00b00767117cf57bmr17523929qkp.8.1688464706598; Tue, 04
 Jul 2023 02:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com> <20230703202910.31142-2-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230703202910.31142-2-jacopo.mondi@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 10:58:11 +0100
Message-ID: <CAPY8ntAqOtabsfju53cmcZoogL67N=a2YYy_-yG8j7D87yKZKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: v4l: Flip handling for RAW sensors
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

Thanks for adding documentation.
Sorry I couldn't be at your presentation, but I'll find the slides
(and recording if there is one).

On Mon, 3 Jul 2023 at 21:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Document the requirement of notifying to userspace the possible
> re-ordering of the color sample components when a vertical or horizontal
> flip is applied to a RAW camera sensor.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index 93f4f2536c25..ee4a7fe5f72a 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -173,3 +173,19 @@ V4L2_CID_VFLIP controls with the values programmed by the register sequences.
>  The default values of these controls shall be 0 (disabled). Especially these
>  controls shall not be inverted, independently of the sensor's mounting
>  rotation.
> +
> +Flip handling for raw camera sensors
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Possibly "for colour raw camera sensors".
Mono sensors are still raw in that they need processing for black
level, lens shading, etc, but they won't change the colour ordering.

> +
> +Applying vertical and horizontal flips on raw camera sensors inverts the color
> +sample reading direction on the sensor's pixel array. This causes the
> +re-ordering of the color samples on the sensor's output frame.

This *may* cause the re-ordering....

Not all sensors do. Some shift the readout by one line/column to keep
the Bayer order the same, and technically should update the selection.
OnSemi sensors in particular seem to do this, as do the Sony
IMX327/290/462 family.

> As an example, a
> +raw camera sensor with a Bayer pattern color filter array and a native RGGB
> +Bayer order will produce frames with GRBG component ordering when a vertical
> +flip is applied.

Vertical flip of RGGB would be GBRG as the RG and GB get swapped, not
GRBG (which would be horizontal flip).

  Dave

> Camera sensor drivers where inverting the reading order
> +direction causes a re-ordering of the color components are requested to register
> +the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> +``V4L2_CTRL_FLAG_MODIFY_LAYOUT`` flag enabled to notify userspace that enabling
> +a flip can potentially change the output buffer content layout. Flips should
> +also be taken into account when enumerating and handling media bus formats
> +on the camera sensor source pads.
> --
> 2.40.1
>
