Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8687C57F205
	for <lists+linux-media@lfdr.de>; Sun, 24 Jul 2022 01:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbiGWXGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jul 2022 19:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiGWXGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jul 2022 19:06:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192DA1AF39
        for <linux-media@vger.kernel.org>; Sat, 23 Jul 2022 16:06:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4751835;
        Sun, 24 Jul 2022 01:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658617593;
        bh=ksG0sAtvl3Py+CJ9mANm7DRTcceWH5ytORfXn8fgffI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WGpqH2Zt7tNsZnSRVeSjiAjiZ2w4z8CCSia7OQqYrvWmLtTnig9J8nusqOGOJ0VbM
         JEcgU+ee6Yk1fJz5a2E1LzfyWOkxW6w7ab2reyjzy8R7TuLb2ctWrDRA93KF4Rdtju
         2NsT7/FkXMSMvd3zjahgdop3BSvBFGbNESiKfzTM=
Date:   Sun, 24 Jul 2022 02:06:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: Re: Re: [PATCH 07/19] media: i2c: imx290: Support variable-sized
 registers
Message-ID: <Ytx+9f3y99EpQ5z5@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <6038880.cEBGB3zze1@steina-w>
 <Ytk3nfwQ7eEQSTcV@pendragon.ideasonboard.com>
 <8007753.G0QQBjFxQf@steina-w>
 <Ytq2Qb04baTNy+I4@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ytq2Qb04baTNy+I4@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Jul 22, 2022 at 05:37:53PM +0300, Sakari Ailus wrote:
> Hi Alexander,
> 
> On Thu, Jul 21, 2022 at 01:43:54PM +0200, Alexander Stein wrote:
> ...
> > Nice the following snippet does the trick already:
> > ---8<---
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -221,6 +221,7 @@ static const struct imx290_pixfmt imx290_formats[] = {
> >  static const struct regmap_config imx290_regmap_config = {
> >         .reg_bits = 16,
> >         .val_bits = 8,
> > +       .use_single_read = true,
> >  };
> >  
> >  static const char * const imx290_test_pattern_menu[] = {
> > ---8<---
> > 
> > As this affects the VC OV9281 as well, any suggestions for a common property?
> 
> If there's a 1:1 I²C mux in there between the host and the sensor, should
> it be in DT as well? I'm not entirely certain it's necessary.

The microcontroller also the sensor clock and power supplies, so it has
to be modelled in DT in any case. I was trying to avoid exposing it as
an I2C mux, but maybe we'll have to bite the bullet...

I've implement support for two camera modules from Vision Components but
haven't submitted patches yet. See [1] and [2] for DT examples and [3]
for the driver that handles the microcontroller.

Note that one purpose of the microcontroller is to configure the sensor
automatically. It can be queried through I2C for a list of supported
modes, and it can also reconfigure the sensor fully when a mode is
selected. This is meant to enable development of a single driver that
will cover all modules, regardless of which camera sensor it integrates.
I'm not sure what words you will use to voice your opinion on this
design, but I think I already agree :-)

[1] https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/next/arch/arm64/boot/dts/freescale/imx8mp-maivin-csi1-imx296.dts
[2] https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/next/arch/arm64/boot/dts/freescale/imx8mp-maivin-csi1-imx327.dts
[3] https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.19/dev/isp/next/drivers/media/i2c/vc-mipi.c

> The property could be called e.g. "single-octet-read". I think this should
> probably be documented in I²C bindings (or even regmap).

I like the idea of making it a DT property global to all I2C devices. It
should ideally be parsed by the I2C core or by regmap.

-- 
Regards,

Laurent Pinchart
