Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4450B669C75
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 16:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjAMPdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 10:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjAMPd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 10:33:27 -0500
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B3197495;
        Fri, 13 Jan 2023 07:26:59 -0800 (PST)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-15ee27bb0a8so2232918fac.7;
        Fri, 13 Jan 2023 07:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRP2TkocjqOQMhG/MnByzo0NYJBw9GX0UeX2+swfxyw=;
        b=XJTSNZ84byqfa8L7ozHlRQdt0zT0p88JVrfftKuB7JY+A4LWP9qMcyQBLj5t7S8SNo
         HhXOBzTUZ43aW3VTd94BSfoS3bdgytCiCCRQtX2qk1c8l4udeXFvevR1K9kto0wQkkTi
         EYw4rMEsrjuv4Sec/mcEn2iHyLRbKa8vcdZXEn7//X6EIBds81rMDdiFo3i3hym6pdFv
         aubt1RMlMDkR0+dQzMpgmpzuxv+wg8Ga32SSLnpUnkTyA64dwt6CiLtlgv9jZ14mhzls
         lUGzRF9mTPB1MfnPJwbavCagCgzy0xOUh06OCrYP0nSDnjmiXrLnPVuZ+qW6NICODTG1
         hqCQ==
X-Gm-Message-State: AFqh2kqL5tAO4X0TARDfnGyyXBzWXywo+0KI/ZePJQze7l3I91hgkTMh
        nvVpikJowalh7Ss5ge1faw==
X-Google-Smtp-Source: AMrXdXtFsV3IDfB+5WgXTwlbtVQ4BVdTaEHUy90uzjy0PZiYeyMKTsWpvSX3+LHQIvqAAk/oGTCuUw==
X-Received: by 2002:a05:6871:281:b0:15e:b684:270a with SMTP id i1-20020a056871028100b0015eb684270amr4670405oae.14.1673623618356;
        Fri, 13 Jan 2023 07:26:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r18-20020a05687080d200b0012763819bcasm10532509oab.50.2023.01.13.07.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:26:57 -0800 (PST)
Received: (nullmailer pid 2224495 invoked by uid 1000);
        Fri, 13 Jan 2023 15:26:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
Message-Id: <167362341999.2212137.8812962458192062043.robh@kernel.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: media: fsl-pxp: convert to yaml
Date:   Fri, 13 Jan 2023 09:26:52 -0600
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Fri, 13 Jan 2023 10:54:07 +0100, Michael Tretter wrote:
> Convert the bindings of the Freescale Pixel Pipeline to YAML.
> 
> The conversion drops the previously listed compatibles for several SoCs.
> It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> on the existing SoCs and would allow to reuse the already defined
> compatibles. The missing compatibles should be brought back when the
> support for the PXP on these SoCs is added.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> 
> - add fsl,imx6sll-pxp and fsl,imx6sx-pxp compatibles
> - restrict number of interrupts per variant
> - cleanup syntax
> ---
>  .../devicetree/bindings/media/fsl,imx6ull-pxp.yaml | 82 ++++++++++++++++++++++
>  .../devicetree/bindings/media/fsl-pxp.txt          | 26 -------
>  2 files changed, 82 insertions(+), 26 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml: allOf:0:else:properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'numItems' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml: allOf:0:then:properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'numItems' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

