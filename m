Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 475CE1D2BAC
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 11:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgENJnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 05:43:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59374 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgENJnU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 05:43:20 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 590B09A8;
        Thu, 14 May 2020 11:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589449397;
        bh=VNCQSWC3QmQRouQhg1waF4+jeFDbDhwDwko0JwPWluo=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ttafYhaMudhyyvIUtN/M4W2kRjA+KwTtnTJ4cqrge0NS5X32Srow3CVAn5iwokc+b
         /qnaard5MgGRpRmhDdcyXovGZiIAfrca9U+PX8f7XkrT80Lqyp4CERqIns5rU5MVCj
         Kbq8DcNqA8daWeXKRvvef0G0hXIyDif0mAWqaXNo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] fixup! dt-bindings: media: i2c: Add bindings for Maxima
 Integrated MAX9286
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund@ragnatech.se
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@iki.fi,
        mchehab@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hyun Kwon <hyunk@xilinx.com>
References: <20200512223329.GA23701@bogus>
 <20200513125445.54132-1-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <bd648891-67c2-098b-3a0e-72bf4e938535@ideasonboard.com>
Date:   Thu, 14 May 2020 10:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513125445.54132-1-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 13/05/2020 13:54, Jacopo Mondi wrote:
> Subject: [PATCH] fixup! dt-bindings: media: i2c: Add bindings for Maxima Integrated MAX9286
> 
> Temporary fixup to ease review. To be squashed into v10 if accepted.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> 
> While fixing Rob's reported bug on v9 I realized thanks to a
> dt_binding_check warning that the i2c-mux child nodes where under-specified.
> 
> This fixup epxands the i2c-mux child nodes description and updates the
> example to match our currently-out-of-tree DTS files for GMSL platforms.
> 
> dt_binding_check still reports a warning:
> 
> Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: camera@51: reg: [[81, 97]] is too short
> Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: camera@52: reg: [[82, 98]] is too short
> Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: camera@53: reg: [[83, 99]] is too short
> Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: camera@54: reg: [[84, 100]] is too short

Is too short? That seems odd. We accept 1, 2, or 3 values in the reg
(for the serializer, camera, mcu addresses) but those values are
specific to the camera device, and are managed by that driver and
shouldn't be validated here.


> 
> Which I was not able to silence.
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 86 +++++++++++++++++--
>  1 file changed, 77 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index f9d3e5712c59..d9bd19caed2f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -130,9 +130,7 @@ properties:
>      description: |
>        Each GMSL link is modelled as a child bus of an i2c bus
>        multiplexer/switch, in accordance with bindings described in
> -      Documentation/devicetree/bindings/i2c/i2c-mux.txt. The serializer
> -      device on the remote end of the GMSL link shall be modelled as a child
> -      node of the corresponding I2C bus.
> +      Documentation/devicetree/bindings/i2c/i2c-mux.txt.
> 
>      properties:
>        '#address-cells':
> @@ -141,7 +139,74 @@ properties:
>        '#size-cells':
>          const: 0
> 
> -  additionalProperties: false
> +    patternProperties:
> +      "^i2c@[0-3]$":
> +        type: object
> +        description: |
> +          Child node of the i2c bus multiplexer which represents a GMSL link.
> +          Each serializer device on the GMSL link remote end is represented with
> +          an i2c-mux child node. The MAX9286 chip supports up to 4 GMSL
> +          channels.
> +
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +          reg:
> +            description: The index of the GMSL channel.
> +            maxItems: 1
> +
> +        patternProperties:
> +          "^camera@[0-9]+":

This value after @ represents a non 0x prefixed hex value, where your
regex will only match numerical values.

	"^camera@[a-f0-9]+":



is likely therefore required.

I see other uses of this patternProperties also terminate the regex with
a $ (end of line) but that confuses me, as the node is often presented
with the opening brace after the name and identifier:

 (i.e.)
   camera@52 {

But perhaps the validator extracts the node name and reg and matches on
that directly in which case it would be

	"^camera@[a-f0-9]+$":



> +            type: object
> +            description: |
> +              The remote camera device, composed by a GMSL serializer and a
> +              connected video source.
> +
> +            properties:
> +              compatible:
> +                description: The remote device compatible string.
> +
> +              reg:
> +                description: |
> +                  The I2C addresses to be assigned to the remote devices through
> +                  address reprogramming. The number of entries depends on the
> +                  requirements of the currently connected remote device.
> +
> +              port:
> +                type: object
> +
> +                properties:
> +                  endpoint:
> +                    type: object
> +
> +                    properties:
> +                      remote-endpoint:
> +                        description: phandle to the MAX9286 sink endpoint.
> +
> +                    required:
> +                      - remote-endpoint
> +
> +                    additionalProperties: false
> +
> +                required:
> +                  - endpoint
> +
> +                additionalProperties: false
> +
> +            required:
> +              - compatible
> +              - reg
> +              - port
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> 


Wow, is it required to specify additionalProperties: false quite so many
times?


>  required:
>    - compatible
> @@ -220,11 +285,11 @@ examples:
>            i2c@0 {
>              #address-cells = <1>;
>              #size-cells = <0>;
> -
>              reg = <0>;
> 
>              camera@51 {
> -              reg = <0x51>;
> +              compatible = "imi,rdacm20";
> +              reg = <0x51 0x61>;
> 
>                port {
>                  rdacm20_out0: endpoint {
> @@ -241,7 +306,8 @@ examples:
>              reg = <1>;
> 
>              camera@52 {
> -              reg = <0x52>;
> +              compatible = "imi,rdacm20";
> +              reg = <0x52 0x62>;
> 
>                port {
>                  rdacm20_out1: endpoint {
> @@ -257,7 +323,8 @@ examples:
>              reg = <2>;
> 
>              camera@53 {
> -              reg = <0x53>;
> +              compatible = "imi,rdacm20";
> +              reg = <0x53 0x63>;
> 
>                port {
>                  rdacm20_out2: endpoint {
> @@ -273,7 +340,8 @@ examples:
>              reg = <3>;
> 
>              camera@54 {
> -              reg = <0x54>;
> +              compatible = "imi,rdacm20";
> +              reg = <0x54 0x64>;
> 
>                port {
>                  rdacm20_out3: endpoint {
> --
> 2.26.2
> 

