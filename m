Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C1261964D
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 13:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbiKDMgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 08:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiKDMgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 08:36:09 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323A028707;
        Fri,  4 Nov 2022 05:36:05 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id v81so5010495oie.5;
        Fri, 04 Nov 2022 05:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rft72pT9aZJsB+kuvVBncDchApspaW8cVdrlnrgIWtE=;
        b=gEU5rscBVPZMzWs+dK8fidpeRc6Pvq52yl4mGKkHVK2PVW4oE3jeu07p3mOKDNEjt2
         mkFD/cK/fJs/vfeKsTPu2Mpvtv5Wjdy7jOtg8QJpWtztfOv2GjN262vIHGiwyT08wCQG
         qNHfC1F3pQsZH/9kkvS+z9gt5XQDfRDozU4AaZhJSw0QgN9Vj9O2cwpJ3AnclZhawetW
         cYYGn1ptRjFD8hWxYroqzkhWEQGPdXxTZ5OH5pXfkUX8H85LszZo5PYKsDvAE9gc4zIv
         MIU0fmk6u4SV5llHuFAf99SlOO//yYGkSQQmFGpCe8rBtVOweNmVaaE0rwRj2HOid0Xl
         XtxQ==
X-Gm-Message-State: ACrzQf2ssfkHjR23ltEpt9sxWpVGmBG68wwmxlLxxKMwElmaa/PehWlG
        XWSg0OB36qW9NP6AYFK5zXc8IzfzbA==
X-Google-Smtp-Source: AMsMyM7jnbGnsomdmzhV6FLiWB6+w6HAXQuThhG5Wo5jKeP9dnKAZkDoVUF1DK9ZCxXkOhWaA9O7bw==
X-Received: by 2002:a05:6808:2206:b0:35a:5b5f:c332 with SMTP id bd6-20020a056808220600b0035a5b5fc332mr1607213oib.241.1667565362983;
        Fri, 04 Nov 2022 05:36:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v23-20020a056830141700b00661946468c6sm1387234otp.31.2022.11.04.05.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 05:36:02 -0700 (PDT)
Received: (nullmailer pid 1597769 invoked by uid 1000);
        Fri, 04 Nov 2022 12:36:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     lee <lee@arducam.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-media@vger.kernel.org
In-Reply-To: <20221104152601.000035fd@arducam.com>
References: <20221104152601.000035fd@arducam.com>
Message-Id: <166756425978.1581932.14876221768058327509.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor binding
Date:   Fri, 04 Nov 2022 07:36:04 -0500
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Fri, 04 Nov 2022 15:26:01 +0800, lee wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Lee Jackson <lee@arducam.com>
> ---
>  .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   9 ++
>  2 files changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml:48:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml: 'port' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx519.example.dtb: sensor@1a: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

