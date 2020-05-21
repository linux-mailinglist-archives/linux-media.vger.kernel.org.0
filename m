Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA971DD29E
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 18:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgEUQAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 12:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbgEUQAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 12:00:50 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912C9C061A0F
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 09:00:50 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v19so200122wmj.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l1/7oVopGR8ZQd6NaIEuCXZDCOqHLrR/3N7LZWtpNqA=;
        b=GeTX2t72tcZNw5Q1Vq3bxOOwmr927HcyIkpXvBpKk0ZxuhWAwrGZ2fRvHtBA+vCd0a
         shiz7RMixnasTu8+CYC9VSFQPu/XFvPZUYSqT+77V10ReU/ZVMLAWMEwJi0ovuk6Cshd
         DWBNncRW5nBLTOcjfC9jlB3vujEzgdkgNY/1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l1/7oVopGR8ZQd6NaIEuCXZDCOqHLrR/3N7LZWtpNqA=;
        b=kXDDJpudbJnWdvEo/te1EQ8ZqVQrpd9kmyVNSJ2M8a3TX+arO0pax3Gm6eWrHub3FD
         6Hk1ZHTzPMYnZe7PUkUxMH3XmCC60RUCDTL0JhpezfXpSHnD/U+NuBnO9w7teSYEl4J1
         ptlMhiOslTIzsoJGc+9QpSyIfZ6zD9Puhxp7MYcJJG2Ogg3o+nsPQD+q3Hlmith2wXpL
         TsSaKsIicS0ziQASCXmUbjEpSW6E/d1qKHmIZV4GJMzam8DePu04KVLZ+Z3KFwMrtsKJ
         dCX1zde3vfztf3WgWuZOIgxwRb2TnfHxFDYppeIPTTAykrUsKrmpbdKq22iIu3iy4O9x
         QKzw==
X-Gm-Message-State: AOAM533OxaV8K/QptkKYNyLl6taOVvQfzhMuNb/DaM08+6bVsGwk7/qj
        ur2dn4te9OzhV+/+EUZtmz64/A==
X-Google-Smtp-Source: ABdhPJwBbbkzQM0pkq+XJy1eUeL/VqXKXEJpvr6yzQ+SOqXN0RpdIlsOxlmRNdPbmgSFjRlsFB6ApA==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr8868032wmj.146.1590076848935;
        Thu, 21 May 2020 09:00:48 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id y207sm7661823wmd.7.2020.05.21.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:00:48 -0700 (PDT)
Date:   Thu, 21 May 2020 16:00:46 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com,
        yong.wu@mediatek.com
Subject: Re: [PATCH v8 11/14] media: dt-bindings: Add jpeg enc device tree
 node document
Message-ID: <20200521160046.GJ209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-12-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-12-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:30PM +0800, Xia Jiang wrote:
> Add jpeg enc device tree node document
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> 
> v7: no changes
> 
> v6: no changes
> 
> v5: no changes
> 
> v4: no changes
> 
> v3: change compatible to SoC specific compatible
> 
> v2: no changes
> ---
>  .../bindings/media/mediatek-jpeg-encoder.txt  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> new file mode 100644
> index 000000000000..fa8da699493b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> @@ -0,0 +1,37 @@
> +* MediaTek JPEG Encoder
> +
> +MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> +
> +Required properties:
> +- compatible : should be one of:
> +               "mediatek,mt2701-jpgenc"
> +               ...

What does this "..." mean?

> +               followed by "mediatek,mtk-jpgenc"
> +- reg : physical base address of the JPEG encoder registers and length of
> +  memory mapped region.
> +- interrupts : interrupt number to the interrupt controller.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.

nit: In principle the clocks should be named after the function the clock
performs on the consumer side, i.e. the JPEG block in this case, I guess
here it's just a generic clock that does everything, but I guess it comes
from somewhere. Is it the AHB clock or something? In that case it would
normally be called "ahb".

> +- power-domains: a phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,larb: must contain the local arbiters in the current SoCs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.

I believe this isn't necessary anymore, because larbs are added
automatically by the MTK IOMMU driver using device links. +CC Yong who
worked on that.

> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.
> +
> +Example:
> +	jpegenc: jpegenc@1500a000 {
> +		compatible = "mediatek,mt2701-jpgenc",
> +			     "mediatek,mtk-jpgenc";
> +		reg = <0 0x1500a000 0 0x1000>;
> +		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> +		clocks =  <&imgsys CLK_IMG_VENC>;
> +		clock-names = "jpgenc";
> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> +		mediatek,larb = <&larb2>;

Ditto.

Best regards,
Tomasz
