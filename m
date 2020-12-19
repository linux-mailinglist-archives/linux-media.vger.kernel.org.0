Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF46E2DEE49
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 11:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgLSK6G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 05:58:06 -0500
Received: from mail-ej1-f53.google.com ([209.85.218.53]:34661 "EHLO
        mail-ej1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgLSK6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 05:58:06 -0500
Received: by mail-ej1-f53.google.com with SMTP id g20so6920291ejb.1;
        Sat, 19 Dec 2020 02:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EpBQBebW9DJ389TpaCDahYCkX51lISZZEMe47kdJ6lQ=;
        b=IAsruEHJrg2v6P8e0bPaSWQU27WQGHNOQafpZafuRhsmkORmMtmgK0WOjeWIBR1nvA
         XABh1JLTemUs1aKwRp3FqKge3xIKSgZo4efxOUWUswCbdcZSNM95c4+xraIPgYoYpEDe
         b8DX+xelZ7CTjfn9iK7U7dZGNqI0U8ZofDamSbwiR+Y0aKxEFDPXnlUfnDfxbWCoidmK
         3IYUfWytgf/O4LoBR6NTbPzYK2Gi9VniI2nZbPkN0ulBZIGUmoG29h4suHjHWNIXJC9L
         Qqmdw4GLqHCP0R3rG7IMHMUkCY8uX+uZiWEUAGREbjqP7dBM6lTcUU2/hq4qoL9JlCQv
         egbA==
X-Gm-Message-State: AOAM530McxTATj0tA4JvZg130C7LGBPxRV+9LHbVHfFDbwNyPO11M7G/
        T3BiPwMUZNvqA5oQwQKxzGk=
X-Google-Smtp-Source: ABdhPJyWR/64ayreIal22iSj58nHkNVe6iV5yUrUJ5pe5qe42bhP84ft40zxoVfZe823dJe4zocuIg==
X-Received: by 2002:a17:906:4ec7:: with SMTP id i7mr8055250ejv.252.1608375443178;
        Sat, 19 Dec 2020 02:57:23 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id pk19sm6666596ejb.32.2020.12.19.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 02:57:22 -0800 (PST)
Date:   Sat, 19 Dec 2020 11:57:20 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/48] dt-bindings: arm: tegra: Add binding for core
 power domain
Message-ID: <20201219105720.GA5323@kozik-lap>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-8-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 09:05:57PM +0300, Dmitry Osipenko wrote:
> All NVIDIA Tegra SoCs have a core power domain where majority of hardware
> blocks reside. Add binding for the core power domain.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../arm/tegra/nvidia,tegra20-core-domain.yaml | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
> new file mode 100644
> index 000000000000..f3d8fd2d8371
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-core-domain.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Core Power Domain
> +
> +maintainers:
> +  - Dmitry Osipenko <digetx@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-core-domain
> +      - nvidia,tegra30-core-domain

The file should be in bindings/power.
Include also the power-domain.yaml schema.

> +
> +  operating-points-v2:
> +    description:
> +      Should contain level, voltages and opp-supported-hw property.
> +      The supported-hw is a bitfield indicating SoC speedo or process
> +      ID mask.
> +
> +  "#power-domain-cells":
> +    const: 0
> +
> +  power-supply:
> +    description:
> +      Phandle to voltage regulator connected to the SoC Core power rail.
> +
> +required:
> +  - compatible
> +  - operating-points-v2
> +  - "#power-domain-cells"
> +  - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    core-domain {

power-domain (to follow schema and devicetree spec)

Best regards,
Krzysztof


> +        compatible = "nvidia,tegra20-core-domain";
> +        operating-points-v2 = <&opp_table>;
> +        power-supply = <&regulator>;
> +        #power-domain-cells = <0>;
> +    };
> -- 
> 2.29.2
> 
