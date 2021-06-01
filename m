Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A445E39745D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 15:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234296AbhFANey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 09:34:54 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:46786 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbhFANeW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 09:34:22 -0400
Received: by mail-oi1-f178.google.com with SMTP id x15so15473335oic.13;
        Tue, 01 Jun 2021 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=6kGuedDt7bQhzRyTZSjjGxe+y/B8t3+l9BD5gIfnwOk=;
        b=kdZUOUDhwXyQ8Zj1Vk2mRkgpUEZkGt5ALUVdLtBVGIAlU/uVJOQW4/C3irrjGcTFa3
         e9Nas+/h6dkBVgWvqudSfLWIu9FG8vcB/EcfHROUXZjFpySzTZm+XzV2a7TbJwd1BOYu
         0SVP6LeMxHnxK7mGBMObna0W1EfueNtXkuPinCeFwTpn1/ngoPD4DcHdZfGe0nB65DT/
         eMi1odKBLuawshFo0YO9P6PktFbrsJWXIYnvlNzmlwB5/Vf83re3WgkMbXTaC9eEbzXw
         QK9gXQGDnPjiEhhIjtxnca7qv7XYPmjoo5TNTIwztRZCMWcqwmkg7GCjYtktfWvUrosF
         81PA==
X-Gm-Message-State: AOAM533ytodwQqy6MrokzmuNYhEdxHiC0kzHqm0oqwoNYZpPiSpFXWuu
        U3ZY6duWVNhjV9cuO9NGhw==
X-Google-Smtp-Source: ABdhPJxgvoOxx6TDyaVP5rnWCj5J254rhGj1G+YmRt+OqyY5jcmqVoiFfiHLOd6akLgZ62F+pAgiZA==
X-Received: by 2002:a05:6808:90b:: with SMTP id w11mr3197577oih.168.1622554360073;
        Tue, 01 Jun 2021 06:32:40 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x9sm3698141oto.79.2021.06.01.06.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:32:37 -0700 (PDT)
Received: (nullmailer pid 242363 invoked by uid 1000);
        Tue, 01 Jun 2021 13:32:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        festevam@gmail.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        linux-imx@nxp.com, aisheng.dong@nxp.com
In-Reply-To: <dd2c66ba07a8025da2c377c1b6e46f9d7304c9bc.1622429026.git.ming.qian@nxp.com>
References: <cover.1622429025.git.ming.qian@nxp.com> <dd2c66ba07a8025da2c377c1b6e46f9d7304c9bc.1622429026.git.ming.qian@nxp.com>
Subject: Re: [PATCH 1/5] dt-bindings: media: imx8q: add imx video codec bindings
Date:   Tue, 01 Jun 2021 08:32:10 -0500
Message-Id: <1622554330.037290.242362.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 31 May 2021 10:51:09 +0800, Ming Qian wrote:
> Add devicetree binding documentation for IMX8Q Video Processing Unit IP
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8q-vpu.yaml         | 201 ++++++++++++++++++
>  1 file changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml:67:13: [warning] wrong indentation: expected 10 but found 12 (indentation)
./Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml:94:7: [warning] wrong indentation: expected 8 but found 6 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml: properties:mu_m0: Additional properties are not allowed ('vpu_core' was unexpected)
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml: properties:mu_m0: 'vpu_core' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: A schema with a "$ref" to another schema either can define all properties used and use "additionalProperties" or can use "unevaluatedProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml: ignoring, error in schema: properties: mu_m0
warning: no schema found in file: ./Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
Documentation/devicetree/bindings/media/nxp,imx8q-vpu.example.dt.yaml:0:0: /example-0/vpu-bus@2c000000: failed to match any schema with compatible: ['nxp,imx8qm-vpu', 'simple-bus']
Documentation/devicetree/bindings/media/nxp,imx8q-vpu.example.dt.yaml:0:0: /example-0/vpu-bus@2c000000/vpu_decoder@2d080000: failed to match any schema with compatible: ['nxp,imx8q-vpu-decoder']
Documentation/devicetree/bindings/media/nxp,imx8q-vpu.example.dt.yaml:0:0: /example-0/vpu-bus@2c000000/vpu_encoder@2d090000: failed to match any schema with compatible: ['nxp,imx8q-vpu-encoder']
Documentation/devicetree/bindings/media/nxp,imx8q-vpu.example.dt.yaml:0:0: /example-0/vpu-bus@2c000000/vpu_encoder@2d0a0000: failed to match any schema with compatible: ['nxp,imx8q-vpu-encoder']

See https://patchwork.ozlabs.org/patch/1485530

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

