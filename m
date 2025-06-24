Return-Path: <linux-media+bounces-35734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088AAE6184
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F03BE1B61671
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9653C28001B;
	Tue, 24 Jun 2025 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pax3gyJe"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A314127FD46;
	Tue, 24 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758808; cv=none; b=vCt+sMGTSwcQVMxJpQ95u5rpW01fxC2WDTLu/46bSUV2jsxHuKOO9VDIC2K+nM/fh7BdNLJg08G0nwjkpmno5tXWzhqu4L8MAR30AfUGJ7fXP7Wcj2biMLx+K1avvWR5w3eeBFkoLTE59lA/6nnF5zcYXJoKkxbUkWdC6EJpBDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758808; c=relaxed/simple;
	bh=djiusFSU4ZnEzFWcgopKOjm9/gmdllUK1jWlswikw/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aRhnZRuCwW15k27WQvKsBd1jgLgnbBk9UZRKZiihba7tn88/c7XwlT6Oyat+XhwC5n672+lXlpoj2RKVEJPlF1O/XMnfZy5AYfESRpXael7pHniv4J8iAqmLVm4Ip8ptLkH+YdH+WhaKE9G6aZP7B+v7zqIlTz+RmN5+lbyVie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pax3gyJe; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O9qlrH1755172;
	Tue, 24 Jun 2025 04:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750758767;
	bh=YZVEvAwIeno5mxtF28TOIC2+Sya3/YkcRiUwLeTc1F8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pax3gyJeRj0BYa2faBAJB+LcBgUqgROBMGAKHezDCxX91XB97ZKmvsUmtxa0MZEm8
	 s5nEcLZvm3zfpnQt/a8ShCiMbf/oj2mExSwYGEOaLMNJpgcM3OgXV7DOPaeQK+68ZG
	 aPGmcWiwlqyJSMkIqArStpsbrQhB45s9eA0ttN8c=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O9qlQT167167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 04:52:47 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 04:52:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 04:52:46 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O9qelt1298916;
	Tue, 24 Jun 2025 04:52:41 -0500
Message-ID: <a2712f66-f4fe-4753-bfec-dedd60c8210f@ti.com>
Date: Tue, 24 Jun 2025 15:22:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] media: cadence,ti: CSI2RX Multistream Support
To: Rishikesh Donadkar <r-donadkar@ti.com>, <jai.luthra@linux.dev>,
        <laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <devarsht@ti.com>, <vaishnav.a@ti.com>, <s-jain1@ti.com>,
        <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
        <changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250514112527.1983068-1-r-donadkar@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250514112527.1983068-1-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Rishikesh,

Thank you for the patch series.

On 14/05/25 16:55, Rishikesh Donadkar wrote:
> This series adds multi-stream support for Cadence CSI2RX and TI CSI2RX
> SHIM drivers.
> 
> PATCH 1-6:  Support multiple DMA contexts/video nodes in TI CSI2RX
> PATCH 7-8:  Use get_frame_desc to propagate virtual channel
>              information across Cadence and TI CSI-RX subdevs
> PATCH 9-10: Use new multi-stream APIs across the drivers to support
>              multiplexed cameras from sources like UB960 (FPDLink)
> PATCH 11:   Optimize stream on by submitting all queued buffers to DMA
> PATCH 12:   Change the drain architecture to support multi-stream
> 
> Testing for this series has been done on top of media tree with 4x IMX219
> camera modules connected to TI's AM62A using V3 Link fusion mini board.
> 
> Overlay and defconfig changes for the same can be found below:
> https://github.com/RISHI27-dot/linux/commits/u/multistream_v4
> 
> v4l2-compliance results:
> https://gist.github.com/Rishikesh-D/4ddf957da2f62191eefe7a9e5ff212ab
> 

For the entire series,

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

> ---
> Changes in v4:
> 
> [PATCH 01/13] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
>    - No change
> [PATCH 02/13] media: ti: j721e-csi2rx: separate out device and context
>    - Add ctx identifier in the dev_err() message
>    - No change
> [PATCH 04/13] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
>    - Reduced the name string lenght from 32 chars to 5 chars
> [PATCH 05/13] media: ti: j721e-csi2rx: add a subdev for the core device
>    - Add .enum_mbus_code callback
>    - Replace statically allocated struct with a global static const struct
>      v4l2_mbus_framefmt and used that in the _init_state() function
> [PATCH 06/13] media: ti: j721e-csi2rx: get number of contexts from device tree
>    - Fix the drain buffer being leaked
>    - If the shows more number of ctx than the TI_CSI2RX_MAX_CTX, return an error
>      instead of warning
> [PATCH 07/13] media: cadence: csi2rx: add get_frame_desc wrapper
>    - No change
> [PATCH 08/13] media: ti: j721e-csi2rx: add support for processing virtual channels
>    - Call ti_csi2rx_get_vc() only once on first stream start and cache the VC data in
>      the driver, use the corresponding VC in all subsequent stream starts.
> [PATCH 09/13] media: cadence: csi2rx: Use new enable stream APIs
> [PATCH 10/13] media: cadence: csi2rx: Enable multi-stream support
>    - Squash the above two patches into
>      [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
>    - Use already obtained csi2rx->source_pad in enable_streams() and
>      disable_streams() call
>    - Update commit message with the reason for using a custom helper for s_stream
>      instead of v4l2_subdev_s_stream_helper()
>    - Use v4l2_get_link_freq() variant that takes pad of the source as its first
>      argument instead of the one that takes v4l2_ctrl_handler
>    - Call v4l2_get_link_freq() with bpp = 0 to prevent fallback to V4L2_CID_PIXEL_RATE
>      in multi-stream case
>    - Use lock guards to simplify error handling
>    - Call csi2rx_update_vc_select() at first stream start before enabling the controller
> [PATCH 11/13] media: ti: j721e-csi2rx: add multistream support
>    - No change
> [PATCH 12/13] media: ti: j721e-csi2rx: Submit all available buffers
>    - No change
> [PATCH 13/13] media: ti: j721e-csi2rx: Change the drain architecture for multistream
>    - Fix checkpatch warning
>    - Change commit message to give a better description of the patch
> 
> Link to (v3):
>    https://lore.kernel.org/all/20250417065554.437541-1-r-donadkar@ti.com/
> 
> Changes in v3:
> 
> - Drop [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM from
>    v2, support for runtime PM will be added in a separate series:
>    https://lore.kernel.org/all/20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com/
> - Change the drain architecture to prevent FIFO overflow in multistream
>    usecases.
> - With the new drain architecture, we don't need the the driver to wait
>    for userspace to start streaming on all "actively routed" video nodes
>    before starting streaming on the source. So, revert back to the capture
>    architecture where streams can be started and stopped independent
>    to each other.
> 
> Link to (v2):
>    https://lore.kernel.org/r/20240627-multistream-v2-0-6ae96c54c1c3@ti.com
> 
> Changes in v2:
> 
> - Change the multi-camera capture architecture to be similar to that of
>    Tomi's RPi5 FE series, where the driver will wait for userspace to
>    start streaming on all "actively routed" video nodes before starting
>    streaming on the source. This simplifies things a lot from the HW
>    perspective, which might run into deadlocks due to a shared FIFO
>    between multiple DMA channels.
> 
> - Drop a few fixes that were posted separately and are already merged
> - Fix dtschema warnings reported by Rob on [02/13]
> - Fix warnings for uninitialized `used_vc` variable in cdns-csi2rx.c
> - Return -EBUSY if someone updates routes for j721e-csi2rx subdev while
>    streaming
> - Only allow single-streams to be routed to the source pads (linked to
>    video nodes) of the j721e-csi2rx device
> - Squash the patches marked "SQUASH" in the v1 RFC series
> 
> Link to RFC (v1):
> https://lore.kernel.org/r/20240222-multistream-v1-0-1837ed916eeb@ti.com
> 
> 
> Jai Luthra (7):
>    dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
>    media: ti: j721e-csi2rx: separate out device and context
>    media: ti: j721e-csi2rx: add a subdev for the core device
>    media: ti: j721e-csi2rx: add support for processing virtual channels
>    media: cadence: csi2rx: add multistream support
>    media: ti: j721e-csi2rx: add multistream support
>    media: ti: j721e-csi2rx: Submit all available buffers
> 
> Pratyush Yadav (4):
>    media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
>    media: ti: j721e-csi2rx: allocate DMA channel based on context index
>    media: ti: j721e-csi2rx: get number of contexts from device tree
>    media: cadence: csi2rx: add get_frame_desc wrapper
> 
> Rishikesh Donadkar (1):
>    media: ti: j721e-csi2rx: Change the drain architecture for multistream
> 
>   .../bindings/media/ti,j721e-csi2rx-shim.yaml  |  39 +-
>   drivers/media/platform/cadence/cdns-csi2rx.c  | 372 +++++--
>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 958 +++++++++++++-----
>   3 files changed, 1025 insertions(+), 344 deletions(-)
> 

