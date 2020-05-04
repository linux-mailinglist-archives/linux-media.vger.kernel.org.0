Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04E51C3EAC
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 17:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgEDPi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 11:38:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48008 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgEDPi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 11:38:26 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C85BF4F7;
        Mon,  4 May 2020 17:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588606704;
        bh=8D+XvK66hBRVjgtCaBGYbZT8OF1/bHqd4K845ykRMnY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j/NwD4K6nqyd71xn7/fi3SdT8d9YlwPNrlmF58mOby2kqQNa/1l5UOtOpMclt7EeO
         +PBV1VLlXA1QaTRHIEYFs6UIk4IknDkoIeIyI2iS0mt+jwfL+/zaIuRygIQaMv13Qg
         or6f2oKd1LO36oVAuLKmEBO71KgvLZwPM5zZZ9rY=
Date:   Mon, 4 May 2020 18:38:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 00/34] Drivers for the BCM283x CSI-2/CCP2 receiver and
 ISP
Message-ID: <20200504153818.GE4365@pendragon.ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <8ef4ab2d73ff9b4d1135ed8362aff2fe0fe21c41.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ef4ab2d73ff9b4d1135ed8362aff2fe0fe21c41.camel@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Mon, May 04, 2020 at 05:15:42PM +0200, Nicolas Saenz Julienne wrote:
> On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> > Hello,
> 
> Hi Laurent, thanks for the series!
> Would you mind CCing on further iterations, I was lucky enough to find this
> referenced in twitter, and I'll be more than happy to review/test it. I'm the
> BCM2711/BCM2835 arm architecture & vc04_services maintainer :).
> 
> An please also CC:
> bcm-kernel-feedback-list@broadcom.com
> linux-rpi-kernel@lists.infradead.org
> linux-arm-kernel@lists.infradead.org

Sure. I was so focussed on the userspace part and on getting everything
ready for today's release that I completely forgot to run the patches
through get_maintainers.pl and CC the appropriate people and lists.
Sorry about the oversight, I'll make sure to fix it next time.

Speaking of BCM2711/BCM2835 maintenance... :-) This series isn't
complete as it's missing full DT integration of camera sensor modules.
This is handled through DT overlays in the Raspberry Pi downstream
kernel, which are applied to the base DT by the boot loader (a neat
solution in my opinion). I wonder what we should do for mainline.
Ideally we should be able to at least use the DT overlays from the
downstream Raspberry Pi kernel on mainline, but that's not possible
today due to incompatibilities in the base DT (in particular related to
the I2C port to which the camera sensors are connected). Dave, have you
given that a thought by any chance ?

Another more general question for Nicolas, is there a plan to try and
get vc04_services out of staging ?

> > This patch series adds drivers for the CSI-2/CCP2 receiver and ISP found
> > in the Broadcom BCM283x and compatible SoCs (namely the BCM2711). The
> > CSI-2/CCP2 receiver IP core is known as Unicam. The most well known
> > platforms representative of these SoCs are the Raspberry Pi. The
> > previous version of the series was titled "[PATCH 0/5] Driver for the
> > BCM283x CSI-2/CCP2 receiver" and contained the CSI-2/CCP2 receiver only.
> > 
> > A driver already exists in drivers/staging/vc04_services/bcm2835-camera/
> > to support cameras on Raspberry Pi platforms. The driver relies on the
> > firmware running on the VC4 VPU to control the camera, and is thus
> > limited to the camera sensors supported in the firmware. These drivers,
> > on the other hand, have limited dependencies on the firmware:
> > 
> > - The Unicam peripheral driver doesn't rely on the firmware at all and
> >   controls the Unicam hardware directly. It supports any camera sensor
> >   compatible with those interfaces.
> > 
> > - The ISP driver relies on the VC4 VPU firmware to communicate with the
> >   ISP hardware, but, unlike with the existing bcm2835-camera driver, the
> >   firmware exposes the ISP instead of controlling it internally.
> > 
> > The code is upported from the Raspberry Pi Linux kernel repository
> > available at https://github.com/raspberrypi/linux. The patches are based
> > on top of v5.7-rc2 with Jacopo's "[PATCH v4 0/5] media: Register
> > read-only sub-dev devnode" series applied.
> > 
> > Patches 01/34 to 05/34 are related to the bcm2835-unicam driver. Patches
> > 01/34 and 02/34 add new a pixel format and media bus code for sensor
> > embedded data. Patch 03/34 then adds DT bindings for the driver, and
> > patch 04/34 adds the driver itself. Patch 05/34 adds the Unicam
> > peripheral instances to the BCM2711 device tree.
> > 
> > The bcm2835-unicam driver supports capturing both image data and
> > embedded data. Support for embedded data is currently implemented
> > through two sink pads, requiring two source pads on the sensor driver
> > side. Work is ongoing to try and replace this with usage of a
> > multiplexed streams API.
> > 
> > The remaining patches are related to the bcm2835-isp driver. As the
> > driver needs to communicate with the VC4 VPU firmware, whose support is
> > currently in staging, the new driver is added to staging too.
> > 
> > Patch 06/34 adds a new driver named vc-sm-cma to handle memory sharing
> > with the VC4 VPU. This will likely be reworked in the future to use
> > dmabuf heaps. Patch 07/34 then breaks the VC4 VPU multimedia access
> > layer code (named vchiq-mmal) out of the existing bcm2835-camera driver
> > to a new directory, to be shared with the bcm2835-isp driver. Patches
> > 08/34 to 24/34 then upport various improvements to the MMAL code.
> > Patches 25/34 to 31/34 follow with an upport of various improvement to
> > the VCHIQ code, which handles the communication with the VC4 VPU (and is
> > used by the MMAL code).
> > 
> > At patch 32/34 we move to the media side, with a small extension to
> > videobuf2. Patch 33/34 adds the bcm2835-isp driver, along with
> > documentation of the related metadata format. Patch 34/34 then wires
> > this up with the vchiq-mmal driver.
> > 
> > The two drivers will likely be split into separate patch series for v3.
> > I however wanted to bundle them here to emphasize that they're related,
> > and that together they support full control of the Raspberry Pi cameras
> > through libcamera without any closed-source software. The corresponding
> > libcamera code is available from
> > 
> > 	git://linuxtv.org/libcamera.git raspberrypi
> > 
> > The 'raspberrypi' branch is temporary until the code gets integrated in
> > the master branch after public review.
> > 
> > I would like to thank Dave Stevenson, Naushir Patuk and David Plowman
> > from Raspberry Pi (Trading) Ltd. for their hard work that made this all
> > possible, as well as Jacopo Mondi, Kieran Bingham and Niklas Söderlund
> > from the libcamera team for all their efforts on both the kernel and
> > libcamera side. This is, I'm sure, the beginning of a new journey for
> > computational camera support in Linux.
> > 
> > And now, the customary v4l2-compliance report. There are three new
> > failures with bcm2835-unicam compared to the previous version, and they
> > will addressed in v3.

[snip]

-- 
Regards,

Laurent Pinchart
