Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B032E02B1
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 23:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgLUWyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 17:54:03 -0500
Received: from mail-oo1-f41.google.com ([209.85.161.41]:42504 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgLUWyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 17:54:02 -0500
Received: by mail-oo1-f41.google.com with SMTP id x203so2564564ooa.9;
        Mon, 21 Dec 2020 14:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PmiFErZsck8Eax6YSpPObi4oYX8shYbW2tl21KlUI5M=;
        b=gXyRlORkyHi66Llm062zovdcdq/KdIbq5PUDI+TmYhoXIpKso5gfeDUkfHr0jvFjE4
         2JIzuOHPqgqEC7mE92ToP6LWzLRZJPMYRJmQxoHNKiHFQYBEwp04UutP19/pxZu78xGm
         EvWYJFY8sBpuao9fX257Wki8nIK84tCOd/iQLXL5b60RqpXqbxJGNq35CDx2vq3tA8LA
         YaWdwERTZoB2R0JEeALQufP3Dy4vo/zFxMxwtEuZwEMIIbF6Ub25nYHSM9bW4ED/cOSJ
         7BT8wYTD8g89yhi2bauQCI9ZYBqqxm/37Knd9cNP+hBrdomrI9bDEGmXFYKhLenVm9iv
         N0NQ==
X-Gm-Message-State: AOAM532Jk5KndoWb23Mmf3owIOL3WPDPIW1jVAZBOD7DdSfdNPXIPzPe
        FPEKYCMKBFCflP1zTc/P8J3L1/tfrw==
X-Google-Smtp-Source: ABdhPJwHk2mKXmiM9Be1g1hPiKx149bS8x31wABVYLXX21+EEEz/R18GHHbZiggzsaUq+ghMjOAzAg==
X-Received: by 2002:a05:6820:503:: with SMTP id m3mr13176716ooj.83.1608591201539;
        Mon, 21 Dec 2020 14:53:21 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e25sm1849939oof.1.2020.12.21.14.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 14:53:20 -0800 (PST)
Received: (nullmailer pid 723454 invoked by uid 1000);
        Mon, 21 Dec 2020 22:53:16 -0000
Date:   Mon, 21 Dec 2020 15:53:16 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devel@driverdev.osuosl.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Kevin Hilman <khilman@kernel.org>, linux-clk@vger.kernel.org,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        dri-devel@lists.freedesktop.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 01/48] dt-bindings: memory: tegra20: emc: Replace core
 regulator with power domain
Message-ID: <20201221225316.GA723398@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Dec 2020 21:05:51 +0300, Dmitry Osipenko wrote:
> Power domain fits much better than a voltage regulator in regards to
> a proper hardware description and from a software perspective as well.
> Hence replace the core regulator with the power domain. Note that this
> doesn't affect any existing DTBs because we haven't started to use the
> regulator yet, and thus, it's okay to change it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
