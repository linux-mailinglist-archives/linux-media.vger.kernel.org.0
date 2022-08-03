Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2600B5894EC
	for <lists+linux-media@lfdr.de>; Thu,  4 Aug 2022 01:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238498AbiHCXlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 19:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbiHCXlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 19:41:05 -0400
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE24D65C0;
        Wed,  3 Aug 2022 16:41:04 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id h138so99424iof.12;
        Wed, 03 Aug 2022 16:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=5+coTZDduovtGeGUAQiY1KZPZyVV//yq+dtkqtwvr+M=;
        b=IGbbkXI9NLnViTv6XQ5mgO2wM+OqGWL1rDmE+5vMAPUsKh/QVGrPvJmB3PMDHJt1Lm
         vWx261n/B5FJG6V3Q+/H8PHordWwN///jP1U9edd5ajdhizWoLvOvA167j7bsCuO3fiw
         6hu2pSHDNADAOR/LVyeH7xIPZzOCwxtc19eXSmkT83pOyqQMiIpp2aTrWRyH1j+Nhlv6
         1OU5gAcEcUYOX4FE1RtWVpOrrb8fiu0kPJMty2/0K1qMGf2nQ4SR+Hmvu1Ppu3O8Kz2Z
         Fjyqy7jsZv/FPOCcHweSjcZ5Zk4uOuQnF/M0g1Fc0EqSKqg2hDJHU1rNC0PRQUgf3Dss
         IKrg==
X-Gm-Message-State: AJIora8ojuVH1pR3NHKPfDCqJXiJPq0dxXWFj0EnMji0D+eZ+eFZ7DYz
        C2nWCZvQeXcSyNYoNjfH7A==
X-Google-Smtp-Source: AGRyM1tmA+XpuxcqCJHNx9Oy06r+C85vPLF2CqHp9NgXLB1se8UYv3+2vvfJvGjtO2m4WNI3tTpmsA==
X-Received: by 2002:a6b:c301:0:b0:67c:5d64:ba13 with SMTP id t1-20020a6bc301000000b0067c5d64ba13mr9684068iof.126.1659570063905;
        Wed, 03 Aug 2022 16:41:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t26-20020a02ccba000000b0034276516a5asm4257790jap.9.2022.08.03.16.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 16:41:03 -0700 (PDT)
Received: (nullmailer pid 2827776 invoked by uid 1000);
        Wed, 03 Aug 2022 23:41:01 -0000
Date:   Wed, 3 Aug 2022 17:41:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Erling Ljunggren <hljunggr@cisco.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: media: add cat24c208 bindings
Message-ID: <20220803234101.GA2827721-robh@kernel.org>
References: <20220803075850.1196988-1-hljunggr@cisco.com>
 <20220803075850.1196988-4-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803075850.1196988-4-hljunggr@cisco.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 03 Aug 2022 09:58:48 +0200, Erling Ljunggren wrote:
> Add devicetree bindings for new cat24c208 EDID EEPROM driver.
> 
> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> ---
>  .../bindings/media/i2c/onnn,cat24c208.yaml    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
