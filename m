Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073642E02B7
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 23:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgLUWyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 17:54:54 -0500
Received: from mail-oo1-f47.google.com ([209.85.161.47]:34629 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgLUWyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 17:54:53 -0500
Received: by mail-oo1-f47.google.com with SMTP id x23so2578354oop.1;
        Mon, 21 Dec 2020 14:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jw1ndUTD1aoOuURqqx/C6H+0xyb493YdyXMpTfuGNvM=;
        b=Mot7dO44sq1pIoY9UwlfkfucdWOzt5vErgOGWWCZEANQ9ulz3+fh7BEUYR5X5ZXDs9
         pDdwWK6/fG+SRJ6incFsibkJLpFgz7DubeS0JuQxcN4rEIhjaFkvINsV8mEfAEQcUZ1Q
         DDq5a5sjFemsd5Cgf5EZuclvfpjj2B8/lW2L6jDKIGVPh2IooU4U8x4exlGAGQRgj/N0
         UkAcAfwQ+0vEHK6YkXjdg7FnsE7F6pzQPpV7r7AKYs3UHHEd1MyKF46QxjCc5TUeeDnf
         VQvwb0PrIcquozciQvUtTrHWRV1te8LuTk2ZGNCiU8kJqR5KtD0QkYldLtwpeSoJyWrS
         3xHw==
X-Gm-Message-State: AOAM530dB+NgNQE9IZiZvqt5b0nIjWLgRybuMYLYEgugf+vgCUtHddSB
        6tctrpExZHTC12uo/rbkJw==
X-Google-Smtp-Source: ABdhPJyh7WIlcaY2pi0KoO1t1QH32umrXAGjAjGGPz8NFDz5TkVO7QEgKYygMTJiLlGyoihZfsxu1g==
X-Received: by 2002:a4a:a7c5:: with SMTP id n5mr12984272oom.9.1608591252632;
        Mon, 21 Dec 2020 14:54:12 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z14sm4101967otk.70.2020.12.21.14.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 14:54:11 -0800 (PST)
Received: (nullmailer pid 724741 invoked by uid 1000);
        Mon, 21 Dec 2020 22:54:05 -0000
Date:   Mon, 21 Dec 2020 15:54:05 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: Re: [PATCH v2 02/48] dt-bindings: memory: tegra30: emc: Replace core
 regulator with power domain
Message-ID: <20201221225405.GA723611@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-3-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 09:05:52PM +0300, Dmitry Osipenko wrote:
> Power domain fits much better than a voltage regulator in regards to
> a proper hardware description and from a software perspective as well.
> Hence replace the core regulator with the power domain. Note that this
> doesn't affect any existing DTBs because we haven't started to use the
> regulator yet, and thus, it's okay to change it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> index 0a2e2c0d0fdd..7b4af9169b0b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> @@ -39,9 +39,9 @@ properties:
>      description:
>        Phandle of the Memory Controller node.
>  
> -  core-supply:
> +  power-domains:
>      description:
> -      Phandle of voltage regulator of the SoC "core" power domain.
> +      Phandle to the SoC "core" power domain.

power-domains needs to define how many (maxItems).

>  
>    operating-points-v2:
>      description:
> @@ -241,7 +241,7 @@ examples:
>  
>          nvidia,memory-controller = <&mc>;
>          operating-points-v2 = <&dvfs_opp_table>;
> -        core-supply = <&vdd_core>;
> +        power-domains = <&domain>;
>  
>          #interconnect-cells = <0>;
>  
> -- 
> 2.29.2
> 
