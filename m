Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87DC7BF1B3
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 05:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442080AbjJJDxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 23:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442068AbjJJDxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 23:53:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728019D;
        Mon,  9 Oct 2023 20:53:14 -0700 (PDT)
Received: from [IPV6:2405:201:2033:3002:3848:5d20:59c9:c87c] (unknown [IPv6:2405:201:2033:3002:3848:5d20:59c9:c87c])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 705013D6;
        Tue, 10 Oct 2023 05:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696909991;
        bh=4Gqs0eLo+EBbzG39UcwXadyv2NlIUjuZuyQ9YKGzG5c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WVx4SFqeA/RWgByXG8dJR/FAvRgOVKCApWuj/zhn51BQ2CkvFMaTanD909h1kzVvj
         +tHtsVQBo0M/rRIn0D5rBPDpMsb0mbUmxR9eAy8aH0et9RoYifUI4vtQqieQHWimZ3
         Qbki7vlMRYeal+JPLp1XtdGr/shHRGGxPMFc6VoY=
Message-ID: <4b319504-45e8-5ad6-7c7a-e503a3c98428@ideasonboard.com>
Date:   Tue, 10 Oct 2023 09:23:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] media: dt-bindings: media: imx335: Add supply
 bindings
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20231010005126.3425444-1-kieran.bingham@ideasonboard.com>
 <20231010005126.3425444-2-kieran.bingham@ideasonboard.com>
From:   Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20231010005126.3425444-2-kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thank you for the patch

On 10/10/23 6:21 AM, Kieran Bingham wrote:
> Add the bindings for the supply references used on the IMX335.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

LGTM,

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   .../bindings/media/i2c/sony,imx335.yaml          | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> index a167dcdb3a32..1863b5608a5c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> @@ -32,6 +32,15 @@ properties:
>       description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
>       maxItems: 1
>   
> +  avdd-supply:
> +    description: Analog power supply (2.9V)
> +
> +  ovdd-supply:
> +    description: Interface power supply (1.8V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.2V)
> +
>     reset-gpios:
>       description: Reference to the GPIO connected to the XCLR pin, if any.
>       maxItems: 1
> @@ -60,6 +69,9 @@ required:
>     - compatible
>     - reg
>     - clocks
> +  - avdd-supply
> +  - ovdd-supply
> +  - dvdd-supply
>     - port
>   
>   additionalProperties: false
> @@ -79,6 +91,10 @@ examples:
>               assigned-clock-parents = <&imx335_clk_parent>;
>               assigned-clock-rates = <24000000>;
>   
> +            avdd-supply = <&camera_vdda_2v9>;
> +            ovdd-supply = <&camera_vddo_1v8>;
> +            dvdd-supply = <&camera_vddd_1v2>;
> +
>               port {
>                   imx335: endpoint {
>                       remote-endpoint = <&cam>;

