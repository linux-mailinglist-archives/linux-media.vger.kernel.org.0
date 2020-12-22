Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327352E0875
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 11:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgLVKAQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 05:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgLVKAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 05:00:15 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9977C06179C
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 01:59:34 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id y23so1591396wmi.1
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 01:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1uWQ1lsamrDj670psBGhqmITnRdEWIGipMAwVhvN0IQ=;
        b=nzzFQvbCE9iM4gRr0OHBQhW95iPZnUHGIevbHh6G8/1DaGIs5orfQtZMKTjTyY2zjJ
         pltvHVHec5UsnNGgJJfthUftOsewWy8YhxnXYppOWmN7Y3UqFISq3+f0ocm6pWy6s+ao
         uaRBF2vgyNBikZ7ShJgESCzRRRySZbSAjnMwIBBn8PSrZQ33zLQZUN9iSC4x/lmTq981
         FJ2Ly2VqTgTlLk7P1ecU0mMa6SWh/a/ZrKv1GDXYGD51DpKiA1XsULU+2oq9wzAV5jgw
         +k0KhDI7UdHfo056NDutP99ttFQbtHZfAKQ81sHnq9JXVyK6fylkzXtS8AJ7ez5tMlJX
         s4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1uWQ1lsamrDj670psBGhqmITnRdEWIGipMAwVhvN0IQ=;
        b=FQhSti0ZPflvLCTcFP2A8qHMqggVrHikZSNfTbsR7dFVxiy8ylHXYrHyeR8g26MpQe
         ICX/Cz6rmBj7rKRac829nvaqAQCUPc3+o+7EfYEM+2BMqbQtXbYROtOy+AkJvtUlbpHt
         +AJ6jjZhUaGq3NrZSLpuLLUMOruDmSUmDul9jjtzswNWf0eHcorHTK1eOlcj0m6z9AM0
         PZgcRZqkS5jMh3M2n6HnKVSoth9k/WcJnMhMhcaUP4dYsps0l6UKv+yCppNrF63/hhvU
         cqDpxNm2QAtQk9dkkIaL6H+u1mWFeUQvSxmc9EBZN7yRSRaeitq9HRaWwWnLrCvKIjpC
         VhSw==
X-Gm-Message-State: AOAM530aG8z/lxkStDl81fwsuNQeonJEFAZqBvfTOHnAZ/+5fz1W4G0N
        PDvVlOiiIJqrL3XeH6ECVWNwYQ==
X-Google-Smtp-Source: ABdhPJyryip6dXlJcoBpock1PWleQBmbQZcocbzF4ei8MZdMG4Bgcp5A9SM4uCOXJeAM5U9qRO3loQ==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr21458882wmb.98.1608631173322;
        Tue, 22 Dec 2020 01:59:33 -0800 (PST)
Received: from dell ([91.110.221.175])
        by smtp.gmail.com with ESMTPSA id a65sm26056927wmc.35.2020.12.22.01.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:59:32 -0800 (PST)
Date:   Tue, 22 Dec 2020 09:58:23 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop unnecessary *-supply schemas properties
Message-ID: <20201222095651.GD53991@dell>
References: <20201221234659.824881-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201221234659.824881-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Dec 2020, Rob Herring wrote:

> *-supply properties are always a single phandle, so binding schemas
> don't need a type $ref nor 'maxItems'.
> 
> A meta-schema check for this is pending once these existing cases are
> fixed.
> 
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/anx6345.yaml | 2 --
>  .../devicetree/bindings/display/bridge/ite,it6505.yaml        | 2 --
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml        | 3 +--
>  Documentation/devicetree/bindings/display/bridge/ps8640.yaml  | 2 --
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml     | 1 -
>  .../bindings/display/bridge/thine,thc63lvd1024.yaml           | 1 -
>  .../devicetree/bindings/display/bridge/toshiba,tc358775.yaml  | 2 --
>  Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml   | 4 +---
>  .../devicetree/bindings/iio/humidity/ti,hdc2010.yaml          | 3 +--
>  .../devicetree/bindings/input/fsl,mpr121-touchkey.yaml        | 3 +--
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml     | 3 +--
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml          | 1 -
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml     | 3 ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml  | 3 ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml  | 3 ---
>  Documentation/devicetree/bindings/mfd/st,stmfx.yaml           | 3 +--

Acked-by: Lee Jones <lee.jones@linaro.org>

>  .../devicetree/bindings/regulator/anatop-regulator.yaml       | 1 -
>  17 files changed, 6 insertions(+), 34 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
