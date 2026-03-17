Return-Path: <linux-media+bounces-56058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMc9K2lIuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:26:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BBE2A9D51
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 127863088319
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C173C141F;
	Tue, 17 Mar 2026 12:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JMHGVgSZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512103BAD9D;
	Tue, 17 Mar 2026 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750179; cv=none; b=kVfkzxo7qDT+1Nz0zZzBbenVWBcq4L3QbNDXoKT256u4H0bApo8tX0gEX5g1UZz/pe6q6iHu9c96wz1r6EeG1DZfNuQbzg4K0IdVMQOuaPmhqRO3gpa0CgU8YS/vRHdifYUYStaPe2YjK58sm8ecrIjBksMwWYmjUJ7M0r/hF+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750179; c=relaxed/simple;
	bh=0f/8vihUl0yfiK0/XsXdFfAbfcHhz48lg2021luSPaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfYxuBP7exwGLzPEuOFKlcj01YuGBidmfpAxz0sRsuJ9AlUCBTXnuKifSeLxrMmxSU8V2JgSu/71S2jGY6gnFx4AUHHs1tdTmOBT36psQUxqNFGHP6vIrfc50EgGPf9UYcLq7Wg0YRNuMqwYgdlqobD3iRK9uxx2gMTs4cLXPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JMHGVgSZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC1AF98A;
	Tue, 17 Mar 2026 13:21:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773750103;
	bh=0f/8vihUl0yfiK0/XsXdFfAbfcHhz48lg2021luSPaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JMHGVgSZOJ5/DVBcz8/uEwfvdSBh05e0B5oRliE3cmpoF2WS8VDYzUQRa3ERFns5q
	 hQrNAXQD6BnRDbio3IjNyIlU9ajIdHlc83Q0JWQY+f5qbootp6wZXBWgL3CRXl5eoT
	 6Dab8l9VOVioKwed63Y8EnPNG1oVpEEEIwjWjpQQ=
Message-ID: <84dc252f-f6fa-41bf-bf4d-45212e36beda@ideasonboard.com>
Date: Tue, 17 Mar 2026 14:22:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/17] media: cadence,ti: CSI2RX Multistream Support
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, sjoerd@collabora.com,
 dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
References: <20260313090701.646534-1-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20260313090701.646534-1-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56058-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org,linux.dev];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 43BBE2A9D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 13/03/2026 11:06, Rishikesh Donadkar wrote:
> This series adds multi-stream support and PM support for Cadence CSI2RX
> and TI CSI2RX SHIM drivers.
> 

Looks fine to me. Tested on AM62A SK + V3Link board.

 Tomi

> PM patches are picked from:
> https://lore.kernel.org/all/20250902-ti_csi_pm-v2-0-59a3be199940@ideasonboard.com/
> 
> PATCH 01 :    Remove word size alignment restriction on frame width
> PATCH 02-08:  Support multiple DMA contexts/video nodes in TI CSI2RX
> PATCH 09-10:  Use get_frame_desc to propagate virtual channel
>               information across Cadence and TI CSI-RX subdevs
> PATCH 11-12:  Use new multi-stream APIs across the drivers to support
>               multiplexed cameras from sources like UB960 (FPDLink)
> PATCH 13:     Optimize stream on by submitting all queued buffers to DMA
> PATCH 14:     Change the drain architecture to support multi-stream,
>               implement completion barriers for last drain
> PATCH 15-17:  Runtime PM and System PM support for CSI-RX.
> 
> Testing for this series has been done on top of media tree with 4x IMX219
> camera modules connected to TI's AM62A using V3 Link fusion mini board.
> 
> Runtime PM and System PM has been tested with IMX219 camera module
> connect to TI's AM62.
> 
> Follwing formats and resolutions have been tested:
> 
> Format    | Resolution | Sensor | 
> ----------|------------|--------|
> SRGGB10   | 1640x1232  | IMX219 | 
> SRGGB10   | 1920x1080  | IMX219 |
> SRGGB8    | 1640x1232  | IMX219 | 
> SRGGB8    | 1920x1080  | IMX219 |
> 
> Overlay and defconfig changes for the same can be found below:
> https://github.com/RISHI27-dot/linux/commits/u/multistream_v12
> 
> v4l2-compliance results:
> https://gist.github.com/Rishikesh-D/85d2f1ceab61fdc4e3340349c12823b4
> 
> ---
> Changes in v12:
> [PATCH v12 06/17] media: ti: j721e-csi2rx: add a subdev for the core
> device
> - Report the format not being present as error and use dev_err instead of dev_dbg
> - Add .has_pad_interdep
> [PATCH v12 11/17] media: cadence: csi2rx: add multistream support
> - Add .has_pad_interdep
> [PATCH v12 14/17] media: ti: j721e-csi2rx: Change the drain architecture for multistream
> - Remove debug print when wait_for_completion() timeouts
> [PATCH v12 16/17] media: ti: j721e-csi2rx: Support runtime suspend
> - Init dma and request channels at probe time
> 
> Link to (v11):
> https://lore.kernel.org/all/20260209183456.1906327-1-r-donadkar@ti.com/
> ---
> Changes in v11:
> [PATCH v11 04/18] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
> - Remove register write that caused bogus image for SRGGB10
> [PATCH v11 10/18] media: ti: j721e-csi2rx: add support for processing virtual channels
> - Update commit message to mention about DT being handled
> [PATCH v11 12/18] media: ti: j721e-csi2rx: add multistream support
> - s/form/from
> - Move code for falling back to default VC and DT inside
>   ti_csi2rx_get_vc_and_dt()
> 
> Link to (v10):
> https://lore.kernel.org/all/20260121135424.1185710-1-r-donadkar@ti.com/
> ---
> Changes in v10:
> 
> # New patches in v10:
> [PATCH v10 12/18] media: cadence: csi2rx: Use the stream from route
> 
> #Changes
> [PATCH v10 06/18] media: ti: j721e-csi2rx: add a subdev for the core
> - Remove unwanted mutex
> [PATCH v10 10/18] media: ti: j721e-csi2rx: add support for processing
> - Improve commit message to remove info about get_frame_desc() usage
>   in single/multi stream usecases
> - Add break when stream found
> - Report error when no stream found
> [PATCH v10 11/18] media: cadence: csi2rx: add multistream support
> - Move the code to set default VC0 inside if statement
> [PATCH v10 13/18] media: ti: j721e-csi2rx: add multistream support
> - Make the pixel reset assert and de-assert more symmetric across
>   the start and stop path
> - Remove the vc_cached variable and associated checks
> - Move enable_count == 0 check at start of
>   ti_csi2rx_sd_disable_streams() with a WARN_ON
> - Update the commit message to s/4/32 for number of possible streams
> [PATCH v10 15/18] media: ti: j721e-csi2rx: Change the drain
>  architecture for multistream
> - Change the commit message to talk about streams only and not
>   VC/DT
> - Improve commit message to give better description regarding continuous
>   drain
> - Squash [PATCH v9 16/19] into this patch
> [PATCH v10 18/18] media: ti: j721e-csi2rx: Support system suspend
>  using pm_notifier
> - Add comment before register_pm_notifier() call
> 
> Link to (v9):
> https://lore.kernel.org/all/20251230083220.2405247-1-r-donadkar@ti.com/
> ---
> Changes in v9:
> 
> # New patches in v9:
> [PATCH v9 08/18] media: staging: starfive: Move to .enable/disable_streams API
> - Remove the s_stream API and use the enable/disable_streams API in stf
>   drivers
> [PATCH v9 16/19] media: ti: j721e-csi2rx: Return the partial frame as error
> - Return the next frame after drain to usersapce as VB2_BUF_STATE_ERROR
> 
> # Changes:
> [PATCH v9 01/18] media: ti: j721e-csi2rx: Remove word size alignment on frame width
> - Ad R-by Tomi
> [PATCH v9 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
> - Squash [PATCH v8 08/18] into this patch so that we dont have to use
>   s_stream
> - Use BIT_U64() instead of BIT()
> [PATCH v9 07/18] media: cadence: csi2rx: Move to .enable/disable_streams API
> - Use BIT_U64() instead of BIT()
> [PATCH v9 11/19] media: ti: j721e-csi2rx: add support for processing virtual channels
> - Update to commit message to s/hardcoded/VC0/
> - Remove the mention of caching VC data from the commit message as that
>   is done in 13/19
> - Update the commit message to s/per stream/single stream/
> [PATCH v9 12/19] media: cadence: csi2rx: add multistream support
> - Remove the s_stream fallback
> [PATCH v9 13/19] media: ti: j721e-csi2rx: add multistream support
> - Move the code that is accessing the state from .start_streaming() call
>   to .enable_streams() call
> - Remove the check for V4L2_SUBDEV_ROUTE_FL_ACTIVE
> - Change the logic of for_each_active_route() usage to break the loop
>   when the route is found
> - Change the format variable to static const
> - Update the commit message to s/4/32 for number of possible streams
> [PATCH v9 17/19] media: cadence: csi2rx: Support runtime PM
> - Shift to goto based error handing in the .enable_streams() function
> [PATCH v9 18/19] media: ti: j721e-csi2rx: Support runtime suspend
> - Make variable i and ret unsigned
> - Move runtime_enable() call before notifier_register() in the .probe()
> - In the .remove() function if the runtime PM state is active, set it to
>   suspended and remove the pm_runtime_set_suspended() call at the end.
> - Drop the call to init_dma() from init/cleanup_ctx()
> - Remove pm_runtime_set_active() and pm_request_idle() from .probe()
> 
> Link to (v8):
> https://lore.kernel.org/all/20251112115459.2479225-1-r-donadkar@ti.com/#t
> ---
> Changes in v8:
> 
> # New patches in v8:
> [PATCH v8 07/18] media: cadence: csi2rx: Move to .enable/disable_streams API
> [PATCH v8 08/18] media: ti: j721e-csi2rx: Move to .enable/disable_streams API
> - Remove the s_stream API and use the enable/disable_streams API right
>   after adding the subdev for core device
> 
> Changes:
> [PATCH v8 01/18] media: ti: j721e-csi2rx: Remove word size alignment on frame width
> - Remove define for PSIL_WORD_SIZE_BYTES.
> [PATCH v8 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
> - Use v4l2_subdev_state_get_format() instead of using the get_fmt from the 
>   subdev pad ops in the ti_csi2rx_link_validate() function.
> [PATCH v8 11/18] media: ti: j721e-csi2rx: add support for processing virtual channels
> - Move routing support form this patch to PATCH 13/18.
> [PATCH v8 12/18] media: cadence: csi2rx: add multistream support
> - Move support for enable/disable_streams() API that was added in this patch to
>   PATCH 07/18 earlier in this series.
> - Remove the mutex from the driver
> [PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
> - Move support for enable/disable_streams() API that was added in this patch to
>   PATCH 08/18 earlier in this series.
> - Remove csi->mutex protection inside enable/disable_streams() function calls to
>   solve circular locking dependency warning.
> - Mention that DT filtering is also supported in the commit message.
> 
> Link to (v7):
> https://lore.kernel.org/all/20250911102832.1583440-1-r-donadkar@ti.com/#t
> 
> ---
> Changes in v7:
> 
> [PATCH v6 03/16] media: ti: j721e-csi2rx: separate out device and context
> - Resolve bisect test fail because of undefined 'csi' variable
> - Resolve bisect test fail because of 'vdev' not being in scope when used
> [PATCH v6 07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
> - Resolve compiler warning regarding missing error code 'ret'
> [PATCH v6 12/16] media: ti: j721e-csi2rx: Submit all available buffers
> - Remove unused variable
> 
> Link to (v6):
> https://lore.kernel.org/all/20250908134729.3940366-1-r-donadkar@ti.com/
> 
> ---
> Changes in v6:
> 
> # New patches in v6:
> 
> [PATCH v6 14/16] media: cadence: csi2rx: Support runtime PM
> [PATCH v6 15/16] media: ti: j721e-csi2rx: Support runtime suspend
> [PATCH v6 16/16] media: ti: j721e-csi2rx: Support system suspend
> using pm_notifier
> 
> # Changes in patches from v5:
> [PATCH v5 01/16] media: ti: j721e-csi2rx: Remove word size alignment
> on frame width
> - Remove restrictions on minimum frame width in ti_csi2rx_fill_fmt()
> - Add Reviewed-by from Abhilash
> [PATCH v5 02/16] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
> - No change
> [PATCH v5 03/16] media: ti: j721e-csi2rx: separate out device and context
> - No change
> [PATCH v5 04/16] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
> - No change
> [PATCH v5 05/16] media: ti: j721e-csi2rx: allocate DMA channel based on context index
> - No change
> [PATCH v5 06/16] media: ti: j721e-csi2rx: add a subdev for the core device
> - No change
> [PATCH v5 07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
> - Solve compilation warnings
> [PATCH v5 08/16] media: cadence: csi2rx: add get_frame_desc wrapper
> - No change
> [PATCH v5 09/16] media: ti: j721e-csi2rx: add support for processing virtual channels
> - Remove unnecessary call to v4l2_unlock_state()
> [PATCH v5 10/16] media: cadence: csi2rx: add multistream support
> - No change
> [PATCH v5 11/16] media: ti: j721e-csi2rx: add multistream support
> - No change
> [PATCH v5 12/16] media: ti: j721e-csi2rx: Submit all available buffers
> - No change
> [PATCH v5 13/16] media: ti: j721e-csi2rx: Change the drain architecture for multistream
> - Squash implementation of completion barriers for last drain cycle
> - Make struct completion per ctx
> 
> Link to (v5):
> https://lore.kernel.org/all/20250825142522.1826188-1-r-donadkar@ti.com/
> 
> ---
> Changes in v5:
> 
> # New patches in v5:
> 
> [PATCH v5 01/14] media: ti: j721e-csi2rx: Remove word size alignment
> [PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain
> 
> # Changes in patches from v4:
> 
> [PATCH v4 01/12] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
> - No change
> [PATCH v4 02/12] media: ti: j721e-csi2rx: separate out device and context
> - No change
> [PATCH v4 03/12] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
> - No change
> [PATCH v4 04/12] media: ti: j721e-csi2rx: allocate DMA channel based on context index
> - No change
> [PATCH v4 05/12] media: ti: j721e-csi2rx: add a subdev for the core device
> - No change
> [PATCH v4 06/12] media: ti: j721e-csi2rx: get number of contexts from device tree
> - No change
> [PATCH v4 07/12] media: cadence: csi2rx: add get_frame_desc wrapper
> - No change
> [PATCH v4 08/12] media: ti: j721e-csi2rx: add support for processing virtual channels
> - No change
> [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
> - No change
> [PATCH v4 10/12] media: ti: j721e-csi2rx: add multistream support
> - Serialize stream stop
> - Remove the break statement to avoid early return in the loop, as
>   reported by Sjoerd
> [PATCH v4 11/12] media: ti: j721e-csi2rx: Submit all available buffers
> - Delete the list node on DMA error to avoid kernel panic
> [PATCH v4 12/12] media: ti: j721e-csi2rx: Change the drain architecture for multistream
> - Mention about next frame after drain being bogus
> 
> Link to (v4):
>   https://lore.kernel.org/all/20250514112527.1983068-1-r-donadkar@ti.com/
> 
> Changes in v4:
> 
> [PATCH 01/13] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
>   - No change
> [PATCH 02/13] media: ti: j721e-csi2rx: separate out device and context
>   - Add ctx identifier in the dev_err() message
>   - No change
> [PATCH 03/13] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
>   - Reduced the name string lenght from 32 chars to 5 chars
> [PATCH 04/13] media: ti: j721e-csi2rx: allocate DMA channel based on context index
>   - No change
> [PATCH 05/13] media: ti: j721e-csi2rx: add a subdev for the core device
>   - Add .enum_mbus_code callback
>   - Replace statically allocated struct with a global static const struct
>     v4l2_mbus_framefmt and used that in the _init_state() function
> [PATCH 06/13] media: ti: j721e-csi2rx: get number of contexts from device tree
>   - Fix the drain buffer being leaked
>   - If the shows more number of ctx than the TI_CSI2RX_MAX_CTX, return an error
>     instead of warning
> [PATCH 07/13] media: cadence: csi2rx: add get_frame_desc wrapper
>   - No change
> [PATCH 08/13] media: ti: j721e-csi2rx: add support for processing virtual channels
>   - Call ti_csi2rx_get_vc() only once on first stream start and cache the VC data in
>     the driver, use the corresponding VC in all subsequent stream starts.
> [PATCH 09/13] media: cadence: csi2rx: Use new enable stream APIs
> [PATCH 10/13] media: cadence: csi2rx: Enable multi-stream support
>   - Squash the above two patches into
>     [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
>   - Use already obtained csi2rx->source_pad in enable_streams() and
>     disable_streams() call
>   - Update commit message with the reason for using a custom helper for s_stream
>     instead of v4l2_subdev_s_stream_helper()
>   - Use v4l2_get_link_freq() variant that takes pad of the source as its first
>     argument instead of the one that takes v4l2_ctrl_handler
>   - Call v4l2_get_link_freq() with bpp = 0 to prevent fallback to V4L2_CID_PIXEL_RATE
>     in multi-stream case
>   - Use lock guards to simplify error handling
>   - Call csi2rx_update_vc_select() at first stream start before enabling the controller
> [PATCH 11/13] media: ti: j721e-csi2rx: add multistream support
>   - No change
> [PATCH 12/13] media: ti: j721e-csi2rx: Submit all available buffers
>   - No change
> [PATCH 13/13] media: ti: j721e-csi2rx: Change the drain architecture for multistream
>   - Fix checkpatch warning
>   - Change commit message to give a better description of the patch
> 
> Link to (v3):
>   https://lore.kernel.org/all/20250417065554.437541-1-r-donadkar@ti.com/
> 
> Changes in v3:
> 
> - Drop [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM from
>   v2, support for runtime PM will be added in a separate series:
>   https://lore.kernel.org/all/20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com/
> - Change the drain architecture to prevent FIFO overflow in multistream
>   usecases.
> - With the new drain architecture, we don't need the the driver to wait
>   for userspace to start streaming on all "actively routed" video nodes
>   before starting streaming on the source. So, revert back to the capture
>   architecture where streams can be started and stopped independent
>   to each other.
> 
> Link to (v2):
>   https://lore.kernel.org/r/20240627-multistream-v2-0-6ae96c54c1c3@ti.com
> 
> Changes in v2:
> 
> - Change the multi-camera capture architecture to be similar to that of
>   Tomi's RPi5 FE series, where the driver will wait for userspace to
>   start streaming on all "actively routed" video nodes before starting
>   streaming on the source. This simplifies things a lot from the HW
>   perspective, which might run into deadlocks due to a shared FIFO
>   between multiple DMA channels.
> 
> - Drop a few fixes that were posted separately and are already merged
> - Fix dtschema warnings reported by Rob on [02/13]
> - Fix warnings for uninitialized `used_vc` variable in cdns-csi2rx.c
> - Return -EBUSY if someone updates routes for j721e-csi2rx subdev while
>   streaming
> - Only allow single-streams to be routed to the source pads (linked to
>   video nodes) of the j721e-csi2rx device
> - Squash the patches marked "SQUASH" in the v1 RFC series
> 
> Changhuang Liang (1):
>   media: cadence: csi2rx: Support runtime PM
> 
> Jai Luthra (9):
>   dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
>   media: ti: j721e-csi2rx: separate out device and context
>   media: ti: j721e-csi2rx: add a subdev for the core device
>   media: ti: j721e-csi2rx: add support for processing virtual channels
>   media: cadence: csi2rx: add multistream support
>   media: ti: j721e-csi2rx: add multistream support
>   media: ti: j721e-csi2rx: Submit all available buffers
>   media: ti: j721e-csi2rx: Support runtime suspend
>   media: ti: j721e-csi2rx: Support system suspend using pm_notifier
> 
> Pratyush Yadav (4):
>   media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
>   media: ti: j721e-csi2rx: allocate DMA channel based on context index
>   media: ti: j721e-csi2rx: get number of contexts from device tree
>   media: cadence: csi2rx: add get_frame_desc wrapper
> 
> Rishikesh Donadkar (3):
>   media: ti: j721e-csi2rx: Remove word size alignment on frame width
>   media: cadence: csi2rx: Move to .enable/disable_streams API
>   media: ti: j721e-csi2rx: Change the drain architecture for multistream
> 
>  .../bindings/media/ti,j721e-csi2rx-shim.yaml  |   39 +-
>  drivers/media/platform/cadence/Kconfig        |    1 +
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  509 +++++--
>  drivers/media/platform/ti/Kconfig             |    1 +
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1219 ++++++++++++-----
>  5 files changed, 1320 insertions(+), 449 deletions(-)
> 


