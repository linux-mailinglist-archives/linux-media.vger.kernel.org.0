Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0EFA286331
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgJGQGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:06:10 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36879 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGQGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:06:10 -0400
Received: by mail-ot1-f68.google.com with SMTP id o8so2720575otl.4;
        Wed, 07 Oct 2020 09:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iOfvag4nQQp/C0yZrxq0ShXAtah0RalX8AW7nljW130=;
        b=C1sceDKLe2osRTr5pRziAV8ltdLLcBHq77Ee8apRORj6bQ1r0R33wy0zjZNjRWyt4l
         uGmhVL8mo4bp9+fl6h4KH/a7vPoLmGSsU9ygoe0dj4fKg3khoz/CKspADwgXDrqtzdUC
         Ii6GKVwGlbzCS+n3bNFHGORqXwaDku5bmeZgrtN9N+QyCtG7GhaLZAt3npCGP10bb2z4
         CEySaOCum9IJdKNuioDdu8HvdWWC4KovYjafCRmBoq8h428HoBgL2TRT61cxXzNkZfyX
         m7cql6iBz6qXls0jKKkm10gwY0InT7TOQHUo9+z2ScW4jI56VxsCmuKtwn6cux+bDOf8
         Ethw==
X-Gm-Message-State: AOAM531qwII9/jz1FNIMNVm1Ey1N0KnhExqNtUVwbiunesgkmIJ79gbF
        Dx0Lgl8p0xIAqxyGJ3E9a/L3BFzbF1nA
X-Google-Smtp-Source: ABdhPJxRkC+tlpB/maDyICbMX+Jh7GkC4flap5PWQyPDIDCx5VQ4EZQjB6vm4Ig25TDc94N0nGsN3Q==
X-Received: by 2002:a9d:73d6:: with SMTP id m22mr2411600otk.17.1602086768585;
        Wed, 07 Oct 2020 09:06:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m25sm1825036otl.71.2020.10.07.09.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:06:08 -0700 (PDT)
Received: (nullmailer pid 305757 invoked by uid 1000);
        Wed, 07 Oct 2020 16:06:07 -0000
Date:   Wed, 7 Oct 2020 11:06:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 023/106] dt-bindings: nokia,smia: Convert to YAML
Message-ID: <20201007160607.GA305704@bogus>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084505.25761-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007084505.25761-5-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Oct 2020 11:45:00 +0300, Sakari Ailus wrote:
> Convert nokia,smia DT bindings to YAML.
> 
> Also add explicit license to bindings.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../bindings/media/i2c/nokia,smia.txt         |  67 -----------
>  .../bindings/media/i2c/nokia,smia.yaml        | 106 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 107 insertions(+), 68 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
