Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DCB297D12
	for <lists+linux-media@lfdr.de>; Sat, 24 Oct 2020 17:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759997AbgJXPMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Oct 2020 11:12:06 -0400
Received: from mga12.intel.com ([192.55.52.136]:37874 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759823AbgJXPMG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Oct 2020 11:12:06 -0400
IronPort-SDR: HuOspe/n3nt4econGW72VYGZ2QCTqloat7U1DTjgibBozMH93iDOSsvTa8d7qsb7JQ33BDMxOE
 5lLbYQTWKwQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9784"; a="147069893"
X-IronPort-AV: E=Sophos;i="5.77,412,1596524400"; 
   d="scan'208";a="147069893"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2020 08:12:04 -0700
IronPort-SDR: DevLZgzH/Equrh5UUxT81pmyQiMA7m1SnXhyWN52Yfftb0KVQJnfXXDCOWNRQP4UcLFchbGGDs
 r61RI+xdB5yQ==
X-IronPort-AV: E=Sophos;i="5.77,412,1596524400"; 
   d="scan'208";a="423695654"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2020 08:11:55 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2E9A42063B; Sat, 24 Oct 2020 18:11:53 +0300 (EEST)
Date:   Sat, 24 Oct 2020 18:11:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux.walleij@linaro.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201024151153.GC26150@paasikivi.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201024012411.GT5979@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Daniel,

On Sat, Oct 24, 2020 at 04:24:11AM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Mon, Oct 19, 2020 at 11:59:03PM +0100, Daniel Scally wrote:
> > Currently on platforms designed for Windows, connections between CIO2 and
> > sensors are not properly defined in DSDT. This patch extends the ipu3-cio2
> > driver to compensate by building software_node connections, parsing the
> > connection properties from the sensor's SSDB buffer.
> > 
> > Suggested-by: Jordan Hand <jorhand@linux.microsoft.com>
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> > Changes in v3:
> > 	- Rather than overwriting the device's primary fwnode, we now
> > 	simply assign a secondary. Some of the preceding patches alter the
> > 	existing driver code and v4l2 framework to allow for that.
> > 	- Rather than reprobe() the sensor after connecting the devices in
> > 	cio2-bridge we create the software_nodes right away. In this case,
> > 	sensor drivers will have to defer probing until they detect that a
> > 	fwnode graph is connecting them to the CIO2 device.
> > 	- Error paths in connect_supported_devices() moved outside the
> > 	loop
> > 	- Replaced pr_*() with dev_*() throughout
> > 	- Moved creation of software_node / property_entry arrays to stack
> > 	- A lot of formatting changes.
> > 
> >  MAINTAINERS                                   |   1 +
> >  drivers/media/pci/intel/ipu3/Kconfig          |  18 +
> >  drivers/media/pci/intel/ipu3/Makefile         |   3 +-
> >  drivers/media/pci/intel/ipu3/cio2-bridge.c    | 327 ++++++++++++++++++
> >  drivers/media/pci/intel/ipu3/cio2-bridge.h    |  94 +++++
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  21 ++
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   9 +
> >  7 files changed, 472 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
> >  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5d768d5ad..4c9c646c7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8848,6 +8848,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
> >  M:	Yong Zhi <yong.zhi@intel.com>
> >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> >  M:	Bingbu Cao <bingbu.cao@intel.com>
> > +M:	Dan Scally <djrscally@gmail.com>
> >  R:	Tianshu Qiu <tian.shu.qiu@intel.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> > diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
> > index 82d7f17e6..d14cbceae 100644
> > --- a/drivers/media/pci/intel/ipu3/Kconfig
> > +++ b/drivers/media/pci/intel/ipu3/Kconfig
> > @@ -16,3 +16,21 @@ config VIDEO_IPU3_CIO2
> >  	  Say Y or M here if you have a Skylake/Kaby Lake SoC with MIPI CSI-2
> >  	  connected camera.
> >  	  The module will be called ipu3-cio2.
> > +
> > +config CIO2_BRIDGE
> > +	bool "IPU3 CIO2 Sensors Bridge"
> > +	depends on VIDEO_IPU3_CIO2
> > +	help
> > +	  This extension provides an API for the ipu3-cio2 driver to create
> > +	  connections to cameras that are hidden in SSDB buffer in ACPI. It
> > +	  can be used to enable support for cameras in detachable / hybrid
> > +	  devices that ship with Windows.
> > +
> > +	  Say Y here if your device is a detachable / hybrid laptop that comes
> > +	  with Windows installed by the OEM, for example:
> > +
> > +	  	- Some Microsoft Surface models
> > +		- The Lenovo Miix line
> > +		- Dell 7285
> > +
> > +	  If in doubt, say N here.
> > diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
> > index b4e3266d9..933777e6e 100644
> > --- a/drivers/media/pci/intel/ipu3/Makefile
> > +++ b/drivers/media/pci/intel/ipu3/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
> >  
> > -ipu3-cio2-y += ipu3-cio2-main.o
> > \ No newline at end of file
> > +ipu3-cio2-y += ipu3-cio2-main.o
> > +ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
> > diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> > new file mode 100644
> > index 000000000..bbe072f04
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> > @@ -0,0 +1,327 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Author: Dan Scally <djrscally@gmail.com>
> > +#include <linux/acpi.h>
> > +#include <linux/device.h>
> > +#include <linux/fwnode.h>
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +#include <linux/property.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#include "cio2-bridge.h"
> > +
> > +/*
> > + * Extend this array with ACPI Hardware ID's of devices known to be
> > + * working
> > + */
> > +static const char * const supported_devices[] = {
> > +	"INT33BE",
> > +	"OVTI2680",
> > +};
> > +
> > +static struct software_node cio2_hid_node = { CIO2_HID };
> > +
> > +static struct cio2_bridge bridge;
> 
> While there shouldn't be more than one CIO2 instance, we try to develop
> drivers in a way that avoids global per-device variables. Could all this
> be allocated dynamically, with the pointer returned by
> cio2_bridge_build() and stored in the cio2_device structure ?

I don't mind but the Windows ACPI table design assumes there's a single
CIO2. Thus the same assumption can be made here, too. Admittedly, I think
it could be cleaner that way.

...

> > +		dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
> > +		if (!dev) {
> > +			ret = -EPROBE_DEFER;
> > +			goto err_rollback;
> > +		}
> > +
> > +		sensor = &bridge.sensors[bridge.n_sensors];
> > +		sensor->dev = dev;
> > +		sensor->adev = adev;
> > +
> > +		snprintf(sensor->name, ACPI_ID_LEN, "%s",
> > +			 supported_devices[i]);
> 
> How about strlcpy() ?

Or even strscpy()?

> > +void cio2_bridge_burn(struct pci_dev *cio2)
> 
> Interesting function name :-) I like the creativity, but I think
> consistency with the rest of the kernel code should unfortunately be
> favoured.

I guess we can use any pairs that make sense. Create and destroy? Build and
plunder?

-- 
Regards,

Sakari Ailus
