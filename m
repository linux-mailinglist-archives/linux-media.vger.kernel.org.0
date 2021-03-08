Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0893315E3
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 19:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhCHSYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 13:24:08 -0500
Received: from mail-il1-f182.google.com ([209.85.166.182]:38665 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbhCHSYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 13:24:00 -0500
Received: by mail-il1-f182.google.com with SMTP id f10so9716666ilq.5;
        Mon, 08 Mar 2021 10:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PLiShrgEDa+YZGxymkcoz3r/gBAUf5KhORptv57Q7PU=;
        b=F9/tER7lF2kThk6+9NB1wOUNznPI0b2kRlUnRkiudAJZ5BBbR9aTFyvq+pwtL30ncZ
         oGKgHIkvorkKyWPFtaeTWXaR842kpv5MdlwsYEQtqw3CP+IaS90tNJr8NERKHPpqSFRT
         3PTOoSIqso9wt0WJIIf9xAIQGTwfq2usm/kSxwmS9k5+qOgqd0KHRuA+KZIMGq0G9+6t
         xt/j65lS4XLeBhIY3odzo3s93c2qsYnwueA6s9UmGuR5gFHn4Zd52dRot6PnQxMe/+DD
         vowZxSlkrJgLjO514QabmbqjCdOsSoE++8kLCz9KCqUy8aGGkKvUTpn8m81f3Vo+JoLV
         PSYw==
X-Gm-Message-State: AOAM530yxaTAsY2tgLKdo2hqjEzyFin2svWNCgoZm0y6TN9ldC96A+sE
        VmRUXLngj4OCTrHUU0IbPQ==
X-Google-Smtp-Source: ABdhPJxwGUCavMylqrxYrtCaf9JyknJB34LVNHlt+wpP3oXmyDFpN7LHxPrWUPGRxrzRYjnckByvUg==
X-Received: by 2002:a05:6e02:d53:: with SMTP id h19mr21756929ilj.157.1615227839943;
        Mon, 08 Mar 2021 10:23:59 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n7sm6636715ile.12.2021.03.08.10.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:23:59 -0800 (PST)
Received: (nullmailer pid 2741091 invoked by uid 1000);
        Mon, 08 Mar 2021 18:23:56 -0000
Date:   Mon, 8 Mar 2021 11:23:56 -0700
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Subject: Re: [PATCH v3 1/5] dt-bindings: reset: IMX8MQ VPU reset
Message-ID: <20210308182356.GB2735443@robh.at.kernel.org>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
 <20210301151754.104749-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301151754.104749-2-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 01, 2021 at 04:17:50PM +0100, Benjamin Gaignard wrote:
> Document bindings for IMX8MQ VPU reset hardware block
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../bindings/reset/fsl,imx8mq-vpu-reset.yaml  | 54 +++++++++++++++++++
>  include/dt-bindings/reset/imx8mq-vpu-reset.h  | 16 ++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
>  create mode 100644 include/dt-bindings/reset/imx8mq-vpu-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml b/Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
> new file mode 100644
> index 000000000000..00020421c0e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/fsl,imx8mq-vpu-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MQ VPU Reset Controller
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
> +
> +description: |
> +  The VPU reset controller is used to reset the video processor
> +  unit peripherals. Device nodes that need access to reset lines should
> +  specify them as a reset phandle in their corresponding node as
> +  specified in reset.txt.
> +
> +  For list of all valid reset indices see
> +    <dt-bindings/reset/imx8mq-vpu-reset.h> for i.MX8MQ.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: fsl,imx8mq-vpu-reset
> +      - const: syscon

Is there other functionality in the block? If so, add some details in 
'description' above.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3

Need to say what each clock is.

> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +
> +    vpu-reset@38320000 {

reset-controller@...

> +        compatible = "fsl,imx8mq-vpu-reset", "syscon";
> +        reg = <0x38320000 0x10000>;
> +        clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/reset/imx8mq-vpu-reset.h b/include/dt-bindings/reset/imx8mq-vpu-reset.h
> new file mode 100644
> index 000000000000..efcbe18177fe
> --- /dev/null
> +++ b/include/dt-bindings/reset/imx8mq-vpu-reset.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021, Collabora
> + *
> + * i.MX7 System Reset Controller (SRC) driver
> + *
> + * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> + */
> +
> +#ifndef DT_BINDINGS_VPU_RESET_IMX8MQ
> +#define DT_BINDINGS_VPU_RESET_IMX8MQ
> +
> +#define IMX8MQ_RESET_VPU_RESET_G1	0
> +#define IMX8MQ_RESET_VPU_RESET_G2	1
> +
> +#endif
> -- 
> 2.25.1
> 
