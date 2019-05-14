Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 958221D032
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 21:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfENTyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 15:54:20 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42973 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfENTyU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 15:54:20 -0400
Received: by mail-oi1-f193.google.com with SMTP id k9so31191oig.9;
        Tue, 14 May 2019 12:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C+ZItGciIPASgYj7/Ptn729Sid8a7D/RwR0TY9v5hco=;
        b=TQKKA3haVYf0RxfW3OxnkXFxUovAjbKjszAqlFlFSJvloNdqeEZ81BOjLOor7vVCHm
         5Ku7BpBmy6OgcQtKDEjUNS9V1Vv9WP55s31pVF/uqRDohlfdjMO6jXjbKAsoOnrVO3ZS
         5g9K00tvZk6Kbiu0xybWuYllY+eHNdN8x3lHJMigp938KZ5esZeXdCWeYSqBPwdJCIoe
         REeDnk05c4vsSiENEQyk0MVr9FCcOG3dEdJYTSK7ldNgxwsRx/EDIfL1D9vt/HBsBgbM
         EX1jPagwgza4/2tTFXv9QQD4vkko3X+qWnW/GPvb2FMm3nvy6gdOOXkBtGxSl4DjhUpS
         VX0A==
X-Gm-Message-State: APjAAAV024KfYr0kytax4hLf2wEVRycO7d/P/fnzeSwt9D3sdMuBnU7g
        joEFRALAnjS2N9BGMNpTFg==
X-Google-Smtp-Source: APXvYqyHEO0/Oe6vVhAUyb8EIA+L34LbxLJvK3JECL1vuVctEaZdJC1Bl2pW46bJF/lbVCWFOylq2Q==
X-Received: by 2002:aca:ea89:: with SMTP id i131mr3814537oih.22.1557863658982;
        Tue, 14 May 2019 12:54:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p205sm6464011oia.49.2019.05.14.12.54.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 12:54:18 -0700 (PDT)
Date:   Tue, 14 May 2019 14:54:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     tfiga@chromium.org, hans.verkuil@cisco.com,
        laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        christie.yu@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com,
        seraph.huang@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org
Subject: Re: [RFC,V2,03/11] dt-bindings: mt8183: Added camera ISP Pass 1
Message-ID: <20190514195417.GA21726@bogus>
References: <jungo.lin@mediatek.com>
 <20190510015755.51495-4-jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510015755.51495-4-jungo.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 10, 2019 at 09:57:52AM +0800, Jungo Lin wrote:
> This patch adds DT binding document for the Pass 1 (P1) unit in
> Mediatek's camera ISP system. The Pass 1 unit grabs the sensor data
> out from the sensor interface, applies ISP image effects from tuning
> data and outputs the image data or statistics data to DRAM.
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek,camisp.txt        | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> new file mode 100644
> index 000000000000..759e55a5dfac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> @@ -0,0 +1,92 @@
> +* Mediatek Image Signal Processor Pass 1 (ISP P1)
> +
> +The Pass 1 unit of Mediatek's camera ISP system grabs the sensor data out
> +from the sensor interface, applies ISP effects from tuning data and outputs
> +the image data and statistics data to DRAM. Furthermore, Pass 1 unit has
> +the ability to output two different resolutions frames at the same time to
> +increase the performance of the camera application.
> +
> +Required properties:
> +- compatible: Must be "mediatek,mt8183-camisp" for MT8183.
> +- reg: Must contain an entry for each entry in reg-names.

Must list reg-names here and define the values. Though, I don't find 
cam1, cam2, cam3 to be too useful.

> +- interrupts: interrupt number to the cpu.
> +- iommus: shall point to the respective IOMMU block with master port
> +  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.

How many entries?

> +- power-domains : a phandle to the power domain of this local arbiter.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must be "CAMSYS_CAM_CGPDN" and "CAMSYS_CAMTG_CGPDN".
> +- mediatek,larb: must contain the local arbiters in the current SOCs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +- mediatek,scp : the node of system control processor (SCP), see
> +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> +- memory-region : the reserved shared memory region between Pass 1 unit and
> +  system control processor.
> +
> +Example:
> +SoC specific DT entry:
> +
> +	camisp: camisp@1a000000 {
> +		compatible = "mediatek,mt8183-camisp", "syscon";
> +		reg = <0 0x1a000000 0 0x1000>,
> +		      <0 0x1a003000 0 0x1000>,
> +		      <0 0x1a004000 0 0x2000>,
> +		      <0 0x1a006000 0 0x2000>;
> +		reg-names = "camisp",
> +		            "cam1",
> +		            "cam2",
> +		            "cam3";
> +		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "cam1",
> +				  "cam2",
> +				  "cam3";
> +		iommus = <&iommu M4U_PORT_CAM_LSCI0>,
> +			 <&iommu M4U_PORT_CAM_LSCI1>,
> +			 <&iommu M4U_PORT_CAM_BPCI>;
> +		#clock-cells = <1>;
> +		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +		/* Camera CCF */
> +		clocks = <&camsys CLK_CAM_CAM>,
> +			 <&camsys CLK_CAM_CAMTG>;
> +		clock-names = "CAMSYS_CAM_CGPDN",
> +			      "CAMSYS_CAMTG_CGPDN";
> +		mediatek,larb = <&larb3>,
> +				<&larb6>;
> +		mediatek,scp = <&scp>;
> +		memory-region = <&cam_mem_reserved>;
> +	};
> +
> +Reserved memory specific DT entry (see reserved memory binding for more
> +information):
> +
> +Example:
> +SoC specific DT entry:
> +
> +	cam_mem_reserved: cam_mem_region {
> +		compatible = "mediatek,reserve-memory-cam-smem";
> +		no-map;
> +		size = <0 0x01400000>; / *20 MB share mem size */
> +		alignment = <0 0x1000>;
> +		alloc-ranges = <0 0x40000000 0 0x10000000>;
> +	};
> +
> +Mediatek ISP P1 supports a single port node with MIPI-CSI2 bus. It should
> +contain one 'port' child node with child 'endpoint' node. Please refer to
> +the bindings defined in Documentation/devicetree/bindings/media/video-interfaces.txt
> +and Documentation/devicetree/bindings/media/mediatek-seninf.txt.
> +
> +Example:
> +Board specific DT entry:

Don't split examples like this.

> +
> +	&camisp {
> +		port@0 {
> +			seninf_0: endpoint {
> +				remote-endpoint = <&seninf_core>;
> +			};
> +		};
> +	};
> +
> -- 
> 2.18.0
> 
