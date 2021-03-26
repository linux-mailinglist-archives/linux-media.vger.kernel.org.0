Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40F434AA1D
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhCZOhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbhCZOha (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:37:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE89C0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:37:30 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lPnaQ-0001Ln-5z; Fri, 26 Mar 2021 15:37:18 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lPnaO-0007mU-JM; Fri, 26 Mar 2021 15:37:16 +0100
Date:   Fri, 26 Mar 2021 15:37:16 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Subject: Re: [PATCH v6 02/13] dt-bindings: media: nxp,imx8mq-vpu: Update the
 bindings for G2 support
Message-ID: <20210326143716.GA27823@pengutronix.de>
References: <20210318082046.51546-1-benjamin.gaignard@collabora.com>
 <20210318082046.51546-3-benjamin.gaignard@collabora.com>
 <20210326141156.GA8441@pengutronix.de>
 <3c23bfb0-eed4-63ad-be70-58aa129b0e35@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c23bfb0-eed4-63ad-be70-58aa129b0e35@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:29:00 up 36 days, 17:52, 99 users,  load average: 0.78, 0.37,
 0.20
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 26, 2021 at 03:26:15PM +0100, Benjamin Gaignard wrote:
> 
> Le 26/03/2021 à 15:11, Philipp Zabel a écrit :
> > On Thu, Mar 18, 2021 at 09:20:35AM +0100, Benjamin Gaignard wrote:
> > > Introducing G2 hevc video decoder lead to modify the bindings to allow
> > > to get one node per VPUs.
> > > VPUs share one hardware control block which is provided as a phandle on
> > > an syscon.
> > > Each node got now one reg and one interrupt.
> > > Add a compatible for G2 hardware block: nxp,imx8mq-vpu-g2.
> > > 
> > > To be compatible with older DT the driver is still capable to use 'ctrl'
> > > reg-name even if it is deprecated now.
> > > 
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > > version 5:
> > > - This version doesn't break the backward compatibilty between kernel
> > >    and DT.
> > > 
> > >   .../bindings/media/nxp,imx8mq-vpu.yaml        | 53 ++++++++++++-------
> > >   1 file changed, 34 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > index 762be3f96ce9..79502fc8bde5 100644
> > > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > @@ -15,22 +15,18 @@ description:
> > >   properties:
> > >     compatible:
> > > -    const: nxp,imx8mq-vpu
> > > +    oneOf:
> > > +      - const: nxp,imx8mq-vpu
> > > +      - const: nxp,imx8mq-vpu-g2
> > >     reg:
> > > -    maxItems: 3
> > > -
> > > -  reg-names:
> > > -    items:
> > > -      - const: g1
> > > -      - const: g2
> > > -      - const: ctrl
> > > +    maxItems: 1
> > >     interrupts:
> > > -    maxItems: 2
> > > +    maxItems: 1
> > >     interrupt-names:
> > > -    items:
> > > +    oneOf:
> > >         - const: g1
> > >         - const: g2
> > > @@ -46,14 +42,18 @@ properties:
> > >     power-domains:
> > >       maxItems: 1
> > > +  nxp,imx8mq-vpu-ctrl:
> > > +    description: Specifies a phandle to syscon VPU hardware control block
> > > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > > +
> > Should we drop the 'q' here, i.e. nxp,imx8m-vpu-ctrl so we can use the same
> > binding for i.MX8MM later?
> 
> I don't know if the control block is the same or not on IMX8MM, so I have only
> put a compatible targeting IMX8MQ.

Oh, the compatible property of the control handle node can be different.
I'm just suggesting that this phandle property be called the same.
Otherwise we'd have to add another nxp,imx8mm-vpu-ctrl property and then
mark either of the two as required, depending on the compatible.

> > 
> > >   required:
> > >     - compatible
> > >     - reg
> > > -  - reg-names
> > >     - interrupts
> > >     - interrupt-names
> > >     - clocks
> > >     - clock-names
> > > +  - nxp,imx8mq-vpu-ctrl
> > >   additionalProperties: false
> > > @@ -62,18 +62,33 @@ examples:
> > >           #include <dt-bindings/clock/imx8mq-clock.h>
> > >           #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > -        vpu: video-codec@38300000 {
> > > +        vpu_ctrl: syscon@38320000 {
> > > +                 compatible = "nxp,imx8mq-vpu-ctrl", "syscon";
> > > +                 reg = <0x38320000 0x10000>;
> > > +        };
> > > +
> > > +        vpu_g1: video-codec@38300000 {
> > >                   compatible = "nxp,imx8mq-vpu";
> > > -                reg = <0x38300000 0x10000>,
> > > -                      <0x38310000 0x10000>,
> > > -                      <0x38320000 0x10000>;
> > > -                reg-names = "g1", "g2", "ctrl";
> > > -                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > > -                             <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > > -                interrupt-names = "g1", "g2";
> > > +                reg = <0x38300000 0x10000>;
> > > +                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > > +                interrupt-names = "g1";
> > > +                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> > > +                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> > Does the G1 VPU require the G2 clock and vice versa?
> 
> Yes either the control hardware block won't work.

Ok.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
