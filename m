Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F698616AB0
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 18:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbiKBR2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 13:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbiKBR2n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 13:28:43 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4863BD8C;
        Wed,  2 Nov 2022 10:28:43 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id g10so19888935oif.10;
        Wed, 02 Nov 2022 10:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaY2JRf7Qrs4BjLOms0a3yOv1naCkEtbz3Hhnyz2/Xo=;
        b=rKYpR+bdIFbb2kZgYd6Y02c6xCaA6G5UZF3MeXO4xvvUI2kUHYZWKZm1fTEHA53ckR
         DB3g+UED1mEvhzWoVj+8CL957qYMVnogTX4UWkXOuE311InyvC+FvPuzzrvOAqJrjjFh
         cXKmkZoX8XMcClKg8lhUcXv5R3OrwPxoiI1lduCrfhzFXOwaqyB20iQrJ3tv/wYiHJ29
         7Sjm+lRnoTzSjLK1CG1h9kFudmBVKFBScXKXDp+9JVB6r8BK1YS5DVS1uHgJWzRh10HM
         3a2ky6jQqJ2fDVOinEpcsbOtj9rVB2KTfT7/6qlbXtRLnCpkWEBnQ8a1Z7dv7lFFC2VF
         azRg==
X-Gm-Message-State: ACrzQf2qOH/cZZZ+J8tY6ATsKjMtVrQCTh+1wNlVv+IhVLnfh+7c0RlO
        nkzxUvOJ0RY47xvGys4LYw==
X-Google-Smtp-Source: AMsMyM7XNjJksNn4v1KIWtaVLprpS1jVN7Ne9J/30XUYWxaLWsn5powSlcME0vDxNq9orqSC3b5fcQ==
X-Received: by 2002:a05:6808:11c5:b0:34b:75dd:2ee9 with SMTP id p5-20020a05680811c500b0034b75dd2ee9mr14041926oiv.285.1667410122451;
        Wed, 02 Nov 2022 10:28:42 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z8-20020a056870d68800b00136a0143de8sm6275611oap.40.2022.11.02.10.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:28:41 -0700 (PDT)
Received: (nullmailer pid 4192036 invoked by uid 1000);
        Wed, 02 Nov 2022 17:28:43 -0000
Date:   Wed, 2 Nov 2022 12:28:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>, linux-media@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 6/9] dt-bindings: media: IR: Add F1C100s IR compatible
 string
Message-ID: <166741012311.4191982.16371047732951396758.robh@kernel.org>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-7-andre.przywara@arm.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Tue, 01 Nov 2022 14:16:55 +0000, Andre Przywara wrote:
> The CIR controller in the Allwinner F1C100s series of SoCs is compatible
> to the ones used in other Allwinner SoCs.
> 
> Add the respective compatible name to the existing IR binding, and pair
> it with the A31 fallback compatible string.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
