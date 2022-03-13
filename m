Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88ED4D75DF
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 15:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbiCMOcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 10:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiCMOcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 10:32:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5439BAF4;
        Sun, 13 Mar 2022 07:30:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D940475;
        Sun, 13 Mar 2022 15:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647181854;
        bh=2L3uQ23BV1U99lMvOCcYdT4LXyXWmzIPIvwbRSFRyUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EwoxUcAGer6ZLjuimbW2bklZU9D9q++zsNapryOyV++pKQcBEdmMu1TcQQeVBW4Ra
         5kfoifShqHhbXeW9Py+2qQAu9NegE8vW8Pq0p8OuD+Vj/UKa1q7Uyqt0rLTmRXEfNh
         zR4tggzGlJMoJANhilbK0nB+z9VxNbFfCO6XqLC8=
Date:   Sun, 13 Mar 2022 16:30:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] media: dt-bindings: i2c: Document ov5670
Message-ID: <Yi4ADe04VGarQ437@pendragon.ideasonboard.com>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-2-jacopo@jmondi.org>
 <d7e2a189-2773-b37a-7449-0b5138e45ded@canonical.com>
 <20220310171634.qiqnq376qizrqhw5@uno.localdomain>
 <7eb33fe1-2470-7096-b77b-d147c2e55fec@canonical.com>
 <20220311160524.wyfk5vj33xt4umgi@uno.localdomain>
 <5f81a066-0d28-59ed-ec55-3861766025e6@canonical.com>
 <20220311180024.duxcap6yjv6slx2t@uno.localdomain>
 <13b67ef0-8031-fb99-5c57-05ea07f14975@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13b67ef0-8031-fb99-5c57-05ea07f14975@canonical.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Sat, Mar 12, 2022 at 11:30:55AM +0100, Krzysztof Kozlowski wrote:
> On 11/03/2022 19:00, Jacopo Mondi wrote:
> > On Fri, Mar 11, 2022 at 05:11:47PM +0100, Krzysztof Kozlowski wrote:
> >> On 11/03/2022 17:05, Jacopo Mondi wrote:
> >>> On Thu, Mar 10, 2022 at 06:26:02PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 10/03/2022 18:16, Jacopo Mondi wrote:
> >>>>> On Thu, Mar 10, 2022 at 03:29:24PM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On 10/03/2022 14:08, Jacopo Mondi wrote:
> >>>>>>> Provide the bindings documentation for Omnivision OV5670 image sensor.
> >>>>>>>
> >>>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>>>> ---
> >>>>>>>  .../devicetree/bindings/media/i2c/ov5670.yaml | 93 +++++++++++++++++++
> >>>>>>
> >>>>>> Add the file to maintainers entry.
> >>>>>
> >>>>> Right
> >>>>>
> >>>>>>>  1 file changed, 93 insertions(+)
> >>>>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..dc4a3297bf6f
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>>>>>
> >>>>>> Missing vendor prefix in file name.
> >>>>>
> >>>>> Right x2
> >>>>>
> >>>>>>> @@ -0,0 +1,93 @@
> >>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>>> +%YAML 1.2
> >>>>>>> +---
> >>>>>>> +$id: http://devicetree.org/schemas/media/i2c/ov5670.yaml#
> >>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>> +
> >>>>>>> +title: Omnivision OV5670 5 Megapixels raw image sensor
> >>>>>>> +
> >>>>>>> +maintainers:
> >>>>>>> +  - Jacopo Mondi <jacopo@jmondi.org>
> >>>>>>
> >>>>>> Please add also driver maintainer.
> >>>>>
> >>>>> I never got what the policy was, if the maintainer entries here only
> >>>>> refer to the binding file or to the driver too
> >>>>
> >>>> It is a person responsible for the bindings, so indeed it might not feed
> >>>> existing maintainer.
> >>>>
> >>>>>>> +
> >>>>>>> +description: |-
> >>>>>>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> >>>>>>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> >>>>>>> +  controlled through an I2C compatible control bus.
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    const: ovti,ov5670
> >>>>>>> +
> >>>>>>> +  reg:
> >>>>>>> +    maxItems: 1
> >>>>>>> +
> >>>>>>> +  clock-frequency:
> >>>>>>> +    description: Frequency of the xclk clock.
> >>>>>>
> >>>>>> Is the xclk external clock coming to the sensor? If yes, there should be
> >>>>>> a "clocks" property.
> >>>>>
> >>>>> To be honest I was not sure about this, as clock-frequency is already
> >>>>> used by the driver for the ACPI part, but it seems to in DT bindings
> >>>>> it is a property meant to be specified in the clock providers, even if
> >>>>> Documentation/devicetree/bindings/clock/clock-bindings.txt doesn't
> >>>>> really clarify this
> >>>>>
> >>>>> Clock consumer should rather use 'clocks' and point to the provider's
> >>>>> phandle if my understanding is right.
> >>>>
> >>>> This is a clock-frequency, not clock reference. For external clocks, a
> >>>
> >>> Yes, I was suggesting to replace clock-frequency with clocks, that
> >>> accepts a phandle.
> >>>
> >>> The thing is, the driver parses 'clock-frequency'
> >>> 	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
> >>>
> >>> which I assume comes from ACPI (as the driver was developed for an
> >>> ACPI platform).
> >>>
> >>> If in DTS we don't use it, I then need to
> >>>
> >>> #ifdef CONFIG_ACPI
> >>>
> >>> #elif defined CONFIG_OF
> >>>
> >>> #endif
> >>>
> >>> Which I would really like to avoid.
> >>>
> >>> Anyone with ACPI experience that knows where clock-frequency comes
> >>> from ?
> >>
> >> I would assume that ACPI simply does not support common clock framework,
> >> so it had to use clock-frequency. Several of such drivers were added by
> >> folks from Intel which use ACPI, not Devicetree.
> >>
> >>>> clock phandles + assigned-clock-rates should be rather used. However for
> >>>> internal clocks, this is a perfectly valid property.
> >>>>
> >>>> Therefore the question is - what is the "xclk"?
> >>>
> >>> xclk is the clock fed to the sensor, which which all its internal
> >>> clocks are generated, so it's indeed an 'external' clock. As I've
> >>> said, clock-frequency seems to be meant for clock providers, and
> >>> the image sensor is a clock consumer.
> >>
> >> Regardless whether clock-frequency stays or not, you need the clocks
> >> property in such case.
> > 
> > Yes, I will have to ifdef in the driver if no better alternatives
> 
> I do not see the need of ifdefs... BTW, imx258 has exactly that case -
> clock-frequency coming from ACPI world but not added to DT bindings.

The driver can call clk_get_rate() when a clock is provided, and use the
clock-frequency property otherwise. I also don't think conditional
compilation is needed.

-- 
Regards,

Laurent Pinchart
