Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35033A4492
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 17:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhFKPDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 11:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhFKPDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 11:03:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E24C061574;
        Fri, 11 Jun 2021 08:01:15 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A3CD81F4479F
Message-ID: <15d5728aeb7895f81f833e7f7e281861c1fcef9a.camel@collabora.com>
Subject: Re: [PATCH v13 2/2] arm64: dts: imx: Add jpeg encoder/decoder nodes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Dong Aisheng <dongas86@gmail.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Date:   Fri, 11 Jun 2021 12:00:59 -0300
In-Reply-To: <CAA+hA=TEi3iZ+nOfff=aN1FrLGb6+OHfx23aWaa1J7YfZRRgtA@mail.gmail.com>
References: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
         <20210522211055.15988-3-mirela.rabulea@oss.nxp.com>
         <DB9PR04MB8477D8F7DC86E67F74D5D9F780269@DB9PR04MB8477.eurprd04.prod.outlook.com>
         <e4c174afd7c55c56c68afbe69276b41c3f574964.camel@nxp.com>
         <CAA+hA=TEi3iZ+nOfff=aN1FrLGb6+OHfx23aWaa1J7YfZRRgtA@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-06-11 at 21:33 +0800, Dong Aisheng wrote:
> [...]
> 
> > > > +img_subsys: bus@58000000 {
> > > > +   compatible = "simple-bus";
> > > > +   #address-cells = <1>;
> > > > +   #size-cells = <1>;
> > > > +   ranges = <0x58000000 0x0 0x58000000 0x1000000>;
> > > > +
> > > > +   img_ipg_clk: clock-img-ipg {
> > > > +           compatible = "fixed-clock";
> > > > +           #clock-cells = <0>;
> > > > +           clock-frequency = <200000000>;
> > > > +           clock-output-names = "img_ipg_clk";
> > > > +   };
> > > > +
> > > > +   jpegdec: jpegdec@58400000 {
> > > 
> > > Node should be disabled by default.
> > > And enable it in board dts including LPCG.
> > 
> > At version v5 of this patch, the node was disabled by default, and I
> > received this feedback from Ezequiel Garcia:
> > 
> > "Pure memory-to-memory are typically not enabled per-board, but just
> > per-platform.
> > So you can drop the disabled status here."
> > 
> > So, in v6 I made it enabled by default.
> > 
> > Any strong reasons for enabled/disabled per platform?
> 
> AFAIK we usually only enable system basic features and let other
> user selectable features disabled by default in dts.
> Even for device LPCG clocks, if it's enabled by default and later
> enter runtime suspend if no users, it still consumes power.
> 

Well-written drivers shouldn't draw any power if not used.

And DT is about hardware-description, not about usage-description.
Which means, at the soc.dtsi level you disable devices that need
some board-level hardware thing to be enabled (e.g. a physical
connected, a regulator, etc.).

A pure memory-to-memory should be enabled by default, because
in practice you can't predict what the users a board will want
to use, nor the DT is the place for that.

Sticking to hardware description is the best way to get DT right :-)

Cheers,
Ezequiel

