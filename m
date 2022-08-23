Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59FB959CD9E
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 03:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239086AbiHWBIe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 21:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbiHWBI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 21:08:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F14123
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 18:08:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46B3D2B3;
        Tue, 23 Aug 2022 03:08:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661216903;
        bh=wcnRzOU/AVzXDK3+5X3k/fPBmKwblKR3hMLIU1y/5YA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rIytS80/sILfnSN8DrP1fb/QGVnNJ/KLiJ7dEVV6U2JhWT9ppIGVwo/R0SftxzlqP
         Mgi0HCCil75eonpO87buU9JEaaOtPauTuZbPElN+msIpkG/8FZs7kRkxqUtD4nnhwH
         Ijdelz7ZynfzxJoxa95+hB+m/0mW/gsEhmmD40qw=
Date:   Tue, 23 Aug 2022 04:08:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: Re: Re: [PATCH 07/19] media: i2c: imx290: Support variable-sized
 registers
Message-ID: <YwQog5af3QY32Ywn@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <Ytq2Qb04baTNy+I4@valkosipuli.retiisi.eu>
 <Ytx+9f3y99EpQ5z5@pendragon.ideasonboard.com>
 <4728760.GXAFRqVoOG@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4728760.GXAFRqVoOG@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Mon, Jul 25, 2022 at 08:49:40AM +0200, Alexander Stein wrote:
> Am Sonntag, 24. Juli 2022, 01:06:29 CEST schrieb Laurent Pinchart:
> > On Fri, Jul 22, 2022 at 05:37:53PM +0300, Sakari Ailus wrote:
> > > On Thu, Jul 21, 2022 at 01:43:54PM +0200, Alexander Stein wrote:
> > > ...
> > > 
> > > > Nice the following snippet does the trick already:
> > > > ---8<---
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -221,6 +221,7 @@ static const struct imx290_pixfmt imx290_formats[] =
> > > > {
> > > >  static const struct regmap_config imx290_regmap_config = {
> > > >         .reg_bits = 16,
> > > >         .val_bits = 8,
> > > > +       .use_single_read = true,
> > > >  };
> > > >  
> > > >  static const char * const imx290_test_pattern_menu[] = {
> > > > 
> > > > ---8<---
> > > > 
> > > > As this affects the VC OV9281 as well, any suggestions for a common
> > > > property?
> > > 
> > > If there's a 1:1 I²C mux in there between the host and the sensor, should
> > > it be in DT as well? I'm not entirely certain it's necessary.
> > 
> > The microcontroller also the sensor clock and power supplies, so it has
> > to be modelled in DT in any case. I was trying to avoid exposing it as
> > an I2C mux, but maybe we'll have to bite the bullet...
> 
> What is the benefit about exposing a I2C mux? The needed regmap config option 
> is configured completely independent to this.

If the I2C mux in the camera module messes up I2C transfers, the related
quirks need to be handled somewhere, and a specific mux driver device in
DT could be a good place to report that. There may be other options
though.

> > I've implement support for two camera modules from Vision Components but
> > haven't submitted patches yet. See [1] and [2] for DT examples and [3]
> > for the driver that handles the microcontroller.
> > 
> > Note that one purpose of the microcontroller is to configure the sensor
> > automatically. It can be queried through I2C for a list of supported
> > modes, and it can also reconfigure the sensor fully when a mode is
> > selected. This is meant to enable development of a single driver that
> > will cover all modules, regardless of which camera sensor it integrates.
> > I'm not sure what words you will use to voice your opinion on this
> > design, but I think I already agree :-)
> > 
> > [1] https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/next/arch/arm64/boot/dts/freescale/imx8mp-maivin-csi1-imx296.dts
> > [2] https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/next/arch/arm64/boot/dts/freescale/imx8mp-maivin-csi1-imx327.dts
> > [3] https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/next/drivers/media/i2c/vc-mipi.c
> > 
> > > The property could be called e.g. "single-octet-read". I think this should
> > > probably be documented in I²C bindings (or even regmap).
> > 
> > I like the idea of making it a DT property global to all I2C devices. It
> > should ideally be parsed by the I2C core or by regmap.
> 
> I agree with adding this as a regmap option, like 'big-endian' & friends, but 
> not so much for I2C core. IMHO the core should only be interested in handling 
> messages and transfers. Setting up those correctly is a matter for drivers 
> (which in turn use regmap).

I don't want to polute a large number of sensor drivers because of
questionable design decisions of a particular module vendor. This type
of quirk needs to be handled outside of the sensor driver.

-- 
Regards,

Laurent Pinchart
