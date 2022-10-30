Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A90F612D36
	for <lists+linux-media@lfdr.de>; Sun, 30 Oct 2022 23:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiJ3WEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Oct 2022 18:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiJ3WDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Oct 2022 18:03:52 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20239D2FC;
        Sun, 30 Oct 2022 15:03:12 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id v40-20020a056830092800b00661e37421c2so5903509ott.3;
        Sun, 30 Oct 2022 15:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6RoJ9OKbLkpnZky8aWx+SuJhSHiYeWvTuobl/R4hbY=;
        b=v+3+Rf3SRd1NzaS+g+YXCfbX44NITs51UYq29Su9lxRjpfDGjiN3LYEa+93Gg4NeRA
         Qh50Y7mAb794i4eWv+ndOrscVWuJOsuEUeVsP9VlFA1K01Hswh7saHvmDlQRLxdA8nOg
         2bnXSsmHrDVoalzCVHQ/DPabqnV67+sua8NCWisOpq1mDFqies1HFHiFfe4SBdfEYapu
         uD1Z4yKZOh4iGWkVVH8g9Sd0IUR7ExYggqNttS9NA/bMg7GsGViuAGIZv+j3grPyeS3R
         F3c6uND6DUOOBLFGyYNgojpO4Wi1QAW6bvg/3xTS/mW+mkVZZL0i4UTKp0Fq3RDqnyvH
         P1KA==
X-Gm-Message-State: ACrzQf2QsxY8Ctw6DFWYY47JNEqKUPwNXtSXzqpzwkNyetMHbCz1IY59
        8vjEOAc9ddl5fGm6iEcV94A8nDwN5A==
X-Google-Smtp-Source: AMsMyM6X8g79Ijv6psybb64KEd/NRuDVR7gMsp2VRHu88yJE4MegteReCbn9Y9VeH8/xRUR6Qkvnug==
X-Received: by 2002:a9d:73cf:0:b0:668:2f96:c3ac with SMTP id m15-20020a9d73cf000000b006682f96c3acmr5019966otk.184.1667167391313;
        Sun, 30 Oct 2022 15:03:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i17-20020a544091000000b0035a0badf1dfsm388575oii.20.2022.10.30.15.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 15:03:10 -0700 (PDT)
Received: (nullmailer pid 1570811 invoked by uid 1000);
        Sun, 30 Oct 2022 22:03:12 -0000
Date:   Sun, 30 Oct 2022 17:03:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-media@vger.kernel.org,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: media: st,stmipid02: Convert the text
 bindings to YAML
Message-ID: <166716737315.1570500.9301715619999020296.robh@kernel.org>
References: <20220929145416.16336-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929145416.16336-1-marex@denx.de>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
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

Applied, thanks!
