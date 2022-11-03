Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4D5617CAC
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 13:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbiKCMft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 08:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbiKCMfr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 08:35:47 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FA8C767;
        Thu,  3 Nov 2022 05:35:42 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id r10-20020a4aa2ca000000b0049dd7ad4128so233253ool.13;
        Thu, 03 Nov 2022 05:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37gqwegML5cFk127JC1GKqU7RUWY09eVP0GPmdF2rjw=;
        b=QxxllMPdu2nBS1TRSc/uXcFhfwJoqJx1ZOcwpVrzDcsq/4PYktRNoPcjccc+Ecum5A
         8esbVOKgoZT2hPW+7FStSMEIzIjCgtmoiQkqsyPbBhcqmYzg+5oM9nEBj8QFoAG54tGD
         7eC/gxK6YpqQmEPu05KUIZ8kRh56quZZ/O/sqfH3uIoBF0dNaN4hMxIS30vcMb7TzQ6U
         YBCc3ACatskIiXTPslDewsxRFWj9qc1rc1hWxuWABAMRNNgixDA2xGr7nrHPgZL17KcT
         N+wbvgFwcAdSx3mh52WAoUOeWMO/w7e6NVIqFIM6YNoYGA91XE9JnsMzQ0TshsppelpT
         hZ8g==
X-Gm-Message-State: ACrzQf0jy+YtXZlrlcRcKr9r3cQr8oy/3vwVUSCiA80/46gOvL+j7uxO
        jgg+UdsHtKrTz+FeUJPX9KwdFbXVVw==
X-Google-Smtp-Source: AMsMyM48TMvYPaH8D/31MMApGEGFR+YQRii6tLBH7rjEQZYsztaem4Q3RUubEE57iJIb8kPmRGLAXg==
X-Received: by 2002:a4a:e411:0:b0:442:c893:86b7 with SMTP id t17-20020a4ae411000000b00442c89386b7mr12705591oov.22.1667478941761;
        Thu, 03 Nov 2022 05:35:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v19-20020a0568301bd300b00668953207b2sm253918ota.80.2022.11.03.05.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 05:35:41 -0700 (PDT)
Received: (nullmailer pid 2140207 invoked by uid 1000);
        Thu, 03 Nov 2022 12:35:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     lee <lee@arducam.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org,
        linux-media@vger.kernel.org, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20221103110424.00007a48@arducam.com>
References: <20221103110424.00007a48@arducam.com>
Message-Id: <166747792046.2121835.13837905037920698930.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor binding
Date:   Thu, 03 Nov 2022 07:35:43 -0500
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


On Thu, 03 Nov 2022 11:04:24 +0800, lee wrote:
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

