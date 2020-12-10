Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A18C2D5218
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 04:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730983AbgLJDwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 22:52:39 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34636 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730646AbgLJDw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 22:52:26 -0500
Received: by mail-ot1-f65.google.com with SMTP id a109so3667914otc.1;
        Wed, 09 Dec 2020 19:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1C2ZgD4c3kwcJxmbh6urjWdWq47a37O1f912W2JHtI4=;
        b=l/GY40VrgdGdwJHE1lub1MazvLo48qvbix//AGLk7nwtgogyYlSlUT1YifLfPCEN5i
         JNC8H7KAahsKfT6rZJSFSPxEozWJLEfFqED4sBr1iKGb/ovcohrJ7t3N0sdX0zFFOlUD
         25OKTYcsFVt58O8EmElsgi8Vhr/mYhUjbTcczyssV3r9k5vWIh8bXgwlGnyiK1jDCS5E
         f1u8DjE3zLfczvke4umn13KNvi2cq2SNaQ08nwv8+Dk5XA1LmSqcQeCl6MO1zDOfJc2g
         kkWhiKLWOyiwFZLc5ICfp3ACyei2hpH690DjTOJxt8lwsoXXOwfvFqFuHiq9WwVGH05S
         ZGSQ==
X-Gm-Message-State: AOAM530XUtuOcbXAXufgHOGzGrDSYO/3R4us1XIIrd1M+CZ6rxHiYG9Z
        icQcD1mujxOMijpjs14KL5wZonoc3A==
X-Google-Smtp-Source: ABdhPJzDMICehYF9zigVG2Heo0ODRVDoGVIedP1fHdVuyKntdE0VyoGj96p5QS6QYKA5W4Z7G+XzEA==
X-Received: by 2002:a9d:2643:: with SMTP id a61mr4503929otb.353.1607572305780;
        Wed, 09 Dec 2020 19:51:45 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h26sm44171ots.9.2020.12.09.19.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:51:45 -0800 (PST)
Received: (nullmailer pid 1627297 invoked by uid 1000);
        Thu, 10 Dec 2020 03:51:43 -0000
Date:   Wed, 9 Dec 2020 21:51:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     robh+dt@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, daniele.alessandrelli@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com, paul.j.murphy@linux.intel.com
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add bindings for imx334
Message-ID: <20201210035143.GA1627250@robh.at.kernel.org>
References: <20201207160109.490-1-martinax.krasteva@linux.intel.com>
 <20201207160109.490-2-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207160109.490-2-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 07 Dec 2020 16:01:07 +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx334 sensor driver.
> - Add MAINTAINERS entry for Sony imx334 binding documentation.
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 62 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
