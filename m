Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82C42F65BB
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 17:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbhANQW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 11:22:57 -0500
Received: from retiisi.eu ([95.216.213.190]:57882 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbhANQW5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 11:22:57 -0500
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 70CCA634C89;
        Thu, 14 Jan 2021 18:21:22 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1l05NC-0002Tx-CJ; Thu, 14 Jan 2021 18:21:22 +0200
Date:   Thu, 14 Jan 2021 18:21:22 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Petr Mladek <pmladek@suse.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>
Subject: [GIT PULL for 5.12] IPU3 bridge
Message-ID: <20210114162122.GO850@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The main thing this pull request contains is the IPU3 bridge that lays
groundwork for using the IPU3 driver on systems with Windows camera ACPI
tables. Included are also a documentation build fix and checkpatch fixes
for the recently merged ov5648 and ov8865 drivers.

The patches that the IPU3 bridge depends do touch ACPI, device properties
and software nodes (Rafael's linux-pm tree), printk tests (Petr Mladek's
printk tree). We've agreed to merge them all through linux-media.

Please pull.


The following changes since commit d497fcdab02996a4510d5dd0d743447c737c317a:

  media: aspeed: fix error return code in aspeed_video_setup_video() (2021-01-12 18:23:51 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.12-3-signed

for you to fetch changes up to 5eb108f0a3605855a58fef0c07be8d9ab5bc68e2:

  ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver (2021-01-14 15:56:58 +0200)

----------------------------------------------------------------
V4L2 patches for 5.12

----------------------------------------------------------------
Andy Shevchenko (1):
      media: ipu3-cio2: Add headers that ipu3-cio2.h is direct user of

Daniel Scally (13):
      software_node: Fix refcounts in software_node_get_next_child()
      device property: Return true in fwnode_device_is_available for NULL ops
      device property: Call fwnode_graph_get_endpoint_by_id() for fwnode->secondary
      software_node: Enforce parent before child ordering of nodes arrays
      software_node: unregister software_nodes in reverse order
      device property: Define format macros for ports and endpoints
      lib/test_printf.c: Use helper function to unwind array of software_nodes
      ipu3-cio2: Add T: entry to MAINTAINERS
      ipu3-cio2: Rename ipu3-cio2.c
      media: v4l2-core: v4l2-async: Check sd->fwnode->secondary in match_fwnode()
      ACPI / bus: Add acpi_dev_get_next_match_dev() and helper macro
      media: v4l2-fwnode: Include v4l2_fwnode_bus_type
      ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver

Heikki Krogerus (1):
      software_node: Add support for fwnode_graph*() family of functions

Paul Kocialkowski (1):
      media: i2c: ov5648/ov8865: Minor cosmetic fixes

Sakari Ailus (1):
      Documentation: media: Fix recently introduced build warning in subdev docs

 Documentation/driver-api/media/v4l2-subdev.rst     |   2 +-
 MAINTAINERS                                        |   2 +
 drivers/acpi/utils.c                               |  30 +-
 drivers/base/property.c                            |  15 +-
 drivers/base/swnode.c                              | 180 ++++++++++--
 drivers/media/i2c/ov5648.c                         |   3 +-
 drivers/media/i2c/ov8865.c                         |   8 +-
 drivers/media/pci/intel/ipu3/Kconfig               |  18 ++
 drivers/media/pci/intel/ipu3/Makefile              |   3 +
 drivers/media/pci/intel/ipu3/cio2-bridge.c         | 314 +++++++++++++++++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.h         | 125 ++++++++
 .../intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c}   |  34 +++
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |  24 ++
 drivers/media/v4l2-core/v4l2-async.c               |   8 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |  11 -
 include/acpi/acpi_bus.h                            |   7 +
 include/linux/fwnode.h                             |   7 +
 include/media/v4l2-fwnode.h                        |  22 ++
 lib/test_printf.c                                  |   4 +-
 19 files changed, 773 insertions(+), 44 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
 rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (98%)

-- 
Kind regards,

Sakari Ailus
