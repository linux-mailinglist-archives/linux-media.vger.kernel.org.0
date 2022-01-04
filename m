Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91B648412F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 12:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbiADLtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 06:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbiADLtj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 06:49:39 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A6CC061784
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 03:49:37 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j18so75630663wrd.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jan 2022 03:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PiTilpP3Bz7ZjAJItTFQ1+Dz34boNVjYl6oKFRhtc0Q=;
        b=cOMhcn1J5UlEZAXKJ/boZKiXhSdYW0iQdmir3Lf7e0SFW9q/l+RopOiaiLZ/S0Alxs
         gEf633aU3NlLjANWptKdh4co9gtW5bF+hEjxr7b/A9+qun1msWjq4PeGV2Wpr5Yw83mP
         3dXiGu4MIgvfFTLT5oQsPtt3H1t+J6qvx07neFri5llTtxTZvWUQC7Y+nlFp1FjsOAYd
         STouFIXVzVy+PyihnanDhLKrpte0VGecj5I9mst+uIx7x20aGroXzQS3XAik6pZlS7jC
         NTrezHR88ebJQRr5Yzt2Qs1YoGPBInj/oRHX3gdepplon5JQqrjw510KCaQ+v7g99dCq
         Mhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PiTilpP3Bz7ZjAJItTFQ1+Dz34boNVjYl6oKFRhtc0Q=;
        b=7I4WOkQQH9mMXDQdx7g3RNiq4vZv8S+hchse7KTdIengnMinjnZ5CDybuuX2ukBtRn
         StnAwEv40P8oCw9NUfcyK/U/wuqlfxARgIynzOw/PWPhFQvVzkso0Xmne+eBOaE7rzAL
         659ar2HEjen2OORbG2cUYNyXugZOhJieaZvJaSfgGuW+RhQfHWrvoHipZfBw57Y/tl0k
         p5pBgWzN8UZB/ixXUDOghdHs4e295qY844KeAWEqod7m30eOjnoI8GjrgA0jxTjsp4wk
         Ib2dprQUrGlahQ8TeVWS7UjWH5G4xT45PAtvkUkcYVf/4yA+tinuirNYeLJmv+yL+H3h
         LOAQ==
X-Gm-Message-State: AOAM533kaV7zB2dknqB1tfUccc4VfouzrZMuzTesKdof/9DBDAIwYfub
        Xp0RD4PIq7FT+gbCyMSlW8mqHRjPx5K8SE8BNcLj4A==
X-Google-Smtp-Source: ABdhPJyzYo76mmymNn/EFfKFV7mnbuF4LgFaafKZxybUkpDr4UVPBcKKdYvt9QGRf/C/CTigqQ5SvaZ4CjZx+Ig5Kn0=
X-Received: by 2002:a5d:58f6:: with SMTP id f22mr41092618wrd.638.1641296976219;
 Tue, 04 Jan 2022 03:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20220103174106.907-1-macroalpha82@gmail.com> <20220103174106.907-6-macroalpha82@gmail.com>
In-Reply-To: <20220103174106.907-6-macroalpha82@gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jan 2022 11:49:23 +0000
Message-ID: <CAPY8ntARq9_2=mLRhG2eKR2Dt-y4xT5uKs+nKznBxOyiW37-Ag@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/vc4: dpi: Support DPI interface in mode3 for RGB565
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eric Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chris

Thanks for the patch.

On Mon, 3 Jan 2022 at 17:41, Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add support for the VC4 DPI driver to utilize DPI mode 3. This is
> defined here as xxxRRRRRxxGGGGGGxxxBBBBB:
>
> https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#parallel-display-interface-dpi
>
> This mode is required to use the Geekworm MZP280 DPI display.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

The other patches all look valid to me, but I'll leave those for the
more experienced maintainers.

  Dave

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index c180eb60bee8..3c58ade2549e 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -173,6 +173,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>                         dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
>                                                DPI_FORMAT);
>                         break;
> +               case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
> +                       dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
> +                                              DPI_FORMAT);
> +                       break;
>                 default:
>                         DRM_ERROR("Unknown media bus format %d\n", bus_format);
>                         break;
> --
> 2.25.1
>
