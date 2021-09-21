Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E145413C7D
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 23:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbhIUVeJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 17:34:09 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:47061 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbhIUVeI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 17:34:08 -0400
Received: by mail-oi1-f172.google.com with SMTP id s69so1136624oie.13;
        Tue, 21 Sep 2021 14:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qDO1fvNwhfLREKr/5ATsuvM8YFuU+0xw+gUsA5EGmvk=;
        b=Ojl3kGaYi8ujlkkCqUQ/z8fduZviywcnNplbCX6xtnFsZ1witfypRWidr2iQeuD7Do
         H10u2uLVih2q6VHtk/zBK8bJAvI41Nj9lhw3sEo3MOQfNDtHhaWmy6Uw1WwCR9MS/tSG
         klUX+lisJbhQ8EvDjbHqKCU6KlcNb7WdhLrys/YDUq71Ranj3yRN6ExQJAA2LM+hdQvl
         V8Vs59SrFCumqEkxujfJbdRdlH3+sJFJvVd5mLkUyb404tEjKBN/ZPMO4XrlThye6iYQ
         HAqc2XcfN5Du3wWrHlklR+QDC2q9adSBrWTo4vCwraZrN3GUkZBfiGibYmUX7CU1jf1e
         ihKw==
X-Gm-Message-State: AOAM531z7BVuYD/XTDmZmqnWzXTqtuaNyrzRyhwmfcMC7Sv435fnTJSY
        Aq09ylLVAuLtHFnWUfOGzw==
X-Google-Smtp-Source: ABdhPJwFa4ByiEhygBH5y0xgNlCz55dCTlPSBcXL8rW3zgHYH+RGzySuP3g+1fuRljgvV89NE8wgbg==
X-Received: by 2002:a05:6808:570:: with SMTP id j16mr5246148oig.119.1632259959323;
        Tue, 21 Sep 2021 14:32:39 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id d7sm59473ooa.36.2021.09.21.14.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:32:38 -0700 (PDT)
Received: (nullmailer pid 3359413 invoked by uid 1000);
        Tue, 21 Sep 2021 21:32:37 -0000
Date:   Tue, 21 Sep 2021 16:32:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 10/11] media: dt-bindings: Add DT bindings for TI
 J721E CSI2RX driver
Message-ID: <YUpPdbv2YoBJ+4Z5@robh.at.kernel.org>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-11-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-11-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 15 Sep 2021 17:32:39 +0530, Pratyush Yadav wrote:
> TI's J721E uses the Cadence CSI2RX and DPHY peripherals to facilitate
> capture over a CSI-2 bus. The TI CSI2RX platform driver glues all the
> parts together.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Rename to ti,j721e-csi2rx.yaml
> - Add an entry in MAINTAINERS.
> - Add a description for the binding.
> - Change compatible to ti,j721e-csi2rx to make it SoC specific.
> - Remove description from dmas, reg, power-domains.
> - Remove a limit of 2 from #address-cells and #size-cells.
> - Fix add ^ to csi-bridge subnode regex.
> - Make ranges mandatory.
> - Add unit address in example.
> - Add a reference to cdns,csi2rx in csi-bridge subnode.
> - Expand the example to include the csi-bridge subnode as well.
> - Re-order subject prefixes.
> 
>  .../bindings/media/ti,j721e-csi2rx.yaml       | 101 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
