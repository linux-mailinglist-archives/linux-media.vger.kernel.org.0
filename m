Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80CA55F1434
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 22:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbiI3UxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 16:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbiI3UxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 16:53:08 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DC318F430;
        Fri, 30 Sep 2022 13:53:07 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id c81so5938469oif.3;
        Fri, 30 Sep 2022 13:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=pdQtcuPWzJHziwzHWj7zq1PATGkvPQqGjwa4TYtqohI=;
        b=gGDilwrT8fO3qWPzu/KSa+SkcxtfwGyP7wMlUpEIGDKJSneMe+vl4DnPAgk0wxXGgQ
         ipoifbodGMix/mdnfznC3RUMloaTJ85gZd6Q3KIunntKvjwB6wSvl0dQILX949Ba7XAD
         2R88ZFRcGBjSGAxHevsKC6Ub3zcsCwFzj3KYHCb/NgW6TcWJ+dADPjgq8zWLv6UbFnkm
         O2uwbTs9QsfqEoSatF6tDmT1ySARoOQERxzo5tTh7+ngIR36nzndzi6hwIX9aot5fYvO
         HEkfhewgst3xAGIOL+QMnfTFnZVAtXbQJLnjsijivPkFJGmYsNzORRapBXS1wj9HWuWs
         xPFg==
X-Gm-Message-State: ACrzQf0BQJQh95rD9PuedTsVRYdbz8u8NLl7GqJ2TGjBfbKqfDrW+fxN
        VGbAnG52A7goA4iSnfWKjA==
X-Google-Smtp-Source: AMsMyM7jjjDlKG2yZa8i/Yj525zSkuezIrskRqr1rNMpBgIMgYY5Sbe4ucB39AboCIJ3Oxgfsmyeqw==
X-Received: by 2002:a05:6808:13c8:b0:350:37b4:c4a with SMTP id d8-20020a05680813c800b0035037b40c4amr47958oiw.90.1664571186666;
        Fri, 30 Sep 2022 13:53:06 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 6-20020aca0506000000b003509cc4ad4esm748527oif.39.2022.09.30.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 13:53:05 -0700 (PDT)
Received: (nullmailer pid 912599 invoked by uid 1000);
        Fri, 30 Sep 2022 20:53:04 -0000
Date:   Fri, 30 Sep 2022 15:53:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: media: st,stmipid02: Convert the text
 bindings to YAML
Message-ID: <166457118273.912532.12800717415641115634.robh@kernel.org>
References: <20220929145416.16336-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929145416.16336-1-marex@denx.de>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 29 Sep 2022 16:54:16 +0200, Marek Vasut wrote:
> Convert the text STMIPID02 DT bindings to YAML DT format to permit
> validation of DTs using this I2C CSI-2 to CPI bridge.
> 
> Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Update YAML DT schema maintainers, add Benjamin and Sylvain, drop myself
>     - Update MAINTAINERS file, replace st,st-mipid02.txt to st,st-mipid02.yaml
>     - Fix bus-width to be 6,7,8,10,12 and drop default:
>     - Require port@2 and either or both port@0 or port@1
> V3: - Add RB from Benjamin
>     - Fix lane-polarity property name to lane-polarities
>     - Fill in newlines
>     - Replace clock-names: subnodes with plain "const: xclk"
> ---
>  .../bindings/media/i2c/st,st-mipid02.txt      |  82 --------
>  .../bindings/media/i2c/st,st-mipid02.yaml     | 176 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 177 insertions(+), 83 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
