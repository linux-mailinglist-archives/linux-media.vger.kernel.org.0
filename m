Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37C23D1BA8
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 04:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhGVB3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 21:29:32 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:36767 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhGVB3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 21:29:31 -0400
Received: by mail-il1-f174.google.com with SMTP id j5so4062397ilk.3;
        Wed, 21 Jul 2021 19:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=TlKm5ePZLwQJBe1wkmaQN9IHmRIwAknOWNCVxhfWmGM=;
        b=JOZvvPXyQ2A90pFA3BzTHcQBi+2e34etCvvoKIL4YW0sFmR/UxrV1Exe8RaXG6T5Y/
         qgK5mmUeVezt58iHBBNpRfnbMhH2Y/Bm9UaMqB5hvAQ9qgLg6J7tbUqp4uyGLLjYN9TV
         hTJ3LXoGBQpqTWRRz9mPRwm5Vdllw0pAz6E64gZM0/1iMAc/tyHZHyUPuIribuc1FtRj
         qVqRLbpv+0gFTJB3F2FiqwdE0H2rAfPymNCDkaZ0P7eATaJokae2/9Cx3l+dcWkhJEH1
         GwOfSYNop6bE/YjdmzYXlFWzLcQ3cRnXzmEfQlcJuwmbysybnSiL7fDUi+q9VQJmknY7
         lk1A==
X-Gm-Message-State: AOAM533lU8zG3YOqmN+IRtKtpj9u4YMA745pYhq/ynZpbWcu9OLMlRJV
        aYBnLLOEzFWA/AgPmBcbjA==
X-Google-Smtp-Source: ABdhPJy5Am7fwkN7NxQY/rHF8sZ/J1ZNp8lHLTBYf3g65E2OTHq9qCAbtZeW9OtF8CsaYmvKPFhOtQ==
X-Received: by 2002:a05:6e02:1d89:: with SMTP id h9mr12846275ila.46.1626919807313;
        Wed, 21 Jul 2021 19:10:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m184sm15356355ioa.17.2021.07.21.19.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 19:10:06 -0700 (PDT)
Received: (nullmailer pid 3145329 invoked by uid 1000);
        Thu, 22 Jul 2021 02:09:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
In-Reply-To: <20210721140424.725744-23-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech> <20210721140424.725744-23-maxime@cerno.tech>
Subject: Re: [PATCH 22/54] dt-bindings: media: Convert OV5640 binding to a schema
Date:   Wed, 21 Jul 2021 20:09:56 -0600
Message-Id: <1626919796.971044.3145328.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 21 Jul 2021 16:03:52 +0200, Maxime Ripard wrote:
> The Omnivision OV5640 is supported by Linux thanks to its device tree
> binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: linux-media@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/media/i2c/ov5640.txt  |  92 -----------
>  .../bindings/media/i2c/ovti,ov5640.yaml       | 154 ++++++++++++++++++
>  2 files changed, 154 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'AVDD-supply' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'DVDD-supply' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'DOVDD-supply' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1508267

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

