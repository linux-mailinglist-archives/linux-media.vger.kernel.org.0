Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 780A159646
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 10:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfF1ImT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 04:42:19 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:53369 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726385AbfF1ImT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 04:42:19 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id gmSThkLi2SfvXgmSWhQywp; Fri, 28 Jun 2019 10:42:17 +0200
Subject: Re: [PATCH v5 08/10] media: dt-bindings: Document i.MX8MQ and i.MX8MM
 VPU bindings
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
References: <20190612093915.18973-1-p.zabel@pengutronix.de>
 <20190612093915.18973-9-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <315a8cd5-76c5-7fd3-3cfe-8ef47a46b4b4@xs4all.nl>
Date:   Fri, 28 Jun 2019 10:42:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612093915.18973-9-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBKQn5ag6wS2mJTBR8TAWKeN5jNGZU/P4aoEQNSfGlTkoTHFYaaXgurdnJWMMhH5i3F4dNLjyDZciJevsxlscV0EIxKsyqMtoDpLIzgSOW9118rImRom
 9fkr1kp/0nxDzCqyadLlSH3FdZstkl1Ia97WvSrDipppY2vDTSbFkgBBbqy9rxXSAA6lM1cvvkZawj56fvY+I/yWMMXlJ5dcDgq9rq/8U478G9TQZ4LRkBB+
 JOBYZDn9t5JKzMRktent92nKHg126GrenMj9yWPqDkqLgylY9K3JgHaMco5QzICfpcNnjybS72eIC+QSLOQuBbu0s13NaNysdj7xz6/wDeEikP6qB1XiSCtv
 uN6zt4XZNIyEdIGYAKJYXporeSRf8Jv1W0Nb3O89VusdtsCBkTvvARIpLJ/UT6Cu3eVmTNonlsRxU24804B8KmGL3CQkcQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two typos for imx8mm:

On 6/12/19 11:39 AM, Philipp Zabel wrote:
> Add devicetree binding documentation for the Hantro G1/G2 VPU on i.MX8MQ
> and for the Hantro G1/G2/H1 VPU on i.MX8MM.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/media/imx8m-vpu.txt   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8m-vpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/imx8m-vpu.txt b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
> new file mode 100644
> index 000000000000..659bd28dd002
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
> @@ -0,0 +1,56 @@
> +device-tree bindings for Hantro G1/G2/H1 VPU codecs implemented on i.MX8M SoCs
> +
> +Required properties:
> +- compatible: value should be one of the following
> +		"nxp,imx8mq-vpu",
> +		"nxp,imx8mm-vpu";
> +- regs: VPU core and control block register ranges
> +- reg-names: should be
> +		"g1", "g2", "ctrl" on i.MX8MQ,
> +		"g1", "g2", "h1", "ctrl" on i.MX8MM.
> +- interrupts: encoding and decoding interrupt specifiers
> +- interrupt-names: should be
> +		"g1", "g2" on i.MX8MQ,
> +		"g1", "g2", "h1" on i.MX8MM.
> +- clocks: phandle to VPU core clocks and bus clock
> +- clock-names: should be
> +		"g1", "g2", "bus" on i.MX8MQ,
> +		"g1", "g2", "h1", "bus" on i.MX8MM.
> +- power-domains: phandle to power domain node
> +
> +Examples:
> +
> +	vpu: vpu@38300000 {
> +		compatible = "nxp,imx8mq-vpu";
> +		reg = <0x38300000 0x10000>,
> +		      <0x38310000 0x10000>,
> +		      <0x38320000 0x10000>;
> +		reg-names = "g1", "g2", "ctrl";
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "g1", "g2";
> +		clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +		clock-names = "g1", "g2", "bus";
> +		power-domains = <&pgc_vpu>;
> +	};
> +
> +	vpu: vpu@38300000 {
> +		compatible = "nxp,imx8mm-vpu";
> +		reg = <0x38300000 0x10000>,
> +		      <0x38310000 0x10000>,
> +		      <0x38320000 0x10000>;

; -> ,

> +		      <0x38330000 0x10000>;
> +		reg-names = "g1", "g2", "h1", "ctrl";
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;

; -> ,

> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "g1", "g2", "h1";
> +		clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_H1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +		clock-names = "g1", "g2", "h1", "bus";
> +		power-domains = <&pgc_vpu>;
> +	};
> 

Regards,

	Hans
