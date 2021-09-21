Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158AE413C91
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 23:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235474AbhIUVgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 17:36:37 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:43949 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235478AbhIUVgd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 17:36:33 -0400
Received: by mail-oi1-f181.google.com with SMTP id w19so1196251oik.10;
        Tue, 21 Sep 2021 14:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dcgHDu7kuMN8cnYChJ8cfUIB89K+3PFZVOLd99yPVP4=;
        b=b6Cb23q6HcBOiEbNEQSZuc+icglKzpZ2snSCDqwKhw+R6YsG0cCORLF5Zx1rtshi3U
         Nowu4swuQ7zfb/3CiswfThoJfEG33opGojbO+DQqncIXkiH/IE8Ss+roponT0edrUbrL
         4JQ/JXxinuKA6yuUulJWK4/lEyYaWfvtJDQjFwLSvGvmiFG4zu+Ohx+O2BbFcE4BBNDM
         YKJsJ6l8J/XT7Na813RbfIRK1T0m/lzVokwtYybTDtf7x0de5urB2pVOLqTbL9h/5i+K
         dv0SAaBky8QnK68iESZA2cO82nlG+pS6exXrwxSFWr+wuxaP0/dieFjo8rBRDloD9vmT
         DLfQ==
X-Gm-Message-State: AOAM530kjagMD6zja1h90+3UYXuccqNSWo5bozr65PudXMA5j8IPdi5e
        la1f2Q4YNx11Y4jo242CHxBLki4Tmg==
X-Google-Smtp-Source: ABdhPJyuc7AGioITl/AaAT5ge4D3bes68aMCmfSUzK9Q3KRWrTmoIr2f77jsEUbtwEaJyC2od1/Rgw==
X-Received: by 2002:a05:6808:2099:: with SMTP id s25mr5584251oiw.97.1632260103974;
        Tue, 21 Sep 2021 14:35:03 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id o18sm40223ote.69.2021.09.21.14.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:35:03 -0700 (PDT)
Received: (nullmailer pid 3362639 invoked by uid 1000);
        Tue, 21 Sep 2021 21:35:00 -0000
Date:   Tue, 21 Sep 2021 16:35:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 11/11] media: dt-bindings: Convert Cadence CSI2RX
 binding to YAML
Message-ID: <YUpQBHQ2DFMx/E70@robh.at.kernel.org>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-12-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-12-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 15 Sep 2021 17:32:40 +0530, Pratyush Yadav wrote:
> Convert the Cadence CSI2RX binding to use YAML schema.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v4:
> - Add power-domains property.
> - Drop maxItems from clock-names.
> - Drop the type for data-lanes.
> - Drop uniqueItems from data-lanes. Move it to video-interfaces.yaml
>   instead.
> 
> Changes in v3:
> - Add compatible: contains: const: cdns,csi2rx to allow SoC specific
>   compatible.
> - Add more constraints for data-lanes property.
> 
> Changes in v2:
> - New in v2.
> 
>  .../devicetree/bindings/media/cdns,csi2rx.txt | 100 -----------
>  .../bindings/media/cdns,csi2rx.yaml           | 169 ++++++++++++++++++
>  2 files changed, 169 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt
>  create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
