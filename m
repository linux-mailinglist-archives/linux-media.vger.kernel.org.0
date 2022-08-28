Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109A75A3E30
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 16:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiH1O65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 10:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiH1O64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 10:58:56 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748A12CE1B
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 07:58:54 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bx38so5812125ljb.10
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UezK9LsHRkMty7q4lhJC6wDxrFnTvnFuj9lWTy0i/4c=;
        b=Jf7UgTOOxlg3HkIcybMmKVRRWtB3AtfGBtmhs9Ubvs3xpKXTPqa7Oq7hvDP7bkd0IR
         2CFVLybtaqrpWwmp9iCmnR47D8AgUmwZ3a07iUbXvdU3e4zwjl1zYFFd7uzCop0eE/bj
         Td6Rxk1R237Kwne+Xh5ZWdYQPNzl0SaU6VMPB7RUfizc/A8Jab3hylqP7123b3ONCXYx
         RmWAvlhilDX9NXGKaeHT5nJJdj3bbFdXxFMgtArsma0q/IzH2pHqr0wdyBDbfKvLPmmo
         Dn+CiTxSgbfCW749yW5rqnHtysqgd9lP0Hb0Y7KzLxRkRRHbTotLJuYXtULgP5ywaEu1
         6+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UezK9LsHRkMty7q4lhJC6wDxrFnTvnFuj9lWTy0i/4c=;
        b=mQKq7s2x83GQkGo9teXExJ05me9SrA/zaWFMT8kiE1728MzJnwceSFuIf5GpfOOvX8
         j3YqOrdNDZtYeb0drgrfYxaYL+TAINfQbEmg1Zyn8wSF5dABsdHR4XLs9LNWJikg+SzO
         uOLUH4pVmjD+4dS93ouhx2/nIRAGd+MQF1zCdYyzWiJLcDJfgDoO790Ro4rATlzqNGsv
         U+S5JXcHPYYQeWdi6a7XR0KAy6EZWtBtRtEZVtwdic6WfjyC1w50iT7Vz+pnjPnUPFHO
         +tR/OimiYcqvm0ActMFP5EJgI303eTt5RxUx7clzPAaRi7RxijQsT/o9IaU97JrHqDw5
         tbNQ==
X-Gm-Message-State: ACgBeo1i7JcVGmgRMYhO1QNLD1/GqPG3+5rBYqWBTYDcy86LWabicAIO
        e8A2EsqpomYFQlInwYo2VuPQhAswONnKDigW
X-Google-Smtp-Source: AA6agR7gSyzMQul6JRz5l0jlIsZEoOKSMBpwwD9km99uf63kanv/Q9y62mJgRRbOy+A6QnGpQltSAQ==
X-Received: by 2002:a05:651c:b2c:b0:261:d30c:abc2 with SMTP id b44-20020a05651c0b2c00b00261d30cabc2mr4885444ljr.38.1661698732705;
        Sun, 28 Aug 2022 07:58:52 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id d5-20020ac24c85000000b0048b0526070fsm982708lfl.71.2022.08.28.07.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 07:58:52 -0700 (PDT)
Message-ID: <22204e2d-e0cc-b4bf-7501-9e4c2bf32ff8@linaro.org>
Date:   Sun, 28 Aug 2022 17:58:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Content-Language: en-US
To:     martin.tuma@digiteqautomotive.com, linux-media@vger.kernel.org
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/08/2022 22:47, martin.tuma@digiteqautomotive.com wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> The driver is based on the code provided by Xilinx at
> https://github.com/Xilinx/dma_ip_drivers

Explain why this cannot be merged into existing Xilinx dma drivers

> 
> There are no significant functional changes in the code except
> of separating the core DMA driver functionality in a way that the code
> can be used by device drivers in the kernel.

Use scripts/get_maintainers.pl to CC all maintainers and relevant
mailing lists. Patch will be ignored if you do not follow Linux kernel
process...

> 
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---
>  drivers/dma/Kconfig               |    7 +
>  drivers/dma/xilinx/Makefile       |    2 +
>  drivers/dma/xilinx/xdma_core.c    | 3835 +++++++++++++++++++++++++++++
>  drivers/dma/xilinx/xdma_core.h    |  588 +++++
>  drivers/dma/xilinx/xdma_thread.c  |  309 +++
>  drivers/dma/xilinx/xdma_thread.h  |  134 +
>  drivers/dma/xilinx/xdma_version.h |   23 +
>  include/linux/dma/xilinx_xdma.h   |   91 +
>  8 files changed, 4989 insertions(+)
>  create mode 100644 drivers/dma/xilinx/xdma_core.c
>  create mode 100644 drivers/dma/xilinx/xdma_core.h
>  create mode 100644 drivers/dma/xilinx/xdma_thread.c
>  create mode 100644 drivers/dma/xilinx/xdma_thread.h
>  create mode 100644 drivers/dma/xilinx/xdma_version.h
>  create mode 100644 include/linux/dma/xilinx_xdma.h
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 487ed4ddc3be..e37578a5d94e 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -793,6 +793,13 @@ config DMATEST
>  	  Simple DMA test client. Say N unless you're debugging a
>  	  DMA Device driver.
>  
> +config XILINX_XDMA
> +	tristate "Xilinx XDMA Engine"
> +	depends on PCI
> +	select DMA_ENGINE
> +	help
> +	  Enable support for Xilinx XDMA IP controller.
> +
>  config DMA_ENGINE_RAID
>  	bool
>  
> diff --git a/drivers/dma/xilinx/Makefile b/drivers/dma/xilinx/Makefile
> index 767bb45f641f..890c9c04e3c7 100644
> --- a/drivers/dma/xilinx/Makefile
> +++ b/drivers/dma/xilinx/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_XILINX_DMA) += xilinx_dma.o
>  obj-$(CONFIG_XILINX_ZYNQMP_DMA) += zynqmp_dma.o
>  obj-$(CONFIG_XILINX_ZYNQMP_DPDMA) += xilinx_dpdma.o
> +obj-$(CONFIG_XILINX_XDMA) += xilinx_xdma.o
> +xilinx_xdma-objs := xdma_core.o xdma_thread.o
> diff --git a/drivers/dma/xilinx/xdma_core.c b/drivers/dma/xilinx/xdma_core.c
> new file mode 100644
> index 000000000000..03f02acb5904
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_core.c
> @@ -0,0 +1,3835 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.
> + * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/mm.h>
> +#include <linux/errno.h>
> +#include <linux/sched.h>
> +#include <linux/vmalloc.h>
> +#include <linux/dma/xilinx_xdma.h>
> +#include "xdma_core.h"
> +#include "xdma_thread.h"
> +#include "xdma_version.h"
> +
> +#define DRV_MODULE_NAME "xdma"
> +#define DRV_MODULE_DESC "Xilinx XDMA Base Driver"
> +#define DRV_MODULE_RELDATE "04/2021"
> +
> +static char version[] =
> +	DRV_MODULE_DESC " " DRV_MODULE_NAME " v" DRV_MODULE_VERSION "\n";
> +
> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION(DRV_MODULE_DESC);
> +MODULE_VERSION(DRV_MODULE_VERSION);
> +MODULE_LICENSE("Dual BSD/GPL");
> +
> +/* Module Parameters */
> +static unsigned int poll_mode;
> +module_param(poll_mode, uint, 0644);
> +MODULE_PARM_DESC(poll_mode, "Set 1 for hw polling, default is 0 (interrupts)");
> +
> +static unsigned int interrupt_mode;
> +module_param(interrupt_mode, uint, 0644);
> +MODULE_PARM_DESC(interrupt_mode, "0 - Auto, 1 - MSI, 2 - MSI-x");
> +
> +static unsigned int enable_credit_mp = 1;
> +module_param(enable_credit_mp, uint, 0644);
> +MODULE_PARM_DESC(enable_credit_mp,
> +		 "Set 0 to disable credit feature, default is 1 (credit control enabled)");
> +
> +static unsigned int desc_blen_max = XDMA_DESC_BLEN_MAX;
> +module_param(desc_blen_max, uint, 0644);
> +MODULE_PARM_DESC(desc_blen_max,
> +		 "per descriptor max. buffer length, default is (1 << 28) - 1");
> +
> +/*
> + * xdma device management
> + * maintains a list of the xdma devices
> + */
> +static LIST_HEAD(xdev_list);
> +static DEFINE_MUTEX(xdev_mutex);
> +
> +static LIST_HEAD(xdev_rcu_list);
> +static DEFINE_SPINLOCK(xdev_rcu_lock);

No static variables... Why do you need them?

> +
> +static inline int xdev_list_add(struct xdma_dev *xdev)
> +{
> +	mutex_lock(&xdev_mutex);
> +	if (list_empty(&xdev_list)) {
> +		xdev->idx = 0;
> +		if (poll_mode) {
> +			int rv = xdma_threads_create(xdev->h2c_channel_max +
> +					xdev->c2h_channel_max);
> +			if (rv < 0) {
> +				mutex_unlock(&xdev_mutex);
> +				return rv;
> +			}
> +		}
> +	} else {
> +		struct xdma_dev *last;
> +
> +		last = list_last_entry(&xdev_list, struct xdma_dev, list_head);
> +		xdev->idx = last->idx + 1;
> +	}
> +	list_add_tail(&xdev->list_head, &xdev_list);
> +	mutex_unlock(&xdev_mutex);
> +
> +	dbg_init("dev %s, xdev 0x%p, xdma idx %d.\n",
> +		 dev_name(&xdev->pdev->dev), xdev, xdev->idx);
> +
> +	spin_lock(&xdev_rcu_lock);
> +	list_add_tail_rcu(&xdev->rcu_node, &xdev_rcu_list);
> +	spin_unlock(&xdev_rcu_lock);
> +
> +	return 0;
> +}
> +
> +static inline void xdev_list_remove(struct xdma_dev *xdev)
> +{
> +	mutex_lock(&xdev_mutex);
> +	list_del(&xdev->list_head);
> +	if (poll_mode && list_empty(&xdev_list))
> +		xdma_threads_destroy();
> +	mutex_unlock(&xdev_mutex);
> +
> +	spin_lock(&xdev_rcu_lock);
> +	list_del_rcu(&xdev->rcu_node);
> +	spin_unlock(&xdev_rcu_lock);
> +	synchronize_rcu();
> +}
> +
> +static struct xdma_dev *xdev_find_by_pdev(struct pci_dev *pdev)
> +{
> +	struct xdma_dev *xdev, *tmp;
> +
> +	mutex_lock(&xdev_mutex);
> +	list_for_each_entry_safe(xdev, tmp, &xdev_list, list_head) {
> +		if (xdev->pdev == pdev) {
> +			mutex_unlock(&xdev_mutex);
> +			return xdev;
> +		}
> +	}
> +	mutex_unlock(&xdev_mutex);
> +	return NULL;
> +}
> +
> +static inline int debug_check_dev_hndl(const char *fname, struct pci_dev *pdev,
> +				       void *hndl)
> +{
> +	struct xdma_dev *xdev;
> +
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	xdev = xdev_find_by_pdev(pdev);
> +	if (!xdev) {
> +		pr_info("%s pdev 0x%p, hndl 0x%p, NO match found!\n", fname,
> +			pdev, hndl);
> +		return -EINVAL;
> +	}
> +	if (xdev != hndl) {
> +		pr_err("%s pdev 0x%p, hndl 0x%p != 0x%p!\n", fname, pdev, hndl,
> +		       xdev);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef __LIBXDMA_DEBUG__

What is this?

> +/* SECTION: Function definitions */
> +inline void __write_register(const char *fn, u32 value, void *iomem,
> +			     unsigned long off)
> +{
> +	pr_err("%s: w reg 0x%lx(0x%p), 0x%x.\n", fn, off, iomem, value);
> +	iowrite32(value, iomem);
> +}
> +#define write_register(v, mem, off) __write_register(__func__, v, mem, off)
> +#else
> +#define write_register(v, mem, off) iowrite32(v, mem)
> +#endif
> +
> +inline u32 read_register(void *iomem)
> +{
> +	return ioread32(iomem);

Just use ioread32, no silly wrappers. Actually, I think it should be
readl/readw/readb and so on...

> +}
> +
> +static inline u32 build_u32(u32 hi, u32 lo)
> +{
> +	return ((hi & 0xFFFFUL) << 16) | (lo & 0xFFFFUL);
> +}
> +
> +static inline u64 build_u64(u64 hi, u64 lo)
> +{
> +	return ((hi & 0xFFFFFFFULL) << 32) | (lo & 0xFFFFFFFFULL);
> +}
> +
> +static void check_nonzero_interrupt_status(struct xdma_dev *xdev)
> +{
> +	struct interrupt_regs *reg =
> +		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
> +					  XDMA_OFS_INT_CTRL);
> +	u32 w;
> +
> +	w = read_register(&reg->user_int_enable);
> +	if (w)
> +		pr_info("%s xdma%d user_int_enable = 0x%08x\n",
> +			dev_name(&xdev->pdev->dev), xdev->idx, w);

prints on interrupts? No, this kills dmesg.

Sorry, you try to push some vendor code, instead of merging to existing
drivers and using Linux coding style. I'll skip parts here - you need to
work on it. :/

> +int xdma_kthread_stop(struct xdma_kthread *thp)
> +{
> +	int rv;
> +
> +	if (!thp->task) {
> +		pr_debug_thread("kthread %s, already stopped.\n", thp->name);
> +		return 0;
> +	}
> +
> +	thp->schedule = 1;
> +	rv = kthread_stop(thp->task);
> +	if (rv < 0) {
> +		pr_warn("kthread %s, stop err %d.\n", thp->name, rv);
> +		return rv;
> +	}
> +
> +	pr_debug_thread("kthread %s, 0x%p, stopped.\n", thp->name, thp->task);
> +	thp->task = NULL;
> +
> +	return 0;
> +}
> +
> +
> +

Code needs cleanup...

(...)

> diff --git a/drivers/dma/xilinx/xdma_thread.h b/drivers/dma/xilinx/xdma_thread.h
> new file mode 100644
> index 000000000000..508dd4c4c890
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_thread.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2017-present,  Xilinx, Inc.

Present? There is no such year.

> + */
> +
> +#ifndef XDMA_THREAD_H
> +#define XDMA_THREAD_H
> +/**
> + * @file

Is it standard kerneldoc comment?

> + * @brief This file contains the declarations for xdma kernel threads
> + *
> + */
> +#include <linux/version.h>
> +#include <linux/spinlock.h>
> +#include <linux/kthread.h>
> +#include <linux/cpuset.h>
> +#include <linux/signal.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> +#include <linux/errno.h>
> +#include "xdma_core.h"
> +
> +#ifdef DEBUG_THREADS
> +#define lock_thread(thp)	\
> +	do { \
> +		pr_debug("locking thp %s ...\n", (thp)->name); \
> +		spin_lock(&(thp)->lock); \
> +	} while (0)
> +
> +#define unlock_thread(thp)	\
> +	do { \
> +		pr_debug("unlock thp %s ...\n", (thp)->name); \
> +		spin_unlock(&(thp)->lock); \
> +	} while (0)
> +
> +#define xdma_kthread_wakeup(thp)	\
> +	do { \
> +		pr_info("signaling thp %s ...\n", (thp)->name); \
> +		wake_up_process((thp)->task); \
> +	} while (0)
> +
> +#define pr_debug_thread(fmt, ...) pr_info(fmt, __VA_ARGS__)
> +
> +#else
> +/** lock thread macro */
> +#define lock_thread(thp)		spin_lock(&(thp)->lock)
> +/** un lock thread macro */
> +#define unlock_thread(thp)		spin_unlock(&(thp)->lock)
> +#define xdma_kthread_wakeup(thp) \
> +	do { \
> +		thp->schedule = 1; \
> +		wake_up_interruptible(&thp->waitq); \
> +	} while (0)
> +/** pr_debug_thread */
> +#define pr_debug_thread(fmt, ...)
> +#endif
> +
> +/**
> + * @struct - xdma_kthread
> + * @brief	xdma thread book keeping parameters
> + */
> +struct xdma_kthread {
> +	/**  thread lock*/

Weird comment style. Use Linux kernel coding style comments. In this
case - use proper kerneldoc.

> +	spinlock_t lock;
> +	/**  name of the thread */
> +	char name[16];
> +	/**  cpu number for which the thread associated with */
> +	unsigned short cpu;
> +	/**  thread id */
> +	unsigned short id;
> +	/**  thread sleep timeout value */
> +	unsigned int timeout;
> +	/**  flags for thread */
> +	unsigned long flag;
> +	/**  thread wait queue */
> +	wait_queue_head_t waitq;
> +	/* flag to indicate scheduling of thread */
> +	unsigned int schedule;
> +	/**  kernel task structure associated with thread*/
> +	struct task_struct *task;
> +	/**  thread work list count */
> +	unsigned int work_cnt;
> +	/**  thread work list count */
> +	struct list_head work_list;
> +	/**  thread initialization handler */
> +	int (*finit)(struct xdma_kthread *thread);
> +	/**  thread pending handler */
> +	int (*fpending)(struct list_head *list);
> +	/**  thread peocessing handler */
> +	int (*fproc)(struct list_head *list);
> +	/**  thread done handler */
> +	int (*fdone)(struct xdma_kthread *thread);
> +};
> +
> +
> +/*****************************************************************************/

Weird comment style. Use Linux kernel coding style comments.

> +/**
> + * xdma_threads_create() - create xdma threads
> + *****************************************************************************/
> +int xdma_threads_create(unsigned int num_threads);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_threads_destroy() - destroy all the xdma threads created
> + *                          during system initialization
> + *
> + * @return	none
> + *****************************************************************************/
> +void xdma_threads_destroy(void);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_thread_remove_work() - handler to remove the attached work thread
> + *
> + * @param[in]	engine:	pointer to xdma_engine
> + *
> + * @return	none
> + *****************************************************************************/
> +void xdma_thread_remove_work(struct xdma_engine *engine);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_thread_add_work() - handler to add a work thread
> + *
> + * @param[in]	engine:	pointer to xdma_engine
> + *
> + * @return	none
> + *****************************************************************************/
> +void xdma_thread_add_work(struct xdma_engine *engine);
> +
> +#endif /* XDMA_THREAD_H */
> diff --git a/drivers/dma/xilinx/xdma_version.h b/drivers/dma/xilinx/xdma_version.h
> new file mode 100644
> index 000000000000..bd061b6bc513
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_version.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.

> + */
> +
> +#ifndef XDMA_VERSION_H
> +#define XDMA_VERSION_H
> +
> +#define DRV_MOD_MAJOR		2021
> +#define DRV_MOD_MINOR		4
> +#define DRV_MOD_PATCHLEVEL	1

What's that? We do not version drivers in Linux kernel. Entire header
should be removed.

> +
> +#define DRV_MODULE_VERSION      \
> +	__stringify(DRV_MOD_MAJOR) "." \
> +	__stringify(DRV_MOD_MINOR) "." \
> +	__stringify(DRV_MOD_PATCHLEVEL)
> +
> +#define DRV_MOD_VERSION_NUMBER  \
> +	((DRV_MOD_MAJOR)*1000 + (DRV_MOD_MINOR)*100 + DRV_MOD_PATCHLEVEL)
> +
> +#endif /* XDMA_VERSION_H */
> diff --git a/include/linux/dma/xilinx_xdma.h b/include/linux/dma/xilinx_xdma.h
> new file mode 100644
> index 000000000000..4a0c3e02ec6f
> --- /dev/null
> +++ b/include/linux/dma/xilinx_xdma.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.
> + * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
> + */
> +
> +#ifndef XILINX_XDMA_H
> +#define XILINX_XDMA_H
> +
> +#include <linux/types.h>
> +#include <linux/scatterlist.h>
> +#include <linux/interrupt.h>
> +
> +/*
> + * xdma_device_open - read the pci bars and configure the fpga
> + *	should be called from probe()
> + *	NOTE: user interrupt will not enabled until xdma_user_isr_enable() is called
> + *
> + * @pdev: ptr to pci_dev

Is it kerneldoc or not? If it is, make it proper kerneldoc.

> + * @mod_name: the module name to be used for request_irq
> + * @user_max: max # of user/event (interrupts) to be configured
> + * @channel_max: max # of c2h and h2c channels to be configured
> + *	NOTE: if the user/channel provisioned is less than the max specified,
> + *	libxdma will update the user_max/channel_max
> + *
> + * returns a opaque handle (for libxdma to identify the device) NULL, in case of
> + * error
> + */
> +void *xdma_device_open(const char *mod_name, struct pci_dev *pdev,
> +		 int *user_max, int *h2c_channel_max, int *c2h_channel_max);
> +

Best regards,
Krzysztof
