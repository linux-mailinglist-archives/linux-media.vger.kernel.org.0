Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D6063FBD7
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 00:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbiLAXTk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Dec 2022 18:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbiLAXTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Dec 2022 18:19:39 -0500
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCCFC4616;
        Thu,  1 Dec 2022 15:19:38 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id c129so3761371oia.0;
        Thu, 01 Dec 2022 15:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GnbnfIwAM1UBElWd+eLU8pdL/dphftoMctGcclLKzw=;
        b=ql6/LVu35Dd0H75HRLOnHN9A3ArImHTH5LbAUl31TZDEfLTQ4CwxV+LEb7e335p7/x
         qSFmyut0mSpw3MhZltNW0gX0Oletc6VH5VzcqYXThn8caiEwZM1vIy9z2aUK3Srte3I9
         I4xlqccTHz8Ate9nqR3V7MYwaewG2uDULUkI+ugjqdo3/d/oVym6CboFSJri7sZRzGjB
         LcUZIrp0UcLAELh7a2eJEkxVALbXN5gOpavDf0kRMNERpS4XV4Mya8ybhbv6ExpwoEhT
         qDjMMnrnL9LnbgEKaju62NW8kZN8oFIRvX1BrnCWvt1xxyS3WCQ9pESWn1qphbEnhocQ
         iWcg==
X-Gm-Message-State: ANoB5pkF1RmCjEqD9rpKJIVMMgs/Lxzek8Za0ZEICr9pRYpWXus4sKCQ
        Jn0uYBldTxkPjDQTHcUBcw==
X-Google-Smtp-Source: AA0mqf6LUacexCNxfUGxQ17BkFB08L9QiNMNHe0Eg9i7cd8dUW4mlTa6hPo0iYXWKDpyFut5cKRJHA==
X-Received: by 2002:a05:6808:2188:b0:35b:d987:bcf5 with SMTP id be8-20020a056808218800b0035bd987bcf5mr4203652oib.101.1669936777539;
        Thu, 01 Dec 2022 15:19:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 124-20020a4a0d82000000b0049fcedf1899sm2296342oob.3.2022.12.01.15.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:19:36 -0800 (PST)
Received: (nullmailer pid 1667342 invoked by uid 1000);
        Thu, 01 Dec 2022 23:19:36 -0000
Date:   Thu, 1 Dec 2022 17:19:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH v2 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Message-ID: <20221201231936.GB1660613-robh@kernel.org>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-2-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128152336.133953-2-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 28, 2022 at 04:23:16PM +0100, Luca Ceresoli wrote:
> VIP is the parallel video capture component within the video input
> subsystem of Tegra20 (and other Tegra chips, apparently).
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
> - remove redundant "bindings" from subject line
> - remove $nodename
> - add channel@0 description
> - add reg: const: 0
> ---
>  .../display/tegra/nvidia,tegra20-vip.yaml     | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> new file mode 100644
> index 000000000000..44be2e16c9b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra VIP (parallel video capture) controller
> +
> +maintainers:
> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-vip
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  channel@0:

Kind of odd there is only 1 channel with a unit-address. Are more 
channels coming? Please make the binding as complete as possible even if 
no driver support yet.


> +    description: parallel video capture interface for the VI
> +    type: object
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              Port receiving the video stream from the sensor
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              Port sending the video stream to the VI
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    additionalProperties: false

A bit easier to read the indented cases if this is above 'properties'.

> +
> +    required:
> +      - reg
> +      - ports
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - channel@0
> +
> +# see nvidia,tegra20-vi.yaml for an example
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69565ac0c224..92c762f85f17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20315,6 +20315,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>  F:	drivers/staging/media/tegra-video/
>  
> +TEGRA VIDEO DRIVER FOR TEGRA20 VIP (PARALLEL VIDEO CAPTURE)
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> +L:	linux-media@vger.kernel.org
> +L:	linux-tegra@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> +
>  TEGRA XUSB PADCTL DRIVER
>  M:	JC Kuo <jckuo@nvidia.com>
>  S:	Supported
> -- 
> 2.34.1
> 
> 
