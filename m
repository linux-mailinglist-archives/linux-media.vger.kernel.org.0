Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1F92AF8B1
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 20:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgKKTIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 14:08:02 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33755 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgKKTIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 14:08:00 -0500
Received: by mail-oi1-f193.google.com with SMTP id k26so3420132oiw.0;
        Wed, 11 Nov 2020 11:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lKYsuP7JcgZ3dTv8zCnL98F7cIgH1tSEd4tXAmcFHQg=;
        b=Htr67OKZjfQNLbZ9YLUtJhrx7WkB+juE5D0kL0IAS+YB5uRjaxj30dbBgOR6pEoc2s
         UrOyPWp7z3duiVOLq+zl3e26eGhSxKu9y9pLjrOwRj98LGV+vmzaoboswq+SrKV5qOz6
         Aix9V+ncZtYGIOvzfHWVYJjW6msrMTtWmousSi8VjtqVB1kN5crqBO36s9eROb2Dz2zn
         Ob7fGJ7SBAsbiemqLKpNNwPfVDXH4FIkJUcUl0se0lxsV43D805ErCJ9dfLYVb9eaAzX
         i311TVZhCl8tUVzlOAwOnMKHgrVW6CoucKALDzhWoqoHp11ekshhqSVnbQiojo2XF5ut
         s15w==
X-Gm-Message-State: AOAM531IYW7sIBLlfHJ0Q+ztaX/9nhVzssd97FE7+y6ejq+tFDDQAl+L
        9p9F10CcHdrPBsfINc57UQ==
X-Google-Smtp-Source: ABdhPJykLz6virMM5Yvi3ZFNYUwrLseTff6cf1WfFdz4V9wMCnNso6n9l43zDqPnGljm/I/kIepOww==
X-Received: by 2002:aca:3756:: with SMTP id e83mr3112437oia.31.1605121679378;
        Wed, 11 Nov 2020 11:07:59 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o29sm697824ote.7.2020.11.11.11.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 11:07:58 -0800 (PST)
Received: (nullmailer pid 1844741 invoked by uid 1000);
        Wed, 11 Nov 2020 19:07:57 -0000
Date:   Wed, 11 Nov 2020 13:07:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     sakari.ailus@iki.fi, devicetree@vger.kernel.org, jacopo@jmondi.org,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Message-ID: <20201111190757.GB1844086@bogus>
References: <20201110151116.161260-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110151116.161260-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 10 Nov 2020 17:11:14 +0200, Eugen Hristev wrote:
> Add bindings documentation for Microchip CSI2 Demultiplexer controller.
> 
> CSI2DC is a demultiplexer from Synopsys IDI interface specification to
> parallel interface connection or direct memory access.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v4:
> - Removed property for inter-line-delay and for clock continuous/non-continuous
> - Removed virtual channel by reg for second endpoint
> 
> Changes in v3:
> - Removed some text from description, as it was explained in the schema
> - fixed other things as per Rob's review
> - moved some text inside the schema, like the clock description
> 
> Changes in v2:
> - fixed warnings reported by dt_binding_check
> 
>  .../bindings/media/microchip,csi2dc.yaml      | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/media/microchip,csi2dc.yaml


See https://patchwork.ozlabs.org/patch/1397687

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

