Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D1F10F4A
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 00:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfEAWqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 May 2019 18:46:50 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46726 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfEAWqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 May 2019 18:46:50 -0400
Received: by mail-ot1-f66.google.com with SMTP id 77so349170otu.13;
        Wed, 01 May 2019 15:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hTyewxaqn7LAiT2SH+DZREdfXU1PNz3ufBiht/yAAn0=;
        b=VIqXHF2MuCxwKGRl5V3NDhAeB154K64JaNdFk1o53vjLMZGT6+zoZmCmh7o/ZhCdmV
         NS9c4fCa15n6iDxX0FVf9ZuWBlZjDLROLtFZe2mzcrLJkrSsdqFfGOX0DquFD1xph7Dp
         Z2DLV9TZNiCbxPK1FCFX1mdKgZv0ETLobpmxx0eHXrSHftoWjAoIg3ZWw3U3elhQEr7W
         4QhOsxzBQEqBsea4ohumrfGKcRZ26023NJScIT+Kyv5b1osVBpw7EbD3r4oVfqeaNLdH
         9+HXwvFQlVd8NLAAQTMr5ljGj8+uIHDfDptSm0+HMlDBeIOiBQkzGBGtWIJewmHG+SDD
         lFgg==
X-Gm-Message-State: APjAAAUZNzQS80A0ANyabto8QoXlEeLMljYnVNKAWi81EGCGSd39uP76
        zOp9HCz6R9gjSVInUv8eGXmf1l2yhA==
X-Google-Smtp-Source: APXvYqxx6FkC5f0arUAphcB6iggn1JI8NSGZcl25tCDEnnaao5v/3Yw/L/PJSTrJwGTYqIcAZWMyPg==
X-Received: by 2002:a9d:615a:: with SMTP id c26mr342832otk.76.1556750809579;
        Wed, 01 May 2019 15:46:49 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q124sm17147876oia.13.2019.05.01.15.46.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 15:46:48 -0700 (PDT)
Date:   Wed, 1 May 2019 17:46:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, frederic.chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, shik@chromium.org,
        suleiman@chromium.org
Subject: Re: [RFC PATCH V1 3/6] dt-bindings: mt8183: Added FD dt-bindings
Message-ID: <20190501224647.GA12044@bogus>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
 <20190423104505.38778-4-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423104505.38778-4-Jerry-Ch.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 23, 2019 at 06:45:02PM +0800, Jerry-ch Chen wrote:
> From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> This patch adds DT binding documentation for the Face Detection (FD)
> unit of the camera system on Mediatek's SoCs.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-fd.txt     | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> new file mode 100644
> index 000000000000..97c12fd93e7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> @@ -0,0 +1,34 @@
> +* Mediatek Face Detection Unit (FD)
> +
> +Face Detection (FD) unit is a typical memory-to-memory HW device.
> +It provides hardware accelerated face detection function, and it
> +is able to detect different poses of faces. FD will writre result
> +of detected face into memory as output.
> +
> +Required properties:
> +- compatible: "mediatek,mt8183-fd"
> +- reg: Physical base address and length of the function block register space
> +- interrupts: interrupt number to the cpu.
> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.

How many entries? Looks like 3 from the example.

> +- mediatek,larb: must contain the local arbiters in the current Socs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +- clocks : must contain the FDVT clock
> +- clock-names: must contain FD_CLK_IMG_FD
> +
> +Example:
> +	fd:fd@1502b000 {
           ^ space needed

> +		compatible = "mediatek,mt8183-fd";
> +		mediatek,larb = <&larb5>;
> +		mediatek,scp = <&scp>;
> +		iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
> +			 <&iommu M4U_PORT_CAM_FDVT_WR>,
> +			 <&iommu M4U_PORT_CAM_FDVT_RB>;
> +		reg = <0 0x1502b000 0 0x1000>;
> +		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&imgsys CLK_IMG_FDVT>;
> +		clock-names = "FD_CLK_IMG_FD";
> +	};
> +
> -- 
> 2.18.0
> 
