Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73BCC8E67C
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 10:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbfHOIey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 04:34:54 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41915 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730446AbfHOIey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 04:34:54 -0400
Received: by mail-ed1-f65.google.com with SMTP id w5so1483341edl.8;
        Thu, 15 Aug 2019 01:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbUMFR/CGCvpvCBVKVjJLXYqx2oevZB4Y5/vjWqmzQw=;
        b=ClOS2ipbEB+BwTSXgiel/UQhS35PPA33EBkJRESWZXGUmxdDljMM0aMvMJUiemp8HV
         XoL2/PBY1cD8Ue+xuBasECDZh3XN3Z1sQAtZ3SaIqygJncYtJHMI1ung5BuJR5egXDrr
         nKH3o1dENZaMV1h8oWxbCi/TClQC67wh+MeR0JniiNpAJGzKlDcfasm5+t+/ZxPu8qlu
         t165EtpIp6mLLux3+7TrbohDeZEFXnk+5n/+RxdBIxm7RRBQsEiAyx2ytaEmgeMXpZJj
         gcT3EMqKKARFmWJ+py9KJu3W1ltda4ksrfJ/Sb+/Jn4wQIaw+nHONtL4lesz9mId0JIg
         sxHg==
X-Gm-Message-State: APjAAAXIDqxB83qyHNtFzNf2SWwNCEMVabB84Ak75riljSpcKWH+JtGQ
        4Qyq2OSWRhKH/jhMO00TtuTWqRcjWbI=
X-Google-Smtp-Source: APXvYqy7G4oef9WoXphmBEE3/xoJrrO7iqEKDk+b5UCXVnZ7s5WTlHiD5+7QBc5JKT6ssRicW2bKEQ==
X-Received: by 2002:a17:906:5391:: with SMTP id g17mr3373734ejo.61.1565858091147;
        Thu, 15 Aug 2019 01:34:51 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id nw21sm284206ejb.15.2019.08.15.01.34.50
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 01:34:50 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 207so623942wma.1;
        Thu, 15 Aug 2019 01:34:50 -0700 (PDT)
X-Received: by 2002:a05:600c:292:: with SMTP id 18mr1600234wmk.51.1565858090304;
 Thu, 15 Aug 2019 01:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.34bcd988943a26671681eaf849aacab51fab1cfe.1562847292.git-series.maxime.ripard@bootlin.com>
 <110dd9ff1784c29fa16304825a41d1603a33f166.1562847292.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <110dd9ff1784c29fa16304825a41d1603a33f166.1562847292.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 15 Aug 2019 16:34:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v64nx2AuWZN+RxCneE0pqvXr_d7u6mQ+=nCHv2VJ1MNtrQ@mail.gmail.com>
Message-ID: <CAGb2v64nx2AuWZN+RxCneE0pqvXr_d7u6mQ+=nCHv2VJ1MNtrQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Sorry for chiming in so late.

On Thu, Jul 11, 2019 at 8:15 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> used in later (A10s, A13, A20, R8 and GR8) SoCs.
>
> On some SoCs, like the A10, there's multiple instances of that controller,
> with one instance supporting more channels and having an ISP.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> new file mode 100644
> index 000000000000..97c9fc3b5050
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +description: |-
> +  The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
> +  frames from a parallel or BT656 sensor.
> +
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - allwinner,sun7i-a20-csi0
> +          - const: allwinner,sun4i-a10-csi0

CSI0 on the A10 has an ISP. Do we know if the one in the A20 does
as well? It certainly doesn't say so in the user manual. If not,
then we can't claim that A20 CSI0 is compatible with A10 CSI0.

> +
> +      - items:
> +          - const: allwinner,sun4i-a10-csi0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The CSI interface clock
> +      - description: The CSI module clock
> +      - description: The CSI ISP clock
> +      - description: The CSI DRAM clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod

I doubt this actually is a module clock. Based on the usage in your
device tree patch, and the csi driver in the old linux-sunxi kernel,
the clock rate is set to 24 MHz, or whatever the sensor requires for
MCLK.

ChenYu

> +      - const: isp
> +      - const: ram
> +
> +  resets:
> +    description: The reset line driver this IP
> +    maxItems: 1
> +
> +  pinctrl-0:
> +    minItems: 1
> +
> +  pinctrl-names:
> +    const: default
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        properties:
> +          bus-width:
> +            const: 8
> +            description: Number of data lines actively used.
> +
> +          data-active: true
> +          hsync-active: true
> +          pclk-sample: true
> +          remote-endpoint: true
> +          vsync-active: true
> +
> +        required:
> +          - bus-width
> +          - data-active
> +          - hsync-active
> +          - pclk-sample
> +          - remote-endpoint
> +          - vsync-active
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +...
> --
> git-series 0.9.1
