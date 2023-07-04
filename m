Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A90747354
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 15:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjGDNvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 09:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbjGDNvt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 09:51:49 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78298DA
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 06:51:48 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b6a16254a4so84354031fa.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688478706; x=1691070706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zH3CH+DM3qfo1yN+y42L63tXWCPurSgrmHhOX1fkuxk=;
        b=D1L/FDKHi/9x9KFk5ZSu1I4IGhd1ZvgZjS0y9ghljE9g7kvygHOYdZZSWW0j26+yR9
         juWGSKJoRqG4mmlBwezl1IysI7umjsGWsqpK+p7yz1nKT7DI6CHuSubJaezz9Jeizb1P
         ZHEM6p8vYlSp+Mz2pa2Av1jrE65oZ77RkgTk3Z6G0KAPy3DndyGmo+tkm4dc8+FrbIPe
         YwWzRw3WcidAcwwzGyCAlYzK6JdKSiMxKd1b1ACkb+hPVZf6bcCjYr0olAH2mXOZFKkP
         +6GH8PQrWRU/x5OlrYBNmJFD+6ugolzsX1vG5Gh4BYIH0xVyqXZaSmh0cEzSDK9mvqgW
         TrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688478706; x=1691070706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH3CH+DM3qfo1yN+y42L63tXWCPurSgrmHhOX1fkuxk=;
        b=XiDRYaYoAnjdx6EZ6rgswdmomRerrGJEX5fgA85D3NCXwfG4vDoZ2PNFsVkLUQoQHm
         m81Cx6e94Jie5YjdXsIrAo9cQSfokQsf+sbPwzV1zM11Y1T9qTIpUSHTfk5C+z5tBxGI
         O8gqAt+WcxknAsbV49hLtxum4DHIp5bPaPEqQu6ybmGLrucf/nxydECFFjl/Sb51yNlS
         ft9XwJ3/W4S7t7TsXCkbeeGWUvKJjYAOKsSGLOIUU/CJzVVeQFiOpycIw5N862L+78lK
         jSdZLdHkQKBIy8ueXWPphwRZVLWm8VS6A7OkiC2HWmw4x74MJKii4pURGcnKGCqOfoKG
         I2HQ==
X-Gm-Message-State: ABy/qLZX1KgDjuvK/I6Wfexg8Fp0xp5Y7bMTsLYTKLMPmuETdVzN3ZRz
        pmYPGS6/iBmjwB6/kjP8KXo=
X-Google-Smtp-Source: APBJJlEIHyz7LNTgVyQhBVkEpjCC0IrynZQcUyLXNxfQN6pUvfZvg0b48pAuYN01QQ0j1aRt71qQfw==
X-Received: by 2002:a2e:980c:0:b0:2b4:8168:2050 with SMTP id a12-20020a2e980c000000b002b481682050mr9056846ljj.29.1688478706297;
        Tue, 04 Jul 2023 06:51:46 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-106.cust.vodafonedsl.it. [188.217.59.106])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906971300b009929c09abdfsm7669170ejx.70.2023.07.04.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 06:51:45 -0700 (PDT)
Date:   Tue, 4 Jul 2023 15:51:43 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
Message-ID: <ZKQj78i94MecEfDe@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Jul 03, 2023 at 10:29:10PM +0200, Jacopo Mondi wrote:
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
> +and gain should do so by exposing dedicated controls to applications.
> +
> +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> +The control definition does not specify a unit to allow maximum flexibility
> +for multiple device types, but when used for camera sensor driver it should be

> +expressed in unit of lines whenever possible.

Same comment here. 

Can you add formula/references about this point I think you are referring on "tline" units (maybe I'm completely wrong :) ),
but to be honest checking also the some sensors datasheet I don't find to much infos about this units.
Would be really helpfull to add some details on this point.

> +
> +Camera sensor driver should try whenever possible to distinguish between the
> +analogue and digital gain control functions. Analogue gain is a multiplier
> +factor applied to all color channels on the pixel array before they get
> +converted in the digital domain. It should be be made controllable by
> +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> +specific gain code. Digital gain control is optional and should be exposed to
> +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> -- 

This part looks good to me.

Thanks,
Tommaso

> 2.40.1
> 
