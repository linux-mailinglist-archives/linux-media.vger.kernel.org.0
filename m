Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0ACA7B21D3
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 17:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjI1Pyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Sep 2023 11:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbjI1Pyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Sep 2023 11:54:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE5919F
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 08:54:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC35C433C8;
        Thu, 28 Sep 2023 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695916488;
        bh=TyK4oRa39EFi3FEtmPtV9JKHNZGXq3NJxrDJaHDMNvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iblaJIoiMbx07wf9W6cMp12Y7iY2swpXlxPlb/pxJATIQo+98pN6XDEqVuw47eUmH
         ZvYcYKCaysRNYqof4CpliJKG3188qvONwse3P/f9XuC6sYOsWnQxSM105e17WBSniz
         Pr/Ci4MN8UIjupJcIPoPcEVFsnO+Snuu3q8qtyulQAvM9wcDMNbdpAe8LOfjoPZYGc
         VkXtfAC4Lf35/S/gaS0mp9WgKmXNNPCB9xqVkEt8g9R36HGkR3PWMUtmKA/S4SfFOw
         bcCKBPgqZg35DOQfFe6OEKqFMPjKB7S+UEIrtS7QhRYwZGXKLRt6An9MnDjnAzy7s6
         QEwpmRK+Vuqng==
Received: (nullmailer pid 575144 invoked by uid 1000);
        Thu, 28 Sep 2023 15:54:46 -0000
Date:   Thu, 28 Sep 2023 10:54:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Fabio Estevam <festevam@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, martink@posteo.de,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] media: dt-bindings: hynix,hi846: Document orientation
 and rotation
Message-ID: <20230928155446.GA568091-robh@kernel.org>
References: <20230928121424.388019-1-festevam@gmail.com>
 <avoixz5pqixr366cqks672akniv7h7ewix4edoyikg23dv24fd@bquxelr53t7t>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avoixz5pqixr366cqks672akniv7h7ewix4edoyikg23dv24fd@bquxelr53t7t>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 28, 2023 at 04:57:23PM +0200, Jacopo Mondi wrote:
> Hi Fabio, Krzysztof
> 
> On Thu, Sep 28, 2023 at 09:14:24AM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > Document the 'orientation' and 'rotation' properties, which
> > are valid for the SK Hynix Hi-846 sensor.
> >
> > Their definitions come from video-interface-devices.yaml, so add
> > a reference to it.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Acked-by: Martin Kepplinger <martink@posteo.de>
> > ---
> > Changes since v1:
> > - Also pass a ref to video-interface-devices.yaml. (Martin)
> >
> 
> This patch is technically correct, so this message is not meant to
> delay its integration or anything like that, but I'll take the
> occasion to ask for guidance to the DT maintainers, as I think this
> approach doesn't scale.
> 
> I count the following sensor bindings that refer to
> video-interface-device.yaml
> 
> Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> 
> These:
> 
> Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml:additionalProperties: false
> Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml:additionalProperties: false
> Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml:additionalProperties: false
> Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml:additionalProperties: false
> Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml:additionalProperties: false
> 
> specify 'additionalProperties: false' at the top-level.
> This is correct imho, as it implies that any properties not
> specifically allowed by bindings is forbidden.
> 
> This unfortunately applies to  'rotation' and 'orientation' as well.
> This is not correct, as those two properties should apply to all
> sensors without the requiring the bindings to explicitly allow them.
> 
> Counterproof: It's very easy to break validation of, in example,
> ov5640
> 
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> @@ -109,6 +109,7 @@ examples:
>                powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
>                reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
>                rotation = <180>;
> +              orientation = <0>;
> 
>                port {
>                    /* MIPI CSI-2 bus endpoint */
> 
> $ make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
>   DTC_CHK Documentation/devicetree/bindings/media/i2c/ovti,ov5640.example.dtb
>   'orientation' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
> 
> Is there a way to allow those two properties ('rotation' and
> 'orientation') to be accepted by all sensor drivers bindings ?

Use unevaluatedProperties instead of additionalProperties and add a $ref 
to video-interface-devices.yaml in the sensor schemas. However, that 
will allow all properties in video-interface-devices.yaml (which is just 
flash-leds and lens-focus which seem fine). If you don't want that, then 
you will have to split up video-interface-devices.yaml.

Rob
