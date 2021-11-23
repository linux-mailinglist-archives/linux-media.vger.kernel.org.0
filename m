Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45F445A7FF
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 17:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237376AbhKWQh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 11:37:59 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:42980 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236559AbhKWQh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 11:37:56 -0500
Received: by mail-io1-f48.google.com with SMTP id x10so28720736ioj.9;
        Tue, 23 Nov 2021 08:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=slqXKFhgdTYySkX9nZNHik88KwfWlzq8wG1ZkB3HnKE=;
        b=uX82T8MQtzAVcoGwzhtNxo49nfA2W5MZm6hnnOwkiqKOvFrVNNgL3jC8jGz2/tDaeo
         lfU8Z4Zez8j5rN63f4RQOc2D4EiuS3lXe+p5i60beLC+gsQSBLHHNBUaG9NhBNZ2t9ay
         JZSuqSHIzGFtNPqNGjh+hnAUmKb+eQrrVND2EdwDNZiScNQ/bRAT7Tp+iaJE0+2EXMZR
         KzhxWFOtADdtKs1VwD3XAR0qD9LpL/+sS0V5RZaKl1itHWZ6gQymoKc3iieCNLF25UDr
         pwj4WSax8MWVj6apnlGRKzNBqqV+okmhftf8O4T8SC4wGJAZbwcsa/X4GKguY/UnFNjj
         wk1w==
X-Gm-Message-State: AOAM533O5e5rDh/vP9CUIUOtUGrNEC3laDHU3u8npGMsK4RawJpIq6em
        0qF8t5Dr5Hm0iMishbAPZg==
X-Google-Smtp-Source: ABdhPJzA8ris3g/X5WP3kZdrctnemUsTCOcqWH9f6MvH8q8UdrjPL/tSfm4rUj6xrAAROn2uoOnh0g==
X-Received: by 2002:a05:6638:2728:: with SMTP id m40mr7891072jav.111.1637685287905;
        Tue, 23 Nov 2021 08:34:47 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h14sm7403051ils.75.2021.11.23.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:34:47 -0800 (PST)
Received: (nullmailer pid 3442910 invoked by uid 1000);
        Tue, 23 Nov 2021 16:34:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ian Arkver <ian.arkver.dev@gmail.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, p.zabel@pengutronix.de
In-Reply-To: <20211123101517.3656935-3-m.tretter@pengutronix.de>
References: <20211123101517.3656935-1-m.tretter@pengutronix.de> <20211123101517.3656935-3-m.tretter@pengutronix.de>
Subject: Re: [PATCH v8 2/3] media: dt-bindings: Add Intersil ISL79987 DT bindings
Date:   Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.649925.3442909.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 23 Nov 2021 11:15:16 +0100, Michael Tretter wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add bindings for the Intersil ISL79987 analog to MIPI CSI-2 decoder.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-media@vger.kernel.org
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changelog:
> 
> v8: none
> 
> v7: none
> 
> v6: none
> 
> v5: none
> 
> v4: none
> 
> v3:
> 
> - rename pd-gpios property to powerdown-gpios
> - reference graph.yaml for ports/port properties
> - remove reference to video-interfaces.txt
> - remove unnecessary description of ports property
> 
> v2:
> 
> - convert binding to yaml
> - change description to match only isl79987
> - replace num-inputs property with multiple ports
> - add reset gpio
> ---
>  .../bindings/media/i2c/isil,isl79987.yaml     | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/isil,isl79987.example.dt.yaml: isl7998x_mipi@44: ports:port@0:endpoint: Unevaluated properties are not allowed ('clock-lanes', 'data-lanes' were unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558453

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

