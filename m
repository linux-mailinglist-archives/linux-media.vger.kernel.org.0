Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D7F574B08
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 12:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238446AbiGNKpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 06:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbiGNKpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 06:45:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E0051406;
        Thu, 14 Jul 2022 03:45:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5634383;
        Thu, 14 Jul 2022 12:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657795546;
        bh=Ab93lb7xcIdvu5COypX33XV/lf1e2aV4lLRU5eabX8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lk0t3Ssx34x6cAwNdtY5leEoPQ81ZeAgDQsO+Y0015xJacc4cpWRw9YKT7DoyOnD6
         tO50dmdnIrlJppuXXipmNXTvxGeEOu4rbbBZTxD2pWAsMg3w+xgSTQ3gcuiPvLo6oO
         wALzUvLArLDoKBj6wXaIaFZC8xwx9E5sohdEBepU=
Date:   Thu, 14 Jul 2022 13:45:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Message-ID: <Ys/zvH3ICr4zpTLH@pendragon.ideasonboard.com>
References: <cover.1657786765.git.vkh@melexis.com>
 <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
 <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
 <c87132c4-5801-2f1f-8ef9-3997474cf7a5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c87132c4-5801-2f1f-8ef9-3997474cf7a5@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 14, 2022 at 12:35:52PM +0200, Krzysztof Kozlowski wrote:
> On 14/07/2022 12:06, Laurent Pinchart wrote:
> > Hi Volodymyr,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Jul 14, 2022 at 11:34:47AM +0300, Volodymyr Kharuk wrote:
> >> Add device tree binding of the mlx7502x and update MAINTAINERS
> >>
> >> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> >> ---
> >>  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
> >>  MAINTAINERS                                   |   1 +
> >>  2 files changed, 147 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> >> new file mode 100644
> >> index 000000000000..4ac91f7a26b6
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> >> @@ -0,0 +1,146 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Melexis ToF 7502x MIPI CSI-2 Sensor
> >> +
> >> +maintainers:
> >> +  - Volodymyr Kharuk <vkh@melexis.com>
> >> +
> >> +description: |-
> >> +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
> >> +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
> >> +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
> >> +  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
> > 
> > I'd move this last line as a description of the compatible property, but
> > I'm also not sure this should be mentioned in the DT bindings, as it's a
> > driver implementation detail. I'm actually not sure we should support it
> > with three different compatible values as proposed, as without this
> > documentation users will have a hard time figuring out what compatible
> > value to pick.
> > 
> > One option would be to support the following three compatible values:
> > 
> > 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
> > 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
> > 	compatible = "melexis,mlx7502x";
> > 
> > The last one only would trigger autodetection. I'm still not sure how to
> > document that properly in bindings though.
> 
> I missed that part of binding.
> 
> Wildcards are not allowed in compatible, so mlx7502x has to go.

Really ? We've had fallback generic compatible strings since the
beginning.

> Anyway what does this autodetection mean?

As far as I understand, it means that the driver will use a hardware
identification register to figure out if the sensor is a 75026 or 75027.
The upside is that one doesn't need to change the device tree when
swapping between those two sensors. The downside is that the sensor
needs to be powered up at probe time. Depending on the platform, one of
those two behaviours is preferred. Auto-detection is nice, but in
laptops or tablets (not a use case for this particular device, but the
problem applies to camera sensors in general), it would mean that the
privacy LED of the camera could be briefly lit at boot time due to the
sensor being powered on, which can worry users.

-- 
Regards,

Laurent Pinchart
