Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC6440174E
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 09:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240268AbhIFHuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 03:50:50 -0400
Received: from comms.puri.sm ([159.203.221.185]:49936 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239895AbhIFHuu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Sep 2021 03:50:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 9E666DFE25;
        Mon,  6 Sep 2021 00:49:15 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WmJRLevP9RkE; Mon,  6 Sep 2021 00:49:14 -0700 (PDT)
Message-ID: <99d6902d8e4ed68de4c011d618344485552002ea.camel@puri.sm>
Subject: Re: [PATCH v8 3/4] media: i2c: add driver for the SK Hynix Hi-846
 8M pixel camera
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, phone-devel@vger.kernel.org,
        robh@kernel.org, sakari.ailus@iki.fi, shawnx.tu@intel.com
Date:   Mon, 06 Sep 2021 09:49:09 +0200
In-Reply-To: <20210903161742.GD2209@bug>
References: <20210831134344.1673318-1-martin.kepplinger@puri.sm>
         <20210831134344.1673318-4-martin.kepplinger@puri.sm>
         <20210903161742.GD2209@bug>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, dem 03.09.2021 um 18:17 +0200 schrieb Pavel Machek:
> Hi!
> 
> > The SK Hynix Hi-846 is a 1/4" 8M Pixel CMOS Image Sensor. It
> > supports
> > usual features like I2C control, CSI-2 for frame data,
> > digital/analog
> > gain control or test patterns.
> > 
> > This driver supports the 640x480, 1280x720 and 1632x1224 resolution
> > modes. It supports runtime PM in order not to draw any unnecessary
> > power.
> > 
> > The part is also called YACG4D0C9SHC and a datasheet can be found
> > at
> > https://product.skhynix.com/products/cis/cis.go
> > 
> > The large sets of partly undocumented register values are for
> > example
> > found when searching for the hi846_mipi_raw_Sensor.c Android
> > driver.
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> 
> Reviewed-by: Pavel Machek <pavel@ucw.cz>
> 
> Some nitpicks below..
> 
> > +config VIDEO_HI846
> > +       tristate "Hynix Hi-846 sensor support"
> > +       depends on I2C && VIDEO_V4L2
> > +       select MEDIA_CONTROLLER
> > +       select VIDEO_V4L2_SUBDEV_API
> > +       select V4L2_FWNODE
> > +       help
> > +         This is a Video4Linux2 sensor driver for the Hynix
> > +         Hi-846 camera.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called hi846.
> 
> hi846.ko?

hi Pavel, thanks a lot for taking the time! the module name doesn't
include the file ending, according to all other Kconfig descriptions.

the rest looks good and I'll change it according to your review.

                           martin



