Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1872984BB
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 21:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbfHUTr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 15:47:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39334 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730137AbfHUTrz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 15:47:55 -0400
Received: by mail-ot1-f67.google.com with SMTP id b1so3216111otp.6;
        Wed, 21 Aug 2019 12:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C8n3EGE8fCUkffxtiHztmM03n9mGmmnqa5eK5gkfx1M=;
        b=m1OrrRwtuwpFDcTX9vogiR//RSlgLWFxwfhMkWxdmxvxyzAXL+4I6zGmogwcyfsf6l
         gelEqEG84BfnEIZ7a5ZmQmPEWXqlqQKHuyaO2a4J3ITm3RXNkDMbc8qnUHhdI2fC0Cxt
         BaZhVsWDW1CskCceUy9DvEg5FfNxbfnZWJS9s9Q+8ZQfewr0JFzdjH+1UobDTg2VVkUa
         ZQTWfgyFwITeGYIIt0X+9hly4zZLWErYC2+wno7pJR6RwAlyMYYCeXP3Y/y6zhptJL+z
         0f2BKLc4Ph/QNCs76gkd3S5V7axAAOn/QsR9esJrXwVApIzKSyZPOV7b1PK9XUreP8QE
         oHig==
X-Gm-Message-State: APjAAAV40x1cwNwg/nfoyuah72LRdAh1WoO16k+Gh0zTL4QlbIxyzMDi
        XQgXj3q0sGVkjTzHcycedw==
X-Google-Smtp-Source: APXvYqyPBOjbUzYxabF2PFOi+Zm6Ej8OuiIFwmlwoCpn1ofT9KyPT9tlEKykj0/WSoltvPEeikfYyg==
X-Received: by 2002:a05:6830:4da:: with SMTP id s26mr26224158otd.223.1566416874320;
        Wed, 21 Aug 2019 12:47:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z16sm3154984oic.10.2019.08.21.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 12:47:53 -0700 (PDT)
Date:   Wed, 21 Aug 2019 14:47:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     tfiga@chromium.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, ddavenport@chromium.org,
        Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        frankie.chiu@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org
Subject: Re: [RFC,v4,1/4] media: dt-bindings: mt8183: Added camera ISP Pass 1
Message-ID: <20190821194752.GA15270@bogus>
References: <jungo.lin@mediatek.com>
 <20190807124803.29884-1-jungo.lin@mediatek.com>
 <20190807124803.29884-2-jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807124803.29884-2-jungo.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 07, 2019 at 08:48:00PM +0800, Jungo Lin wrote:
> This patch adds DT binding document for the Pass 1 (P1) unit
> in Mediatek's camera ISP system. The Pass 1 unit grabs the sensor
> data out from the sensor interface, applies ISP image effects
> from tuning data and outputs the image data or statistics data to DRAM.
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek,camisp.txt        | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> new file mode 100644
> index 000000000000..fa2713acceca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> @@ -0,0 +1,73 @@
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
> +- reg: Physical base address of the camera function block register and
> +  length of memory mapped region. Must contain an entry for each entry
> +  in reg-names.
> +- reg-names: Must include the following entries:
> +  "cam_sys": Camera base function block
> +  "cam_uni": Camera UNI function block
> +  "cam_a": Camera ISP P1 hardware unit A
> +  "cam_b": Camera ISP P1 hardware unit B
> +  "cam_c": Camera ISP P1 hardware unit C
> +- interrupts: Must contain an entry for each entry in interrupt-names.
> +- interrupt-names : Must include the following entries:
> +  "cam_uni": Camera UNI interrupt
> +  "cam_a": Camera unit A interrupt
> +  "cam_b": Camera unit B interrupt
> +  "cam_c": Camera unit C interrupt
> +- iommus: Shall point to the respective IOMMU block with master port
> +  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.
> +- clocks: A list of phandle and clock specifier pairs as listed
> +  in clock-names property, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: Must be "camsys_cam_cgpdn" and "camsys_camtg_cgpdn".
> +- mediatek,larb: Must contain the local arbiters in the current SoCs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +- power-domains: a phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,scp : The node of system control processor (SCP), see
> +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> +
> +Example:
> +SoC specific DT entry:
> +
> +		camisp: camisp@1a000000 {
> +			compatible = "mediatek,mt8183-camisp", "syscon";

syscon doesn't seem appropriate nor is it documented.

> +			reg = <0 0x1a000000 0 0x1000>,
> +					<0 0x1a003000 0 0x1000>,
> +					<0 0x1a004000 0 0x2000>,
> +					<0 0x1a006000 0 0x2000>,
> +					<0 0x1a008000 0 0x2000>;
> +			reg-names = "cam_sys",
> +					"cam_uni",
> +					"cam_a",
> +					"cam_b",
> +					"cam_c";
> +			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
> +					<GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
> +					<GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>,
> +					<GIC_SPI 256 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-names = "cam_uni",
> +					"cam_a",
> +					"cam_b",
> +					"cam_c";
> +			iommus = <&iommu M4U_PORT_CAM_IMGO>;
> +			clocks = <&camsys CLK_CAM_CAM>,
> +					<&camsys CLK_CAM_CAMTG>;
> +			clock-names = "camsys_cam_cgpdn",
> +					"camsys_camtg_cgpdn";
> +			mediatek,larb = <&larb3>,
> +					<&larb6>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +			mediatek,scp = <&scp>;
> +		};
> -- 
> 2.18.0
> 
