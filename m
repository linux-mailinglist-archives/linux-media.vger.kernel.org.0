Return-Path: <linux-media+bounces-42849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB67EB8E55B
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 22:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 046E77AC2B4
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 20:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC6B28D8D9;
	Sun, 21 Sep 2025 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="cmt4qfgY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EBB286416
	for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 20:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758486682; cv=none; b=QaUeA2bXEeKtU4uIub6u4kbhTsgQJ0t7r+7O7nGzAgQGt3DpfEkU+cIFBUvEcNbuSKBMtcGOyZRL4d3dPPJR3l9iLe/MtVc4Z97hTjZ+RH0OaZbyptTRUN4Vj/OVDTO0pUq1qcpV1UKhZx+XUaTQfmoV+Nm7LpcH7BENTV+t+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758486682; c=relaxed/simple;
	bh=axBa+dj4HB39cZjZhfEDMsv7hHO/HGQu9wvFL/Tb50o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4r61VF/1YcnGcpl3zKca1WjfaBMSUD+QU2auQz0MukMEq5Xal3YgrUs/W68h1o6fCWxz0lfzS2tnHAGwPzovnYmaXVBzZSv14ioKoLEvxWJhHqIHqVA0myLVjc/+XwxmeVQiutOVzQs9Q5cD+ZF+12hjNWRh/K6UM5vfQionVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=cmt4qfgY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33274fcf5c1so182834a91.1
        for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 13:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1758486680; x=1759091480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkhSDdzj5xF5sJ0V2SWAfan5oCRu1CDItuZmMcAwdU8=;
        b=cmt4qfgY0rqq6Br5RaczcXRcaBMVywDqB79KkIc4iPi6cFOM/67cZZkHfXs4Xs0lcR
         R9nhehIEurouWlb7OR6O3n9NknlJux+jwqocnWOIQYtKZM/n0LUUqXlL5jH70nxWTuGF
         F3c+5BGZWJqe2VCpbQ1ambVKka61qEFDRwNlOwTLt5NjS3lKjqHxMDmLJFjx5VlK6IEK
         JJyEYzTvcBxjZplxysOUv5TKbaCikuh9OzCSm7aIpUM8q5+ONUh0GJsK8OAY4qojloBI
         8NvzC6xhfwf7QMAuFnvdD9wFJB4vGPSIw/Yg7PrY8d3K0/3aKM5jVw3QUedcnCGXQJUd
         3DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758486680; x=1759091480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkhSDdzj5xF5sJ0V2SWAfan5oCRu1CDItuZmMcAwdU8=;
        b=WknVYttzrrFNYW2jgRGXUEEiKygcQa6k6P68w3RgUC/g4BWN7LCjt5AS4SO3chxcHK
         Syi2uLFggxO41FxpfTk1VpuqTL175CRaQ3oxcO1IWhCR8tjPauNfsYfiI8k/A1x+2xA/
         BNEr4fDZCERuhZyPPumL9ntes9k+GdaqP7miOY9BReit1c5b0oTex4N+U2XE10pvcbpE
         UoS+KqAhvaaqJGb7lGcwb4lQ7ylg8W/VHCyVygDiuuEODKk0V1ZYilz2qUXqtxQ8ajw3
         DcD0vvvX6aCS0QQXlnTiFFdwLTOw2H/7uOjRo4GJ7t53Ils8ExHO15qfkZ8UBtQL4bZN
         ITbg==
X-Forwarded-Encrypted: i=1; AJvYcCXXhUJf/L3o5+SomeBx6saU4hioPWQt6A6kOoUdxs5vxSGmWCoHP0Wp0SyqzxmjBZP/VvMXc2NpnNE3YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLrI7rYSdEOTBv/Wz5lYT4k/P98mYCsAAIzoUWwPrAfVmkRlBM
	H0qAvUcTDrwq/c3uCedLyDnyEOcFoVkXJYRJ4jrfrI9OREIs3h3CMrssD2wzeJNmY80w
X-Gm-Gg: ASbGncuyOSdCseODc/eVmCHh7II1JDjUQLBOcA2wkl560wI2eBeRWrNkKxVw1Y/t6EB
	DH8olSWRJxdTcXEF8Pp+SLs8rekPGJH8YY9Rx2eLPrdA6s8N6PcOVIWu/KtqSMH5mIb+svmRcJt
	wqLn4vV4ctgYoUd9X/f2lkzHhj/k6OzCNoMCjRYunKmsN6TEu8OE18pp8Bif8cTnZXeTZLyPwiv
	hEjcqV0I3nEL9Yj7NbmBdfjt6vwxiLOSyQjCoaVbdp1YkjoC/ybUBTGI2rSKnfo9xXFl5mJVMIo
	vyScf2RJ7umDgjuFqqX7DrvtHmMyPML1yVICChLYNAD1Bikcnao7wAGiefs38UlzwPOdmEzMlUW
	ZyNkL8Q1IWyjRX5tltcOqAVQe
X-Google-Smtp-Source: AGHT+IFced1ck500UG1sSQ2oA5JIKQTgG9625dNvOnPrh1McuPXBq0dD26/IITzmWfDQV2NcSL0qiQ==
X-Received: by 2002:a17:90a:e703:b0:32e:7270:94a1 with SMTP id 98e67ed59e1d1-33098356f85mr14880190a91.17.1758486680541;
        Sun, 21 Sep 2025 13:31:20 -0700 (PDT)
Received: from sultan-box ([79.127.217.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79c2esm10647810b3a.2.2025.09.21.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 13:31:19 -0700 (PDT)
Date: Sun, 21 Sep 2025 13:31:15 -0700
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
Subject: Re: [PATCH v4 2/7] media: platform: amd: low level support for isp4
 firmware
Message-ID: <aNBgk71V1rvYqiN7@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-3-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911100847.277408-3-Bin.Du@amd.com>

Hi Bin,

On Thu, Sep 11, 2025 at 06:08:42PM +0800, Bin Du wrote:
> Low level functions for accessing the registers and mapping to their
> ranges. This change also includes register definitions for ring buffer
> used to communicate with ISP Firmware. Ring buffer is the communication
> interface between driver and ISP Firmware. Command and responses are
> exchanged through the ring buffer.
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>

[snip]

> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -3,4 +3,4 @@
>  # Copyright (C) 2025 Advanced Micro Devices, Inc.
>  
>  obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> -amd_capture-objs := isp4.o
> +amd_capture-objs := isp4.o	\

Remove this hunk since there are no new objects added in this patch.

> +++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
> @@ -0,0 +1,125 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_HW_REG_H_
> +#define _ISP4_HW_REG_H_
> +
> +#include <linux/io.h>
> +#include <linux/types.h>

Remove redundant linux/types.h include, as it is included by linux/io.h.

> +
> +#define ISP_SOFT_RESET			0x62000

[snip]

> +
> +#endif

Add /* _ISP4_HW_REG_H_ */

> -- 
> 2.34.1
> 

Sultan

