Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46482747203
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 14:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjGDM6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 08:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjGDM6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 08:58:55 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7320F10D0
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 05:58:53 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-440ad576d87so1807645137.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688475532; x=1691067532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zVfYTGpiXVn9ZbZMWSCGB4PnJdTdMsSHihBjew+DAug=;
        b=QI73vCobqsCwFHhbxIAGMreHSH6InBUC5LAkkV1lW2/fvBnXn6+OqkgAXhtY7Nm1w6
         b/5asxjhurXVQOeaSdAk33eBBwzLhYOY0s2lxrV4yTqGUvAzH4ijhnP+Amee7RtX2S15
         mXytCanwh3gbYcUfQ67b3i5w+BJOFjIl16gW5hSt2u017pKL32EbOo72K6JQE0tl6hRS
         pTL9BgJ896A52UagsrmI/NqsjpWsqhakOJiOtva7IEh4URVmU/gVNBsQKOcdYB3rFp7N
         s+ml1YqIR3tRm7RS/k8SUt6HktM8v1rguEX46u4a8SsSp66agnLip1dZ93fyAXlNQk3E
         FqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688475532; x=1691067532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVfYTGpiXVn9ZbZMWSCGB4PnJdTdMsSHihBjew+DAug=;
        b=KmiQGr3D9wpp+FhBJS5sI9p19JBemwzxYfagQbOrD1RfdSgADYnP/sG4Id1gkgozVm
         kZ/spbZrrKlemOfJYV7ftfOuedsHU+6sErvhi60uN7QJXSyQBihiysGN0moRacnqzUH3
         lxcLDsaLrKl5Sp+p1nQcO6ZstV9fy8IRW2+16m+1OY3Raq1q4rJIR8CSpsPRYp0M1/W+
         /ALWOsRLGz9TjUoZ6gplpeTAub1DVEqbsjwzUeZNZmcMdcBrGQIOpHrKrd/mVWaWHbr7
         z1faMKnPJ3KDnkeWfAkeKyxhYBhVAuE6TbrsECij+YNgDVh37Ar1yPagACgFny79U2o8
         KL9A==
X-Gm-Message-State: ABy/qLbQotvA3Qm0AXb48dF/LNv0MSYEDmKoCl2cNjvhLx7CmrfLBtT/
        qyY6w+6vBRB/XS/dc2gd1S3GsNK6ivm7X0qf34f+GYFpGPD4yKgk
X-Google-Smtp-Source: APBJJlEKzh07VwU63FdkqfHEUH2pTPf+biccOCqbhFmMzL0SbKmTZL22QGx21Wl/EIiWZwW8iJ2655TfStzogJ2Qnno=
X-Received: by 2002:a05:6102:97:b0:444:59e2:f700 with SMTP id
 t23-20020a056102009700b0044459e2f700mr6503028vsp.7.1688475532596; Tue, 04 Jul
 2023 05:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230704123819.156418-1-jacopo.mondi@ideasonboard.com> <20230704123819.156418-2-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230704123819.156418-2-jacopo.mondi@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 13:58:37 +0100
Message-ID: <CAPY8ntD+bK1Djn1DULQKe=oVyOmAhx_t=QK1cgyC3jpPL5Pqnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Documentation: v4l: Flip handling for RAW sensors
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
> index 93f4f2536c25..7516d61a903d 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -173,3 +173,19 @@ V4L2_CID_VFLIP controls with the values programmed by the register sequences.
>  The default values of these controls shall be 0 (disabled). Especially these
>  controls shall not be inverted, independently of the sensor's mounting
>  rotation.
> +
> +Flip handling for raw camera color sensors
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Applying vertical and horizontal flips on raw camera sensors inverts the color
> +sample reading direction on the sensor's pixel array. This may cause the
> +re-ordering of the color samples on the sensor's output frame. As an example, a
> +raw camera sensor with a Bayer pattern color filter array with a native RGGB
> +Bayer order will produce frames with GRBG component ordering when an horizontal
> +flip is applied. Camera sensor drivers where inverting the reading order
> +direction causes a re-ordering of the color components are requested to register

requested or required?

I'm not that fussed either way, just down to how strict you want the spec to be.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> +the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> +``V4L2_CTRL_FLAG_MODIFY_LAYOUT`` flag enabled to notify userspace that enabling
> +a flip can potentially change the output buffer content layout. Flips should
> +also be taken into account when enumerating and handling media bus formats
> +on the camera sensor source pads.
> --
> 2.40.1
>
