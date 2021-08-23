Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA7F3F435D
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 04:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbhHWCNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 22:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234692AbhHWCNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 22:13:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0FDC061575;
        Sun, 22 Aug 2021 19:13:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E95062A5;
        Mon, 23 Aug 2021 04:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629684787;
        bh=kKlIuh6sLdojFKLNtBbSCrLClw+M3lHL7Pk5AeasjkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pkH70hhjAHpKc3q3ynz+gmFXVCFs/gKP7Fa9Xpvw61E10ElqF+htMB/EzakU1cQg9
         8sq0Agyg7EeQ4TSQyICNR/KX2oZg0HpLllc+xXWP0Q2wuRK2+PSdMSxX4AWQCPSxFE
         Q6xMHnk+nP9OW0eIJwsIrHe+QeD/u7fXKCiUlCxg=
Date:   Mon, 23 Aug 2021 05:12:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [RFC 0/5] media: i2c: Add MAX9271 subdevice driver
Message-ID: <YSMEKQbiF+d5ZCe3@pendragon.ideasonboard.com>
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
 <55551fab-cef1-45e1-5f39-158a7d9faa1b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55551fab-cef1-45e1-5f39-158a7d9faa1b@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Aug 18, 2021 at 01:47:02PM +0100, Kieran Bingham wrote:
> On 17/08/2021 08:26, Jacopo Mondi wrote:
> > Hello,
> >    as noticed during the inclusion of the RDACM20/21 cameras, their driver make
> > use of a library driver that exports functions to control the MAX9271 GMSL
> > serializer embedded in the camera module.
> > 
> > This series attempts to create an i2c subdevice driver for the MAX9271
> > serializer, to support the camera module operations using the v4l2 subdev
> > operations.
> > 
> > The series is based on the currently in-review:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=5847
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=5949
> > 
> > The series:
> > 1) Introduced an i2c subdev driver for the MAX9271 GMSL serializer
> > 2) Adapt the RDACM20 driver by removing the MAX9271 handling from there
> > 3) Modify the DTS layout to describe the MAX9271 chip and the camera module
> >    separately
> > 
> > To be done:
> > - bindings
> > - handling of reset lines between max9271 and image sensor
> > - the camera module drivers could be made sensor drivers
> > 
> > However I'm not fully convinced this really brings any benefit as the serializer
> > and the image sensor are actually packed together in the same camera module
> > and are tightly coupled.
> > 
> > The biggest issue I'm facing, and for which I would be happy to receive pointers
> > to is the following one.
> > 
> > The new DTS layout now looks like
> > 
> > 	max9286 {
> > 
> > 		i2c-mux {
> > 			i2c@0 {
> > 				max9271 {
> > 				}
> > 
> > 				rdacm20{
> > 				}
> > 			}
> > 		}
> > 	}
> 
> Is there any feasibility, or benefit to us modelling like:
> 
> > 	max9286 {
> >
> > 		i2c-mux {
> > 			i2c@0 {
> > 				rdacm20 {
> >	 				max9271{
> >					}
> >					ov13858{
> 					}
> > 				}

I don't see the point to be honest. If we have an rdacm20 device and a
corresponding driver, it's pointless to have the max9271 and ov13858
devices in DT. All the information needed would already be known to the
rdacm20 driver. A "detailed" DT description would only make sense if we
modelled the max9271 and ov13858, but not the rdacm20. In that case, I'd
make the ov13858 a child of the max9271.

I had misread this when replying to the cover letter btw, and thought
the rdacm20 node beside the max9271 was the ov13858.

> > 			}
> > 		}
> > 	}
> 
> Perhaps that doesn't actually give much benefit, but I feel like the
> max9271 is a part of the rdacm20, so it should be contained within it,
> not besides it ..
> 
> > If I do rely on the probe sequence implemented by the instantiation of the
> > i2c-mux child nodes:
> > 
> > 	- max9286
> > 		-max9271
> > 		-sensor
> > 
> > 		-max9271
> > 		-sensor
> > 
> > 		...
> > 
> > As per each i2c-mux subnode the max9271 and the connected sensor are probed once
> > after the other.
> > 
> > This unfortunately doesn't play well with the requirements of GMSL bus, for
> > which the post_register operation is being introduced. With the current
> > RDACM20/21 drivers and post_register in place with two cameras connected to the
> > system, the desired initialization sequence looks like:
> > 
> >             MAX9286                  RDACM20/21
> > 
> >             probe()
> >                |
> >                ---------------------> |
> >                                       camera 1 probe() {
> >                                          enable_threshold()
> >                                       }
> >                |<--------------------|
> >             v4l2 async bound {
> > 		completed = no
> >                |
> >                ---------------------> |
> >                                       camera 2 probe() {
> >                                          enable_threshold()
> >                                       }
> >                |<--------------------|
> > 		completed = yes
> > 
> >                 compensate_amplitude()
> > 
> >                 call post_register()
> >                |-------------------->|
> >                                      camera 1 post_register()
> >                                          access camera registers()
> >                                     }
> >                |<-------------------
> >                |-------------------->|
> >                                      camera 2 post_register()
> >                                          access camera registers()
> >                                     }
> >                |<-------------------
> >             }
> > 
> > Which guarantees that the bulk access to the camera registers happens after the
> > deserializer has compensated the channel amplitude.
> > 
> > With the new model I do have a race between the sensor probe and the
> > post_register() of the serializer in case a single camera is connected.
> > 
> > What happes is that as soon as the max9271 registers its async subdev the
> > max9286 notifier completes an call max9271->post_register(). But at that time
> > the sensor subdev has not probed yet, so there is no subdev on which to call
> > post_register in the max9271
> > 
> > following:
> > 
> >     MAX9286                  MAX9271			SENSOR
> > 
> >     probe()
> >        |
> >        ---------------------> |
> > 			      probe() {
> > 				 enable_threshold()
> > 			      }
> >       }
> >        |<--------------------|
> >     v4l2 async bound {
> > 	completed = yes
> >  	subdev->post_register()
> >        |-------------------->|
> > 			     post_register()
> > 				gmsl_bus_config()
> > 				subdev->post_register(NULL)
> > 				segfault
> > 			    }
> > 							probe()
> >     }
> > > If I instead do not use post_register() between the max9271 and the
> sensor,
> > then the model works for a single camera only (as it is implemented in this
> > version)
> > 
> >     MAX9286                  MAX9271			SENSOR
> > 
> >     probe()
> >        |
> >        ---------------------> |
> > 			      probe() {
> > 				 enable_threshold()
> > 			      }
> >       }
> >        |<--------------------|
> >     v4l2 async bound {
> > 	completed = no
> >        |-------------------->|
> > 							probe() {
> > 							   i2c writes to
> > 							   the sensor without
> > 							   GMSL configuration
> > 							}
> >     }
> > 
> > So, my question is: are there examples on how to have the max9271 driver
> > control the probe time the connected sensor without relying on the probe
> > sequence of the I2C-mux device nodes ? If I could do so, what I would like to
> > realize looks like
> > 
> >     MAX9286                  MAX9271			SENSOR
> > 
> >     probe()
> >        |
> >        ---------------------> |
> > 			      camera 1 probe() {
> > 				--------------------->|
> > 							 sensor probe()
> > 				 enable_threshold()
> > 			      }
> >       }
> >        |<--------------------|
> >     v4l2 async bound {
> > 	completed = no
> >        |-------------------->|
> > 			     camera 2 probe() {
> > 				--------------------->|
> > 							sensor probe()
> > 				 enable_threshold()
> > 			      }
> >        |<--------------------|
> > 	completed = yes
> > 
> > 	compensate_amplitude()
> > 	for (subdev)
> > 	   subdev->post_register()
> >           |----------------->|
> > 			     camera 1 post_register()
> > 				subdev->post_register()
> > 				--------------------->|
> > 							post_register()
> > 								i2c writes
> > 	   subdev->post_register()
> >           |----------------->|
> > 			     camera 2 post_register()
> > 				subdev->post_register()
> > 				--------------------->|
> > 							post_register()
> > 								i2c writes
> >     }
> > 
> 
> If we're still likely to have an RDACM20 container 'device' - I wonder
> if it's possible that it could be responsible for making sure both of
> it's subdevices (the max9271, and the sensor) are handled in the correct
> sequence...
> 
> > I recall Mauro pointed me to an example when he first suggested to make the
> > MAX9271 library a proper i2c subdevice driver. Do you happen to recall which one
> > was it ?
> > 
> > Thanks
> >    j
> > 
> > Jacopo Mondi (5):
> >   media: i2c: max9271: Rename max9271 library driver
> >   media: i2c: Add MAX9271 I2C driver
> >   media: i2c: rdacm20: Adapt to work with MAX9271
> >   media: i2c: max9286: Fetch PIXEL_RATE in s_stream
> >   arm64: dts: GMSL: Adapt to the use max9271 driver
> > 
> >  MAINTAINERS                                   |  17 +-
> >  arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi |  34 +-
> >  .../arm64/boot/dts/renesas/r8a77970-eagle.dts |   6 +-
> >  drivers/media/i2c/Kconfig                     |  12 +
> >  drivers/media/i2c/Makefile                    |   3 +-
> >  drivers/media/i2c/max9271-lib.c               | 374 +++++++++++++
> >  .../media/i2c/{max9271.h => max9271-lib.h}    |   0
> >  drivers/media/i2c/max9271.c                   | 528 +++++++++++++++---
> >  drivers/media/i2c/max9286.c                   |   6 +-
> >  drivers/media/i2c/rdacm20.c                   | 139 +----
> >  drivers/media/i2c/rdacm21.c                   |   2 +-
> >  11 files changed, 917 insertions(+), 204 deletions(-)
> >  create mode 100644 drivers/media/i2c/max9271-lib.c
> >  rename drivers/media/i2c/{max9271.h => max9271-lib.h} (100%)
> > 

-- 
Regards,

Laurent Pinchart
