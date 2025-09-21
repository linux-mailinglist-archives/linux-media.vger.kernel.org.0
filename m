Return-Path: <linux-media+bounces-42848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF7B8E519
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 22:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38E5B3BD189
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 20:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E101F28D82A;
	Sun, 21 Sep 2025 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="FuCV2l7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146527055E
	for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758486225; cv=none; b=EBmIXm+B5py5+RfJJF2B5AMnprIo6Z6j2CeG40fBguF0AeoqsexQA3IqWoVYY297tRs8G9I6ZgRRG+IpfY8gt/JbG6a4Z9cJUt43jj4W/ie2kmF6q0aSHpZXHJfzX6qppLwEC7XHzllmdPT7wS3xBt2m7TdBx3Q+0Z+jNnne33w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758486225; c=relaxed/simple;
	bh=3Qky9KnjohG7xWAKypKH4N+8pnVS98dgtgaL7zUuGc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehYGHTpy/ITLZh4/UT5HH+YixQFC5B5/DrVQNVCzfIbBBfPF5FiRNSUSzmnC81OxlnJ+BWLuZaS2Tp8aNx36YDbMfzYBmgRK2P0O5TZEl4u1rgmiKIDtWSg9NsxPPmz7VyQf5l3HuEWv2zZJU6JXAeDLOfaogB9e8Zc8DtnTo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=FuCV2l7/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-269639879c3so36890935ad.2
        for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 13:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1758486221; x=1759091021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JZxIzAartu9ONh15YXkN5AwTrZHGKB1VwmY0Xneo7c=;
        b=FuCV2l7/fhbvPuT91orPhRHTdISCVlsQ17ElyQr5Osw++PxRc86QuK7e/casedh8kT
         2n8uz/Ngl8P278NY4B9McAfp+Hg3AFDYKyzYKd2Ba6D4bqr00L/tHMCUbZ6DGcQTn69R
         FOzlFuT2fe3SOB9XPJpu4EYn2ACx9wZCYFcgREezBOZHINj1iPIkehhWGTqqDs35j5Ga
         V6g4LA+4d+7SLMBEZjJpPZtceG1F7B1P78PgFYuWaI6yeI5XoaEofD9Uu3pG3zdKpu6A
         xIxqLA73Ndk9m4kT/f7n+ieksum0cl18cKXTuX/i3ztbDwV94OOLH6uNavOSLi6UM0Ue
         vSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758486221; x=1759091021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JZxIzAartu9ONh15YXkN5AwTrZHGKB1VwmY0Xneo7c=;
        b=HPCz0LbVPv6VcH5+6jwPKAeL7KImeKC8rDCYWi4P0xFSMXMCcRmNoOp8r83UWb+NMT
         oKRpLeQw2RMmgc3mpiN7AJtSds1+Od9Bj3ED7P5DkSRPtg21zOwC3EOBBO88WoPerZ+i
         xB8RhMOdHUXBSisobq1ueA5f5IrGj+B4pw87z3I8a3BMK4UIHjb7waI6Ct4BAqliAq6y
         oIl4WNBSucE+pyeken/aj5l9YZPb6n6eVqjzGkVo68/gCPmDp4jtudtO41X527VBUZ9T
         YvG4wYoOUKFKP5lLpPYfoT8Ab8SB0hXsMk/AerP0M5C03BmZbhH3tbUjrdAVrXnfiT9j
         0GiA==
X-Forwarded-Encrypted: i=1; AJvYcCXbGI95pmgrdysbRriXVS8hU79TDB6AtXPfHLzhptVz+oN5hUxfLTJCQkM2uhdXu6T7cKPe+fijd6R7ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYi6nl0XlNBQcZA/O6AR6L9Ipac3Pfu/ntnVU+L86IiNgvATLZ
	FrVgDWc8UZTGXG6QBHOSYFQix9Gv2+Wepd1UudDnoWJgc0S50bh0KfZE9xFHQgOzxciA
X-Gm-Gg: ASbGncvrLA1jFntORIn45wx5uMRUGgNoZJFE7WEHzggUks9YxVJNM1UlvMS+Bby08Na
	7ZaFmrXtFglgvr+6POFDjO5qYSbdVWGfkI2VzzwsIL25U9lz2Oj979MZg7c0UGK/93541eoBTOm
	B/e8G2efatOTh9S3JMghRIwG7ogMYlhulQX+EHmnwGpTsJN2xY2hLfOJYI/QRSG6RYgb8bkwKuq
	7bDYjLU4H0a/ZROtn6itomXPT11TmnjKlYxLo9+cIYK3pwFLnCxGREVxdpF0PDJodii8A9MDB0g
	w4iLid+bG9oEYCnH3cx1AfeN9govh2iVRDOfehLvqRzkkkYMCqGLCUQqUFBomULB10XiZT0WEKK
	hQjtUieySP31BUZrgJz7SalXl
X-Google-Smtp-Source: AGHT+IEJlkSkntjaKiFRoVV3hUysXntSgWZ6ecRDuofXNz2X0T9uNFSJBtgiJHnFkfEf7jQdEgPujg==
X-Received: by 2002:a17:902:ebc4:b0:262:9ac8:610f with SMTP id d9443c01a7336-269ba447cd3mr153065445ad.22.1758486221598;
        Sun, 21 Sep 2025 13:23:41 -0700 (PDT)
Received: from sultan-box ([79.127.217.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de963sm109831135ad.77.2025.09.21.13.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 13:23:41 -0700 (PDT)
Date: Sun, 21 Sep 2025 13:23:37 -0700
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
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Mario Limonciello <superm1@kernel.org>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
Message-ID: <aNBeyf5ivmqXwzbj@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-2-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911100847.277408-2-Bin.Du@amd.com>

Hi Bin,

On Thu, Sep 11, 2025 at 06:08:41PM +0800, Bin Du wrote:
> AMD isp4 capture is a v4l2 media device which implements media controller
> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
> be connected to a remote CSI2 TX endpoint. It supports only one physical
> interface for now. Also add ISP4 driver related entry info into the
> MAINTAINERS file
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>

[snip]

> +++ b/drivers/media/platform/amd/isp4/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +config AMD_ISP4
> +	tristate "AMD ISP4 and camera driver"
> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API && DRM_AMD_ISP
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS

VIDEO_V4L2_SUBDEV_API should be selected rather than set as a dependency, per
what other drivers do. You can also sort the dependencies to look cleaner.

Change to:

	depends on VIDEO_DEV && DRM_AMD_ISP
	select VIDEOBUF2_CORE
	select VIDEOBUF2_MEMOPS
	select VIDEOBUF2_V4L2
	select VIDEO_V4L2_SUBDEV_API

> +	help
> +	  This is support for AMD ISP4 and camera subsystem driver.
> +	  Say Y here to enable the ISP4 and camera device for video capture.
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called amd_capture.

[snip]

> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "isp4.h"
> +
> +#define VIDEO_BUF_NUM 5
> +
> +#define ISP4_DRV_NAME "amd_isp_capture"
> +
> +/* interrupt num */
> +static const u32 isp4_ringbuf_interrupt_num[] = {
> +	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
> +	1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
> +	3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
> +	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
> +};
> +
> +#define to_isp4_device(dev) \
> +	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))

The unnecessary cast on container_of() is removed later in "[PATCH v4 4/7]
media: platform: amd: isp4 subdev and firmware loading handling added".

Remove the cast in this patch instead.

> +
> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +static int isp4_capture_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct isp4_device *isp_dev;
> +	int i, irq, ret;
> +
> +	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);

s/&pdev->dev/dev/

> +	if (!isp_dev)
> +		return -ENOMEM;
> +
> +	isp_dev->pdev = pdev;
> +	dev->init_name = ISP4_DRV_NAME;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
> +		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
> +		if (irq < 0)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "fail to get irq %d\n",
> +					     isp4_ringbuf_interrupt_num[i]);

Return the error from platform_get_irq() here instead of -ENODEV.

> +		ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
> +				       "ISP_IRQ", &pdev->dev);

s/&pdev->dev/dev/

> +		if (ret)
> +			return dev_err_probe(dev, ret, "fail to req irq %d\n",
> +					     irq);
> +	}
> +
> +	/* Link the media device within the v4l2_device */
> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
> +
> +	/* Initialize media device */
> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
> +		sizeof(isp_dev->mdev.model));
> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
> +		 "platform:%s", ISP4_DRV_NAME);
> +	isp_dev->mdev.dev = &pdev->dev;

s/&pdev->dev/dev/

> +	media_device_init(&isp_dev->mdev);
> +
> +	/* register v4l2 device */
> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
> +		 "AMD-V4L2-ROOT");
> +	ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);

s/&pdev->dev/dev/

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "fail register v4l2 device\n");
> +
> +	ret = media_device_register(&isp_dev->mdev);
> +	if (ret) {
> +		dev_err(dev, "fail to register media device %d\n", ret);
> +		goto err_unreg_v4l2;
> +	}
> +
> +	platform_set_drvdata(pdev, isp_dev);
> +
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +err_unreg_v4l2:
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +
> +	return dev_err_probe(dev, ret, "isp probe fail\n");
> +}

[snip]

> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_H_
> +#define _ISP4_H_
> +
> +#include <linux/mutex.h>

Remove this linux/mutex.h include. It should be moved to isp4_subdev.h instead.

> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-memops.h>
> +#include <media/videobuf2-vmalloc.h>

This media/videobuf2-vmalloc.h include is removed in "[PATCH v4 4/7] media:
platform: amd: isp4 subdev and firmware loading handling added".

Remove it in this patch instead.

> +
> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
> +
> +struct isp4_device {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +
> +	struct platform_device *pdev;
> +	struct notifier_block i2c_nb;

i2c_nb is unused, remove it.

> +};
> +
> +#endif /* _ISP4_H_ */
> -- 
> 2.34.1
> 

Sultan

