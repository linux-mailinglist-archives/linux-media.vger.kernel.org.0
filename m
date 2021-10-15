Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5A542F44A
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 15:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240114AbhJONzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 09:55:10 -0400
Received: from mail-oo1-f53.google.com ([209.85.161.53]:45907 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240100AbhJONzJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 09:55:09 -0400
Received: by mail-oo1-f53.google.com with SMTP id o26-20020a4abe9a000000b002b74bffdef0so1533665oop.12;
        Fri, 15 Oct 2021 06:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=MBfM52TAP9lKL/6Gl7yI25EmsGYtvq4gyePCT2agpMQ=;
        b=imido5kugJ0xTYU5vsbVoxQZRNxaK19nf9nAD3iLFq589wD9sRLkKl0xHO1afwW1Jm
         Zm+RUvaiXkBRIkhrEQFDfR6GHNU+jbIyiiPj8dnsPIId495OM02iJ2/xor100JmiqWyx
         s5VzoLNq7QL1mr2uPMTCXwAC+qlpmTbKBjGYTw76Suzq9pd1Z6cwkyHXsqr9e+bGgyxy
         XmaQkWIlCs9rNT9KPi4dN7mx72ZmuIwn2VsDwI8WcYQ+7/jUyI9IWb2kvufROCrOaw0o
         z5O4pyJjavupjJBJrkHxWPWQct7pgACLNhQ849eyHxmtyIgP+odEqXc6xIRx78UrsKf8
         SxGA==
X-Gm-Message-State: AOAM530pBAM+6XuGVBmZTWxAJniic10xPG3BxcGxSoCXdGI7m5HVVs1K
        IyfiXE6bBn0hn/Vol7Kryg==
X-Google-Smtp-Source: ABdhPJyHrcyH0IYdVYc3VAEsZQLEvwixo7nzXLImwa/q6EvuSp4NIVJTAezX3k//hM3MoQaf/pvxbg==
X-Received: by 2002:a4a:6514:: with SMTP id y20mr9198844ooc.9.1634305982613;
        Fri, 15 Oct 2021 06:53:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l25sm1005679oot.36.2021.10.15.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 06:53:01 -0700 (PDT)
Received: (nullmailer pid 1429890 invoked by uid 1000);
        Fri, 15 Oct 2021 13:53:00 -0000
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
In-Reply-To: <20211015072830.8580-1-maxime@cerno.tech>
References: <20211015072830.8580-1-maxime@cerno.tech>
Subject: Re: [PATCH v3] dt-bindings: media: Convert OV5640 binding to a schema
Date:   Fri, 15 Oct 2021 08:53:00 -0500
Message-Id: <1634305980.862848.1429889.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 15 Oct 2021 09:28:30 +0200, Maxime Ripard wrote:
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
> 
> ---
> 
> Changes from v2:
>   - Fix whitespace error
>   - Changed schema referenced for the port validation
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

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1541399

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

