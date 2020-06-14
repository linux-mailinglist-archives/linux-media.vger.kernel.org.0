Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9CC1F8B66
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgFOAAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgFOAAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:14 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E640F9;
        Mon, 15 Jun 2020 02:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179210;
        bh=ipKnPhenAYnlQIeHlkQ01LxdCj0D914DTCITMdqa1DY=;
        h=From:To:Cc:Subject:Date:From;
        b=DoZ2SZEcdnk8qFBzmo46AS6RpBq7VBVIeWnqXmRZLjXWY4PISYkBbsrYg/tz6jBuN
         4KqiKKNHOOhvoavmI4WzFzgD8eJfXJZ5quNrTgWxiJOT5jHbaegajBkMARQxcBxlOX
         +dEayd1/5LXRuU/r+N4WhRh39wOtv4gPEL576Gv4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 000/107] media: ti-vpe: cal: Add media controller support
Date:   Mon, 15 Jun 2020 02:57:57 +0300
Message-Id: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series adds media controller support to the ti-cal
driver.

The end goal is to support pipelines where the image source is more
complex than a single subdev (for instance a SMIA++-compliant sensor, or
an FPD-Link source made of a camera, a serializer and a deserializer),
and to prepare for support of multiple hardware contexts, needed for
CSI-2 virtual channel and data type multiplexing support. These use
cases require configuration of the external pipeline from userspace, and
thus need support for the media controller and V4L2 subdev userspace
APIs.

The series starts with miscellaneous cleanups and refactoring, in
patches 001/107 to 083/107. Worth being noted is the split of the large
driver into multiple files, with patch 081/107 moving video node
handling to cal-video.c and patch 083/107 moving CAMERARX handling to
cal-camerarx.c.

Interleaved with more cleanup and refactoring, patch 084/107 creates
subdevs for the CAMERARX instances, patch 090/107 implements the subdev
operations, and patch 091/107 uses the subdev .set_fmt() and .s_stream()
operations to configure and control the CAMERARX. 

More refactoring and cleanup follow in patches 092/107 to 106/107, until
patch 107/107 that adds media controller support. As the existing video
node centric API needs to be preserved to avoid breaking userspace
applications, a module parameter is added to enable the media controller
API. Changes are otherwise fairly limited, and mostly involve the
implementation of MC-centric V4L2 ioctl handlers (which are far simpler
than their video node centric equivalents), additional pipeline
validation in the vb2 start streaming handler, and disabling control
handling in the video nodes.

The patches have been tested on an AM65x EVM with an OV5640 camera
module with the yavta test application, both in MC mode and in legacy
mode. As the ov5640 driver sets a default format identical to the
default of the ti-cal driver, capture in both modes can simply be tested
with

	yavta -f UYVY -s 640x480 -c10 --requeue-last /dev/video0

without requiring manual pipeline setup through the media controller
API. Usage of other formats or resolutions require pipeline
configuration before capture.

Laurent Pinchart (107):
  media: ti-vpe: cal: Sort headers alphabetically
  media: ti-vpe: cal: Avoid function forward declaration
  media: ti-vpe: cal: Decouple CSI2 port and CPORT
  media: ti-vpe: cal: Index CSI-2 port starting at 0
  media: ti-vpe: cal: Index IRQ registersstarting at 0
  media: ti-vpe: cal: Merge all status variables in IRQ handler
  media: ti-vpe: cal: Inline CAL_VERSION macro in its only user
  media: ti-vpe: cal: Turn reg_(read|write)_field() into inline
    functions
  media: ti-vpe: cal: Make cal_formats array const
  media: ti-vpe: cal: Remove needless variable initialization
  media: ti-vpe: cal: Remove needless casts
  media: ti-vpe: cal: Turn boolean variable into bool
  media: ti-vpe: cal: Make loop indices unsigned where applicable
  media: ti-vpe: cal: Embed base_fields array in struct cal_csi2_phy
  media: ti-vpe: cal: Don't modify cal_csi2_phy base_fields
  media: ti-vpe: cal: Store PHY regmap fields in struct cc_data
  media: ti-vpe: cal: Rename cal_csi2_phy base_fields to fields
  media: ti-vpe: cal: Make structure fields unsigned where applicable
  media: ti-vpe: cal: Constify platform data
  media: ti-vpe: cal: Remove static const cal_regmap_config template
  media: ti-vpe: cal: Remove unused structure fields
  media: ti-vpe: cal: Remove flags field from struct cal_dev
  media: ti-vpe: cal: Move function to avoid forward declaration
  media: ti-vpe: cal: Rename cc_data to cal_camerarx
  media: ti-vpe: cal: Rename cal_csi2_phy to cal_camerarx_data
  media: ti-vpe: cal: Name all cal_dev pointers consistently
  media: ti-vpe: cal: Name all cal_camerarx pointers consistently
  media: ti-vpe: cal: Remove internal phy structure from cal_camerarx
  media: ti-vpe: cal: Store instance ID and cal pointer in cal_camerarx
  media: ti-vpe: cal: Use dev_* print macros
  media: ti-vpe: cal: Add print macros for the cal_camerarx instances
  media: ti-vpe: cal: Store sensor-related data in cal_camerarx
  media: ti-vpe: cal: Create consistent naming for CAMERARX functions
  media: ti-vpe: cal: Group CAMERARX-related functions together
  media: ti-vpe: cal: Create consistent naming for context functions
  media: ti-vpe: cal: Reorganize remaining code in sections
  media: ti-vpe: cal: Rename cal_ctx.csi2_port to cal_ctx.index
  media: ti-vpe: cal: Use correct device name for bus_info
  media: ti-vpe: cal: Get struct device without going through
    v4l2_device
  media: ti-vpe: cal: Use ctx_info() instead of v4l2_info()
  media: ti-vpe: cal: Use a loop to create CAMERARX and context
    instances
  media: ti-vpe: cal: Drop struct cal_dev v4l2_dev field
  media: ti-vpe: cal: Split CAMERARX syscon regmap retrieval to a
    function
  media: ti-vpe: cal: Use syscon_regmap_lookup_by_phandle_args()
  media: ti-vpe: cal: Inline cal_get_camerarx_regmap() in caller
  media: ti-vpe: cal: Add comments to cal_probe() to delimitate sections
  media: ti-vpe: cal: Rename cal_create_instance() to cal_ctx_create()
  media: ti-vpe: cal: Hardcode virtual channel to 0
  media: ti-vpe: cal: Use of_graph_get_endpoint_by_regs() to parse OF
  media: ti-vpe: cal: Fix usage of v4l2_fwnode_endpoint_parse()
  media: ti-vpe: cal: Decouple control handler from v4l2_device
  media: ti-vpe: cal: Move v4l2_device from cal_ctx to cal_dev
  media: ti-vpe: cal: Split video device initialization and registration
  media: ti-vpe: cal: Add context V4L2 cleanup and unregister functions
  media: ti-vpe: cal: Unregister video device before cleanup
  media: ti-vpe: cal: Add cal_camerarx_destroy() to cleanup CAMERARX
  media: ti-vpe: cal: Move DT parsing to CAMERARX
  media: ti-vpe: cal: Use ARRAY_SIZE to replace numerical value
  media: ti-vpe: cal: Move all sensor-related init to .bound() notifier
  media: ti-vpe: cal: Allow multiple contexts per subdev notifier
  media: ti-vpe: cal: Move async notifiers from contexts to cal_dev
  media: ti-vpe: cal: Replace context with phy in async notifier entries
  media: ti-vpe: cal: Operate on phy instances in cal_quickdump_regs()
  media: ti-vpe: cal: Decouple context and phy cleanup at remove time
  media: ti-vpe: cal: Move CAL_NUM_CSI2_PORTS from cal_regs.h to cal.c
  media: ti-vpe: cal: Remove isvcirqset() and isportirqset() macros
  media: ti-vpe: cal: Replace number of ports numerical value by macro
  media: ti-vpe: cal: Split media initialization and cleanup to
    functions
  media: ti-vpe: cal: Read hardware revision earlier during probe
  media: ti-vpe: cal: Print revision and hwinfo in a more readable
    format
  media: ti-vpe: cal: Store struct device in cal_dev
  media: ti-vpe: cal: Register a media device
  media: ti-vpe: cal: Init formats in cal_ctx_v4l2_register()
  media: ti-vpe: cal: Allocate cal_ctx active_fmt array dynamically
  media: ti-vpe: cal: Inline cal_camerarx_max_lanes() in its only caller
  media: ti-vpe: cal: Reorder camerarx functions to prepare refactoring
  media: ti-vpe: cal: Refactor camerarx start and stop
  media: ti-vpe: cal: Don't store external rate in cal_camerarx
  media: ti-vpe: cal: Remove unneeded phy->sensor NULL check
  media: ti-vpe: cal: Use 'unsigned int' type instead of 'unsigned'
  media: ti-vpe: cal: Split video node handling to cal-video.c
  media: ti-vpe: cal: Move CAL I/O accessors to cal.h
  media: ti-vpe: cal: Split CAMERARX handling to cal-camerarx.c
  media: ti-vpe: cal: Create subdev for CAMERARX
  media: ti-vpe: cal: Drop cal_ctx m_fmt field
  media: ti-vpe: cal: Move format handling to cal.c and expose helpers
  media: ti-vpe: cal: Rename MAX_(WIDTH|HEIGHT)_* macros with CAL_
    prefix
  media: ti-vpe: cal: Replace hardcoded BIT() value with macro
  media: ti-vpe: cal: Iterate over correct number of CAMERARX instances
  media: ti-vpe: cal: Implement subdev ops for CAMERARX
  media: ti-vpe: cal: Use CAMERARX subdev s_stream op in video device
    code
  media: ti-vpe: cal: Don't pass format to cal_ctx_wr_dma_config()
  media: ti-vpe: cal: Rename struct cal_fmt to cal_format_info
  media: ti-vpe: cal: Refactor interrupt enable/disable
  media: ti-vpe: cal: Fold PPI enable in CAMERARX .s_stream()
  media: ti-vpe: cal: Stop write DMA without disabling PPI
  media: ti-vpe: cal: Use spin_lock_irq() when starting or stopping
    stream
  media: ti-vpe: cal: Share buffer release code between start and stop
  media: ti-vpe: cal: Drop V4L2_CAP_READWRITE
  media: ti-vpe: cal: Drop unneeded check in cal_calc_format_size()
  media: ti-vpe: cal: Remove DMA queue empty check at start streaming
    time
  media: ti-vpe: cal: Use list_first_entry()
  media: ti-vpe: cal: Group all DMA queue fields in struct cal_dmaqueue
  media: ti-vpe: cal: Set cal_dmaqueue.pending to NULL when no pending
    buffer
  media: ti-vpe: cal: Store buffer DMA address in dma_addr_t
  media: ti-vpe: cal: Simplify the context API
  media: ti-vpe: cal: Implement media controller centric API

 drivers/media/platform/ti-vpe/Makefile       |    2 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c |  857 ++++++
 drivers/media/platform/ti-vpe/cal-video.c    |  957 ++++++
 drivers/media/platform/ti-vpe/cal.c          | 2732 +++++-------------
 drivers/media/platform/ti-vpe/cal.h          |  310 ++
 drivers/media/platform/ti-vpe/cal_regs.h     |   74 +-
 6 files changed, 2865 insertions(+), 2067 deletions(-)
 create mode 100644 drivers/media/platform/ti-vpe/cal-camerarx.c
 create mode 100644 drivers/media/platform/ti-vpe/cal-video.c
 create mode 100644 drivers/media/platform/ti-vpe/cal.h

-- 
Regards,

Laurent Pinchart

