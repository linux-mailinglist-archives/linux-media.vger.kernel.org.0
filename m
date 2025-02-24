Return-Path: <linux-media+bounces-26841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF430A423B3
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 15:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45F883AA5FF
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 14:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B846223BCED;
	Mon, 24 Feb 2025 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DIAeZlg3"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D542F1EA7E6
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407932; cv=none; b=N/h2eewGMt3NahyEO1V1QLW4RBeq2PRqMnvYhQC0RIxy3zf4yLgGS0EkdFQjvSTXJ06gt8hxZLVDxyGlNz72ujUZADk7Y3O4JUv7tAC5PbcyoMQUBI1LGcPHKM9+QWctYV9m+bN/+C8hVEc8S+fP3z2Z7E+hf1mDkxjs4eQVN+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407932; c=relaxed/simple;
	bh=Aa9jrUAfsUgUWYETM0kcCXQcdqJv+JMGtAH4npK2r6Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a5b3orpfviOGVBYpFyb5EH0wdtxjBdG47dBaczbqMT+F6jJTa0VnDZ8qHBHmAopUGzCPmNMryhyF1rYpKrnlUjhbipJuPv3UrdrDZtArHCO5xyHE8Ix4Rx1ey8fo5vbRdjgHxkMEojPDtpKphSuBUVLrvsCt49VDMZgkj+1j2yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DIAeZlg3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Z1jz46bgpz9sWd;
	Mon, 24 Feb 2025 15:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740407920; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unsAax2iEbj7FS4gRwtwm6a7x9tiySjujMQFchPk2Gc=;
	b=DIAeZlg3UEomRQqGNj3wTZVCyegfO9ix8fNhUXY6j0dOsT9xWqycZP4aDHPz1sRO7YhCbD
	VCPdZKfXHAkooN/XLSv7/d6ejaLziDRi2WoNz0DQHJZGyu2DJiQqUecRBC8zxz38qn5x+4
	cB5+pddHCXP3fxpCtxKesGFY5I1cWuBixqLh5BUeTs4v9Z1tXKt64m2JmL1mM4L9Jujocy
	BYXeYzrtzO4DBmXHiMYwD2SERSqsURFB8xV/Ewfz4VsRG0+5eYbEHN+c9Ol3XkznyorQOz
	MOdCkpb3Dt5u5cVB8e9hwpfRNtEcL7DNqP3dSJOkSrZn0yTEH2xPiCpxITIDGg==
Message-ID: <873cbddbc43638c2564ce27e373c25fe2f3dc2e9.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/7] media: ipu7: add Intel IPU7 PCI device driver
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, hdegoede@redhat.com
Cc: hans@hansg.org, stanislaw.gruszka@linux.intel.com, jerry.w.hu@intel.com,
  tian.shu.qiu@intel.com, daxing.li@intel.com, hao.yao@intel.com, 
 bingbu.cao@linux.intel.com
Date: Mon, 24 Feb 2025 15:38:37 +0100
In-Reply-To: <20250221075252.3347582-3-bingbu.cao@intel.com>
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
	 <20250221075252.3347582-3-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: gbqmskh4i8fich3zwrjc5qaewzi3ekxj
X-MBO-RS-ID: 512d9e9085bdffeac7a

Hi,

see below

On Fri, 2025-02-21 at 15:52 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Intel Image Processing Unit 7th Gen includes input and processing
> systems
> and the hardware presents itself as a single PCI device in system
> same
> as IPU6.
>=20
> The IPU7 PCI device driver basically does PCI configurations, basic
> hardware configuration by its buttress interfaces, loads the
> firmware binary, register the auxiliary device which serve for the
> ISYS
> device driver.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
> =C2=A0drivers/media/pci/intel/ipu7/ipu7-bus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 158 +
> =C2=A0drivers/media/pci/intel/ipu7/ipu7-bus.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 69 +
> =C2=A0.../media/pci/intel/ipu7/ipu7-buttress-regs.h |=C2=A0 465 +++
> =C2=A0drivers/media/pci/intel/ipu7/ipu7-buttress.c=C2=A0 | 1187 +++++++
> =C2=A0drivers/media/pci/intel/ipu7/ipu7-buttress.h=C2=A0 |=C2=A0=C2=A0 84=
 +
> =C2=A0.../media/pci/intel/ipu7/ipu7-platform-regs.h |=C2=A0 146 +
> =C2=A0drivers/media/pci/intel/ipu7/ipu7.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2791
> +++++++++++++++++
> =C2=A0drivers/media/pci/intel/ipu7/ipu7.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 244 ++
> =C2=A08 files changed, 5144 insertions(+)
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress-regs.=
h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu7/ipu7-platform-regs.=
h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu7/ipu7.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu7/ipu7.h
>=20
> diff --git a/drivers/media/pci/intel/ipu7/ipu7-bus.c
> b/drivers/media/pci/intel/ipu7/ipu7-bus.c
> new file mode 100644
> index 000000000000..6c2825afaca7
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/ipu7-bus.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2013 - 2024 Intel Corporation
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include "ipu7.h"
> +#include "ipu7-bus.h"
> +#include "ipu7-boot.h"
> +#include "ipu7-dma.h"
> +
> +static int bus_pm_runtime_suspend(struct device *dev)
> +{
> +	struct ipu7_bus_device *adev =3D to_ipu7_bus_device(dev);
> +	int ret;
> +
> +	ret =3D pm_generic_runtime_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ipu_buttress_powerdown(dev, adev->ctrl);
> +	if (!ret)
> +		return 0;
> +
> +	dev_err(dev, "power down failed!\n");
> +
> +	/* Powering down failed, attempt to resume device now */
> +	ret =3D pm_generic_runtime_resume(dev);
> +	if (!ret)
> +		return -EBUSY;
> +
> +	return -EIO;
> +}
> +
> +static int bus_pm_runtime_resume(struct device *dev)
> +{
> +	struct ipu7_bus_device *adev =3D to_ipu7_bus_device(dev);
> +	int ret;
> +
> +	ret =3D ipu_buttress_powerup(dev, adev->ctrl);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pm_generic_runtime_resume(dev);
> +	if (ret)
> +		goto out_err;
> +
> +	return 0;
> +
> +out_err:
> +	ipu_buttress_powerdown(dev, adev->ctrl);
> +
> +	return -EBUSY;
> +}
> +
> +static struct dev_pm_domain ipu7_bus_pm_domain =3D {
> +	.ops =3D {
> +		.runtime_suspend =3D bus_pm_runtime_suspend,
> +		.runtime_resume =3D bus_pm_runtime_resume,
> +	},
> +};
> +
> +static DEFINE_MUTEX(ipu7_bus_mutex);
> +static void ipu7_bus_release(struct device *dev)
> +{
> +	struct ipu7_bus_device *adev =3D to_ipu7_bus_device(dev);
> +
> +	kfree(adev->pdata);
> +	kfree(adev);
> +}
> +
> +struct ipu7_bus_device *
> +ipu7_bus_initialize_device(struct pci_dev *pdev, struct device
> *parent,
> +			=C2=A0=C2=A0 void *pdata, const struct
> ipu_buttress_ctrl *ctrl,
> +			=C2=A0=C2=A0 char *name)
> +{
> +	struct auxiliary_device *auxdev;
> +	struct ipu7_bus_device *adev;
> +	struct ipu7_device *isp =3D pci_get_drvdata(pdev);
> +	int ret;
> +
> +	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	adev->isp =3D isp;
> +	adev->ctrl =3D ctrl;
> +	adev->pdata =3D pdata;
> +	auxdev =3D &adev->auxdev;
> +	auxdev->name =3D name;
> +	auxdev->id =3D (pci_domain_nr(pdev->bus) << 16) |
> +		PCI_DEVID(pdev->bus->number, pdev->devfn);
> +
> +	auxdev->dev.parent =3D parent;
> +	auxdev->dev.release =3D ipu7_bus_release;
> +
> +	ret =3D auxiliary_device_init(auxdev);
> +	if (ret < 0) {
> +		dev_err(&isp->pdev->dev, "auxiliary device init
> failed (%d)\n",
> +			ret);
> +		kfree(adev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	dev_pm_domain_set(&auxdev->dev, &ipu7_bus_pm_domain);
> +
> +	pm_runtime_forbid(&adev->auxdev.dev);
> +	pm_runtime_enable(&adev->auxdev.dev);
> +
> +	return adev;
> +}
> +
> +int ipu7_bus_add_device(struct ipu7_bus_device *adev)
> +{
> +	struct auxiliary_device *auxdev =3D &adev->auxdev;
> +	int ret;
> +
> +	ret =3D auxiliary_device_add(auxdev);
> +	if (ret) {
> +		auxiliary_device_uninit(auxdev);
> +		return ret;
> +	}
> +
> +	mutex_lock(&ipu7_bus_mutex);
> +	list_add(&adev->list, &adev->isp->devices);
> +	mutex_unlock(&ipu7_bus_mutex);
> +
> +	pm_runtime_allow(&auxdev->dev);
> +
> +	return 0;
> +}
> +
> +void ipu7_bus_del_devices(struct pci_dev *pdev)
> +{
> +	struct ipu7_device *isp =3D pci_get_drvdata(pdev);
> +	struct ipu7_bus_device *adev, *save;
> +
> +	mutex_lock(&ipu7_bus_mutex);
> +
> +	list_for_each_entry_safe(adev, save, &isp->devices, list) {
> +		pm_runtime_disable(&adev->auxdev.dev);
> +		list_del(&adev->list);
> +		auxiliary_device_delete(&adev->auxdev);
> +		auxiliary_device_uninit(&adev->auxdev);
> +	}
> +
> +	mutex_unlock(&ipu7_bus_mutex);
> +}
> diff --git a/drivers/media/pci/intel/ipu7/ipu7-bus.h
> b/drivers/media/pci/intel/ipu7/ipu7-bus.h
> new file mode 100644
> index 000000000000..b180b332cf2a
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/ipu7-bus.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2013 - 2024 Intel Corporation
> + */
> +
> +#ifndef IPU7_BUS_H
> +#define IPU7_BUS_H
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/irqreturn.h>
> +#include <linux/list.h>
> +#include <linux/scatterlist.h>
> +#include <linux/types.h>
> +
> +#include "abi/ipu7_fw_boot_abi.h"
> +
> +#include "ipu7-syscom.h"
> +
> +struct pci_dev;
> +struct ipu_buttress_ctrl;
> +struct ipu7_mmu;
> +struct ipu7_device;
> +
> +enum ipu7_subsys {
> +	IPU_IS =3D 0,
> +	IPU_PS =3D 1,
> +	IPU_SUBSYS_NUM =3D 2,
> +};
> +
> +struct ipu7_bus_device {
> +	struct auxiliary_device auxdev;
> +	const struct auxiliary_driver *auxdrv;
> +	const struct ipu7_auxdrv_data *auxdrv_data;
> +	struct list_head list;
> +	enum ipu7_subsys subsys;
> +	void *pdata;
> +	struct ipu7_mmu *mmu;
> +	struct ipu7_device *isp;
> +	const struct ipu_buttress_ctrl *ctrl;
> +	u64 dma_mask;
> +	struct sg_table fw_sgt;
> +	u32 fw_entry;
> +	struct ipu7_syscom_context *syscom;
> +	struct ia_gofo_boot_config *boot_config;
> +	dma_addr_t boot_config_dma_addr;
> +	u32 boot_config_size;
> +};
> +
> +struct ipu7_auxdrv_data {
> +	irqreturn_t (*isr)(struct ipu7_bus_device *adev);
> +	irqreturn_t (*isr_threaded)(struct ipu7_bus_device *adev);
> +	bool wake_isr_thread;
> +};
> +
> +#define
> to_ipu7_bus_device(_dev)					\
> +	container_of(to_auxiliary_dev(_dev), struct ipu7_bus_device,
> auxdev)
> +#define
> auxdev_to_adev(_auxdev)					\
> +	container_of(_auxdev, struct ipu7_bus_device, auxdev)
> +#define ipu7_bus_get_drvdata(adev) dev_get_drvdata(&(adev)-
> >auxdev.dev)
> +
> +struct ipu7_bus_device *
> +ipu7_bus_initialize_device(struct pci_dev *pdev, struct device
> *parent,
> +			=C2=A0=C2=A0 void *pdata, const struct
> ipu_buttress_ctrl *ctrl,
> +			=C2=A0=C2=A0 char *name);
> +int ipu7_bus_add_device(struct ipu7_bus_device *adev);
> +void ipu7_bus_del_devices(struct pci_dev *pdev);
> +#endif
> diff --git a/drivers/media/pci/intel/ipu7/ipu7-buttress-regs.h
> b/drivers/media/pci/intel/ipu7/ipu7-buttress-regs.h
> new file mode 100644
> index 000000000000..fdf6148fb95c
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/ipu7-buttress-regs.h
> @@ -0,0 +1,465 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 - 2024 Intel Corporation
> + */
> +
> +#ifndef IPU7_BUTTRESS_REGS_H
> +#define IPU7_BUTTRESS_REGS_H
> +
> +#define
> BUTTRESS_REG_IRQ_STATUS					0x2000
> +#define
> BUTTRESS_REG_IRQ_STATUS_UNMASKED			0x2004
> +#define
> BUTTRESS_REG_IRQ_ENABLE					0x2008
> +#define
> BUTTRESS_REG_IRQ_CLEAR					0x200c
> +#define
> BUTTRESS_REG_IRQ_MASK					0x2010
> +#define
> BUTTRESS_REG_TSC_CMD					0x2014
> +#define
> BUTTRESS_REG_TSC_CTL					0x2018
> +#define
> BUTTRESS_REG_TSC_LO					0x201c
> +#define
> BUTTRESS_REG_TSC_HI					0x2020
> +
> +/* valid for PTL */
> +#define
> BUTTRESS_REG_PB_TIMESTAMP_LO				0x2030
> +#define
> BUTTRESS_REG_PB_TIMESTAMP_HI				0x2034
> +#define
> BUTTRESS_REG_PB_TIMESTAMP_VALID				0x2038
> +
> +#define
> BUTTRESS_REG_PS_WORKPOINT_REQ				0x2100
> +#define
> BUTTRESS_REG_IS_WORKPOINT_REQ				0x2104
> +#define
> BUTTRESS_REG_PS_WORKPOINT_DOMAIN_REQ			0x2108
> +#define
> BUTTRESS_REG_PS_DOMAINS_STATUS				0x2110
> +#define
> BUTTRESS_REG_PWR_STATUS					0x2114
> +#define
> BUTTRESS_REG_PS_WORKPOINT_REQ_SHADOW			0x2120
> +#define
> BUTTRESS_REG_IS_WORKPOINT_REQ_SHADOW			0x2124
> +#define
> BUTTRESS_REG_PS_WORKPOINT_DOMAIN_REQ_SHADOW		0x2128
> +#define
> BUTTRESS_REG_ISPS_WORKPOINT_DOWNLOAD			0x212c
> +#define
> BUTTRESS_REG_PG_FLOW_OVERRIDE				0x2180
> +#define
> BUTTRESS_REG_GLOBAL_OVERRIDE_UNGATE_CTL			0x2184
> +#define
> BUTTRESS_REG_PWR_FSM_CTL				0x2188
> +#define
> BUTTRESS_REG_IDLE_WDT					0x218c
> +#define
> BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_EN			0x2190
> +#define
> BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_ADDR			0x2194
> +#define
> BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_DATA			0x2198
> +#define
> BUTTRESS_REG_POWER_EN_DELAY				0x219c
> +#define
> IPU7_BUTTRESS_REG_LTR_CONTROL				0x21a0
> +#define
> IPU7_BUTTRESS_REG_NDE_CONTROL				0x21a4
> +#define
> IPU7_BUTTRESS_REG_INT_FRM_PUNIT				0x21a8
> +#define
> IPU8_BUTTRESS_REG_LTR_CONTROL				0x21a4
> +#define
> IPU8_BUTTRESS_REG_NDE_CONTROL				0x21a8
> +#define
> IPU8_BUTTRESS_REG_INT_FRM_PUNIT				0x21ac
> +#define
> BUTTRESS_REG_SLEEP_LEVEL_CFG				0x21b0
> +#define
> BUTTRESS_REG_SLEEP_LEVEL_STS				0x21b4
> +#define
> BUTTRESS_REG_DVFS_FSM_STATUS				0x21b8
> +#define
> BUTTRESS_REG_PS_PLL_ENABLE				0x21bc
> +#define
> BUTTRESS_REG_D2D_CTL					0x21d4
> +#define
> BUTTRESS_REG_IB_CLK_CTL					0x21d8
> +#define
> BUTTRESS_REG_IB_CRO_CLK_CTL				0x21dc
> +#define
> BUTTRESS_REG_FUNC_FUSES					0x21e0
> +#define
> BUTTRESS_REG_ISOCH_CTL					0x21e4
> +#define
> BUTTRESS_REG_WORKPOINT_CTL				0x21f0
> +#define
> BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS			0x2200
> +#define
> BUTTRESS_REG_DRV_IS_UCX_START_ADDR			0x2204
> +#define
> BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS			0x2208
> +#define
> BUTTRESS_REG_DRV_PS_UCX_START_ADDR			0x220c
> +#define
> BUTTRESS_REG_DRV_UCX_RESET_CFG				0x2210
> +
> +/* configured by CSE */
> +#define
> BUTTRESS_REG_CSE_IS_UCX_CONTROL_STATUS			0x2300
> +#define
> BUTTRESS_REG_CSE_IS_UCX_START_ADDR			0x2304
> +#define
> BUTTRESS_REG_CSE_PS_UCX_CONTROL_STATUS			0x2308
> +#define
> BUTTRESS_REG_CSE_PS_UCX_START_ADDR			0x230c
> +
> +#define
> BUTTRESS_REG_CAMERA_MASK				0x2310
> +#define
> BUTTRESS_REG_FW_CTL					0x2314
> +#define
> BUTTRESS_REG_SECURITY_CTL				0x2318
> +#define
> BUTTRESS_REG_FUNCTIONAL_FW_SETUP			0x231c
> +#define
> BUTTRESS_REG_FW_BASE					0x2320
> +#define
> BUTTRESS_REG_FW_BASE_LIMIT				0x2324
> +#define
> BUTTRESS_REG_FW_SCRATCH_BASE				0x2328
> +#define
> BUTTRESS_REG_FW_SCRATCH_LIMIT				0x232c
> +#define
> BUTTRESS_REG_CSE_ACTION					0x2330
> +
> +/* configured by SW */
> +#define
> BUTTRESS_REG_FW_RESET_CTL				0x2334
> +#define
> BUTTRESS_REG_FW_SOURCE_SIZE				0x2338
> +#define
> BUTTRESS_REG_FW_SOURCE_BASE				0x233c
> +
> +#define
> BUTTRESS_REG_IPU_SEC_CP_LSB				0x2400
> +#define
> BUTTRESS_REG_IPU_SEC_CP_MSB				0x2404
> +#define
> BUTTRESS_REG_IPU_SEC_WAC_LSB				0x2408
> +#define
> BUTTRESS_REG_IPU_SEC_WAC_MSB				0x240c
> +#define
> BUTTRESS_REG_IPU_SEC_RAC_LSB				0x2410
> +#define
> BUTTRESS_REG_IPU_SEC_RAC_MSB				0x2414
> +#define
> BUTTRESS_REG_IPU_DRV_CP_LSB				0x2418
> +#define
> BUTTRESS_REG_IPU_DRV_CP_MSB				0x241c
> +#define
> BUTTRESS_REG_IPU_DRV_WAC_LSB				0x2420
> +#define
> BUTTRESS_REG_IPU_DRV_WAC_MSB				0x2424
> +#define
> BUTTRESS_REG_IPU_DRV_RAC_LSB				0x2428
> +#define
> BUTTRESS_REG_IPU_DRV_RAC_MSB				0x242c
> +#define
> BUTTRESS_REG_IPU_FW_CP_LSB				0x2430
> +#define
> BUTTRESS_REG_IPU_FW_CP_MSB				0x2434
> +#define
> BUTTRESS_REG_IPU_FW_WAC_LSB				0x2438
> +#define
> BUTTRESS_REG_IPU_FW_WAC_MSB				0x243c
> +#define
> BUTTRESS_REG_IPU_FW_RAC_LSB				0x2440
> +#define
> BUTTRESS_REG_IPU_FW_RAC_MSB				0x2444
> +#define
> BUTTRESS_REG_IPU_BIOS_SEC_CP_LSB			0x2448
> +#define
> BUTTRESS_REG_IPU_BIOS_SEC_CP_MSB			0x244c
> +#define
> BUTTRESS_REG_IPU_BIOS_SEC_WAC_LSB			0x2450
> +#define
> BUTTRESS_REG_IPU_BIOS_SEC_WAC_MSB			0x2454
> +#define
> BUTTRESS_REG_IPU_BIOS_SEC_RAC_LSB			0x2458
> +#define
> BUTTRESS_REG_IPU_BIOS_SEC_RAC_MSB			0x245c
> +#define
> BUTTRESS_REG_IPU_DFD_CP_LSB				0x2460
> +#define
> BUTTRESS_REG_IPU_DFD_CP_MSB				0x2464
> +#define
> BUTTRESS_REG_IPU_DFD_WAC_LSB				0x2468
> +#define
> BUTTRESS_REG_IPU_DFD_WAC_MSB				0x246c
> +#define
> BUTTRESS_REG_IPU_DFD_RAC_LSB				0x2470
> +#define
> BUTTRESS_REG_IPU_DFD_RAC_MSB				0x2474
> +#define
> BUTTRESS_REG_CSE2IUDB0					0x2500
> +#define
> BUTTRESS_REG_CSE2IUDATA0				0x2504
> +#define
> BUTTRESS_REG_CSE2IUCSR					0x2508
> +#define
> BUTTRESS_REG_IU2CSEDB0					0x250c
> +#define
> BUTTRESS_REG_IU2CSEDATA0				0x2510
> +#define
> BUTTRESS_REG_IU2CSECSR					0x2514
> +#define
> BUTTRESS_REG_CSE2IUDB0_CR_SHADOW			0x2520
> +#define
> BUTTRESS_REG_CSE2IUDATA0_CR_SHADOW			0x2524
> +#define
> BUTTRESS_REG_CSE2IUCSR_CR_SHADOW			0x2528
> +#define
> BUTTRESS_REG_IU2CSEDB0_CR_SHADOW			0x252c
> +#define
> BUTTRESS_REG_DVFS_FSM_SURVIVABILITY			0x2900
> +#define
> BUTTRESS_REG_FLOWS_FSM_SURVIVABILITY			0x2904
> +#define
> BUTTRESS_REG_FABRICS_FSM_SURVIVABILITY			0x2908
> +#define
> BUTTRESS_REG_PS_SUB1_PM_FSM_SURVIVABILITY		0x290c
> +#define
> BUTTRESS_REG_PS_SUB0_PM_FSM_SURVIVABILITY		0x2910
> +#define
> BUTTRESS_REG_PS_PM_FSM_SURVIVABILITY			0x2914
> +#define
> BUTTRESS_REG_IS_PM_FSM_SURVIVABILITY			0x2918
> +#define
> BUTTRESS_REG_FLR_RST_FSM_SURVIVABILITY			0x291c
> +#define
> BUTTRESS_REG_FW_RST_FSM_SURVIVABILITY			0x2920
> +#define
> BUTTRESS_REG_RESETPREP_FSM_SURVIVABILITY		0x2924
> +#define
> BUTTRESS_REG_POWER_FSM_DOMAIN_STATUS			0x3000
> +#define
> BUTTRESS_REG_IDLEREQ_STATUS1				0x3004
> +#define
> BUTTRESS_REG_POWER_FSM_STATUS_IS_PS			0x3008
> +#define
> BUTTRESS_REG_POWER_ACK_B_STATUS				0x300c
> +#define
> BUTTRESS_REG_DOMAIN_RETENTION_CTL			0x3010
> +#define
> BUTTRESS_REG_CG_CTRL_BITS				0x3014
> +#define
> BUTTRESS_REG_IS_IFC_STATUS0				0x3018
> +#define
> BUTTRESS_REG_IS_IFC_STATUS1				0x301c
> +#define
> BUTTRESS_REG_PS_IFC_STATUS0				0x3020
> +#define
> BUTTRESS_REG_PS_IFC_STATUS1				0x3024
> +#define
> BUTTRESS_REG_BTRS_IFC_STATUS0				0x3028
> +#define
> BUTTRESS_REG_BTRS_IFC_STATUS1				0x302c
> +#define
> BUTTRESS_REG_IPU_SKU					0x3030
> +#define
> BUTTRESS_REG_PS_IDLEACK					0x3034
> +#define
> BUTTRESS_REG_IS_IDLEACK					0x3038
> +#define
> BUTTRESS_REG_SPARE_REGS_0				0x303c
> +#define
> BUTTRESS_REG_SPARE_REGS_1				0x3040
> +#define
> BUTTRESS_REG_SPARE_REGS_2				0x3044
> +#define
> BUTTRESS_REG_SPARE_REGS_3				0x3048
> +#define
> BUTTRESS_REG_IUNIT_ACV					0x304c
> +#define
> BUTTRESS_REG_CHICKEN_BITS				0x3050
> +#define
> BUTTRESS_REG_SBENDPOINT_CFG				0x3054
> +#define
> BUTTRESS_REG_ECC_ERR_LOG				0x3058
> +#define
> BUTTRESS_REG_POWER_FSM_STATUS				0x3070
> +#define
> BUTTRESS_REG_RESET_FSM_STATUS				0x3074
> +#define
> BUTTRESS_REG_IDLE_STATUS				0x3078
> +#define
> BUTTRESS_REG_IDLEACK_STATUS				0x307c
> +#define
> BUTTRESS_REG_IPU_DEBUG					0x3080
> +
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS0				0x4000
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS1				0x4004
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS2				0x4008
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS3				0x400c
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS4				0x4010
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS5				0x4014
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS6				0x4018
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS7				0x401c
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS8				0x4020
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS9				0x4024
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS10				0x4028
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS11				0x402c
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS12				0x4030
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS13				0x4034
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS14				0x4038
> +#define
> BUTTRESS_REG_FW_BOOT_PARAMS15				0x403c
> +
> +#define BUTTRESS_FW_BOOT_PARAMS_ENTRY(i) \
> +	(BUTTRESS_REG_FW_BOOT_PARAMS0 + ((i) * 4U))
> +#define BUTTRESS_REG_FW_GP(i)				(0x4040 +
> 0x4 * (i))
> +#define BUTTRESS_REG_FPGA_SUPPORT(i)			(0x40c0 +
> 0x4 * (i))
> +
> +#define
> BUTTRESS_REG_FW_GP8					0x4060
> +#define
> BUTTRESS_REG_FW_GP24					0x40a0
> +
> +#define
> BUTTRESS_REG_GPIO_0_PADCFG_ADDR_CR			0x4100
> +#define
> BUTTRESS_REG_GPIO_1_PADCFG_ADDR_CR			0x4104
> +#define
> BUTTRESS_REG_GPIO_2_PADCFG_ADDR_CR			0x4108
> +#define
> BUTTRESS_REG_GPIO_3_PADCFG_ADDR_CR			0x410c
> +#define
> BUTTRESS_REG_GPIO_4_PADCFG_ADDR_CR			0x4110
> +#define
> BUTTRESS_REG_GPIO_5_PADCFG_ADDR_CR			0x4114
> +#define
> BUTTRESS_REG_GPIO_6_PADCFG_ADDR_CR			0x4118
> +#define
> BUTTRESS_REG_GPIO_7_PADCFG_ADDR_CR			0x411c
> +#define
> BUTTRESS_REG_GPIO_ENABLE				0x4140
> +#define
> BUTTRESS_REG_GPIO_VALUE_CR				0x4144
> +
> +#define
> BUTTRESS_REG_IS_MEM_CORRECTABLE_ERROR_STATUS		0x5000
> +#define
> BUTTRESS_REG_IS_MEM_FATAL_ERROR_STATUS			0x5004
> +#define
> BUTTRESS_REG_IS_MEM_NON_FATAL_ERROR_STATUS		0x5008
> +#define
> BUTTRESS_REG_IS_MEM_CHECK_PASSED			0x500c
> +#define
> BUTTRESS_REG_IS_MEM_ERROR_INJECT			0x5010
> +#define
> BUTTRESS_REG_IS_MEM_ERROR_CLEAR				0x5014
> +#define
> BUTTRESS_REG_PS_MEM_CORRECTABLE_ERROR_STATUS		0x5040
> +#define
> BUTTRESS_REG_PS_MEM_FATAL_ERROR_STATUS			0x5044
> +#define
> BUTTRESS_REG_PS_MEM_NON_FATAL_ERROR_STATUS		0x5048
> +#define
> BUTTRESS_REG_PS_MEM_CHECK_PASSED			0x504c
> +#define
> BUTTRESS_REG_PS_MEM_ERROR_INJECT			0x5050
> +#define
> BUTTRESS_REG_PS_MEM_ERROR_CLEAR				0x5054
> +
> +#define BUTTRESS_REG_IS_AB_REGION_MIN_ADDRESS(i)	(0x6000 +
> 0x8 * (i))
> +#define BUTTRESS_REG_IS_AB_REGION_MAX_ADDRESS(i)	(0x6004 +
> 0x8 * (i))
> +#define
> BUTTRESS_REG_IS_AB_VIOLATION_LOG0			0x6080
> +#define
> BUTTRESS_REG_IS_AB_VIOLATION_LOG1			0x6084
> +#define BUTTRESS_REG_PS_AB_REGION_MIN_ADDRESS(i)	(0x6100 +
> 0x8 * (i))
> +#define BUTTRESS_REG_PS_AB_REGION_MAX_ADDRESS0		(0x6104 +
> 0x8 * (i))
> +#define
> BUTTRESS_REG_PS_AB_VIOLATION_LOG0			0x6180
> +#define
> BUTTRESS_REG_PS_AB_VIOLATION_LOG1			0x6184
> +#define
> BUTTRESS_REG_PS_DEBUG_AB_VIOLATION_LOG0			0x6200
> +#define
> BUTTRESS_REG_PS_DEBUG_AB_VIOLATION_LOG1			0x6204
> +#define
> BUTTRESS_REG_IS_DEBUG_AB_VIOLATION_LOG0			0x6208
> +#define
> BUTTRESS_REG_IS_DEBUG_AB_VIOLATION_LOG1			0x620c
> +#define
> BUTTRESS_REG_IB_DVP_AB_VIOLATION_LOG0			0x6210
> +#define
> BUTTRESS_REG_IB_DVP_AB_VIOLATION_LOG1			0x6214
> +#define
> BUTTRESS_REG_IB_ATB2DTF_AB_VIOLATION_LOG0		0x6218
> +#define
> BUTTRESS_REG_IB_ATB2DTF_AB_VIOLATION_LOG1		0x621c
> +#define
> BUTTRESS_REG_AB_ENABLE					0x6220
> +#define
> BUTTRESS_REG_AB_DEFAULT_ACCESS				0x6230
> +
> +/* Indicates CSE has received an IPU driver IPC transaction */
> +#define BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE		BIT(0)
> +/* Indicates an IPC transaction from CSE has arrived */
> +#define BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING		BIT(1)
> +/* Indicates a CSR update from CSE has arrived */
> +#define BUTTRESS_IRQ_CSE_CSR_SET			BIT(2)
> +/* Indicates an interrupt set by Punit (not in use at this time) */
> +#define BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ			BIT(3)
> +/* Indicates an SAI violation was detected on access to IB registers
> */
> +#define BUTTRESS_IRQ_SAI_VIOLATION			BIT(4)
> +/* Indicates a transaction to IS was not able to pass the access
> blocker */
> +#define BUTTRESS_IRQ_IS_AB_VIOLATION			BIT(5)
> +/* Indicates a transaction to PS was not able to pass the access
> blocker */
> +#define BUTTRESS_IRQ_PS_AB_VIOLATION			BIT(6)
> +/* Indicates an error response was detected by the IB config NoC */
> +#define
> BUTTRESS_IRQ_IB_CFG_NOC_ERR_IRQ			BIT(7)
> +/* Indicates an error response was detected by the IB data NoC */
> +#define BUTTRESS_IRQ_IB_DATA_NOC_ERR_IRQ		BIT(8)
> +/* Transaction to DVP regs was not able to pass the access blocker
> */
> +#define BUTTRESS_IRQ_IB_DVP_AB_VIOLATION		BIT(9)
> +/* Transaction to ATB2DTF regs was not able to pass the access
> blocker */
> +#define BUTTRESS_IRQ_ATB2DTF_AB_VIOLATION		BIT(10)
> +/* Transaction to IS debug regs was not able to pass the access
> blocker */
> +#define BUTTRESS_IRQ_IS_DEBUG_AB_VIOLATION		BIT(11)
> +/* Transaction to PS debug regs was not able to pass the access
> blocker */
> +#define BUTTRESS_IRQ_PS_DEBUG_AB_VIOLATION		BIT(12)
> +/* Indicates timeout occurred waiting for a response from a target
> */
> +#define BUTTRESS_IRQ_IB_CFG_NOC_TIMEOUT_IRQ		BIT(13)
> +/* Set when any correctable ECC error input wire to buttress is set
> */
> +#define BUTTRESS_IRQ_ECC_CORRECTABLE			BIT(14)
> +/* Any noncorrectable-nonfatal ECC error input wire to buttress is
> set */
> +#define BUTTRESS_IRQ_ECC_NONCORRECTABLE_NONFATAL	BIT(15)
> +/* Set when any noncorrectable-fatal ECC error input wire to
> buttress is set */
> +#define BUTTRESS_IRQ_ECC_NONCORRECTABLE_FATAL		BIT(16)
> +/* Set when timeout occurred waiting for a response from a target */
> +#define BUTTRESS_IRQ_IS_CFG_NOC_TIMEOUT_IRQ		BIT(17)
> +#define BUTTRESS_IRQ_PS_CFG_NOC_TIMEOUT_IRQ		BIT(18)
> +#define BUTTRESS_IRQ_LB_CFG_NOC_TIMEOUT_IRQ		BIT(19)
> +/* IS FW double exception event */
> +#define
> BUTTRESS_IRQ_IS_UC_PFATAL_ERROR			BIT(26)
> +/* PS FW double exception event */
> +#define
> BUTTRESS_IRQ_PS_UC_PFATAL_ERROR			BIT(27)
> +/* IS FW watchdog event */
> +#define BUTTRESS_IRQ_IS_WATCHDOG			BIT(28)
> +/* PS FW watchdog event */
> +#define BUTTRESS_IRQ_PS_WATCHDOG			BIT(29)
> +/* IS IRC irq out */
> +#define BUTTRESS_IRQ_IS_IRQ				BIT(30)
> +/* PS IRC irq out */
> +#define BUTTRESS_IRQ_PS_IRQ				BIT(31)
> +
> +/* buttress irq */
> +enum {
> +	BUTTRESS_PWR_STATUS_HH_STATE_IDLE,
> +	BUTTRESS_PWR_STATUS_HH_STATE_IN_PRGS,
> +	BUTTRESS_PWR_STATUS_HH_STATE_DONE,
> +	BUTTRESS_PWR_STATUS_HH_STATE_ERR,
> +};
> +
> +#define BUTTRESS_TSC_CMD_START_TSC_SYNC		BIT(0)
> +#define BUTTRESS_PWR_STATUS_HH_STATUS_SHIFT	11
> +#define BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3 << 11)
> +#define BUTTRESS_TSW_WA_SOFT_RESET		BIT(8)
> +/* new for PTL */
> +#define BUTTRESS_SEL_PB_TIMESTAMP		BIT(9)
> +#define BUTTRESS_IRQS		(BUTTRESS_IRQ_IS_IRQ | \
> +				 BUTTRESS_IRQ_PS_IRQ | \
> +			=09
> BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING | \
> +				 BUTTRESS_IRQ_CSE_CSR_SET | \
> +				 BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE |
> \
> +				 BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ)
> +
> +/* Iunit to CSE regs */
> +#define BUTTRESS_IU2CSEDB0_BUSY		BIT(31)
> +#define BUTTRESS_IU2CSEDB0_SHORT_FORMAT_SHIFT	27
> +#define BUTTRESS_IU2CSEDB0_CLIENT_ID_SHIFT	10
> +#define BUTTRESS_IU2CSEDB0_IPC_CLIENT_ID_VAL	2
> +
> +#define BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD		1
> +#define BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN		2
> +#define BUTTRESS_IU2CSEDATA0_IPC_AUTH_REPLACE		3
> +#define BUTTRESS_IU2CSEDATA0_IPC_UPDATE_SECURE_TOUCH	16
> +
> +#define
> BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE			BIT(0)
> +#define
> BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE			BIT(1)
> +#define
> BUTTRESS_CSE2IUDATA0_IPC_AUTH_REPLACE_DONE		BIT(2)
> +#define
> BUTTRESS_CSE2IUDATA0_IPC_UPDATE_SECURE_TOUCH_DONE	BIT(4)
> +
> +#define
> BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1		BIT(0)
> +#define
> BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2		BIT(1)
> +#define
> BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE	BIT(
> 2)
> +#define
> BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ		BIT(3)
> +#define
> BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID			BIT(4)
> +#define
> BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ		BIT(5)
> +
> +/* 0x20 =3D=3D NACK, 0xf =3D=3D unknown command */
> +#define BUTTRESS_CSE2IUDATA0_IPC_NACK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xf2=
0
> +#define BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK 0xffff
> +
> +/* IS/PS freq control */
> +#define BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xff
> +#define BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xff
> +#define BUTTRESS_IS_FREQ_CTL_CDYN_MASK	0xff
> +#define BUTTRESS_PS_FREQ_CTL_CDYN_MASK	0xff
> +
> +#define IPU7_IS_FREQ_MAX		450
> +#define IPU7_IS_FREQ_MIN		50
> +#define IPU7_PS_FREQ_MAX		750
> +#define BUTTRESS_PS_FREQ_RATIO_STEP		25U
> +/* valid for IPU8 */
> +#define BUTTRESS_IS_FREQ_RATIO_STEP		25U
> +
> +/* IS: 400mhz, PS: 500mhz */
> +#define IPU7_IS_FREQ_CTL_DEFAULT_RATIO		0x1b
> +#define IPU7_PS_FREQ_CTL_DEFAULT_RATIO		0x14
> +/* IS: 400mhz, PS: 400mhz */
> +#define IPU8_IS_FREQ_CTL_DEFAULT_RATIO		0x10
> +#define IPU8_PS_FREQ_CTL_DEFAULT_RATIO		0x10
> +
> +#define IPU_FREQ_CTL_CDYN		0x80
> +#define IPU_FREQ_CTL_RATIO_SHIFT	0x0
> +#define IPU_FREQ_CTL_CDYN_SHIFT		0x8
> +
> +/* buttree power status */
> +#define IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT	0
> +#define IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK	\
> +	(0x3 << IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT)
> +
> +#define IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT	4
> +#define IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK	\
> +	(0x3 << IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT)
> +
> +#define IPU_BUTTRESS_PWR_STATE_DN_DONE		0x0
> +#define IPU_BUTTRESS_PWR_STATE_UP_PROCESS	0x1
> +#define IPU_BUTTRESS_PWR_STATE_DN_PROCESS	0x2
> +#define IPU_BUTTRESS_PWR_STATE_UP_DONE		0x3
> +
> +#define BUTTRESS_PWR_STATE_IS_PWR_SHIFT	3
> +#define BUTTRESS_PWR_STATE_IS_PWR_MASK	(0x3 << 3)
> +
> +#define BUTTRESS_PWR_STATE_PS_PWR_SHIFT	6
> +#define BUTTRESS_PWR_STATE_PS_PWR_MASK	(0x3 << 6)
> +
> +#define PS_FSM_CG		BIT(3)
> +
> +#define BUTTRESS_OVERRIDE_IS_CLK	BIT(1)
> +#define BUTTRESS_OVERRIDE_PS_CLK	BIT(2)
> +/* ps_pll only valid for ipu8 */
> +#define BUTTRESS_OWN_ACK_PS_PLL		BIT(8)
> +#define BUTTRESS_OWN_ACK_IS_CLK		BIT(9)
> +#define BUTTRESS_OWN_ACK_PS_CLK		BIT(10)
> +
> +/* FW reset ctrl */
> +#define BUTTRESS_FW_RESET_CTL_START	BIT(0)
> +#define BUTTRESS_FW_RESET_CTL_DONE	BIT(1)
> +
> +/* security */
> +#define BUTTRESS_SECURITY_CTL_FW_SECURE_MODE		BIT(16)
> +#define BUTTRESS_SECURITY_CTL_FW_SETUP_MASK		GENMASK(4,
> 0)
> +
> +#define BUTTRESS_SECURITY_CTL_FW_SETUP_DONE		BIT(0)
> +#define
> BUTTRESS_SECURITY_CTL_AUTH_DONE			BIT(1)
> +#define BUTTRESS_SECURITY_CTL_AUTH_FAILED		BIT(3)
> +
> +/* D2D */
> +#define BUTTRESS_D2D_PWR_EN			BIT(0)
> +#define BUTTRESS_D2D_PWR_ACK			BIT(4)
> +
> +/* NDE */
> +#define NDE_VAL_MASK				GENMASK(9, 0)
> +#define NDE_SCALE_MASK				GENMASK(12, 10)
> +#define NDE_VALID_MASK				BIT(13)
> +#define NDE_RESVEC_MASK				GENMASK(19,
> 16)
> +#define NDE_IN_VBLANK_DIS_MASK			BIT(31)
> +
> +#define BUTTRESS_NDE_VAL_ACTIVE			48
> +#define BUTTRESS_NDE_SCALE_ACTIVE		2
> +#define BUTTRESS_NDE_VALID_ACTIVE		1
> +
> +#define BUTTRESS_NDE_VAL_DEFAULT		1023
> +#define BUTTRESS_NDE_SCALE_DEFAULT		2
> +#define BUTTRESS_NDE_VALID_DEFAULT		0
> +
> +/* IS and PS UCX control */
> +#define UCX_CTL_RESET			BIT(0)
> +#define UCX_CTL_RUN			BIT(1)
> +#define UCX_CTL_WAKEUP			BIT(2)
> +#define UCX_CTL_SPARE			GENMASK(7, 3)
> +#define UCX_STS_PWR			GENMASK(17, 16)
> +#define UCX_STS_SLEEPING		BIT(18)
> +
> +/* offset from PHY base */
> +#define PHY_CSI_CFG			0xc0
> +#define PHY_CSI_RCOMP_CONTROL		0xc8
> +#define PHY_CSI_BSCAN_EXCLUDE		0xd8
> +
> +#define PHY_CPHY_DLL_OVRD(x)		(0x100 + 0x100 * (x))
> +#define PHY_DPHY_DLL_OVRD(x)		(0x14c + 0x100 * (x))
> +#define PHY_CPHY_RX_CONTROL1(x)		(0x110 + 0x100 *
> (x))
> +#define PHY_CPHY_RX_CONTROL2(x)		(0x114 + 0x100 *
> (x))
> +#define PHY_DPHY_CFG(x)			(0x148 + 0x100 *
> (x))
> +#define PHY_BB_AFE_CONFIG(x)		(0x174 + 0x100 * (x))
> +
> +/* PB registers */
> +#define INTERRUPT_STATUS			0x0
> +#define BTRS_LOCAL_INTERRUPT_MASK		0x4
> +#define GLOBAL_INTERRUPT_MASK			0x8
> +#define HM_ATS					0xc
> +#define ATS_ERROR_LOG1				0x10
> +#define ATS_ERROR_LOG2				0x14
> +#define ATS_ERROR_CLEAR				0x18
> +#define CFI_0_ERROR_LOG				0x1c
> +#define CFI_0_ERROR_CLEAR			0x20
> +#define HASH_CONFIG				0x2c
> +#define TLBID_HASH_ENABLE_31_0			0x30
> +#define TLBID_HASH_ENABLE_63_32			0x34
> +#define TLBID_HASH_ENABLE_95_64			0x38
> +#define TLBID_HASH_ENABLE_127_96		0x3c
> +#define CFI_1_ERROR_LOGGING			0x40
> +#define CFI_1_ERROR_CLEAR			0x44
> +#define IMR_ERROR_LOGGING_LOW			0x48
> +#define IMR_ERROR_LOGGING_HIGH			0x4c
> +#define IMR_ERROR_CLEAR				0x50
> +#define PORT_ARBITRATION_WEIGHTS		0x54
> +#define IMR_ERROR_LOGGING_CFI_1_LOW		0x58
> +#define IMR_ERROR_LOGGING_CFI_1_HIGH		0x5c
> +#define IMR_ERROR_CLEAR_CFI_1			0x60
> +#define BAR2_MISC_CONFIG			0x64
> +#define RSP_ID_CONFIG_AXI2CFI_0			0x68
> +#define RSP_ID_CONFIG_AXI2CFI_1			0x6c
> +#define PB_DRIVER_PCODE_MAILBOX_STATUS		0x70
> +#define PB_DRIVER_PCODE_MAILBOX_INTERFACE	0x74
> +#define PORT_ARBITRATION_WEIGHTS_ATS		0x78
> +
> +#endif /* IPU7_BUTTRESS_REGS_H */
> diff --git a/drivers/media/pci/intel/ipu7/ipu7-buttress.c
> b/drivers/media/pci/intel/ipu7/ipu7-buttress.c
> new file mode 100644
> index 000000000000..4b488f834b1a
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/ipu7-buttress.c
> @@ -0,0 +1,1187 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2013 - 2024 Intel Corporation
> + */
> +
> +#include <asm/cpu_device_id.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/firmware.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/math64.h>
> +#include <linux/mm.h>
> +#include <linux/mutex.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/scatterlist.h>
> +#include <linux/types.h>
> +
> +#include "ipu7.h"
> +#include "ipu7-bus.h"
> +#include "ipu7-buttress.h"
> +#include "ipu7-buttress-regs.h"
> +
> +#define BOOTLOADER_STATUS_OFFSET	BUTTRESS_REG_FW_BOOT_PARAMS7
> +
> +#define BOOTLOADER_MAGIC_KEY		0xb00710ad
> +
> +#define ENTRY	BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1
> +#define EXIT	BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2
> +#define
> QUERY	BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE
> +
> +#define BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX	10
> +
> +#define BUTTRESS_POWER_TIMEOUT_US		(200 *
> USEC_PER_MSEC)
> +
> +#define BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US	(5 * USEC_PER_SEC)
> +#define BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US	(10 * USEC_PER_SEC)
> +#define BUTTRESS_CSE_FWRESET_TIMEOUT_US		(100 *
> USEC_PER_MSEC)
> +
> +#define BUTTRESS_IPC_TX_TIMEOUT_MS		MSEC_PER_SEC
> +#define BUTTRESS_IPC_RX_TIMEOUT_MS		MSEC_PER_SEC
> +#define BUTTRESS_IPC_VALIDITY_TIMEOUT_US	(1 * USEC_PER_SEC)
> +#define BUTTRESS_TSC_SYNC_TIMEOUT_US		(5 * USEC_PER_MSEC)
> +
> +#define BUTTRESS_IPC_RESET_RETRY		2000
> +#define BUTTRESS_CSE_IPC_RESET_RETRY		4
> +#define BUTTRESS_IPC_CMD_SEND_RETRY		1
> +
> +static const u32 ipu7_adev_irq_mask[2] =3D {
> +	BUTTRESS_IRQ_IS_IRQ,
> +	BUTTRESS_IRQ_PS_IRQ
> +};
> +
> +int ipu_buttress_ipc_reset(struct ipu7_device *isp,
> +			=C2=A0=C2=A0 struct ipu_buttress_ipc *ipc)
> +{
> +	unsigned int retries =3D BUTTRESS_IPC_RESET_RETRY;
> +	struct ipu_buttress *b =3D &isp->buttress;
> +	struct device *dev =3D &isp->pdev->dev;
> +	u32 val =3D 0, csr_in_clr;
> +
> +	if (!isp->secure_mode) {
> +		dev_dbg(dev, "Skip IPC reset for non-secure
> mode\n");
> +		return 0;
> +	}
> +
> +	mutex_lock(&b->ipc_mutex);
> +
> +	/* Clear-by-1 CSR (all bits), corresponding internal states.
> */
> +	val =3D readl(isp->base + ipc->csr_in);
> +	writel(val, isp->base + ipc->csr_in);
> +
> +	/* Set peer CSR bit IPC_PEER_COMP_ACTIONS_RST_PHASE1 */
> +	writel(ENTRY, isp->base + ipc->csr_out);
> +	/*
> +	 * Clear-by-1 all CSR bits EXCEPT following
> +	 * bits:
> +	 * A. IPC_PEER_COMP_ACTIONS_RST_PHASE1.
> +	 * B. IPC_PEER_COMP_ACTIONS_RST_PHASE2.
> +	 * C. Possibly custom bits, depending on
> +	 * their role.
> +	 */
> +	csr_in_clr =3D
> BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ |
> +		BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID |
> +		BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ |
> QUERY;
> +
> +	do {
> +		usleep_range(400, 500);
> +		val =3D readl(isp->base + ipc->csr_in);
> +		switch (val) {
> +		case ENTRY | EXIT:
> +		case ENTRY | EXIT | QUERY:
> +			/*
> +			 * 1) Clear-by-1 CSR bits
> +			 * (IPC_PEER_COMP_ACTIONS_RST_PHASE1,
> +			 * IPC_PEER_COMP_ACTIONS_RST_PHASE2).
> +			 * 2) Set peer CSR bit
> +			 *
> IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE.
> +			 */
> +			writel(ENTRY | EXIT, isp->base + ipc-
> >csr_in);
> +			writel(QUERY, isp->base + ipc->csr_out);
> +			break;
> +		case ENTRY:
> +		case ENTRY | QUERY:
> +			/*
> +			 * 1) Clear-by-1 CSR bits
> +			 * (IPC_PEER_COMP_ACTIONS_RST_PHASE1,
> +			 *
> IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE).
> +			 * 2) Set peer CSR bit
> +			 * IPC_PEER_COMP_ACTIONS_RST_PHASE1.
> +			 */
> +			writel(ENTRY | QUERY, isp->base + ipc-
> >csr_in);
> +			writel(ENTRY, isp->base + ipc->csr_out);
> +			break;
> +		case EXIT:
> +		case EXIT | QUERY:
> +			/*
> +			 * Clear-by-1 CSR bit
> +			 * IPC_PEER_COMP_ACTIONS_RST_PHASE2.
> +			 * 1) Clear incoming doorbell.
> +			 * 2) Clear-by-1 all CSR bits EXCEPT
> following
> +			 * bits:
> +			 * A. IPC_PEER_COMP_ACTIONS_RST_PHASE1.
> +			 * B. IPC_PEER_COMP_ACTIONS_RST_PHASE2.
> +			 * C. Possibly custom bits, depending on
> +			 * their role.
> +			 * 3) Set peer CSR bit
> +			 * IPC_PEER_COMP_ACTIONS_RST_PHASE2.
> +			 */
> +			writel(EXIT, isp->base + ipc->csr_in);
> +			writel(0, isp->base + ipc->db0_in);
> +			writel(csr_in_clr, isp->base + ipc->csr_in);
> +			writel(EXIT, isp->base + ipc->csr_out);
> +
> +			/*
> +			 * Read csr_in again to make sure if
> RST_PHASE2 is done.
> +			 * If csr_in is QUERY, it should be handled
> again.
> +			 */
> +			usleep_range(200, 300);
> +			val =3D readl(isp->base + ipc->csr_in);
> +			if (val & QUERY) {
> +				dev_dbg(dev,
> +					"RST_PHASE2 retry csr_in =3D
> %x\n", val);
> +				break;
> +			}
> +			mutex_unlock(&b->ipc_mutex);
> +			return 0;
> +		case QUERY:
> +			/*
> +			 * 1) Clear-by-1 CSR bit
> +			 *
> IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE.
> +			 * 2) Set peer CSR bit
> +			 * IPC_PEER_COMP_ACTIONS_RST_PHASE1
> +			 */
> +			writel(QUERY, isp->base + ipc->csr_in);
> +			writel(ENTRY, isp->base + ipc->csr_out);
> +			break;
> +		default:
> +			dev_dbg_ratelimited(dev, "Unexpected CSR
> 0x%x\n", val);
> +			break;
> +		}
> +	} while (retries--);
> +
> +	mutex_unlock(&b->ipc_mutex);
> +	dev_err(dev, "Timed out while waiting for CSE\n");
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static void ipu_buttress_ipc_validity_close(struct ipu7_device *isp,
> +					=C2=A0=C2=A0=C2=A0 struct ipu_buttress_ipc
> *ipc)
> +{
> +	writel(BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isp->base + ipc->csr_out);
> +}
> +
> +static int
> +ipu_buttress_ipc_validity_open(struct ipu7_device *isp,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ipu_buttress_ipc *ipc)
> +{
> +	unsigned int mask =3D
> BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID;
> +	void __iomem *addr;
> +	int ret;
> +	u32 val;
> +
> +	writel(BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isp->base + ipc->csr_out);
> +
> +	addr =3D isp->base + ipc->csr_in;
> +	ret =3D readl_poll_timeout(addr, val, val & mask, 200,
> +				 BUTTRESS_IPC_VALIDITY_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(&isp->pdev->dev, "CSE validity timeout
> 0x%x\n", val);
> +		ipu_buttress_ipc_validity_close(isp, ipc);
> +	}
> +
> +	return ret;
> +}
> +
> +static void ipu_buttress_ipc_recv(struct ipu7_device *isp,
> +				=C2=A0 struct ipu_buttress_ipc *ipc, u32
> *ipc_msg)
> +{
> +	if (ipc_msg)
> +		*ipc_msg =3D readl(isp->base + ipc->data0_in);
> +	writel(0, isp->base + ipc->db0_in);
> +}
> +
> +static int ipu_buttress_ipc_send_bulk(struct ipu7_device *isp,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> ipu7_ipc_buttress_bulk_msg *msgs,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 size)
> +{
> +	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
> +	unsigned int i, retry =3D BUTTRESS_IPC_CMD_SEND_RETRY;
> +	struct ipu_buttress *b =3D &isp->buttress;
> +	struct ipu_buttress_ipc *ipc =3D &b->cse;
> +	struct device *dev =3D &isp->pdev->dev;
> +	int tout;
> +	u32 val;
> +	int ret;
> +
> +	mutex_lock(&b->ipc_mutex);
> +
> +	ret =3D ipu_buttress_ipc_validity_open(isp, ipc);
> +	if (ret) {
> +		dev_err(dev, "IPC validity open failed\n");
> +		goto out;
> +	}
> +
> +	tx_timeout_jiffies =3D
> msecs_to_jiffies(BUTTRESS_IPC_TX_TIMEOUT_MS);
> +	rx_timeout_jiffies =3D
> msecs_to_jiffies(BUTTRESS_IPC_RX_TIMEOUT_MS);
> +
> +	for (i =3D 0; i < size; i++) {
> +		reinit_completion(&ipc->send_complete);
> +		if (msgs[i].require_resp)
> +			reinit_completion(&ipc->recv_complete);
> +
> +		dev_dbg(dev, "bulk IPC command: 0x%x\n",
> msgs[i].cmd);
> +		writel(msgs[i].cmd, isp->base + ipc->data0_out);
> +		val =3D BUTTRESS_IU2CSEDB0_BUSY | msgs[i].cmd_size;
> +		writel(val, isp->base + ipc->db0_out);
> +
> +		tout =3D wait_for_completion_timeout(&ipc-
> >send_complete,
> +						=C2=A0=C2=A0
> tx_timeout_jiffies);
> +		if (!tout) {
> +			dev_err(dev, "send IPC response timeout\n");
> +			if (!retry--) {
> +				ret =3D -ETIMEDOUT;
> +				goto out;
> +			}
> +
> +			/* Try again if CSE is not responding on
> first try */
> +			writel(0, isp->base + ipc->db0_out);
> +			i--;
> +			continue;
> +		}
> +
> +		retry =3D BUTTRESS_IPC_CMD_SEND_RETRY;
> +
> +		if (!msgs[i].require_resp)
> +			continue;
> +
> +		tout =3D wait_for_completion_timeout(&ipc-
> >recv_complete,
> +						=C2=A0=C2=A0
> rx_timeout_jiffies);
> +		if (!tout) {
> +			dev_err(dev, "recv IPC response timeout\n");
> +			ret =3D -ETIMEDOUT;
> +			goto out;
> +		}
> +
> +		if (ipc->nack_mask &&
> +		=C2=A0=C2=A0=C2=A0 (ipc->recv_data & ipc->nack_mask) =3D=3D ipc->nack)
> {
> +			dev_err(dev, "IPC NACK for cmd 0x%x\n",
> msgs[i].cmd);
> +			ret =3D -EIO;
> +			goto out;
> +		}
> +
> +		if (ipc->recv_data !=3D msgs[i].expected_resp) {
> +			dev_err(dev,
> +				"expected resp: 0x%x, IPC response:
> 0x%x\n",
> +				msgs[i].expected_resp, ipc-
> >recv_data);
> +			ret =3D -EIO;
> +			goto out;
> +		}
> +	}
> +
> +	dev_dbg(dev, "bulk IPC commands done\n");
> +
> +out:
> +	ipu_buttress_ipc_validity_close(isp, ipc);
> +	mutex_unlock(&b->ipc_mutex);
> +
> +	return ret;
> +}
> +
> +static int ipu_buttress_ipc_send(struct ipu7_device *isp,
> +				 u32 ipc_msg, u32 size, bool
> require_resp,
> +				 u32 expected_resp)
> +{
> +	struct ipu7_ipc_buttress_bulk_msg msg =3D {
> +		.cmd =3D ipc_msg,
> +		.cmd_size =3D size,
> +		.require_resp =3D require_resp,
> +		.expected_resp =3D expected_resp,
> +	};
> +
> +	return ipu_buttress_ipc_send_bulk(isp, &msg, 1);
> +}
> +
> +static irqreturn_t ipu_buttress_call_isr(struct ipu7_bus_device
> *adev)
> +{
> +	irqreturn_t ret =3D IRQ_WAKE_THREAD;
> +
> +	if (!adev || !adev->auxdrv || !adev->auxdrv_data)
> +		return IRQ_NONE;
> +
> +	if (adev->auxdrv_data->isr)
> +		ret =3D adev->auxdrv_data->isr(adev);
> +
> +	if (ret =3D=3D IRQ_WAKE_THREAD && !adev->auxdrv_data-
> >isr_threaded)
> +		ret =3D IRQ_NONE;
> +
> +	return ret;
> +}
> +
> +irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
> +{
> +	struct ipu7_device *isp =3D isp_ptr;
> +	struct ipu7_bus_device *adev[] =3D { isp->isys, isp->psys };
> +	struct ipu_buttress *b =3D &isp->buttress;
> +	struct device *dev =3D &isp->pdev->dev;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	u32 pb_irq, pb_local_irq;
> +	u32 disable_irqs =3D 0;
> +	u32 irq_status;
> +	unsigned int i;
> +
> +	pm_runtime_get_noresume(dev);
> +
> +	pb_irq =3D readl(isp->pb_base + INTERRUPT_STATUS);
> +	writel(pb_irq, isp->pb_base + INTERRUPT_STATUS);
> +
> +	/* check btrs ATS, CFI and IMR errors, BIT(0) is unused for
> IPU */
> +	pb_local_irq =3D readl(isp->pb_base +
> BTRS_LOCAL_INTERRUPT_MASK);
> +	if (pb_local_irq & ~BIT(0)) {
> +		dev_warn(dev, "PB interrupt status 0x%x local
> 0x%x\n", pb_irq,
> +			 pb_local_irq);
> +		dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
> +			 readl(isp->pb_base + ATS_ERROR_LOG1),
> +			 readl(isp->pb_base + ATS_ERROR_LOG2),
> +			 readl(isp->pb_base + CFI_0_ERROR_LOG),
> +			 readl(isp->pb_base + CFI_1_ERROR_LOGGING),
> +			 readl(isp->pb_base +
> IMR_ERROR_LOGGING_LOW),
> +			 readl(isp->pb_base +
> IMR_ERROR_LOGGING_HIGH),
> +			 readl(isp->pb_base +
> IMR_ERROR_LOGGING_CFI_1_LOW),
> +			 readl(isp->pb_base +
> IMR_ERROR_LOGGING_CFI_1_HIGH));
> +	}
> +
> +	irq_status =3D readl(isp->base + BUTTRESS_REG_IRQ_STATUS);
> +	if (!irq_status) {
> +		pm_runtime_put_noidle(dev);
> +		return IRQ_NONE;
> +	}
> +
> +	do {
> +		writel(irq_status, isp->base +
> BUTTRESS_REG_IRQ_CLEAR);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(ipu7_adev_irq_mask); i++)
> {
> +			irqreturn_t r =3D
> ipu_buttress_call_isr(adev[i]);
> +
> +			if (!(irq_status & ipu7_adev_irq_mask[i]))
> +				continue;
> +
> +			if (r =3D=3D IRQ_WAKE_THREAD) {
> +				ret =3D IRQ_WAKE_THREAD;
> +				disable_irqs |=3D
> ipu7_adev_irq_mask[i];
> +			} else if (ret =3D=3D IRQ_NONE && r =3D=3D
> IRQ_HANDLED) {
> +				ret =3D IRQ_HANDLED;
> +			}
> +		}
> +
> +		if (irq_status & (BUTTRESS_IRQS |
> BUTTRESS_IRQ_SAI_VIOLATION) &&
> +		=C2=A0=C2=A0=C2=A0 ret =3D=3D IRQ_NONE)
> +			ret =3D IRQ_HANDLED;
> +
> +		if (irq_status &
> BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING) {
> +			dev_dbg(dev,
> "BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING\n");
> +			ipu_buttress_ipc_recv(isp, &b->cse, &b-
> >cse.recv_data);
> +			complete(&b->cse.recv_complete);
> +		}
> +
> +		if (irq_status & BUTTRESS_IRQ_CSE_CSR_SET)
> +			dev_dbg(dev, "BUTTRESS_IRQ_CSE_CSR_SET\n");
> +
> +		if (irq_status & BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE)
> {
> +			dev_dbg(dev,
> "BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE\n");
> +			complete(&b->cse.send_complete);
> +		}
> +
> +		if (irq_status & BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ)
> +			dev_dbg(dev,
> "BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ\n");
> +
> +		if (irq_status & BUTTRESS_IRQ_SAI_VIOLATION &&
> +		=C2=A0=C2=A0=C2=A0 ipu_buttress_get_secure_mode(isp))
> +			dev_err(dev,
> "BUTTRESS_IRQ_SAI_VIOLATION\n");
> +
> +		irq_status =3D readl(isp->base +
> BUTTRESS_REG_IRQ_STATUS);
> +	} while (irq_status);
> +
> +	if (disable_irqs)
> +		writel(BUTTRESS_IRQS & ~disable_irqs,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isp->base + BUTTRESS_REG_IRQ_ENAB=
LE);
> +
> +	pm_runtime_put(dev);
> +
> +	return ret;
> +}
> +
> +irqreturn_t ipu_buttress_isr_threaded(int irq, void *isp_ptr)
> +{
> +	struct ipu7_device *isp =3D isp_ptr;
> +	struct ipu7_bus_device *adev[] =3D { isp->isys, isp->psys };
> +	const struct ipu7_auxdrv_data *drv_data =3D NULL;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ipu7_adev_irq_mask) && adev[i];
> i++) {
> +		drv_data =3D adev[i]->auxdrv_data;
> +		if (!drv_data)
> +			continue;
> +
> +		if (drv_data->wake_isr_thread &&
> +		=C2=A0=C2=A0=C2=A0 drv_data->isr_threaded(adev[i]) =3D=3D IRQ_HANDLED)
> +			ret =3D IRQ_HANDLED;
> +	}
> +
> +	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_IRQ_ENABLE);
> +
> +	return ret;
> +}
> +
> +static int isys_d2d_power(struct device *dev, bool on)
> +{
> +	struct ipu7_device *isp =3D to_ipu7_bus_device(dev)->isp;
> +	int ret =3D 0;
> +	u32 val;
> +
> +	dev_dbg(dev, "power %s isys d2d.\n", on ? "UP" : "DOWN");
> +	val =3D readl(isp->base + BUTTRESS_REG_D2D_CTL);
> +	if (!(val & BUTTRESS_D2D_PWR_ACK) ^ on) {
> +		dev_info(dev, "d2d already in %s state.\n",
> +			 on ? "UP" : "DOWN");
> +		return 0;
> +	}
> +
> +	val =3D on ? val | BUTTRESS_D2D_PWR_EN : val &
> (~BUTTRESS_D2D_PWR_EN);
> +	writel(val, isp->base + BUTTRESS_REG_D2D_CTL);
> +	ret =3D readl_poll_timeout(isp->base + BUTTRESS_REG_D2D_CTL,
> +				 val, (!(val & BUTTRESS_D2D_PWR_ACK)
> ^ on),
> +				 100, BUTTRESS_POWER_TIMEOUT_US);
> +	if (ret)
> +		dev_err(dev, "power %s d2d timeout. status: 0x%x\n",
> +			on ? "UP" : "DOWN", val);
> +
> +	return ret;
> +}
> +
> +static void isys_nde_control(struct device *dev, bool on)
> +{
> +	struct ipu7_device *isp =3D to_ipu7_bus_device(dev)->isp;
> +	u32 val, value, scale, valid, resvec;
> +	u32 nde_reg;
> +
> +	if (on) {
> +		value =3D BUTTRESS_NDE_VAL_ACTIVE;
> +		scale =3D BUTTRESS_NDE_SCALE_ACTIVE;
> +		valid =3D BUTTRESS_NDE_VALID_ACTIVE;
> +	} else {
> +		value =3D BUTTRESS_NDE_VAL_DEFAULT;
> +		scale =3D BUTTRESS_NDE_SCALE_DEFAULT;
> +		valid =3D BUTTRESS_NDE_VALID_DEFAULT;
> +	}
> +
> +	/* only set the fabrics resource ownership for ipu8 */
> +	nde_reg =3D is_ipu8(isp->hw_ver) ?
> IPU8_BUTTRESS_REG_NDE_CONTROL :
> +		IPU7_BUTTRESS_REG_NDE_CONTROL;
> +	resvec =3D is_ipu8(isp->hw_ver) ? 0x2 : 0xe;
> +	val =3D FIELD_PREP(NDE_VAL_MASK, value) |
> +		FIELD_PREP(NDE_SCALE_MASK, scale) |
> +		FIELD_PREP(NDE_VALID_MASK, valid) |
> +		FIELD_PREP(NDE_RESVEC_MASK, resvec);
> +
> +	writel(val, isp->base + nde_reg);
> +}
> +
> +static int ipu7_buttress_powerup(struct device *dev,
> +				 const struct ipu_buttress_ctrl
> *ctrl)
> +{
> +	struct ipu7_device *isp =3D to_ipu7_bus_device(dev)->isp;
> +	u32 val, exp_sts;
> +	int ret =3D 0;
> +
> +	if (!ctrl)
> +		return 0;
> +
> +	mutex_lock(&isp->buttress.power_mutex);
> +
> +	exp_sts =3D ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
> +	if (ctrl->subsys_id =3D=3D IPU_IS) {
> +		ret =3D isys_d2d_power(dev, true);
> +		if (ret)
> +			goto out_power;
> +		isys_nde_control(dev, true);
> +	}
> +
> +	/* request clock resource ownership */
> +	val =3D readl(isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
> +	val |=3D ctrl->ovrd_clk;
> +	writel(val, isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_SLEEP_LEVEL_STS,
> +				 val, (val & ctrl->own_clk_ack),
> +				 100, BUTTRESS_POWER_TIMEOUT_US);
> +	if (ret)
> +		dev_warn(dev, "request clk ownership timeout. status
> 0x%x\n",
> +			 val);
> +
> +	val =3D ctrl->ratio << ctrl->ratio_shift | ctrl->cdyn << ctrl-
> >cdyn_shift;
> +
> +	dev_dbg(dev, "set 0x%x to %s_WORKPOINT_REQ.\n", val,
> +		ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS");
> +	writel(val, isp->base + ctrl->freq_ctl);
> +
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_PWR_STATUS,
> +				 val, ((val & ctrl->pwr_sts_mask) =3D=3D
> exp_sts),
> +				 100, BUTTRESS_POWER_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "%s power up timeout with status:
> 0x%x\n",
> +			ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS",
> val);
> +		goto out_power;
> +	}
> +
> +	dev_dbg(dev, "%s power up successfully. status: 0x%x\n",
> +		ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS", val);
> +
> +	/* release clock resource ownership */
> +	val =3D readl(isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
> +	val &=3D ~ctrl->ovrd_clk;
> +	writel(val, isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
> +
> +out_power:
> +	mutex_unlock(&isp->buttress.power_mutex);
> +
> +	return ret;
> +}
> +
> +static int ipu7_buttress_powerdown(struct device *dev,
> +				=C2=A0=C2=A0 const struct ipu_buttress_ctrl
> *ctrl)
> +{
> +	struct ipu7_device *isp =3D to_ipu7_bus_device(dev)->isp;
> +	u32 val, exp_sts;
> +	int ret =3D 0;
> +
> +	if (!ctrl)
> +		return 0;
> +
> +	mutex_lock(&isp->buttress.power_mutex);
> +
> +	exp_sts =3D ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
> +	val =3D 0x8 << ctrl->ratio_shift;
> +
> +	dev_dbg(dev, "set 0x%x to %s_WORKPOINT_REQ.\n", val,
> +		ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS");
> +	writel(val, isp->base + ctrl->freq_ctl);
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_PWR_STATUS,
> +				 val, ((val & ctrl->pwr_sts_mask) =3D=3D
> exp_sts),
> +				 100, BUTTRESS_POWER_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "%s power down timeout with status:
> 0x%x\n",
> +			ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS",
> val);
> +		goto out_power;
> +	}
> +
> +	dev_dbg(dev, "%s power down successfully. status: 0x%x\n",
> +		ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS", val);
> +out_power:
> +	if (ctrl->subsys_id =3D=3D IPU_IS && !ret) {
> +		isys_d2d_power(dev, false);
> +		isys_nde_control(dev, false);
> +	}
> +
> +	mutex_unlock(&isp->buttress.power_mutex);
> +
> +	return ret;
> +}
> +
> +static int ipu8_buttress_powerup(struct device *dev,
> +				 const struct ipu_buttress_ctrl
> *ctrl)
> +{
> +	struct ipu7_device *isp =3D to_ipu7_bus_device(dev)->isp;
> +	u32 sleep_level_reg =3D BUTTRESS_REG_SLEEP_LEVEL_STS;
> +	u32 val, exp_sts;
> +	int ret =3D 0;
> +
> +	if (!ctrl)
> +		return 0;
> +
> +	mutex_lock(&isp->buttress.power_mutex);
> +	exp_sts =3D ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
> +	if (ctrl->subsys_id =3D=3D IPU_IS) {
> +		ret =3D isys_d2d_power(dev, true);
> +		if (ret)
> +			goto out_power;
> +		isys_nde_control(dev, true);
> +	}
> +
> +	/* request ps_pll when psys freq > 400Mhz */
> +	if (ctrl->subsys_id =3D=3D IPU_PS && ctrl->ratio > 0x10) {
> +		writel(1, isp->base + BUTTRESS_REG_PS_PLL_ENABLE);
> +		ret =3D readl_poll_timeout(isp->base +
> sleep_level_reg,
> +					 val, (val & ctrl-
> >own_clk_ack),
> +					 100,
> BUTTRESS_POWER_TIMEOUT_US);
> +		if (ret)
> +			dev_warn(dev, "ps_pll req ack timeout.
> status 0x%x\n",
> +				 val);
> +	}
> +
> +	val =3D ctrl->ratio << ctrl->ratio_shift | ctrl->cdyn << ctrl-
> >cdyn_shift;
> +	dev_dbg(dev, "set 0x%x to %s_WORKPOINT_REQ.\n", val,
> +		ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS");
> +	writel(val, isp->base + ctrl->freq_ctl);
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_PWR_STATUS,
> +				 val, ((val & ctrl->pwr_sts_mask) =3D=3D
> exp_sts),
> +				 100, BUTTRESS_POWER_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "%s power up timeout with status:
> 0x%x\n",
> +			ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS",
> val);
> +		goto out_power;
> +	}
> +
> +	dev_dbg(dev, "%s power up successfully. status: 0x%x\n",
> +		ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS", val);
> +out_power:
> +	mutex_unlock(&isp->buttress.power_mutex);
> +
> +	return ret;
> +}
> +
> +static int ipu8_buttress_powerdown(struct device *dev,
> +				=C2=A0=C2=A0 const struct ipu_buttress_ctrl
> *ctrl)
> +{
> +	struct ipu7_device *isp =3D to_ipu7_bus_device(dev)->isp;
> +	u32 val, exp_sts;
> +	int ret =3D 0;
> +
> +	if (!ctrl)
> +		return 0;
> +
> +	mutex_lock(&isp->buttress.power_mutex);
> +	exp_sts =3D ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
> +
> +	if (ctrl->subsys_id =3D=3D IPU_PS)
> +		val =3D 0x10 << ctrl->ratio_shift;
> +	else
> +		val =3D 0x8 << ctrl->ratio_shift;
> +
> +	dev_dbg(dev, "set 0x%x to %s_WORKPOINT_REQ.\n", val,
> +		ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS");
> +	writel(val, isp->base + ctrl->freq_ctl);
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_PWR_STATUS,
> +				 val, ((val & ctrl->pwr_sts_mask) =3D=3D
> exp_sts),
> +				 100, BUTTRESS_POWER_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "%s power down timeout with status:
> 0x%x\n",
> +			ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS",
> val);
> +		goto out_power;
> +	}
> +
> +	dev_dbg(dev, "%s power down successfully. status: 0x%x\n",
> +		ctrl->subsys_id =3D=3D IPU_IS ? "IS" : "PS", val);
> +out_power:
> +	if (ctrl->subsys_id =3D=3D IPU_IS && !ret) {
> +		isys_d2d_power(dev, false);
> +		isys_nde_control(dev, false);
> +	}
> +
> +	if (ctrl->subsys_id =3D=3D IPU_PS) {
> +		val =3D readl(isp->base +
> BUTTRESS_REG_SLEEP_LEVEL_STS);
> +		if (val & ctrl->own_clk_ack)
> +			writel(0, isp->base +
> BUTTRESS_REG_PS_PLL_ENABLE);
> +	}
> +	mutex_unlock(&isp->buttress.power_mutex);
> +
> +	return ret;
> +}
> +
> +int ipu_buttress_powerup(struct device *dev,
> +			 const struct ipu_buttress_ctrl *ctrl)
> +{
> +	struct ipu7_device *isp =3D to_ipu7_bus_device(dev)->isp;
> +
> +	if (is_ipu8(isp->hw_ver))
> +		return ipu8_buttress_powerup(dev, ctrl);
> +
> +	return ipu7_buttress_powerup(dev, ctrl);
> +}
> +
> +int ipu_buttress_powerdown(struct device *dev,
> +			=C2=A0=C2=A0 const struct ipu_buttress_ctrl *ctrl)
> +{
> +	struct ipu7_device *isp =3D to_ipu7_bus_device(dev)->isp;
> +
> +	if (is_ipu8(isp->hw_ver))
> +		return ipu8_buttress_powerdown(dev, ctrl);
> +
> +	return ipu7_buttress_powerdown(dev, ctrl);
> +}
> +
> +bool ipu_buttress_get_secure_mode(struct ipu7_device *isp)
> +{
> +	u32 val;
> +
> +	val =3D readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
> +
> +	return val & BUTTRESS_SECURITY_CTL_FW_SECURE_MODE;
> +}
> +
> +bool ipu_buttress_auth_done(struct ipu7_device *isp)
> +{
> +	u32 val;
> +
> +	if (!isp->secure_mode)
> +		return true;
> +
> +	val =3D readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
> +	val =3D FIELD_GET(BUTTRESS_SECURITY_CTL_FW_SETUP_MASK, val);
> +
> +	return val =3D=3D BUTTRESS_SECURITY_CTL_AUTH_DONE;
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_buttress_auth_done, "INTEL_IPU7");
> +
> +int ipu_buttress_get_isys_freq(struct ipu7_device *isp, u32 *freq)
> +{
> +	u32 reg_val;
> +	int ret;
> +
> +	ret =3D pm_runtime_get_sync(&isp->isys->auxdev.dev);
> +	if (ret < 0) {
> +		pm_runtime_put(&isp->isys->auxdev.dev);
> +		dev_err(&isp->pdev->dev, "Runtime PM failed (%d)\n",
> ret);
> +		return ret;
> +	}
> +
> +	reg_val =3D readl(isp->base + BUTTRESS_REG_IS_WORKPOINT_REQ);
> +
> +	pm_runtime_put(&isp->isys->auxdev.dev);
> +
> +	if (is_ipu8(isp->hw_ver))
> +		*freq =3D (reg_val & BUTTRESS_IS_FREQ_CTL_RATIO_MASK)
> * 25;
> +	else
> +		*freq =3D (reg_val & BUTTRESS_IS_FREQ_CTL_RATIO_MASK)
> * 50 / 3;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_buttress_get_isys_freq, "INTEL_IPU7");
> +
> +int ipu_buttress_get_psys_freq(struct ipu7_device *isp, u32 *freq)
> +{
> +	u32 reg_val;
> +	int ret;
> +
> +	ret =3D pm_runtime_get_sync(&isp->psys->auxdev.dev);
> +	if (ret < 0) {
> +		pm_runtime_put(&isp->psys->auxdev.dev);
> +		dev_err(&isp->pdev->dev, "Runtime PM failed (%d)\n",
> ret);
> +		return ret;
> +	}
> +
> +	reg_val =3D readl(isp->base + BUTTRESS_REG_PS_WORKPOINT_REQ);
> +
> +	pm_runtime_put(&isp->psys->auxdev.dev);
> +
> +	reg_val &=3D BUTTRESS_PS_FREQ_CTL_RATIO_MASK;
> +	*freq =3D BUTTRESS_PS_FREQ_RATIO_STEP * reg_val;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_buttress_get_psys_freq, "INTEL_IPU7");
> +
> +int ipu_buttress_reset_authentication(struct ipu7_device *isp)
> +{
> +	struct device *dev =3D &isp->pdev->dev;
> +	int ret;
> +	u32 val;
> +
> +	if (!isp->secure_mode) {
> +		dev_dbg(dev, "Skip auth for non-secure mode\n");
> +		return 0;
> +	}
> +
> +	writel(BUTTRESS_FW_RESET_CTL_START, isp->base +
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUTTRESS_REG_FW_RESET_CTL);
> +
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_FW_RESET_CTL, val,
> +				 val & BUTTRESS_FW_RESET_CTL_DONE,
> 500,
> +				 BUTTRESS_CSE_FWRESET_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "Time out while resetting
> authentication state\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "FW reset for authentication done\n");
> +	writel(0, isp->base + BUTTRESS_REG_FW_RESET_CTL);
> +	/* leave some time for HW restore */
> +	usleep_range(800, 1000);
> +
> +	return 0;
> +}
> +
> +int ipu_buttress_authenticate(struct ipu7_device *isp)
> +{
> +	struct ipu_buttress *b =3D &isp->buttress;
> +	struct device *dev =3D &isp->pdev->dev;
> +	u32 data, mask, done, fail;
> +	int ret;
> +
> +	if (!isp->secure_mode) {
> +		dev_dbg(dev, "Skip auth for non-secure mode\n");
> +		return 0;
> +	}
> +
> +	mutex_lock(&b->auth_mutex);
> +
> +	if (ipu_buttress_auth_done(isp)) {
> +		ret =3D 0;
> +		goto out_unlock;
> +	}
> +
> +	/*
> +	 * BUTTRESS_REG_FW_SOURCE_BASE needs to be set with FW CPD
> +	 * package address for secure mode.
> +	 */
> +
> +	writel(isp->cpd_fw->size, isp->base +
> BUTTRESS_REG_FW_SOURCE_SIZE);
> +	writel(sg_dma_address(isp->psys->fw_sgt.sgl),
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isp->base + BUTTRESS_REG_FW_SOURCE=
_BASE);
> +
> +	/*
> +	 * Write boot_load into IU2CSEDATA0
> +	 * Write sizeof(boot_load) | 0x2 << CLIENT_ID to
> +	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
> +	 */
> +	dev_info(dev, "Sending BOOT_LOAD to CSE\n");
> +	ret =3D ipu_buttress_ipc_send(isp,
> BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
> +				=C2=A0=C2=A0=C2=A0 1, true,
> +				=C2=A0=C2=A0=C2=A0
> BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
> +	if (ret) {
> +		dev_err(dev, "CSE boot_load failed\n");
> +		goto out_unlock;
> +	}
> +
> +	mask =3D BUTTRESS_SECURITY_CTL_FW_SETUP_MASK;
> +	done =3D BUTTRESS_SECURITY_CTL_FW_SETUP_DONE;
> +	fail =3D BUTTRESS_SECURITY_CTL_AUTH_FAILED;
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_SECURITY_CTL, data,
> +				 ((data & mask) =3D=3D done ||
> +				=C2=A0 (data & mask) =3D=3D fail), 500,
> +				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "CSE boot_load timeout\n");
> +		goto out_unlock;
> +	}
> +
> +	if ((data & mask) =3D=3D fail) {
> +		dev_err(dev, "CSE auth failed\n");
> +		ret =3D -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	ret =3D readl_poll_timeout(isp->base +
> BOOTLOADER_STATUS_OFFSET,
> +				 data, data =3D=3D BOOTLOADER_MAGIC_KEY,
> 500,
> +				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "Unexpected magic number 0x%x\n",
> data);
> +		goto out_unlock;
> +	}
> +
> +	/*
> +	 * Write authenticate_run into IU2CSEDATA0
> +	 * Write sizeof(boot_load) | 0x2 << CLIENT_ID to
> +	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
> +	 */
> +	dev_info(dev, "Sending AUTHENTICATE_RUN to CSE\n");
> +	ret =3D ipu_buttress_ipc_send(isp,
> BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
> +				=C2=A0=C2=A0=C2=A0 1, true,
> +				=C2=A0=C2=A0=C2=A0
> BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
> +	if (ret) {
> +		dev_err(dev, "CSE authenticate_run failed\n");
> +		goto out_unlock;
> +	}
> +
> +	done =3D BUTTRESS_SECURITY_CTL_AUTH_DONE;
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_SECURITY_CTL, data,
> +				 ((data & mask) =3D=3D done ||
> +				=C2=A0 (data & mask) =3D=3D fail), 500,
> +			=09
> BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "CSE authenticate timeout\n");
> +		goto out_unlock;
> +	}
> +
> +	if ((data & mask) =3D=3D fail) {
> +		dev_err(dev, "CSE boot_load failed\n");
> +		ret =3D -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	dev_info(dev, "CSE authenticate_run done\n");
> +
> +out_unlock:
> +	mutex_unlock(&b->auth_mutex);
> +
> +	return ret;
> +}
> +
> +static int ipu_buttress_send_tsc_request(struct ipu7_device *isp)
> +{
> +	u32 val, mask, done;
> +	int ret;
> +
> +	mask =3D BUTTRESS_PWR_STATUS_HH_STATUS_MASK;
> +
> +	writel(BUTTRESS_TSC_CMD_START_TSC_SYNC,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isp->base + BUTTRESS_REG_TSC_CMD);
> +
> +	val =3D readl(isp->base + BUTTRESS_REG_PWR_STATUS);
> +	val =3D FIELD_GET(mask, val);
> +	if (val =3D=3D BUTTRESS_PWR_STATUS_HH_STATE_ERR) {
> +		dev_err(&isp->pdev->dev, "Start tsc sync failed\n");
> +		return -EINVAL;
> +	}
> +
> +	done =3D BUTTRESS_PWR_STATUS_HH_STATE_DONE;
> +	ret =3D readl_poll_timeout(isp->base +
> BUTTRESS_REG_PWR_STATUS, val,
> +				 FIELD_GET(mask, val) =3D=3D done, 500,
> +				 BUTTRESS_TSC_SYNC_TIMEOUT_US);
> +	if (ret)
> +		dev_err(&isp->pdev->dev, "Start tsc sync
> timeout\n");
> +
> +	return ret;
> +}
> +
> +int ipu_buttress_start_tsc_sync(struct ipu7_device *isp)
> +{
> +	void __iomem *base =3D isp->base;
> +	unsigned int i;
> +	u32 val;
> +
> +	if (is_ipu8(isp->hw_ver)) {
> +		for (i =3D 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX;
> i++) {
> +			val =3D readl(base +
> BUTTRESS_REG_PB_TIMESTAMP_VALID);
> +			if (val =3D=3D 1)
> +				return 0;
> +			usleep_range(40, 50);
> +		}
> +
> +		dev_err(&isp->pdev->dev, "PB HH sync failed (valid
> %u)\n", val);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (is_ipu7p5(isp->hw_ver)) {
> +		val =3D readl(base + BUTTRESS_REG_TSC_CTL);
> +		val |=3D BUTTRESS_SEL_PB_TIMESTAMP;
> +		writel(val, base + BUTTRESS_REG_TSC_CTL);
> +
> +		for (i =3D 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX;
> i++) {
> +			val =3D readl(base +
> BUTTRESS_REG_PB_TIMESTAMP_VALID);
> +			if (val =3D=3D 1)
> +				return 0;
> +			usleep_range(40, 50);
> +		}
> +
> +		dev_err(&isp->pdev->dev, "PB HH sync failed (valid
> %u)\n", val);
> +
> +		return -ETIMEDOUT;
> +	}
> +
> +	for (i =3D 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
> +		int ret;
> +
> +		ret =3D ipu_buttress_send_tsc_request(isp);
> +		if (ret !=3D -ETIMEDOUT)
> +			return ret;
> +
> +		val =3D readl(base + BUTTRESS_REG_TSC_CTL);
> +		val =3D val | BUTTRESS_TSW_WA_SOFT_RESET;
> +		writel(val, base + BUTTRESS_REG_TSC_CTL);
> +		val =3D val & (~BUTTRESS_TSW_WA_SOFT_RESET);
> +		writel(val, base + BUTTRESS_REG_TSC_CTL);
> +	}
> +
> +	dev_err(&isp->pdev->dev, "TSC sync failed (timeout)\n");
> +
> +	return -ETIMEDOUT;
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_buttress_start_tsc_sync, "INTEL_IPU7");
> +
> +void ipu_buttress_tsc_read(struct ipu7_device *isp, u64 *val)
> +{
> +	unsigned long flags;
> +	u32 tsc_hi, tsc_lo;
> +
> +	local_irq_save(flags);
> +	if (is_ipu7(isp->hw_ver)) {
> +		tsc_lo =3D readl(isp->base + BUTTRESS_REG_TSC_LO);
> +		tsc_hi =3D readl(isp->base + BUTTRESS_REG_TSC_HI);
> +	} else {
> +		tsc_lo =3D readl(isp->base +
> BUTTRESS_REG_PB_TIMESTAMP_LO);
> +		tsc_hi =3D readl(isp->base +
> BUTTRESS_REG_PB_TIMESTAMP_HI);
> +	}
> +	*val =3D (u64)tsc_hi << 32 | tsc_lo;
> +	local_irq_restore(flags);
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_buttress_tsc_read, "INTEL_IPU7");
> +
> +u64 ipu_buttress_tsc_ticks_to_ns(u64 ticks, const struct ipu7_device
> *isp)
> +{
> +	u64 ns =3D ticks * 10000;
> +
> +	/*
> +	 * converting TSC tick count to ns is calculated by:
> +	 * Example (TSC clock frequency is 19.2MHz):
> +	 * ns =3D ticks * 1000 000 000 / 19.2Mhz
> +	 *=C2=A0=C2=A0=C2=A0 =3D ticks * 1000 000 000 / 19200000Hz
> +	 *=C2=A0=C2=A0=C2=A0 =3D ticks * 10000 / 192 ns
> +	 */
> +	return div_u64(ns, isp->buttress.ref_clk);
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_buttress_tsc_ticks_to_ns, "INTEL_IPU7");
> +
> +/* trigger uc control to wakeup fw */
> +void ipu_buttress_wakeup_is_uc(const struct ipu7_device *isp)
> +{
> +	u32 val;
> +
> +	val =3D readl(isp->base +
> BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS);
> +	val |=3D UCX_CTL_WAKEUP;
> +	writel(val, isp->base +
> BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS);
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_buttress_wakeup_is_uc, "INTEL_IPU7");
> +
> +void ipu_buttress_wakeup_ps_uc(const struct ipu7_device *isp)
> +{
> +	u32 val;
> +
> +	val =3D readl(isp->base +
> BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS);
> +	val |=3D UCX_CTL_WAKEUP;
> +	writel(val, isp->base +
> BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS);
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_buttress_wakeup_ps_uc, "INTEL_IPU7");
> +
> +static const struct x86_cpu_id ipu_misc_cfg_exclusion[] =3D {
> +	X86_MATCH_VFM_STEPS(INTEL_PANTHERLAKE_L, 0x1, 0x1, 0),
> +	{},
> +};
> +
> +static void ipu_buttress_setup(struct ipu7_device *isp)
> +{
> +	struct device *dev =3D &isp->pdev->dev;
> +	u32 val;
> +
> +	/* program PB BAR */
> +#define WRXREQOP_OVRD_VAL_MASK=C2=A0 GENMASK(22, 19)
> +	writel(0, isp->pb_base + GLOBAL_INTERRUPT_MASK);
> +	val =3D readl(isp->pb_base + BAR2_MISC_CONFIG);
> +	if (is_ipu7(isp->hw_ver) ||
> x86_match_cpu(ipu_misc_cfg_exclusion))
> +		val |=3D 0x100U;
> +	else
> +		val |=3D FIELD_PREP(WRXREQOP_OVRD_VAL_MASK, 0xf) |
> +			BIT(18) | 0x100U;
> +
> +	writel(val, isp->pb_base + BAR2_MISC_CONFIG);
> +	val =3D readl(isp->pb_base + BAR2_MISC_CONFIG);
> +
> +	if (is_ipu8(isp->hw_ver)) {
> +		writel(BIT(13), isp->pb_base +
> TLBID_HASH_ENABLE_63_32);
> +		writel(BIT(9), isp->pb_base +
> TLBID_HASH_ENABLE_95_64);
> +		dev_dbg(dev, "IPU8 TLBID_HASH %x %x\n",
> +			readl(isp->pb_base +
> TLBID_HASH_ENABLE_63_32),
> +			readl(isp->pb_base +
> TLBID_HASH_ENABLE_95_64));
> +	} else if (is_ipu7p5(isp->hw_ver)) {
> +		writel(BIT(14), isp->pb_base +
> TLBID_HASH_ENABLE_63_32);
> +		writel(BIT(9), isp->pb_base +
> TLBID_HASH_ENABLE_95_64);
> +		dev_dbg(dev, "IPU7P5 TLBID_HASH %x %x\n",
> +			readl(isp->pb_base +
> TLBID_HASH_ENABLE_63_32),
> +			readl(isp->pb_base +
> TLBID_HASH_ENABLE_95_64));
> +	} else {
> +		writel(BIT(22), isp->pb_base +
> TLBID_HASH_ENABLE_63_32);
> +		writel(BIT(1), isp->pb_base +
> TLBID_HASH_ENABLE_127_96);
> +		dev_dbg(dev, "TLBID_HASH %x %x\n",
> +			readl(isp->pb_base +
> TLBID_HASH_ENABLE_63_32),
> +			readl(isp->pb_base +
> TLBID_HASH_ENABLE_127_96));
> +	}
> +
> +	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_IRQ_CLEAR);
> +	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_IRQ_MASK);
> +	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_IRQ_ENABLE);
> +	/* LNL SW workaround for PS PD hang when PS sub-domain
> during PD */
> +	writel(PS_FSM_CG, isp->base + BUTTRESS_REG_CG_CTRL_BITS);
> +}
> +
> +void ipu_buttress_restore(struct ipu7_device *isp)
> +{
> +	struct ipu_buttress *b =3D &isp->buttress;
> +
> +	ipu_buttress_setup(isp);
> +
> +	writel(b->wdt_cached_value, isp->base +
> BUTTRESS_REG_IDLE_WDT);
> +}
> +
> +int ipu_buttress_init(struct ipu7_device *isp)
> +{
> +	int ret, ipc_reset_retry =3D BUTTRESS_CSE_IPC_RESET_RETRY;
> +	struct ipu_buttress *b =3D &isp->buttress;
> +	struct device *dev =3D &isp->pdev->dev;
> +	u32 val;
> +
> +	mutex_init(&b->power_mutex);
> +	mutex_init(&b->auth_mutex);
> +	mutex_init(&b->cons_mutex);
> +	mutex_init(&b->ipc_mutex);
> +	init_completion(&b->cse.send_complete);
> +	init_completion(&b->cse.recv_complete);
> +
> +	b->cse.nack =3D BUTTRESS_CSE2IUDATA0_IPC_NACK;
> +	b->cse.nack_mask =3D BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
> +	b->cse.csr_in =3D BUTTRESS_REG_CSE2IUCSR;
> +	b->cse.csr_out =3D BUTTRESS_REG_IU2CSECSR;
> +	b->cse.db0_in =3D BUTTRESS_REG_CSE2IUDB0;
> +	b->cse.db0_out =3D BUTTRESS_REG_IU2CSEDB0;
> +	b->cse.data0_in =3D BUTTRESS_REG_CSE2IUDATA0;
> +	b->cse.data0_out =3D BUTTRESS_REG_IU2CSEDATA0;
> +
> +	isp->secure_mode =3D ipu_buttress_get_secure_mode(isp);
> +	val =3D readl(isp->base + BUTTRESS_REG_IPU_SKU);
> +	dev_info(dev, "IPU%u SKU %u in %s mode mask 0x%x\n", val &
> 0xf,
> +		 (val >> 4) & 0x7, isp->secure_mode ? "secure" :
> "non-secure",
> +		 readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
> +	b->wdt_cached_value =3D readl(isp->base +
> BUTTRESS_REG_IDLE_WDT);
> +	b->ref_clk =3D 384;
> +
> +	ipu_buttress_setup(isp);
> +
> +	/* Retry couple of times in case of CSE initialization is
> delayed */
> +	do {
> +		ret =3D ipu_buttress_ipc_reset(isp, &b->cse);
> +		if (ret) {
> +			dev_warn(dev, "IPC reset protocol failed,
> retrying\n");
> +		} else {
> +			dev_dbg(dev, "IPC reset done\n");
> +			return 0;
> +		}
> +	} while (ipc_reset_retry--);
> +
> +	dev_err(dev, "IPC reset protocol failed\n");
> +
> +	mutex_destroy(&b->power_mutex);
> +	mutex_destroy(&b->auth_mutex);
> +	mutex_destroy(&b->cons_mutex);
> +	mutex_destroy(&b->ipc_mutex);
> +
> +	return ret;
> +}
> +
> +void ipu_buttress_exit(struct ipu7_device *isp)
> +{
> +	struct ipu_buttress *b =3D &isp->buttress;
> +
> +	writel(0, isp->base + BUTTRESS_REG_IRQ_ENABLE);
> +	mutex_destroy(&b->power_mutex);
> +	mutex_destroy(&b->auth_mutex);
> +	mutex_destroy(&b->cons_mutex);
> +	mutex_destroy(&b->ipc_mutex);
> +}
> diff --git a/drivers/media/pci/intel/ipu7/ipu7-buttress.h
> b/drivers/media/pci/intel/ipu7/ipu7-buttress.h
> new file mode 100644
> index 000000000000..045b11992331
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/ipu7-buttress.h
> @@ -0,0 +1,84 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2013 - 2024 Intel Corporation
> + */
> +
> +#ifndef IPU7_BUTTRESS_H
> +#define IPU7_BUTTRESS_H
> +
> +#include <linux/completion.h>
> +#include <linux/irqreturn.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
> +struct device;
> +struct ipu7_device;
> +
> +struct ipu_buttress_ctrl {
> +	u32 subsys_id;
> +	u32 freq_ctl, pwr_sts_shift, pwr_sts_mask, pwr_sts_on,
> pwr_sts_off;
> +	u32 ratio;
> +	u32 ratio_shift;
> +	u32 cdyn;
> +	u32 cdyn_shift;
> +	u32 ovrd_clk;
> +	u32 own_clk_ack;
> +};
> +
> +struct ipu_buttress_ipc {
> +	struct completion send_complete;
> +	struct completion recv_complete;
> +	u32 nack;
> +	u32 nack_mask;
> +	u32 recv_data;
> +	u32 csr_out;
> +	u32 csr_in;
> +	u32 db0_in;
> +	u32 db0_out;
> +	u32 data0_out;
> +	u32 data0_in;
> +};
> +
> +struct ipu_buttress {
> +	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
> +	struct ipu_buttress_ipc cse;
> +	u32 psys_min_freq;
> +	u32 wdt_cached_value;
> +	u8 psys_force_ratio;
> +	bool force_suspend;
> +	u32 ref_clk;
> +};
> +
> +struct ipu7_ipc_buttress_bulk_msg {
> +	u32 cmd;
> +	u32 expected_resp;
> +	bool require_resp;
> +	u8 cmd_size;
> +};
> +
> +int ipu_buttress_ipc_reset(struct ipu7_device *isp,
> +			=C2=A0=C2=A0 struct ipu_buttress_ipc *ipc);
> +int ipu_buttress_powerup(struct device *dev,
> +			 const struct ipu_buttress_ctrl *ctrl);
> +int ipu_buttress_powerdown(struct device *dev,
> +			=C2=A0=C2=A0 const struct ipu_buttress_ctrl *ctrl);
> +bool ipu_buttress_get_secure_mode(struct ipu7_device *isp);
> +int ipu_buttress_authenticate(struct ipu7_device *isp);
> +int ipu_buttress_reset_authentication(struct ipu7_device *isp);
> +bool ipu_buttress_auth_done(struct ipu7_device *isp);
> +int ipu_buttress_get_isys_freq(struct ipu7_device *isp, u32 *freq);
> +int ipu_buttress_get_psys_freq(struct ipu7_device *isp, u32 *freq);
> +int ipu_buttress_start_tsc_sync(struct ipu7_device *isp);
> +void ipu_buttress_tsc_read(struct ipu7_device *isp, u64 *val);
> +u64 ipu_buttress_tsc_ticks_to_ns(u64 ticks, const struct ipu7_device
> *isp);
> +
> +irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr);
> +irqreturn_t ipu_buttress_isr_threaded(int irq, void *isp_ptr);
> +int ipu_buttress_init(struct ipu7_device *isp);
> +void ipu_buttress_exit(struct ipu7_device *isp);
> +void ipu_buttress_csi_port_config(struct ipu7_device *isp,
> +				=C2=A0 u32 legacy, u32 combo);
> +void ipu_buttress_restore(struct ipu7_device *isp);
> +void ipu_buttress_wakeup_is_uc(const struct ipu7_device *isp);
> +void ipu_buttress_wakeup_ps_uc(const struct ipu7_device *isp);
> +#endif /* IPU7_BUTTRESS_H */
> diff --git a/drivers/media/pci/intel/ipu7/ipu7-platform-regs.h
> b/drivers/media/pci/intel/ipu7/ipu7-platform-regs.h
> new file mode 100644
> index 000000000000..377acca35ab0
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/ipu7-platform-regs.h
> @@ -0,0 +1,146 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2018 - 2024 Intel Corporation
> + */
> +
> +#ifndef IPU7_PLATFORM_REGS_H
> +#define IPU7_PLATFORM_REGS_H
> +
> +#define IS_BASE					0x230000
> +#define IS_UC_CTRL_BASE				(IS_BASE +
> 0x0)
> +
> +#define PS_BASE					0x130000
> +#define PS_UC_CTRL_BASE				(PS_BASE +
> 0x0)
> +
> +/*
> + * bit 0: IRQ from FW,
> + * bit 1, 2 and 3: IRQ from HW
> + */
> +#define TO_SW_IRQ_MASK				0xf
> +#define TO_SW_IRQ_FW				BIT(0)
> +
> +#define FW_CODE_BASE				0x0
> +#define FW_DATA_BASE				0x4
> +#define CPU_AXI_CNTL				0x8
> +#define CPU_QOS_CNTL				0xc
> +#define IDMA_AXI_CNTL				0x10
> +#define IDMA_QOS_CNTL				0x14
> +#define MEF_SPLIT_SIZE				0x18
> +#define FW_MSG_CONTROL				0x1c
> +#define FW_MSG_CREDITS_STATUS			0x20
> +#define FW_MSG_CREDIT_TAKEN			0x24
> +#define FW_MSG_CREDIT_RETURNED			0x28
> +#define TRIG_IDMA_IN				0x2c
> +#define IDMA_DONE				0x30
> +#define IDMA_DONE_CLEAR				0x34
> +#define DMEM_CAPACITY				0x38
> +#define NON_SECURE_CODE_OFFSET			0x3c
> +#define UC_CG_CTRL_BITS				0x40
> +#define ALT_RESET_VEC				0x44
> +#define WDT_NMI_DURATION			0x104
> +#define WDT_RST_REQ_DURATION			0x108
> +#define WDT_CNTL				0x10c
> +#define WDT_NMI_CURRENT_COUNT			0x110
> +#define WDT_RST_CURRENT_COUNT			0x114
> +#define WDT_HALT				0x118
> +#define WDT_STATUS				0x11c
> +#define SPARE_REG_RW				0x120
> +#define SPARE_REG_RO				0x124
> +#define FW_TO_FW_IRQ_CNTL_EDGE			0x200
> +#define FW_TO_FW_IRQ_CNTL_MASK_N		0x204
> +#define FW_TO_FW_IRQ_CNTL_STATUS		0x208
> +#define FW_TO_FW_IRQ_CNTL_CLEAR			0x20c
> +#define FW_TO_FW_IRQ_CNTL_ENABLE		0x210
> +#define FW_TO_FW_IRQ_CNTL_LEVEL_NOT_PULSE	0x214
> +#define CLK_GATE_DIS				0x218
> +#define DEBUG_STATUS				0x1000
> +#define DEBUG_EXCPETION				0x1004
> +#define TIE_GENERAL_INPUT			0x1008
> +#define ERR_STATUS				0x100c
> +#define UC_ERR_INFO				0x1010
> +#define SPARE_CNTL				0x1014
> +#define MEF_TRC_CNTL				0x1100
> +#define DBG_MEF_LAST_PUSH			0x1104
> +#define DBG_MEF_LAST_POP			0x1108
> +#define DBG_MEF_COUNT_CNTL			0x110c
> +#define DBG_MEF_COUNT1				0x1110
> +#define DBG_MEF_COUNT2				0x1114
> +#define DBG_MEF_ACC_OCCUPANCY			0x1118
> +#define DBG_MEF_MAX_IRQ_TO_POP			0x111c
> +#define DBG_IRQ_CNTL				0x1120
> +#define DBG_IRQ_COUNT				0x1124
> +#define DBG_CYC_COUNT				0x1128
> +#define DBG_CNTL				0x1130
> +#define DBG_RST_REG				0x1134
> +#define DBG_MEF_STATUS0				0x1138
> +#define DBG_MEF_STATUS1				0x113c
> +#define PDEBUG_CTL				0x1140
> +#define PDEBUG_DATA				0x1144
> +#define PDEBUG_INST				0x1148
> +#define PDEBUG_LS0ADDR				0x114c
> +#define PDEBUG_LS0DATA				0x1150
> +#define PDEBUG_LS0STAT				0x1154
> +#define PDEBUG_PC				0x1158
> +#define PDEBUG_MISC				0x115c
> +#define PDEBUG_PREF_STS				0x1160
> +#define MEF0_ADDR				0x2000
> +#define MEF1_ADDR				0x2020
> +#define PRINTF_EN_THROUGH_TRACE			0x3004
> +#define PRINTF_EN_DIRECTLY_TO_DDR		0x3008
> +#define PRINTF_DDR_BASE_ADDR			0x300c
> +#define PRINTF_DDR_SIZE				0x3010
> +#define PRINTF_DDR_NEXT_ADDR			0x3014
> +#define PRINTF_STATUS				0x3018
> +#define PRINTF_AXI_CNTL				0x301c
> +#define PRINTF_MSG_LENGTH			0x3020
> +#define TO_SW_IRQ_CNTL_EDGE			0x4000
> +#define TO_SW_IRQ_CNTL_MASK_N			0x4004
> +#define TO_SW_IRQ_CNTL_STATUS			0x4008
> +#define TO_SW_IRQ_CNTL_CLEAR			0x400c
> +#define TO_SW_IRQ_CNTL_ENABLE			0x4010
> +#define TO_SW_IRQ_CNTL_LEVEL_NOT_PULSE		0x4014
> +#define ERR_IRQ_CNTL_EDGE			0x4018
> +#define ERR_IRQ_CNTL_MASK_N			0x401c
> +#define ERR_IRQ_CNTL_STATUS			0x4020
> +#define ERR_IRQ_CNTL_CLEAR			0x4024
> +#define ERR_IRQ_CNTL_ENABLE			0x4028
> +#define ERR_IRQ_CNTL_LEVEL_NOT_PULSE		0x402c
> +#define LOCAL_DMEM_BASE_ADDR			0x1300000
> +
> +/*
> + * IS_UC_TO_SW irqs
> + * bit 0: IRQ from local FW
> + * bit 1~3: IRQ from HW
> + */
> +#define IS_UC_TO_SW_IRQ_MASK			0xf
> +
> +#define IPU_ISYS_SPC_OFFSET			0x210000
> +#define IPU7_PSYS_SPC_OFFSET			0x118000
> +#define IPU_ISYS_DMEM_OFFSET			0x200000
> +#define IPU_PSYS_DMEM_OFFSET			0x100000
> +
> +#define IPU7_ISYS_CSI_PORT_NUM			4
> +
> +/* IRQ-related registers in PSYS */
> +#define IPU_REG_PSYS_TO_SW_IRQ_CNTL_EDGE		0x134000
> +#define IPU_REG_PSYS_TO_SW_IRQ_CNTL_MASK		0x134004
> +#define IPU_REG_PSYS_TO_SW_IRQ_CNTL_STATUS		0x134008
> +#define IPU_REG_PSYS_TO_SW_IRQ_CNTL_CLEAR		0x13400c
> +#define IPU_REG_PSYS_TO_SW_IRQ_CNTL_ENABLE		0x134010
> +#define IPU_REG_PSYS_TO_SW_IRQ_CNTL_LEVEL_NOT_PULSE	0x134014
> +#define IRQ_FROM_LOCAL_FW				BIT(0)
> +
> +/*
> + * psys subdomains power request regs
> + */
> +enum ipu7_device_buttress_psys_domain_pos {
> +	IPU_PSYS_SUBDOMAIN_LB		=3D 0,
> +	IPU_PSYS_SUBDOMAIN_BB		=3D 1,
> +};
> +
> +#define
> IPU7_PSYS_DOMAIN_POWER_MASK		(BIT(IPU_PSYS_SUBDOMAIN_LB) | \
> +					=09
> BIT(IPU_PSYS_SUBDOMAIN_BB))
> +#define
> IPU8_PSYS_DOMAIN_POWER_MASK		BIT(IPU_PSYS_SUBDOMAIN_LB)
> +#define IPU_PSYS_DOMAIN_POWER_IN_PROGRESS	BIT(31)
> +
> +#endif /* IPU7_PLATFORM_REGS_H */
> diff --git a/drivers/media/pci/intel/ipu7/ipu7.c
> b/drivers/media/pci/intel/ipu7/ipu7.c
> new file mode 100644
> index 000000000000..a0eec938fbea
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/ipu7.c
> @@ -0,0 +1,2791 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2013 - 2024 Intel Corporation
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/bug.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/firmware.h>
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/vmalloc.h>
> +#include <linux/version.h>
> +
> +#include <media/ipu-bridge.h>
> +
> +#include "abi/ipu7_fw_common_abi.h"
> +
> +#include "ipu7.h"
> +#include "ipu7-bus.h"
> +#include "ipu7-buttress.h"
> +#include "ipu7-buttress-regs.h"
> +#include "ipu7-cpd.h"
> +#include "ipu7-dma.h"
> +#include "ipu7-isys-csi2-regs.h"
> +#include "ipu7-mmu.h"
> +#include "ipu7-platform-regs.h"
> +
> +#define IPU_PCI_BAR		0
> +#define IPU_PCI_PBBAR		4
> +
> +static unsigned int ipu7_csi_offsets[] =3D {
> +	IPU_CSI_PORT_A_ADDR_OFFSET,
> +	IPU_CSI_PORT_B_ADDR_OFFSET,
> +	IPU_CSI_PORT_C_ADDR_OFFSET,
> +	IPU_CSI_PORT_D_ADDR_OFFSET,
> +};
> +
> +static struct ipu_isys_internal_pdata ipu7p5_isys_ipdata =3D {
> +	.csi2 =3D {
> +		.gpreg =3D IS_IO_CSI2_GPREGS_BASE,
> +	},
> +	.hw_variant =3D {
> +		.offset =3D IPU_UNIFIED_OFFSET,
> +		.nr_mmus =3D IPU7P5_IS_MMU_NUM,
> +		.mmu_hw =3D {
> +			{
> +				.name =3D "IS_FW_RD",
> +				.offset =3D
> IPU7P5_IS_MMU_FW_RD_OFFSET,
> +				.zlx_offset =3D
> IPU7P5_IS_ZLX_UC_RD_OFFSET,
> +				.uao_offset =3D
> IPU7P5_IS_UAO_UC_RD_OFFSET,
> +				.info_bits =3D 0x20005101,
> +				.refill =3D 0x00002726,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU7P5_IS_MMU_FW_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7P5_IS_MMU_FW_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7P5_IS_MMU_FW_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7P5_IS_MMU_FW_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x8, 0xa,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4,
> +				},
> +				.zlx_nr =3D IPU7P5_IS_ZLX_UC_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 0, 0
> +				},
> +				.zlx_conf =3D {
> +					0x0,
> +				},
> +				.uao_p_num =3D
> IPU7P5_IS_UAO_UC_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000049,
> +					0x0000004c,
> +					0x0000004d,
> +					0x00000000,
> +				},
> +			},
> +			{
> +				.name =3D "IS_FW_WR",
> +				.offset =3D
> IPU7P5_IS_MMU_FW_WR_OFFSET,
> +				.zlx_offset =3D
> IPU7P5_IS_ZLX_UC_WR_OFFSET,
> +				.uao_offset =3D
> IPU7P5_IS_UAO_UC_WR_OFFSET,
> +				.info_bits =3D 0x20005001,
> +				.refill =3D 0x00002524,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU7P5_IS_MMU_FW_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7P5_IS_MMU_FW_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7P5_IS_MMU_FW_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7P5_IS_MMU_FW_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x8, 0xa,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4,
> +				},
> +				.zlx_nr =3D IPU7P5_IS_ZLX_UC_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 1, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x0,
> +					0x00010101,
> +					0x00010101,
> +					0x0,
> +				},
> +				.uao_p_num =3D
> IPU7P5_IS_UAO_UC_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000049,
> +					0x0000004a,
> +					0x0000004b,
> +					0x00000000,
> +				},
> +			},
> +			{
> +				.name =3D "IS_DATA_WR_ISOC",
> +				.offset =3D IPU7P5_IS_MMU_M0_OFFSET,
> +				.zlx_offset =3D
> IPU7P5_IS_ZLX_M0_OFFSET,
> +				.uao_offset =3D
> IPU7P5_IS_UAO_M0_WR_OFFSET,
> +				.info_bits =3D 0x20004e01,
> +				.refill =3D 0x00002120,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU7P5_IS_MMU_M0_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7P5_IS_MMU_M0_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7P5_IS_MMU_M0_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7P5_IS_MMU_M0_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.zlx_nr =3D IPU7P5_IS_ZLX_M0_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f10,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +				},
> +				.zlx_conf =3D {
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +				},
> +				.uao_p_num =3D
> IPU7P5_IS_UAO_M0_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000041,
> +					0x00000042,
> +					0x00000043,
> +					0x00000044,
> +					0x00000041,
> +					0x00000042,
> +					0x00000043,
> +					0x00000044,
> +					0x00000041,
> +					0x00000042,
> +					0x00000043,
> +					0x00000044,
> +					0x00000041,
> +					0x00000042,
> +					0x00000043,
> +					0x00000044,
> +				},
> +			},
> +			{
> +				.name =3D "IS_DATA_WR_SNOOP",
> +				.offset =3D IPU7P5_IS_MMU_M1_OFFSET,
> +				.zlx_offset =3D
> IPU7P5_IS_ZLX_M1_OFFSET,
> +				.uao_offset =3D
> IPU7P5_IS_UAO_M1_WR_OFFSET,
> +				.info_bits =3D 0x20004f01,
> +				.refill =3D 0x00002322,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU7P5_IS_MMU_M1_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7P5_IS_MMU_M1_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7P5_IS_MMU_M1_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7P5_IS_MMU_M1_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.zlx_nr =3D IPU7P5_IS_ZLX_M1_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +				},
> +				.zlx_conf =3D {
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +				},
> +				.uao_p_num =3D
> IPU7P5_IS_UAO_M1_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000045,
> +					0x00000046,
> +					0x00000047,
> +					0x00000048,
> +					0x00000045,
> +					0x00000046,
> +					0x00000047,
> +					0x00000048,
> +					0x00000045,
> +					0x00000046,
> +					0x00000047,
> +					0x00000048,
> +					0x00000045,
> +					0x00000046,
> +					0x00000047,
> +					0x00000048,
> +				},
> +			},
> +		},
> +		.cdc_fifos =3D 3,
> +		.cdc_fifo_threshold =3D {6, 8, 2},
> +		.dmem_offset =3D IPU_ISYS_DMEM_OFFSET,
> +		.spc_offset =3D IPU_ISYS_SPC_OFFSET,
> +	},
> +	.isys_dma_overshoot =3D IPU_ISYS_OVERALLOC_MIN,
> +};
> +
> +static struct ipu_psys_internal_pdata ipu7p5_psys_ipdata =3D {
> +	.hw_variant =3D {
> +		.offset =3D IPU_UNIFIED_OFFSET,
> +		.nr_mmus =3D IPU7P5_PS_MMU_NUM,
> +		.mmu_hw =3D {
> +			{
> +				.name =3D "PS_FW_RD",
> +				.offset =3D
> IPU7P5_PS_MMU_FW_RD_OFFSET,
> +				.zlx_offset =3D
> IPU7P5_PS_ZLX_FW_RD_OFFSET,
> +				.uao_offset =3D
> IPU7P5_PS_UAO_FW_RD_OFFSET,
> +				.info_bits =3D 0x20004001,
> +				.refill =3D 0x00002726,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU7P5_PS_MMU_FW_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7P5_PS_MMU_FW_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7P5_PS_MMU_FW_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7P5_PS_MMU_FW_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000d,
> +					0x0000000f,
> +					0x00000011,
> +					0x00000012,
> +					0x00000013,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x00000019,
> +					0x0000001a,
> +					0x0000001a,
> +					0x0000001a,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.zlx_nr =3D IPU7P5_PS_ZLX_FW_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 0, 0, 1, 1, 0, 0,
> +					0, 1, 1, 0, 0, 0, 0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x00000000,
> +					0x00010101,
> +					0x00000000,
> +					0x00000000,
> +					0x00010101,
> +					0x00010101,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00010101,
> +					0x00010101,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +				},
> +				.uao_p_num =3D
> IPU7P5_PS_UAO_FW_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x0000002e,
> +					0x00000035,
> +					0x00000036,
> +					0x00000031,
> +					0x00000037,
> +					0x00000038,
> +					0x00000039,
> +					0x00000032,
> +					0x00000033,
> +					0x0000003a,
> +					0x0000003b,
> +					0x0000003c,
> +					0x00000034,
> +					0x0,
> +					0x0,
> +					0x0,
> +				},
> +			},
> +			{
> +				.name =3D "PS_FW_WR",
> +				.offset =3D
> IPU7P5_PS_MMU_FW_WR_OFFSET,
> +				.zlx_offset =3D
> IPU7P5_PS_ZLX_FW_WR_OFFSET,
> +				.uao_offset =3D
> IPU7P5_PS_UAO_FW_WR_OFFSET,
> +				.info_bits =3D 0x20003e01,
> +				.refill =3D 0x00002322,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU7P5_PS_MMU_FW_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7P5_PS_MMU_FW_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7P5_PS_MMU_FW_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7P5_PS_MMU_FW_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000d,
> +					0x0000000e,
> +					0x0000000f,
> +					0x00000010,
> +					0x00000010,
> +					0x00000010,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +				},
> +				.zlx_nr =3D IPU7P5_PS_ZLX_FW_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 1, 0, 0, 0, 0, 0, 0,
> 0,
> +				},
> +				.zlx_conf =3D {
> +					0x00000000,
> +					0x00010101,
> +					0x00010101,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +				},
> +				.uao_p_num =3D
> IPU7P5_PS_UAO_FW_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x0000002e,
> +					0x0000002f,
> +					0x00000030,
> +					0x00000031,
> +					0x00000032,
> +					0x00000033,
> +					0x00000034,
> +					0x0,
> +					0x0,
> +					0x0,
> +				},
> +			},
> +			{
> +				.name =3D "PS_DATA_RD",
> +				.offset =3D
> IPU7P5_PS_MMU_SRT_RD_OFFSET,
> +				.zlx_offset =3D
> IPU7P5_PS_ZLX_DATA_RD_OFFSET,
> +				.uao_offset =3D
> IPU7P5_PS_UAO_SRT_RD_OFFSET,
> +				.info_bits =3D 0x20003f01,
> +				.refill =3D 0x00002524,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU7P5_PS_MMU_SRT_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7P5_PS_MMU_SRT_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7P5_PS_MMU_SRT_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7P5_PS_MMU_SRT_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000b,
> +					0x0000000d,
> +					0x0000000f,
> +					0x00000013,
> +					0x00000017,
> +					0x00000019,
> +					0x0000001b,
> +					0x0000001d,
> +					0x0000001f,
> +					0x0000002b,
> +					0x00000033,
> +					0x0000003f,
> +					0x00000047,
> +					0x00000049,
> +					0x0000004b,
> +					0x0000004c,
> +					0x0000004d,
> +					0x0000004e,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +					0x00000020,
> +					0x00000022,
> +					0x00000024,
> +					0x00000026,
> +					0x00000028,
> +					0x0000002a,
> +				},
> +				.zlx_nr =3D IPU7P5_PS_ZLX_DATA_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 0, 0, 0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x00030303,
> +					0x00010101,
> +					0x00010101,
> +					0x00030202,
> +					0x00010101,
> +					0x00010101,
> +					0x00030303,
> +					0x00030303,
> +					0x00010101,
> +					0x00030800,
> +					0x00030500,
> +					0x00020101,
> +					0x00042000,
> +					0x00031000,
> +					0x00042000,
> +					0x00031000,
> +					0x00020400,
> +					0x00010101,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +				},
> +				.uao_p_num =3D
> IPU7P5_PS_UAO_SRT_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x0000001c,
> +					0x0000001d,
> +					0x0000001e,
> +					0x0000001f,
> +					0x00000020,
> +					0x00000021,
> +					0x00000022,
> +					0x00000023,
> +					0x00000024,
> +					0x00000025,
> +					0x00000026,
> +					0x00000027,
> +					0x00000028,
> +					0x00000029,
> +					0x0000002a,
> +					0x0000002b,
> +					0x0000002c,
> +					0x0000002d,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +				},
> +			},
> +			{
> +				.name =3D "PS_DATA_WR",
> +				.offset =3D
> IPU7P5_PS_MMU_SRT_WR_OFFSET,
> +				.zlx_offset =3D
> IPU7P5_PS_ZLX_DATA_WR_OFFSET,
> +				.uao_offset =3D
> IPU7P5_PS_UAO_SRT_WR_OFFSET,
> +				.info_bits =3D 0x20003d01,
> +				.refill =3D 0x00002120,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU7P5_PS_MMU_SRT_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7P5_PS_MMU_SRT_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7P5_PS_MMU_SRT_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7P5_PS_MMU_SRT_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000006,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +					0x00000020,
> +					0x00000022,
> +					0x00000024,
> +					0x00000028,
> +					0x0000002a,
> +					0x00000036,
> +					0x0000003e,
> +					0x00000040,
> +					0x00000042,
> +					0x0000004e,
> +					0x00000056,
> +					0x0000005c,
> +					0x00000068,
> +					0x00000070,
> +					0x00000076,
> +					0x00000077,
> +					0x00000078,
> +					0x00000079,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000006,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +					0x00000020,
> +					0x00000022,
> +					0x00000024,
> +					0x00000028,
> +					0x0000002a,
> +					0x00000036,
> +					0x0000003e,
> +					0x00000040,
> +					0x00000042,
> +					0x0000004e,
> +					0x00000056,
> +					0x0000005c,
> +					0x00000068,
> +					0x00000070,
> +					0x00000076,
> +					0x00000077,
> +					0x00000078,
> +					0x00000079,
> +				},
> +				.zlx_nr =3D IPU7P5_PS_ZLX_DATA_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f50,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					0, 0, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 0, 0, 0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x00010102,
> +					0x00030103,
> +					0x00030103,
> +					0x00010101,
> +					0x00010101,
> +					0x00030101,
> +					0x00010101,
> +					0x38010101,
> +					0x00000000,
> +					0x00000000,
> +					0x38010101,
> +					0x38010101,
> +					0x38010101,
> +					0x38010101,
> +					0x38010101,
> +					0x38010101,
> +					0x00030303,
> +					0x00010101,
> +					0x00042000,
> +					0x00031000,
> +					0x00010101,
> +					0x00010101,
> +					0x00042000,
> +					0x00031000,
> +					0x00031000,
> +					0x00042000,
> +					0x00031000,
> +					0x00031000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +				},
> +				.uao_p_num =3D
> IPU7P5_PS_UAO_SRT_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000000,
> +					0x00000001,
> +					0x00000002,
> +					0x00000003,
> +					0x00000004,
> +					0x00000005,
> +					0x00000006,
> +					0x00000007,
> +					0x00000008,
> +					0x00000009,
> +					0x0000000a,
> +					0x0000000b,
> +					0x0000000c,
> +					0x0000000d,
> +					0x0000000e,
> +					0x0000000f,
> +					0x00000010,
> +					0x00000011,
> +					0x00000012,
> +					0x00000013,
> +					0x00000014,
> +					0x00000015,
> +					0x00000016,
> +					0x00000017,
> +					0x00000018,
> +					0x00000019,
> +					0x0000001a,
> +					0x0000001b,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +				},
> +			},
> +		},
> +		.dmem_offset =3D IPU_PSYS_DMEM_OFFSET,
> +	},
> +};
> +
> +static struct ipu_isys_internal_pdata ipu7_isys_ipdata =3D {
> +	.csi2 =3D {
> +		.gpreg =3D IS_IO_CSI2_GPREGS_BASE,
> +	},
> +	.hw_variant =3D {
> +		.offset =3D IPU_UNIFIED_OFFSET,
> +		.nr_mmus =3D IPU7_IS_MMU_NUM,
> +		.mmu_hw =3D {
> +			{
> +				.name =3D "IS_FW_RD",
> +				.offset =3D IPU7_IS_MMU_FW_RD_OFFSET,
> +				.zlx_offset =3D
> IPU7_IS_ZLX_UC_RD_OFFSET,
> +				.uao_offset =3D
> IPU7_IS_UAO_UC_RD_OFFSET,
> +				.info_bits =3D 0x20006701,
> +				.refill =3D 0x00002726,
> +				.collapse_en_bitmap =3D 0x0,
> +				.l1_block =3D
> IPU7_IS_MMU_FW_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7_IS_MMU_FW_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7_IS_MMU_FW_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7_IS_MMU_FW_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x8, 0xa,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4,
> +				},
> +				.zlx_nr =3D IPU7_IS_ZLX_UC_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					0, 0, 0, 0
> +				},
> +				.zlx_conf =3D {
> +					0x0, 0x0, 0x0, 0x0,
> +				},
> +				.uao_p_num =3D
> IPU7_IS_UAO_UC_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000061,
> +					0x00000064,
> +					0x00000065,
> +				},
> +			},
> +			{
> +				.name =3D "IS_FW_WR",
> +				.offset =3D IPU7_IS_MMU_FW_WR_OFFSET,
> +				.zlx_offset =3D
> IPU7_IS_ZLX_UC_WR_OFFSET,
> +				.uao_offset =3D
> IPU7_IS_UAO_UC_WR_OFFSET,
> +				.info_bits =3D 0x20006801,
> +				.refill =3D 0x00002524,
> +				.collapse_en_bitmap =3D 0x0,
> +				.l1_block =3D
> IPU7_IS_MMU_FW_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7_IS_MMU_FW_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7_IS_MMU_FW_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7_IS_MMU_FW_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x8, 0xa,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4,
> +				},
> +				.zlx_nr =3D IPU7_IS_ZLX_UC_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 1, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x0,
> +					0x00010101,
> +					0x00010101,
> +				},
> +				.uao_p_num =3D
> IPU7_IS_UAO_UC_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000061,
> +					0x00000062,
> +					0x00000063,
> +				},
> +			},
> +			{
> +				.name =3D "IS_DATA_WR_ISOC",
> +				.offset =3D IPU7_IS_MMU_M0_OFFSET,
> +				.zlx_offset =3D IPU7_IS_ZLX_M0_OFFSET,
> +				.uao_offset =3D
> IPU7_IS_UAO_M0_WR_OFFSET,
> +				.info_bits =3D 0x20006601,
> +				.refill =3D 0x00002120,
> +				.collapse_en_bitmap =3D 0x0,
> +				.l1_block =3D
> IPU7_IS_MMU_M0_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7_IS_MMU_M0_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7_IS_MMU_M0_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7_IS_MMU_M0_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x3, 0x6, 0x8, 0xa,
> 0xc, 0xe, 0x10,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4, 0x6, 0x8,
> 0xa, 0xc, 0xe,
> +				},
> +				.zlx_nr =3D IPU7_IS_ZLX_M0_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f10,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +				},
> +				.zlx_conf =3D {
> +					0x00010103,
> +					0x00010103,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +				},
> +				.uao_p_num =3D
> IPU7_IS_UAO_M0_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000049,
> +					0x0000004a,
> +					0x0000004b,
> +					0x0000004c,
> +					0x0000004d,
> +					0x0000004e,
> +					0x0000004f,
> +					0x00000050,
> +				},
> +			},
> +			{
> +				.name =3D "IS_DATA_WR_SNOOP",
> +				.offset =3D IPU7_IS_MMU_M1_OFFSET,
> +				.zlx_offset =3D IPU7_IS_ZLX_M1_OFFSET,
> +				.uao_offset =3D
> IPU7_IS_UAO_M1_WR_OFFSET,
> +				.info_bits =3D 0x20006901,
> +				.refill =3D 0x00002322,
> +				.collapse_en_bitmap =3D 0x0,
> +				.l1_block =3D
> IPU7_IS_MMU_M1_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7_IS_MMU_M1_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7_IS_MMU_M1_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7_IS_MMU_M1_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x3, 0x6, 0x9, 0xc,
> +					0xe, 0x10, 0x12, 0x14, 0x16,
> +					0x18, 0x1a, 0x1c, 0x1e,
> 0x20,
> +					0x22,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4, 0x6, 0x8,
> +					0xa, 0xc, 0xe, 0x10, 0x12,
> +					0x14, 0x16, 0x18, 0x1a,
> 0x1c,
> +					0x1e,
> +				},
> +				.zlx_nr =3D IPU7_IS_ZLX_M1_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +				},
> +				.zlx_conf =3D {
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010103,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +				},
> +				.uao_p_num =3D
> IPU7_IS_UAO_M1_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000051,
> +					0x00000052,
> +					0x00000053,
> +					0x00000054,
> +					0x00000055,
> +					0x00000056,
> +					0x00000057,
> +					0x00000058,
> +					0x00000059,
> +					0x0000005a,
> +					0x0000005b,
> +					0x0000005c,
> +					0x0000005d,
> +					0x0000005e,
> +					0x0000005f,
> +					0x00000060,
> +				},
> +			},
> +		},
> +		.cdc_fifos =3D 3,
> +		.cdc_fifo_threshold =3D {6, 8, 2},
> +		.dmem_offset =3D IPU_ISYS_DMEM_OFFSET,
> +		.spc_offset =3D IPU_ISYS_SPC_OFFSET,
> +	},
> +	.isys_dma_overshoot =3D IPU_ISYS_OVERALLOC_MIN,
> +};
> +
> +static struct ipu_psys_internal_pdata ipu7_psys_ipdata =3D {
> +	.hw_variant =3D {
> +		.offset =3D IPU_UNIFIED_OFFSET,
> +		.nr_mmus =3D IPU7_PS_MMU_NUM,
> +		.mmu_hw =3D {
> +			{
> +				.name =3D "PS_FW_RD",
> +				.offset =3D IPU7_PS_MMU_FW_RD_OFFSET,
> +				.zlx_offset =3D
> IPU7_PS_ZLX_FW_RD_OFFSET,
> +				.uao_offset =3D
> IPU7_PS_UAO_FW_RD_OFFSET,
> +				.info_bits =3D 0x20004801,
> +				.refill =3D 0x00002726,
> +				.collapse_en_bitmap =3D 0x0,
> +				.l1_block =3D
> IPU7_PS_MMU_FW_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7_PS_MMU_FW_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7_PS_MMU_FW_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7_PS_MMU_FW_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0, 0x8, 0xa, 0xc, 0xd,
> +					0xf, 0x11, 0x12, 0x13, 0x14,
> +					0x16, 0x18, 0x19, 0x1a,
> 0x1a,
> +					0x1a, 0x1a, 0x1a, 0x1a,
> 0x1a,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4, 0x6, 0x8,
> +					0xa, 0xc, 0xe, 0x10, 0x12,
> +					0x14, 0x16, 0x18, 0x1a,
> 0x1c,
> +					0x1e, 0x20, 0x22, 0x24,
> 0x26,
> +				},
> +				.zlx_nr =3D IPU7_PS_ZLX_FW_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					0, 0, 0, 0, 0, 0, 0, 0,
> +					0, 0, 0, 0, 0, 0, 0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x0,
> +				},
> +				.uao_p_num =3D
> IPU7_PS_UAO_FW_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000036,
> +					0x0000003d,
> +					0x0000003e,
> +					0x00000039,
> +					0x0000003f,
> +					0x00000040,
> +					0x00000041,
> +					0x0000003a,
> +					0x0000003b,
> +					0x00000042,
> +					0x00000043,
> +					0x00000044,
> +					0x0000003c,
> +				},
> +			},
> +			{
> +				.name =3D "PS_FW_WR",
> +				.offset =3D IPU7_PS_MMU_FW_WR_OFFSET,
> +				.zlx_offset =3D
> IPU7_PS_ZLX_FW_WR_OFFSET,
> +				.uao_offset =3D
> IPU7_PS_UAO_FW_WR_OFFSET,
> +				.info_bits =3D 0x20004601,
> +				.refill =3D 0x00002322,
> +				.collapse_en_bitmap =3D 0x0,
> +				.l1_block =3D
> IPU7_PS_MMU_FW_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7_PS_MMU_FW_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7_PS_MMU_FW_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7_PS_MMU_FW_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0, 0x8, 0xa, 0xc, 0xd,
> +					0xe, 0xf, 0x10, 0x10, 0x10,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4, 0x6, 0x8,
> +					0xa, 0xc, 0xe, 0x10, 0x12,
> +				},
> +				.zlx_nr =3D IPU7_PS_ZLX_FW_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 1, 0, 0, 0, 0, 0,
> +					0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x0,
> +					0x00010101,
> +					0x00010101,
> +				},
> +				.uao_p_num =3D
> IPU7_PS_UAO_FW_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000036,
> +					0x00000037,
> +					0x00000038,
> +					0x00000039,
> +					0x0000003a,
> +					0x0000003b,
> +					0x0000003c,
> +				},
> +			},
> +			{
> +				.name =3D "PS_DATA_RD",
> +				.offset =3D IPU7_PS_MMU_SRT_RD_OFFSET,
> +				.zlx_offset =3D
> IPU7_PS_ZLX_DATA_RD_OFFSET,
> +				.uao_offset =3D
> IPU7_PS_UAO_SRT_RD_OFFSET,
> +				.info_bits =3D 0x20004701,
> +				.refill =3D 0x00002120,
> +				.collapse_en_bitmap =3D 0x0,
> +				.l1_block =3D
> IPU7_PS_MMU_SRT_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7_PS_MMU_SRT_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7_PS_MMU_SRT_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7_PS_MMU_SRT_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x4, 0x6, 0x8, 0xb,
> +					0xd, 0xf, 0x11, 0x13, 0x15,
> +					0x17, 0x23, 0x2b, 0x37,
> 0x3f,
> +					0x41, 0x43, 0x44, 0x45,
> 0x46,
> +					0x47, 0x48, 0x49, 0x4a,
> 0x4b,
> +					0x4c, 0x4d, 0x4e, 0x4f,
> 0x50,
> +					0x51, 0x52, 0x53, 0x55,
> 0x57,
> +					0x59, 0x5b, 0x5d, 0x5f,
> 0x61,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4, 0x6, 0x8,
> +					0xa, 0xc, 0xe, 0x10, 0x12,
> +					0x14, 0x16, 0x18, 0x1a,
> 0x1c,
> +					0x1e, 0x20, 0x22, 0x24,
> 0x26,
> +					0x28, 0x2a, 0x2c, 0x2e,
> 0x30,
> +					0x32, 0x34, 0x36, 0x38,
> 0x3a,
> +					0x3c, 0x3e, 0x40, 0x42,
> 0x44,
> +					0x46, 0x48, 0x4a, 0x4c,
> 0x4e,
> +				},
> +				.zlx_nr =3D IPU7_PS_ZLX_DATA_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					0, 0, 0, 0, 0, 0, 0, 0,
> +					0, 0, 0, 0, 0, 0, 0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x00030303,
> +					0x00010101,
> +					0x00010101,
> +					0x00030202,
> +					0x00010101,
> +					0x00010101,
> +					0x00010101,
> +					0x00030800,
> +					0x00030500,
> +					0x00020101,
> +					0x00042000,
> +					0x00031000,
> +					0x00042000,
> +					0x00031000,
> +					0x00020400,
> +					0x00010101,
> +				},
> +				.uao_p_num =3D
> IPU7_PS_UAO_SRT_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000022,
> +					0x00000023,
> +					0x00000024,
> +					0x00000025,
> +					0x00000026,
> +					0x00000027,
> +					0x00000028,
> +					0x00000029,
> +					0x0000002a,
> +					0x0000002b,
> +					0x0000002c,
> +					0x0000002d,
> +					0x0000002e,
> +					0x0000002f,
> +					0x00000030,
> +					0x00000031,
> +					0x0, 0x0, 0x0, 0x0, 0x0,
> 0x0, 0x0, 0x0,
> +					0x0, 0x0, 0x0, 0x0, 0x0,
> 0x0, 0x0, 0x0,
> +					0x0000001e,
> +					0x0000001f,
> +					0x00000020,
> +					0x00000021,
> +					0x00000032,
> +					0x00000033,
> +					0x00000034,
> +					0x00000035,
> +				},
> +			},
> +			{
> +				.name =3D "PS_DATA_WR",
> +				.offset =3D IPU7_PS_MMU_SRT_WR_OFFSET,
> +				.zlx_offset =3D
> IPU7_PS_ZLX_DATA_WR_OFFSET,
> +				.uao_offset =3D
> IPU7_PS_UAO_SRT_WR_OFFSET,
> +				.info_bits =3D 0x20004501,
> +				.refill =3D 0x00002120,
> +				.collapse_en_bitmap =3D 0x0,
> +				.l1_block =3D
> IPU7_PS_MMU_SRT_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU7_PS_MMU_SRT_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU7_PS_MMU_SRT_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU7_PS_MMU_SRT_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x2, 0x6, 0xa, 0xc,
> +					0xe, 0x10, 0x12, 0x14, 0x16,
> +					0x18, 0x1a, 0x1c, 0x1e,
> 0x20,
> +					0x22, 0x24, 0x26, 0x32,
> 0x3a,
> +					0x3c, 0x3e, 0x4a, 0x52,
> 0x58,
> +					0x64, 0x6c, 0x72, 0x7e,
> 0x86,
> +					0x8c, 0x8d, 0x8e, 0x8f,
> 0x90,
> +					0x91, 0x92, 0x94, 0x96,
> 0x98,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4, 0x6, 0x8,
> +					0xa, 0xc, 0xe, 0x10, 0x12,
> +					0x14, 0x16, 0x18, 0x1a,
> 0x1c,
> +					0x1e, 0x20, 0x22, 0x24,
> 0x26,
> +					0x28, 0x2a, 0x2c, 0x2e,
> 0x30,
> +					0x32, 0x34, 0x36, 0x38,
> 0x3a,
> +					0x3c, 0x3e, 0x40, 0x42,
> 0x44,
> +					0x46, 0x48, 0x4a, 0x4c,
> 0x4e,
> +				},
> +				.zlx_nr =3D IPU7_PS_ZLX_DATA_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f50,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					0, 0, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x00010102,
> +					0x00030103,
> +					0x00030103,
> +					0x00010101,
> +					0x00010101,
> +					0x00030101,
> +					0x00010101,
> +					0x38010101,
> +					0x0,
> +					0x0,
> +					0x38010101,
> +					0x38010101,
> +					0x38010101,
> +					0x38010101,
> +					0x38010101,
> +					0x38010101,
> +					0x00010101,
> +					0x00042000,
> +					0x00031000,
> +					0x00010101,
> +					0x00010101,
> +					0x00042000,
> +					0x00031000,
> +					0x00031000,
> +					0x00042000,
> +					0x00031000,
> +					0x00031000,
> +					0x00042000,
> +					0x00031000,
> +					0x00031000,
> +					0x0,
> +					0x0,
> +				},
> +				.uao_p_num =3D
> IPU7_PS_UAO_SRT_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000000,
> +					0x00000001,
> +					0x00000002,
> +					0x00000003,
> +					0x00000004,
> +					0x00000005,
> +					0x00000006,
> +					0x00000007,
> +					0x00000008,
> +					0x00000009,
> +					0x0000000a,
> +					0x0000000b,
> +					0x0000000c,
> +					0x0000000d,
> +					0x0000000e,
> +					0x0000000f,
> +					0x00000010,
> +					0x00000011,
> +					0x00000012,
> +					0x00000013,
> +					0x00000014,
> +					0x00000015,
> +					0x00000016,
> +					0x00000017,
> +					0x00000018,
> +					0x00000019,
> +					0x0000001a,
> +					0x0000001b,
> +					0x0000001c,
> +					0x0000001d,
> +					0x0, 0x0, 0x0, 0x0, 0x0,
> 0x0,
> +					0x0000001e,
> +					0x0000001f,
> +					0x00000020,
> +					0x00000021,
> +				},
> +			},
> +		},
> +		.dmem_offset =3D IPU_PSYS_DMEM_OFFSET,
> +	},
> +};
> +
> +static struct ipu_isys_internal_pdata ipu8_isys_ipdata =3D {
> +	.csi2 =3D {
> +		.gpreg =3D IPU8_IS_IO_CSI2_GPREGS_BASE,
> +	},
> +	.hw_variant =3D {
> +		.offset =3D IPU_UNIFIED_OFFSET,
> +		.nr_mmus =3D IPU8_IS_MMU_NUM,
> +		.mmu_hw =3D {
> +			{
> +				.name =3D "IS_FW_RD",
> +				.offset =3D IPU8_IS_MMU_FW_RD_OFFSET,
> +				.zlx_offset =3D
> IPU8_IS_ZLX_UC_RD_OFFSET,
> +				.uao_offset =3D
> IPU8_IS_UAO_UC_RD_OFFSET,
> +				.info_bits =3D 0x20005101,
> +				.refill =3D 0x00002726,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_IS_MMU_FW_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_IS_MMU_FW_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_IS_MMU_FW_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_IS_MMU_FW_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x8, 0xa,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4,
> +				},
> +				.zlx_nr =3D IPU8_IS_ZLX_UC_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 0, 0
> +				},
> +				.zlx_conf =3D {
> +					0, 2, 0, 0
> +				},
> +				.uao_p_num =3D
> IPU8_IS_UAO_UC_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000049,
> +					0x0000004c,
> +					0x0000004d,
> +					0x00000000,
> +				},
> +			},
> +			{
> +				.name =3D "IS_FW_WR",
> +				.offset =3D IPU8_IS_MMU_FW_WR_OFFSET,
> +				.zlx_offset =3D
> IPU8_IS_ZLX_UC_WR_OFFSET,
> +				.uao_offset =3D
> IPU8_IS_UAO_UC_WR_OFFSET,
> +				.info_bits =3D 0x20005001,
> +				.refill =3D 0x00002524,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_IS_MMU_FW_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_IS_MMU_FW_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_IS_MMU_FW_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_IS_MMU_FW_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x0, 0x8, 0xa,
> +				},
> +				.l2_block_sz =3D {
> +					0x0, 0x2, 0x4,
> +				},
> +				.zlx_nr =3D IPU8_IS_ZLX_UC_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 1, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x0,
> +					0x2,
> +					0x2,
> +					0x0,
> +				},
> +				.uao_p_num =3D
> IPU8_IS_UAO_UC_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000049,
> +					0x0000004a,
> +					0x0000004b,
> +					0x00000000,
> +				},
> +			},
> +			{
> +				.name =3D "IS_DATA_WR_ISOC",
> +				.offset =3D IPU8_IS_MMU_M0_OFFSET,
> +				.zlx_offset =3D IPU8_IS_ZLX_M0_OFFSET,
> +				.uao_offset =3D
> IPU8_IS_UAO_M0_WR_OFFSET,
> +				.info_bits =3D 0x20004e01,
> +				.refill =3D 0x00002120,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_IS_MMU_M0_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_IS_MMU_M0_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_IS_MMU_M0_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_IS_MMU_M0_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.zlx_nr =3D IPU8_IS_ZLX_M0_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f10,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +				},
> +				.zlx_conf =3D {
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +				},
> +				.uao_p_num =3D
> IPU8_IS_UAO_M0_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x0000003b,
> +					0x0000003c,
> +					0x0000003d,
> +					0x0000003e,
> +					0x0000003b,
> +					0x0000003c,
> +					0x0000003d,
> +					0x0000003e,
> +					0x0000003b,
> +					0x0000003c,
> +					0x0000003d,
> +					0x0000003e,
> +					0x0000003b,
> +					0x0000003c,
> +					0x0000003d,
> +					0x0000003e,
> +				},
> +			},
> +			{
> +				.name =3D "IS_DATA_WR_SNOOP",
> +				.offset =3D IPU8_IS_MMU_M1_OFFSET,
> +				.zlx_offset =3D IPU8_IS_ZLX_M1_OFFSET,
> +				.uao_offset =3D
> IPU8_IS_UAO_M1_WR_OFFSET,
> +				.info_bits =3D 0x20004f01,
> +				.refill =3D 0x00002322,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_IS_MMU_M1_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_IS_MMU_M1_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_IS_MMU_M1_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_IS_MMU_M1_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +				},
> +				.zlx_nr =3D IPU8_IS_ZLX_M1_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +				},
> +				.zlx_conf =3D {
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +				},
> +				.uao_p_num =3D
> IPU8_IS_UAO_M1_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x0000003f,
> +					0x00000040,
> +					0x00000041,
> +					0x00000042,
> +					0x0000003f,
> +					0x00000040,
> +					0x00000041,
> +					0x00000042,
> +					0x0000003f,
> +					0x00000040,
> +					0x00000041,
> +					0x00000042,
> +					0x0000003f,
> +					0x00000040,
> +					0x00000041,
> +					0x00000042,
> +				},
> +			},
> +			{
> +				.name =3D "IS_UPIPE",
> +				.offset =3D IPU8_IS_MMU_UPIPE_OFFSET,
> +				.zlx_offset =3D
> IPU8_IS_ZLX_UPIPE_OFFSET,
> +				.uao_offset =3D
> IPU8_IS_UAO_UPIPE_OFFSET,
> +				.info_bits =3D 0x20005201,
> +				.refill =3D 0x00002928,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_IS_MMU_UPIPE_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_IS_MMU_UPIPE_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_IS_MMU_UPIPE_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_IS_MMU_UPIPE_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +				},
> +				.zlx_nr =3D IPU8_IS_ZLX_UPIPE_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1,
> +				},
> +				.zlx_conf =3D {
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +					0x3,
> +				},
> +				.uao_p_num =3D
> IPU8_IS_UAO_UPIPE_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000043,
> +					0x00000044,
> +					0x00000045,
> +					0x00000046,
> +					0x00000047,
> +					0x00000048,
> +				},
> +			},
> +		},
> +		.cdc_fifos =3D 3,
> +		.cdc_fifo_threshold =3D {6, 8, 2},
> +		.dmem_offset =3D IPU_ISYS_DMEM_OFFSET,
> +		.spc_offset =3D IPU_ISYS_SPC_OFFSET,
> +	},
> +	.isys_dma_overshoot =3D IPU_ISYS_OVERALLOC_MIN,
> +};
> +
> +static struct ipu_psys_internal_pdata ipu8_psys_ipdata =3D {
> +	.hw_variant =3D {
> +		.offset =3D IPU_UNIFIED_OFFSET,
> +		.nr_mmus =3D IPU8_PS_MMU_NUM,
> +		.mmu_hw =3D {
> +			{
> +				.name =3D "PS_FW_RD",
> +				.offset =3D IPU8_PS_MMU_FW_RD_OFFSET,
> +				.zlx_offset =3D
> IPU8_PS_ZLX_FW_RD_OFFSET,
> +				.uao_offset =3D
> IPU8_PS_UAO_FW_RD_OFFSET,
> +				.info_bits =3D 0x20003a01,
> +				.refill =3D 0x00002726,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_PS_MMU_FW_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_PS_MMU_FW_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_PS_MMU_FW_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_PS_MMU_FW_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x00000018,
> +					0x00000018,
> +					0x00000018,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +				},
> +				.zlx_nr =3D IPU8_PS_ZLX_FW_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 0, 0, 1, 1, 0, 0,
> +					0, 0, 0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x0,
> +					0x2,
> +					0x0,
> +					0x0,
> +					0x2,
> +					0x2,
> +					0x0,
> +					0x0,
> +					0x0,
> +					0x0,
> +					0x0,
> +					0x0,
> +				},
> +				.uao_p_num =3D
> IPU8_PS_UAO_FW_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x0000002d,
> +					0x00000032,
> +					0x00000033,
> +					0x00000030,
> +					0x00000034,
> +					0x00000035,
> +					0x00000036,
> +					0x00000031,
> +					0x0,
> +					0x0,
> +					0x0,
> +					0x0,
> +				},
> +			},
> +			{
> +				.name =3D "PS_FW_WR",
> +				.offset =3D IPU8_PS_MMU_FW_WR_OFFSET,
> +				.zlx_offset =3D
> IPU8_PS_ZLX_FW_WR_OFFSET,
> +				.uao_offset =3D
> IPU8_PS_UAO_FW_WR_OFFSET,
> +				.info_bits =3D 0x20003901,
> +				.refill =3D 0x00002524,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_PS_MMU_FW_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_PS_MMU_FW_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_PS_MMU_FW_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_PS_MMU_FW_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000010,
> +					0x00000010,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +				},
> +				.zlx_nr =3D IPU8_PS_ZLX_FW_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f20,
> +				},
> +				.zlx_en =3D {
> +					0, 1, 1, 0, 0, 0, 0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x0, 0x2, 0x2, 0x0,
> +					0x0, 0x0, 0x0, 0x0,
> +				},
> +				.uao_p_num =3D
> IPU8_PS_UAO_FW_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x0000002d,
> +					0x0000002e,
> +					0x0000002f,
> +					0x00000030,
> +					0x00000031,
> +					0x0,
> +					0x0,
> +					0x0,
> +				},
> +			},
> +			{
> +				.name =3D "PS_DATA_RD",
> +				.offset =3D IPU8_PS_MMU_SRT_RD_OFFSET,
> +				.zlx_offset =3D
> IPU8_PS_ZLX_DATA_RD_OFFSET,
> +				.uao_offset =3D
> IPU8_PS_UAO_SRT_RD_OFFSET,
> +				.info_bits =3D 0x20003801,
> +				.refill =3D 0x00002322,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_PS_MMU_SRT_RD_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_PS_MMU_SRT_RD_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_PS_MMU_SRT_RD_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_PS_MMU_SRT_RD_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000014,
> +					0x00000018,
> +					0x0000001c,
> +					0x0000001e,
> +					0x00000022,
> +					0x00000024,
> +					0x00000026,
> +					0x00000028,
> +					0x0000002a,
> +					0x0000002c,
> +					0x0000002e,
> +					0x00000030,
> +					0x00000032,
> +					0x00000036,
> +					0x0000003a,
> +					0x0000003c,
> +					0x0000003c,
> +					0x0000003c,
> +					0x0000003c,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +					0x00000020,
> +					0x00000022,
> +					0x00000024,
> +					0x00000026,
> +					0x00000028,
> +					0x0000002a,
> +					0x0000002c,
> +					0x0000002e,
> +					0x00000030,
> +					0x00000032,
> +				},
> +				.zlx_nr =3D IPU8_PS_ZLX_DATA_RD_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f30,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 0, 0,
> +					0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x6, 0x3, 0x3, 0x6,
> +					0x2, 0x2, 0x6, 0x6,
> +					0x6, 0x3, 0x6, 0x3,
> +					0x3, 0x2, 0x2, 0x2,
> +					0x2, 0x2, 0x2, 0x6,
> +					0x6, 0x3, 0x0, 0x0,
> +					0x0, 0x0,
> +				},
> +				.uao_p_num =3D
> IPU8_PS_UAO_SRT_RD_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000017,
> +					0x00000018,
> +					0x00000019,
> +					0x0000001a,
> +					0x0000001b,
> +					0x0000001c,
> +					0x0000001d,
> +					0x0000001e,
> +					0x0000001f,
> +					0x00000020,
> +					0x00000021,
> +					0x00000022,
> +					0x00000023,
> +					0x00000024,
> +					0x00000025,
> +					0x00000026,
> +					0x00000027,
> +					0x00000028,
> +					0x00000029,
> +					0x0000002a,
> +					0x0000002b,
> +					0x0000002c,
> +					0x0,
> +					0x0,
> +					0x0,
> +					0x0,
> +				},
> +			},
> +			{
> +				.name =3D "PS_DATA_WR",
> +				.offset =3D IPU8_PS_MMU_SRT_WR_OFFSET,
> +				.zlx_offset =3D
> IPU8_PS_ZLX_DATA_WR_OFFSET,
> +				.uao_offset =3D
> IPU8_PS_UAO_SRT_WR_OFFSET,
> +				.info_bits =3D 0x20003701,
> +				.refill =3D 0x00002120,
> +				.collapse_en_bitmap =3D 0x1,
> +				.at_sp_arb_cfg =3D 0x1,
> +				.l1_block =3D
> IPU8_PS_MMU_SRT_WR_L1_BLOCKNR_REG,
> +				.l2_block =3D
> IPU8_PS_MMU_SRT_WR_L2_BLOCKNR_REG,
> +				.nr_l1streams =3D
> IPU8_PS_MMU_SRT_WR_STREAM_NUM,
> +				.nr_l2streams =3D
> IPU8_PS_MMU_SRT_WR_STREAM_NUM,
> +				.l1_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001c,
> +					0x0000001e,
> +					0x00000022,
> +					0x00000024,
> +					0x00000028,
> +					0x0000002a,
> +					0x0000002e,
> +					0x00000030,
> +					0x00000032,
> +					0x00000036,
> +					0x00000038,
> +					0x0000003a,
> +					0x0000003a,
> +					0x0000003a,
> +				},
> +				.l2_block_sz =3D {
> +					0x00000000,
> +					0x00000002,
> +					0x00000004,
> +					0x00000006,
> +					0x00000008,
> +					0x0000000a,
> +					0x0000000c,
> +					0x0000000e,
> +					0x00000010,
> +					0x00000012,
> +					0x00000014,
> +					0x00000016,
> +					0x00000018,
> +					0x0000001a,
> +					0x0000001c,
> +					0x0000001e,
> +					0x00000020,
> +					0x00000022,
> +					0x00000024,
> +					0x00000026,
> +					0x00000028,
> +					0x0000002a,
> +					0x0000002c,
> +					0x0000002e,
> +					0x00000030,
> +					0x00000032,
> +				},
> +				.zlx_nr =3D IPU8_PS_ZLX_DATA_WR_NUM,
> +				.zlx_axi_pool =3D {
> +					0x00000f50,
> +				},
> +				.zlx_en =3D {
> +					1, 1, 1, 0, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 1,
> +					1, 1, 1, 1, 1, 1, 1, 0,
> +					0, 0,
> +				},
> +				.zlx_conf =3D {
> +					0x3,
> +					0x6,
> +					0x38000002,
> +					0x38000000,
> +					0x3,
> +					0x38000002,
> +					0x38000002,
> +					0x38000002,
> +					0x38000002,
> +					0x38000002,
> +					0x38000002,
> +					0x6,
> +					0x3,
> +					0x6,
> +					0x3,
> +					0x6,
> +					0x3,
> +					0x6,
> +					0x3,
> +					0x3,
> +					0x6,
> +					0x3,
> +					0x3,
> +					0x0,
> +					0x0,
> +					0x0,
> +				},
> +				.uao_p_num =3D
> IPU8_PS_UAO_SRT_WR_PLANENUM,
> +				.uao_p2tlb =3D {
> +					0x00000000,
> +					0x00000001,
> +					0x00000002,
> +					0x00000003,
> +					0x00000004,
> +					0x00000005,
> +					0x00000006,
> +					0x00000007,
> +					0x00000008,
> +					0x00000009,
> +					0x0000000a,
> +					0x0000000b,
> +					0x0000000c,
> +					0x0000000d,
> +					0x0000000e,
> +					0x0000000f,
> +					0x00000010,
> +					0x00000011,
> +					0x00000012,
> +					0x00000013,
> +					0x00000014,
> +					0x00000015,
> +					0x00000016,
> +					0x00000000,
> +					0x00000000,
> +					0x00000000,
> +				},
> +			},
> +		},
> +		.dmem_offset =3D IPU_PSYS_DMEM_OFFSET,
> +	},
> +};
> +
> +static const struct ipu_buttress_ctrl ipu7_isys_buttress_ctrl =3D {
> +	.subsys_id =3D IPU_IS,
> +	.ratio =3D IPU7_IS_FREQ_CTL_DEFAULT_RATIO,
> +	.ratio_shift =3D IPU_FREQ_CTL_RATIO_SHIFT,
> +	.cdyn =3D IPU_FREQ_CTL_CDYN,
> +	.cdyn_shift =3D IPU_FREQ_CTL_CDYN_SHIFT,
> +	.freq_ctl =3D BUTTRESS_REG_IS_WORKPOINT_REQ,
> +	.pwr_sts_shift =3D IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT,
> +	.pwr_sts_mask =3D IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK,
> +	.pwr_sts_on =3D IPU_BUTTRESS_PWR_STATE_UP_DONE,
> +	.pwr_sts_off =3D IPU_BUTTRESS_PWR_STATE_DN_DONE,
> +	.ovrd_clk =3D BUTTRESS_OVERRIDE_IS_CLK,
> +	.own_clk_ack =3D BUTTRESS_OWN_ACK_IS_CLK,
> +};
> +
> +static const struct ipu_buttress_ctrl ipu7_psys_buttress_ctrl =3D {
> +	.subsys_id =3D IPU_PS,
> +	.ratio =3D IPU7_PS_FREQ_CTL_DEFAULT_RATIO,
> +	.ratio_shift =3D IPU_FREQ_CTL_RATIO_SHIFT,
> +	.cdyn =3D IPU_FREQ_CTL_CDYN,
> +	.cdyn_shift =3D IPU_FREQ_CTL_CDYN_SHIFT,
> +	.freq_ctl =3D BUTTRESS_REG_PS_WORKPOINT_REQ,
> +	.pwr_sts_shift =3D IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT,
> +	.pwr_sts_mask =3D IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK,
> +	.pwr_sts_on =3D IPU_BUTTRESS_PWR_STATE_UP_DONE,
> +	.pwr_sts_off =3D IPU_BUTTRESS_PWR_STATE_DN_DONE,
> +	.ovrd_clk =3D BUTTRESS_OVERRIDE_PS_CLK,
> +	.own_clk_ack =3D BUTTRESS_OWN_ACK_PS_CLK,
> +};
> +
> +static const struct ipu_buttress_ctrl ipu8_isys_buttress_ctrl =3D {
> +	.subsys_id =3D IPU_IS,
> +	.ratio =3D IPU8_IS_FREQ_CTL_DEFAULT_RATIO,
> +	.ratio_shift =3D IPU_FREQ_CTL_RATIO_SHIFT,
> +	.cdyn =3D IPU_FREQ_CTL_CDYN,
> +	.cdyn_shift =3D IPU_FREQ_CTL_CDYN_SHIFT,
> +	.freq_ctl =3D BUTTRESS_REG_IS_WORKPOINT_REQ,
> +	.pwr_sts_shift =3D IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT,
> +	.pwr_sts_mask =3D IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK,
> +	.pwr_sts_on =3D IPU_BUTTRESS_PWR_STATE_UP_DONE,
> +	.pwr_sts_off =3D IPU_BUTTRESS_PWR_STATE_DN_DONE,
> +};
> +
> +static const struct ipu_buttress_ctrl ipu8_psys_buttress_ctrl =3D {
> +	.subsys_id =3D IPU_PS,
> +	.ratio =3D IPU8_PS_FREQ_CTL_DEFAULT_RATIO,
> +	.ratio_shift =3D IPU_FREQ_CTL_RATIO_SHIFT,
> +	.cdyn =3D IPU_FREQ_CTL_CDYN,
> +	.cdyn_shift =3D IPU_FREQ_CTL_CDYN_SHIFT,
> +	.freq_ctl =3D BUTTRESS_REG_PS_WORKPOINT_REQ,
> +	.pwr_sts_shift =3D IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT,
> +	.pwr_sts_mask =3D IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK,
> +	.pwr_sts_on =3D IPU_BUTTRESS_PWR_STATE_UP_DONE,
> +	.pwr_sts_off =3D IPU_BUTTRESS_PWR_STATE_DN_DONE,
> +	.own_clk_ack =3D BUTTRESS_OWN_ACK_PS_PLL,
> +};
> +
> +void ipu_internal_pdata_init(struct ipu_isys_internal_pdata
> *isys_ipdata,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct ipu_psys_internal_pdata
> *psys_ipdata)
> +{
> +	isys_ipdata->csi2.nports =3D ARRAY_SIZE(ipu7_csi_offsets);
> +	isys_ipdata->csi2.offsets =3D ipu7_csi_offsets;
> +	isys_ipdata->num_parallel_streams =3D IPU7_ISYS_NUM_STREAMS;
> +	psys_ipdata->hw_variant.spc_offset =3D IPU7_PSYS_SPC_OFFSET;
> +}
> +
> +static int ipu7_isys_check_fwnode_graph(struct fwnode_handle
> *fwnode)
> +{
> +	struct fwnode_handle *endpoint;
> +
> +	if (IS_ERR_OR_NULL(fwnode))
> +		return -EINVAL;
> +
> +	endpoint =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (endpoint) {
> +		fwnode_handle_put(endpoint);
> +		return 0;
> +	}
> +
> +	return ipu7_isys_check_fwnode_graph(fwnode->secondary);
> +}
> +
> +static struct ipu7_bus_device *
> +ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ipu_buttress_ctrl *ct=
rl, void __iomem
> *base,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ipu_isys_internal_pda=
ta *ipdata,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int nr)
> +{
> +	struct fwnode_handle *fwnode =3D dev_fwnode(&pdev->dev);
> +	struct ipu7_bus_device *isys_adev;
> +	struct device *dev =3D &pdev->dev;
> +	struct ipu7_isys_pdata *pdata;
> +	int ret;
> +
> +	ret =3D ipu7_isys_check_fwnode_graph(fwnode);
> +	if (ret) {
> +		if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
> +			dev_err(dev,
> +				"fwnode graph has no endpoints
> connection\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		ret =3D ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "IPU bridge init
> failed\n");
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	pdata =3D kzalloc(sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pdata->base =3D base;
> +	pdata->ipdata =3D ipdata;
> +
> +	isys_adev =3D ipu7_bus_initialize_device(pdev, parent, pdata,
> ctrl,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IPU_ISYS_NAME);
> +	if (IS_ERR(isys_adev)) {
> +		dev_err_probe(dev, PTR_ERR(isys_adev),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipu7_bus_initialize_device isys
> failed\n");
> +		kfree(pdata);
> +		return ERR_CAST(isys_adev);
> +	}
> +
> +	isys_adev->mmu =3D ipu7_mmu_init(dev, base, ISYS_MMID,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ipdata->hw_variant);
> +	if (IS_ERR(isys_adev->mmu)) {
> +		dev_err_probe(dev, PTR_ERR(isys_adev),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipu7_mmu_init(isys_adev->mmu)
> failed\n");
> +		put_device(&isys_adev->auxdev.dev);
> +		kfree(pdata);
> +		return ERR_CAST(isys_adev->mmu);
> +	}
> +
> +	isys_adev->mmu->dev =3D &isys_adev->auxdev.dev;
> +	isys_adev->subsys =3D IPU_IS;
> +
> +	ret =3D ipu7_bus_add_device(isys_adev);
> +	if (ret) {
> +		kfree(pdata);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return isys_adev;
> +}
> +
> +static struct ipu7_bus_device *
> +ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ipu_buttress_ctrl *ct=
rl, void __iomem
> *base,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ipu_psys_internal_pda=
ta *ipdata,
> unsigned int nr)
> +{
> +	struct ipu7_bus_device *psys_adev;
> +	struct ipu7_psys_pdata *pdata;
> +	int ret;
> +
> +	pdata =3D kzalloc(sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pdata->base =3D base;
> +	pdata->ipdata =3D ipdata;
> +
> +	psys_adev =3D ipu7_bus_initialize_device(pdev, parent, pdata,
> ctrl,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IPU_PSYS_NAME);
> +	if (IS_ERR(psys_adev)) {
> +		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipu7_bus_initialize_device psys
> failed\n");
> +		kfree(pdata);
> +		return ERR_CAST(psys_adev);
> +	}
> +
> +	psys_adev->mmu =3D ipu7_mmu_init(&pdev->dev, base, PSYS_MMID,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ipdata->hw_variant);
> +	if (IS_ERR(psys_adev->mmu)) {
> +		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipu7_mmu_init(psys_adev->mmu)
> failed\n");
> +		put_device(&psys_adev->auxdev.dev);
> +		kfree(pdata);
> +		return ERR_CAST(psys_adev->mmu);
> +	}
> +
> +	psys_adev->mmu->dev =3D &psys_adev->auxdev.dev;
> +	psys_adev->subsys =3D IPU_PS;
> +
> +	ret =3D ipu7_bus_add_device(psys_adev);
> +	if (ret) {
> +		kfree(pdata);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return psys_adev;
> +}
> +
> +static struct ia_gofo_msg_log_info_ts fw_error_log[IPU_SUBSYS_NUM];
> +void ipu7_dump_fw_error_log(const struct ipu7_bus_device *adev)
> +{
> +	void __iomem *reg =3D adev->isp->base + ((adev->subsys =3D=3D
> IPU_IS) ?
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUTTRESS_REG_FW_GP24
> :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUTTRESS_REG_FW_GP8);
> +
> +	memcpy_fromio(&fw_error_log[adev->subsys], reg,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(fw_error_log[adev->subsys]));
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu7_dump_fw_error_log, "INTEL_IPU7");
> +
> +static int ipu7_pci_config_setup(struct pci_dev *dev)
> +{
> +	u16 pci_command;
> +	int ret;
> +
> +	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
> +	pci_command |=3D PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
> +	pci_write_config_word(dev, PCI_COMMAND, pci_command);
> +
> +	ret =3D pci_enable_msi(dev);
> +	if (ret)
> +		dev_err(&dev->dev, "Failed to enable msi (%d)\n",
> ret);
> +
> +	return ret;
> +}
> +
> +static int ipu7_map_fw_code_region(struct ipu7_bus_device *sys,
> +				=C2=A0=C2=A0 void *data, size_t size)
> +{
> +	struct device *dev =3D &sys->auxdev.dev;
> +	struct ipu7_bus_device *adev =3D to_ipu7_bus_device(dev);
> +	struct sg_table *sgt =3D &sys->fw_sgt;
> +	struct ipu7_device *isp =3D adev->isp;
> +	struct pci_dev *pdev =3D isp->pdev;
> +	unsigned long n_pages, i;
> +	unsigned long attr =3D 0;
> +	struct page **pages;
> +	int ret;
> +
> +	n_pages =3D PFN_UP(size);
> +
> +	pages =3D kmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < n_pages; i++) {
> +		struct page *p =3D vmalloc_to_page(data);
> +
> +		if (!p) {
> +			ret =3D -ENODEV;
> +			goto out;
> +		}
> +
> +		pages[i] =3D p;
> +		data +=3D PAGE_SIZE;
> +	}
> +
> +	ret =3D sg_alloc_table_from_pages(sgt, pages, n_pages, 0,
> size,
> +					GFP_KERNEL);
> +	if (ret) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	if (!isp->secure_mode)
> +		attr |=3D DMA_ATTR_RESERVE_REGION;
> +
> +	ret =3D dma_map_sgtable(&pdev->dev, sgt, DMA_BIDIRECTIONAL,
> 0);
> +	if (ret < 0) {
> +		dev_err(dev, "map fw code[%lu pages %u nents]
> failed\n",
> +			n_pages, sgt->nents);
> +		ret =3D -ENOMEM;
> +		sg_free_table(sgt);
> +		goto out;
> +	}
> +
> +	ret =3D ipu7_dma_map_sgtable(sys, sgt, DMA_BIDIRECTIONAL,
> attr);
> +	if (ret) {
> +		dma_unmap_sgtable(&pdev->dev, sgt,
> DMA_BIDIRECTIONAL, 0);
> +		sg_free_table(sgt);
> +		goto out;
> +	}
> +
> +	ipu7_dma_sync_sgtable(sys, sgt);
> +
> +	dev_dbg(dev, "fw code region mapped at 0x%llx entries %d\n",
> +		sgt->sgl->dma_address, sgt->nents);
> +
> +out:
> +	kfree(pages);
> +
> +	return ret;
> +}
> +
> +static void ipu7_unmap_fw_code_region(struct ipu7_bus_device *sys)
> +{
> +	struct pci_dev *pdev =3D sys->isp->pdev;
> +	struct sg_table *sgt =3D &sys->fw_sgt;
> +
> +	ipu7_dma_unmap_sgtable(sys, sgt, DMA_BIDIRECTIONAL, 0);
> +	dma_unmap_sgtable(&pdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
> +	sg_free_table(sgt);
> +}
> +
> +static int ipu7_init_fw_code_region_by_sys(struct ipu7_bus_device
> *sys,
> +					=C2=A0=C2=A0 char *sys_name)
> +{
> +	struct device *dev =3D &sys->auxdev.dev;
> +	struct ipu7_device *isp =3D sys->isp;
> +	int ret;
> +
> +	/* Copy FW binaries to specific location. */
> +	ret =3D ipu7_cpd_copy_binary(isp->cpd_fw->data, sys_name,
> +				=C2=A0=C2=A0 isp->fw_code_region, &sys-
> >fw_entry);
> +	if (ret) {
> +		dev_err(dev, "%s binary not found.\n", sys_name);
> +		return ret;
> +	}
> +
> +	ret =3D pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get runtime PM\n");
> +		return ret;
> +	}
> +
> +	ret =3D ipu7_mmu_hw_init(sys->mmu);
> +	if (ret) {
> +		dev_err(dev, "Failed to set mmu hw\n");
> +		pm_runtime_put(dev);
> +		return ret;
> +	}
> +
> +	/* Map code region. */
> +	ret =3D ipu7_map_fw_code_region(sys, isp->fw_code_region,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IPU_FW_CODE_REGION_SIZE);
> +	if (ret)
> +		dev_err(dev, "Failed to map fw code region for
> %s.\n",
> +			sys_name);
> +
> +	ipu7_mmu_hw_cleanup(sys->mmu);
> +	pm_runtime_put(dev);
> +
> +	return ret;
> +}
> +
> +static int ipu7_init_fw_code_region(struct ipu7_device *isp)
> +{
> +	int ret;
> +
> +	/*
> +	 * Allocate and map memory for FW execution.
> +	 * Not required in secure mode, in which FW runs in IMR.
> +	 */
> +	isp->fw_code_region =3D vmalloc(IPU_FW_CODE_REGION_SIZE);
> +	if (!isp->fw_code_region)
> +		return -ENOMEM;
> +
> +	ret =3D ipu7_init_fw_code_region_by_sys(isp->isys, "isys");
> +	if (ret)
> +		goto fail_init;
> +
> +	ret =3D ipu7_init_fw_code_region_by_sys(isp->psys, "psys");
> +	if (ret)
> +		goto fail_init;
> +
> +	return 0;
> +
> +fail_init:
> +	vfree(isp->fw_code_region);
> +
> +	return ret;
> +}
> +
> +static int ipu7_pci_probe(struct pci_dev *pdev, const struct
> pci_device_id *id)
> +{
> +	struct ipu_buttress_ctrl *isys_ctrl =3D NULL, *psys_ctrl =3D
> NULL;
> +	struct fwnode_handle *fwnode =3D dev_fwnode(&pdev->dev);
> +	const struct ipu_buttress_ctrl *isys_buttress_ctrl;
> +	const struct ipu_buttress_ctrl *psys_buttress_ctrl;
> +	struct ipu_isys_internal_pdata *isys_ipdata;
> +	struct ipu_psys_internal_pdata *psys_ipdata;
> +	unsigned int dma_mask =3D IPU_DMA_MASK;
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *isys_base =3D NULL;
> +	void __iomem *psys_base =3D NULL;
> +	void __iomem *const *iomap;
> +	phys_addr_t phys, pb_phys;
> +	struct ipu7_device *isp;
> +	u32 is_es;
> +	int ret;
> +
> +	if (!fwnode || fwnode_property_read_u32(fwnode, "is_es",
> &is_es))
> +		is_es =3D 0;
> +
> +	isp =3D devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
> +	if (!isp)
> +		return -ENOMEM;
> +
> +	dev_set_name(dev, "intel-ipu7");
> +	isp->pdev =3D pdev;
> +	INIT_LIST_HEAD(&isp->devices);
> +
> +	ret =3D pcim_enable_device(pdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Enable PCI device
> failed\n");
> +
> +	dev_info(dev, "Device 0x%x (rev: 0x%x)\n",
> +		 pdev->device, pdev->revision);
> +
> +	phys =3D pci_resource_start(pdev, IPU_PCI_BAR);
> +	pb_phys =3D pci_resource_start(pdev, IPU_PCI_PBBAR);
> +	dev_info(dev, "IPU7 PCI BAR0 base %llx BAR2 base %llx\n",
> +		 phys, pb_phys);
> +
> +	ret =3D pcim_iomap_regions(pdev, BIT(IPU_PCI_BAR) |
> BIT(IPU_PCI_PBBAR),
> +				 pci_name(pdev));
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to I/O memory remapping
> (%d)\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 ret);
> +
> +	iomap =3D pcim_iomap_table(pdev);

pcim_iomap_table() and pcim_iomap_regions() have been deprecated last
year. That's also documented in those functions' docstrings. Please
don't use them anymore.

You can achieve all you need with the simpler pcim_iomap_region()


> +	if (!iomap)
> +		return dev_err_probe(dev, -ENODEV, "Failed to iomap
> table\n");
> +
> +	isp->base =3D iomap[IPU_PCI_BAR];
> +	isp->pb_base =3D iomap[IPU_PCI_PBBAR];
> +	dev_info(dev, "IPU7 PCI BAR0 mapped at %p\n BAR2 mapped at
> %p\n",
> +		 isp->base, isp->pb_base);
> +
> +	pci_set_drvdata(pdev, isp);
> +	pci_set_master(pdev);
> +
> +	switch (id->device) {
> +	case IPU7_PCI_ID:
> +		isp->hw_ver =3D IPU_VER_7;
> +		isp->cpd_fw_name =3D IPU7_FIRMWARE_NAME;
> +		isys_ipdata =3D &ipu7_isys_ipdata;
> +		psys_ipdata =3D &ipu7_psys_ipdata;
> +		isys_buttress_ctrl =3D &ipu7_isys_buttress_ctrl;
> +		psys_buttress_ctrl =3D &ipu7_psys_buttress_ctrl;
> +		break;
> +	case IPU7P5_PCI_ID:
> +		isp->hw_ver =3D IPU_VER_7P5;
> +		isp->cpd_fw_name =3D IPU7P5_FIRMWARE_NAME;
> +		isys_ipdata =3D &ipu7p5_isys_ipdata;
> +		psys_ipdata =3D &ipu7p5_psys_ipdata;
> +		isys_buttress_ctrl =3D &ipu7_isys_buttress_ctrl;
> +		psys_buttress_ctrl =3D &ipu7_psys_buttress_ctrl;
> +		break;
> +	case IPU8_PCI_ID:
> +		isp->hw_ver =3D IPU_VER_8;
> +		isp->cpd_fw_name =3D IPU8_FIRMWARE_NAME;
> +		isys_ipdata =3D &ipu8_isys_ipdata;
> +		psys_ipdata =3D &ipu8_psys_ipdata;
> +		isys_buttress_ctrl =3D &ipu8_isys_buttress_ctrl;
> +		psys_buttress_ctrl =3D &ipu8_psys_buttress_ctrl;
> +		break;
> +	default:
> +		WARN(1, "Unsupported IPU device");
> +		return -ENODEV;
> +	}
> +
> +	ipu_internal_pdata_init(isys_ipdata, psys_ipdata);
> +
> +	isys_base =3D isp->base + isys_ipdata->hw_variant.offset;
> +	psys_base =3D isp->base + psys_ipdata->hw_variant.offset;
> +
> +	ret =3D dma_set_mask_and_coherent(dev,
> DMA_BIT_MASK(dma_mask));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set DMA
> mask\n");
> +
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
> +	ret =3D ipu7_pci_config_setup(pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ipu_buttress_init(isp);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "firmware cpd file: %s\n", isp->cpd_fw_name);
> +
> +	ret =3D request_firmware(&isp->cpd_fw, isp->cpd_fw_name, dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Requesting signed firmware %s
> failed\n",
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isp->cpd_fw_name);
> +		goto buttress_exit;
> +	}
> +
> +	ret =3D ipu7_cpd_validate_cpd_file(isp, isp->cpd_fw->data,
> +					 isp->cpd_fw->size);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to validate cpd\n");
> +		goto out_ipu_bus_del_devices;
> +	}
> +
> +	isys_ctrl =3D devm_kmemdup(dev, isys_buttress_ctrl,
> +				 sizeof(*isys_buttress_ctrl),
> GFP_KERNEL);
> +	if (!isys_ctrl) {
> +		ret =3D -ENOMEM;
> +		goto out_ipu_bus_del_devices;
> +	}
> +
> +	isp->isys =3D ipu7_isys_init(pdev, dev, isys_ctrl, isys_base,
> +				=C2=A0=C2=A0 isys_ipdata, 0);
> +	if (IS_ERR(isp->isys)) {
> +		ret =3D PTR_ERR(isp->isys);
> +		goto out_ipu_bus_del_devices;
> +	}
> +
> +	psys_ctrl =3D devm_kmemdup(dev, psys_buttress_ctrl,
> +				 sizeof(*psys_buttress_ctrl),
> GFP_KERNEL);
> +	if (!psys_ctrl) {
> +		ret =3D -ENOMEM;
> +		goto out_ipu_bus_del_devices;
> +	}
> +
> +	isp->psys =3D ipu7_psys_init(pdev, &isp->isys->auxdev.dev,
> +				=C2=A0=C2=A0 psys_ctrl, psys_base,
> +				=C2=A0=C2=A0 psys_ipdata, 0);
> +	if (IS_ERR(isp->psys)) {
> +		ret =3D PTR_ERR(isp->psys);
> +		goto out_ipu_bus_del_devices;
> +	}
> +
> +	ret =3D devm_request_threaded_irq(dev, pdev->irq,
> +					ipu_buttress_isr,
> +					ipu_buttress_isr_threaded,
> +					IRQF_SHARED, IPU_NAME, isp);
> +	if (ret)
> +		goto out_ipu_bus_del_devices;
> +
> +	if (!isp->secure_mode) {
> +		ret =3D ipu7_init_fw_code_region(isp);
> +		if (ret)
> +			goto out_ipu_bus_del_devices;
> +	} else {
> +		ret =3D pm_runtime_get_sync(&isp->psys->auxdev.dev);
> +		if (ret < 0) {
> +			dev_err(&isp->psys->auxdev.dev,
> +				"Failed to get runtime PM\n");
> +			goto out_ipu_bus_del_devices;
> +		}
> +
> +		ret =3D ipu7_mmu_hw_init(isp->psys->mmu);
> +		if (ret) {
> +			dev_err_probe(&isp->pdev->dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to init MMU
> hardware\n");
> +			goto out_ipu_bus_del_devices;
> +		}
> +
> +		ret =3D ipu7_map_fw_code_region(isp->psys,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void *)isp->cpd_fw-
> >data,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isp->cpd_fw->size);
> +		if (ret) {
> +			dev_err_probe(&isp->pdev->dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to map fw image\n");
> +			goto out_ipu_bus_del_devices;
> +		}
> +
> +		ret =3D ipu_buttress_authenticate(isp);
> +		if (ret) {
> +			dev_err_probe(&isp->pdev->dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "FW authentication failed\n");
> +			goto out_ipu_bus_del_devices;
> +		}
> +
> +		ipu7_mmu_hw_cleanup(isp->psys->mmu);
> +		pm_runtime_put(&isp->psys->auxdev.dev);
> +	}
> +
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_allow(dev);
> +
> +	isp->ipu7_bus_ready_to_probe =3D true;
> +
> +	return 0;
> +
> +out_ipu_bus_del_devices:
> +	if (!IS_ERR_OR_NULL(isp->isys) && isp->isys->fw_sgt.nents)
> +		ipu7_unmap_fw_code_region(isp->isys);
> +	if (!IS_ERR_OR_NULL(isp->psys) && isp->psys->fw_sgt.nents)
> +		ipu7_unmap_fw_code_region(isp->psys);
> +	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys-
> >mmu))
> +		ipu7_mmu_cleanup(isp->psys->mmu);
> +	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys-
> >mmu))
> +		ipu7_mmu_cleanup(isp->isys->mmu);
> +	if (!IS_ERR_OR_NULL(isp->psys))
> +		pm_runtime_put(&isp->psys->auxdev.dev);
> +	ipu7_bus_del_devices(pdev);
> +	release_firmware(isp->cpd_fw);
> +buttress_exit:
> +	ipu_buttress_exit(isp);
> +
> +	return ret;
> +}
> +
> +static void ipu7_pci_remove(struct pci_dev *pdev)
> +{
> +	struct ipu7_device *isp =3D pci_get_drvdata(pdev);
> +
> +	if (!IS_ERR_OR_NULL(isp->isys) && isp->isys->fw_sgt.nents)
> +		ipu7_unmap_fw_code_region(isp->isys);
> +	if (!IS_ERR_OR_NULL(isp->psys) && isp->psys->fw_sgt.nents)
> +		ipu7_unmap_fw_code_region(isp->psys);
> +
> +	if (!IS_ERR_OR_NULL(isp->fw_code_region))
> +		vfree(isp->fw_code_region);
> +
> +	ipu7_bus_del_devices(pdev);
> +
> +	pm_runtime_forbid(&pdev->dev);
> +	pm_runtime_get_noresume(&pdev->dev);
> +
> +	pci_release_regions(pdev);

You don't need this if you request with a pcim_ function. The 'm'
stands for "managed". Those are devres functions that will clean up
automatically if probe() fails or once remove() is invoked.

Furthermore, you should not mix pcim_ and pci_ functions; at least not
those.

And even if the pcim_ functions wouldn't do a cleanup, you would leak
the IO mappings above, since pci_release_regions() just removes the
region requests, but not the mapping cookies.

I recommend taking a look to the PCI subystem's documentation.

> +	pci_disable_device(pdev);

You also don't need this since you used pcim_enable_device(), which
will disable the device automatically on driver-detach.


P.

> +
> +	ipu_buttress_exit(isp);
> +
> +	release_firmware(isp->cpd_fw);
> +
> +	ipu7_mmu_cleanup(isp->psys->mmu);
> +	ipu7_mmu_cleanup(isp->isys->mmu);
> +}
> +
> +static void ipu7_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct ipu7_device *isp =3D pci_get_drvdata(pdev);
> +
> +	dev_warn(&pdev->dev, "FLR prepare\n");
> +	pm_runtime_forbid(&isp->pdev->dev);
> +}
> +
> +static void ipu7_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct ipu7_device *isp =3D pci_get_drvdata(pdev);
> +
> +	ipu_buttress_restore(isp);
> +	if (isp->secure_mode)
> +		ipu_buttress_reset_authentication(isp);
> +
> +	isp->ipc_reinit =3D true;
> +	pm_runtime_allow(&isp->pdev->dev);
> +
> +	dev_warn(&pdev->dev, "FLR completed\n");
> +}
> +
> +/*
> + * PCI base driver code requires driver to provide these to enable
> + * PCI device level PM state transitions (D0<->D3)
> + */
> +static int ipu7_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int ipu7_resume(struct device *dev)
> +{
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	struct ipu7_device *isp =3D pci_get_drvdata(pdev);
> +	struct ipu_buttress *b =3D &isp->buttress;
> +	int ret;
> +
> +	isp->secure_mode =3D ipu_buttress_get_secure_mode(isp);
> +	dev_info(dev, "IPU7 in %s mode\n",
> +		 isp->secure_mode ? "secure" : "non-secure");
> +
> +	ipu_buttress_restore(isp);
> +
> +	ret =3D ipu_buttress_ipc_reset(isp, &b->cse);
> +	if (ret)
> +		dev_err(dev, "IPC reset protocol failed!\n");
> +
> +	ret =3D pm_runtime_get_sync(&isp->psys->auxdev.dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get runtime PM\n");
> +		return 0;
> +	}
> +
> +	ret =3D ipu_buttress_authenticate(isp);
> +	if (ret)
> +		dev_err(dev, "FW authentication failed(%d)\n", ret);
> +
> +	pm_runtime_put(&isp->psys->auxdev.dev);
> +
> +	return 0;
> +}
> +
> +static int ipu7_runtime_resume(struct device *dev)
> +{
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	struct ipu7_device *isp =3D pci_get_drvdata(pdev);
> +	int ret;
> +
> +	ipu_buttress_restore(isp);
> +
> +	if (isp->ipc_reinit) {
> +		struct ipu_buttress *b =3D &isp->buttress;
> +
> +		isp->ipc_reinit =3D false;
> +		ret =3D ipu_buttress_ipc_reset(isp, &b->cse);
> +		if (ret)
> +			dev_err(dev, "IPC reset protocol
> failed!\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ipu7_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(&ipu7_suspend, &ipu7_resume)
> +	SET_RUNTIME_PM_OPS(&ipu7_suspend,	/* Same as in
> suspend flow */
> +			=C2=A0=C2=A0 &ipu7_runtime_resume,
> +			=C2=A0=C2=A0 NULL)
> +};
> +
> +static const struct pci_device_id ipu7_pci_tbl[] =3D {
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU7_PCI_ID)},
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU7P5_PCI_ID)},
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU8_PCI_ID)},
> +	{0,}
> +};
> +MODULE_DEVICE_TABLE(pci, ipu7_pci_tbl);
> +
> +static const struct pci_error_handlers pci_err_handlers =3D {
> +	.reset_prepare =3D ipu7_pci_reset_prepare,
> +	.reset_done =3D ipu7_pci_reset_done,
> +};
> +
> +static struct pci_driver ipu7_pci_driver =3D {
> +	.name =3D IPU_NAME,
> +	.id_table =3D ipu7_pci_tbl,
> +	.probe =3D ipu7_pci_probe,
> +	.remove =3D ipu7_pci_remove,
> +	.driver =3D {
> +		.pm =3D &ipu7_pm_ops,
> +	},
> +	.err_handler =3D &pci_err_handlers,
> +};
> +
> +module_pci_driver(ipu7_pci_driver);
> +
> +MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
> +MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
> +MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
> +MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
> +MODULE_AUTHOR("Intel");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Intel ipu7 pci driver");
> diff --git a/drivers/media/pci/intel/ipu7/ipu7.h
> b/drivers/media/pci/intel/ipu7/ipu7.h
> new file mode 100644
> index 000000000000..6f5705f403b7
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/ipu7.h
> @@ -0,0 +1,244 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2013 - 2024 Intel Corporation
> + */
> +
> +#ifndef IPU7_H
> +#define IPU7_H
> +
> +#include <linux/list.h>
> +#include <linux/pci.h>
> +#include <linux/types.h>
> +
> +#include "ipu7-buttress.h"
> +
> +struct ipu7_bus_device;
> +struct pci_dev;
> +struct firmware;
> +
> +#define IPU_NAME			"intel-ipu7"
> +#define IPU_MEDIA_DEV_MODEL_NAME	"ipu7"
> +
> +#define IPU7_FIRMWARE_NAME		"intel/ipu/ipu7_fw.bin"
> +#define IPU7P5_FIRMWARE_NAME		"intel/ipu/ipu7ptl_fw.bin"
> +#define IPU8_FIRMWARE_NAME		"intel/ipu/ipu8_fw.bin"
> +
> +#define IPU7_ISYS_NUM_STREAMS		12
> +
> +#define IPU7_PCI_ID			0x645d
> +#define IPU7P5_PCI_ID			0xb05d
> +#define IPU8_PCI_ID			0xd719
> +
> +#define FW_LOG_BUF_SIZE			(2 * 1024 * 1024)
> +
> +enum ipu_version {
> +	IPU_VER_INVALID =3D 0,
> +	IPU_VER_7 =3D 1,
> +	IPU_VER_7P5 =3D 2,
> +	IPU_VER_8 =3D 3,
> +};
> +
> +static inline bool is_ipu7p5(u8 hw_ver)
> +{
> +	return hw_ver =3D=3D IPU_VER_7P5;
> +}
> +
> +static inline bool is_ipu7(u8 hw_ver)
> +{
> +	return hw_ver =3D=3D IPU_VER_7;
> +}
> +
> +static inline bool is_ipu8(u8 hw_ver)
> +{
> +	return hw_ver =3D=3D IPU_VER_8;
> +}
> +
> +#define IPU_UNIFIED_OFFSET		0
> +
> +/*
> + * ISYS DMA can overshoot. For higher resolutions over allocation is
> one line
> + * but it must be at minimum 1024 bytes. Value could be different in
> + * different versions / generations thus provide it via platform
> data.
> + */
> +#define IPU_ISYS_OVERALLOC_MIN		1024
> +
> +#define IPU_FW_CODE_REGION_SIZE		0x1000000 /* 16MB */
> +#define IPU_FW_CODE_REGION_START	0x4000000 /* 64MB */
> +#define IPU_FW_CODE_REGION_END		(IPU_FW_CODE_REGION_START
> +	\
> +					 IPU_FW_CODE_REGION_SIZE) /*
> 80MB */
> +
> +struct ipu7_device {
> +	struct pci_dev *pdev;
> +	struct list_head devices;
> +	struct ipu7_bus_device *isys;
> +	struct ipu7_bus_device *psys;
> +	struct ipu_buttress buttress;
> +
> +	const struct firmware *cpd_fw;
> +	const char *cpd_fw_name;
> +	/* Only for non-secure mode. */
> +	void *fw_code_region;
> +
> +	void __iomem *base;
> +	void __iomem *pb_base;
> +	u8 hw_ver;
> +	bool ipc_reinit;
> +	bool secure_mode;
> +	bool ipu7_bus_ready_to_probe;
> +};
> +
> +#define IPU_DMA_MASK			39
> +#define IPU_LIB_CALL_TIMEOUT_MS		2000
> +#define IPU_PSYS_CMD_TIMEOUT_MS		2000
> +#define IPU_PSYS_OPEN_CLOSE_TIMEOUT_US	50
> +#define IPU_PSYS_OPEN_CLOSE_RETRY	(10000 /
> IPU_PSYS_OPEN_CLOSE_TIMEOUT_US)
> +
> +#define IPU_ISYS_NAME "isys"
> +#define IPU_PSYS_NAME "psys"
> +
> +#define IPU_MMU_ADDR_BITS		32
> +/* FW is accessible within the first 2 GiB only in non-secure mode.
> */
> +#define IPU_MMU_ADDR_BITS_NON_SECURE	31
> +
> +#define IPU7_IS_MMU_NUM			4
> +#define IPU7_PS_MMU_NUM			4
> +#define IPU7P5_IS_MMU_NUM		4
> +#define IPU7P5_PS_MMU_NUM		4
> +#define IPU8_IS_MMU_NUM			5
> +#define IPU8_PS_MMU_NUM			4
> +#define IPU_MMU_MAX_NUM			5 /* max(IS, PS) */
> +#define IPU_MMU_MAX_TLB_L1_STREAMS	40
> +#define IPU_MMU_MAX_TLB_L2_STREAMS	40
> +#define IPU_ZLX_MAX_NUM			32
> +#define IPU_ZLX_POOL_NUM		8
> +#define IPU_UAO_PLANE_MAX_NUM		64
> +
> +/*
> + * To maximize the IOSF utlization, IPU need to send requests in
> bursts.
> + * At the DMA interface with the buttress, there are CDC FIFOs with
> burst
> + * collection capability. CDC FIFO burst collectors have a
> configurable
> + * threshold and is configured based on the outcome of performance
> measurements.
> + *
> + * isys has 3 ports with IOSF interface for VC0, VC1 and VC2
> + * psys has 4 ports with IOSF interface for VC0, VC1w, VC1r and VC2
> + *
> + * Threshold values are pre-defined and are arrived at after
> performance
> + * evaluations on a type of IPU
> + */
> +#define IPU_MAX_VC_IOSF_PORTS		4
> +
> +/*
> + * IPU must configure correct arbitration mechanism related to the
> IOSF VC
> + * requests. There are two options per VC0 and VC1 - > 0 means
> rearbitrate on
> + * stall and 1 means stall until the request is completed.
> + */
> +#define IPU_BTRS_ARB_MODE_TYPE_REARB	0
> +#define IPU_BTRS_ARB_MODE_TYPE_STALL	1
> +
> +/* Currently chosen arbitration mechanism for VC0 */
> +#define IPU_BTRS_ARB_STALL_MODE_VC0	IPU_BTRS_ARB_MODE_TYPE_REARB
> +
> +/* Currently chosen arbitration mechanism for VC1 */
> +#define IPU_BTRS_ARB_STALL_MODE_VC1	IPU_BTRS_ARB_MODE_TYPE_REARB
> +
> +struct ipu7_isys_subdev_pdata;
> +
> +/* One L2 entry maps 1024 L1 entries and one L1 entry per page */
> +#define IPU_MMUV2_L2_RANGE		(1024 * PAGE_SIZE)
> +/* Max L2 blocks per stream */
> +#define IPU_MMUV2_MAX_L2_BLOCKS		2
> +/* Max L1 blocks per stream */
> +#define IPU_MMUV2_MAX_L1_BLOCKS		16
> +#define IPU_MMUV2_TRASH_RANGE		(IPU_MMUV2_L2_RANGE *	\
> +					 IPU_MMUV2_MAX_L2_BLOCKS)
> +/* Entries per L1 block */
> +#define MMUV2_ENTRIES_PER_L1_BLOCK	16
> +#define MMUV2_TRASH_L1_BLOCK_OFFSET	(MMUV2_ENTRIES_PER_L1_BLOCK
> * PAGE_SIZE)
> +#define MMUV2_TRASH_L2_BLOCK_OFFSET	IPU_MMUV2_L2_RANGE
> +
> +struct ipu7_mmu_hw {
> +	char name[32];
> +
> +	void __iomem *base;
> +	void __iomem *zlx_base;
> +	void __iomem *uao_base;
> +
> +	u32 offset;
> +	u32 zlx_offset;
> +	u32 uao_offset;
> +
> +	u32 info_bits;
> +	u32 refill;
> +	u32 collapse_en_bitmap;
> +	u32 at_sp_arb_cfg;
> +
> +	u32 l1_block;
> +	u32 l2_block;
> +
> +	u8 nr_l1streams;
> +	u8 nr_l2streams;
> +	u32 l1_block_sz[IPU_MMU_MAX_TLB_L1_STREAMS];
> +	u32 l2_block_sz[IPU_MMU_MAX_TLB_L2_STREAMS];
> +
> +	u8 zlx_nr;
> +	u32 zlx_axi_pool[IPU_ZLX_POOL_NUM];
> +	u32 zlx_en[IPU_ZLX_MAX_NUM];
> +	u32 zlx_conf[IPU_ZLX_MAX_NUM];
> +
> +	u32 uao_p_num;
> +	u32 uao_p2tlb[IPU_UAO_PLANE_MAX_NUM];
> +};
> +
> +struct ipu7_mmu_pdata {
> +	u32 nr_mmus;
> +	struct ipu7_mmu_hw mmu_hw[IPU_MMU_MAX_NUM];
> +	int mmid;
> +};
> +
> +struct ipu7_isys_csi2_pdata {
> +	void __iomem *base;
> +};
> +
> +struct ipu7_isys_internal_csi2_pdata {
> +	u32 nports;
> +	u32 *offsets;
> +	u32 gpreg;
> +};
> +
> +struct ipu7_hw_variants {
> +	unsigned long offset;
> +	u32 nr_mmus;
> +	struct ipu7_mmu_hw mmu_hw[IPU_MMU_MAX_NUM];
> +	u8 cdc_fifos;
> +	u8 cdc_fifo_threshold[IPU_MAX_VC_IOSF_PORTS];
> +	u32 dmem_offset;
> +	u32 spc_offset;	/* SPC offset from psys base */
> +};
> +
> +struct ipu_isys_internal_pdata {
> +	struct ipu7_isys_internal_csi2_pdata csi2;
> +	struct ipu7_hw_variants hw_variant;
> +	u32 num_parallel_streams;
> +	u32 isys_dma_overshoot;
> +};
> +
> +struct ipu7_isys_pdata {
> +	void __iomem *base;
> +	const struct ipu_isys_internal_pdata *ipdata;
> +};
> +
> +struct ipu_psys_internal_pdata {
> +	struct ipu7_hw_variants hw_variant;
> +};
> +
> +struct ipu7_psys_pdata {
> +	void __iomem *base;
> +	const struct ipu_psys_internal_pdata *ipdata;
> +};
> +
> +int request_cpd_fw(const struct firmware **firmware_p, const char
> *name,
> +		=C2=A0=C2=A0 struct device *device);
> +void ipu_internal_pdata_init(struct ipu_isys_internal_pdata
> *isys_ipdata,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct ipu_psys_internal_pdata
> *psys_ipdata);
> +void ipu7_dump_fw_error_log(const struct ipu7_bus_device *adev);
> +#endif /* IPU7_H */


