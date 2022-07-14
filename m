Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9024574B9D
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 13:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237751AbiGNLNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 07:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbiGNLNd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 07:13:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDEB94;
        Thu, 14 Jul 2022 04:13:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8BB7383;
        Thu, 14 Jul 2022 13:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657797209;
        bh=a034zt1CHGts0wkKQYLVZY2fHsIPM2I6OaTz0ppUIac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FPEEbMigYADxGc+pdwKEMadeJHTkLcNrDswOYIrINNEBSZgExORD0H7imUnpPcZMp
         bf+vqFZ1ktHf7UGMxsEg/UDNAvBN2xLR1yZcbOTmrH9W0muyHUfLR/QS411VFsmWwI
         NGlyq3Ps6ohOKbhQXpjEeMs3n0GpASnWPlewk7IM=
Date:   Thu, 14 Jul 2022 14:12:59 +0300
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
Message-ID: <Ys/6O2H/eDEWYHei@pendragon.ideasonboard.com>
References: <cover.1657786765.git.vkh@melexis.com>
 <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
 <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
 <c87132c4-5801-2f1f-8ef9-3997474cf7a5@linaro.org>
 <Ys/zvH3ICr4zpTLH@pendragon.ideasonboard.com>
 <7e362d83-36c2-00ed-6525-37197ee8e5d7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7e362d83-36c2-00ed-6525-37197ee8e5d7@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 14, 2022 at 01:00:24PM +0200, Krzysztof Kozlowski wrote:
> On 14/07/2022 12:45, Laurent Pinchart wrote:
> > On Thu, Jul 14, 2022 at 12:35:52PM +0200, Krzysztof Kozlowski wrote:
> >> On 14/07/2022 12:06, Laurent Pinchart wrote:
> >>> Hi Volodymyr,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Thu, Jul 14, 2022 at 11:34:47AM +0300, Volodymyr Kharuk wrote:
> >>>> Add device tree binding of the mlx7502x and update MAINTAINERS
> >>>>
> >>>> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> >>>> ---
> >>>>  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
> >>>>  MAINTAINERS                                   |   1 +
> >>>>  2 files changed, 147 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..4ac91f7a26b6
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> >>>> @@ -0,0 +1,146 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Melexis ToF 7502x MIPI CSI-2 Sensor
> >>>> +
> >>>> +maintainers:
> >>>> +  - Volodymyr Kharuk <vkh@melexis.com>
> >>>> +
> >>>> +description: |-
> >>>> +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
> >>>> +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
> >>>> +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
> >>>> +  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
> >>>
> >>> I'd move this last line as a description of the compatible property, but
> >>> I'm also not sure this should be mentioned in the DT bindings, as it's a
> >>> driver implementation detail. I'm actually not sure we should support it
> >>> with three different compatible values as proposed, as without this
> >>> documentation users will have a hard time figuring out what compatible
> >>> value to pick.
> >>>
> >>> One option would be to support the following three compatible values:
> >>>
> >>> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
> >>> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
> >>> 	compatible = "melexis,mlx7502x";
> >>>
> >>> The last one only would trigger autodetection. I'm still not sure how to
> >>> document that properly in bindings though.
> >>
> >> I missed that part of binding.
> >>
> >> Wildcards are not allowed in compatible, so mlx7502x has to go.
> > 
> > Really ? We've had fallback generic compatible strings since the
> > beginning.
> 
> Fallback generic compatibles are allowed. Wildcards not. Wildcards were
> actually never explicitly allowed, they just slipped in to many
> bindings... We have several discussions on this on mailing list, so no
> real point to repeat the arguments.
> 
> There is a difference between generic fallback. If the device follows
> clear specification and version, e.g. "foo-bar-v4", you can use it for
> generic compatible. This is more common in SoC components. Requirement -
> there is a clear mapping between versions and SoCs.

I'm not sure to see a clear difference between the two concepts.

> >> Anyway what does this autodetection mean?
> > 
> > As far as I understand, it means that the driver will use a hardware
> > identification register to figure out if the sensor is a 75026 or 75027.
> 
> Then there is no need to define 75027 compatible. DT is for cases where
> autodetection does not work...

It's autodetection of the exact device model, those are I2C devices so
we still need DT, and we still need to know that it's one of the
MLX75026 or MLX75027.

> > The upside is that one doesn't need to change the device tree when
> > swapping between those two sensors. The downside is that the sensor
> > needs to be powered up at probe time. Depending on the platform, one of
> > those two behaviours is preferred. Auto-detection is nice, but in
> > laptops or tablets (not a use case for this particular device, but the
> > problem applies to camera sensors in general), it would mean that the
> > privacy LED of the camera could be briefly lit at boot time due to the
> > sensor being powered on, which can worry users.
> 
> OK, that's reasonable argument for dedicated compatible but I don't
> understand why you cannot perform autodetection the moment device is
> actually powered up (first time). I understand it is nice and easy to
> make everything in the probe and most devices perform it that way. But
> if you don't want to do it in the probe - DT is not a workaround for this...

For cameras, we often deal with complex pipelines with multiple external
devices and multiple IP cores, with drivers that need to communicate
with each other to initialize the complete camera system. For instance,
each camera-related component in the system registers itself in a media
graph that can be queried from userspace and exposes information about
all devices, including their model. There's no power up of any device
when this query is being performed from userspace. It could possibly be
changed (and maybe it should, for reasons unrelated to this discussion),
but we're looking at pretty much a complete redesign of V4L2 and MC
then.

-- 
Regards,

Laurent Pinchart
