Return-Path: <linux-media+bounces-51108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B21D8D3C575
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 11:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD8AB7036E8
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 09:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCF4389E1D;
	Tue, 20 Jan 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dv7muocU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308A3BF2E9
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902294; cv=none; b=K/iUu60Y9uu3FHtaqazNbCj9v17qinEcBpyjloZaPxUN72Fa97UmWOXCbfGpKKeBoU31+5An3U80COYS+tGkmDSG1HYyWuADZ0d7mTCbKMjwQ8c2sVPGzhFmz4Rnk5nbnv44MlonwO4pDv5Prn7+HlYP3ZYeq53STrPL7JwgbXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902294; c=relaxed/simple;
	bh=gbEALkGK6dxaWqdURo48K+3T1+2noP1607QDX/LyaC0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=B4JdV7uBMVWi87Q0OL+QXYAAHmagifdtPubGKLLVsXZaKy+Ipg3+DmDckxlL6DbqnpVnfN3He7CFyeTuZ8Y/ufR6s6BmDvLQBi01wP2bMf3lMYyhvEsDIJ9vWzEPchpJ0KjIHLy7cY/LMjm5n3djVHobcM0wdeF6LnCmvEkYFoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dv7muocU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B349C16AAE;
	Tue, 20 Jan 2026 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768902294;
	bh=gbEALkGK6dxaWqdURo48K+3T1+2noP1607QDX/LyaC0=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=Dv7muocU4PAK7jfFTxTNZQqvd53AxR/hMLSpERj6iclCPNIei8/F/6RkTTcwc0K/V
	 oteb5WScxv+zDoLPx8TH7mpghMx3H3yY2LqxvNqdxhzt1mRxjALf5wHlZSzExQTS0g
	 z9Y6zd1I/aExCmxP3q03R1OiGVf1jyZ/++XS+v2VyfcwyY6D0u4nTqiKbrnFELyD9s
	 32t9acivtOIW+JDhqqs0c9KIpOBxjuAD0hv/4PAgBltO38rERVjgDC/aGIR1o/dokL
	 VJUrbEqF/5HDCG32R+aQLRPCZb5/HpFdstaFOfQbyKGP9UDls9cmpW3zE12DdmNcry
	 kaDBjKGkhjDGw==
Message-ID: <e467278f-4b2a-46dc-9397-08088224a50f@kernel.org>
Date: Tue, 20 Jan 2026 10:44:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR 6.20] Media codec 2026-01-18
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org
References: <78bfd01051ef84ef7e6ccbd0a72301a939869476.camel@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <78bfd01051ef84ef7e6ccbd0a72301a939869476.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nicolas,

I'm getting stackframe warnings when I run it through CI:

https://linux-media.pages.freedesktop.org/-/users/hverkuil/-/jobs/91427048/artifacts/report.htm

Can you take a look?

Regards,

	Hans

On 19/01/2026 14:48, Nicolas Dufresne wrote:
> Hi Mauro, Hans,
> 
> This PR introduce support for H.264 and HEVC decoding on Rockchip RK3588 and
> RK3576 SoC. Unlike other HEVC drivers, the hardware implements complete slice
> header parsing instead of using skip parameters. Two new compound controls are
> added to extend the SPS control with the missing information. Additionally,
> buffer size calculation is added for Hantro AV1 decoder, fixing support for
> decoding more then 8 tiles.
> 
> You will notice few checkpatch warning, I've looked through them, some are
> complaining about already in the tree, but moved, or asking to make the code
> unreadable, so I decided to ignore. The sparse check complains about
> rkvdec_h26{4,5}_cabac_table missing declaration. Both are declared, but I agree
> with the code author that including the header that declares it is not useful in
> this specific case, making this a false positive. Let me know if you prefer to
> workaround any of these, I can respin quickly.
> 
> cheers,
> Nicolas
> 
> ---
> 
> The following changes since commit eb4ee870747c3a77a9c3c84d84efb64bd481013a:
> 
>   Documentation: admin-guide: media: mgb4: Add GMSL1 & GMSL3-coax modules info (2026-01-17 09:08:02 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.20-media-codecs-2026-01-18
> 
> for you to fetch changes up to 9a92af47becc137d9dab290fd70b5e38f345a3a6:
> 
>   media: verisilicon: AV1: Fix tile info buffer size (2026-01-18 19:38:01 -0500)
> 
> ----------------------------------------------------------------
> Media Codec Fixes
> 
> ----------------------------------------------------------------
> Benjamin Gaignard (1):
>       media: verisilicon: AV1: Fix tile info buffer size
> 
> Detlev Casanova (17):
>       media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
>       media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls
>       media: visl: Add HEVC short and long term RPS sets
>       media: rkvdec: Switch to using structs instead of writel
>       media: rkvdec: Move cabac tables to their own source file
>       media: rkvdec: Use structs to represent the HW RPS
>       media: rkvdec: Move h264 functions to common file
>       media: rkvdec: Move hevc functions to common file
>       media: rkvdec: Add variant specific coded formats list
>       media: rkvdec: Add RCB and SRAM support
>       media: rkvdec: Support per-variant interrupt handler
>       media: rkvdec: Enable all clocks without naming them
>       media: rkvdec: Disable multicore support
>       media: rkvdec: Add H264 support for the VDPU381 variant
>       media: rkvdec: Add H264 support for the VDPU383 variant
>       media: rkvdec: Add HEVC support for the VDPU381 variant
>       media: rkvdec: Add HEVC support for the VDPU383 variant
> 
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst           | 120 +++++++++++++
>  Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions              |   2 +
>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst                    |  12 ++
>  drivers/media/platform/rockchip/rkvdec/Makefile                               |  14 +-
>  drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c => rkvdec-cabac.c} | 506 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c                   | 258 ++++++++++++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h                   |  89 ++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c                          | 892 ++++++++---------------------------------------------------------------------------------------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c                   | 511 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h                   | 109 ++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c                          | 281 ++++--------------------------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c                           | 179 +++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h                           |  29 ++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h                          | 586 +++++++++++++++++++++++++++++++++++++++++---------------------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c                  | 468 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c                  | 638 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h                  | 430 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c                  | 572 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c                  | 710 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h                  | 281 ++++++++++++++++++++++++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c                           | 232 +++++++++++--------------
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c                               | 586 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h                               |  50 +++++-
>  drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c               |   4 +-
>  drivers/media/test-drivers/visl/visl-dec.c                                    |   7 +
>  drivers/media/test-drivers/visl/visl-dec.h                                    |   3 +
>  drivers/media/test-drivers/visl/visl-trace-hevc.h                             |  59 +++++++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c                                     |  28 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                                     |  10 ++
>  include/uapi/linux/v4l2-controls.h                                            |  61 +++++++
>  include/uapi/linux/videodev2.h                                                |   2 +
>  31 files changed, 6264 insertions(+), 1465 deletions(-)
>  rename drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c => rkvdec-cabac.c} (86%)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> 


