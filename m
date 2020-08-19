Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6F1249BF2
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 13:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgHSLhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 07:37:14 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45559 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727079AbgHSLhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 07:37:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8MOzkc5mbuuXO8MP0kgj4W; Wed, 19 Aug 2020 13:37:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597837030; bh=on3DJuNUCZBYzh3vyKVks+qUN0daYY+qcqHSyxAtABs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=H95Be/lv/Z6sIV2ZjHnezlJeoXNXGSJox1mqCQdOpG7Ot7IbrXAC5w5bBW9RAi9XG
         O1zcUUWgj1di8ZybVj8HJYG0HO+WwnA4EMJF3/W0ZoCXLbrm8RsatHZtI53iaOyuAX
         1bzN656HdjSujpxy/AcA1LbCfZ61bGLem3kZFUZ9bGrwEf+oitaXfHhtWBTeCsIu8R
         AaKyG1XFmKZTMnZIbFb5aKP/dQ1cYDH4fDqkluLOit6jXh+KV12sleISEI2/sac0Je
         FgwjUEccqqXdUxb1EckRVvzp1eMO6BLXU8l9zFcGnpIy6t+Op4X35XVRdKC7iUvDh/
         pPyebpuGH7FNQ==
Subject: Re: [PATCH v12 25/29] arm: dts: mt2701: Add jpeg enc device tree node
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        senozhatsky@chromium.org, mojahsu@chromium.org,
        drinkcat@chromium.org, maoguang.meng@mediatek.com
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
 <20200814071202.25067-27-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9a35791d-51f6-2429-5bcc-2149ac1b60c7@xs4all.nl>
Date:   Wed, 19 Aug 2020 13:37:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814071202.25067-27-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBpjNEODcQO4JphfVy6aBaq/j9bEl9E8js4YNmvSiO0Bv837GBTpHXA6jtL2w1CMAv8Jmpc2mcp6RnvgCrWdrB1beAzVXNrT66JiYvfczlfYx06XV8CB
 B98UpcGJa7XDNnxwdu2DifltSLBFjf8NeYIcfeCup84Mr8jAzdIj+Des65oJu1GlPGL0YMXcMb8CWSfS2RFDmWKAf1tFZrDT+yO5sKApps5l4D6oucLLfOM+
 kMakCGE7HijJoy1Sjg8caHFTqlteIYiug6vF1rNK7+OZZ7wmcLC9nxcvHz9tsm4r+Rgcv/4JymkYZ9GgA/X8mxzLvjcwBp/+s0EIeN2Dphpyi1BjDRUvZZ0z
 mOZsThJ3nnYUlEA3H4FZYo8p72u7MHowzEW5UfWhi67fICV6FgV+eUre65EI1My60vU68FAFmcewcLoxCQ7nzoDcLBygZrWjVYwPACskFS5ztjgH/ZLzXokH
 C/gPdfUjVbFV7YQudvj214sx4lhUr7ZvvKSlNDSHq6o7xpMFn75OWNI7EOmpNh7sVjnYIiLQCH7TvB2YX+DCPr3dFbBhk/C7P45pSgKLo3fFap+33+4XUOQl
 /hZbTunleSAz7YPhRbfSa59y7BCOTQFO+T1/ZJILjAy+iVe97UpVGQY4G5aEklGqHzHfrvzOfAgQV40HBjpSflKzAttaKJGSjyRGxTuAlIoErAxMHZxPHsX3
 HOxmzsnsza51QQyGbe0nQp0CNHINjjul4QnZ/gzeINq6wvpz3Mn7G44ePwx2cVLWdqtQ9QeDeHbVWnq5gwc4PowVx0eOmHsnvd72aWjgWrNpO8ifx0q1+kEO
 REvQxerPdF3ZEZvMWWJzZ1QZwA8wDp1V+NPDFSumOJssS+oz3TRA6r3YvrwsaQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

I made a PR for all other patches of this series for 5.10, so this patch can be merged
by whoever takes care of these dts patches.

Regards,

	Hans

On 14/08/2020 09:11, Xia Jiang wrote:
> Add jpeg enc device tree node.
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v12: no changes
> ---
>  arch/arm/boot/dts/mt2701.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> index 8d43a502aada..1c1c2132234f 100644
> --- a/arch/arm/boot/dts/mt2701.dtsi
> +++ b/arch/arm/boot/dts/mt2701.dtsi
> @@ -568,6 +568,19 @@
>  			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
>  	};
>  
> +	jpegenc: jpegenc@1500a000 {
> +		compatible = "mediatek,mt2701-jpgenc",
> +			     "mediatek,mtk-jpgenc";
> +		reg = <0 0x1500a000 0 0x1000>;
> +		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> +		clocks =  <&imgsys CLK_IMG_VENC>;
> +		clock-names = "jpgenc";
> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> +		mediatek,larb = <&larb2>;
> +		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
> +			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
> +	};
> +
>  	vdecsys: syscon@16000000 {
>  		compatible = "mediatek,mt2701-vdecsys", "syscon";
>  		reg = <0 0x16000000 0 0x1000>;
> 

