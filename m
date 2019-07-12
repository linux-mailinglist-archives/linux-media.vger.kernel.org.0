Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD5D966795
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 09:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfGLHRI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 03:17:08 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:15028 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726057AbfGLHRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 03:17:07 -0400
X-UUID: 268a7e11777f4c9c8ce4896cc5248063-20190712
X-UUID: 268a7e11777f4c9c8ce4896cc5248063-20190712
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 2031538665; Fri, 12 Jul 2019 15:16:58 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 12 Jul 2019 15:16:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 12 Jul 2019 15:16:55 +0800
Message-ID: <1562915814.27825.2.camel@mtksdaap41>
Subject: Re: [RFC PATCH V2 1/4] dt-bindings: mt8183: Added FD dt-bindings
From:   CK Hu <ck.hu@mediatek.com>
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <shik@chromium.org>, <devicetree@vger.kernel.org>,
        <Sean.Cheng@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <srv_heupstream@mediatek.com>, <po-yang.huang@mediatek.com>,
        <suleiman@chromium.org>, <jungo.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <yuzhao@chromium.org>,
        <linux-mediatek@lists.infradead.org>, <zwisler@chromium.org>,
        <christie.yu@mediatek.com>, <frederic.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
Date:   Fri, 12 Jul 2019 15:16:54 +0800
In-Reply-To: <1562661672-22439-2-git-send-email-Jerry-Ch.chen@mediatek.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
         <1562661672-22439-2-git-send-email-Jerry-Ch.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 01D485D90E4193B16D3DAB4E8F27AE66C4A63D8F503F77DC805346543E9061B22000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Jerry:

On Tue, 2019-07-09 at 16:41 +0800, Jerry-ch Chen wrote:
> From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> This patch adds DT binding documentation for the Face Detection (FD)
> unit of the Mediatek's mt8183 SoC.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-fd.txt          | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> new file mode 100644
> index 0000000..0837223
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> @@ -0,0 +1,33 @@
> +* Mediatek Face Detection Unit (FD)
> +
> +Face Detection (FD) unit is a typical memory-to-memory HW device.
> +It provides hardware accelerated face detection function, and it
> +is able to detect different poses of faces. FD will writre result
> +of detected face into memory as output.
> +
> +Required properties:
> +- compatible: "mediatek,mt8183-fd"
> +- mediatek,scp : the node of system control processor (SCP), see
> +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> +- iommus: should point to the 3 entries:  M4U_PORT_CAM_FDVT_RP,
> +  M4U_PORT_CAM_FDVT_WR and M4U_PORT_CAM_FDVT_RB.  (Please see
> +  Documentation/devicetree/bindings/iommu/mediatek,iommu.txt for details.)
> +- reg: Physical base address and length of the register space.
> +- interrupts: interrupt number to the cpu.
> +- clocks : must contain the FDVT clock, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must be "fd".
> +
> +Example:
> +	fd: fd@1502b000 {
> +		compatible = "mediatek,mt8183-fd";
> +		mediatek,scp = <&scp>;
> +		iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
> +			 <&iommu M4U_PORT_CAM_FDVT_WR>,
> +			 <&iommu M4U_PORT_CAM_FDVT_RB>;
> +		reg = <0 0x1502b000 0 0x1000>;
> +		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&imgsys CLK_IMG_FDVT>;
> +		clock-names = "fd";

This device has no power-domain?

Regards,
CK

> +	};
> +


