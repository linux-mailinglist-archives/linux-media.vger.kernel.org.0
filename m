Return-Path: <linux-media+bounces-2101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB880CBE7
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D9B1F214B1
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4502047A4F;
	Mon, 11 Dec 2023 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X4uakWG1"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165273C0D;
	Mon, 11 Dec 2023 05:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702302909;
	bh=WBItE2IlN0PtPIfQCeYqezlapPIzL12UK6zVfo5uWbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X4uakWG1DsrnKjASes1eorbZbdxS4mUyOxQO/1brFb8PHjXLNiCk27x+0Yn6EF19G
	 REOUXsGCtEYTTcC1QS6rGMz1AkBK7112A+xFO8hxk7Hv9JngxznEAk0+LUTUp0cn9i
	 mTIutertVdJEcHoqaDFrJWXS7UIX3TPVHVgWEom69jzUNLqk3+HqkO6eWrQWG+8H36
	 DBoIWj1JjxJpRmEsdhRqB6WJbDQ1eXuqdpqnnFJ5+GWIsMwo8BoulikHMVmR8Se3vl
	 c7iJfJEyMwkcETCFpGEvsW+xhi3MvMp8LOjIkuqbqf2jOi26MOO1LPzAhHNlBe8k/V
	 Ku6xY03N0WEeg==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 46018378110F;
	Mon, 11 Dec 2023 13:55:09 +0000 (UTC)
Message-ID: <b0b7f247-72ed-4628-bf8b-d56ae6b0b77e@collabora.com>
Date: Mon, 11 Dec 2023 14:55:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Clean up min_buffers_needed misusages
To: hverkuil@xs4all.nl, mchehab@kernel.org, tfiga@chromium.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231211133251.150999-1-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20231211133251.150999-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Main subject in wrong it is the cover letter for v5 series.

Le 11/12/2023 à 14:32, Benjamin Gaignard a écrit :
> This series implement Hans's RFC: https://www.spinics.net/lists/linux-media/msg244455.html
>
> To summarize Hans's proposal it is needed to distinguish two cases:
> - the minimal number of buffers to be allocated when calling
>    VIDIOC_REQBUFS.
> - the minimale number of queued buffers before start streaming.
> Until now drivers use vb2_queue min_buffers_needed field in the both
> cases but before introduce delete buffers we need to clarify for which
> usage each of them use min_buffers_needed field.
>
> The branch with all patches is here:
> https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/clean_min_need_buffers_v5
>
> I have tested with this command line, I haven't notice issues:
> ./test-media -kmemleak mc
>
> changes in version 5:
> - Fix the comments done by Hans:
>    Rework comments on videobuf2-core.h
>    Add checks in vb2_core_queue_init().
> - Patch test-drivers to use min_reqbufs_allocation field.
>
> changes in version 4:
> - restore removed lines in zoran and vdec drivers.
>
> changes in version 3:
> - Just rename min_buffers_needed into min_queued_buffers everywhere
>    without trying to fix the drivers.
> - Introduce min_reqbufs_allocation field to be used when calling VIDIOC_REQBUFS.
>
> changes in version 2:
> - change min_buffers_needed into min_queues_buffers instead of min_dma_buffers_needed
> - patches order
> - only one patch to rename min_buffers_needed into min_queues_buffer
>
> Benjamin Gaignard (3):
>    videobuf2: core: Rename min_buffers_needed field to vb2_queue
>    videobuf2: Add min_reqbufs_allocation field to vb2_queue structure
>    media: test-drivers: Set REQBUFS minimum number of buffers
>
>   drivers/input/touchscreen/atmel_mxt_ts.c      |  2 +-
>   drivers/input/touchscreen/sur40.c             |  2 +-
>   drivers/media/common/saa7146/saa7146_fops.c   |  2 +-
>   .../media/common/videobuf2/videobuf2-core.c   | 34 +++++++++++--------
>   drivers/media/dvb-core/dvb_vb2.c              |  2 +-
>   drivers/media/i2c/video-i2c.c                 |  2 +-
>   drivers/media/pci/bt8xx/bttv-driver.c         |  2 +-
>   drivers/media/pci/cobalt/cobalt-v4l2.c        |  2 +-
>   drivers/media/pci/cx18/cx18-streams.c         |  2 +-
>   drivers/media/pci/cx23885/cx23885-417.c       |  2 +-
>   drivers/media/pci/cx23885/cx23885-dvb.c       |  2 +-
>   drivers/media/pci/cx23885/cx23885-video.c     |  4 +--
>   drivers/media/pci/cx25821/cx25821-video.c     |  2 +-
>   drivers/media/pci/cx88/cx88-blackbird.c       |  2 +-
>   drivers/media/pci/cx88/cx88-dvb.c             |  2 +-
>   drivers/media/pci/cx88/cx88-video.c           |  4 +--
>   drivers/media/pci/dt3155/dt3155.c             |  2 +-
>   drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  2 +-
>   drivers/media/pci/mgb4/mgb4_vin.c             |  2 +-
>   drivers/media/pci/mgb4/mgb4_vout.c            |  2 +-
>   drivers/media/pci/tw5864/tw5864-video.c       |  2 +-
>   drivers/media/pci/tw68/tw68-video.c           |  2 +-
>   drivers/media/pci/tw686x/tw686x-video.c       |  2 +-
>   drivers/media/pci/zoran/zoran_driver.c        |  6 ++--
>   drivers/media/platform/amphion/vpu_v4l2.c     |  4 +--
>   drivers/media/platform/aspeed/aspeed-video.c  |  2 +-
>   drivers/media/platform/atmel/atmel-isi.c      |  2 +-
>   .../platform/chips-media/coda/coda-common.c   |  2 +-
>   .../platform/microchip/microchip-isc-base.c   |  2 +-
>   drivers/media/platform/nuvoton/npcm-video.c   |  2 +-
>   drivers/media/platform/nxp/imx7-media-csi.c   |  2 +-
>   .../platform/nxp/imx8-isi/imx8-isi-video.c    |  2 +-
>   drivers/media/platform/qcom/venus/vdec.c      |  4 +--
>   drivers/media/platform/qcom/venus/venc.c      |  4 +--
>   .../platform/renesas/rcar-vin/rcar-dma.c      |  2 +-
>   drivers/media/platform/renesas/renesas-ceu.c  |  2 +-
>   .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  2 +-
>   drivers/media/platform/renesas/sh_vou.c       |  2 +-
>   .../platform/rockchip/rkisp1/rkisp1-capture.c |  2 +-
>   drivers/media/platform/st/sti/hva/hva-v4l2.c  |  4 +--
>   drivers/media/platform/st/stm32/stm32-dcmi.c  |  2 +-
>   .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |  4 +--
>   .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  2 +-
>   .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  2 +-
>   .../media/platform/sunxi/sun8i-di/sun8i-di.c  |  4 +--
>   .../sunxi/sun8i-rotate/sun8i_rotate.c         |  4 +--
>   .../media/platform/ti/am437x/am437x-vpfe.c    |  2 +-
>   drivers/media/platform/ti/cal/cal-video.c     |  2 +-
>   .../media/platform/ti/davinci/vpif_capture.c  |  2 +-
>   .../media/platform/ti/davinci/vpif_display.c  |  2 +-
>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  2 +-
>   drivers/media/platform/ti/omap/omap_vout.c    |  2 +-
>   .../media/test-drivers/vimc/vimc-capture.c    |  2 +-
>   drivers/media/test-drivers/vivid/vivid-core.c |  4 +--
>   drivers/media/usb/cx231xx/cx231xx-417.c       |  2 +-
>   drivers/media/usb/cx231xx/cx231xx-video.c     |  4 +--
>   drivers/media/usb/dvb-usb/cxusb-analog.c      |  2 +-
>   drivers/media/usb/gspca/gspca.c               |  6 ++--
>   .../media/deprecated/atmel/atmel-isc-base.c   |  2 +-
>   drivers/staging/media/imx/imx-media-capture.c |  2 +-
>   drivers/staging/media/ipu3/ipu3-v4l2.c        |  2 +-
>   drivers/staging/media/meson/vdec/vdec.c       |  6 ++--
>   .../staging/media/starfive/camss/stf-video.c  |  2 +-
>   .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  2 +-
>   .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  2 +-
>   drivers/staging/media/tegra-video/vi.c        |  2 +-
>   include/media/videobuf2-core.h                | 20 +++++++++--
>   samples/v4l/v4l2-pci-skeleton.c               |  2 +-
>   68 files changed, 121 insertions(+), 99 deletions(-)
>

