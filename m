Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1AC149CAE
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 11:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbfFRJIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 05:08:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33478 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729432AbfFRJIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 05:08:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5I984Zb035352;
        Tue, 18 Jun 2019 04:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560848884;
        bh=abtG7KfkcUMHnnFWN6H/vrDUdzm1W5X7zfbJG/5wh98=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=smx/tb15A64vVOzIi4eLnANif3D1PJYzquMYOKYyLagBzE2jXAEb4s2oa67Fbrq6i
         D1b83YmYsGrJe9OPETyqn0KYQpC+AY3MXOqZTB2SOCMu7MqwhWfIXZN34vDpmgT0+u
         3gGQtdxROSfrA45fg2prinaPA2O+kNW3tcpS/1yE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5I983DY109742
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 Jun 2019 04:08:03 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 18
 Jun 2019 04:08:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 18 Jun 2019 04:08:03 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5I97wXE095650;
        Tue, 18 Jun 2019 04:07:59 -0500
Subject: Re: [RFC PATCH 2/2] soc: ti: Add Support for the TI Page-based
 Address Translator (PAT)
To:     "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, William Mills <wmills@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>
CC:     <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <iommu@lists.linux-foundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>
References: <20190607193523.25700-1-afd@ti.com>
 <20190607193523.25700-3-afd@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <28dea95d-8ae6-431c-ca88-149972d26502@ti.com>
Date:   Tue, 18 Jun 2019 12:07:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607193523.25700-3-afd@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/06/2019 22:35, Andrew F. Davis wrote:
> This patch adds a driver for the Page-based Address Translator (PAT)
> present on various TI SoCs. A PAT device performs address translation
> using tables stored in an internal SRAM. Each PAT supports a set number
> of pages, each occupying a programmable 4KB, 16KB, 64KB, or 1MB of
> addresses in a window for which an incoming transaction will be
> translated.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>   drivers/soc/ti/Kconfig      |   9 +
>   drivers/soc/ti/Makefile     |   1 +
>   drivers/soc/ti/ti-pat.c     | 569 ++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/ti-pat.h |  44 +++
>   4 files changed, 623 insertions(+)
>   create mode 100644 drivers/soc/ti/ti-pat.c
>   create mode 100644 include/uapi/linux/ti-pat.h
> 
> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
> index f0be35d3dcba..b838ae74d01f 100644
> --- a/drivers/soc/ti/Kconfig
> +++ b/drivers/soc/ti/Kconfig
> @@ -86,4 +86,13 @@ config TI_SCI_INTA_MSI_DOMAIN
>   	help
>   	  Driver to enable Interrupt Aggregator specific MSI Domain.
>   
> +config TI_PAT
> +	tristate "TI PAT DMA-BUF exporter"
> +	select REGMAP

What is the reasoning for using regmap for internal register access? Why 
not just use direct readl/writel for everything? To me it seems this is 
only used during probe time also...

> +	help
> +	  Driver for TI Page-based Address Translator (PAT). This driver
> +	  provides the an API allowing the remapping of a non-contiguous
> +	  DMA-BUF into a contiguous one that is sutable for devices needing
> +	  coniguous memory.

Minor typo: contiguous.

> +
>   endif # SOC_TI
> diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
> index b3868d392d4f..1369642b40c3 100644
> --- a/drivers/soc/ti/Makefile
> +++ b/drivers/soc/ti/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_AMX3_PM)			+= pm33xx.o
>   obj-$(CONFIG_WKUP_M3_IPC)		+= wkup_m3_ipc.o
>   obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+= ti_sci_pm_domains.o
>   obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
> +obj-$(CONFIG_TI_PAT)			+= ti-pat.o
> diff --git a/drivers/soc/ti/ti-pat.c b/drivers/soc/ti/ti-pat.c
> new file mode 100644
> index 000000000000..7359ea0f7ccf
> --- /dev/null
> +++ b/drivers/soc/ti/ti-pat.c
> @@ -0,0 +1,569 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI PAT mapped DMA-BUF memory re-exporter
> + *
> + * Copyright (C) 2018-2019 Texas Instruments Incorporated - http://www.ti.com/
> + *	Andrew F. Davis <afd@ti.com>
> + */
> +
> +#include <linux/fs.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/uaccess.h>
> +#include <linux/miscdevice.h>
> +#include <linux/regmap.h>
> +#include <linux/dma-buf.h>
> +#include <linux/genalloc.h>
> +#include <linux/vmalloc.h>
> +#include <linux/slab.h>
> +
> +#include <linux/ti-pat.h>
> +
> +#define TI_PAT_DRIVER_NAME	"ti-pat"

Why do you have a define for this seeing it is only used in single location?

> +
> +/* TI PAT MMRS registers */
> +#define TI_PAT_MMRS_PID		0x0 /* Revision Register */
> +#define TI_PAT_MMRS_CONFIG	0x4 /* Config Register */
> +#define TI_PAT_MMRS_CONTROL	0x10 /* Control Register */
> +
> +/* TI PAT CONTROL register field values */
> +#define TI_PAT_CONTROL_ARB_MODE_UF	0x0 /* Updates first */
> +#define TI_PAT_CONTROL_ARB_MODE_RR	0x2 /* Round-robin */
> +
> +#define TI_PAT_CONTROL_PAGE_SIZE_4KB	0x0
> +#define TI_PAT_CONTROL_PAGE_SIZE_16KB	0x1
> +#define TI_PAT_CONTROL_PAGE_SIZE_64KB	0x2
> +#define TI_PAT_CONTROL_PAGE_SIZE_1MB	0x3
> +
> +static unsigned int ti_pat_page_sizes[] = {
> +	[TI_PAT_CONTROL_PAGE_SIZE_4KB]  = 4 * 1024,
> +	[TI_PAT_CONTROL_PAGE_SIZE_16KB] = 16 * 1024,
> +	[TI_PAT_CONTROL_PAGE_SIZE_64KB] = 64 * 1024,
> +	[TI_PAT_CONTROL_PAGE_SIZE_1MB]  = 1024 * 1024,
> +};
> +
> +enum ti_pat_mmrs_fields {
> +	/* Revision */
> +	F_PID_MAJOR,
> +	F_PID_MINOR,
> +
> +	/* Controls */
> +	F_CONTROL_ARB_MODE,
> +	F_CONTROL_PAGE_SIZE,
> +	F_CONTROL_REPLACE_OID_EN,
> +	F_CONTROL_EN,
> +
> +	/* sentinel */
> +	F_MAX_FIELDS
> +};
> +
> +static const struct reg_field ti_pat_mmrs_reg_fields[] = {
> +	/* Revision */
> +	[F_PID_MAJOR]			= REG_FIELD(TI_PAT_MMRS_PID, 8, 10),
> +	[F_PID_MINOR]			= REG_FIELD(TI_PAT_MMRS_PID, 0, 5),
> +	/* Controls */
> +	[F_CONTROL_ARB_MODE]		= REG_FIELD(TI_PAT_MMRS_CONTROL, 6, 7),
> +	[F_CONTROL_PAGE_SIZE]		= REG_FIELD(TI_PAT_MMRS_CONTROL, 4, 5),
> +	[F_CONTROL_REPLACE_OID_EN]	= REG_FIELD(TI_PAT_MMRS_CONTROL, 1, 1),
> +	[F_CONTROL_EN]			= REG_FIELD(TI_PAT_MMRS_CONTROL, 0, 0),
> +};
> +
> +/**
> + * struct ti_pat_data - PAT device instance data
> + * @dev: PAT device structure
> + * @mdev: misc device
> + * @mmrs_map: Register map of MMRS region
> + * @table_base: Base address of TABLE region

Please add kerneldoc comments for all fields.

> + */
> +struct ti_pat_data {
> +	struct device *dev;
> +	struct miscdevice mdev;
> +	struct regmap *mmrs_map;
> +	struct regmap_field *mmrs_fields[F_MAX_FIELDS];
> +	void __iomem *table_base;
> +	unsigned int page_count;
> +	unsigned int page_size;
> +	phys_addr_t window_base;
> +	struct gen_pool *pool;
> +};
> +

Kerneldoc comments for below structs would be also useful, especially 
for ti_pat_buffer.

> +struct ti_pat_dma_buf_attachment {
> +	struct device *dev;
> +	struct sg_table *table;
> +	struct ti_pat_buffer *buffer;
> +	struct list_head list;
> +};
> +
> +struct ti_pat_buffer {
> +	struct ti_pat_data *pat;
> +	struct dma_buf *i_dma_buf;
> +	size_t size;
> +	unsigned long offset;
> +	struct dma_buf *e_dma_buf;
> +
> +	struct dma_buf_attachment *attachment;
> +	struct sg_table *sgt;
> +
> +	struct list_head attachments;
> +	int map_count;
> +
> +	struct mutex lock;
> +};
> +
> +static const struct regmap_config ti_pat_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int ti_pat_dma_buf_attach(struct dma_buf *dmabuf,
> +				 struct dma_buf_attachment *attachment)
> +{
> +	struct ti_pat_dma_buf_attachment *a;
> +	struct ti_pat_buffer *buffer = dmabuf->priv;
> +
> +	a = kzalloc(sizeof(*a), GFP_KERNEL);
> +	if (!a)
> +		return -ENOMEM;
> +
> +	a->dev = attachment->dev;
> +	a->buffer = buffer;
> +	INIT_LIST_HEAD(&a->list);
> +
> +	a->table = kzalloc(sizeof(*a->table), GFP_KERNEL);
> +	if (!a->table) {
> +		kfree(a);
> +		return -ENOMEM;
> +	}
> +
> +	if (sg_alloc_table(a->table, 1, GFP_KERNEL)) {
> +		kfree(a->table);
> +		kfree(a);
> +		return -ENOMEM;
> +	}
> +
> +	sg_set_page(a->table->sgl, pfn_to_page(PFN_DOWN(buffer->offset)), buffer->size, 0);
> +
> +	attachment->priv = a;
> +
> +	mutex_lock(&buffer->lock);
> +	/* First time attachment we attach to parent */
> +	if (list_empty(&buffer->attachments)) {
> +		buffer->attachment = dma_buf_attach(buffer->i_dma_buf, buffer->pat->dev);
> +		if (IS_ERR(buffer->attachment)) {
> +			dev_err(buffer->pat->dev, "Unable to attach to parent DMA-BUF\n");
> +			mutex_unlock(&buffer->lock);
> +			kfree(a->table);
> +			kfree(a);
> +			return PTR_ERR(buffer->attachment);
> +		}
> +	}
> +	list_add(&a->list, &buffer->attachments);
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static void ti_pat_dma_buf_detatch(struct dma_buf *dmabuf,
> +				   struct dma_buf_attachment *attachment)

Func name should be ti_pat_dma_buf_detach instead?

Other than that, I can't see anything obvious with my limited experience 
with dma_buf. Is there a simple way to test this driver btw?

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
