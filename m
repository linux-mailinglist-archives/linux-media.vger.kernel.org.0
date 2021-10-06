Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B884D4239A7
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 10:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237740AbhJFIXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 04:23:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52114 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237684AbhJFIXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 04:23:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1968LfKe044780;
        Wed, 6 Oct 2021 03:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1633508501;
        bh=47Ql/b34TI2NudpxdAMExDDObe4WGtuKtk47vYdtuuY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=qDRE/cCHSOQDE2hUVG/jlF8OqDfv/tGjY6PQ6el3AAMkcs4uaEL1qK2y3WLvKqrio
         8QyJ3TGapUBkk4KTVqP3fmi89hw6Bo5AQHW+Up08EgxSv4x/on6xGKrJ1gA2eYnTt6
         UU5PmrymGjw02DH/HZYiX3uiZn4lB5uv6giQOUAc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1968Lf7v068193
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Oct 2021 03:21:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 6
 Oct 2021 03:21:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 6 Oct 2021 03:21:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1968Lea2116656;
        Wed, 6 Oct 2021 03:21:40 -0500
Date:   Wed, 6 Oct 2021 13:51:39 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] CSI2RX support on J721E
Message-ID: <20211006082139.ibgdijlbg47o4goz@ti.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-1-p.yadav@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 15/09/21 05:32PM, Pratyush Yadav wrote:
> Hi,
> 
> This series adds support for CSI2 capture on J721E. It includes some
> fixes to the Cadence CSI2RX driver, re-structures the TI platform
> drivers, and finally adds the TI CSI2RX wrapper driver.
> 
> This series used to include the DPHY and DMA engine patches as well, but
> they have been split off to facilitate easier merging.
> 
> Tested on TI's J721E with OV5640 sensor.
> 
> The branch with all the patches needed to enable testing (dts nodes,
> OV5640 dropped patch, etc.) can be found here at
> https://github.com/prati0100/linux-next/ branch "capture".

There are no pending comments on this series. Can this be merged please?

> 
> Changes in v4:
> - Drop the call to set PHY submode. It is now being done via compatible
>   on the DPHY side.
> - Acquire the media device's graph_mutex before starting the graph walk.
> - Call media_graph_walk_init() and media_graph_walk_cleanup() when
>   starting and ending the graph walk respectively.
> - Reduce max frame height and width in enum_framesizes. Currently they
>   are set to UINT_MAX but they must be a multiple of step_width, so they
>   need to be rounded down. Also, these values are absurdly large which
>   causes some userspace applications like gstreamer to trip up. While it
>   is not generally right to change the kernel for an application bug, it
>   is not such a big deal here. This change is replacing one set of
>   absurdly large arbitrary values with another set of smaller but still
>   absurdly large arbitrary values. Both limits are unlikely to be hit in
>   practice.
> - Add power-domains property.
> - Drop maxItems from clock-names.
> - Drop the type for data-lanes.
> - Drop uniqueItems from data-lanes. Move it to video-interfaces.yaml
>   instead.
> - Drop OV5640 runtime pm patch. It seems to be a bit complicated and it
>   is not exactly necessary for this series. Any CSI-2 camera will work
>   just fine, OV5640 just happens to be the one I tested with. I don't
>   want it to block this series. I will submit it as a separate patch
>   later.
> 
> Changes in v3:
> - Use v4l2_get_link_freq() to calculate pixel clock.
> - Move DMA related fields in struct ti_csi2rx_dma.
> - Protect DMA buffer queue with a spinlock to make sure the queue buffer
>   and DMA callback don't race on it.
> - Track the current DMA state. It might go idle because of a lack of
>   buffers. This state can be used to restart it if needed.
> - Do not include the current buffer in the pending queue. It is slightly
>   better modelling than leaving it at the head of the pending queue.
> - Use the buffer as the callback argument, and add a reference to csi in it.
> - If queueing a buffer to DMA fails, the buffer gets leaked and DMA gets
>   stalled with. Instead, report the error to vb2 and queue the next
>   buffer in the pending queue.
> - DMA gets stalled if we run out of buffers since the callback is the
>   only one that fires subsequent transfers and it is no longer being
>   called. Check for that when queueing buffers and restart DMA if
>   needed.
> - Do not put of node until we are done using the fwnode.
> - Set inital format to UYVY 640x480.
> - Add compatible: contains: const: cdns,csi2rx to allow SoC specific
>   compatible.
> - Add more constraints for data-lanes property.
> 
> Changes in v2:
> - Use phy_pm_runtime_get_sync() and phy_pm_runtime_put() before making
>   calls to set PHY mode, etc. to make sure it is ready.
> - Use dmaengine_get_dma_device() instead of directly accessing
>   dma->device->dev.
> - Do not set dst_addr_width when configuring slave DMA.
> - Move to a separate subdir and rename to j721e-csi2rx.c
> - Convert compatible to ti,j721e-csi2rx.
> - Move to use Media Controller centric APIs.
> - Improve cleanup in probe when one of the steps fails.
> - Add colorspace to formats database.
> - Set hw_revision on media_device.
> - Move video device initialization to probe time instead of register time.
> - Rename to ti,j721e-csi2rx.yaml
> - Add an entry in MAINTAINERS.
> - Add a description for the binding.
> - Change compatible to ti,j721e-csi2rx to make it SoC specific.
> - Remove description from dmas, reg, power-domains.
> - Remove a limit of 2 from #address-cells and #size-cells.
> - Fix add ^ to csi-bridge subnode regex.
> - Make ranges mandatory.
> - Add unit address in example.
> - Add a reference to cdns,csi2rx in csi-bridge subnode.
> - Expand the example to include the csi-bridge subnode as well.
> - Re-order subject prefixes.
> - Convert OV5640 to use runtime PM and drop Cadence CSI2RX s_power patch.
> - Drop subdev call wrappers from cdns-csi2rx.
> - Move VPE and CAL to a separate subdir.
> - Rename ti-csi2rx.c to j721e-csi2rx.c
> 
> Pratyush Yadav (11):
>   media: cadence: csi2rx: Unregister v4l2 async notifier
>   media: cadence: csi2rx: Add external DPHY support
>   media: cadence: csi2rx: Soft reset the streams before starting capture
>   media: cadence: csi2rx: Set the STOP bit when stopping a stream
>   media: cadence: csi2rx: Fix stream data configuration
>   media: cadence: csi2rx: Populate subdev devnode
>   media: Re-structure TI platform drivers
>   media: ti: Add CSI2RX support for J721E
>   media: dt-bindings: Make sure items in data-lanes are unique
>   media: dt-bindings: Add DT bindings for TI J721E CSI2RX driver
>   media: dt-bindings: Convert Cadence CSI2RX binding to YAML
> 
>  .../devicetree/bindings/media/cdns,csi2rx.txt |  100 --
>  .../bindings/media/cdns,csi2rx.yaml           |  169 +++
>  .../bindings/media/ti,j721e-csi2rx.yaml       |  101 ++
>  .../bindings/media/video-interfaces.yaml      |    1 +
>  MAINTAINERS                                   |   10 +-
>  drivers/media/platform/Kconfig                |   12 +
>  drivers/media/platform/Makefile               |    2 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  184 ++-
>  drivers/media/platform/ti/Makefile            |    4 +
>  drivers/media/platform/ti/cal/Makefile        |    3 +
>  .../{ti-vpe => ti/cal}/cal-camerarx.c         |    0
>  .../platform/{ti-vpe => ti/cal}/cal-video.c   |    0
>  .../media/platform/{ti-vpe => ti/cal}/cal.c   |    0
>  .../media/platform/{ti-vpe => ti/cal}/cal.h   |    0
>  .../platform/{ti-vpe => ti/cal}/cal_regs.h    |    0
>  .../media/platform/ti/j721e-csi2rx/Makefile   |    2 +
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1008 +++++++++++++++++
>  .../platform/{ti-vpe => ti/vpe}/Makefile      |    4 -
>  .../media/platform/{ti-vpe => ti/vpe}/csc.c   |    0
>  .../media/platform/{ti-vpe => ti/vpe}/csc.h   |    0
>  .../media/platform/{ti-vpe => ti/vpe}/sc.c    |    0
>  .../media/platform/{ti-vpe => ti/vpe}/sc.h    |    0
>  .../platform/{ti-vpe => ti/vpe}/sc_coeff.h    |    0
>  .../media/platform/{ti-vpe => ti/vpe}/vpdma.c |    0
>  .../media/platform/{ti-vpe => ti/vpe}/vpdma.h |    0
>  .../platform/{ti-vpe => ti/vpe}/vpdma_priv.h  |    0
>  .../media/platform/{ti-vpe => ti/vpe}/vpe.c   |    0
>  .../platform/{ti-vpe => ti/vpe}/vpe_regs.h    |    0
>  28 files changed, 1480 insertions(+), 120 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt
>  create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
>  create mode 100644 drivers/media/platform/ti/Makefile
>  create mode 100644 drivers/media/platform/ti/cal/Makefile
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal-camerarx.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal-video.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal_regs.h (100%)
>  create mode 100644 drivers/media/platform/ti/j721e-csi2rx/Makefile
>  create mode 100644 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/Makefile (78%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/sc_coeff.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma_priv.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe_regs.h (100%)
> 
> -- 
> 2.33.0
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
