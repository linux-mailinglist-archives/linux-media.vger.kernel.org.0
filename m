Return-Path: <linux-media+bounces-51132-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIvxJhdYcGlvXQAAu9opvQ
	(envelope-from <linux-media+bounces-51132-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 05:37:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCF51185
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 05:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 099E4728DEF
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 13:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02657428822;
	Tue, 20 Jan 2026 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOmbSAfC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA78426681
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917290; cv=none; b=Vxay502jxtANmknSHIwrmdi9+QQy0k3y/qD7ffdIXgJLxQ1aatm6UU3+ja1UJ9VUBM+qyU4jKx63miLxL94t2p0ISzy8eXLNEHwfUNsuOWzfp08itybpLgxotpC5rbMywF5gsNYgu9gGCk8r3pOdCygEmFMn/HE6o79E66GgWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917290; c=relaxed/simple;
	bh=eaOH+RlND+I4sqR+LPt64myVBUAZjVWp5x4ukb2kWxc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=VV1IPrHaGIV/wycB19bcuoGDCIel5SmKEwdZn8LaGs74YKl8zRrk8cJAzvGWnQjmc174X2K2V/Yd4nitUoDYBxTCQUgGaEOw0D28v90Y4g3Roqc6Sc4F/bGK4VF2mERDKqgBVnI1Xz4eV6EQSVd1m7eeKydPBimSkBrrzlyDfo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOmbSAfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8811CC16AAE;
	Tue, 20 Jan 2026 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768917290;
	bh=eaOH+RlND+I4sqR+LPt64myVBUAZjVWp5x4ukb2kWxc=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=GOmbSAfCROgLeH+zTGkCjW+Z0+JEKi0sTbVovdRMA/MhvItf10vzNouHxaRZrtimi
	 EVLKlJprYdtzT2RgUoiW0LWqE9qtONWP/iQHTMpRFT+KT1EUVjw4Ofw+KdksIqes1Y
	 +XvPBhh8lygMdGzqiH0RkrkMENYbe8TXd+0FO7GYemTf2Y3vg30LRG3pGnWAwIvwL4
	 s1BkjV0xVbQ5cbRxAbOm1dT1zS4C0WDpuGphcVbzibqEogY33HR44tGhJLcRgXdbRq
	 LqFdBYY2Dc8uPmWnv4S4avegwFB1jRjr28SKiFypv8qel5Ha6VOXiSDGRjBMGRxnFe
	 IM8cYF0A3WdIQ==
Message-ID: <5e8714d8-94bc-4277-b851-fc1ecbe6b4d6@kernel.org>
Date: Tue, 20 Jan 2026 14:54:48 +0100
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
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51132-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 46DCF51185
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

This sparse issue with cabac_table should be fixed. It's actually important,
since it ensures that what the header says matches the actual table.

Without it I can just change const s8 rkvdec_h264_cabac_table[4][464][2] to e.g.
const s8 rkvdec_h264_cabac_table[4][464][4], and it will compile just fine, even
though it now no longer matches what the header says.

Regards,

	Hans

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


