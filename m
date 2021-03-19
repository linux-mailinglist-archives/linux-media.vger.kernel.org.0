Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE12342827
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 22:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhCSVtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 17:49:49 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:39865 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbhCSVtT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 17:49:19 -0400
Received: by mail-io1-f52.google.com with SMTP id v17so7639884iot.6;
        Fri, 19 Mar 2021 14:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=4GzwF02PM8ktxdF2ZepLboRPNqq1i79xTmgyBVoP/ec=;
        b=B0zukKEaula2kR0NQfOkprB/1PXbHrmvfzGnFNRA4y1GEEvXgEYcvez4OL+bsDcsxy
         jOIUUiz35pnm9rYuuXseyMkSg7a15jKxkdj5yJsY7OP0pBjsTnzNwZrgUTe0vA+MEVib
         joNNgo8pEqXUyyM5tcGg4wIkyQHlta7oPImVbqkxn1qcru04o1oasaMhc7QyEgwpaEN9
         wKIee3yxqM8pjgA9FBy6zh7L34b+v7eqNKa5Y1nW3Cw5t7KlFmIiiorARGYZxPsaRTV0
         OQkQJP9hj1U8Q05ZUpL7m5OkjgAeMaL8tOneTpdcuPGArP7ORnsKTkzTscA0c/LFpXEL
         heuw==
X-Gm-Message-State: AOAM530qSU6Acftpx1gE2MBqIImso3zyiEFBvnUrsLDRcSu7T3n8ieY0
        ifTsLk7S+zRhLzSzvezZcgTCwTw/LQ==
X-Google-Smtp-Source: ABdhPJzVSl2+/kz1UP/qexJpaQJHqcfwRmUdzGvPXI9vfpmHnLCkXODX5ptDkxz9FW38aPh+yG/QNA==
X-Received: by 2002:a5d:8707:: with SMTP id u7mr4133827iom.18.1616190559118;
        Fri, 19 Mar 2021 14:49:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m20sm3146106ilj.66.2021.03.19.14.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 14:49:18 -0700 (PDT)
Received: (nullmailer pid 1647640 invoked by uid 1000);
        Fri, 19 Mar 2021 21:49:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, gjorgjix.rosikopulos@linux.intel.com,
        robh+dt@kernel.org, paul.j.murphy@linux.intel.com,
        mchehab@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com, daniele.alessandrelli@linux.intel.com
In-Reply-To: <20210319180632.585-2-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com> <20210319180632.585-2-martinax.krasteva@linux.intel.com>
Subject: Re: [PATCH 01/10] dt-bindings: media: Add bindings for Keem Bay Camera
Date:   Fri, 19 Mar 2021 15:49:12 -0600
Message-Id: <1616190552.585372.1647639.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 19 Mar 2021 18:06:23 +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Intel Keem Bay Camera driver.
> - Add MAINTAINERS entry for Intel Keem Bay Camera binding
>   documentation.
> 
> Co-developed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
>  .../bindings/media/intel,keembay-camera.yaml       | 98 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: properties:ports:properties:required: ['reg', 'endpoint'] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: properties:ports:required:2: 'port@[0-5]' does not match '^([a-zA-Z#][a-zA-Z0-9,+\\-._@]{0,63}|\\$nodename)$'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: properties:ports: Additional properties are not allowed ('#size-cells', '#address-cells' were unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: properties:ports: '#address-cells' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: properties:ports: '#size-cells' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: properties:ports:properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'required'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: properties:ports: '#address-cells' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: properties:ports: '#size-cells' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml: ignoring, error in schema: properties: ports: properties: required
warning: no schema found in file: ./Documentation/devicetree/bindings/media/intel,keembay-camera.yaml

See https://patchwork.ozlabs.org/patch/1455960

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

