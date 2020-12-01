Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C5B2CA3C0
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 14:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgLANZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 08:25:23 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43923 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgLANZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 08:25:23 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 79B326001C;
        Tue,  1 Dec 2020 13:24:38 +0000 (UTC)
Date:   Tue, 1 Dec 2020 14:24:45 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        naush@raspberrypi.com, dave.stevenson@raspberrypi.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, dafna.hirschfeld@collabora.com,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 0/5] media: staging: Add bcm2835-unicam driver
Message-ID: <20201201132445.qxpf7k57zdm4mwvb@uno.localdomain>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201201092605.kzqgsikpfsymn3cj@uno.localdomain>
 <20201201125713.GV4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201201125713.GV4351@valkosipuli.retiisi.org.uk>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Dec 01, 2020 at 02:57:13PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Dec 01, 2020 at 10:26:05AM +0100, Jacopo Mondi wrote:
> > Hi Hans, Sakari,
> >
> > On Tue, Nov 10, 2020 at 06:40:31PM +0100, Jacopo Mondi wrote:
> > > Hello,
> > >   new iteration following
> > > v3: https://patchwork.linuxtv.org/project/linux-media/list/?series=3768
> > >
> > > Major changelog:
> > > - Use v4l2_dev.release and drop manual ref-counting as suggested by Dafna
> > > - Address Hans' comments on queue setup and metadata format handling function
> > > - s/MEDIA_BUS_FMT_SENSOR_DATA/MEDIA_BUS_FMT_CUSTOM_SENSOR_DATA as suggested by
> > >   Hans and rebase on Dafna's fixed metadata format patch
> > > - Add a TODO file to explain why the driver is in staging.
> > > - Conditionally register the unicam-embedded video device node on the presence
> > >   of the sensor's metadata source pad.
> > >
> > >   The media graph, when connected to a sensor that does not report metadata
> > >   looks like:
> > >
> > > 	Media controller API version 5.10.0
> > >
> > > 	Media device information
> > > 	------------------------
> > > 	driver          unicam
> > > 	model           unicam
> > > 	serial
> > > 	bus info        platform:fe801000.csi
> > > 	hw revision     0x0
> > > 	driver version  5.10.0
> > >
> > > 	Device topology
> > > 	- entity 1: ov5647 10-0036 (1 pad, 1 link)
> > > 		    type V4L2 subdev subtype Sensor flags 0
> > > 		    device node name /dev/v4l-subdev0
> > > 		pad0: Source
> > > 			[fmt:SBGGR10_1X10/640x480 field:none colorspace:srgb
> > > 			 crop.bounds:(16,16)/2592x1944
> > > 			 crop:(32,16)/2560x1920]
> > > 			-> "unicam-image":0 [ENABLED,IMMUTABLE]
> > >
> > > 	- entity 3: unicam-image (1 pad, 1 link)
> > > 		    type Node subtype V4L flags 1
> > > 		    device node name /dev/video0
> > > 		pad0: Sink
> > > 			<- "ov5647 10-0036":0 [ENABLED,IMMUTABLE]
> > >
> > >
> > >   If the sensor reports an additional metadata pad:
> > >
> > > 	Media controller API version 5.10.0
> > >
> > > 	Media device information
> > > 	------------------------
> > > 	driver          unicam
> > > 	model           unicam
> > > 	serial
> > > 	bus info        platform:fe801000.csi
> > > 	hw revision     0x0
> > > 	driver version  5.10.0
> > >
> > > 	Device topology
> > > 	- entity 1: imx219 10-0010 (2 pads, 2 links)
> > > 		    type V4L2 subdev subtype Sensor flags 0
> > > 		    device node name /dev/v4l-subdev0
> > > 		pad0: Source
> > > 			[fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
> > > 			 crop:(0,0)/3280x2464]
> > > 			-> "unicam-image":0 [ENABLED,IMMUTABLE]
> > > 		pad1: Source
> > > 			[fmt:unknown/16384x1 field:none
> > > 			 crop:(0,0)/3280x2464]
> > > 			-> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> > >
> > > 	- entity 4: unicam-image (1 pad, 1 link)
> > > 		    type Node subtype V4L flags 1
> > > 		    device node name /dev/video0
> > > 		pad0: Sink
> > > 			<- "imx219 10-0010":0 [ENABLED,IMMUTABLE]
> > >
> > > 	- entity 10: unicam-embedded (1 pad, 1 link)
> > > 		     type Node subtype V4L flags 0
> > > 		     device node name /dev/video1
> > > 		pad0: Sink
> > > 			<- "imx219 10-0010":1 [ENABLED,IMMUTABLE]
> > >
> > >   Conditionally registering the metadata video node allows to simplify the
> > >   code in the driver as well, removing the 'sensor_embedded_data' flag.
> > >
> > >   An additional note: this version will break the libcamera pipeline handler
> > >   which assume the unicam-embedded video device node to always be there.
> > >
> > >   From Dave's reply to Dafna's comments I get instead that for the existing
> > >   applications ecosystem, having the metadata node not registered if the sensor
> > >   does not support it is not an issue.
> >
> > I think I've closed comments received on v3.
> >
> > Do you think this series is ready for being collected ?
>
> I'll try to look into this later today / this week.
>

Thanks!

> The problem with the approach appears, based on a quick glance, to be that
> it creates an additional way (to the more generic approach in VC support
> patchset) to support embedded data, including duplicated sensor driver
> support. That appears as a dead end. But let me look into the details
> first.

I know :(

That's why the driver has been moved to staging, and that's
why this last version only conditionally registers the additional video
device for metadata based on the presence of the additional sensor's
source pad. 'Regular' sensor driver will work as usual with this last
version (ie. no additional 'unicam-embedded' video node gets
registered to userspace).

We could either wait for support for VC to be finalized, but I'm not
that hopeful this will happen any time soon, or alternatively we can
merge a version without any support for metadata and have vendors
maintain patches to re-add it. I fear this will limit the adoption of
this driver as they will probably keep using whatever they have in
their BSP (which kind of defeat the purpose of upstreaming it).

There is one more controversial point: the MC/subdev kAPI duality.
I've tried to outline both issues in a TODO file at the end of this
series.

Thanks
   j

>
> --
> Kind regards,
>
> Sakari Ailus
