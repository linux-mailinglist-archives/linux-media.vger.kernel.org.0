Return-Path: <linux-media+bounces-30878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 224EDA99A8D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 23:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D3A446C41
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9202951A6;
	Wed, 23 Apr 2025 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IgES3LL2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323C027F4F5;
	Wed, 23 Apr 2025 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442854; cv=none; b=ka39iESgn9NyRtDQwct+Ykk+kFCL/W+hWEM8C2+6V0ZT6rLc0IVOdUuW+0mdIPEBJErIPUKFfxZ4AniisKBpTpap/nk6nUqDn8DML8HDHOQsN43mFq1ejE+4xUqglxTVRO96xTyoOjJY0xv5PPQkBJ5Iw+1uedeX1JZHV/YLudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442854; c=relaxed/simple;
	bh=o+0jFHReUaY3+P4hC7ImvrPLRCsb+LepftuQIgHSvH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP6rx+glButuy/Hk7grpOoh7LmINbxUfKQK44/jM1cxKvwZxmml3LjGFqunhkn8RDYrGeDEufICyyNwVuBKTnMDjFOkd83I8nlVw4vGNqaXJq7VqVRjNO4i2lwzV4cjzr63ZAQ3M8jYP1+WO/5kda6LCD+bOvbzV8Iwjb4uaWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IgES3LL2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0C04198D;
	Wed, 23 Apr 2025 23:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745442849;
	bh=o+0jFHReUaY3+P4hC7ImvrPLRCsb+LepftuQIgHSvH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgES3LL2a5LCRZClGXESZyL8Bjo2Ra73tHc29R6DmzdW7YNuDvx/xoVglpct1QGpR
	 o8WsWcK70Rw6nFfbS87FTsqWPtA/IvKL4tMFXY6bFvFn4H+MQQhF9XNS5VswJ4cVwk
	 wFruJ5BLUOMvvlMcJ89l4TTfjJ7cY2pWUj1NJbbs=
Date: Thu, 24 Apr 2025 00:14:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v7 0/5] media: renesas: vsp1: Add support for VSPX and IIF
Message-ID: <20250423211409.GB5879@pendragon.ideasonboard.com>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>

Hi Jacopo,

Thank you for the patches.

On Tue, Apr 01, 2025 at 04:22:00PM +0200, Jacopo Mondi wrote:
> The VSPX is a VSP2 function that reads data from
> external memory using two RPF instances and feed it to the ISP.
> 
> The VSPX includes an IIF unit (ISP InterFace) modeled in the vsp1 driver
> as a new, simple, entity type.
> 
> IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
> interfacing. To prepare to support VSPX, support IIF first by
> introducing a new entity and by adjusting the RPF/WPF drivers to
> operate correctly when an IIF is present.

I think patches 1/5 to 4/5 are ready to be merged, but 5/5 needs more
work. Please let me know if I can take the first four patches in my tree
already.

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Changes in v7:
> - Include VSPX driver in the series
> - Use existing VSP1 formats and remove patches extending formats on RPF
> - Rework VSPX driver to split jobs creation and scheduling in two
>   different API entry points
> - Fix VSPX stride using the user provided bytesperline and using the
>   buffer size for ConfigDMA buffers
> - Link to v6: https://lore.kernel.org/r/20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com
> 
> Changes in v6:
> - Little cosmetic change as suggested by Laurent
> - Collect tags
> - Link to v5: https://lore.kernel.org/r/20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com
> 
> Changes in v5:
> - Drop additional empty line 5/6
> - Link to v4: https://lore.kernel.org/r/20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com
> 
> Changes in v4:
> - Fix SWAP bits for RAW10, RAW12 and RAW16
> - Link to v3: https://lore.kernel.org/r/20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com
> 
> Changes in v3:
> - Drop 2/6 from v2
> - Add 5/7 to prepare for a new implementation of 6/7
> - Individual changelog per patch
> - Add 7/7
> - Link to v2: https://lore.kernel.org/r/20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com
> 
> Changes in v2:
> - Collect tags
> - Address review comments from Laurent, a lot of tiny changes here and
>   there but no major redesign worth an entry in the patchset changelog
> 
> ---
> Jacopo Mondi (5):
>       media: vsp1: Add support IIF ISP Interface
>       media: vsp1: dl: Use singleshot DL for VSPX
>       media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
>       media: vsp1: rwpf: Support operations with IIF
>       media: vsp1: Add VSPX support
> 
>  drivers/media/platform/renesas/vsp1/Makefile      |   3 +-
>  drivers/media/platform/renesas/vsp1/vsp1.h        |   4 +
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c     |   7 +-
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c    |  24 +-
>  drivers/media/platform/renesas/vsp1/vsp1_entity.c |   8 +
>  drivers/media/platform/renesas/vsp1/vsp1_entity.h |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 121 +++++
>  drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  29 ++
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   9 +
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |   9 +-
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.c   | 604 ++++++++++++++++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.h   |  86 +++
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  24 +-
>  include/media/vsp1.h                              |  73 +++
>  16 files changed, 991 insertions(+), 13 deletions(-)
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20250123-v4h-iif-a1dda640c95d

-- 
Regards,

Laurent Pinchart

