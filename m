Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75282CC93B
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 22:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgLBV5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 16:57:50 -0500
Received: from retiisi.eu ([95.216.213.190]:35708 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbgLBV5t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 16:57:49 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 242C2634C24;
        Wed,  2 Dec 2020 23:55:57 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kka6P-00035h-Io; Wed, 02 Dec 2020 23:55:57 +0200
Date:   Wed, 2 Dec 2020 23:55:57 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, dafna.hirschfeld@collabora.com,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 0/5] media: staging: Add bcm2835-unicam driver
Message-ID: <20201202215557.GA4351@valkosipuli.retiisi.org.uk>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201201092605.kzqgsikpfsymn3cj@uno.localdomain>
 <20201201125713.GV4351@valkosipuli.retiisi.org.uk>
 <20201201131804.GF4569@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201131804.GF4569@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Dec 01, 2020 at 03:18:04PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, Dec 01, 2020 at 02:57:13PM +0200, Sakari Ailus wrote:
> > On Tue, Dec 01, 2020 at 10:26:05AM +0100, Jacopo Mondi wrote:
> > > On Tue, Nov 10, 2020 at 06:40:31PM +0100, Jacopo Mondi wrote:
> > > > Hello,
> > > >   new iteration following
> > > > v3: https://patchwork.linuxtv.org/project/linux-media/list/?series=3768
> > > >
> > > > Major changelog:
> > > > - Use v4l2_dev.release and drop manual ref-counting as suggested by Dafna
> > > > - Address Hans' comments on queue setup and metadata format handling function
> > > > - s/MEDIA_BUS_FMT_SENSOR_DATA/MEDIA_BUS_FMT_CUSTOM_SENSOR_DATA as suggested by
> > > >   Hans and rebase on Dafna's fixed metadata format patch
> > > > - Add a TODO file to explain why the driver is in staging.
> > > > - Conditionally register the unicam-embedded video device node on the presence
> > > >   of the sensor's metadata source pad.
> > > >
> > > >   The media graph, when connected to a sensor that does not report metadata
> > > >   looks like:
> > > >
> > > > 	Media controller API version 5.10.0
> > > >
> > > > 	Media device information
> > > > 	------------------------
> > > > 	driver          unicam
> > > > 	model           unicam
> > > > 	serial
> > > > 	bus info        platform:fe801000.csi
> > > > 	hw revision     0x0
> > > > 	driver version  5.10.0
> > > >
> > > > 	Device topology
> > > > 	- entity 1: ov5647 10-0036 (1 pad, 1 link)
> > > > 		    type V4L2 subdev subtype Sensor flags 0
> > > > 		    device node name /dev/v4l-subdev0
> > > > 		pad0: Source
> > > > 			[fmt:SBGGR10_1X10/640x480 field:none colorspace:srgb
> > > > 			 crop.bounds:(16,16)/2592x1944
> > > > 			 crop:(32,16)/2560x1920]
> > > > 			-> "unicam-image":0 [ENABLED,IMMUTABLE]
> > > >
> > > > 	- entity 3: unicam-image (1 pad, 1 link)
> > > > 		    type Node subtype V4L flags 1
> > > > 		    device node name /dev/video0
> > > > 		pad0: Sink
> > > > 			<- "ov5647 10-0036":0 [ENABLED,IMMUTABLE]
> > > >
> > > >
> > > >   If the sensor reports an additional metadata pad:
> > > >
> > > > 	Media controller API version 5.10.0
> > > >
> > > > 	Media device information
> > > > 	------------------------
> > > > 	driver          unicam
> > > > 	model           unicam
> > > > 	serial
> > > > 	bus info        platform:fe801000.csi
> > > > 	hw revision     0x0
> > > > 	driver version  5.10.0
> > > >
> > > > 	Device topology
> > > > 	- entity 1: imx219 10-0010 (2 pads, 2 links)
> > > > 		    type V4L2 subdev subtype Sensor flags 0
> > > > 		    device node name /dev/v4l-subdev0
> > > > 		pad0: Source
> > > > 			[fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
> > > > 			 crop:(0,0)/3280x2464]
> > > > 			-> "unicam-image":0 [ENABLED,IMMUTABLE]
> > > > 		pad1: Source
> > > > 			[fmt:unknown/16384x1 field:none
> > > > 			 crop:(0,0)/3280x2464]
> > > > 			-> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> > > >
> > > > 	- entity 4: unicam-image (1 pad, 1 link)
> > > > 		    type Node subtype V4L flags 1
> > > > 		    device node name /dev/video0
> > > > 		pad0: Sink
> > > > 			<- "imx219 10-0010":0 [ENABLED,IMMUTABLE]
> > > >
> > > > 	- entity 10: unicam-embedded (1 pad, 1 link)
> > > > 		     type Node subtype V4L flags 0
> > > > 		     device node name /dev/video1
> > > > 		pad0: Sink
> > > > 			<- "imx219 10-0010":1 [ENABLED,IMMUTABLE]
> > > >
> > > >   Conditionally registering the metadata video node allows to simplify the
> > > >   code in the driver as well, removing the 'sensor_embedded_data' flag.
> > > >
> > > >   An additional note: this version will break the libcamera pipeline handler
> > > >   which assume the unicam-embedded video device node to always be there.
> > > >
> > > >   From Dave's reply to Dafna's comments I get instead that for the existing
> > > >   applications ecosystem, having the metadata node not registered if the sensor
> > > >   does not support it is not an issue.
> > > 
> > > I think I've closed comments received on v3.
> > > 
> > > Do you think this series is ready for being collected ?
> > 
> > I'll try to look into this later today / this week.
> > 
> > The problem with the approach appears, based on a quick glance, to be that
> > it creates an additional way (to the more generic approach in VC support
> > patchset) to support embedded data, including duplicated sensor driver
> > support. That appears as a dead end. But let me look into the details
> > first.
> 
> I don't think there's a big disagreement on that, but merging the driver
> in staging may be a good way to get this fixed ? It will make it easier
> to collaborate.

I have no objections to that. I'd be happy to see a Unicam driver in
upstream, finally. The staging tree could indeed be a way to get there.

The DT bindings still need to be final but that appears as a relatively
small matter.

-- 
Kind regards,

Sakari Ailus
