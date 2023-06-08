Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44503728074
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 14:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbjFHMua (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 08:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233733AbjFHMu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 08:50:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25118198C;
        Thu,  8 Jun 2023 05:50:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126033089000.35.openmobile.ne.jp [126.33.89.0])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19B11D01;
        Thu,  8 Jun 2023 14:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686228596;
        bh=3z0PmALEjwiVoQx6iarweAGyVIYso5lEQJEyqQLBah4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iodc6ZphdSW35Rg0O0ziumxog0ItCTdYuNWmOoAd/msypglaExlJcyANIaEm0RuLm
         7mNhQaZ2rpgKKZ3H5Ed7Iya7OjWywgXD07KO90fzN7qm5IFnPFKjc02lMeAdSjQXHa
         8MppxegWXDTao1cRYSM0E7vX2y9u36yXlNsxV2Tg=
Date:   Thu, 8 Jun 2023 15:50:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230608125019.GD26742@pendragon.ideasonboard.com>
References: <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Thu, Jun 08, 2023 at 11:00:19AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Thu, Jun 08, 2023 at 06:41:35AM +0000, Biju Das wrote:
> > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > > API
> > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > i2c_new_ancillary_device API
> > > > >
> > > > > Hi all,
> > > > >
> > > > > sorry for not being able to chime in earlier.
> > > > >
> > > > > > In Biju's particular use case, the i2c device responds to two
> > > > > > addresses, which is the standard i2c ancillary use case.
> > > > > > However, what's special
> > > > >
> > > > > Not quite. ancillary is used when a *driver* needs to take care of
> > > > > two addresses. We already have devices bundling two features into
> > > > > the same chip. I recall at least RTC + EEPROM somewhere. And so
> > > > > far, we have been handling this by creating two nodes in DT and have proper binding docs.
> > > > > I think this is cleaner. First, you can see in DT already what the
> > > > > compound device really consists of. In this case, which RTC and
> > > > > RTC driver is exactly needed. Second, the code added here adds
> > > > > complexity to the I2C core with another layer of inderection for dummy devices.
> > > >
> > > > FYI, please see [1] and [2]
> > > >
> > > > As per DT maintainers, most of PMICs are described with one node,
> > > > even though RTC is on separate address. According to them the DT
> > > > schema allows multiple addresses for children.
> > > > But currently we lacks implementation for that. The enhancement to
> > > > this API allows that.
> > > >
> > > > > > As some resources are shared (knowledge about the clocks),
> > > > > > splitting this in two distinct devices in DT (which is what
> > > > > > Biju's initial patch series did) would need phandles to link both nodes together.
> > > > > >
> > > > > > Do you have a better idea how to represent this?
> > > > >
> > > > > Not sure if I understood this chip correctly, but maybe: The PMIC
> > > > > driver exposes a clock gate which can be consumed by the RTC driver?
> > >
> > > Let me give me some details of this PMIC chip.
> > >
> > > PMIC device has 2 addresses "0x12:- PMIC" , "0x6f"- rtc.
> > >
> > > It has XIN, XOUT, INT# pins and a register for firmware revisions.
> > 
> > Is the firmware revision register accessed through address 0x12 (PMIC) or
> > 0x6f (RTC) ?
> 
> 0x12(PMIC).
> 
> > > Based on the system design,
> > >
> > > If XIN and XOUT is connected to external crystal, Internal oscillator
> > > is enabled for RTC. In this case we need to set the oscillator bit to
> > > "0".
> > >
> > > If XIN is connected to external clock source, Internal oscillator is
> > > disabled for RTC. In this case we need to set the oscillator bit to
> > > "1".
> > 
> > Same here, which address is the oscillator bit accessed through ?
> 
> RTC (0x6F)--> to set oscillator bit.

And does the PMIC part depend on the oscillator bit being set correctly,
or is that used for the RTC only ?

> > > If XIN and XOUT not connected RTC operation not possible.
> > >
> > > IRQ# (optional) functionality is shared between PMIC and RTC. (PMIC
> > > fault for various bucks/LDOs/WDT/OTP/NVM and alarm condition).
> > 
> > IRQs can be shared between multiple devices so this shouldn't be a
> > problem.
> 
> OK. How do we represent this IRQ in DT?

You can simply reference the same IRQ from the interrupts property of
different DT nodes.

> > > The board, I have doesn't populate IRQ# pin. If needed some customers
> > > can populate IRQ# pin and use it for PMIC fault and RTC alarm.
> > >
> > > Also, currently my board has PMIC rev a0 where oscillator bit is
> > > inverted and internal oscillator is enabled (ie: XIN and XOUT is
> > > connected to external crystal)

-- 
Regards,

Laurent Pinchart
