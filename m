Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A4B1D3F98
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 23:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbgENVGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 17:06:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:42248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727942AbgENVGJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 17:06:09 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36852206F1;
        Thu, 14 May 2020 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589490368;
        bh=UY4fp0mnf5dW1wUh0nDLNnXc+3+KQou78sP+055n/7o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iGkC1CT3zmGMq2uKjMheCCTkkAmJnKrHaH1Vcq/IXoUTAC4qgU+jRimYwS8hlmz7h
         YUJ3vwEGdKVFhOoTI08Vy4zHsOq1emOLEwbBqZKOjr72brCADdK0sIpIp9aJj6PgpW
         09KeR8l/UL60hPXHKOk6xLczM2j324/3jR1YkKjM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200511195534.1207927-2-lkundrak@v3.sk>
References: <20200511195534.1207927-1-lkundrak@v3.sk> <20200511195534.1207927-2-lkundrak@v3.sk>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Add Marvell MMP Audio Clock Controller binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 14 May 2020 14:06:07 -0700
Message-ID: <158949036750.215346.11234071140104055350@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Lubomir Rintel (2020-05-11 12:55:33)
> diff --git a/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-c=
lock.yaml b/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-cloc=
k.yaml
> new file mode 100644
> index 000000000000..b86e9fbfa56d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.ya=
ml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/marvell,mmp2-audio-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell MMP2 Audio Clock Controller
> +
> +maintainers:
> +  - Lubomir Rintel <lkundrak@v3.sk>
> +
> +description: |
> +  The audio clock controller generates and supplies the clocks to the au=
dio
> +  codec.
> +
> +  Each clock is assigned an identifier and client nodes use this identif=
ier
> +  to specify the clock which they consume.
> +
> +  All these identifiers could be found in <dt-bindings/clock/marvell,mmp=
2.h>.

Is this right? The patch puts them in mmp2-audio.h

> +
> +properties:
> +  compatible:
> +    enum:
> +      - marvell,mmp2-audio-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Audio subsystem clock
> +      - description: The crystal oscillator clock
> +      - description: First I2S clock
> +      - description: Second I2S clock
> +
> +  clock-names:
> +    items:
> +      - const: audio
> +      - const: vctcxo
> +      - const: i2s0
> +      - const: i2s1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/marvell,mmp2.h>
> +    #include <dt-bindings/power/marvell,mmp2.h>
> +
> +    clocks@d42a0c30 {

clock-controller@d42a0c30

> +      compatible =3D "marvell,mmp2-audio-clock";
> +      reg =3D <0xd42a0c30 0x10>;

That is a very specific and tiny region. Presumably this is part of a
larger hardware block and thus shouldn't be described in DT this way.
Instead there should be one clock-controller node and a driver that
controls all the clks that it wants to inside that hardware block.

> +      clock-names =3D "audio", "vctcxo", "i2s0", "i2s1";
> +      clocks =3D <&soc_clocks MMP2_CLK_AUDIO>,
> +               <&soc_clocks MMP2_CLK_VCTCXO>,
> +               <&soc_clocks MMP2_CLK_I2S0>,
> +               <&soc_clocks MMP2_CLK_I2S1>;
> +      power-domains =3D <&soc_clocks MMP2_POWER_DOMAIN_AUDIO>;
> +      #clock-cells =3D <1>;
> +    };
> diff --git a/include/dt-bindings/clock/marvell,mmp2-audio.h b/include/dt-=
bindings/clock/marvell,mmp2-audio.h
> new file mode 100644
> index 000000000000..127b48ec0f0a
> --- /dev/null
> +++ b/include/dt-bindings/clock/marvell,mmp2-audio.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause) */
> +#ifndef __DT_BINDINGS_CLOCK_MARVELL_MMP2_AUDIO_H
> +#define __DT_BINDINGS_CLOCK_MARVELL_MMP2_AUDIO_H
> +
> +#define MMP2_CLK_AUDIO_SYSCLK          1

Any reason to start at 1 vs. 0?

> +#define MMP2_CLK_AUDIO_SSPA0           2
> +#define MMP2_CLK_AUDIO_SSPA1           3
> +#endif
> --=20
> 2.26.2
>
