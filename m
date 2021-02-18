Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B75931E9FB
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 13:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbhBRMls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 07:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhBRKQY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 05:16:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F05DC06178B
        for <linux-media@vger.kernel.org>; Thu, 18 Feb 2021 02:15:40 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lCgL8-0002zv-7T; Thu, 18 Feb 2021 11:15:18 +0100
Message-ID: <c029c980937ab50847bd0fcf86501e85bdb91fd3.camel@pengutronix.de>
Subject: Re: [PATCH v1 03/18] arm64: dts: imx8mq-evk: add reserve memory
 node for CMA region
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Date:   Thu, 18 Feb 2021 11:15:13 +0100
In-Reply-To: <ab14f5a0bde2bdcd4bb0128f76e5a3ba8e7b0894.camel@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
         <20210217080306.157876-4-benjamin.gaignard@collabora.com>
         <ab14f5a0bde2bdcd4bb0128f76e5a3ba8e7b0894.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 17.02.2021 um 16:39 -0300 schrieb Ezequiel Garcia:
> Hi Benjamin,
> 
> On Wed, 2021-02-17 at 09:02 +0100, Benjamin Gaignard wrote:
> > Define allocation range for the default CMA region.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Despite it seems like I signed-off this one...
> 
> > Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > index 85b045253a0e..047dfd4a1ffd 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > @@ -21,6 +21,21 @@ memory@40000000 {
> >                 reg = <0x00000000 0x40000000 0 0xc0000000>;
> >         };
> > 
> >  
> > +       resmem: reserved-memory {
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +
> > +               /* global autoconfigured region for contiguous allocations */
> > +               linux,cma {
> > +                       compatible = "shared-dma-pool";
> > +                       reusable;
> > +                       size = <0 0x3c000000>;
> > +                       alloc-ranges = <0 0x40000000 0 0x40000000>;
> > +                       linux,cma-default;
> > +               };
> 
> ... I'm not a fan of the change :)
> 
> Hopefully someone from NXP can provide some insight here?
> 
> If it's absolutely needed for the VPU, then I guess it should
> be 1) very well documented and 2) moved to the top-lovel dtsi.
> 
> But if we can drop it, that'd be nicer.

What's the justification for this CMA area?

I could only imagine the DMA addressing restrictions on the platform.
DMA masters on the i.MX8MQ can not access memory beyond the 4GB mark
and 1GB of address space is reserved for MMIO, so if you have 4GB
installed the upper 1GB of DRAM is only accessible to the CPU. But this
restriction is already properly communicated to the Linux DMA framework
by the dma-ranges in the top level SoC bus node in the DT, so I don't
think this CMA setup is necessary.

Regards,
Lucas

