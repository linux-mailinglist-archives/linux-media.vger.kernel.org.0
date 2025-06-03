Return-Path: <linux-media+bounces-34030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1394DACCE0F
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 22:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF75B3A375F
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 20:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8335221D92;
	Tue,  3 Jun 2025 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COHJ4WCl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E52EB1D;
	Tue,  3 Jun 2025 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748981844; cv=none; b=iApVGHBtDN4oUw8+/D/IygGfXA9AAEm0rZmKKTgzVvAUjwtVeGsrfoeP6efRYEDGbvE0mGxukaKebtocgPkE3961DNzUfaFg9loNyWfR5ore+HYwevHfQs1MQOlQPrr7eJ4s+QzSIAw1sFjrbVoJM8JDPJpjc/ahXbsr8112ric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748981844; c=relaxed/simple;
	bh=yV4ekByytzguS9M+Qf6n8nfcrxTdF0tMI0CZ/FW+ZhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpUANnfm6cul9Te2e3khhEhWlui6RFwR1yGFyik4ur4HBL5FmEmq4OM+gYMO+xsNIVVEB88f074lPfvX9c4SJ8pv2TU8QmYzZyGHMes/4JtFU8pg6eLV+UICICKl5+k3Q/arZG+eZw+kIEvuFM0apouGFN2fDQT7CaZpUI+fESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COHJ4WCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E28C4CEED;
	Tue,  3 Jun 2025 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748981843;
	bh=yV4ekByytzguS9M+Qf6n8nfcrxTdF0tMI0CZ/FW+ZhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COHJ4WCl7wgYi/p077xcxhMr+c0ECulzW+gv4fS4wPm2p4q7u4MZnD98iq1rKD+em
	 WFFr3W/IsOPLbgashjQK3TtL/CaAUWHvYgvItY+J0Nk/9UQOw1zIdDuasY65jYDvBD
	 xuQG9QjyHYQ/fycBwT9/n72StDDKeNnuBpuLd6JA9lu4ibSfRyQ5STGHCdTVu5uoFp
	 rLOnLO2zdlz9l//CCQTnruR35L602rP83EgxTdgpLBIh3La6ojwmvQ7VS1XmZr7Hdy
	 vsjNh0XF/J/ZOxRGGONIIdFYW4QI2FYApB//Hvt+YHkuO3id79x08lA7lOBc/Qipct
	 g+maGoP328NCg==
Date: Tue, 3 Jun 2025 15:17:20 -0500
From: Rob Herring <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 07/10] accel/rocket: Add job submission IOCTL
Message-ID: <20250603201720.GA2119676-robh@kernel.org>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>

On Tue, May 20, 2025 at 12:27:00PM +0200, Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
> 
> The job submission code was initially based on Panfrost.
> 
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>   Frattaroli)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - Use drm_* logging functions (Thomas Zimmermann)
> - Rename reg i/o macros (Thomas Zimmermann)
> - Add padding to ioctls and check for zero (Jeff Hugo)
> - Improve error handling (Nicolas Frattaroli)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>


> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..aee6ebdb2bd227439449fdfcab3ce7d1e39cd4c4
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -0,0 +1,723 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> +/* Copyright 2019 Collabora ltd. */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/rocket_accel.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "rocket_core.h"
> +#include "rocket_device.h"
> +#include "rocket_drv.h"
> +#include "rocket_job.h"
> +#include "rocket_registers.h"
> +
> +#define JOB_TIMEOUT_MS 500
> +
> +static struct rocket_job *
> +to_rocket_job(struct drm_sched_job *sched_job)
> +{
> +	return container_of(sched_job, struct rocket_job, base);
> +}
> +
> +struct rocket_fence {
> +	struct dma_fence base;
> +	struct drm_device *dev;
> +	/* rocket seqno for signaled() test */
> +	u64 seqno;
> +	int queue;

AFAICT, you are not using any of the elements here. So you can just drop 
rocket_fence and use dma_fence.

Rob

