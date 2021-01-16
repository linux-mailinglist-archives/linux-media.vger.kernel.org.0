Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A811F2F8DBA
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 18:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbhAPRFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 12:05:43 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49522 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbhAPQku (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 11:40:50 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 54D4C1F44946
Message-ID: <b65212d9a9ff9a14d633d07d9c108d65c4f44288.camel@collabora.com>
Subject: Re: [PATCH] media: imx6-mipi-csi2: Call remote subdev
 get_mbus_config to get active lanes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Date:   Sat, 16 Jan 2021 13:39:54 -0300
In-Reply-To: <c1295e6e-091e-efae-7ad8-d7572dc777ec@gmail.com>
References: <20201229103102.45547-1-ezequiel@collabora.com>
         <cdd4a805-13a7-ab1a-dcf6-1d22c2dde1e5@gmail.com>
         <7c87bf467d44d32a3f8d67dec8c581e82b09eaf7.camel@collabora.com>
         <c1295e6e-091e-efae-7ad8-d7572dc777ec@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-01-13 at 12:13 -0800, Steve Longerbeam wrote:
> Hi Ezequiel,
> 
> On 1/11/21 7:11 AM, Ezequiel Garcia wrote:
> > Hi Steve,
> > 
> > On Fri, 2021-01-08 at 11:10 -0800, Steve Longerbeam wrote:
> > > On 12/29/20 2:31 AM, Ezequiel Garcia wrote:
> > > > Currently, the CSI2 subdevice is using the data-lanes from the
> > > > neareast endpoint to config the CSI2 lanes.
> > > > 
> > > > While this may work, the proper way to configure the hardware is
> > > > to obtain the remote subdevice in v4l2_async_notifier_operations.bound(),
> > > > and then call get_mbus_config using the remote subdevice to get
> > > > the active lanes.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > ---
> > > >    drivers/staging/media/imx/TODO             |  12 ---
> > > >    drivers/staging/media/imx/imx6-mipi-csi2.c | 101 ++++++++++++++++++---
> > > >    2 files changed, 90 insertions(+), 23 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
> > > > index 9cfc1c1e78dc..c575f419204a 100644
> > > > --- a/drivers/staging/media/imx/TODO
> > > > +++ b/drivers/staging/media/imx/TODO
> > > > @@ -2,18 +2,6 @@
> > > >    - The Frame Interval Monitor could be exported to v4l2-core for
> > > >      general use.
> > > >    
> > > > -- The CSI subdevice parses its nearest upstream neighbor's device-tree
> > > > -  bus config in order to setup the CSI. Laurent Pinchart argues that
> > > > -  instead the CSI subdev should call its neighbor's g_mbus_config op
> > > > -  (which should be propagated if necessary) to get this info. However
> > > > -  Hans Verkuil is planning to remove the g_mbus_config op. For now this
> > > > -  driver uses the parsed DT bus config method until this issue is
> > > > -  resolved.
> > > This TODO was actually referring to the fwnode endpoint parsing in
> > > imx-media-csi.c, not imx6-mipi-csi2.c.
> > > 
> > Ah, OK.
> > 
> > > But the same conversion to call .get_mbus_config() instead of endpoint
> > > parsing could be done in imx-media-csi.c, but there is one imx6
> > > constraint that is preventing this from happening. The imx6 reference
> > > manual states that if the CSI is receiving from an input parallel bus
> > > that is 16-bits wide, the data must go directly to memory via the SMFC
> > > and not be sent to the IPU's Image Converter ("passthrough" mode):
> > > 
> > > "37.4.3.9 16 bit camera support
> > > 
> > > Devices that support 16 bit data bus can be connected to the CSI. This
> > > can be done in one
> > > of the following ways.
> > > 
> > > 16 bit YUV422
> > > In this mode the CSI receives 2 components per cycle. The CSI is
> > > programmed to
> > > accept the data as 16 bit generic data. The captured data will be stored
> > > in the memory
> > > through the SMFC. The IDMAC needs to be programmed to store 16bit
> > > generic data.
> > > When the data is read back from the memory for further processing in the
> > > IPU it will
> > > be read as YUV422 data."
> > > 
> > > Same is said for RGB data to the CSI.
> > > 
> > > I'm not sure if this restriction is real or not. If this restriction
> > > were ignored, the fwnode endpoint check "ep->bus.parallel.bus_width >=
> > > 16" could be removed and the only remaining info required to determine
> > > passthrough mode is available from 'struct v4l2_mbus_config' and the
> > > input mbus codes, thus allowing the conversion to .get_mbus_config().
> > > 
> > For the sound of this, the above doesn't affect this patch, right?
> 
> Correct, the conversion to .get_mbus_config() in imx-media-csi.c can be 
> a separate patch.
> 
> > Also, note there's a v2 submitted:
> > 
> > https://patchwork.linuxtv.org/project/linux-media/patch/20210103154155.318300-1-ezequiel@collabora.com/
> > 
> > Now, there's something I'm not exactly sure about these .get_mbus_config
> > conversions, being described in the TODO file.
> > 
> > The TODO file should only list what's missing to move the driver
> > out of staging. Converting to newer APIs doesn't seem a blocker:
> > there are a ton of drivers using old APIs out there, which is
> > a natural consequence of how the kernel evolve APIs all the time.
> > 
> > I'm wondering if the other TODO items apply as well, moving
> > the Frame Interval Monitor to the v4l2-core is something we
> > can always do at any later point. It shouldn't be a requirement
> > for destaging.
> > 
> > There's one thing that we must resolve before de-staging.
> > The media controller topology, which is a form of ABI should
> > be settled, as that's difficult to change later.
> > 
> > However, this item is not mentioned in the TODO.
> > 
> > So, I was thinking we should remove all the current TODO
> > items and add something about the media controller topology
> > stability requirements.
> > 
> > What do you think?
> 
> The only suggestion I see that would affect the MC topology is Laurent's 
> patch that paves the way to make a few of the imx6 media links 
> immutable. That's not really a topology change but I agree it needs 
> settling before moving out of staging.
> 

Let me get a v3 for this get_mbus_config patch,
dropping any changes to the TODO.

Let's wait until Laurent's big series to land,
and then we can maybe start rectifiying the TODO,
even plan how this could be destaged.

Thanks,
Ezequiel

