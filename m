Return-Path: <linux-media+bounces-16281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65395183F
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 12:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CD111F23A9B
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 10:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379011AD9EE;
	Wed, 14 Aug 2024 10:02:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D545A1AD9E4
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723629761; cv=none; b=ixUD+fWLB8XDtWkqt2sg2zq1HBxP1kS+fINpaJJHHa3YH2tO9P21/lMnbPGiGGJXDQhkgvoEGusyrG4WDpH+6CPn+b+737MeXwfjkwrcXSZeEumoWJ5x2qYh0n4yp1bpZx2s/awiBj5JqhOCBONd6a1Y9EDmYMP63kGKYrOZzFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723629761; c=relaxed/simple;
	bh=tCk+VLwF1xD3H5u/Uo3J7/Jhh237r2up+DlzGKXe5iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7IaI+/Pqw4iuiXQ57vRfkwHH+b+SyXEAT3nZcOmUAoKuqiIkf/a5QAewBCrPO9MFcc971b7vHxdxZki5ZBLAJffcBGAeg3rxmRg5VrkLRV5G0yIQU7pZG+gW2RDieXWmWUgwLJgj1nyInjnJZ6ujf9Go7PqHaJ23dtxoOkNlq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97CDC32786;
	Wed, 14 Aug 2024 10:02:40 +0000 (UTC)
Message-ID: <70262640-21eb-452a-a24d-783b4bcd8d54@xs4all.nl>
Date: Wed, 14 Aug 2024 12:02:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR v6.12] rkisp1 extensible parameters format
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240812230545.GA2358@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240812230545.GA2358@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 13/08/2024 01:05, Laurent Pinchart wrote:
> Hi Hans, Mauro,

commit 5ef3fcc8e42b43523498c7b0ede19a47fbdf8353 (media: rkisp1: Implement extensible params support)
failed to push because the commit log contains a local changelog:

    ...
    Implement parameter buffer validation for the extensible format at
    .buf_prepare() time.

    Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
    Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
    Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
    Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
    Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    ---
    Changes since v10:

    - Use %zu to print size_t arguments

I can either just take these patches (i.e. I don't merge them), and manually remove
this before committing, or you need to update your tree yourself.

If you decide to do the latter, then please add my:

	Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

to patches 2 and 3 (uAPI changes).

Regards,

	Hans

> 
> The following changes since commit c80bfa4f9e0ebfce6ac909488d412347acbcb4f9:
> 
>   media: ti: cal: use 'time_left' variable with wait_event_timeout() (2024-08-09 07:56:39 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-rkisp1-20240813
> 
> for you to fetch changes up to 32be6029c1c1e8c628077403b2096e9d9085f6c8:
> 
>   media: rkisp1: Add support for the companding block (2024-08-12 13:36:50 +0300)
> 
> ----------------------------------------------------------------
> Extensible parameters support for the rkisp1 driver
> 
> ----------------------------------------------------------------
> Jacopo Mondi (7):
>       media: uapi: rkisp1-config: Add extensible params format
>       media: uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
>       media: rkisp1: Add struct rkisp1_params_buffer
>       media: rkisp1: Copy the parameters buffer
>       media: rkisp1: Cache the currently active format
>       media: rkisp1: Implement extensible params support
>       media: rkisp1: Implement s_fmt/try_fmt
> 
> Laurent Pinchart (2):
>       media: rkisp1: Add helper function to swap colour channels
>       media: rkisp1: Add features mask to extensible block handlers
> 
> Ondrej Jirman (1):
>       media: rkisp1: Adapt to different SoCs having different size limits
> 
> Paul Elder (3):
>       media: rkisp1: Add register definitions for the companding block
>       media: rkisp1: Add feature flags for BLS and compand
>       media: rkisp1: Add support for the companding block
> 
>  Documentation/admin-guide/media/rkisp1.rst         |   11 +-
>  .../userspace-api/media/v4l/metafmt-rkisp1.rst     |   57 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-common.c |   14 +
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |   49 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |    5 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   15 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    9 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 1037 ++++++++++++++++++--
>  .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |   23 +
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    4 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |   51 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
>  include/uapi/linux/rkisp1-config.h                 |  578 +++++++++++
>  include/uapi/linux/videodev2.h                     |    1 +
>  14 files changed, 1689 insertions(+), 166 deletions(-)
> 


