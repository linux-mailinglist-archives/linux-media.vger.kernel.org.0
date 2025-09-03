Return-Path: <linux-media+bounces-41655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AEAB41B65
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6290A1717DA
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1963E2E9EC8;
	Wed,  3 Sep 2025 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JbZQHV38"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C8B35957;
	Wed,  3 Sep 2025 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894227; cv=none; b=PCgdjGd1NuDL9+UDHtKaSPgUErWfvqRsUQSdN6WVi9ItH1rFkGU+eXYKSdQUlhccKKVloiTfwTYfnuj4cWTeNCwEDBgXv7VzUjsdxkS5JutB2qOY0XaJ+25ezUC92mquqx2pmUmFXxKboAaGeIRTFT+SQEbC0VGY5ukpACROrZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894227; c=relaxed/simple;
	bh=o9v7OeoaChrf+qsuFH2YNoupSpllrVO11lzMlQmeFAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rzf9o7UORGbWnbiEih/JNzQW2w6kyzmdGo163H0QZXg5pka6NTHMQkh5vJV48e3ENnFg7QZEhbEtik5bDDKbB+IXkogUyL5e6YARvhmlbGACOxTAvPTz3OqqQ+X0RtvnRwHmorUX8fj62nYsLZUngzCgTMxPiPCYUeJPuRhN9lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JbZQHV38; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DCB0A8CB;
	Wed,  3 Sep 2025 12:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894154;
	bh=o9v7OeoaChrf+qsuFH2YNoupSpllrVO11lzMlQmeFAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbZQHV38WU0BDD0TpZc4O+Hx1kMMwFuW60RtgAfEylPkcDT4IkdFL7CIH0AoP1cZK
	 g2kVJRRI/1v6udtQ/+GqsIQbsqv0O5I6gpESopg9kudhQEVQ+n02DqLx7LJMf2223e
	 MrLzcxqqh4OMrfQdDAgYMlfXrrQ9v74Tfok3Pvw4=
Date: Wed, 3 Sep 2025 12:10:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Subject: Re: [PATCH v3 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Message-ID: <20250903101002.GD13448@pendragon.ideasonboard.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250828100811.95722-4-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828100811.95722-4-Bin.Du@amd.com>

On Thu, Aug 28, 2025 at 06:08:08PM +0800, Bin Du wrote:
> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
> capture video node, and supports only preview stream. It manages firmware
> states, stream configuration and mipi phy configuration. This change also
> adds interrupt handling and notification for isp firmware to isp-subdevice.
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> ---
>  MAINTAINERS                                   |    2 +
>  drivers/media/platform/amd/isp4/Makefile      |    3 +-
>  drivers/media/platform/amd/isp4/isp4.c        |  120 +-
>  drivers/media/platform/amd/isp4/isp4.h        |    8 +-
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 1096 +++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4_subdev.h |  131 ++
>  6 files changed, 1347 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h

[snip]

> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
> index 8535f662ab49..00ac11ed8fb0 100644
> --- a/drivers/media/platform/amd/isp4/isp4.h
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -6,19 +6,21 @@
>  #ifndef _ISP4_H_
>  #define _ISP4_H_
>  
> +#include <drm/amd/isp.h>
>  #include <linux/mutex.h>
> -#include <media/v4l2-device.h>
> -#include <media/videobuf2-memops.h>
> -#include <media/videobuf2-vmalloc.h>
> +#include "isp4_subdev.h"
>  
>  #define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>  
>  struct isp4_device {
>  	struct v4l2_device v4l2_dev;
> +	struct isp4_subdev isp_sdev;
>  	struct media_device mdev;
>  
> +	struct isp_platform_data *pltf_data;
>  	struct platform_device *pdev;
>  	struct notifier_block i2c_nb;
> +	struct v4l2_async_notifier notifier;

As far as I can tell, i2c_nb and notifier are not used anymore.

>  };
>  
>  #endif /* _ISP4_H_ */

[snip]

-- 
Regards,

Laurent Pinchart

