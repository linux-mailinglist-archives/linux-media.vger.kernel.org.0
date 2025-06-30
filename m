Return-Path: <linux-media+bounces-36351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB423AEEA0F
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0886A167936
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83C523ABBD;
	Mon, 30 Jun 2025 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6iEO/SH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560DC53365
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321882; cv=none; b=TlbouNvCbeX4rrTBD9VDTONUa5oW4Z9PqeuNJNrGg0oB0BvNAode/0k942WawablfSXzHCYcJS86vXZAYJey0de8z6RYUrDOx3Hw8jUXOf2RbtVlONoNFetQoiIUuVj9ujdZnJiepqeoH8FSXWwUR7rDq8Qhl89n9KPQ6A8yOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321882; c=relaxed/simple;
	bh=1G99FLJO6aUnBkv0QjhNx16FSg5P4pZpdFA4jvIH84Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aauTqpidy+b835cfzjhpQnsGVdIwZouEGcpjbffo/9Zpdh+pWTC8jVsZlcK9vHkBvlCiM471gI7cRx1ArKW/kSLc9z681xTWualigw1+licuMGoEuwmJV+NBS/dN/NDW/ZWM3GiUr40FALcp2lbCZgbtxNih0pvc7Y4IgPIADyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6iEO/SH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41285C4CEE3;
	Mon, 30 Jun 2025 22:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751321881;
	bh=1G99FLJO6aUnBkv0QjhNx16FSg5P4pZpdFA4jvIH84Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=D6iEO/SHF8eiqM1NXGM2NFlFAQtdkAbFU1Wx7tnr/LeS/gm/HB5p06vcnnyoaOJ7M
	 ByQBQsoteFVl44RXxg2iJvROTBZHS3QJVUpZ34o7dbsE6whgmrwSO9nxzL2UoR5ajb
	 SAetMMRqJOZi03RWb2+cWGn8uF6/dRkP5IlmSNjidPOR10hll54JtV9STGJAuKHC5B
	 RQSlR+NF4Xj1YeKA+yrxU9t0FYrWZA1T7VmVtdhgjW2xGcKWYxgotLpzcrcJKZNtKQ
	 lB3OQSCACqy+jvSqvUfv2RsdGEu6BdfRiWzMRK6SXoy6R7D+pY1EK2WZXRn396QeB8
	 7e8LLtoEFKIXQ==
Message-ID: <bad61509-5620-4576-aa4b-6a132f7229ad@kernel.org>
Date: Tue, 1 Jul 2025 00:17:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [media.git/next] MAINTAINERS: .mailmap: Update Hans de Goede's
 email address
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
References: <E1uWJhm-0008Ki-2g@linuxtv.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <E1uWJhm-0008Ki-2g@linuxtv.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Hans,

On 30-Jun-25 8:58 PM, media-ci@linuxtv.org wrote:
> On Mon Jun 9 16:35:57 2025 +0200, Hans de Goede wrote:
>> I'm moving all my kernel work over to using my kernel.org email address.
>> Update .mailmap and MAINTAINER entries still using hdegoede@redhat.com.
>>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> 
> Patch committed.
> 
> Thanks,
> Hans Verkuil

This has already been picked-up by Ilpo the pdx86 maintainer
(as I suggested in the cover-letter) and this already is in
Linus' tree now.

Regards,

Hans



> 
>  .mailmap    |  1 +
>  MAINTAINERS | 72 ++++++++++++++++++++++++++++++-------------------------------
>  2 files changed, 37 insertions(+), 36 deletions(-)
> 
> ---
> 
> diff --git a/.mailmap b/.mailmap
> index c8a21d72241f..645294560b19 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -282,6 +282,7 @@ Gustavo Padovan <gustavo@las.ic.unicamp.br>
>  Gustavo Padovan <padovan@profusion.mobi>
>  Hamza Mahfooz <hamzamahfooz@linux.microsoft.com> <hamza.mahfooz@amd.com>
>  Hanjun Guo <guohanjun@huawei.com> <hanjun.guo@linaro.org>
> +Hans de Goede <hansg@kernel.org> <hdegoede@redhat.com>
>  Hans Verkuil <hverkuil@xs4all.nl> <hansverk@cisco.com>
>  Hans Verkuil <hverkuil@xs4all.nl> <hverkuil-cisco@xs4all.nl>
>  Harry Yoo <harry.yoo@oracle.com> <42.hyeyoo@gmail.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa16..e8f3dc93a569 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -207,7 +207,7 @@ X:	arch/*/include/uapi/
>  X:	include/uapi/
>  
>  ABIT UGURU 1,2 HARDWARE MONITOR DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	drivers/hwmon/abituguru.c
> @@ -371,7 +371,7 @@ S:	Maintained
>  F:	drivers/platform/x86/quickstart.c
>  
>  ACPI SERIAL MULTI INSTANTIATE DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/serial-multi-instantiate.c
> @@ -3551,7 +3551,7 @@ F:	arch/arm64/boot/Makefile
>  F:	scripts/make_fit.py
>  
>  ARM64 PLATFORM DRIVERS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	platform-driver-x86@vger.kernel.org
> @@ -3712,7 +3712,7 @@ F:	drivers/platform/x86/asus*.c
>  F:	drivers/platform/x86/eeepc*.c
>  
>  ASUS TF103C DOCK DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> @@ -5613,14 +5613,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
>  F:	drivers/usb/chipidea/
>  
>  CHIPONE ICN8318 I2C TOUCHSCREEN DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml
>  F:	drivers/input/touchscreen/chipone_icn8318.c
>  
>  CHIPONE ICN8505 I2C TOUCHSCREEN DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	drivers/input/touchscreen/chipone_icn8505.c
> @@ -6917,7 +6917,7 @@ F:	include/dt-bindings/pmu/exynos_ppmu.h
>  F:	include/linux/devfreq-event.h
>  
>  DEVICE RESOURCE MANAGEMENT HELPERS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  R:	Matti Vaittinen <mazziesaccount@gmail.com>
>  S:	Maintained
>  F:	include/linux/devm-helpers.h
> @@ -7516,7 +7516,7 @@ F:	drivers/gpu/drm/gud/
>  F:	include/drm/gud.h
>  
>  DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/tiny/gm12u320.c
> @@ -7916,7 +7916,7 @@ F:	drivers/gpu/drm/ci/xfails/vkms*
>  F:	drivers/gpu/drm/vkms/
>  
>  DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> @@ -8317,7 +8317,7 @@ F:	drivers/gpu/drm/panel/
>  F:	include/drm/drm_panel.h
>  
>  DRM PRIVACY-SCREEN CLASS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> @@ -10221,7 +10221,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml
>  
>  GOODIX TOUCHSCREEN
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	drivers/input/touchscreen/goodix*
> @@ -10260,7 +10260,7 @@ F:	include/dt-bindings/clock/google,gs101.h
>  K:	[gG]oogle.?[tT]ensor
>  
>  GPD POCKET FAN DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/gpd-pocket-fan.c
> @@ -11421,7 +11421,7 @@ F:	drivers/i2c/busses/i2c-via.c
>  F:	drivers/i2c/busses/i2c-viapro.c
>  
>  I2C/SMBUS INTEL CHT WHISKEY COVE PMIC DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  F:	drivers/i2c/busses/i2c-cht-wc.c
> @@ -12011,13 +12011,13 @@ S:	Supported
>  F:	sound/soc/intel/
>  
>  INTEL ATOMISP2 DUMMY / POWER-MANAGEMENT DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/intel/atomisp2/pm.c
>  
>  INTEL ATOMISP2 LED DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/intel/atomisp2/led.c
> @@ -13678,7 +13678,7 @@ S:	Maintained
>  F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
>  
>  LETSKETCH HID TABLET DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> @@ -13728,7 +13728,7 @@ F:	drivers/ata/sata_gemini.c
>  F:	drivers/ata/sata_gemini.h
>  
>  LIBATA SATA AHCI PLATFORM devices support
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-ide@vger.kernel.org
>  S:	Maintained
>  F:	drivers/ata/ahci_platform.c
> @@ -14098,7 +14098,7 @@ F:	Documentation/admin-guide/ldm.rst
>  F:	block/partitions/ldm.*
>  
>  LOGITECH HID GAMING KEYBOARDS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> @@ -14780,7 +14780,7 @@ F:	Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml
>  F:	drivers/power/supply/max17040_battery.c
>  
>  MAXIM MAX17042 FAMILY FUEL GAUGE DRIVERS
> -R:	Hans de Goede <hdegoede@redhat.com>
> +R:	Hans de Goede <hansg@kernel.org>
>  R:	Krzysztof Kozlowski <krzk@kernel.org>
>  R:	Marek Szyprowski <m.szyprowski@samsung.com>
>  R:	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> @@ -15582,7 +15582,7 @@ Q:	https://patchwork.kernel.org/project/netdevbpf/list/
>  F:	drivers/net/ethernet/mellanox/mlxfw/
>  
>  MELLANOX HARDWARE PLATFORM SUPPORT
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  M:	Vadim Pasternak <vadimp@nvidia.com>
>  L:	platform-driver-x86@vger.kernel.org
> @@ -16538,7 +16538,7 @@ S:	Maintained
>  F:	drivers/platform/surface/surface_gpe.c
>  
>  MICROSOFT SURFACE HARDWARE PLATFORM SUPPORT
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> @@ -17706,7 +17706,7 @@ F:	tools/include/nolibc/
>  F:	tools/testing/selftests/nolibc/
>  
>  NOVATEK NVT-TS I2C TOUCHSCREEN DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
> @@ -22708,7 +22708,7 @@ K:	fu[57]40
>  K:	[^@]sifive
>  
>  SILEAD TOUCHSCREEN DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> @@ -22741,7 +22741,7 @@ F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
>  F:	drivers/i3c/master/svc-i3c-master.c
>  
>  SIMPLEFB FB DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-fbdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> @@ -22870,7 +22870,7 @@ F:	Documentation/hwmon/emc2103.rst
>  F:	drivers/hwmon/emc2103.c
>  
>  SMSC SCH5627 HARDWARE MONITOR DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  F:	Documentation/hwmon/sch5627.rst
> @@ -23525,7 +23525,7 @@ S:	Supported
>  F:	Documentation/process/stable-kernel-rules.rst
>  
>  STAGING - ATOMISP DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  R:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> @@ -23822,7 +23822,7 @@ F:	arch/m68k/sun3*/
>  F:	drivers/net/ethernet/i825xx/sun3*
>  
>  SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
> @@ -25590,7 +25590,7 @@ F:	Documentation/hid/hiddev.rst
>  F:	drivers/hid/usbhid/
>  
>  USB INTEL XHCI ROLE MUX DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-usb@vger.kernel.org
>  S:	Maintained
>  F:	drivers/usb/roles/intel-xhci-usb-role-switch.c
> @@ -25781,7 +25781,7 @@ F:	Documentation/firmware-guide/acpi/intel-pmc-mux.rst
>  F:	drivers/usb/typec/mux/intel_pmc_mux.c
>  
>  USB TYPEC PI3USB30532 MUX DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-usb@vger.kernel.org
>  S:	Maintained
>  F:	drivers/usb/typec/mux/pi3usb30532.c
> @@ -25810,7 +25810,7 @@ F:	drivers/usb/host/uhci*
>  
>  USB VIDEO CLASS
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	http://www.ideasonboard.org/uvc/
> @@ -26341,7 +26341,7 @@ F:	include/uapi/linux/virtio_snd.h
>  F:	sound/virtio/*
>  
>  VIRTUAL BOX GUEST DEVICE DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Arnd Bergmann <arnd@arndb.de>
>  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  S:	Maintained
> @@ -26350,7 +26350,7 @@ F:	include/linux/vbox_utils.h
>  F:	include/uapi/linux/vbox*.h
>  
>  VIRTUAL BOX SHARED FOLDER VFS DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-fsdevel@vger.kernel.org
>  S:	Maintained
>  F:	fs/vboxsf/*
> @@ -26604,7 +26604,7 @@ F:	drivers/mmc/host/wbsd.*
>  
>  WACOM PROTOCOL 4 SERIAL TABLETS
>  M:	Julian Squires <julian@cipht.net>
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	drivers/input/tablet/wacom_serial4.c
> @@ -26771,7 +26771,7 @@ F:	include/linux/wwan.h
>  F:	include/uapi/linux/wwan.h
>  
>  X-POWERS AXP288 PMIC DRIVERS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  S:	Maintained
>  F:	drivers/acpi/pmic/intel_pmic_xpower.c
>  N:	axp288
> @@ -26863,14 +26863,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
>  F:	arch/x86/mm/
>  
>  X86 PLATFORM ANDROID TABLETS DSDT FIXUP DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>  F:	drivers/platform/x86/x86-android-tablets/
>  
>  X86 PLATFORM DRIVERS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained


