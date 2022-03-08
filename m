Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA154D2340
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 22:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350422AbiCHVZm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 16:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350416AbiCHVZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 16:25:41 -0500
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B6B4FC7A;
        Tue,  8 Mar 2022 13:24:43 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so522458ooa.10;
        Tue, 08 Mar 2022 13:24:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=K86R/EcQw4e7DsA+970T3wMFT6I91rJ0AuL1XE4PXI0=;
        b=ocYSx59MiNaitqdTq1YP5d3ea6s3vH0LfuQ3zCR64WpOjfx4iN8DMMbYMVlexpp26b
         lzoywRiPPPY0x4f/YNPGbF9JPz0XrYJAjZcqS3+xpFANASovF0NoiVonnR+UB5HEAQVS
         CpJFEU22r4tQruzzFgL2H5TpHRejaYmsNOOEJcE2JknaL86t9dvrracq/PmPVXLETCgh
         ZG2Q3UQSg1+KYcK0sMLhuUNjXabsKGVFxocMUsb6eq3uGXo6tQRWC20Ln3V502uNyK+5
         5ZynuonZxEDbI9ZEBilEBrHQzUIm3q+BQt+NKf6bTcilNdtA1zLA1jqWRP8GEwqnRRSe
         BcuA==
X-Gm-Message-State: AOAM530JplN8J3UylzGLIBJU+BlAeyGk6GcjcsVvJJBCvZnXCxlaV2RN
        tdlrO33Dp/r/L5PLLM7NKQ==
X-Google-Smtp-Source: ABdhPJxFQTXe7OghTtYNwbMujhy0v21wgfazTsYm87Az786TmJj+H628/as6+rgcVlqXZi5aSerMfQ==
X-Received: by 2002:a05:6871:690:b0:da:648c:3b1e with SMTP id l16-20020a056871069000b000da648c3b1emr3632509oao.62.1646774683207;
        Tue, 08 Mar 2022 13:24:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w15-20020a9d70cf000000b005ad26785e7dsm8149068otj.57.2022.03.08.13.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 13:24:42 -0800 (PST)
Received: (nullmailer pid 1390771 invoked by uid 1000);
        Tue, 08 Mar 2022 21:24:39 -0000
From:   Rob Herring <robh@kernel.org>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, nicolas@ndufresne.ca,
        devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org
In-Reply-To: <20220308201038.48386-8-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com> <20220308201038.48386-8-xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH v3 7/9] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Tue, 08 Mar 2022 15:24:39 -0600
Message-Id: <1646774679.511115.1390770.nullmailer@robh.at.kernel.org>
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

On Tue, 08 Mar 2022 21:10:36 +0100, Xavier Roumegue wrote:
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
Documentation/devicetree/bindings/media/nxp,dw100.example.dts:25:18: fatal error: dt-bindings/power/imx8mp-power.h: No such file or directory
   25 |         #include <dt-bindings/power/imx8mp-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/media/nxp,dw100.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1603171

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

