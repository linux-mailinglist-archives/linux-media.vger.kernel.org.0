Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF3E64E91B
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 11:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiLPKFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 05:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiLPKFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 05:05:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922464A585;
        Fri, 16 Dec 2022 02:05:11 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABF76308;
        Fri, 16 Dec 2022 11:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671185109;
        bh=fhVlTaJYFm9ino9d9QoT0eX8fn2UAuKBf3s95ElpBN4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q6HUyI2ioUjdzuvzJFBQhA/KjeQ/fWk0lt6ZVJMdsDGrPMFAMwkGk+7+4LpTbJ1xv
         IC7+twiEJWl6h/6ckIk6C+h3UG7+1PiHsnJk7B/2f6EQjdHVsGZqVwi1CcKezIkPw2
         09x8uAY2UNDGPa+VpX63QUYmKJfbRET0XTeYjnM0=
Date:   Fri, 16 Dec 2022 11:05:06 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v3.1 02/12] dt-bindings: media: i2c: max9286: Add
 property to select I2C speed
Message-ID: <20221216100506.utf3p3cqh7wi7inx@uno.localdomain>
References: <20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com>
 <20221216004500.4263-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221216004500.4263-1-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Fri, Dec 16, 2022 at 02:45:00AM +0200, Laurent Pinchart wrote:
> The I2C speed on the remote side (the I2C master bus of the connected
> serializers) is configurable, and doesn't need to match the speed of the
> local bus (the slave bus of the MAX9286). All remote buses must use the
> same speed, and the MAX9286 needs to be programmed accordingly. Add a
> new DT property to select the speed to make it configurable.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
> Changes since v3:
>
> - Drop the property type
> - Add maxim,i2c-remote-bus-hz property to example
>
> Changes since v2:
>
> - Rename property to maxim,i2c-remote-bus-hz
> - Specify the property type
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 4f28690eabcd..75c2d8b8c809 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -50,6 +50,13 @@ properties:
>    '#gpio-cells':
>      const: 2
>
> +  maxim,i2c-remote-bus-hz:
> +    enum: [ 8470, 28300, 84700, 105000, 173000, 339000, 533000, 837000 ]
> +    default: 105000
> +    description: |
> +      The I2C clock frequency for the remote I2C buses. The value must match
> +      the configuration of the remote serializers.
> +
>    maxim,reverse-channel-microvolt:
>      minimum: 30000
>      maximum: 200000
> @@ -234,6 +241,7 @@ examples:
>              gpio-controller;
>              #gpio-cells = <2>;
>
> +            maxim,i2c-remote-bus-hz = <339000>;
>              maxim,reverse-channel-microvolt = <170000>;
>
>              ports {
> --
> Regards,
>
> Laurent Pinchart
>
