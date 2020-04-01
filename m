Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E44DD19B46D
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 19:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732872AbgDAQ6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 12:58:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47822 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732587AbgDAQ6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 12:58:15 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF489A2A;
        Wed,  1 Apr 2020 18:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585760293;
        bh=eQZsIhB1wvrRknfrJZU+LzCKO7pIgPHcWCBsxNQwHzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GxDcLOLgarB3bqbrxyHpH1KddDiIIYq45tDqrelzIWLisQO5vFHgl0/hOVCICbCa1
         kbV+AC2AcXSFkC90PdrZFVfKZfZuO4oMAph4nJJjRrYquRxZPh8MIMJe/6OPLI6wQc
         gP4Ora0w+PLrDdpxtdBrtQnlkFw86EpzfvdElmjA=
Date:   Wed, 1 Apr 2020 19:58:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Message-ID: <20200401165805.GE4876@pendragon.ideasonboard.com>
References: <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
 <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
 <ba37eb84-392c-3767-57f6-d297b0ab79a3@xs4all.nl>
 <20200331111018.GJ2394@valkosipuli.retiisi.org.uk>
 <a1145ee4-2991-a958-1225-090c57fec533@xs4all.nl>
 <20200331115221.GA4767@pendragon.ideasonboard.com>
 <6aa7d86c-3943-d508-ccf6-5ac46546abe9@nvidia.com>
 <3b00a559-992a-2da9-92b1-bee44e137ba2@nvidia.com>
 <1c60491b-1bb2-6291-80a6-c0fa14094077@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c60491b-1bb2-6291-80a6-c0fa14094077@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On Wed, Apr 01, 2020 at 09:36:03AM -0700, Sowjanya Komatineni wrote:
> Hi Sakari/Laurent,
> 
> Few questions to confirm my understanding on below discussion.
> 
> 1. Some sensors that you are referring as don't work with single devnode 
> controlling pipeline devices are ISP built-in sensors where setup of 
> pipeline and subdevices happen separately?

Sensors that include ISPs could indeed require to be exposed as multiple
subdevs, but I was mostly referring to raw Bayer sensors with hardware
architectures similar to the SMIA++ and MIPI CCS specifications. Those
sensors can perform cropping in up to three different locations (analog
crop, digital crop, output crop), and can also scale in up to three
different locations (binning, skipping and filter-based scaling).

Furthermore, with the V4L2 support for multiplexed streams that we are
working on, a sensor that can produce both image data and embedded data
would also need to be split in multiple subdevs.

> 2. With driver supporting single device node control of entire pipeline 
> devices compared to MC-based, limitation is with userspace apps for only 
> these complex camera sensors?

In those cases, several policy decisions on how to configure the sensor
(whether to use binning, skipping and/or filter-based scaling for
instance, or how much cropping and scaling to apply to achieve a certain
output resolution) will need to be implemented in the kernel, and
userspace will not have any control on them.

> 3. Does all upstream video capture drivers eventually will be moved to 
> support MC-based?

I think we'll see a decrease of the video-node-centric drivers in the
future for embedded systems, especially the ones that include an ISP.
When a system has an ISP, even if the ISP is implemented as a
memory-to-memory device separate from the CSI-2 capture side, userspace
will likely have a need for fine-grained control of the camera sensor.

> 4. Based on libcamera doc looks like it will work with both types of 
> MC-based and single devnode based pipeline setup drivers for normal 
> sensors and limitation is when we use ISP built-in sensor or ISP HW 
> block. Is my understanding correct?

libcamera supports both, it doesn't put any restriction in that area.
The pipeline handler (the device-specific code in libcamera that
configures and control the hardware pipeline) is responsible for
interfacing with the kernel drivers, and is free to use an MC-centric or
video-node-centric API depending on what the kernel drivers offer.

The IPA (image processing algorithms) module is also vendor-specific.
Although it will not interface directly with kernel drivers, it will
have requirements on how fine-grained control of the sensor is required.
For systems that have an ISP in the SoC, reaching a high image quality
level requires fine-grained control of the sensor, or at the very least
being able to retrieve fine-grained sensor configuration information
from the kernel. For systems using a camera sensor with an integrated
ISP and a CSI-2 receiver without any further processing on the SoC side,
there will be no such fine-grained control of the sensor by the IPA (and
there could even be no IPA module at all).

-- 
Regards,

Laurent Pinchart
