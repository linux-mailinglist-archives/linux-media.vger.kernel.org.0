Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD7257B5B00
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 21:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjJBTHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 15:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjJBTHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 15:07:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA942B0
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 12:07:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6605EC433C7;
        Mon,  2 Oct 2023 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696273663;
        bh=I9Tt4zwAf/qSfaNTuq/WUXrhqDYPeTkzrgN+p8bA20U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fZyaxAe+UupcyNPeCdK1dbSd9uIxbcWZbN5QCX2HFmQ6OfLD4HgTTYyyKsfmwP1PC
         rEZLyIuUy2bL4XxWt37Pxj4t5DY9FpvP81xZzTPU2UHIq4zNjEiRKMtujshSaW7ykl
         gotONQe32HAgsP9VUCY02bYfdmQ/+3C9CjzEik/Z2OD4HF7HFNApYF6c2sz7vkmT3z
         i2cPzBgc2FskIiy6tCXR4o/n3QEj2YIP2IcCc/5T045pXsXT0Lk3i+lyJHPfgOfLAy
         0TzJsv937YYdOZFBZauf6FtvV1ZqZV8nNPhwbS+jBRHfUSf/5GH1xqG803RxjTMBn6
         8/B226UFKaRxw==
Received: (nullmailer pid 2365550 invoked by uid 1000);
        Mon, 02 Oct 2023 19:07:41 -0000
Date:   Mon, 2 Oct 2023 14:07:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de,
        Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v3 7/7] media: dt-bindings: sony,imx415: Fix handling of
 video-interface-device
Message-ID: <20231002190741.GA2351787-robh@kernel.org>
References: <20230930145951.23433-1-jacopo.mondi@ideasonboard.com>
 <20230930145951.23433-8-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930145951.23433-8-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 30, 2023 at 04:59:51PM +0200, Jacopo Mondi wrote:
> Fix handling of properties from video-interface-device.yaml for
> Sony IMX415.

It wasn't really broken to be a fix. In any case,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> All the properties described by video-interface-device.yaml are
> allowed for the image sensor, make them accepted by changing
> "additionalProperties: false" to "unevaluatedProperties: false" at the
> schema top-level.
> 
> Because all properties are now accepted, there is no need to explicitly
> allow them in the schema.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx415.yaml     | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> index ffccf5f3c9e3..8ea3ddd251f6 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> @@ -44,14 +44,6 @@ properties:
>      description: Sensor reset (XCLR) GPIO
>      maxItems: 1
> 
> -  flash-leds: true
> -
> -  lens-focus: true
> -
> -  orientation: true
> -
> -  rotation: true
> -
>    port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
> 
> @@ -88,7 +80,7 @@ required:
>    - ovdd-supply
>    - port
> 
> -additionalProperties: false
> +unevaluatedProperties: false
> 
>  examples:
>    - |
> --
> 2.42.0
> 
