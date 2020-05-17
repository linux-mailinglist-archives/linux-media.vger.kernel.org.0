Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B771D6770
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2020 12:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgEQKhe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 May 2020 06:37:34 -0400
Received: from mga01.intel.com ([192.55.52.88]:61791 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727081AbgEQKhd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 May 2020 06:37:33 -0400
IronPort-SDR: 5rlt5XPafEPh+hrMI10gd4gOAqhg+wDbrTH4zNzb6RozG35ezYSU72LOk0aIHG1HuaDkpnH8ol
 K11O2+t1cp6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2020 03:37:33 -0700
IronPort-SDR: 2rlnOupOePzsQUHffcSW1gW2CbpqjzJsQZ9i7w03d6UV3xwGUf8PdYYGyr0payF3VpXIAH4DW2
 hSu96fBPL47g==
X-IronPort-AV: E=Sophos;i="5.73,403,1583222400"; 
   d="scan'208";a="254201128"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2020 03:37:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9C0CD20803; Sun, 17 May 2020 13:36:59 +0300 (EEST)
Date:   Sun, 17 May 2020 13:36:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH] media: ipu3: add a module to probe sensors via ACPI
Message-ID: <20200517103659.GS17578@paasikivi.fi.intel.com>
References: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the patch.

On Sat, May 16, 2020 at 12:43:39PM +0200, Mauro Carvalho Chehab wrote:
> On devices without ACPI, or which ACPI is not prepared to
> export sensor data via DT, we need a different probing
> method.
> 
> This little driver adds initial support to probe the
> sensors found on a Dell Latitude 7285.
> 
> For now, it just detects the hardware and use request_module()
> to load a sensor driver.
> 
> In the specific case of this device, the ACPI DTST dable
> describes 2 camera sensors for this module, but the
> current upstream doesn't have yet drivers for such
> sensors. So, this patch just detects the PMIC used on
> this device and tries to load a sensor.
> 
> Once the sensor gets added, some additional code will
> be needed to pass via platform_data other details, like
> callbacks for PMIC's command to turn the sensor on/off
> and other sensor-specific settings.
> 
> The idea of this patch was inspired on how the sensors
> are probed by the staging atomisp driver.
> 
> The current result of this driver with the Dell
> Latitude 7285 is:
> 
> 	ipu3_acpi i2c-INT3477:00: ipu3_acpi_probe: ACPI detected it on bus ID=LNK1, HID=INT3477
> 	ipu3_acpi i2c-INT3477:00: Found DMI entry for 'Latitude 7285' with sensor INT3477
> 	ipu3_acpi i2c-INT3477:00: Loading sensor module ov8858
> 	ipu3_acpi i2c-OVTI9234:00: ipu3_acpi_probe: ACPI detected it on bus ID=LNK2, HID=OVTI9234
> 	ipu3_acpi i2c-OVTI9234:00: Found DMI entry for 'Latitude 7285' with sensor OVTI9234
> 	ipu3_acpi i2c-OVTI9234:00: Loading sensor module ov9234
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

...

> +/*
> + * Should list known sensor devices found at DSDT table as "CAM0", "CAM1", ...
> + *
> + * The table below is probably incomplete. It came from the DSDT table found
> + * at a Dell Latitude 7285 (Method HCID).
> + */
> +static const struct acpi_device_id ipu3_acpi_acpi_match[] = {
> +	{"INT3471"},
> +	{"INT33BE"},
> +	{"INT3476"},
> +	{"INT3477"},
> +	{"INT3474"},
> +	{"INT3473"},
> +	{"INT3475"},
> +	{"INT3478"},
> +	{"INT3479"},
> +	{"INT347A"},
> +	{"INT347B"},
> +	{"OVTI9234"},
> +	{"OVTI9734"},
> +	{"OVTI8856"},
> +	{"OVTIF860"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, ipu3_acpi_acpi_match);

Instead of creating a new way to probe drivers on ACPI systems, please add
the appropriate ACPI device IDs to the respective drivers. E.g.
drivers/media/i2c/imx319.c implements this.

-- 
Kind regards,

Sakari Ailus
