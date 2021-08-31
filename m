Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F843FBFDC
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 02:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239107AbhHaAEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 20:04:53 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:42731 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbhHaAEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 20:04:51 -0400
Received: by mail-ot1-f54.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so20579697otk.9;
        Mon, 30 Aug 2021 17:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=X+JzFHvarIVnvQQqcBJPXmNCBKi89Vgxfb6Fxl+5bS0=;
        b=NShZJbuOZ6AmLI4BJG474mCUb0GDW8aDGaiNiCAr0kZoa/BZyP8M55KQtmoPOoaSWn
         poI0zfZZydR61Z1f+YVmSoUgOiYowL2iQl6APMMCtMwabV57QI+M6oJC89RNmkzhhpAV
         tbc3DVaNFnwqz03ClBul3jB1+aSbjKg9rXuZau+HeCS+45hru65LyNQmOdOf/UmDsFNz
         jhqbNG5CDGew8yoCqzGTjYiuNxHRipRKYhaxRjFoXYlnGrT20hA2u+ByM+X2CAHh+0nx
         qFPgGeFKReexGd5KYnABpWTK/Vt535j+qW9yLO8hQe2CYUaYqCO/ngNFUIqdr2nh+Ifd
         B9qg==
X-Gm-Message-State: AOAM532gBEgnzRlY0PesfE8lFfUn2z0+UP1XSH8cMWglIelPadavBM6S
        FBnO4Rv092IYRF10O/rQUw==
X-Google-Smtp-Source: ABdhPJwF/IP0deTf//Ue3cOh3Y7qENVSDc0BoPLSkMEtkukSAs7/D/uJt7OhzFx2N7wm4NL5Jl+cfA==
X-Received: by 2002:a05:6830:1d59:: with SMTP id p25mr21366508oth.191.1630368236877;
        Mon, 30 Aug 2021 17:03:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l8sm3282905oom.19.2021.08.30.17.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 17:03:56 -0700 (PDT)
Received: (nullmailer pid 2940840 invoked by uid 1000);
        Tue, 31 Aug 2021 00:03:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org
In-Reply-To: <20210830180758.251390-5-mike.rudenko@gmail.com>
References: <20210830180758.251390-1-mike.rudenko@gmail.com> <20210830180758.251390-5-mike.rudenko@gmail.com>
Subject: Re: [PATCH v1 4/5] dt-bindings: phy: phy-rockchip-dphy-rx0: add support for tx1rx1 phy
Date:   Mon, 30 Aug 2021 19:03:53 -0500
Message-Id: <1630368233.493531.2940839.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 30 Aug 2021 21:07:53 +0300, Mikhail Rudenko wrote:
> RK3399 TX1RX1 D-PHY is not a child of GRF and uses reg, thus add
> corresponding properties conditionally. It also requires DSI clock to
> operate, so check for it. Since we now support both rx0 and tx1rx1,
> rename the schema to rockchip-mipi-dphy-rx.yaml.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  ...hy-rx0.yaml => rockchip-mipi-dphy-rx.yaml} | 39 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/phy/{rockchip-mipi-dphy-rx0.yaml => rockchip-mipi-dphy-rx.yaml} (65%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/phy/rockchip-mipi-dphy-rx0.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/soc/rockchip/grf.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/phy/rockchip-mipi-dphy-rx0.yaml'
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/soc/rockchip/grf.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1522296

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

