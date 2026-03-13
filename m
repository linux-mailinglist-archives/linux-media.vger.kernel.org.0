Return-Path: <linux-media+bounces-55637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOdhMh7fs2ktcQAAu9opvQ
	(envelope-from <linux-media+bounces-55637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:55:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B4280F24
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E67533059364
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9F038A705;
	Fri, 13 Mar 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vSJ6JXuC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A8B23AB9D;
	Fri, 13 Mar 2026 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395730; cv=none; b=m0hwJjA3WajkvgA1TidZGKIXHvnW9Qc0En/5saAt/ikg50wQ/A4cOPBGfN6siuNmBiHZl/4iyq7jasIKkwKtoJPDqfJ9qGNrZ+guhPik167qFYsd8F2X0gxo1GrnvVd3KQAoRB2xsaE4a3wYRwU1ip/NERsS0WbQyF6y3UZ8wYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395730; c=relaxed/simple;
	bh=OCC8IpU1yTUJ0n6EaHiCYOG/u27qIqz4kzZVAfsu4jk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YbozxhvCpeWzuxxM2kCIpovCmtX6Mk3vn8XhhTcuUmm6t1exLtQe0eFEDxWpfbAHUtmFg28bjoqkqQf/lkhzEWY+md27/poXwKs+x8hrJmZniI2UYwJtoN+MN2XFCosO8Kg/pSYNnrkdMwz34z/w/1i9/rqSoM/pBj9xUhne764=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vSJ6JXuC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4150:222a:e452:bd09:9dcb])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 288FB103D;
	Fri, 13 Mar 2026 10:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773395656;
	bh=OCC8IpU1yTUJ0n6EaHiCYOG/u27qIqz4kzZVAfsu4jk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vSJ6JXuCkgYIjQtuMRKdX3dlT8oNcqiZ5TIKQRamrFn3wg8l/vhsG7g0OxurNRtZc
	 pM5yJVobLToK40ARPBaibxAnDLOqpz9ajkmsAevjuGhTiXirjx7xG4KtIBV5q1b/zR
	 kSgZR3Ec5sDHt7IggVEZ3b/d83EGkEyjAZeA2Bsw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260313090701.646534-1-r-donadkar@ti.com>
References: <20260313090701.646534-1-r-donadkar@ti.com>
Subject: Re: [PATCH v12 00/17] media: cadence,ti: CSI2RX Multistream Support
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Fri, 13 Mar 2026 15:25:20 +0530
Message-ID: <177339572034.14753.16296240964418168941@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55637-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F3B4280F24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rishikesh,

Quoting Rishikesh Donadkar (2026-03-13 14:36:44)
> This series adds multi-stream support and PM support for Cadence CSI2RX
> and TI CSI2RX SHIM drivers.
>=20
> PM patches are picked from:
> https://lore.kernel.org/all/20250902-ti_csi_pm-v2-0-59a3be199940@ideasonb=
oard.com/
>=20
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
>=20
> Testing for this series has been done on top of media tree with 4x IMX219
> camera modules connected to TI's AM62A using V3 Link fusion mini board.
>=20
> Runtime PM and System PM has been tested with IMX219 camera module
> connect to TI's AM62.
>=20
> Follwing formats and resolutions have been tested:
>=20
> Format    | Resolution | Sensor |=20
> ----------|------------|--------|
> SRGGB10   | 1640x1232  | IMX219 |=20
> SRGGB10   | 1920x1080  | IMX219 |
> SRGGB8    | 1640x1232  | IMX219 |=20
> SRGGB8    | 1920x1080  | IMX219 |
>=20

Thank you for the series,

Tested-by: Jai Luthra <jai.luthra@ideasonboard.com>

> Overlay and defconfig changes for the same can be found below:
> https://github.com/RISHI27-dot/linux/commits/u/multistream_v12
>=20
> v4l2-compliance results:
> https://gist.github.com/Rishikesh-D/85d2f1ceab61fdc4e3340349c12823b4
>=20
> ---
> Changes in v12:
> [PATCH v12 06/17] media: ti: j721e-csi2rx: add a subdev for the core
> device
> - Report the format not being present as error and use dev_err instead of=
 dev_dbg
> - Add .has_pad_interdep
> [PATCH v12 11/17] media: cadence: csi2rx: add multistream support
> - Add .has_pad_interdep
> [PATCH v12 14/17] media: ti: j721e-csi2rx: Change the drain architecture =
for multistream
> - Remove debug print when wait_for_completion() timeouts
> [PATCH v12 16/17] media: ti: j721e-csi2rx: Support runtime suspend
> - Init dma and request channels at probe time
>=20
> Link to (v11):
> https://lore.kernel.org/all/20260209183456.1906327-1-r-donadkar@ti.com/
> ---
> Changes in v11:
> [PATCH v11 04/18] media: ti: j721e-csi2rx: prepare SHIM code for multiple=
 contexts
> - Remove register write that caused bogus image for SRGGB10
> [PATCH v11 10/18] media: ti: j721e-csi2rx: add support for processing vir=
tual channels
> - Update commit message to mention about DT being handled
> [PATCH v11 12/18] media: ti: j721e-csi2rx: add multistream support
> - s/form/from
> - Move code for falling back to default VC and DT inside
>   ti_csi2rx_get_vc_and_dt()
>=20
> Link to (v10):
> https://lore.kernel.org/all/20260121135424.1185710-1-r-donadkar@ti.com/
> ---
> Changes in v10:
>=20
> # New patches in v10:
> [PATCH v10 12/18] media: cadence: csi2rx: Use the stream from route
>=20
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
> - Move enable_count =3D=3D 0 check at start of
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
>=20
> Link to (v9):
> https://lore.kernel.org/all/20251230083220.2405247-1-r-donadkar@ti.com/
> ---
> Changes in v9:
>=20
> # New patches in v9:
> [PATCH v9 08/18] media: staging: starfive: Move to .enable/disable_stream=
s API
> - Remove the s_stream API and use the enable/disable_streams API in stf
>   drivers
> [PATCH v9 16/19] media: ti: j721e-csi2rx: Return the partial frame as err=
or
> - Return the next frame after drain to usersapce as VB2_BUF_STATE_ERROR
>=20
> # Changes:
> [PATCH v9 01/18] media: ti: j721e-csi2rx: Remove word size alignment on f=
rame width
> - Ad R-by Tomi
> [PATCH v9 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
> - Squash [PATCH v8 08/18] into this patch so that we dont have to use
>   s_stream
> - Use BIT_U64() instead of BIT()
> [PATCH v9 07/18] media: cadence: csi2rx: Move to .enable/disable_streams =
API
> - Use BIT_U64() instead of BIT()
> [PATCH v9 11/19] media: ti: j721e-csi2rx: add support for processing virt=
ual channels
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
>=20
> Link to (v8):
> https://lore.kernel.org/all/20251112115459.2479225-1-r-donadkar@ti.com/#t
> ---
> Changes in v8:
>=20
> # New patches in v8:
> [PATCH v8 07/18] media: cadence: csi2rx: Move to .enable/disable_streams =
API
> [PATCH v8 08/18] media: ti: j721e-csi2rx: Move to .enable/disable_streams=
 API
> - Remove the s_stream API and use the enable/disable_streams API right
>   after adding the subdev for core device
>=20
> Changes:
> [PATCH v8 01/18] media: ti: j721e-csi2rx: Remove word size alignment on f=
rame width
> - Remove define for PSIL_WORD_SIZE_BYTES.
> [PATCH v8 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
> - Use v4l2_subdev_state_get_format() instead of using the get_fmt from th=
e=20
>   subdev pad ops in the ti_csi2rx_link_validate() function.
> [PATCH v8 11/18] media: ti: j721e-csi2rx: add support for processing virt=
ual channels
> - Move routing support form this patch to PATCH 13/18.
> [PATCH v8 12/18] media: cadence: csi2rx: add multistream support
> - Move support for enable/disable_streams() API that was added in this pa=
tch to
>   PATCH 07/18 earlier in this series.
> - Remove the mutex from the driver
> [PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
> - Move support for enable/disable_streams() API that was added in this pa=
tch to
>   PATCH 08/18 earlier in this series.
> - Remove csi->mutex protection inside enable/disable_streams() function c=
alls to
>   solve circular locking dependency warning.
> - Mention that DT filtering is also supported in the commit message.
>=20
> Link to (v7):
> https://lore.kernel.org/all/20250911102832.1583440-1-r-donadkar@ti.com/#t
>=20
> ---
> Changes in v7:
>=20
> [PATCH v6 03/16] media: ti: j721e-csi2rx: separate out device and context
> - Resolve bisect test fail because of undefined 'csi' variable
> - Resolve bisect test fail because of 'vdev' not being in scope when used
> [PATCH v6 07/16] media: ti: j721e-csi2rx: get number of contexts from dev=
ice tree
> - Resolve compiler warning regarding missing error code 'ret'
> [PATCH v6 12/16] media: ti: j721e-csi2rx: Submit all available buffers
> - Remove unused variable
>=20
> Link to (v6):
> https://lore.kernel.org/all/20250908134729.3940366-1-r-donadkar@ti.com/
>=20
> ---
> Changes in v6:
>=20
> # New patches in v6:
>=20
> [PATCH v6 14/16] media: cadence: csi2rx: Support runtime PM
> [PATCH v6 15/16] media: ti: j721e-csi2rx: Support runtime suspend
> [PATCH v6 16/16] media: ti: j721e-csi2rx: Support system suspend
> using pm_notifier
>=20
> # Changes in patches from v5:
> [PATCH v5 01/16] media: ti: j721e-csi2rx: Remove word size alignment
> on frame width
> - Remove restrictions on minimum frame width in ti_csi2rx_fill_fmt()
> - Add Reviewed-by from Abhilash
> [PATCH v5 02/16] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma=
 chans
> - No change
> [PATCH v5 03/16] media: ti: j721e-csi2rx: separate out device and context
> - No change
> [PATCH v5 04/16] media: ti: j721e-csi2rx: prepare SHIM code for multiple =
contexts
> - No change
> [PATCH v5 05/16] media: ti: j721e-csi2rx: allocate DMA channel based on c=
ontext index
> - No change
> [PATCH v5 06/16] media: ti: j721e-csi2rx: add a subdev for the core device
> - No change
> [PATCH v5 07/16] media: ti: j721e-csi2rx: get number of contexts from dev=
ice tree
> - Solve compilation warnings
> [PATCH v5 08/16] media: cadence: csi2rx: add get_frame_desc wrapper
> - No change
> [PATCH v5 09/16] media: ti: j721e-csi2rx: add support for processing virt=
ual channels
> - Remove unnecessary call to v4l2_unlock_state()
> [PATCH v5 10/16] media: cadence: csi2rx: add multistream support
> - No change
> [PATCH v5 11/16] media: ti: j721e-csi2rx: add multistream support
> - No change
> [PATCH v5 12/16] media: ti: j721e-csi2rx: Submit all available buffers
> - No change
> [PATCH v5 13/16] media: ti: j721e-csi2rx: Change the drain architecture f=
or multistream
> - Squash implementation of completion barriers for last drain cycle
> - Make struct completion per ctx
>=20
> Link to (v5):
> https://lore.kernel.org/all/20250825142522.1826188-1-r-donadkar@ti.com/
>=20
> ---
> Changes in v5:
>=20
> # New patches in v5:
>=20
> [PATCH v5 01/14] media: ti: j721e-csi2rx: Remove word size alignment
> [PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain
>=20
> # Changes in patches from v4:
>=20
> [PATCH v4 01/12] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma=
 chans
> - No change
> [PATCH v4 02/12] media: ti: j721e-csi2rx: separate out device and context
> - No change
> [PATCH v4 03/12] media: ti: j721e-csi2rx: prepare SHIM code for multiple =
contexts
> - No change
> [PATCH v4 04/12] media: ti: j721e-csi2rx: allocate DMA channel based on c=
ontext index
> - No change
> [PATCH v4 05/12] media: ti: j721e-csi2rx: add a subdev for the core device
> - No change
> [PATCH v4 06/12] media: ti: j721e-csi2rx: get number of contexts from dev=
ice tree
> - No change
> [PATCH v4 07/12] media: cadence: csi2rx: add get_frame_desc wrapper
> - No change
> [PATCH v4 08/12] media: ti: j721e-csi2rx: add support for processing virt=
ual channels
> - No change
> [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
> - No change
> [PATCH v4 10/12] media: ti: j721e-csi2rx: add multistream support
> - Serialize stream stop
> - Remove the break statement to avoid early return in the loop, as
>   reported by Sjoerd
> [PATCH v4 11/12] media: ti: j721e-csi2rx: Submit all available buffers
> - Delete the list node on DMA error to avoid kernel panic
> [PATCH v4 12/12] media: ti: j721e-csi2rx: Change the drain architecture f=
or multistream
> - Mention about next frame after drain being bogus
>=20
> Link to (v4):
>   https://lore.kernel.org/all/20250514112527.1983068-1-r-donadkar@ti.com/
>=20
> Changes in v4:
>=20
> [PATCH 01/13] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma ch=
ans
>   - No change
> [PATCH 02/13] media: ti: j721e-csi2rx: separate out device and context
>   - Add ctx identifier in the dev_err() message
>   - No change
> [PATCH 03/13] media: ti: j721e-csi2rx: prepare SHIM code for multiple con=
texts
>   - Reduced the name string lenght from 32 chars to 5 chars
> [PATCH 04/13] media: ti: j721e-csi2rx: allocate DMA channel based on cont=
ext index
>   - No change
> [PATCH 05/13] media: ti: j721e-csi2rx: add a subdev for the core device
>   - Add .enum_mbus_code callback
>   - Replace statically allocated struct with a global static const struct
>     v4l2_mbus_framefmt and used that in the _init_state() function
> [PATCH 06/13] media: ti: j721e-csi2rx: get number of contexts from device=
 tree
>   - Fix the drain buffer being leaked
>   - If the shows more number of ctx than the TI_CSI2RX_MAX_CTX, return an=
 error
>     instead of warning
> [PATCH 07/13] media: cadence: csi2rx: add get_frame_desc wrapper
>   - No change
> [PATCH 08/13] media: ti: j721e-csi2rx: add support for processing virtual=
 channels
>   - Call ti_csi2rx_get_vc() only once on first stream start and cache the=
 VC data in
>     the driver, use the corresponding VC in all subsequent stream starts.
> [PATCH 09/13] media: cadence: csi2rx: Use new enable stream APIs
> [PATCH 10/13] media: cadence: csi2rx: Enable multi-stream support
>   - Squash the above two patches into
>     [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
>   - Use already obtained csi2rx->source_pad in enable_streams() and
>     disable_streams() call
>   - Update commit message with the reason for using a custom helper for s=
_stream
>     instead of v4l2_subdev_s_stream_helper()
>   - Use v4l2_get_link_freq() variant that takes pad of the source as its =
first
>     argument instead of the one that takes v4l2_ctrl_handler
>   - Call v4l2_get_link_freq() with bpp =3D 0 to prevent fallback to V4L2_=
CID_PIXEL_RATE
>     in multi-stream case
>   - Use lock guards to simplify error handling
>   - Call csi2rx_update_vc_select() at first stream start before enabling =
the controller
> [PATCH 11/13] media: ti: j721e-csi2rx: add multistream support
>   - No change
> [PATCH 12/13] media: ti: j721e-csi2rx: Submit all available buffers
>   - No change
> [PATCH 13/13] media: ti: j721e-csi2rx: Change the drain architecture for =
multistream
>   - Fix checkpatch warning
>   - Change commit message to give a better description of the patch
>=20
> Link to (v3):
>   https://lore.kernel.org/all/20250417065554.437541-1-r-donadkar@ti.com/
>=20
> Changes in v3:
>=20
> - Drop [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM from
>   v2, support for runtime PM will be added in a separate series:
>   https://lore.kernel.org/all/20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideaso=
nboard.com/
> - Change the drain architecture to prevent FIFO overflow in multistream
>   usecases.
> - With the new drain architecture, we don't need the the driver to wait
>   for userspace to start streaming on all "actively routed" video nodes
>   before starting streaming on the source. So, revert back to the capture
>   architecture where streams can be started and stopped independent
>   to each other.
>=20
> Link to (v2):
>   https://lore.kernel.org/r/20240627-multistream-v2-0-6ae96c54c1c3@ti.com
>=20
> Changes in v2:
>=20
> - Change the multi-camera capture architecture to be similar to that of
>   Tomi's RPi5 FE series, where the driver will wait for userspace to
>   start streaming on all "actively routed" video nodes before starting
>   streaming on the source. This simplifies things a lot from the HW
>   perspective, which might run into deadlocks due to a shared FIFO
>   between multiple DMA channels.
>=20
> - Drop a few fixes that were posted separately and are already merged
> - Fix dtschema warnings reported by Rob on [02/13]
> - Fix warnings for uninitialized `used_vc` variable in cdns-csi2rx.c
> - Return -EBUSY if someone updates routes for j721e-csi2rx subdev while
>   streaming
> - Only allow single-streams to be routed to the source pads (linked to
>   video nodes) of the j721e-csi2rx device
> - Squash the patches marked "SQUASH" in the v1 RFC series
>=20
> Changhuang Liang (1):
>   media: cadence: csi2rx: Support runtime PM
>=20
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
>=20
> Pratyush Yadav (4):
>   media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
>   media: ti: j721e-csi2rx: allocate DMA channel based on context index
>   media: ti: j721e-csi2rx: get number of contexts from device tree
>   media: cadence: csi2rx: add get_frame_desc wrapper
>=20
> Rishikesh Donadkar (3):
>   media: ti: j721e-csi2rx: Remove word size alignment on frame width
>   media: cadence: csi2rx: Move to .enable/disable_streams API
>   media: ti: j721e-csi2rx: Change the drain architecture for multistream
>=20
>  .../bindings/media/ti,j721e-csi2rx-shim.yaml  |   39 +-
>  drivers/media/platform/cadence/Kconfig        |    1 +
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  509 +++++--
>  drivers/media/platform/ti/Kconfig             |    1 +
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1219 ++++++++++++-----
>  5 files changed, 1320 insertions(+), 449 deletions(-)
>=20
> --=20
> 2.34.1
>=20
>

