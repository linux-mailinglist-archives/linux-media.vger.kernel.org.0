Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31E0373DB4
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 16:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhEEOcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 10:32:09 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37579 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229763AbhEEOcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 10:32:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eIYJlNRG3WztCeIYNlLhsM; Wed, 05 May 2021 16:31:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620225069; bh=D07Ph/1+3Jw7Ax3sYGGJcJQ4Mxn9lO9/WLAxt78euEA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Pvl+/ujxsh6aWY8YO/eIZ4y3E4tEjR5Q+Q+zb+4Cil9LLX2Fq9A0Lj98AHtIPLEDT
         KkD1ujkgG+dfkCzylN0x5rt6u2vvNpDX+94NTX2JEDxNXWeFKrk8nTKwkvjfe7TwM8
         uXvfs28Zq7su20Q0jqtex0foDT5EaCwIh/TPdsU8sg/vlE6H6s00/Wb2DYbK8CONhw
         EiDpZEUUNQMCPDLogYF1Eq/KsRhMXzmpIGgzWlhzRD+MHnbhW78QD0AqP4iPL8ctwN
         GftcSbZl+ni8b69f5Hw0f0zya+hGl/YfWdB87ILyvF7y1INED8BE+aDPRkisRL5GMZ
         6/82HFD1stxqg==
Subject: Re: [PATCH v4 9/9] ARM: dts: sama5d4: enable Hantro G1 VDEC
To:     Emil Velikov <emil.l.velikov@gmail.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Frank Rowand <frowand.list@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
 <20210401144336.2495479-10-emil.l.velikov@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a9829af1-f4e9-5835-9a74-15a0fce6b1eb@xs4all.nl>
Date:   Wed, 5 May 2021 16:31:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401144336.2495479-10-emil.l.velikov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDtpP6vDd+QapLbKREIFOqoqr/sFJRlPamXLjLx9it1P0F65R2qEObdLMb/cvpjdwbwMInZNSs46V1xjXOGab0chRWK6Jj+p6Mywl65TjIV2lerEJPza
 mxVR3P9WMu/wogcSbCb5uORxg9uL0JGOcxFfvxaOFM8Ah0xkaGp4Zy8zM5cJ8a1BM+VXHDv+/3o/hvFGko4vPIElKk+rpwWk3+uy9R3shwaDWfHbVW7uE3c+
 N51jchrun383dk91fgYEkFK7q+3W22URvWe7gXicrw9gA7GCvy5gQ7JU0X67ZUVAOE4y2G/RsBRmJmJqHlg9Qqum7A1aOtpHzJHDcGEwtL838yd3h38OEVzz
 2DFNtjIfe81FskSACDujkXC2ssZbAhnTb+f1LaMFZLpMRoR2bQg8vtiWC6SVcoG4p2ESxhSTGbBo1dvxfikAh87riJjL7aRjzLmaOA4War1DD1XqF6x5eZrO
 skR6lKUNrTcbMqai
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 16:43, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Add the SAMA5D4 VDEC module which comprises Hantro G1 video decoder
> core.

I've accepted parts 1-8 of this series for 5.14, so this remaining patch
can be merged by whoever handles such dts patches.

Regards,

	Hans

> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> v2
>  - Split out of larger patch (Eze)
>  - s/Atmel/Microchip/ (Nicolas)
>  - Drop leading 0 in node name/address
> 
> v3
>  - Drop the clk/irq names (RobH)
> ---
>  arch/arm/boot/dts/sama5d4.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
> index 05c55875835d..e47e1ca63043 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -101,6 +101,13 @@ nfc_sram: sram@100000 {
>  			ranges = <0 0x100000 0x2400>;
>  		};
>  
> +		vdec0: vdec@300000 {
> +			compatible = "microchip,sama5d4-vdec";
> +			reg = <0x00300000 0x100000>;
> +			interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
> +		};
> +
>  		usb0: gadget@400000 {
>  			compatible = "atmel,sama5d3-udc";
>  			reg = <0x00400000 0x100000
> 

