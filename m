Return-Path: <linux-media+bounces-36811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F64AF8D6C
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 800B91754F2
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293042BEFE6;
	Fri,  4 Jul 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C/+JdCFc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735BC2EBDF6;
	Fri,  4 Jul 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619399; cv=none; b=Jp5fmnJciI4CUWPcpd+5DItLUbjX7uaee3dRzQMajYjqE+FJISCS1jaPEB5WKYG4y2DdpVTOy2m9foj8FLGdLcu0A3YMWs4qcl4eV6ryTFV/zxLcNJzR4NRJ61ia+6hBJRe5Ddwzz+Cc5YDAgiUUJbBJJMYiWmcgOTMm5DFSPZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619399; c=relaxed/simple;
	bh=y1j/5Cpk8bPb641kRnAZ7hwtcYIwzQznPTALWGJ9fVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfT8b+mUqrZX5T2iiHUdyXFbCbfTeWXnzZ252G7EtDKK/S+rHs+wePyaFRD5CsHQGj6ZR5A+ExwIqiDJnKMhLCaVimwN72APhMn+t1B/+EYWAsqIYIbjw93rGFbPm0jtWpz5wjHL5TJ7d1qbY7Ss0kRmQ1ZU002duXRu9Ox/BFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C/+JdCFc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E1409667;
	Fri,  4 Jul 2025 10:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751619369;
	bh=y1j/5Cpk8bPb641kRnAZ7hwtcYIwzQznPTALWGJ9fVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/+JdCFcyFuFUjl0QTjLej9Xh05699NjSblVGkEA7NTpLykJbK7wfxC4CUjBACvZU
	 vcOGW37478l7BW/3U6xRbSAt7++pBYugym6uc+1NYHApNY6oCyads4kSY9QdMAFwUi
	 D2owJvVj3WhBx3sQowso2QN7Oy4LeQlR1UdwX6KY=
Date: Fri, 4 Jul 2025 11:56:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Matt Ranostay <matt@ranostay.sg>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Fend <matthias.fend@emfend.at>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 41/80] media: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250704085604.GC14736@pendragon.ideasonboard.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>

Hi Sakari,

On Fri, Jul 04, 2025 at 10:54:31AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/media/i2c/alvium-csi2.c                          | 1 -
>  drivers/media/i2c/ccs/ccs-core.c                         | 4 ----
>  drivers/media/i2c/dw9768.c                               | 1 -
>  drivers/media/i2c/gc0308.c                               | 3 ---
>  drivers/media/i2c/gc2145.c                               | 3 ---
>  drivers/media/i2c/imx219.c                               | 2 --
>  drivers/media/i2c/imx283.c                               | 3 ---
>  drivers/media/i2c/imx290.c                               | 3 ---
>  drivers/media/i2c/imx296.c                               | 1 -
>  drivers/media/i2c/imx415.c                               | 1 -
>  drivers/media/i2c/mt9m114.c                              | 6 ------
>  drivers/media/i2c/ov4689.c                               | 3 ---
>  drivers/media/i2c/ov5640.c                               | 4 ----
>  drivers/media/i2c/ov5645.c                               | 3 ---
>  drivers/media/i2c/ov64a40.c                              | 4 ----
>  drivers/media/i2c/ov8858.c                               | 2 --
>  drivers/media/i2c/st-mipid02.c                           | 2 --
>  drivers/media/i2c/tc358746.c                             | 5 -----
>  drivers/media/i2c/thp7312.c                              | 4 ----
>  drivers/media/i2c/vd55g1.c                               | 4 ----
>  drivers/media/i2c/vd56g3.c                               | 4 ----
>  drivers/media/i2c/video-i2c.c                            | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 -----
>  drivers/media/platform/nvidia/tegra-vde/h264.c           | 2 --
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c        | 1 -
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c     | 2 --
>  drivers/media/platform/verisilicon/hantro_drv.c          | 1 -
>  drivers/media/rc/gpio-ir-recv.c                          | 1 -
>  29 files changed, 83 deletions(-)

[snip]

> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 487bcabb4a19..3316639b695e 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -788,7 +788,6 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  	}
>  
>  	if (pm_status > 0) {
> -		pm_runtime_mark_last_busy(&client->dev);
>  		pm_runtime_put_autosuspend(&client->dev);
>  	}

You can now drop the curly braces.

>  

[snip]

> diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
> index a5da4fe47e0b..15912ecb8d26 100644
> --- a/drivers/media/i2c/ov64a40.c
> +++ b/drivers/media/i2c/ov64a40.c

[snip]

> @@ -3330,7 +3328,6 @@ static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
>  	}
>  
>  	if (pm_status > 0) {
> -		pm_runtime_mark_last_busy(ov64a40->dev);
>  		pm_runtime_put_autosuspend(ov64a40->dev);
>  	}

Same here.

>  

[snip]

> diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
> index bf6d8fa983bf..161f8919022c 100644
> --- a/drivers/media/rc/gpio-ir-recv.c
> +++ b/drivers/media/rc/gpio-ir-recv.c
> @@ -49,7 +49,6 @@ static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
>  		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
>  
>  	if (pmdev) {
> -		pm_runtime_mark_last_busy(pmdev);
>  		pm_runtime_put_autosuspend(pmdev);
>  	}

And here too.

With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  

-- 
Regards,

Laurent Pinchart

