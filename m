Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644E82B1197
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 23:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgKLWel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 17:34:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55164 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgKLWek (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 17:34:40 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AA64A2A;
        Thu, 12 Nov 2020 23:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605220477;
        bh=/xmzU/irgXh12TulnO5uKcqAr2D0hL+bwc1Y2+lrHkw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=rqVBnfSIJKbWxIdIpDC1J6vNcaeEtm9EohTM4HVblOPlOoWgiyqGvSH5BUg5S6AcI
         VBhEnZuflNAOOAhvZGe7YRXtLg9By8pTrL93Mqv6as2BXBkAc3fLwd8cgBLa+eBxJQ
         ABzigXKUz2FCP9SzncCq1TLUGVJd+qFl9P6O1WcI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 2/8] dt-bindings: media: max9286: Document
 'maxim,,initial-reverse-channel-mV"
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201112162729.101384-1-jacopo+renesas@jmondi.org>
 <20201112162729.101384-3-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <3307f226-9dd1-8460-f4a3-56992a0ae191@ideasonboard.com>
Date:   Thu, 12 Nov 2020 22:34:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112162729.101384-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

in $SUBJECT, there's a double ',' between maxim,,initial and it swaps
from a single quote to a double quote which you might want to fix too.


On 12/11/2020 16:27, Jacopo Mondi wrote:
> Document the 'initial-reverse-channel-mV' vendor property in the
> bindings document of the max9286 driver.
> 
> The newly introduced property allows to specify the initial

s/to specify/specifying/

> configuration of the GMSL reverse control channel to accommodate
> remote serializers pre-programmed with the high threshold power
> supply noise immunity enabled.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 9ea827092fdd..c506a0261325 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -51,6 +51,26 @@ properties:
>    '#gpio-cells':
>      const: 2
>  
> +  maxim,initial-reverse-channel-mV:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    minimum: 30
> +    maximum: 200
> +    default: 170
> +    description: |
> +      Initial amplitude of the reverse control channel, in millivolts.
> +
> +      The initial amplitude shall be adjusted to a value compatible with the
> +      configuration of the connected remote serializer.
> +
> +      Some camera modules (in example RDACM20) include an on-board MCU that

s/in example/for example/

> +      pre-programs the embedded serializer with power supply noise immunity
> +      (high-threshold) enabled. A typical value of the deserializer's reverse
> +      channel amplitude to communicate with pre-programmed serializers is 170mV.
> +
> +      A typical value for the reverse channel amplitude to communicate with
> +      a remote serializer whose high-threshold noise immunity is not enabled
> +      is 100mV.
> +
>    ports:
>      type: object
>      description: |
> @@ -221,6 +241,7 @@ required:
>    - ports
>    - i2c-mux
>    - gpio-controller
> +  - maxim,initial-reverse-channel-mV
>  
>  additionalProperties: false
>  
> @@ -243,6 +264,8 @@ examples:
>          gpio-controller;
>          #gpio-cells = <2>;
>  
> +        maxim,initial-reverse-channel-mV = <170>;
> +

Sounds good to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>          ports {
>            #address-cells = <1>;
>            #size-cells = <0>;
> 

