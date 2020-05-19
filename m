Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C4B1DA469
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 00:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgESWV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 18:21:59 -0400
Received: from v6.sk ([167.172.42.174]:58478 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgESWV7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 18:21:59 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 115EA610B0;
        Tue, 19 May 2020 22:21:26 +0000 (UTC)
Date:   Wed, 20 May 2020 00:21:22 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: Add Marvell MMP Audio Clock
 Controller binding
Message-ID: <20200519222122.GI1695525@furthur.local>
References: <20200511195534.1207927-1-lkundrak@v3.sk>
 <20200511195534.1207927-2-lkundrak@v3.sk>
 <158949036750.215346.11234071140104055350@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158949036750.215346.11234071140104055350@swboyd.mtv.corp.google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 02:06:07PM -0700, Stephen Boyd wrote:
> Quoting Lubomir Rintel (2020-05-11 12:55:33)
> > diff --git a/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.yaml
> > new file mode 100644
> > index 000000000000..b86e9fbfa56d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/marvell,mmp2-audio-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell MMP2 Audio Clock Controller
> > +
> > +maintainers:
> > +  - Lubomir Rintel <lkundrak@v3.sk>
> > +
> > +description: |
> > +  The audio clock controller generates and supplies the clocks to the audio
> > +  codec.
> > +
> > +  Each clock is assigned an identifier and client nodes use this identifier
> > +  to specify the clock which they consume.
> > +
> > +  All these identifiers could be found in <dt-bindings/clock/marvell,mmp2.h>.
> 
> Is this right? The patch puts them in mmp2-audio.h
> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - marvell,mmp2-audio-clock
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Audio subsystem clock
> > +      - description: The crystal oscillator clock
> > +      - description: First I2S clock
> > +      - description: Second I2S clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: audio
> > +      - const: vctcxo
> > +      - const: i2s0
> > +      - const: i2s1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - '#clock-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/marvell,mmp2.h>
> > +    #include <dt-bindings/power/marvell,mmp2.h>
> > +
> > +    clocks@d42a0c30 {
> 
> clock-controller@d42a0c30
> 
> > +      compatible = "marvell,mmp2-audio-clock";
> > +      reg = <0xd42a0c30 0x10>;
> 
> That is a very specific and tiny region. Presumably this is part of a
> larger hardware block and thus shouldn't be described in DT this way.
> Instead there should be one clock-controller node and a driver that
> controls all the clks that it wants to inside that hardware block.

This resides in a block that's entirely separate from SoC's main clock
controllers ("power management units"). It is inside the audio block,
separate power island along with two I2S ("SSPA") controllers. The
addresses are weirdly interleaved, with the clock controller being
mapped between the two channels of the first SSPA:

  0xd42a0c00 - 0xd42a0c30 SSPA1 RX
  0xd42a0c30 - 0xd42a0c40 Clock Control
  0xd42a0c80 - 0xd42a0cb0 SSPA1 TX
  0xd42a0d00 - 0xd42a0d30 SSPA2 RX
  0xd42a0d80 - 0xd42a0cb0 SSPA2 TX

Despite the addresses being interwoven in this way, the Clock Controller
is pretty much independent of the SSPAs and deserves a separate device
node, regardless of how tiny its range is.

> > +      clock-names = "audio", "vctcxo", "i2s0", "i2s1";
> > +      clocks = <&soc_clocks MMP2_CLK_AUDIO>,
> > +               <&soc_clocks MMP2_CLK_VCTCXO>,
> > +               <&soc_clocks MMP2_CLK_I2S0>,
> > +               <&soc_clocks MMP2_CLK_I2S1>;
> > +      power-domains = <&soc_clocks MMP2_POWER_DOMAIN_AUDIO>;
> > +      #clock-cells = <1>;
> > +    };
> > diff --git a/include/dt-bindings/clock/marvell,mmp2-audio.h b/include/dt-bindings/clock/marvell,mmp2-audio.h
> > new file mode 100644
> > index 000000000000..127b48ec0f0a
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/marvell,mmp2-audio.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause) */
> > +#ifndef __DT_BINDINGS_CLOCK_MARVELL_MMP2_AUDIO_H
> > +#define __DT_BINDINGS_CLOCK_MARVELL_MMP2_AUDIO_H
> > +
> > +#define MMP2_CLK_AUDIO_SYSCLK          1
> 
> Any reason to start at 1 vs. 0?
> 
> > +#define MMP2_CLK_AUDIO_SSPA0           2
> > +#define MMP2_CLK_AUDIO_SSPA1           3
> > +#endif
> > -- 
> > 2.26.2
> >
