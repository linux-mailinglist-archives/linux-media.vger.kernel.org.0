Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269DC1C38E9
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 14:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgEDMIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 08:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726445AbgEDMIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 08:08:44 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D236AC061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=+LivZ7XIdr+JuLNszhfjBx3ERwicsmZ1RqwlMn3QXzM=; b=jDDAjraS5JsBo5AmiINKtJmtKF
        4wdymluejUrMekwk3T38ev6yfkC96B6LiMAPU4rpWaWX/ZukSijcLqoQGRhhhjRQQSG3AZwu1wK1M
        DINrVyvAW6/eOCBOKAp9WdcjTd+GLsnuSSy5ChBUWucxrBV5FE6xZ1BUDW4anujsZuS42vQU/HV+O
        7ExJZe4BlO21cpUC7nzYYfchxROJjaE/V72jlSNh7lXJFY6GbZRS1XYruOQZtO7u00NcmpQBStDTE
        +neoHezanMpkPDqdf1aQB/K1ZNlRMLIoSkQS1YXDwMYM3cSB/KOO8MhyePbSiurP0aAxw97esak59
        7/Jjn7Zw==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVZtm-0003ff-97; Mon, 04 May 2020 12:08:38 +0000
Date:   Mon, 4 May 2020 14:08:33 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200504140833.11dd5622@coco.lan>
In-Reply-To: <20200504124539.77eac397@ASUS>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
        <20200504101628.0f632bf2@ASUS>
        <20200504104934.7873cee3@coco.lan>
        <20200504124539.77eac397@ASUS>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 4 May 2020 12:45:39 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On Mon, 4 May 2020 10:49:34 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>=20
> > Em Mon, 4 May 2020 10:16:28 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >  =20
> > > On Sun, 3 May 2020 18:07:51 +0200
> > > Patrik Gfeller <patrik.gfeller@gmail.com> wrote:
> > >     =20
> >  [...]   =20
> > >=20
> > > I was not able yet to compile the kernel 4.4 successfully yet.    =20
> >=20
> > Yesterday, I imported only a subset of the yocto patches. I imported to=
day
> > all 24 patches from it, as some patches depend on hacks on other upstre=
am
> > stuff. You'll need to do a:
> >=20
> > 	$ git remote update && git reset --hard origin/yocto_intel_atom
> >=20
> > To update your local branch.
> >  =20
> > > I get quite
> > > some warnings that are treated as errors. I assume that I can "resolv=
e"
> > > this by removing the respective compiler flag (-Werror).   =20
> >=20
> > Yeah, you may need to to that. There's a Kernel option with disables
> > -Werror. You may also change the Makefile to add things like:
> >=20
> > 	# HACK! While this driver is in bad shape, don't enable several warnin=
gs
> > 	#       that would be otherwise enabled with W=3D1
> > 	ccflags-y +=3D $(call cc-disable-warning, implicit-fallthrough)
> > 	ccflags-y +=3D $(call cc-disable-warning, missing-prototypes)
> > 	ccflags-y +=3D $(call cc-disable-warning, missing-declarations)
> > 	ccflags-y +=3D $(call cc-disable-warning, suggest-attribute=3Dformat)
> > 	ccflags-y +=3D $(call cc-disable-warning, unused-const-variable)
> > 	ccflags-y +=3D $(call cc-disable-warning, unused-but-set-variable)
> >=20
> > (this is what we do with the upstream version, as this driver is on
> > bad shape)
> >  =20
> > > But there are a few things that will take more time for me to investi=
gate:
> > >=20
> > > drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atom=
isp_cmd.c:36:10: fatal error: linux/kct.h: No such file or directory
> > > include/media/v4l2-subdev.h:821:51: error: =E2=80=98const struct v4l2=
_subdev_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99
> > > include/media/v4l2-subdev.h:822:15: error: =E2=80=98const struct v4l2=
_subdev_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=
=99 =20
>=20
> There are still errors when I try to build. I've found code like the
> one below:
>=20
> const struct v4l2_ioctl_ops atomisp_ioctl_ops =3D {
> 	.vidioc_querycap =3D atomisp_querycap,
> #ifndef CONFIG_INTEL_MID_ISP
> 	.vidioc_g_chip_ident =3D atomisp_g_chip_ident,
> #endif
> 	.vidioc_enum_input =3D atomisp_enum_input,
>=20
> Therefore I've tried with "CONFIG_INTEL_MID_ISP=3Dy". Not sure if this is
> a good idea function wise - but it compiles.

Yes, that's it. You also need:

CONFIG_REGULATOR_WHISKEY_COVE=3Dy        =20

and maybe some other stuff. Take a look at the Yocto's *.cfg files I pointed
with the options (see enclosed).



> But the last step of the
> module build produces some scary warnings:
>=20
> WARNING: "cpu_tss" [drivers/media/pci/atomisp//css2401a0_v21_build/atomis=
p-css2401a0_v21.ko] undefined!
> WARNING: "pv_lock_ops" [drivers/media/pci/atomisp//css2401a0_v21_build/at=
omisp-css2401a0_v21.ko] undefined!
> WARNING: "__alloc_workqueue_key" [drivers/media/pci/atomisp//css2401a0_v2=
1_build/atomisp-css2401a0_v21.ko] undefined!
> WARNING: "v4l2_subdev_querymenu" [drivers/media/pci/atomisp//css2401a0_v2=
1_build/atomisp-css2401a0_v21.ko] undefined!
> WARNING: "intel_mid_msgbus_write32" [drivers/media/pci/atomisp//css2401a0=
_v21_build/atomisp-css2401a0_v21.ko] undefined!
> ...
>=20
> Maybe this is related to my partial build (only the module to test if
> it builds). I'll now do a full build of the kernel.

Yeah, either that or there are some config options with different values.

I was able to do a full build here without the above errors, although
I had to turn of some CONFIG options that were otherwise failing.


Thanks,
Mauro

~/meta-intel-aero/recipes-kernel/linux/linux-yocto $ cat *.cfg
CONFIG_USB_ACM=3Dy
CONFIG_USB_WDM=3Dy
CONFIG_USB_USBNET=3Dy
CONFIG_USB_NET_CDC_MBIM=3Dy
CONFIG_MEDIA_PCI_SUPPORT=3Dy

CONFIG_VIDEO_DEV=3Dy
CONFIG_MEDIA_SUPPORT=3Dy
CONFIG_VIDEO_V4L2=3Dy
CONFIG_INTEL_MID_ISP=3Dy
CONFIG_VIDEO_ATOMISP=3Dm
CONFIG_VIDEO_OV7251=3Dy
CONFIG_VIDEO_OV8858=3Dy
CONFIG_I2C_CHARDEV=3Dy
CONFIG_GPIO_SYSFS=3Dy
CONFIG_DYNAMIC_DEBUG=3Dy
CONFIG_PRINTK_TIME=3Dy
CONFIG_DMADEVICES=3Dy
CONFIG_DW_DMAC_CORE=3Dy
CONFIG_DW_DMAC=3Dy
# DRONE CODE CONFIG
CONFIG_HAVE_INTEL_TXT=3Dy
CONFIG_MMU_NOTIFIER=3Dy
CONFIG_PCI_ATS=3Dy
CONFIG_PCI_PASID=3Dy

CONFIG_VFIO_IOMMU_TYPE1=3Dy
CONFIG_VFIO_VIRQFD=3Dy
CONFIG_VFIO=3Dy
CONFIG_VFIO_PCI=3Dy
CONFIG_VFIO_PCI_MMAP=3Dy
CONFIG_VFIO_PCI_INTX=3Dy
CONFIG_IRQ_BYPASS_MANAGER=3Dy

CONFIG_IOMMU_API=3Dy
CONFIG_IOMMU_IOVA=3Dy
CONFIG_DMAR_TABLE=3Dy
CONFIG_INTEL_IOMMU=3Dy
CONFIG_INTEL_IOMMU_SVM=3Dy
CONFIG_INTEL_IOMMU_DEFAULT_ON=3Dy
CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy

CONFIG_X86_INTEL_LPSS=3Dy
CONFIG_I2C_DESIGNWARE_CORE=3Dy
CONFIG_I2C_DESIGNWARE_PCI=3Dy
CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
CONFIG_SERIAL_8250_DW=3Dy
CONFIG_MMC=3Dy
CONFIG_MMC_SDHCI=3Dy
CONFIG_MMC_SDHCI_ACPI=3Dy
CONFIG_NF_NAT_FTP=3Dy
CONFIG_NF_NAT_IPV4=3Dy
CONFIG_NF_NAT_IRC=3Dy
CONFIG_NF_NAT_NEEDED=3Dy
CONFIG_NF_NAT_SIP=3Dy
CONFIG_IP_NF_NAT=3Dy
CONFIG_GPIOLIB=3Dy
CONFIG_DEBUG_PINCTRL=3Dy
CONFIG_PINCTRL_CHERRYVIEW=3Dy

#GPIO Keys
CONFIG_KEYBOARD_GPIO=3Dy
CONFIG_INPUT_MISC=3Dy
CONFIG_INPUT_SOC_BUTTON_ARRAY=3Dy
CONFIG_REGULATOR=3Dy
CONFIG_REGULATOR_DEBUG=3Dy
CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
CONFIG_REGULATOR_GPIO=3Dy
CONFIG_REGULATOR_WHISKEY_COVE=3Dy
CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
CONFIG_SPI=3Dy
CONFIG_SPI_MASTER=3Dy
CONFIG_SPI_SPIDEV=3Dy
CONFIG_SPI_PXA2XX=3Dy
CONFIG_SPI_PXA2XX_DMA=3Dy
CONFIG_SPI_PXA2XX_PCI=3Dy
CONFIG_USB_ETH=3Dy
CONFIG_USB_GADGET=3Dy
CONFIG_USB_DWC3=3Dy
CONFIG_USB_DWC3_PCI=3Dy
CONFIG_USB_DWC3_GADGET=3Dy
CONFIG_USB_OTG=3Dy
CONFIG_USB_OTG_FSM=3Dy
CONFIG_INTEL_CHT_PHY=3Dy
CONFIG_NOP_USB_XCEIV=3Dy
CONFIG_IIO=3Dy
CONFIG_INTEL_SOC_PMIC=3Dy
CONFIG_ITCO_WDT=3Dy
# CONFIG_ITCO_VENDOR_SUPPORT is not set
CONFIG_LPC_ICH=3Dy


