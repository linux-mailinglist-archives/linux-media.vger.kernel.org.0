Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3EE7C6EBE
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 15:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347270AbjJLNFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 09:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347271AbjJLNFl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 09:05:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9D5B8;
        Thu, 12 Oct 2023 06:05:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 269898C2;
        Thu, 12 Oct 2023 15:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697115934;
        bh=QMiiVYAwxL8kYkW/Tyfug+wqp6ed2rM4FzvM7049y9k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N8prwUXbUX7iPp++5ePcNnHXz+o/OjWoz2JIRheusTLKmdwlG+TgPAIBs3akKb4oJ
         t2Cxng/Lt0Wnebec0eYmAo0Jp+oIEO0OfLJYPcoQAZNhwUG1NgddxqDpy7GbzMNLEq
         JJNw5NKhNNBYszyKeVCy5fk+L7FtQvLOB2ExIg9Q=
Date:   Thu, 12 Oct 2023 16:05:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231012130544.GA31878@pendragon.ideasonboard.com>
References: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
 <20231012012016.11535-2-laurent.pinchart@ideasonboard.com>
 <b214e763-2175-4de1-af54-43961ff94afb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b214e763-2175-4de1-af54-43961ff94afb@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Thu, Oct 12, 2023 at 09:47:31AM +0200, Krzysztof Kozlowski wrote:
> On 12/10/2023 03:20, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > The THP7312 is an external ISP from THine. Add DT bindings for it.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../bindings/media/i2c/thine,thp7312.yaml     | 225 ++++++++++++++++++
> >  MAINTAINERS                                   |   7 +
> >  2 files changed, 232 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> > new file mode 100644
> > index 000000000000..053b28fb0a89
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> > @@ -0,0 +1,225 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2023 Ideas on Board
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/thine,thp7312.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: THine THP7312
> > +
> > +maintainers:
> > +  - Paul Elder <paul.elder@@ideasonboard.com>
> > +
> > +description:
> > +  The THP7312 is a standalone ISP controlled over i2c, and is capable of
> > +  various image processing and correction functions, including 3A control. It
> > +  can be connected to CMOS image sensors from various vendors, supporting both
> > +  MIPI CSI-2 and parallel interfaces. It can also output on either MIPI CSI-2
> > +  or parallel. The hardware is capable of transmitting and receiving MIPI
> > +  interlaved data strams with data types or multiple virtual channel
> > +  identifiers.
> > +
> > +allOf:
> > +  - $ref: ../video-interface-devices.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: thine,thp7312
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C device address
> 
> Nothing improved here.

I'll drop the description.

> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: CLKI clock input
> > +
> > +  thine,boot-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Boot mode of the THP7312. 0 is for standard streaming mode, for the
> > +      THP7312 to be used as an ISP. 1 is for firmware flashing mode.
> 
> Why, for a given board, would you always boot device in one specific
> mode but not the other? This does not look like property of DT.

The device has two boot mode pins, and it operates differently depending
on its boot mode. The pins are typically hardwired, on development
boards you commonly have DIP switches, and on production systems test
pads that allow modifying the boot mode on the production line. The
driver needs to know the boot mode to interact with the device
appropriately. I haven't found a good way to interogate the device at
runtime to figure out the boot mode, but I'm still trying. If that
doesn't succeed, we need to convey it through the device tree.

> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Reference to the GPIO connected to the RESET_N pin, if any.
> > +      Must be released (set high) after all supplies are applied.
> > +
> > +  vddcore-supply:
> > +    description:
> > +      1.2V supply for core, PLL, MIPI rx and MIPI tx.
> > +
> > +  vhtermrx-supply:
> > +    description:
> > +      Supply for input (RX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
> > +
> > +  vddtx-supply:
> > +    description:
> > +      Supply for output (TX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
> > +
> > +  vddhost-supply:
> > +    description:
> > +      Supply for host interface. 1.8V, 2.8V, or 3.3V.
> > +
> > +  vddcmos-supply:
> > +    description:
> > +      Supply for sensor interface. 1.8V, 2.8V, or 3.3V.
> > +
> > +  vddgpio_0-supply:
> 
> And more of ignored feedback. I stop now.
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.

I took over the patch series and may have missed some comments. I'll
double check and make sure to address all feedback (or raise questions
in replies) for v3. It would be helpful if you could complete the
review, or there will then be a v4 to address the second half of the DT
bindings review :-S Your time and efforts are appreciated, I'm sorry for
the human error here.

-- 
Regards,

Laurent Pinchart
