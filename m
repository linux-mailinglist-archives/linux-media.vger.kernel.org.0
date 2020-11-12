Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468302B07F5
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 15:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgKLO6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 09:58:49 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37136 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgKLO6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 09:58:48 -0500
Received: by mail-oi1-f196.google.com with SMTP id m17so6675792oie.4;
        Thu, 12 Nov 2020 06:58:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WLzNUTlYdAOChD/OrfQl6sAi8zolpG+MVa+pwutnNGA=;
        b=nxuiNzU8mlyhOWzeVM/yZzcyqYnaDV4UcqP0fOwRx151qpwoc+2+SD4acaYrjAN4BP
         bzDtCSA6Cc0NcLhJvUiYSduPd6bVI/QETOoR/TviZX/YOU5gxKV8mrnGzTieRzxPvOj6
         iJfLCF5MzBCBgEWG/Gt0xhb119f5T9Gt6BWjROf+837nPXezchPqfubONP9PyrtR+1gV
         k1SLktxVokjjESy1s2crNYWKOzW2VnRRXlXwc74TJTmSod15WNt2O2mgR7OnOqOQ5Mq2
         /8igpzxOlRXG2PfbYPZvRhLrgtJoEcNQm2Mu5edsyJ7pEGiaB14W4A+G3niM2zRzFkXm
         nYFg==
X-Gm-Message-State: AOAM5320hDGAM9I/N8hfPMwj7bX26cQM/yE3YQ8C9rXOHtNn7Pzp7Axo
        UvvBE9qm2psGDnEGN/6Vog==
X-Google-Smtp-Source: ABdhPJwevsP+d5IiXnXfxzejc+VnA++zm291UgVkC1X1zIf3QbQ2dGa9ppy3G1EAyIhZs0A/0zI1zg==
X-Received: by 2002:aca:df8b:: with SMTP id w133mr5932336oig.131.1605193127785;
        Thu, 12 Nov 2020 06:58:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d8sm1268173otl.15.2020.11.12.06.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 06:58:47 -0800 (PST)
Received: (nullmailer pid 3589542 invoked by uid 1000);
        Thu, 12 Nov 2020 14:58:46 -0000
Date:   Thu, 12 Nov 2020 08:58:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        newbytee@protonmail.com, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2 v4] dt-bindings: leds: Add DT binding for Richtek
 RT8515
Message-ID: <20201112145846.GA3588803@bogus>
References: <20201112115646.2562467-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112115646.2562467-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 12 Nov 2020 12:56:45 +0100, Linus Walleij wrote:
> Add a YAML devicetree binding for the Richtek RT8515
> dual channel flash/torch LED driver.
> 
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: phone-devel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Add DT attributes for the RFS and RTS resistors, so that
>   the hardware-defined maximum current can be determined.
> - Add torch-max-microamp to the common bindings so we can
>   set an attribute for the max microamp in torch mode.
> - Add flash-max-microamp and torch-max-microamp as optional
>   to the LED node.
> - Slot in some elabortative descriptions of the new
>   properties and describe what the hardware is doing.
> - Cc phone-devel@vger.kernel.org
> ChangeLog v2->v3:
> - Add Sakari to CC
> - Resend
> ChangeLog v1->v2:
> - Explicitly inherit function, color and flash-max-timeout-us
>   from common.yaml
> - Add "led" node as required.
> ---
>  .../devicetree/bindings/leds/common.yaml      |   6 +
>  .../bindings/leds/richtek,rt8515.yaml         | 111 ++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rts:maximum: False schema does not allow 367000
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rts:minimum: False schema does not allow 7680
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rfs:maximum: False schema does not allow 367000
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rfs:minimum: False schema does not allow 7680
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rts: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('maximum', 'minimum', 'maxItems' were unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rts: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rts: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rfs: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('maximum', 'minimum', 'maxItems' were unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rfs: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: properties:richtek,rfs: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml: ignoring, error in schema: properties: richtek,rfs: maximum
warning: no schema found in file: ./Documentation/devicetree/bindings/leds/richtek,rt8515.yaml


See https://patchwork.ozlabs.org/patch/1398897

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

