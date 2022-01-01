Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3F24828A4
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 23:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiAAWBx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 17:01:53 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:35787 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiAAWBx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 17:01:53 -0500
Received: by mail-ua1-f50.google.com with SMTP id v14so34320583uau.2;
        Sat, 01 Jan 2022 14:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=lddxkzvyR2RNCzBnkG0wcQa1iSF+UNFNK+adpNwi3JU=;
        b=QolkBvi3/qiPCboA/RSSe6kKa9/EHu5E44DcMNVbhbfTWPihMfOntUgaPXm/95A962
         RCfx7m0Kq8ArH5vJicafEHCZrDmSlq6eXHYj4DpMxnjdwGQA97fRvubt15iNRvEwdZdB
         XT2WbL4WJQWpg7vU00ZuMRqAzvuddaLrZ+skMWmfPYFkk3xazbssnC5ToUis7rOCNEBU
         3EP2aTxgl8qQ27j06MnwJDV64TpxmeQ3bvqSUmJVOhbVczVXWfRBiUyPdOY+xMkiKrwY
         tG26/agmm82sAJ4S8SFjdjlVVBtqlxfjBDeKKSzZupkTOdoeKoXJROY0l57mkjKYDPQ7
         4phQ==
X-Gm-Message-State: AOAM531kAuYk+3tbzQ2NcnpjV2E42kHIGfhvigr8czmcgutq7cJJpK43
        7XNE5Lfwpaj8AfVHLwbYZDB5Dz8P8moc
X-Google-Smtp-Source: ABdhPJym/+/zZgVbmDtEGl+nxQcG5rFCzRXBd00GN3rsiKmd+EdnP5HDYrf8O6Z2JWCcycSUZ7a//g==
X-Received: by 2002:a67:e303:: with SMTP id j3mr12426603vsf.33.1641074512146;
        Sat, 01 Jan 2022 14:01:52 -0800 (PST)
Received: from robh.at.kernel.org ([209.91.235.3])
        by smtp.gmail.com with ESMTPSA id i62sm6165704vke.33.2022.01.01.14.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 14:01:51 -0800 (PST)
Received: (nullmailer pid 839555 invoked by uid 1000);
        Sat, 01 Jan 2022 22:01:44 -0000
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Thomas Nizan <tnizan@witekio.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
In-Reply-To: <20220101182806.19311-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com> <20220101182806.19311-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: media: i2c: max9286: Add property to select I2C speed
Date:   Sat, 01 Jan 2022 18:01:44 -0400
Message-Id: <1641074504.105647.839554.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 01 Jan 2022 20:27:57 +0200, Laurent Pinchart wrote:
> The I2C speed on the remote side (the I2C master bus of the connected
> serializers) is configurable, and doesn't need to match the speed of the
> local bus (the slave bus of the MAX9286). All remote buses must use the
> same speed, and the MAX9286 needs to be programmed accordingly. Add a
> new DT property to select the speed to make it configurable.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml: properties:maxim,i2c-clock-frequency: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('enum', 'default' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('default' was unexpected)
		hint: A vendor string property with exact values has an implicit type
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml: properties:maxim,i2c-clock-frequency: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	8470 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	28300 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	84700 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	105000 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	173000 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	339000 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	533000 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	837000 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml: ignoring, error in schema: properties: maxim,i2c-clock-frequency
Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml:0:0: /example-0/i2c@e66d8000/gmsl-deserializer@2c: failed to match any schema with compatible: ['maxim,max9286']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1574505

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

