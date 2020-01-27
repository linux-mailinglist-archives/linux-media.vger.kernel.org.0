Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C1414AA36
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 20:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgA0TFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 14:05:33 -0500
Received: from mailoutvs42.siol.net ([185.57.226.233]:33891 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725845AbgA0TFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 14:05:32 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 72D7D523B15;
        Mon, 27 Jan 2020 20:05:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Tcln31hrCOyf; Mon, 27 Jan 2020 20:05:29 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 2468A523B0F;
        Mon, 27 Jan 2020 20:05:29 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 32E2C523B07;
        Mon, 27 Jan 2020 20:05:28 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     wens@csie.org, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/5] arm64: dts: allwinner: a64: Add MBUS controller node
Date:   Mon, 27 Jan 2020 20:05:27 +0100
Message-ID: <1736895.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20200127145931.rjewha4awnlorfvb@gilmour.lan>
References: <20200125110353.591658-1-jernej.skrabec@siol.net> <20200125110353.591658-4-jernej.skrabec@siol.net> <20200127145931.rjewha4awnlorfvb@gilmour.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 27. januar 2020 ob 15:59:31 CET je Maxime Ripard napisal(a):
> Hi,
> 
> On Sat, Jan 25, 2020 at 12:03:51PM +0100, Jernej Skrabec wrote:
> > A64 contains MBUS, which is the bus used by DMA devices to access
> > system memory.
> > 
> > MBUS controller is responsible for arbitration between channels based
> > on set priority and can do some other things as well, like report
> > bandwidth used. It also maps RAM region to different address than CPU.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> > 862b47dc9dc9..d225ea1f3b87 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -1061,6 +1061,14 @@ pwm: pwm@1c21400 {
> > 
> >  			status = "disabled";
> >  		
> >  		};
> > 
> > +		mbus: dram-controller@1c62000 {
> > +			compatible = "allwinner,sun50i-a64-mbus";
> > +			reg = <0x01c62000 0x1000>;
> > +			clocks = <&ccu CLK_MBUS>;
> 
> We're merging the clock header patch and the DT through two different
> trees, so you can't use it right away. You should use the raw ID here.

Ok.

> 
> (also, as a general remark, it's easier on us to not send the patches
> during the rc6 <-> rc1 phase), so if you can resend them as soon as
> rc1 is out, that would be great :)

Ok, I'll send v2 then.

Best regards,
Jernej


