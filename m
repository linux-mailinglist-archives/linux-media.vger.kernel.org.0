Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74B461999C8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 17:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbgCaPfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 11:35:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46840 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730760AbgCaPfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 11:35:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 217F12980F2
Subject: Re: [v6, 1/5] media: dt-bindings: mt8183: Added camera ISP Pass 1
To:     Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, ddavenport@chromium.org,
        robh@kernel.org, Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        frankie.chiu@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
 <20191219054930.29513-2-jungo.lin@mediatek.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <77afc8e7-26b8-471d-0ec0-c77a9c379433@collabora.com>
Date:   Tue, 31 Mar 2020 12:34:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20191219054930.29513-2-jungo.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On 12/19/19 3:49 AM, Jungo Lin wrote:
> This patch adds DT binding document for the Pass 1 (P1) unit
> in Mediatek's camera ISP system. The Pass 1 unit grabs the sensor
> data out from the sensor interface, applies ISP image effects
> from tuning data and outputs the image data or statistics data to DRAM.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
> Changes from v6:
>  - Add port node description in the dt-binding document.
> ---
>  .../bindings/media/mediatek,camisp.txt        | 83 +++++++++++++++++++

It would be really nice to convert this to yaml.

For reference: https://lwn.net/Articles/771621/

Regards,
Helen

>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> new file mode 100644
> index 000000000000..a85f37c0b87d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> @@ -0,0 +1,83 @@
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
> +- mediatek,scp: The node of system control processor (SCP), see
> +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> +- port: child port node corresponding to the data input, in accordance with
> +  the video interface bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt. The port
> +  node must contain at least one endpoint.
> +
> +Example:
> +SoC specific DT entry:
> +
> +	camisp: camisp@1a000000 {
> +		compatible = "mediatek,mt8183-camisp";
> +		reg = <0 0x1a000000 0 0x1000>,
> +				<0 0x1a003000 0 0x1000>,
> +				<0 0x1a004000 0 0x2000>,
> +				<0 0x1a006000 0 0x2000>,
> +				<0 0x1a008000 0 0x2000>;
> +		reg-names = "cam_sys",
> +				"cam_uni",
> +				"cam_a",
> +				"cam_b",
> +				"cam_c";
> +		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
> +				<GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
> +				<GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>,
> +				<GIC_SPI 256 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "cam_uni",
> +				"cam_a",
> +				"cam_b",
> +				"cam_c";
> +		iommus = <&iommu M4U_PORT_CAM_IMGO>;
> +		clocks = <&camsys CLK_CAM_CAM>,
> +				<&camsys CLK_CAM_CAMTG>;
> +		clock-names = "camsys_cam_cgpdn",
> +				"camsys_camtg_cgpdn";
> +		mediatek,larb = <&larb3>,
> +				<&larb6>;
> +		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +		mediatek,scp = <&scp>;
> +
> +		port {
> +			camisp_endpoint: endpoint {
> +				remote-endpoint = <&seninf_camisp_endpoint>;
> +			};
> +		};
> +	};
> 
