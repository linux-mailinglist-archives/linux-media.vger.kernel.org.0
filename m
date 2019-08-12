Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2B528AAE4
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 01:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfHLW74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 18:59:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39553 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfHLW7z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 18:59:55 -0400
Received: by mail-ot1-f67.google.com with SMTP id r21so159453994otq.6;
        Mon, 12 Aug 2019 15:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wfqkapTLzty9tIGiNjJX/GNLl3mKFpBX5RHcS25GDOc=;
        b=uPJ1y5MMz2mXIb8UGO6iYhtl8ARHx2+N8Ird/VVvfN5NAwR5isbFlmtauAxMsCl2yH
         lZwuybh/X7QHeL3GffIgiGa2blMtujG1TSthlcWOflHyXFhodCRoXd8TuhQtZA2jCyZh
         ToqvcArwu6lpznpTiUPYsZIKucvTvcs4G7z04cNW8aipXAoaXk1bGO2sc+cdv734xwqO
         9DlYzicg6tBzrtoTkloEG791nkXro+cozB6LAeBz1raOFQxx5J1KuXLQL09L6cxUPKtG
         e5w+z6Ev7wODgKI2x7QsotO+aC+2QvjBzAhHhDzTMFMUZjjgia4CqNLgiPE0bQ9Z7jrF
         S3Tw==
X-Gm-Message-State: APjAAAUY9htEfasQos9FNmHlJdOXncmjagl94nCel7kPN+YYn6FbFvjY
        J9IxWRVmsn4sZ48QakRCiw==
X-Google-Smtp-Source: APXvYqwmEe/FyoKdinwwGB2N4dWJ7LVtCusVQVC4ngZudckeh8J0RW2j1KLcpC1O8ucq5RcQHumzMw==
X-Received: by 2002:a02:4881:: with SMTP id p123mr13646129jaa.69.1565650794550;
        Mon, 12 Aug 2019 15:59:54 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id p13sm19586044ioo.72.2019.08.12.15.59.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 15:59:53 -0700 (PDT)
Date:   Mon, 12 Aug 2019 16:59:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com
Subject: Re: [PATCH 1/5] media: dt-bindings: Add JPEG ENC device tree node
 document
Message-ID: <20190812225952.GA31298@bogus>
References: <20190717093034.22826-1-xia.jiang@mediatek.com>
 <20190717093034.22826-2-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717093034.22826-2-xia.jiang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 17, 2019 at 05:30:30PM +0800, Xia Jiang wrote:
> add JPEG ENC device tree node document
> 
> Change-Id: I9f0a8aec7eced20c88acbc88d6ff179763f91246

Run checkpatch.pl. (Remove this)

> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-encoder.txt  | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> new file mode 100644
> index 000000000000..1231fedb70bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> @@ -0,0 +1,33 @@
> +* MediaTek JPEG Encoder
> +
> +MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> +
> +Required properties:
> +- compatible : must be "mediatek,mtk-jpgenc"

Needs an SoC specific compatible.

> +- reg : physical base address of the JPEG encoder registers and length of
> +  memory mapped region.
> +- interrupts : interrupt number to the interrupt controller.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.
> +- power-domains: a phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,larb: must contain the local arbiters in the current SoCs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.
> +
> +Example:
> +	jpegenc: jpegenc@1500a000 {
> +		compatible = "mediatek,mtk-jpgenc";
> +		reg = <0 0x1500a000 0 0x1000>;
> +		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> +		clocks =  <&imgsys CLK_IMG_VENC>;
> +		clock-names = "jpgenc";
> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> +		mediatek,larb = <&larb2>;
> +		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
> +			<&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
> +	};
> -- 
> 2.18.0
> 
