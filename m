Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAE662D3432
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 21:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730198AbgLHUcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 15:32:19 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:38452 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgLHUcT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 15:32:19 -0500
Received: by mail-ua1-f68.google.com with SMTP id y26so6039804uan.5;
        Tue, 08 Dec 2020 12:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cNHSp0D/J2N3eQe2/F62j75KmvD1PhSAJf5wH19lqxQ=;
        b=rnzsmpBCUu0pzhuxS7hgfoEbi4SuC51s4/jCisUM6/zP5fJdoQMjONMqlv2gHWwvMr
         ThpUl28RqS/I2QYTTPKv7uTWRlxXgradHx81r4ZXm4OMacn182gvuveSe0yCI2byuWf/
         wLqqzeJqQZxRB2mbQI87cRqpzMSijG+sMD1IuHv6bfSWogVch1UKtOWrxNl7NGb/9HuW
         xMxefTAAxM7gBJFzL4U7iD6xn5FcPPl4Jyt3bzN6dQoOKwKVlF8M7pOanA0J8p2p38GK
         KM70Y3szjKvWreDhDaBxspGCuyDBEqxTbvuGZvFoRsg8+/tgCXSPcJVOntIHNVHifxxf
         kikw==
X-Gm-Message-State: AOAM532cwoOOOvSn0/yReNfDIa9CQpkAls+sUv1z6p5sZAFecj5Mn+Er
        6oogxlFU4ArUhwuI4clNsjZprH8oYA==
X-Google-Smtp-Source: ABdhPJwqzkWqp7NG8pv3hYLzFGCV5M4/HK+Rdc7I43X1WJ+it5ihK+cV87nmhrLL5tXoLhppZo73pw==
X-Received: by 2002:a05:6820:54c:: with SMTP id n12mr17807858ooj.79.1607455383095;
        Tue, 08 Dec 2020 11:23:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 30sm2980770oth.7.2020.12.08.11.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 11:23:01 -0800 (PST)
Received: (nullmailer pid 2923083 invoked by uid 1000);
        Tue, 08 Dec 2020 19:23:00 -0000
Date:   Tue, 8 Dec 2020 13:23:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mark Rutland <mark.rutland@arm.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: media: Document Rockchip VIP
 bindings
Message-ID: <20201208192300.GA2922694@robh.at.kernel.org>
References: <20201208161509.655862-1-maxime.chevallier@bootlin.com>
 <20201208161509.655862-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208161509.655862-2-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 08 Dec 2020 17:15:07 +0100, Maxime Chevallier wrote:
> Add a documentation for the Rockchip Camera Interface controller
> binding.
> 
> This controller can be found on platforms such as the PX30 or the
> RK3288, the PX30 being the only platform supported so far.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v3: Renmed the controller to "vip"
> 
> v4: fixed the binding to get a compiling example
> 
>  .../bindings/media/rockchip-vip.yaml          | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-vip.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/rockchip-vip.yaml:59:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.yaml: properties:port:properties:required: ['remote-endpoint'] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.yaml: properties:port:properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'required'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.yaml: ignoring, error in schema: properties: port: properties: required
warning: no schema found in file: ./Documentation/devicetree/bindings/media/rockchip-vip.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.example.dt.yaml: example-0: vip@ff490000:reg:0: [0, 4282974208, 0, 512] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1412765

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

