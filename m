Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD87F784862
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 19:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjHVR11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 13:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjHVR1Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 13:27:25 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC1359AE2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 10:27:23 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-48d10c504a8so841338e0c.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692725242; x=1693330042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SU/uCgxrgoRCkEjuffBjFi03auvZp/cwtq4UFkfJvME=;
        b=WCnKUrErjMNOFBkqfPUm2UPJ9GHFfNm6o9waVFEKUtNcFxJATPL4FK7Fp6+3v1PL/Z
         f+CDylbfC7YRrhYzeHGtOOBWxjaG2dOuvwdkD0vPGou1M1OiswWf/bDR80fygtdFfV+A
         R2fHqF4zfAPNyR0yMn1eSgAyGIJYKzyDshG3HwlpkP5fP689Nzbd4EjAXrxENwIAGK2m
         5JlHtVQzO+JlnKB7HzeCcaDBv7wi1TqGBPdq4uDM4Nn97B2xSfD1sbn2dftmNukGq8h6
         e6QAIRpxQPOb4aSUCcOfaq5+NgBSz0XiUr37/PFlh+gSOgrAireCtRowwEYcHPyVsems
         LNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692725242; x=1693330042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SU/uCgxrgoRCkEjuffBjFi03auvZp/cwtq4UFkfJvME=;
        b=d2UKvxGuqBGaoSxXN8Dvv03dihFrPF/2+VxtEmBfQzCIlz0JP4Yb+vGoKpt44bu8gS
         c6Mnv34ZH1zRE/AMTYrEq8+HOV8YU831W7EWJl79GzH4p0lUK44eH2v2XeOzkn/1RUaD
         hj+Teuwj9OVeZ8OlvP2yGFmcqFgbxn6cIJdyTIfYrPrO92ceTP/Mj4NnRP0NDxCf0XVn
         SnDZ+h8Vqwq1R1XfsAuzU+r/0leXp74ENR+EnVU3S/unzqLTSYkm1MTlZ+GBnnGjcjhM
         q8/VJ8zoNGC3AjGh3V8CKFO47dVa7A99Gbxb3SQbCY7jHXhYGZ7O+MAJdXLe6R3lFxW+
         0gEA==
X-Gm-Message-State: AOJu0YymlU6i9luCmEDc+6dwgnFKYaWKqzVfeOIYWtBzAzmtC5RPLzJk
        xzmkKtlxbgCwaZJnui6Evzr6DVnEIRlKix2z+iVZvQ==
X-Google-Smtp-Source: AGHT+IGiq+mEzhjgysrmSFvMEsCJnHPf6pM4MO/HFCh63kVjgTzfVJSF77fRNwlM/ruFVWFxtkqG0jeHPGGMpcZ0BGI=
X-Received: by 2002:a05:6122:320c:b0:48d:eaa:45cf with SMTP id
 ci12-20020a056122320c00b0048d0eaa45cfmr6755640vkb.1.1692725242653; Tue, 22
 Aug 2023 10:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-13-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-13-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 18:27:06 +0100
Message-ID: <CAPY8ntC1d8U7Obx6643Xm+LyXNVFaQ5xcitNZpd5fnffK7Sgtw@mail.gmail.com>
Subject: Re: [PATCH v2 12/18] media: i2c: imx219: Drop IMX219_VTS_* macros
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

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The IMX219_VTS_* macros define default VTS values for the modes
> supported by the driver. They are used in a single place, and hinder
> readability compared to using the value directly as a decimal number.
> Drop them.

Personally I don't see it as a huge hindrance to readability, but it's
not that significant either way.

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 67a30dc39641..165c5e8473f7 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -71,10 +71,6 @@
>
>  /* V_TIMING internal */
>  #define IMX219_REG_VTS                 CCI_REG16(0x0160)
> -#define IMX219_VTS_15FPS               0x0dc6
> -#define IMX219_VTS_30FPS_1080P         0x06e3
> -#define IMX219_VTS_30FPS_BINNED                0x06e3
> -#define IMX219_VTS_30FPS_640x480       0x06e3
>  #define IMX219_VTS_MAX                 0xffff
>
>  #define IMX219_VBLANK_MIN              4
> @@ -302,7 +298,7 @@ static const struct imx219_mode supported_modes[] = {
>                         .width = 3280,
>                         .height = 2464
>                 },
> -               .vts_def = IMX219_VTS_15FPS,
> +               .vts_def = 3526,
>         },
>         {
>                 /* 1080P 30fps cropped */
> @@ -314,7 +310,7 @@ static const struct imx219_mode supported_modes[] = {
>                         .width = 1920,
>                         .height = 1080
>                 },
> -               .vts_def = IMX219_VTS_30FPS_1080P,
> +               .vts_def = 1763,
>         },
>         {
>                 /* 2x2 binned 30fps mode */
> @@ -326,7 +322,7 @@ static const struct imx219_mode supported_modes[] = {
>                         .width = 3280,
>                         .height = 2464
>                 },
> -               .vts_def = IMX219_VTS_30FPS_BINNED,
> +               .vts_def = 1763,
>         },
>         {
>                 /* 640x480 30fps mode */
> @@ -338,7 +334,7 @@ static const struct imx219_mode supported_modes[] = {
>                         .width = 1280,
>                         .height = 960
>                 },
> -               .vts_def = IMX219_VTS_30FPS_640x480,
> +               .vts_def = 1763,
>         },
>  };
>
> --
> Regards,
>
> Laurent Pinchart
>
