Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F98723132F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 21:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgG1TzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 15:55:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42518 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbgG1TzC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 15:55:02 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58CF7563;
        Tue, 28 Jul 2020 21:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595966100;
        bh=4eKdIy5eelUAl7dYV/loU4ehEHAcnPV6i+ctQ9AU7BM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FmQl5LxaVwOOg1ZzM94lVB7aHIh1ELtnj8Zeqak5R2hD5gdZKo3gCF9AkiEmwEha8
         iJeNCFyCfA0temWCHr8sO77hVyUVf8RTAricbSPlzRDIOAabKfNMn+7857y8fykh/n
         bvtCJSQ6t1YPD/dmNWuhdD7LAOZD7oRr3jERZbGY=
Date:   Tue, 28 Jul 2020 22:54:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [Query] OV5640 DVP and BT656 modes
Message-ID: <20200728195451.GM13753@pendragon.ideasonboard.com>
References: <CA+V-a8vt1HEhJzc4jN22=7PnVrkcKjzFx7Q9E1ZK-YAtc09q0w@mail.gmail.com>
 <20200728184249.GI13753@pendragon.ideasonboard.com>
 <CA+V-a8upEM4fA=8_3AHEGysEc841SRafvSMioBRgd97bUKgw4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8upEM4fA=8_3AHEGysEc841SRafvSMioBRgd97bUKgw4g@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Jul 28, 2020 at 08:04:39PM +0100, Lad, Prabhakar wrote:
> On Tue, Jul 28, 2020 at 7:43 PM Laurent Pinchart wrote:
> > On Tue, Jul 28, 2020 at 06:50:21PM +0100, Lad, Prabhakar wrote:
> > > Hi,
> > >
> > > I am currently investigating adding support for the BT656 format which
> > > is currently missing in the driver.
> > >
> > > The platform which I am currently testing can support both 8-bit DVP
> > > and BT656 modes.
> > > * Testing DVP mode capturing 320x240, 640x480 worked  OK with random
> > > green lines in-between
> > >
> > > Following is the chunk of code which enables BT656 support,  (for
> > > BT656 mode ov5640_set_dvp_pclk() is used), with the below changes I
> > > can get 640x480 working
> > >
> > > #define OV5640_REG_CCIR656_CTRL00    0x4730
> > >
> > > static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> > > {
> > >     int ret;
> > >
> > >     ret = ov5640_write_reg(sensor,
> > >                    OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
> > >     if (ret)
> > >         return ret;
> > >
> > >     ret = ov5640_write_reg(sensor,
> > >                    OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
> > >     if (ret)
> > >         return ret;
> > >
> > >     ret = ov5640_write_reg(sensor,
> > >                    OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
> > >     if (ret)
> > >         return ret;
> > >
> > >     return ov5640_write_reg(sensor,
> > >                 OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
> > > }
> > >
> > > As soon as I change the code to below to disable the data pads on
> > > stream OFF as below it stops working!

What stops working ? BT.656, non-BT.656, or both ? And how exactly does
it stop working ? The change below only affects the !on case, does the
first capture succeed and the subsequent captures fail ?

> > > static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> > > {
> > >     int ret;
> > >
> > >     ret = ov5640_write_reg(sensor,
> > >                    OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
> > >     if (ret)
> > >         return ret;
> > >
> > >     ret = ov5640_write_reg(sensor,
> > >                    OV5640_REG_PAD_OUTPUT_ENABLE01, on ? 0x7f, 0);
> >
> > s/,/:/ ? Is that a typo in your e-mail, or also in the code you've
> > tested ? I assume the former as the latter shouldn't compile.
>
> My bad it's a typo :) as my code base had one which doesnt disable
> data pads on stream off, so I mistyped while hand crafting it.
> 
> > >     if (ret)
> > >         return ret;
> > >
> > >     ret = ov5640_write_reg(sensor,
> > >                    OV5640_REG_PAD_OUTPUT_ENABLE02, on ? 0xfc, 0);
> > >     if (ret)
> > >         return ret;
> > >
> > >     return ov5640_write_reg(sensor,
> > >                 OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
> > > }
> > >
> > > Looking at the datasheet [1] I don't find it wrong or is there any
> > > information missing in this freely available datasheet.
> > >
> > > Ideally BT656 mode should just work in DVP mode by setting 0x1 in
> > > 0x4730, but doesn work.
> > >
> > > Is there anything  I'm missing here, any thoughts ?
> > >
> > > [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

-- 
Regards,

Laurent Pinchart
