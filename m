Return-Path: <linux-media+bounces-42976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A071B94C02
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 09:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDE4C2A6A67
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 07:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0BE31158E;
	Tue, 23 Sep 2025 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="Z9fNVCLx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0330FF1D
	for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758612230; cv=none; b=jLk58FB7WZ6uQIPZFDoy+qDxz/pPFytNg1qwi5Vc7q1A1E446+8nyHZKITRiZiGC71ryULuC0B/GCps3+57yFetp1A+Z0/Wt1cisFCMmZb0jxNVs9824CUGEv5WF4QH3xDRxYh/aXutpbNy/H6yTwolDxpu8U5aBa7ZSNxdal+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758612230; c=relaxed/simple;
	bh=X5P0MIZIwkosYQTM5XtUfHiRXvvAmkgGMwT2iUBdw8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeE8x6kZ1tYIUnfJc8stUBnp7Nfit9LctlGtNiSiml3VNbXcPNKz9Gcs82rRPHskd2ZkRLOkjoFhfnIKxeDHF/M4x+vpAZalLiWhjMPjQG5jglFMTUfjzRrwGvE2cbUkvs0LX12TpcG95Jz5ejgpHF3r+KcePAfNZgHwNcws03E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=Z9fNVCLx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77dedf198d4so5677531b3a.0
        for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1758612227; x=1759217027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cL67ZD0AZh6GVAoy8COe5KCFsK+5pwCpb46aKZofFZE=;
        b=Z9fNVCLxY4g5Em/RCag95aDZpDoDQZ/yMdJ5oLppLNweRxz1EzDYh0yYsvJQrOgMfw
         NzCIYKTxXLeZ0yEa3HCRnrVlM24LztP8NjolrQOrIczkYBrZPrLjXECiyTn+Ggk/UZt1
         b9QTd660vBVRL2ciTQGQTYheVxlgdU6al2SXxrTu4z+sqsigAAVmZgspPxQLLXa8qOz2
         XxrJSxF641gq2KQI38odexF6WLREzwgL3GYaTbDpIPGiCgKzvu0AI5wbC7BQjov+XKQj
         DdfmX1Ia9koRQ5sJ8hFPKAl4zFBZx5sxgrZwN2pV5+APa+WiIZgCZp75Ni+1kVJ8iglo
         tbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758612227; x=1759217027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cL67ZD0AZh6GVAoy8COe5KCFsK+5pwCpb46aKZofFZE=;
        b=awLhpfQTPRbxnCWOROirNnHS8CmsRIp5e+/0kE+cdpl9WZIFy5rO3maiPrGSIKuI++
         DXvw0JAW495awZOFhyFBLBqG3s6kiYrWJbIMGy2uaIpRPHsdLA5Si+80H1EfOhsDQ9Jx
         XpXdD/ktnoYrv0C8K2yvX42ZJumsZrJg7oTWd9dGdXAoZIjgNHmD4i8MTwHM/++4AANl
         149v5pui1NTGUN5bPObztCsinnYAKn7IltEe5pHiue9PBuh/NsvUqkAGuUt+zNKCYFG6
         vHfkog5s543tej41LL0S7OyTKWVA441n2WGD/TwTpQ1SbN+5lAj/2T3Obqtnq0wXxgxq
         L3lg==
X-Forwarded-Encrypted: i=1; AJvYcCVbnyzfX72eXtc5tyDbP+VDhCYMfvOHoc/YNnwPi45PKDNAxMZOBlGqtpYYqi+hl7Q85mTn2Aw5P/OwfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4enGqT1/YCx5U7Wvy62/nv4XMsnAZWz3Ck2QzXc27sxSCRHLw
	KGdI/CBQUdrw1d5WECMZxZniGWzT+o8AcBcmjGUJ+ZObl33muLvMFex8GnS53Pivre1D
X-Gm-Gg: ASbGncvMMnAAhTeSa2+7eZX4IPNvl4w4RDR+xVBn0JfosVj8l17uH3pFGuhSHW378/F
	asKy5EGWb5Wih7d6D1VQPvKVjXyjHf2Yk8QY/LXfeBIeSj1DLit+KypH2iflYtbF9Dt1sMH3Z3i
	r8jCEIsvBCgk+K+d9havVUrN32KgZpyAMu9pB43ORFJvV2m433ZjvZAh7nU1I3hEHyDpGCcB4+R
	3eyy7O2lURlEmTeDYr4xKqoW1osNuLeVkjlTBk0PNzen5Xkv9IfQ92vrpY3YIihjOR+RGMKM3tM
	9vfgpvEIBkW7R+L9TxTd3V3rU9BaxFZ053BddZtYju1TdYWUOyQK9HtiSyB+f800l2ZiuHaGIfj
	Yc6oBIDffKc+HTmJ7ZQ0H0KSv
X-Google-Smtp-Source: AGHT+IG9CE7/GwMb+c9t62indrMOSvtvX3KNmjqUtAT4saZJ1Ilp2yky3pKJgActI/L6/RoGfgh6vQ==
X-Received: by 2002:a05:6a00:1956:b0:77f:3e56:c1c0 with SMTP id d2e1a72fcca58-77f53b1cf1bmr2380870b3a.32.1758612226565;
        Tue, 23 Sep 2025 00:23:46 -0700 (PDT)
Received: from sultan-box ([79.127.217.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f228b412esm7684885b3a.40.2025.09.23.00.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 00:23:45 -0700 (PDT)
Date: Tue, 23 Sep 2025 00:23:42 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Message-ID: <aNJK_tZe99_jWNdR@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-5-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911100847.277408-5-Bin.Du@amd.com>

Hi Bin,

On Thu, Sep 11, 2025 at 06:08:44PM +0800, Bin Du wrote:
> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
> capture video node, and supports only preview stream. It manages firmware
> states, stream configuration. Add interrupt handling and notification for
> isp firmware to isp-subdevice.
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>

[snip]

> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -5,13 +5,19 @@
>  
>  #include <linux/pm_runtime.h>
>  #include <linux/vmalloc.h>
> +
> +#include <media/v4l2-fwnode.h>
>  #include <media/v4l2-ioctl.h>
>  
>  #include "isp4.h"
> -
> -#define VIDEO_BUF_NUM 5
> +#include "isp4_hw_reg.h"
>  
>  #define ISP4_DRV_NAME "amd_isp_capture"
> +#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
> +	(ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK | \
> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK | \
> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
>  
>  /* interrupt num */
>  static const u32 isp4_ringbuf_interrupt_num[] = {
> @@ -21,19 +27,95 @@ static const u32 isp4_ringbuf_interrupt_num[] = {
>  	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>  };
>  
> -#define to_isp4_device(dev) \
> -	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
> +#define to_isp4_device(dev) container_of(dev, struct isp4_device, v4l2_dev)
> +
> +static void isp4_wake_up_resp_thread(struct isp4_subdev *isp, u32 index)
> +{
> +	if (isp && index < ISP4SD_MAX_FW_RESP_STREAM_NUM) {
> +		struct isp4sd_thread_handler *thread_ctx =
> +				&isp->fw_resp_thread[index];
> +
> +		thread_ctx->wq_cond = 1;
> +		wake_up_interruptible(&thread_ctx->waitq);
> +	}
> +}
> +
> +static void isp4_resp_interrupt_notify(struct isp4_subdev *isp, u32 intr_status)
> +{
> +	bool wake = (isp->ispif.status == ISP4IF_STATUS_FW_RUNNING);
> +
> +	u32 intr_ack = 0;
> +
> +	/* global response */
> +	if (intr_status &
> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK) {
> +		if (wake)
> +			isp4_wake_up_resp_thread(isp, 0);
> +
> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK;

The INT_MASKs and ACK_MASKs are the same; perhaps the ACK_MASKs can just be
removed so you can just write intr_status to ISP_SYS_INT0_ACK instead?

> +	}
> +
> +	/* stream 1 response */
> +	if (intr_status &
> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK) {
> +		if (wake)
> +			isp4_wake_up_resp_thread(isp, 1);
> +
> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK;
> +	}
> +
> +	/* stream 2 response */
> +	if (intr_status &
> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK) {
> +		if (wake)
> +			isp4_wake_up_resp_thread(isp, 2);
> +
> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK;
> +	}
> +
> +	/* stream 3 response */
> +	if (intr_status &
> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK) {
> +		if (wake)
> +			isp4_wake_up_resp_thread(isp, 3);
> +
> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK;
> +	}

I think it'd be cleaner to put these masks into an array and loop over them in
here instead of writing them all out by hand.

> +
> +	/* clear ISP_SYS interrupts */
> +	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_ACK, intr_ack);
> +}
>  
>  static irqreturn_t isp4_irq_handler(int irq, void *arg)
>  {
> +	struct isp4_device *isp_dev = dev_get_drvdata(arg);

This is technically a data race because setting drvdata and reading drvdata do
not use WRITE_ONCE() and READ_ONCE(), respectively. And enabling the IRQ before
the handler is allowed to do anything is why that `if (!isp_dev)` check exists,
because that is another race.

Instead, pass the isp_dev pointer through the private pointer of
devm_request_irq() and add IRQ_NOAUTOEN so the IRQ is enabled by default. Then,
when it is safe for the IRQ to run, enable it with enable_irq().

That way you can delete the `if (!isp_dev)` check and resolve the two races.

> +	struct isp4_subdev *isp = NULL;
> +	u32 isp_sys_irq_status = 0x0;

Remove unnecessary initialization of `isp` and `isp_sys_irq_status` variables.

> +	u32 r1;
> +
> +	if (!isp_dev)
> +		goto error_drv_data;
> +
> +	isp = &isp_dev->isp_sdev;
> +	/* check ISP_SYS interrupts status */
> +	r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_STATUS);
> +
> +	isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;

There are four IRQs (one for each stream) but any one of the IRQs can result in
a notification for _all_ streams. Each IRQ should only do the work of its own
stream.

You can do this by passing devm_request_irq() a private pointer to indicate the
mapping between a stream and its IRQ, so that isp4_irq_handler() can know which
stream it should look at.

> +
> +	isp4_resp_interrupt_notify(isp, isp_sys_irq_status);
> +
> +error_drv_data:
>  	return IRQ_HANDLED;
>  }
>  
>  static int isp4_capture_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct isp4_subdev *isp_sdev;
>  	struct isp4_device *isp_dev;
> -	int i, irq, ret;
> +	size_t i;
> +	int irq;
> +	int ret;
>  
>  	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
>  	if (!isp_dev)
> @@ -42,6 +124,12 @@ static int isp4_capture_probe(struct platform_device *pdev)
>  	isp_dev->pdev = pdev;
>  	dev->init_name = ISP4_DRV_NAME;
>  
> +	isp_sdev = &isp_dev->isp_sdev;
> +	isp_sdev->mmio = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(isp_sdev->mmio))
> +		return dev_err_probe(dev, PTR_ERR(isp_sdev->mmio),
> +				     "isp ioremap fail\n");
> +
>  	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>  		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>  		if (irq < 0)
> @@ -55,6 +143,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
>  					     irq);
>  	}
>  
> +	isp_dev->pltf_data = pdev->dev.platform_data;
> +
>  	/* Link the media device within the v4l2_device */
>  	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>  
> @@ -66,6 +156,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
>  	isp_dev->mdev.dev = &pdev->dev;
>  	media_device_init(&isp_dev->mdev);
>  
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);
>  	/* register v4l2 device */
>  	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>  		 "AMD-V4L2-ROOT");
> @@ -74,19 +166,24 @@ static int isp4_capture_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "fail register v4l2 device\n");
>  
> +	ret = isp4sd_init(&isp_dev->isp_sdev, &isp_dev->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "fail init isp4 sub dev %d\n", ret);
> +		goto err_unreg_v4l2;
> +	}
> +
>  	ret = media_device_register(&isp_dev->mdev);
>  	if (ret) {
>  		dev_err(dev, "fail to register media device %d\n", ret);
> -		goto err_unreg_v4l2;
> +		goto err_isp4_deinit;
>  	}
>  
>  	platform_set_drvdata(pdev, isp_dev);
>  
> -	pm_runtime_set_suspended(dev);
> -	pm_runtime_enable(dev);
> -
>  	return 0;
>  
> +err_isp4_deinit:
> +	isp4sd_deinit(&isp_dev->isp_sdev);
>  err_unreg_v4l2:
>  	v4l2_device_unregister(&isp_dev->v4l2_dev);
>  
> @@ -97,8 +194,13 @@ static void isp4_capture_remove(struct platform_device *pdev)
>  {
>  	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>  
> +	v4l2_device_unregister_subdev(&isp_dev->isp_sdev.sdev);
> +
>  	media_device_unregister(&isp_dev->mdev);
> +	media_entity_cleanup(&isp_dev->isp_sdev.sdev.entity);

Why is isp4_capture_remove() handling the cleanup responsibility of
isp4sd_deinit()? The v4l2_device_unregister_subdev() and media_entity_cleanup()
on the subdev should only be done by isp4sd_deinit().

Since v4l2_device_unregister_subdev() is not called by isp4sd_deinit(), this
results in missing cleanup on error from isp4_capture_probe() when
isp4sd_deinit() is called.

>  	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +
> +	isp4sd_deinit(&isp_dev->isp_sdev);
>  }
>  
>  static struct platform_driver isp4_capture_drv = {

[snip]

> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -0,0 +1,1095 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/mutex.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "isp4_fw_cmd_resp.h"
> +#include "isp4_interface.h"
> +#include "isp4_subdev.h"
> +#include <linux/units.h>
> +
> +#define ISP4SD_MAX_CMD_RESP_BUF_SIZE (4 * 1024)
> +#define ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 4
> +
> +#define ISP4SD_PERFORMANCE_STATE_LOW 0
> +#define ISP4SD_PERFORMANCE_STATE_HIGH 1
> +
> +#define ISP4SD_FW_CMD_TIMEOUT_IN_MS  500
> +#define ISP4SD_WAIT_RESP_IRQ_TIMEOUT  5 /* ms */
> +/* align 32KB */
> +#define ISP4SD_META_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
> +
> +#define to_isp4_subdev(v4l2_sdev)  \
> +	container_of(v4l2_sdev, struct isp4_subdev, sdev)
> +
> +static const char *isp4sd_entity_name = "amd isp4";
> +
> +static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool enable)
> +{
> +	if (isp_subdev->enable_gpio) {
> +		gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
> +		dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
> +			enable ? "enable" : "disable");
> +	}
> +}
> +
> +static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_send_buffer buf_type = {};

Use memset to guarantee zeroing of padding bits.

> +	struct device *dev = isp_subdev->dev;
> +	int ret;
> +
> +	if (!ispif->fw_mem_pool) {
> +		dev_err(dev, "fail to alloc mem pool\n");
> +		return -ENOMEM;
> +	}
> +
> +	buf_type.buffer_type = BUFFER_TYPE_MEM_POOL;
> +	buf_type.buffer.buf_tags = 0;
> +	buf_type.buffer.vmid_space.bit.vmid = 0;
> +	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> +	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
> +			    &buf_type.buffer.buf_base_a_lo,
> +			    &buf_type.buffer.buf_base_a_hi);
> +	buf_type.buffer.buf_size_a = (u32)ispif->fw_mem_pool->mem_size;
> +
> +	ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> +				  &buf_type, sizeof(buf_type));
> +	if (ret) {
> +		dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
> +			ispif->fw_mem_pool->gpu_mc_addr,
> +			buf_type.buffer.buf_size_a,
> +			ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
> +		ispif->fw_mem_pool->gpu_mc_addr,
> +		buf_type.buffer.buf_size_a);
> +
> +	return 0;
> +};
> +
> +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_set_stream_cfg cmd = {};

Use memset to guarantee zeroing of padding bits.

> +	struct device *dev = isp_subdev->dev;
> +
> +	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
> +	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
> +	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
> +
> +	cmd.stream_cfg.b_enable_tnr = true;
> +	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
> +		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
> +		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
> +		cmd.stream_cfg.b_enable_tnr);
> +
> +	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
> +				   &cmd, sizeof(cmd));
> +}
> +
> +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_send_buffer buf_type = {};

Use memset to guarantee zeroing of padding bits.

> +	struct isp4sd_sensor_info *sensor_info;
> +	struct device *dev = isp_subdev->dev;
> +	u32 i;
> +
> +	sensor_info = &isp_subdev->sensor_info;
> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> +		int ret;
> +
> +		if (!sensor_info->meta_info_buf[i]) {
> +			dev_err(dev, "fail for no meta info buf(%u)\n", i);
> +			return -ENOMEM;
> +		}
> +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
> +		buf_type.buffer.buf_tags = 0;
> +		buf_type.buffer.vmid_space.bit.vmid = 0;
> +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> +		isp4if_split_addr64(sensor_info->meta_info_buf[i]->gpu_mc_addr,
> +				    &buf_type.buffer.buf_base_a_lo,
> +				    &buf_type.buffer.buf_base_a_hi);
> +		buf_type.buffer.buf_size_a =
> +			(u32)sensor_info->meta_info_buf[i]->mem_size;
> +		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> +					  &buf_type,
> +					  sizeof(buf_type));
> +		if (ret) {
> +			dev_err(dev, "send meta info(%u) fail\n", i);
> +			return ret;
> +		}
> +	}
> +
> +	dev_dbg(dev, "send meta info suc\n");
> +	return 0;
> +}

[snip]

> +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
> +			       struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	struct isp4sd_output_info *output_info =
> +			&isp_subdev->sensor_info.output_info;
> +	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop = {};

Use memset to guarantee zeroing of padding bits.

> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_enable_out_ch cmd_ch_en = {};

Use memset to guarantee zeroing of padding bits.

> +	struct device *dev = isp_subdev->dev;
> +	struct isp4fw_image_prop *out_prop;
> +	int ret;
> +
> +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
> +		return 0;
> +
> +	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
> +		dev_err(dev, "fail for previous start fail\n");
> +		return -EINVAL;
> +	}
> +
> +	out_prop = &cmd_ch_prop.image_prop;
> +	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
> +	cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
> +	cmd_ch_en.is_enable = true;
> +
> +	if (!isp4sd_get_str_out_prop(isp_subdev, out_prop, state, pad)) {
> +		dev_err(dev, "fail to get out prop\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
> +		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
> +		cmd_ch_prop.image_prop.luma_pitch,
> +		cmd_ch_prop.image_prop.chroma_pitch);
> +
> +	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
> +				  &cmd_ch_prop,
> +				  sizeof(cmd_ch_prop));
> +	if (ret) {
> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
> +		dev_err(dev, "fail to set out prop\n");
> +		return ret;
> +	};
> +
> +	ret = isp4if_send_command(ispif, CMD_ID_ENABLE_OUT_CHAN,
> +				  &cmd_ch_en, sizeof(cmd_ch_en));
> +
> +	if (ret) {
> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
> +		dev_err(dev, "fail to enable channel\n");
> +		return ret;
> +	}
> +
> +	if (!sensor_info->start_stream_cmd_sent) {
> +		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
> +					    out_prop->height);
> +		if (ret) {
> +			dev_err(dev, "kickoff stream fail %d\n", ret);
> +			return ret;
> +		}
> +		/*
> +		 * sensor_info->start_stream_cmd_sent will be set to true
> +		 * 1. in isp4sd_kickoff_stream, if app first send buffer then
> +		 * start stream
> +		 * 2. in isp_set_stream_buf, if app first start stream, then
> +		 * send buffer
> +		 * because ISP FW has the requirement, host needs to send buffer
> +		 * before send start stream cmd
> +		 */
> +		if (sensor_info->start_stream_cmd_sent) {
> +			sensor_info->status = ISP4SD_START_STATUS_STARTED;
> +			output_info->start_status = ISP4SD_START_STATUS_STARTED;
> +			dev_dbg(dev, "kickoff stream suc,start cmd sent\n");
> +		}
> +	} else {
> +		dev_dbg(dev, "stream running, no need kickoff\n");
> +		output_info->start_status = ISP4SD_START_STATUS_STARTED;
> +	}
> +
> +	dev_dbg(dev, "setup output suc\n");
> +	return 0;
> +}
> +
> +static int isp4sd_init_meta_buf(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	u32 i;
> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> +		if (!sensor_info->meta_info_buf[i]) {
> +			sensor_info->meta_info_buf[i] = ispif->metainfo_buf_pool[i];
> +			if (!sensor_info->meta_info_buf[i]) {
> +				dev_err(dev, "invalid %u meta_info_buf fail\n", i);
> +				return -ENOMEM;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

What is the point of metainfo_buf_pool? Especially since metainfo_buf_pool[i] is
not set to NULL after this "allocation" occurs.

I think isp4sd_init_meta_buf() and metainfo_buf_pool are unnecessary and can be
factored out.

> +
> +static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
> +{
> +	struct device *dev = isp_subdev->dev;
> +	int ret;
> +
> +	ret  = isp4sd_setup_fw_mem_pool(isp_subdev);
> +	if (ret) {
> +		dev_err(dev, "fail to  setup fw mem pool\n");
> +		return ret;
> +	}
> +
> +	ret  = isp4sd_init_meta_buf(isp_subdev);
> +	if (ret) {
> +		dev_err(dev, "fail to alloc fw driver shared buf\n");
> +		return ret;
> +	}
> +
> +	ret = isp4sd_set_stream_path(isp_subdev);
> +	if (ret) {
> +		dev_err(dev, "fail to setup stream path\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void isp4sd_reset_stream_info(struct isp4_subdev *isp_subdev,
> +				     struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	struct v4l2_mbus_framefmt *format = NULL;

Remove unnecessary initialization of `format`.

> +	struct isp4sd_output_info *str_info;
> +	int i;
> +
> +	format = v4l2_subdev_state_get_format(state, pad, 0);
> +
> +	if (!format) {
> +		dev_err(isp_subdev->dev, "fail to setup stream path\n");
> +	} else {
> +		memset(format, 0, sizeof(*format));
> +		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
> +	}
> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++)
> +		sensor_info->meta_info_buf[i] = NULL;
> +
> +	str_info = &sensor_info->output_info;
> +	str_info->start_status = ISP4SD_START_STATUS_NOT_START;
> +}

[snip]

> +static struct isp4fw_meta_info *
> +isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
> +		      u64 mc)
> +{
> +	u32 i;

Change u32 to int for `i` to match other ISP4IF_MAX_STREAM_BUF_COUNT loops.

> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> +		struct isp4if_gpu_mem_info *meta_info_buf =
> +				isp_subdev->sensor_info.meta_info_buf[i];
> +
> +		if (meta_info_buf) {
> +			if (mc == meta_info_buf->gpu_mc_addr)
> +				return meta_info_buf->sys_addr;
> +		}

meta_info_buf is never NULL. Also it's easier to read with the constant operand
on the right side of the comparison. Change to:

		if (meta_info_buf->gpu_mc_addr == mc)
			return meta_info_buf->sys_addr;

> +	}
> +	return NULL;
> +};

Remove unnecessary ; after }.

> +
> +static struct isp4if_img_buf_node *
> +isp4sd_preview_done(struct isp4_subdev *isp_subdev,
> +		    struct isp4fw_meta_info *meta)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4if_img_buf_node *prev = NULL;
> +	struct device *dev = isp_subdev->dev;
> +
> +	if (meta->preview.enabled &&
> +	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
> +	     meta->preview.status == BUFFER_STATUS_DONE ||
> +	     meta->preview.status == BUFFER_STATUS_DIRTY)) {
> +		prev = isp4if_dequeue_buffer(ispif);
> +		if (!prev)
> +			dev_err(dev, "fail null prev buf\n");
> +
> +	} else if (meta->preview.enabled) {
> +		dev_err(dev, "fail bad preview status %u\n",
> +			meta->preview.status);
> +	}
> +
> +	return prev;
> +}
> +
> +static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
> +				  u64 meta_info_mc)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_send_buffer buf_type = {};

Use memset to guarantee zeroing of padding bits.

> +	struct device *dev = isp_subdev->dev;
> +
> +	if (isp_subdev->sensor_info.status != ISP4SD_START_STATUS_STARTED) {
> +		dev_warn(dev, "not working status %i, meta_info 0x%llx\n",
> +			 isp_subdev->sensor_info.status, meta_info_mc);
> +		return;
> +	}
> +
> +	if (meta_info_mc) {
> +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
> +		buf_type.buffer.buf_tags = 0;
> +		buf_type.buffer.vmid_space.bit.vmid = 0;
> +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> +		isp4if_split_addr64(meta_info_mc,
> +				    &buf_type.buffer.buf_base_a_lo,
> +				    &buf_type.buffer.buf_base_a_hi);
> +
> +		buf_type.buffer.buf_size_a = ISP4SD_META_BUF_SIZE;
> +		if (isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> +					&buf_type, sizeof(buf_type))) {
> +			dev_err(dev, "fail send meta_info 0x%llx\n",
> +				meta_info_mc);
> +		} else {
> +			dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
> +		}
> +	}
> +}
> +
> +static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
> +				      enum isp4if_stream_id stream_id,
> +				      struct isp4fw_resp_param_package *para)
> +{
> +	struct isp4if_img_buf_node *prev = NULL;
> +	struct device *dev = isp_subdev->dev;
> +	struct isp4fw_meta_info *meta;
> +	u64 mc = 0;
> +
> +	mc = isp4if_join_addr64(para->package_addr_lo, para->package_addr_hi);
> +	meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
> +	if (mc == 0 || !meta) {

If `mc == 0` is always an error then why pass it to isp4sd_get_meta_by_mc()?
Change it to skip isp4sd_get_meta_by_mc() when mc is 0, or make
isp4sd_get_meta_by_mc() return NULL when mc is 0 and then you can remove the
`mc == 0` check from here.

> +		dev_err(dev, "fail to get meta from mc %llx\n", mc);
> +		return;
> +	}
> +
> +	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
> +		ktime_get_ns(), stream_id, meta->poc,
> +		meta->preview.enabled,
> +		meta->preview.status);
> +
> +	prev = isp4sd_preview_done(isp_subdev, meta);
> +
> +	isp4if_dealloc_buffer_node(prev);
> +
> +	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
> +		isp4sd_send_meta_info(isp_subdev, mc);
> +
> +	dev_dbg(dev, "stream_id:%d, status:%d\n", stream_id,
> +		isp_subdev->sensor_info.status);
> +}
> +
> +static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
> +				enum isp4if_stream_id stream_id)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	struct isp4fw_resp resp;
> +
> +	if (ispif->status < ISP4IF_STATUS_FW_RUNNING)
> +		return;

If the lifetime of the kthread is managed correctly, this check shouldn't be
needed.

> +
> +	while (true) {
> +		s32 ret;

Change from s32 to int to match isp4if_f2h_resp().

> +
> +		ret = isp4if_f2h_resp(ispif, stream_id, &resp);
> +		if (ret)
> +			break;

This loop just parses responses from firmware until the ringbuffer has nothing
new left, which kind of makes the IRQ useless when this scenario occurs, meaning
that you can mask the IRQ from the IRQ handler and then unmask it when the
resp kthread goes back to sleep. So the IRQ doesn't fire needlessly.

> +
> +		switch (resp.resp_id) {
> +		case RESP_ID_CMD_DONE:
> +			isp4sd_fw_resp_cmd_done(isp_subdev, stream_id,
> +						&resp.param.cmd_done);
> +			break;
> +		case RESP_ID_NOTI_FRAME_DONE:
> +			isp4sd_fw_resp_frame_done(isp_subdev, stream_id,
> +						  &resp.param.frame_done);
> +			break;
> +		default:
> +			dev_err(dev, "-><- fail respid (0x%x)\n",
> +				resp.resp_id);
> +			break;
> +		}
> +	}
> +}
> +
> +static s32 isp4sd_fw_resp_thread_wrapper(void *context)
> +{
> +	struct isp4_subdev_thread_param *para = context;
> +	struct isp4sd_thread_handler *thread_ctx;
> +	enum isp4if_stream_id stream_id;
> +
> +	struct isp4_subdev *isp_subdev;
> +	struct device *dev;
> +	u64 timeout;
> +
> +	if (!para)
> +		return -EINVAL;
> +
> +	isp_subdev = para->isp_subdev;
> +	dev = isp_subdev->dev;
> +
> +	switch (para->idx) {
> +	case 0:
> +		stream_id = ISP4IF_STREAM_ID_GLOBAL;
> +		break;
> +	case 1:
> +		stream_id = ISP4IF_STREAM_ID_1;
> +		break;
> +	default:
> +		dev_err(dev, "fail invalid %d\n", para->idx);
> +		return -EINVAL;
> +	}
> +
> +	thread_ctx = &isp_subdev->fw_resp_thread[para->idx];
> +
> +	thread_ctx->wq_cond = 0;
> +	mutex_init(&thread_ctx->mutex);

This mutex doesn't protect anything. Remove it.

> +	init_waitqueue_head(&thread_ctx->waitq);
> +	timeout = msecs_to_jiffies(ISP4SD_WAIT_RESP_IRQ_TIMEOUT);
> +
> +	dev_dbg(dev, "[%u] started\n", para->idx);
> +
> +	while (true) {
> +		wait_event_interruptible_timeout(thread_ctx->waitq,
> +						 thread_ctx->wq_cond != 0,
> +						 timeout);

Why is there a timeout? What does the timeout even do since the return value of
wait_event_interruptible_timeout() is not checked? Doesn't that mean that once
the timeout is hit, isp4sd_fw_resp_func() will be called for nothing?

I observe that most of the time spent by these kthreads is due to the constant
wake-ups from the very short 5 ms timeout. This is bad for energy efficiency and
creates needless overhead.

> +		thread_ctx->wq_cond = 0;
> +
> +		if (kthread_should_stop()) {
> +			dev_dbg(dev, "[%u] quit\n", para->idx);
> +			break;
> +		}
> +
> +		guard(mutex)(&thread_ctx->mutex);
> +		isp4sd_fw_resp_func(isp_subdev, stream_id);
> +	}
> +
> +	mutex_destroy(&thread_ctx->mutex);
> +
> +	return 0;
> +}
> +
> +static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
> +{
> +	struct device *dev = isp_subdev->dev;
> +	int i;
> +
> +	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
> +		struct isp4sd_thread_handler *thread_ctx =
> +				&isp_subdev->fw_resp_thread[i];
> +
> +		isp_subdev->isp_resp_para[i].idx = i;
> +		isp_subdev->isp_resp_para[i].isp_subdev = isp_subdev;
> +
> +		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread_wrapper,
> +						 &isp_subdev->isp_resp_para[i],
> +						 "amd_isp4_thread");

The kthread name and also the IRQ name can be made more informative by appending
the index number.

> +		if (IS_ERR(thread_ctx->thread)) {
> +			dev_err(dev, "create thread [%d] fail\n", i);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}

[snip]

> +static u32 isp4sd_get_started_stream_count(struct isp4_subdev *isp_subdev)
> +{
> +	u32 cnt = 0;
> +
> +	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
> +		cnt++;
> +	return cnt;
> +}

isp4sd_get_started_stream_count() is unnecessary, remove it and just use
`if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)` instead.

> +
> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +
> +	struct device *dev = isp_subdev->dev;
> +	u32 cnt;
> +	int ret;
> +
> +	mutex_lock(&isp_subdev->ops_mutex);
> +
> +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
> +		dev_err(dev, "fail for stream still running\n");
> +		mutex_unlock(&isp_subdev->ops_mutex);
> +		return -EINVAL;
> +	}
> +
> +	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
> +	cnt = isp4sd_get_started_stream_count(isp_subdev);
> +	if (cnt > 0) {
> +		dev_dbg(dev, "no need power off isp_subdev\n");
> +		mutex_unlock(&isp_subdev->ops_mutex);
> +		return 0;
> +	}
> +
> +	isp4if_stop(ispif);
> +
> +	ret = dev_pm_genpd_set_performance_state(dev, perf_state);
> +	if (ret)
> +		dev_err(dev,
> +			"fail to set isp_subdev performance state %u,ret %d\n",
> +			perf_state, ret);
> +	isp4sd_stop_resp_proc_threads(isp_subdev);
> +	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
> +	/* hold ccpu reset */
> +	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0x0);
> +	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
> +	ret = pm_runtime_put_sync(dev);
> +	if (ret)
> +		dev_err(dev, "power off isp_subdev fail %d\n", ret);
> +	else
> +		dev_dbg(dev, "power off isp_subdev suc\n");
> +
> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
> +	isp4if_clear_cmdq(ispif);
> +	isp4sd_module_enable(isp_subdev, false);
> +
> +	msleep(20);

What is this msleep for?

> +
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +
> +	return 0;
> +}
> +
> +static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	int ret;
> +
> +	if (ispif->status == ISP4IF_STATUS_FW_RUNNING) {

`ispif->status` is checked under ops_mutex elsewhere but not in this function?

> +		dev_dbg(dev, "camera already opened, do nothing\n");
> +		return 0;
> +	}
> +
> +	mutex_lock(&isp_subdev->ops_mutex);
> +
> +	isp4sd_module_enable(isp_subdev, true);
> +
> +	isp_subdev->sensor_info.start_stream_cmd_sent = false;
> +	isp_subdev->sensor_info.buf_sent_cnt = 0;
> +
> +	if (ispif->status < ISP4IF_STATUS_PWR_ON) {
> +		unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_HIGH;
> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret) {
> +			dev_err(dev, "fail to power on isp_subdev ret %d\n",
> +				ret);
> +			goto err_unlock_and_close;
> +		}
> +
> +		/* ISPPG ISP Power Status */
> +		isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0x7FF);
> +		ret = dev_pm_genpd_set_performance_state(dev, perf_state);
> +		if (ret) {
> +			dev_err(dev,
> +				"fail to set performance state %u, ret %d\n",
> +				perf_state, ret);
> +			goto err_unlock_and_close;
> +		}
> +
> +		ispif->status = ISP4IF_STATUS_PWR_ON;
> +
> +		if (isp4sd_start_resp_proc_threads(isp_subdev)) {
> +			dev_err(dev, "isp_start_resp_proc_threads fail");
> +			goto err_unlock_and_close;
> +		} else {
> +			dev_dbg(dev, "create resp threads ok");
> +		}
> +	}
> +
> +	isp_subdev->sensor_info.start_stream_cmd_sent = false;
> +	isp_subdev->sensor_info.buf_sent_cnt = 0;
> +
> +	ret = isp4if_start(ispif);
> +	if (ret) {
> +		dev_err(dev, "fail to start isp_subdev interface\n");
> +		goto err_unlock_and_close;
> +	}
> +
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +	return 0;
> +err_unlock_and_close:
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +	isp4sd_pwroff_and_deinit(isp_subdev);
> +	return -EINVAL;
> +}

[snip]

> +static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
> +{
> +	struct isp4_subdev *ispsd = to_isp4_subdev(sd);

`ispsd` is the variable name used here and in a couple other functions but
`isp_subdev` is the name used everywhere else. Make the variable name consistent
for `struct isp4_subdev *`.

> +

Add `guard(mutex)(&ispsd->ops_mutex);` here and remove all uses of ops_mutex
from isp4sd_pwron_and_init() and isp4sd_pwroff_and_deinit(). This simplifies the
locking and also ensures that the lock is not released and reacquired when
isp4sd_pwron_and_init() needs to call isp4sd_pwroff_and_deinit() on error.

> +	if (on)
> +		return isp4sd_pwron_and_init(ispsd);
> +	else
> +		return isp4sd_pwroff_and_deinit(ispsd);
> +};

Remove unnecessary ; after }.

> +
> +static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
> +	.s_power = isp4sd_set_power,
> +};

[snip]

> +int isp4sd_init(struct isp4_subdev *isp_subdev,
> +		struct v4l2_device *v4l2_dev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4sd_sensor_info *sensor_info;
> +	struct device *dev = v4l2_dev->dev;
> +	int ret;
> +
> +	isp_subdev->dev = dev;
> +	v4l2_subdev_init(&isp_subdev->sdev, &isp4sd_subdev_ops);
> +	isp_subdev->sdev.owner = THIS_MODULE;
> +	isp_subdev->sdev.dev = dev;
> +	snprintf(isp_subdev->sdev.name, sizeof(isp_subdev->sdev.name), "%s",
> +		 dev_name(dev));
> +
> +	isp_subdev->sdev.entity.name = isp4sd_entity_name;
> +	isp_subdev->sdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
> +	isp_subdev->sdev.entity.ops = &isp4sd_sdev_ent_ops;
> +	isp_subdev->sdev_pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&isp_subdev->sdev.entity, 1,
> +				     &isp_subdev->sdev_pad);
> +	if (ret) {
> +		dev_err(dev, "fail to init isp4 subdev entity pad %d\n", ret);
> +		return ret;
> +	}
> +	ret = v4l2_subdev_init_finalize(&isp_subdev->sdev);
> +	if (ret < 0) {
> +		dev_err(dev, "fail to init finalize isp4 subdev %d\n",
> +			ret);
> +		return ret;
> +	}
> +	ret = v4l2_device_register_subdev(v4l2_dev, &isp_subdev->sdev);
> +	if (ret) {
> +		dev_err(dev, "fail to register isp4 subdev to V4L2 device %d\n",
> +			ret);
> +		goto err_media_clean_up;

Missing error handling: v4l2_subdev_cleanup() is not called.

> +	}
> +
> +	sensor_info = &isp_subdev->sensor_info;
> +
> +	isp4if_init(ispif, dev, isp_subdev->mmio);
> +
> +	mutex_init(&isp_subdev->ops_mutex);
> +	sensor_info->start_stream_cmd_sent = false;
> +	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
> +
> +	/* create ISP enable gpio control */
> +	isp_subdev->enable_gpio = devm_gpiod_get(isp_subdev->dev,
> +						 "enable_isp",
> +						 GPIOD_OUT_LOW);
> +	if (IS_ERR(isp_subdev->enable_gpio)) {
> +		dev_err(dev, "fail to get gpiod %d\n", ret);

This prints ret instead of the actual error, PTR_ERR(isp_subdev->enable_gpio).

Instead, add `ret = PTR_ERR(isp_subdev->enable_gpio);` before the dev_err().

> +		media_entity_cleanup(&isp_subdev->sdev.entity);
> +		return PTR_ERR(isp_subdev->enable_gpio);

Missing error handling: v4l2_device_unregister_subdev() is not called.

Add another goto label and use that instead of returning here.

> +	}
> +
> +	isp_subdev->host2fw_seq_num = 1;
> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
> +
> +	if (ret)
> +		goto err_media_clean_up;
> +	return ret;

ret is always zero at this point. Remove this `if (ret) ...` and change the
return to `return 0`.

> +
> +err_media_clean_up:
> +	media_entity_cleanup(&isp_subdev->sdev.entity);
> +	return ret;
> +}
> +
> +void isp4sd_deinit(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +
> +	media_entity_cleanup(&isp_subdev->sdev.entity);
> +	isp4if_deinit(ispif);
> +	isp4sd_module_enable(isp_subdev, false);
> +
> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
> +}
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
> new file mode 100644
> index 000000000000..524a8de5e18d
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_CONTEXT_H_
> +#define _ISP4_CONTEXT_H_
> +
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/platform_device.h>
> +#include <linux/uaccess.h>
> +#include <linux/types.h>
> +#include <linux/debugfs.h>
> +#include <media/v4l2-device.h>
> +
> +#include "isp4_fw_cmd_resp.h"
> +#include "isp4_hw_reg.h"
> +#include "isp4_interface.h"
> +
> +/*
> + * one is for none sesnor specefic response which is not used now
> + * another is for sensor specific response
> + */
> +#define ISP4SD_MAX_FW_RESP_STREAM_NUM 2

Only two out of four possible streams are used, yet IRQs are requested for all
four streams in isp4_capture_probe(). ISP4SD_MAX_FW_RESP_STREAM_NUM should be
checked and used to limit the number of IRQs requested in isp4_capture_probe().

> +
> +/*
> + * cmd used to register frame done callback, parameter is
> + * struct isp4sd_register_framedone_cb_param *
> + * when a image buffer is filled by ISP, ISP will call the registered callback.
> + * callback func prototype is isp4sd_framedone_cb, cb_ctx can be anything
> + * provided by caller which will be provided back as the first parameter of the
> + * callback function.
> + * both cb_func and cb_ctx are provide by caller, set cb_func to NULL to
> + * unregister the callback
> + */

[snip]

> +void isp4sd_deinit(struct isp4_subdev *isp_subdev);
> +
> +#endif

Add /* _ISP4_CONTEXT_H_ */

> -- 
> 2.34.1
> 

Sultan

