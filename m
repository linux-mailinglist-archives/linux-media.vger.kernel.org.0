Return-Path: <linux-media+bounces-60250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MChWGjxP+GmQsQIAu9opvQ
	(envelope-from <linux-media+bounces-60250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:48:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F0A4B9988
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB90F3007508
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 07:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F48312826;
	Mon,  4 May 2026 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwqR/8Ev"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E722E040D
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880793; cv=none; b=QsIn0RcdRbp9qAG3bBRO7gxOUCNy14imkOjg8JCGkr+7WL2/W5qdfr2psIVhelwkgFXBqlFP5BES5NcoFf632frY3knYPhZiVr4/JVIu5vwZs9xfq7q6qXFkzpYcYKDrit/lZc0ad9gmBjIeojZmhbyklD+wEPwCWQsFp6u3JxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880793; c=relaxed/simple;
	bh=TanX2QkRkYajOs9rJv8M1UwUtn7GDNYNuUGF1xCpVF4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Aidh9Da+DOP1N9NxOdRUmE8jqCigvZvckd8x7u1XrKUtIMsTZyMuZFPxJIC4UFlmOOBAaVNOD7s43fQJzGO6nrp3EDDLaIsGoFcyckiS8xJ2hA8OmxA0zqVdEbaMuRy2nTBgLMnMUFFO+VryPnYGG7gzBMwX+8rEmKyhrytsEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwqR/8Ev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C702C2BCB8;
	Mon,  4 May 2026 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777880793;
	bh=TanX2QkRkYajOs9rJv8M1UwUtn7GDNYNuUGF1xCpVF4=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=NwqR/8Evr2t3QmGQ/S3g71cYHF0iK4Dwfh7P5Vc066OhswrHOc3ue1Dbnm4CFxg0W
	 w7wrVkTGEKpeL+UkHXyQAEPoyApBG0MH/PIvcJxoWmEqHtx1Zm85bXvXiAVmZay585
	 eg6CSrNosB6vWTA4abA/+ewwmY0BgUvFx4CEXn+LrLhdVZo52768fcScIeqXDaNOg+
	 jJMDyyRMYWq+HpQbcYk+t2LYAxU3pR5Ksu1Qp/8z8s9lxi40ByMEe13DkM4ybtuInu
	 zC+nFIZ7OI6W/vAIWvgaIsTGDO3SOp0R45gxiCYLnmJ2m779Q7X2aMOacAnXSvLzDu
	 h/2pqTJQska0g==
Message-ID: <d3801f35-96ec-4b66-a43a-39923a8ef421@kernel.org>
Date: Mon, 4 May 2026 09:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR 7.2] Media codec for 7.2 2026-05-03
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org
References: <06ca2e5f94b207d693e7959d8912cfb8694ce08f.camel@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <06ca2e5f94b207d693e7959d8912cfb8694ce08f.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 03F0A4B9988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60250-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

Hi Nicolas,

On 03/05/2026 17:50, Nicolas Dufresne wrote:
> Hi Mauro, Hans,
> 
> This contains several fixes and improvement in codec drivers. In Verisilicon
> driver, an internal AV1 helper has been created in preparation of new chips
> versions support and a fix around pixel format selection has been added to fix
> possibly loosing film grain. In rkvdec, a minimal bitwriter has been generalized
> inside the driver and some of the bitfield have been ported to that. This should
> help significantly reduce stack usage with clang and ASAN. The HEVC slice
> compound controls have common validation and more validation specific to the
> cedrus driver was added. Chips&Media Wave5 drivers now supports constrained-
> baseline profile and has a new control to enable background detection in the
> decoder. The rest is mostly cleanup and fixup of issues mostly found by static
> analyses.
> 
> cheers,
> Nicolas
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-7.2-media-codecs-2026-05-03
> 
> for you to fetch changes up to 9f670b8e9507766a833bbf18c351a8155ab119ed:
> 
>   media: v4l2-common: Add YUV24 format info (2026-05-03 11:34:19 -0400)
> 
> ----------------------------------------------------------------
> Fixes across codec drivers and new wave5 features
> 
> ----------------------------------------------------------------
> Benjamin Gaignard (2):
>       media: verisilicon: Create AV1 helper library

I'm dropping this patch from this PR. The others look good to me, but this
one needs a bit more work IMHO.

Regards,

	Hans

>       media: verisilicon: Export only needed pixels formats
> 
> Brandon Brnich (3):
>       media: chips-media: wave5: Move src_buf Removal to finish_encode
>       media: chips-media: wave5: Release m2m_ctx after Instance Removed from List
>       media: chips-media: wave5: Fix Reports from Kernel Lock Validator
> 
> Chen-Yu Tsai (1):
>       dt-bindings: media: sun4i-a10-video-engine: Add interconnect properties
> 
> Detlev Casanova (4):
>       media: rkvdec: Introduce a global bitwriter helper
>       media: rkvdec: Use the global bitwriter instead of local one
>       media: rkvdec: common: Drop bitfields for the bitwriter
>       media: rkvdec: vdpu383: Drop bitfields for the bitwriter
> 
> Fritz Koenig (1):
>       Documentation: media: Fix v4l2_vp9_segmentation
> 
> Jackson Lee (4):
>       media: v4l2-controls: Add control for background detection
>       media: chips-media: wave5: Add support for background detection
>       media: chips-media: wave5: Support CBP profile
>       media: chips-media: wave5: Add Support for Packed YUV422 Formats
> 
> Louis-Alexis Eyraud (1):
>       media: mtk-jpeg: cancel workqueue on release for supported platforms only
> 
> Nas Chung (1):
>       media: v4l2-common: Add YUV24 format info
> 
> Pengpeng Hou (2):
>       media: v4l2-ctrls: validate HEVC active reference counts
>       media: cedrus: skip invalid H.264 reference list entries
> 
> Rouven Czerwinski (1):
>       media: verisilicon: remove hantro_run declaration
> 
> Samuel Holland (2):
>       media: cedrus: Fix missing cleanup in error path
>       media: cedrus: Fix failure to clean up hardware on probe failure
> 
>  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml               |  10 ++
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst                         |   2 +-
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst                                   |   6 ++
>  drivers/media/platform/chips-media/wave5/wave5-helper.c                                     |   4 +-
>  drivers/media/platform/chips-media/wave5/wave5-helper.h                                     |   2 +-
>  drivers/media/platform/chips-media/wave5/wave5-hw.c                                         |   7 +-
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c                                    |  47 +++++++---
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c                                    |  73 +++++++++------
>  drivers/media/platform/chips-media/wave5/wave5-vpuapi.h                                     |   2 +
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c                                        |   3 +-
>  drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h                                   |  39 ++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c                                 |  51 +---------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h                                 |  40 ++------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c                                        | 109 +++++++++-------------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c                                 |  93 ++++---------------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h                                 |  57 +++---------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c                                        | 171 +++++++++++++++-------------------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c                                | 351 +++++++++++++++++++++++++++------------------------------------------
>  drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c                                | 502 ++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------------
>  drivers/media/platform/verisilicon/Makefile                                                 |   7 +-
>  drivers/media/platform/verisilicon/hantro_av1.c                                             | 780 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/verisilicon/hantro_av1.h                                             |  62 +++++++++++++
>  drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} |  18 ++--
>  drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} |  18 ++--
>  drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c}     |  82 ++++++++--------
>  drivers/media/platform/verisilicon/hantro_av1_filmgrain.h                                   |  44 +++++++++
>  drivers/media/platform/verisilicon/hantro_hw.h                                              |   8 +-
>  drivers/media/platform/verisilicon/hantro_v4l2.c                                            |   6 +-
>  drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h                                 |  36 --------
>  drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c                             | 935 +++++++++++++++++----------------------------------------------------------------------------------------------------------------------------------------------------------------------
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c                                        |   7 +-
>  drivers/media/v4l2-core/v4l2-common.c                                                       |   1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c                                                   |  13 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                                                   |   2 +
>  drivers/staging/media/sunxi/cedrus/cedrus.c                                                 |   5 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c                                            |   3 +
>  include/uapi/linux/v4l2-controls.h                                                          |   2 +
>  37 files changed, 1744 insertions(+), 1854 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (92%)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>  delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
> 


