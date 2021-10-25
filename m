Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9914394C9
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 13:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbhJYL1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 07:27:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:41187 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233087AbhJYL1i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 07:27:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="293090765"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; 
   d="scan'208";a="293090765"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 04:25:16 -0700
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; 
   d="scan'208";a="634706222"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 04:25:12 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 98CB920150;
        Mon, 25 Oct 2021 14:25:10 +0300 (EEST)
Date:   Mon, 25 Oct 2021 14:25:10 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 3/6] Documentation: ACPI: Document _DSC object usage for
 enum power state
Message-ID: <YXaUFk7bQVNhq1L7@paasikivi.fi.intel.com>
References: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
 <20211018121729.6357-4-sakari.ailus@linux.intel.com>
 <4da84e63-0e3d-155f-f3db-5d3a9efe3aa7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4da84e63-0e3d-155f-f3db-5d3a9efe3aa7@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Mon, Oct 25, 2021 at 07:01:41PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 10/18/21 8:17 PM, Sakari Ailus wrote:
> > Document the use of the _DSC object for setting desirable power state
> > during probe.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> >  Documentation/firmware-guide/acpi/index.rst   |  1 +
> >  .../firmware-guide/acpi/non-d0-probe.rst      | 78 +++++++++++++++++++
> >  2 files changed, 79 insertions(+)
> >  create mode 100644 Documentation/firmware-guide/acpi/non-d0-probe.rst
> > 
> > diff --git a/Documentation/firmware-guide/acpi/index.rst b/Documentation/firmware-guide/acpi/index.rst
> > index a99ee402b212b..b053b0c3d6969 100644
> > --- a/Documentation/firmware-guide/acpi/index.rst
> > +++ b/Documentation/firmware-guide/acpi/index.rst
> > @@ -26,5 +26,6 @@ ACPI Support
> >     acpi-lid
> >     lpit
> >     video_extension
> > +   non-d0-probe
> >     extcon-intel-int3496
> >     intel-pmc-mux
> > diff --git a/Documentation/firmware-guide/acpi/non-d0-probe.rst b/Documentation/firmware-guide/acpi/non-d0-probe.rst
> > new file mode 100644
> > index 0000000000000..78781e1ab6a3d
> > --- /dev/null
> > +++ b/Documentation/firmware-guide/acpi/non-d0-probe.rst
> > @@ -0,0 +1,78 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +========================================
> > +Probing devices in other D states than 0
> > +========================================
> > +
> > +Introduction
> > +============
> > +
> > +In some cases it may be preferred to leave certain devices powered off for the
> > +entire system bootup if powering on these devices has adverse side effects,
> > +beyond just powering on the said device.
> > +
> > +How it works
> > +============
> > +
> > +The _DSC (Device State for Configuration) object that evaluates to an integer
> > +may be used to tell Linux the highest allowed D state for a device during
> > +probe. The support for _DSC requires support from the kernel bus type if the
> > +bus driver normally sets the device in D0 state for probe.
> > +
> > +The downside of using _DSC is that as the device is not powered on, even if
> > +there's a problem with the device, the driver likely probes just fine but the
> > +first user will find out the device doesn't work, instead of a failure at probe
> > +time. This feature should thus be used sparingly.
> > +
> > +I�C
> > +---
> > +
> > +If an I�C driver indicates its support for this by setting the
> > +I2C_DRV_ACPI_WAIVE_D0_PROBE flag in struct i2c_driver.flags field and the
> > +_DSC object evaluates to integer higher than the D state of the device,
> > +the device will not be powered on (put in D0 state) for probe.
> > +
> > +D states
> > +--------
> > +
> > +The D states and thus also the allowed values for _DSC are listed below. Refer
> > +to [1] for more information on device power states.
> > +
> > +.. code-block:: text
> > +
> > +	Number	State	Description
> > +	0	D0	Device fully powered on
> > +	1	D1
> > +	2	D2
> > +	3	D3hot
> > +	4	D3cold	Off
> > +
> > +References
> > +==========
> > +
> > +[1] https://uefi.org/specifications/ACPI/6.4/02_Definition_of_Terms/Definition_of_Terms.html#device-power-state-definitions
> > +
> > +Example
> > +=======
> > +
> > +An ASL example describing an ACPI device using _DSC object to tell Operating
> > +System the device should remain powered off during probe looks like this. Some
> > +objects not relevant from the example point of view have been omitted.
> > +
> > +.. code-block:: text
> > +
> > +	Device (CAM0)
> > +        {
> > +		Name (_HID, "SONY319A")
> > +		Name (_UID, Zero)
> > +		Name (_CRS, ResourceTemplate ()
> > +		{
> > +			I2cSerialBus(0x0020, ControllerInitiated, 0x00061A80,
> > +				     AddressingMode7Bit, "\\_SB.PCI0.I2C0",
> > +				     0x00, ResourceConsumer)
> > +		})
> > +		Name (_DSC, 0, NotSerialized)
> > +		{
> > +			Return (0x4)
> > +                }
> One question here:
> Is the value of _DSC object evaluated from 'Method' or 'Name' ?

"Method". This is a bug in the documentation. Thanks!

Rafael: could you fix this while applying?

-- 
Sakari Ailus
