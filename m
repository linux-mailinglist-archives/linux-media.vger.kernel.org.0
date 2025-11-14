Return-Path: <linux-media+bounces-47097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEBCC5DAF4
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A52593B30B9
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C387328626;
	Fri, 14 Nov 2025 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i32FKnnf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B53265CAD;
	Fri, 14 Nov 2025 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131590; cv=none; b=Q8dfd1OGkq4Pp7VReKDBrGjt4AviQTTdJ2U2THP+aUspNJfTykB7s2C0XYh0t+NRoh5/W9U1m4qbF6tE73sjcgJ/G3W6iglleqR0QnCmHyhJO9WfJZ8tDFVwJbEWvqt4W9qmWm+6d6vZnaQgNF+dECuKcrPJ7l1bQnMtxA6z7YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131590; c=relaxed/simple;
	bh=2OeKYXvCi9FswCmBTes5mMGtrh8zxfSflP1rjt5sadc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sX4mrQbVvwjEOucZ3lRs46da1/X3UY3PNxV1OtbSQf3QMpwSIMdq1GKAoDDYwtrZwDiKsSjuYOdBEQVAxStvBBb9Gq8gavRPFE4yb9tQCmg+I+n864T8NM763tHsLj4o/if3U75osdwEmSf2eXEIz9osb8apezejt0FA9SuXr8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i32FKnnf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD895C4CEF8;
	Fri, 14 Nov 2025 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131590;
	bh=2OeKYXvCi9FswCmBTes5mMGtrh8zxfSflP1rjt5sadc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=i32FKnnfKRTq1bQnplDX628RCD9p2P1iXSLKCt7Tzo6LtyjuNgM+P7pydA7/XZ28T
	 MtDDBzRO2FHiDk6cPb9EyJ4RK0SoHqhb3XsfpfTXz6u2R6BRDOYQXyDiE8WfLwRcJN
	 cTi8dYg4CbcKE4KUKI8ShoxL34ORWXUkIOhXQRPj9xZGlcXRmiy7LQneFKPe1JGQuJ
	 yR0ITV70Va/TjmhN/bXZukZ7MseMQ63eeRi1Y1S4D2Z9ze/3VjnNII5NlsfTcyqQdO
	 Fo/7XLECFv5KUrI1zgj1gxb2Ph79nuGPrd6SVlzv8bUP10WGJ4LAbVVBwgv4btQmua
	 eVQg4PIVcF/dQ==
Message-ID: <0ad2b299-236b-4dc6-86cd-3ff72400e474@kernel.org>
Date: Fri, 14 Nov 2025 15:46:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v6 2/3] media: platform: Add Renesas Input Video Control
 block driver
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com,
 laurent.pinchart@ideasonboard.com,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20251111-ivc-v6-0-2a0ad3894478@ideasonboard.com>
 <20251111-ivc-v6-2-2a0ad3894478@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20251111-ivc-v6-2-2a0ad3894478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 11/11/2025 17:34, Daniel Scally wrote:
> Add a driver for the Input Video Control block in an RZ/V2H(P) SoC
> which feeds data into the Arm Mali-C55 ISP.
> 
> [ivc: Remove check on buffers list in start_streaming]
> [ivc: put_autosuspend() implies mark_last_busy()]
> [media: rzv2h-ivc: Do not delay frame completion]
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in latest version:
> 
> 	- Requested irq at very end of runtime resume callback and
> 	  not the beginning.
> 	- Switch to devm_mutex_init()
> 	- Disable runtime pm in probe() error path
> 
> Changes in v7:
> 
> 	- Returned buffers to userspace as soon as the first
> 	  interrupt is received instead of waiting until the
> 	  second
> 	- Fixes to the pm runtime invocations
> 	- Some minor formatting changes
> 
> Changes in v6:
> 
> 	- Minor formatting changes
> 	- Dropped CONFIG_ prefix from Kconfig symbols
> 	- Collected tags
> 	- Replaced "RZ/V2H" with "RZ/V2H(P)"
> 	- Reformatted probe function
> 	- Removed leftover reference to media job scheduler
> 	- Drop the .pipeline_started() and .pipeline_stopped()
> 	  media entity operations to remove a dependency for the
> 	  set.
> 
> Changes in v5:
> 
> 	- Fixed .enum_frame_sizes() to properly check that the
> 	  given mbus_code matches the source pads format.
> 	- Tidy up extra space in Kconfig
> 	- Revise Kconfig option message
> 	- Don't mark functions inline
> 	- Fixup misleading comment
> 	- select CONFIG_PM
> 	- Use the new pm_sleep_ptr() functionality
> 	- Minor formatting
> 
> Changes in v4:
> 
> 	- Update the compatible to renesas,r9a09g057-ivc
> 	- Dropped the media jobs / scheduler functionality, and re
> 	  worked the driver to have its own workqueue pushing frames
> 	- Fix .enum_mbus_code() to return 20-bit output for source
> 	  pad.
> 	- Fix some alignment issues
> 	- Make the forwarding of sink to source pad format a more
> 	  explicit operation.
> 	- Rename rzv2h_initialise_video_device_and_queue()
> 	- Reversed order of v4l2_subdev_init_finalize() and
> 	  v4l2_async_register_subdev() to make sure everything is
> 	  finished initialising before registering the subdev.
> 	- Change function to MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER
> 	- Use a parametised macro for min vblank
> 	- Minor formatting
> 	- Use the DEFAULT macros for quantization / ycbcr_enc values
> 	- Switch to using the mplane API
> 	- Dropped select RESET_CONTROLLER
> 	- Used the new helpers for starting a media pipeline
> 	- Switch from threaded irq to normal with driver workqueue
> 	  and revised startup routine
> 
> Changes in v3:
> 
> 	- Account for the renamed CRU pixel formats
> 
> Changes in v2:
> 
> 	- Added selects and depends statements to Kconfig entry
> 	- Fixed copyright year
> 	- Stopped including in .c files headers already included in .h
> 	- Fixed uninitialized variable in iterator
> 	- Only check vvalid member in interrupt function and wait
> 	  unconditionally elsewhere
> 	- __maybe_unused for the PM ops
> 	- Initialise the subdevice after setting up PM
> 	- Fixed the remove function for the driver to actually do
> 	  something.
> 	- Some minor formatting changes
> 	- Fixed the quantization member for the format
> 	- Changes accounting for the v2 of the media jobs framework
> 	- Change min_queued_buffers to 0
> ---
>  drivers/media/platform/renesas/Kconfig             |   1 +
>  drivers/media/platform/renesas/Makefile            |   1 +
>  drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  18 +
>  drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 250 ++++++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 375 +++++++++++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 533 +++++++++++++++++++++
>  .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 130 +++++
>  8 files changed, 1313 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
> index 27a54fa7908384f2e8200f0f7283a82b0ae8435c..bd8247c0b8aa734d2b412438e694f3908d910b25 100644
> --- a/drivers/media/platform/renesas/Kconfig
> +++ b/drivers/media/platform/renesas/Kconfig
> @@ -42,6 +42,7 @@ config VIDEO_SH_VOU
>  source "drivers/media/platform/renesas/rcar-isp/Kconfig"
>  source "drivers/media/platform/renesas/rcar-vin/Kconfig"
>  source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
> +source "drivers/media/platform/renesas/rzv2h-ivc/Kconfig"
>  
>  # Mem2mem drivers
>  
> diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
> index 1127259c09d6a51b70803e76c495918e06777f67..b6b4abf01db246aaf8269b8027efee9b0b32083a 100644
> --- a/drivers/media/platform/renesas/Makefile
> +++ b/drivers/media/platform/renesas/Makefile
> @@ -6,6 +6,7 @@
>  obj-y += rcar-isp/
>  obj-y += rcar-vin/
>  obj-y += rzg2l-cru/
> +obj-y += rzv2h-ivc/
>  obj-y += vsp1/
>  
>  obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Kconfig b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..b30702489d380902bfdcff57f0d70498c85e1d24
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_RZV2H_IVC
> +	tristate "Renesas RZ/V2H(P) Input Video Control block driver"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on OF
> +	select PM

Is it OK if I change this to "depends on PM"? It's what we use in the media subsystem.

This also makes it easier for our CI since one of the tests is to disable PM and checks
that everything still compiles.

Regards,

	Hans

> +	select VIDEOBUF2_DMA_CONTIG
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +          Support for the Renesas RZ/V2H(P) Input Video Control Block
> +          (IVC).
> +
> +          To compile this driver as a module, choose M here: the
> +          module will be called rzv2h-ivc.

Regards,

	Hans

