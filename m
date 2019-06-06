Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB29374C0
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbfFFNC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:02:28 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49802 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbfFFNC2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 09:02:28 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 6ABAA634C7B;
        Thu,  6 Jun 2019 16:02:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v2 0/9] Rework V4L2 fwnode parsing; add defaults and avoid iteration
Date:   Thu,  6 Jun 2019 16:02:16 +0300
Message-Id: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This patchset reworks V4L2 fwnode endpoint parsing. It enables the use of
endpoint configuration defaults that is available sensors and other
drivers that only use a single endpoint. Well, the functionality was
available already but no driver used it likely because of two reasons:
lack of any examples in a non-trivial problem area as well as lack of a
needed functionality to obtain through non-iterative means in the fwnode
graph API. Also the fwnode framework did not provide the most convenient
APIs to perform this for drivers.

Conversion from the iterative API is done for the omap3isp and ipu3-cio2
drivers. A downside here is that this adds code: what used to be done in
the framework in a one-size-fits-all fashion is now the responsibility of
the driver. The benefits (default settings and simplicity of the
implementation from driver's point of view) are not really achievable
without some of that.

Also baked in the set is matching devices with endpoints by endpoint node
rather than the device's node. This allows finding out more information
than just the device bound (i.e. the port --- or endpoint --- through
which it was bound). Compatibility support is provided for existing
drivers by setting the fwnode to be matched based on the available
endpoints.

I'll send a pull request on these soonish as they've been out for review
for a long time with trivial changes in this version only.

since v1:

- Fix a typo in ipu3-cio2 driver --- it did not compile.

- Remove unused ret variable.

- Rework the code regarding ret variable in the 2nd patch. That code did
  not compile until the 3rd patch fixed it.

since RFC v1:

- Add another patch to change fwnode refcounting for
  v4l2_async_notifier_add_fwnode_subdev

- Add a patch to fix OF node refcounting and use / put order for
  davinci-vpif

- Don't take endpoint reference in v4l2_async_register_subdev; that's not
  intended

- Fix kerneldoc documentation for
  v4l2_async_notifier_add_fwnode_remote_subdev

- Fix endpoint refcounting in the patch changing fwnode parsing for the
  omap3isp driver

- Fixed a compiler error in rcar_drif.c --- thanks, Niklas!

Sakari Ailus (9):
  davinci-vpif: Don't dereference endpoint after putting it, fix
    refcounting
  v4l2-async: Use endpoint node, not device node, for fwnode match
  v4l2-async: Get fwnode reference when putting it to the notifier's
    list
  v4l2-async: Add v4l2_async_notifier_add_fwnode_remote_subdev
  omap3isp: Rework OF endpoint parsing
  v4l2-async: Safely clean up an uninitialised notifier
  ipu3-cio2: Clean up notifier's subdev list if parsing endpoints fails
  ipu3-cio2: Proceed with notifier init even if there are no subdevs
  ipu3-cio2: Parse information from firmware without using callbacks

 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  96 ++++----
 drivers/media/platform/am437x/am437x-vpfe.c   |   7 +-
 drivers/media/platform/atmel/atmel-isc.c      |   2 +-
 drivers/media/platform/atmel/atmel-isi.c      |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   2 +-
 drivers/media/platform/davinci/vpif_capture.c |  37 +--
 drivers/media/platform/exynos4-is/media-dev.c |  14 +-
 drivers/media/platform/omap3isp/isp.c         | 331 +++++++++++++++-----------
 drivers/media/platform/pxa_camera.c           |   2 +-
 drivers/media/platform/qcom/camss/camss.c     |  10 +-
 drivers/media/platform/rcar_drif.c            |   2 +-
 drivers/media/platform/renesas-ceu.c          |   2 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |   2 +-
 drivers/media/platform/ti-vpe/cal.c           |   2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  15 +-
 drivers/media/v4l2-core/v4l2-async.c          |  37 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  26 +-
 drivers/staging/media/soc_camera/soc_camera.c |  14 +-
 include/media/v4l2-async.h                    |  30 ++-
 19 files changed, 386 insertions(+), 247 deletions(-)

-- 
2.11.0



Sakari Ailus (9):
  davinci-vpif: Don't dereference endpoint after putting it, fix
    refcounting
  v4l2-async: Use endpoint node, not device node, for fwnode match
  v4l2-async: Get fwnode reference when putting it to the notifier's
    list
  v4l2-async: Add v4l2_async_notifier_add_fwnode_remote_subdev
  omap3isp: Rework OF endpoint parsing
  v4l2-async: Safely clean up an uninitialised notifier
  ipu3-cio2: Clean up notifier's subdev list if parsing endpoints fails
  ipu3-cio2: Proceed with notifier init even if there are no subdevs
  ipu3-cio2: Parse information from firmware without using callbacks

 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  96 ++++----
 drivers/media/platform/am437x/am437x-vpfe.c   |   7 +-
 drivers/media/platform/atmel/atmel-isc.c      |   2 +-
 drivers/media/platform/atmel/atmel-isi.c      |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   2 +-
 drivers/media/platform/davinci/vpif_capture.c |  37 +--
 drivers/media/platform/exynos4-is/media-dev.c |  14 +-
 drivers/media/platform/omap3isp/isp.c         | 331 +++++++++++++++-----------
 drivers/media/platform/pxa_camera.c           |   2 +-
 drivers/media/platform/qcom/camss/camss.c     |  10 +-
 drivers/media/platform/rcar_drif.c            |   2 +-
 drivers/media/platform/renesas-ceu.c          |   2 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |   2 +-
 drivers/media/platform/ti-vpe/cal.c           |   2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  15 +-
 drivers/media/v4l2-core/v4l2-async.c          |  37 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  27 +--
 drivers/staging/media/soc_camera/soc_camera.c |  14 +-
 include/media/v4l2-async.h                    |  30 ++-
 19 files changed, 386 insertions(+), 248 deletions(-)

-- 
2.11.0

