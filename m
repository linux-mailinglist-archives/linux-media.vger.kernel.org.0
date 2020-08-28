Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B64255559
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 09:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbgH1Hbl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 28 Aug 2020 03:31:41 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:63101 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgH1Hbl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 03:31:41 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360 (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2B49E24000C;
        Fri, 28 Aug 2020 07:31:33 +0000 (UTC)
Date:   Fri, 28 Aug 2020 09:31:33 +0200
From:   =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 7/7] [NOT FOR MERGE] ARM: dts: sun8i: a83t: bananapi-m3:
 Enable OV8865 camera
Message-ID: <20200828093133.42dac9ad@lhopital-XPS-13-9360>
In-Reply-To: <20200827153843.mjcnc5fiuxj3df3s@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
        <20200821145935.20346-8-kevin.lhopital@bootlin.com>
        <20200825144022.mwkcqaqny7l5bab4@gilmour.lan>
        <20200826105834.0100d4a7@lhopital-XPS-13-9360>
        <20200827153843.mjcnc5fiuxj3df3s@gilmour.lan>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
Le Thu, 27 Aug 2020 17:38:43 +0200,
Maxime Ripard <maxime@cerno.tech> a écrit :

> Hi,
> 
> On Wed, Aug 26, 2020 at 10:58:34AM +0200, Kévin L'hôpital wrote:
> > > > +&ccu {
> > > > +	assigned-clocks = <&ccu CLK_CSI_MCLK>;
> > > > +	assigned-clock-parents = <&osc24M>;
> > > > +	assigned-clock-rates = <24000000>;
> > > > +};    
> > > 
> > > Why do you need to use assigned-clocks here?  
> > 
> > I could do it in the ov8865 node, does it sound good to you ?  
> 
> I mean, it depends on why you want to do it :)
> 
> If that's because the sensor expects a clock in a particular clock
> range, then it should be enforced in the sensor driver itself.
> 
> Maxime

Yes I will put it in the sensor driver.
Thanks for the answer.
Kévin
-- 
Kevin L'Hopital, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
