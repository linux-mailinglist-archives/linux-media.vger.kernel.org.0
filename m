Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86F320FA03
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 18:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389893AbgF3Q7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 12:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgF3Q7j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 12:59:39 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB75C03E979
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 09:59:39 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so20895420wrs.11
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S5SIOLALGIZncts/DJyWGyyazBiYaPzK0cWTq20Jh4Y=;
        b=S35BdFWKkHxN1uhqpE7F6FyY6pN9PUZKZxXk+5SIcIr1h8vxrp4yNRRMHc+JwQc2Eu
         oWLIpkiX6tmQau9iPGep6rp9hf3nUOB53Ar3ePAkXzrfb76u9qqUaxFpaPysEy5dHNhj
         dqOH2suunGgPG21pkM5bXkp4GxzMYarwVuLQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S5SIOLALGIZncts/DJyWGyyazBiYaPzK0cWTq20Jh4Y=;
        b=TkCXwHmdkGqTLfktmoGqYb5ANgKTtjVnb1MzZchfRtVx+0cs3S2mcHeU1k+Dpkrj8W
         P25CfJECCTW5ER5MBBWoiNIcqcZvZDRySWqVc4386vdXmKWKWyB0kQpriQkBu15oreUa
         QspbMwInpjvDStCSpk8eGdbBfNbacvTZqeTosFJ7KUZ+sdo0VyyynmRCnD8bb6KEu8Jv
         bSvFmYWJUSMNuGWm47wfeRG4rQoB2D6hrwfWpj5qayAuGVWJV2eZL95o6NWCZf533tVg
         pzSjwiCHZHkTCpkeI9KYcy78N1YieJaj8dvX3mBnb9Et6STi2yHxovX2jJdGJ0JMkck7
         L3qQ==
X-Gm-Message-State: AOAM532Qb5Vbsdi5uABh7hwhgt8crot0921jAUVQXS047Vqupr62tilu
        PY1165M8rXlftU2Qq7ZEFDlTfg==
X-Google-Smtp-Source: ABdhPJwpJTVS7qPaQ6MQ1iEj2CZyIM1zNdxdfp4VfBreddvVoj+gOxcVmDCKJ/pcI3OpI8vIr5V84Q==
X-Received: by 2002:adf:9404:: with SMTP id 4mr21952876wrq.367.1593536378447;
        Tue, 30 Jun 2020 09:59:38 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id x7sm4316857wrr.72.2020.06.30.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 09:59:37 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:59:36 +0000
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
Subject: Re: [PATCH V11 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200630165936.GC1212092@chromium.org>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630024942.20891-2-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 30, 2020 at 10:49:41AM +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for OmniVision OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..3a916cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,172 @@
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
> +      PD_PAD pin. This pin is used to place the OV02A10 into standby mode
> +      or shutdown mode. As the line needs to be high for the powerdown mode
> +      to be active, it should be marked GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      RST_PD pin. If specified, it will be asserted during driver probe.
> +      As the line needs to be low for the reset to be active, it should be
> +      marked GPIO_ACTIVE_LOW.

I like the way the description explains this. :)

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
