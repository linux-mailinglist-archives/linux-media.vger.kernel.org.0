Return-Path: <linux-media+bounces-911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26517F6266
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 16:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AE35B21675
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 15:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E808134CFF;
	Thu, 23 Nov 2023 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29BED47
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 07:11:34 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1r6BMS-0006pQ-0y; Thu, 23 Nov 2023 16:11:24 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1r6BMN-00B3zI-Cp; Thu, 23 Nov 2023 16:11:19 +0100
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1r6BMN-003U4D-A7; Thu, 23 Nov 2023 16:11:19 +0100
Date: Thu, 23 Nov 2023 16:11:19 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Shengyu Qu <wiagn233@outlook.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 00/13] media: rockchip: rga: add support for
 multi-planar formats
Message-ID: <20231123151119.GJ592330@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Shengyu Qu <wiagn233@outlook.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Fri, 13 Oct 2023 13:00:21 +0200, Michael Tretter wrote:
> This is v2 of the series that adds support for the V4L2 multi-planar API
> to the Rockchip RGA driver. Once the RGA driver supports the
> multi-planar API, it is easier to share buffers with other V4L2 drivers
> that also support the multi-planar API and may not expose planar formats
> with contiguous planes.
> 
> v2 fixes the smatch warnings and compile errors of v1. Furthermore, now
> the DMA mask is set to 32 bits for coherent, too, and the gfp_flags are
> configured to ensure that buffers are allocated in the lower 4GB area.

Gentle Ping.

Michael

> 
> With non-contiguous planes, the U and V planes may not start at the same
> offset as with the continuous planes. Therefore, the RGA driver cannot
> rely on its calculation of the plane offsets based on the format and
> frame size anymore, but must remember the offsets when it created the
> mapping. Therefore, I also reworked how the DMA mapping is handled.
> 
> As a bonus, the RGA driver should now work correctly on devices with
> more than 4 GB of memory. Video buffers should now be allocated within
> the 4 GB boundary and an import of buffers that have higher addresses
> into the driver should fail.
> 
> Patch 1 fixes the swizzling of RGA formats. While testing all formats of
> the driver on rk3568, I discovered that the color channels of the RGB
> formats are wrong when converting to NV12. I didn't test this on other
> SoCs with an RGA and I am not sure, if they behave differently regarding
> the color channels. Please report, if this breaks the color conversion
> on other SoCs, and I will make this SoC-specific.
> 
> Patches 2 to 6 are the rework the DMA descriptor handling for the RGA
> MMU. The patches clean up, how the driver uses the DMA API, and make the
> creation of the descriptor list more explicit. Furthermore, the driver
> is changed to keep the mapping per video buffer instead of using a
> single mapping that is updated with every buffer.
> 
> Patches 7 to 11 prepare the driver for the multi-planar API including a
> cleanup of the format handling in the buffer, and finally switch to the
> multi-planar API.
> 
> Patch 12 updates the code that creates the DMA-descriptor mapping to
> correctly handle buffers with multiple planes. The driver has to iterate
> all planes and make them the continuous for the RGA.
> 
> Patch 13 enables the NV12M format, which is the multi-planar variant of
> the NV12 format.
> 
> Michael
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changes in v2:
> - Fix smatch warnings
> - Fix cast to dst_mmu_pages/src_mmu_pages to fix compile error in Patch 2
> - Remove check for upper_32_bits when filling the DMA descriptor table
> - Remove useless dma_sync_single_for_device()
> - Set DMA mask for DMA coherent
> - Set gfp_flags to __GFP_DMA32
> - Link to v1: https://lore.kernel.org/r/20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de
> 
> ---
> Michael Tretter (13):
>       media: rockchip: rga: fix swizzling for RGB formats
>       media: rockchip: rga: extract helper to fill descriptors
>       media: rockchip: rga: allocate DMA descriptors per buffer
>       media: rockchip: rga: split src and dst buffer setup
>       media: rockchip: rga: pre-calculate plane offsets
>       media: rockchip: rga: set dma mask to 32 bits
>       media: rockchip: rga: use clamp() to clamp size to limits
>       media: rockchip: rga: use pixelformat to find format
>       media: rockchip: rga: add local variable for pix_format
>       media: rockchip: rga: use macros for testing buffer type
>       media: rockchip: rga: switch to multi-planar API
>       media: rockchip: rga: rework buffer handling for multi-planar formats
>       media: rockchip: rga: add NV12M support
> 
>  drivers/media/platform/rockchip/rga/rga-buf.c | 162 ++++++++++++++++------
>  drivers/media/platform/rockchip/rga/rga-hw.c  | 146 ++++++++++++--------
>  drivers/media/platform/rockchip/rga/rga.c     | 189 ++++++++++++--------------
>  drivers/media/platform/rockchip/rga/rga.h     |  35 ++++-
>  4 files changed, 328 insertions(+), 204 deletions(-)
> ---
> base-commit: 2c1bae27df787c9535e48cc27bbd11c3c3e0a235
> change-id: 20230914-rockchip-rga-multiplanar-0d7c79b1ba93
> 
> Best regards,
> -- 
> Michael Tretter <m.tretter@pengutronix.de>
> 
> 

