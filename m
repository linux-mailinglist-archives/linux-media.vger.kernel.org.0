Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDD621B4ED
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 14:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgGJMWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 08:22:04 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:53075 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726496AbgGJMWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 08:22:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ts2Qjn77aJcNHts2Tjryaa; Fri, 10 Jul 2020 14:22:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594383721; bh=M7El8JzyXyZJguGY4nruxkxs3oPq65JLv5W51rj+I7Q=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s747MRhJ9bkcggd8M9ZzC+aUeiKmLQ3PHmuXIvomv/2wktPFnC8DMji//UOyWvVqU
         3FW/fmcG92eQBMi+Dh2TwM+L5WLlQ+k5SkhkzMo10AaKheBpFDxTXFMU1DbXgcCund
         gy/7q1soX8S6mgNsW9SqrzM3+6Y2mRz8GfF0spuieE4CECP54IflcM4Aha5ZJvchwx
         TYKrk37jV7tCH+z9RqLZGKJUfYE44WhbxcaCFkKrVjQ9FIWNl7YNH7IgolYfiYzziY
         sz0wh8yE7H2KqKnLbQQGhYjhdvcw32CjDE9KLn/yfj/yfkCAVyIMcbCmdRX8i9117p
         FEF2eSx4a8BsQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] ti-vpe cleanups
Message-ID: <630cbf59-d40f-5115-7f43-3ad4ecfe1166@xs4all.nl>
Date:   Fri, 10 Jul 2020 14:21:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfICH4GLmhFUB+p4CTBjTjhV62/ErHbmzml8PUr0KG+9iItImNCvdzCaZj+ys0m1RF97gDjG244RxT6eGJndDWlUOMtgk5FFFHLPIMMdy6XkDrMDzoxfb
 q/ALg2mzti+L+E3rYbLlbzjofWb1B+ZnODMyDHUJbK1ekIFiid3ucsn3fIWIgCJpUNoXjRQ1LQu/CECDoBgaSG7hrnJJU2n6gjnl0bVXZHOV3xVtqeqM9fZF
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This PR contains patches 01-84 of the "ti-vpe: cal: Add media controller support"
series (https://patchwork.linuxtv.org/cover/65193/).

Since it is such a large series I'll do this in two parts: first the cleanup
patches, and later the remaining patches that do the 'real' work.

Having this merged first will make the remainder more manageable.

Regards,

	Hans

The following changes since commit 6f01dfb760c027d5dd6199d91ee9599f2676b5c6:

  media: cros-ec-cec: do not bail on device_init_wakeup failure (2020-07-04 12:45:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9f

for you to fetch changes up to 638a958ba9a9d9fab3626e18fb3877702e7950a2:

  media: ti-vpe: cal: Split CAMERARX handling to cal-camerarx.c (2020-07-10 14:11:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (84):
      media: ti-vpe: cal: Sort headers alphabetically
      media: ti-vpe: cal: Avoid function forward declaration
      media: ti-vpe: cal: Decouple CSI2 port and CPORT
      media: ti-vpe: cal: Index CSI-2 port starting at 0
      media: ti-vpe: cal: Index IRQ registersstarting at 0
      media: ti-vpe: cal: Merge all status variables in IRQ handler
      media: ti-vpe: cal: Inline CAL_VERSION macro in its only user
      media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functions
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
      media: ti-vpe: cal: Inline cal_data_get_num_csi2_phy() in its caller
      media: ti-vpe: cal: Create consistent naming for context functions
      media: ti-vpe: cal: Reorganize remaining code in sections
      media: ti-vpe: cal: Rename cal_ctx.csi2_port to cal_ctx.index
      media: ti-vpe: cal: Use correct device name for bus_info
      media: ti-vpe: cal: Get struct device without going through v4l2_device
      media: ti-vpe: cal: Use ctx_info() instead of v4l2_info()
      media: ti-vpe: cal: Use a loop to create CAMERARX and context instances
      media: ti-vpe: cal: Drop struct cal_dev v4l2_dev field
      media: ti-vpe: cal: Split CAMERARX syscon regmap retrieval to a function
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
      media: ti-vpe: cal: Split media initialization and cleanup to functions
      media: ti-vpe: cal: Read hardware revision earlier during probe
      media: ti-vpe: cal: Print revision and hwinfo in a more readable format
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

 drivers/media/platform/ti-vpe/Makefile       |    2 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c |  649 ++++++++++++++++
 drivers/media/platform/ti-vpe/cal-video.c    |  886 ++++++++++++++++++++++
 drivers/media/platform/ti-vpe/cal.c          | 2523 ++++++++++++-------------------------------------------------
 drivers/media/platform/ti-vpe/cal.h          |  267 +++++++
 drivers/media/platform/ti-vpe/cal_regs.h     |   74 +-
 6 files changed, 2328 insertions(+), 2073 deletions(-)
 create mode 100644 drivers/media/platform/ti-vpe/cal-camerarx.c
 create mode 100644 drivers/media/platform/ti-vpe/cal-video.c
 create mode 100644 drivers/media/platform/ti-vpe/cal.h
