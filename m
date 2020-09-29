Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BADB327D610
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 20:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgI2SrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 14:47:03 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43692 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgI2SrD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 14:47:03 -0400
Received: by mail-ot1-f67.google.com with SMTP id n61so5460744ota.10;
        Tue, 29 Sep 2020 11:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2ub5QSwG5goh2IuB8HSiDJr0/l381v0FcBDJjNMmShU=;
        b=bT5DQT04ODrsjeGGPH4u+CmPD5qHlU5f5QypBPu33y6bjO+PbaAzGG2LUJ+hgffveS
         YO/NmXnWhjZc5yFev+RkSWPYwmfwyhbRZhDke4CK12PfLokKRcyqfgl4Hv3mOCBcjQHh
         u3DL5SI16VPOcf0D/3POTItDCw/Hs6OFuEnnLa0nTWZhBHj8V1MHNBjuagsd1wce7Pw9
         ccxG91EQ3t/yqlAuYVTF0cgYx2Nu5aTIYrCpkbOWpkwz0B+zD4lPLV5KdcLHbESeymnj
         0QkVr1DIKSdpipUNPepTCAhtXSOkRyqey5hFNX5h/K/QyzS06VOhqm9wD8mzeCTSFyrS
         iMlw==
X-Gm-Message-State: AOAM533R1KvBryy5Gg6OblWpjXPGAVkQyGlXoWoPbVYfwQzq6v+ibnWx
        VgRKmH5WXutXhGYSlg3rNg==
X-Google-Smtp-Source: ABdhPJxKWTsaHsaQop2DV16OMCZcdwG/F5kYN0MsvjzDQXQ1OaWVmRls0LbBsT5QU+gvY7rflwRzeQ==
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr3883299oti.63.1601405222235;
        Tue, 29 Sep 2020 11:47:02 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g7sm1184488otk.56.2020.09.29.11.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:47:01 -0700 (PDT)
Received: (nullmailer pid 945194 invoked by uid 1000);
        Tue, 29 Sep 2020 18:47:01 -0000
Date:   Tue, 29 Sep 2020 13:47:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: convert CODA VPU bindings to yaml
Message-ID: <20200929184701.GA945136@bogus>
References: <20200923082112.26477-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923082112.26477-1-p.zabel@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 23 Sep 2020 10:21:12 +0200, Philipp Zabel wrote:
> Convert to YAML and add generic IP core compatibles "cnm,codadx6",
> "cnm,codahx4", "cnm,coda7541", and "cnm,coda960" in addition to the SoC
> specific compatibles. The new generic compatibles are already used in
> the SoC device trees and replace the free form comments. For example:
> 
> - compatible : should be "fsl,<chip>-src" for i.MX SoCs:
>   (a) "fsl,imx27-vpu" for CodaDx6 present in i.MX27
> 
> turns into:
> 
> properties:
>   compatible:
>     oneOf:
>       - items:
>           - const: fsl,imx27-vpu
>           - const: cnm,codadx6
> 
> This allows to properly specify the secondary JPEG unit interrupt that
> is only present on cnm,coda960.
> 
> Also add the missing "fsl,imx6dl-vpu", "cnm,coda960" compatible.
> The AXI bus connection to the internal SRAM is different between i.MX6Q
> and i.MX6DL, which requires the driver to load a different firmware
> depending on the SoC.
> 
> Further, specify the power-domain property for i.MX6 and change the
> clock order from "ahb", "per" to "per", "ahb". This order is currently
> used in all SoC device trees.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v1:
>  - Improve commit description
>  - Fix clock order in example
> ---
>  .../devicetree/bindings/media/coda.txt        |  31 -----
>  .../devicetree/bindings/media/coda.yaml       | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 110 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/coda.txt
>  create mode 100644 Documentation/devicetree/bindings/media/coda.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
