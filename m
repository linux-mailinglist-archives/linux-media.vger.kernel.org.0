Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2DB7B35D5
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 16:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbjI2OhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 10:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbjI2Ogx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 10:36:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1757F1706;
        Fri, 29 Sep 2023 07:36:29 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-203-152.net.vodafone.it [5.90.203.152])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6097D475;
        Fri, 29 Sep 2023 16:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695998083;
        bh=wKxVT432L5dXZ768aP8Yrqh6f147pUneE7prsYrbaEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XudKhAoALB90KYM7/CcuDFkUhBmePLUUzPIYfUPFD9bEGVph3zMFS1W8w/BOU1jNK
         osU1Pg1LIHkZ0PgUVGmW/yTxqK0LfaUZf9oPV3ns7EUvfyw6J2u9xAtY8QNeHS76hU
         ZIQu40KTFmjZeLqgF7mB9nUxIWksxV0nXaPo9MQw=
Date:   Fri, 29 Sep 2023 16:36:22 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        martink@posteo.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] media: dt-bindings: hynix,hi846: Document orientation
 and rotation
Message-ID: <aduoeroo7tyhvaeuq4mv4x7ndkrvkm62stwqtxscus5enf4sno@77a2d7asc3pw>
References: <20230928121424.388019-1-festevam@gmail.com>
 <avoixz5pqixr366cqks672akniv7h7ewix4edoyikg23dv24fd@bquxelr53t7t>
 <20230928155446.GA568091-robh@kernel.org>
 <orsrzyiaykfoqb5uritwbz5bgovxn4wviijinzlim2cy3qffhp@5zuy5ffp7kmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <orsrzyiaykfoqb5uritwbz5bgovxn4wviijinzlim2cy3qffhp@5zuy5ffp7kmo>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again Fabio

On Fri, Sep 29, 2023 at 08:30:19AM +0200, Jacopo Mondi wrote:
> Hi Rob, Fabio
>
> On Thu, Sep 28, 2023 at 10:54:46AM -0500, Rob Herring wrote:
> > On Thu, Sep 28, 2023 at 04:57:23PM +0200, Jacopo Mondi wrote:
> > > Hi Fabio, Krzysztof
> > >
> > > On Thu, Sep 28, 2023 at 09:14:24AM -0300, Fabio Estevam wrote:
> > > > From: Fabio Estevam <festevam@denx.de>
> > > >
> > > > Document the 'orientation' and 'rotation' properties, which
> > > > are valid for the SK Hynix Hi-846 sensor.
> > > >
> > > > Their definitions come from video-interface-devices.yaml, so add
> > > > a reference to it.
> > > >
> > > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Acked-by: Martin Kepplinger <martink@posteo.de>
> > > > ---
> > > > Changes since v1:
> > > > - Also pass a ref to video-interface-devices.yaml. (Martin)
> > > >
> > >
> > > This patch is technically correct, so this message is not meant to
> > > delay its integration or anything like that, but I'll take the
> > > occasion to ask for guidance to the DT maintainers, as I think this
> > > approach doesn't scale.
> > >
> > > I count the following sensor bindings that refer to
> > > video-interface-device.yaml
> > >
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> > > Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> > > Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> > >
> > > These:
> > >
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml:additionalProperties: false
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml:additionalProperties: false
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml:additionalProperties: false
> > > Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml:additionalProperties: false
> > > Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml:additionalProperties: false
> > >
> > > specify 'additionalProperties: false' at the top-level.
> > > This is correct imho, as it implies that any properties not
> > > specifically allowed by bindings is forbidden.
> > >
> > > This unfortunately applies to  'rotation' and 'orientation' as well.
> > > This is not correct, as those two properties should apply to all
> > > sensors without the requiring the bindings to explicitly allow them.
> > >
> > > Counterproof: It's very easy to break validation of, in example,
> > > ov5640
> > >
> > > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> > > @@ -109,6 +109,7 @@ examples:
> > >                powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
> > >                reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> > >                rotation = <180>;
> > > +              orientation = <0>;
> > >
> > >                port {
> > >                    /* MIPI CSI-2 bus endpoint */
> > >
> > > $ make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> > >   DTC_CHK Documentation/devicetree/bindings/media/i2c/ovti,ov5640.example.dtb
> > >   'orientation' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
> > >
> > > Is there a way to allow those two properties ('rotation' and
> > > 'orientation') to be accepted by all sensor drivers bindings ?
> >
> > Use unevaluatedProperties instead of additionalProperties and add a $ref
> > to video-interface-devices.yaml in the sensor schemas. However, that
> > will allow all properties in video-interface-devices.yaml (which is just
> > flash-leds and lens-focus which seem fine). If you don't want that, then
> > you will have to split up video-interface-devices.yaml.
>
> ack! I think it's fine to allow all sensors to point to a lens or a
> flash device if they want to.
>
> I'll send a patch for:
>
> Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml:additionalProperties: false
> Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml:additionalProperties: false
> Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml:additionalProperties: false
> Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml:additionalProperties: false
> Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml:additionalProperties: false
>
> to s/additionalProperties/unevaluatedProperties/
>
> On this binding file instead. I noticed it again specifies
> unevaluatedProperties: false both in the and 'endpoint' nodes, which
> refers to /schemas/media/video-interfaces.yaml. This allows all
> properties from that schema to be specified.
>
> Should I send a patch to or is Fabio interested in doing so as
> part of a new version of this patch ?
>

Actually, if I'm going to s/additionalProperties/unevaluatedProperties/
in this bindings as well, am I wrong this patch is not needed anymore ?
