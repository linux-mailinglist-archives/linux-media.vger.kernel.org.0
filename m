Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605875183A4
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 13:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234985AbiECMCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 08:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbiECMCe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 08:02:34 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADDD26AF2;
        Tue,  3 May 2022 04:59:02 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so16906355fac.7;
        Tue, 03 May 2022 04:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=m2BgfrfV6RN7dJFXpZRX5XjmcB0IDcigUix/sX/LRNk=;
        b=jjUuNdUmEw+oVao7f0IBKcntN68XNLy21vfI0uA9d8LNvlFP/2YZ6D6GIw5ixozVXf
         3vt+ztNiNMV+F54px/cFEyWQTsPWZJ9Fol+ERSRjmusgoKKa7YQ9G7bt5abrWxQxecBh
         eObbUuQz0YtP6niR0wIKjRJjZHLdtfPSXJZXUD4OLIt8B7zkQHnMaaWl3eq/mQEsnXLq
         a8JUVO8cBxMyRSdpnHpy96SA/7OentSXZSnGKDnFyHbK5ODEVLR8F7DwcRIyX3Orc4xK
         Wn1ajVtIn8Rx0bD1qtwRFySr68G7tm1GCDj4QTD9T0F80D/nLlzm7jv3C5t9AiINGzgi
         6i9w==
X-Gm-Message-State: AOAM533Kdb6PisL5Fc9vD5euPOwzHIOtWTLrCTocemTSPKqnAAlSEFQh
        Nj+5tfhjptIn6HZtP2VBD0/obgy8Kg==
X-Google-Smtp-Source: ABdhPJyzMbayNNzoGbU/8rB4uQ1K75fwFdZzWyImHucod1Bbz32viwi5J4Icfi/hbAn3VdbrZ03xgw==
X-Received: by 2002:a05:6870:7a8:b0:e5:d471:1e82 with SMTP id en40-20020a05687007a800b000e5d4711e82mr1586718oab.138.1651579142061;
        Tue, 03 May 2022 04:59:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v15-20020a9d604f000000b006060322123esm3805591otj.14.2022.05.03.04.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 04:59:01 -0700 (PDT)
Received: (nullmailer pid 3296825 invoked by uid 1000);
        Tue, 03 May 2022 11:59:00 -0000
From:   Rob Herring <robh@kernel.org>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
        tomi.valkeinen@ideasonboard.com, alexander.stein@ew.tq-group.com,
        mchehab@kernel.org, devicetree@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, robh+dt@kernel.org
In-Reply-To: <20220503093925.876640-8-xavier.roumegue@oss.nxp.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com> <20220503093925.876640-8-xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH v5 7/9] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Tue, 03 May 2022 06:59:00 -0500
Message-Id: <1651579140.647327.3296824.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 03 May 2022 11:39:23 +0200, Xavier Roumegue wrote:
> Add DT binding documentation for the Vivante DW100 dewarper engine found
> on NXP i.MX8MP SoC
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/nxp,dw100.example.dts:34.50-51 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/media/nxp,dw100.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

