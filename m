Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6167B2046
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 16:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbjI1O5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Sep 2023 10:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbjI1O5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Sep 2023 10:57:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62D11B1;
        Thu, 28 Sep 2023 07:57:31 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-13-94.net.vodafone.it [5.90.13.94])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2579FB1;
        Thu, 28 Sep 2023 16:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695912947;
        bh=1rGsLj3RfMnrH06bz6kkNYEydQPQ+gMU6nRnNltl4nQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AY/H5zEvbuPKq05Dga3G1ZeQeUlHGFcVVHAZQJlg9v8E8f8xZyUS2w/KWNn5qgKQv
         hEsZ9CsBgNCVHs2Jw6fgWPKGtCf6MxRohlYgH5+hucjw+05mcmvEYTNQvF+1ATTMM5
         Z7OxLdSuX8Ci57JXrZvHZZKnuHdZPEn6nYElekCk=
Date:   Thu, 28 Sep 2023 16:57:23 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, martink@posteo.de,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] media: dt-bindings: hynix,hi846: Document orientation
 and rotation
Message-ID: <avoixz5pqixr366cqks672akniv7h7ewix4edoyikg23dv24fd@bquxelr53t7t>
References: <20230928121424.388019-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230928121424.388019-1-festevam@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio, Krzysztof

On Thu, Sep 28, 2023 at 09:14:24AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>
> Document the 'orientation' and 'rotation' properties, which
> are valid for the SK Hynix Hi-846 sensor.
>
> Their definitions come from video-interface-devices.yaml, so add
> a reference to it.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Martin Kepplinger <martink@posteo.de>
> ---
> Changes since v1:
> - Also pass a ref to video-interface-devices.yaml. (Martin)
>

This patch is technically correct, so this message is not meant to
delay its integration or anything like that, but I'll take the
occasion to ask for guidance to the DT maintainers, as I think this
approach doesn't scale.

I count the following sensor bindings that refer to
video-interface-device.yaml

Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml

These:

Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml:additionalProperties: false
Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml:additionalProperties: false
Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml:additionalProperties: false
Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml:additionalProperties: false
Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml:additionalProperties: false

specify 'additionalProperties: false' at the top-level.
This is correct imho, as it implies that any properties not
specifically allowed by bindings is forbidden.

This unfortunately applies to  'rotation' and 'orientation' as well.
This is not correct, as those two properties should apply to all
sensors without the requiring the bindings to explicitly allow them.

Counterproof: It's very easy to break validation of, in example,
ov5640

--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
@@ -109,6 +109,7 @@ examples:
               powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
               reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
               rotation = <180>;
+              orientation = <0>;

               port {
                   /* MIPI CSI-2 bus endpoint */

$ make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
  DTC_CHK Documentation/devicetree/bindings/media/i2c/ovti,ov5640.example.dtb
  'orientation' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#

Is there a way to allow those two properties ('rotation' and
'orientation') to be accepted by all sensor drivers bindings ?

Thanks
   j



>  .../devicetree/bindings/media/i2c/hynix,hi846.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> index 1e2df8cf2937..8b7a46a15458 100644
> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -14,6 +14,9 @@ description: |-
>    interface and CCI (I2C compatible) control bus. The output format
>    is raw Bayer.
>
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
>  properties:
>    compatible:
>      const: hynix,hi846
> @@ -48,6 +51,10 @@ properties:
>    vddd-supply:
>      description: Definition of the regulator used for the VDDD power supply.
>
> +  orientation: true
> +
> +  rotation: true
> +
>    port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
>      unevaluatedProperties: false
> --
> 2.34.1
>
