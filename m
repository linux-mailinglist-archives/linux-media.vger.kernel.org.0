Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01162937EF
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392770AbgJTJXi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:23:38 -0400
Received: from mga07.intel.com ([134.134.136.100]:57093 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389714AbgJTJXi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:23:38 -0400
IronPort-SDR: 1olCQM3ksSzmrrJTe9bOVFCm/NCBs0cKGAxOVLcviZXxGwpXNGGuc9o5M4heN23d2TdpOXu8tI
 M+yfIrlsxFQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="231375179"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="231375179"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:23:37 -0700
IronPort-SDR: yBP75tiudrzRXJrVgG1IUPKNJg9GcxZo2RtHzE4bnetFQ8oukgbjo/5/PjK7lecwu7cclnXcQc
 wTeuOhbAhJ9Q==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="358460714"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:23:32 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUnsf-00BK3N-IF; Tue, 20 Oct 2020 12:24:33 +0300
Date:   Tue, 20 Oct 2020 12:24:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 0/9] Add functionality to ipu3-cio2 driver
 allowing software_node connections to sensors on platforms designed for
 Windows
Message-ID: <20201020092433.GF4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:58:54PM +0100, Daniel Scally wrote:
> Hello all
> 
> This series adds support to the ipu3-cio2 driver for fwnode connections
> between cio2 and sensors to be defined via software_nodes. The final patch
> in the series deals wholly with those changes - the preceding patches are
> either supporting changes to accommodate that or incidental fixes along
> the way:
> 
> 1/9 adds a function to drivers/base/swnode.c unwinding arrays of software
> nodes in reverse order
> 
> 2/9 uses that function in lib/test_printf.c
> 
> 3/9 fixes what seems to me to be a bug in the existing swnode.c code in
> that software_node_get_next_child() does not increase the refcount of the
> returned node (in contrast to, for example, of_get_next_child_node() which
> does increase the count)
> 
> 4/9 adds the fwnode_graph*() family of functions to the software_node
> implementation
> 
> 5/9 adds a T: entry to MAINTAINERS for the ipu3-cio2 driver
> 
> 6/9 renames the ipu3-cio2.c file to ipu3-cio2-main.c and fixes Makefile
> to accommodate that change
> 
> 7/9 alters the ipu3-cio2 driver to check if the pci_dev's fwnode is a
> software_node and pass flags to fwnode_graph_get_endpoint_by_id() if so
> 
> 8/9 alters match_fwnode() in v4l2-async.c to additionally try to match on
> a fwnode_handle's secondary if the primary doesn't match
> 
> 9/9 alters the ipu3-cio2 driver to do the actual building of software_node
> connections between the sensor devices and the cio2 device.

Thanks!
I have mostly cosmetic comments.

> This is still not ready for integration - hence the RFC label - as there
> is ongoing work to extend the ipu3-cio2 driver further to parse ACPI
> to discover resources such as regulators and GPIOs that are defined there
> in unusual ways and map them to the sensor devices so that their drivers
> can consume them transparently through the usual frameworks. Given this
> has changed quite extensively from v2 though, I wanted to submit it for
> feedback at this point in case it needs further large scale change.

From my point of view it's a good start to drop RFC from next version
(RFC v3 -> v1). But let's wait couple of weeks for people to comment (now is a
second week of merge window, not everybody looking into the mailing lists).

> Daniel Scally (8):
>   software_node: Add helper function to unregister arrays of
>     software_nodes ordered parent to child
>   lib/test_printf.c: Use helper function to unwind array of
>     software_nodes
>   software_node: Fix failure to hold refcount in
>     software_node_get_next_child
>   ipu3-cio2: Add T: entry to MAINTAINERS
>   ipu3-cio2: Rename ipu3-cio2.c to allow module to be built from
>     multiple sources files retaining ipu3-cio2 name
>   ipu3-cio2: Check if pci_dev->dev's fwnode is a software_node in
>     cio2_parse_firmware() and set FWNODE_GRAPH_DEVICE_DISABLED if so
>   media: v4l2-core: v4l2-async: Check possible match in match_fwnode
>     based on sd->fwnode->secondary
>   ipu3-cio2: Add functionality allowing software_node connections to
>     sensors on platforms designed for Windows
> 
> Heikki Krogerus (1):
>   software_node: Add support for fwnode_graph*() family of functions
> 
>  MAINTAINERS                                   |   2 +
>  drivers/base/swnode.c                         | 143 +++++++-
>  drivers/media/pci/intel/ipu3/Kconfig          |  18 +
>  drivers/media/pci/intel/ipu3/Makefile         |   3 +
>  drivers/media/pci/intel/ipu3/cio2-bridge.c    | 327 ++++++++++++++++++
>  drivers/media/pci/intel/ipu3/cio2-bridge.h    |  94 +++++
>  .../ipu3/{ipu3-cio2.c => ipu3-cio2-main.c}    |  30 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   9 +
>  drivers/media/v4l2-core/v4l2-async.c          |   8 +
>  include/linux/property.h                      |   1 +
>  lib/test_printf.c                             |   4 +-
>  11 files changed, 632 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
>  rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (98%)
> 
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


