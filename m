Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9F91FFB99
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 21:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgFRTNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 15:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgFRTNf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 15:13:35 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E225C0613ED
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 12:13:35 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so7218160wru.12
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w7ZzXm/x+S62UOvstcWj82fQZcaPM3JUhZPhHBThmZ4=;
        b=NOqFUseguuK/Se1yoTOh2UdWZ9pNBrt038Sywj2oS41eFLmh/U6q43aGTEoQP5jOql
         sC+rNNPymdYDagtcgW8Y/+zDQGn6GPvI4pz7is5d9yhUOPzoyTqL6h6Jd2iwePLK07fO
         vORkEN6nVqoAZC94xtTGOWGd4shaO6h7XUJ/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w7ZzXm/x+S62UOvstcWj82fQZcaPM3JUhZPhHBThmZ4=;
        b=Zm3k5TKuK9EqCiwHsHr7I2nfqVtnqhd/Ggn0s2CX/NgkSYESg1jMvhCRXZFRR/IV8t
         g2XvAHjcNinzY2OIZwkM3BNp6zvdG8rp1qV8lS6ix7FfvcYQ9WReAm3jeo1tDjGNFM04
         UGypx+iSMnUtnbWW2EmgoayepVR/FpzIqzPpVr2IHFo4r+InI97yIVZHhcREizCES7jq
         tVO6XLtSpiDooJ+hW7Vmb5A/FnhPwFQRzOJ+cuDAGERh4Fm1f5cVPz2MexT1zCyWCaeK
         ebcujRQ9obyeXkzT6v+MNHUv/BjbRtdZG5E+2GtxJeYDnS166Ey8CstdkCpUL3Q63Ay6
         Herw==
X-Gm-Message-State: AOAM531ZI0ph97JPDo0Hukf3j1rzGOzdtAIUAU15gkmQTvrzeO+VRurn
        mS6zJxCZVElud3E6sVbR5XbqzA==
X-Google-Smtp-Source: ABdhPJxtePe8jNlcaDRZzkkWVLDnXp0YbUZHYQvnIoze3BeG8wHZ2ELCeZY2CEokFez7hj9uD7wdOA==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr2615574wru.399.1592507613955;
        Thu, 18 Jun 2020 12:13:33 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id s2sm4333182wmh.15.2020.06.18.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 12:13:33 -0700 (PDT)
Date:   Thu, 18 Jun 2020 19:13:32 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V10 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200618191332.GB73379@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615122937.18965-2-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Mon, Jun 15, 2020 at 08:29:36PM +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for Omnivision OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 171 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..f84be1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,171 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> +
> +description: |-
> +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> +  image sensor, which is the latest production derived from Omnivision's CMOS
> +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> +  sensor output is available via CSI-2 serial data output.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov02a10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: top mux camtg clock
> +      - description: divider clock
> +
> +  clock-names:
> +    items:
> +      - const: eclk
> +      - const: freq_mux
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hertz.
> +
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as Digital I/O voltage supply.
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as Analog voltage supply.
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as Digital core voltage supply.
> +
> +  powerdown-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
> +      or Shutdown mode. As the line is active low, it should be
> +      marked GPIO_ACTIVE_LOW.

This line is not active low. It needs to be high for the powerdown mode
to be active.

> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      RST_PD pin. If specified, it will be asserted during driver probe.
> +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.

This line is not active high. It needs to be low for the reset to be
active.

Best regards,
Tomasz
