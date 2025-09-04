Return-Path: <linux-media+bounces-41760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D10B43610
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 10:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C0003A8F5E
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F06C2D0638;
	Thu,  4 Sep 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPgjuoHQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C102C17A3
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975167; cv=none; b=VFHohvZWdliR4uthhqIA9gczGqORUKrXKpxOsGc0ishx5B/zBCB8CHQyDxn7ydBnY9etKcb/DRRRdngALl+ze2bY3hSP2ivVx7IAOb4mamLRwldBGhry5MhSinmfkRYj4l823CcJbyptaaXle9mwb+qXkBaTMa6IYLRuIA0PRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975167; c=relaxed/simple;
	bh=yjMCF8GEbNKCm/D9487IYDE2tUX9BOdiB0GMhQlNddA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=bbMMGhviOA9HmGibvvP/2Oy5hZJ/3Eg3rbcHdpCG/RMUaWRD6gzju/TyDkkrqfQKYF+De3iwkuGfHEz6KHjx7O98KgobrtqqupyJuApUCL1YjZ7pe2im0b3+lD8RkivYudCVQNZDkrSZSo92uNDVCuvl6sVGj/wtO1zg2bFAAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPgjuoHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D57C4CEF0;
	Thu,  4 Sep 2025 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756975167;
	bh=yjMCF8GEbNKCm/D9487IYDE2tUX9BOdiB0GMhQlNddA=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=JPgjuoHQiSmzev6uSDoY2+GxQL92CFsqh/YPyuJ54+yr2UhBstIz9zl5/RNDHb2l/
	 lBURfJWbP7XSPHVZFYnD7MiKaqF3y7imN/Y5Ji1Nz9holbNgVVJOkcB+TvXD3zxHTj
	 vbnT9wwUwttU4Lr8lpqlDAr6/btie3Ni5tGLiCWq1qVqTtuAV6nsNzKWqSLq4fy/Rd
	 X8SCYgLbKQm2zaC6HLDtWAsw/U9g4MumgxFC03XVeGPKXzAzk6kps0bYywymyJpN3O
	 pgbjZcuuZi+3IWExVGXGde2s+fgmnSRhlronUyOKLBTxgB2BJ8jJluCfh1+aZC+WC0
	 kFVhirSDsxcqg==
Message-ID: <18806e61-3890-4d2d-9740-a1aee00d6884@kernel.org>
Date: Thu, 4 Sep 2025 10:39:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR 6.18] Media Codec Fixes 2025-09-03
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org
References: <dd469ea1001160b5cf7b7bf4f44dfdda8d2d27ce.camel@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <dd469ea1001160b5cf7b7bf4f44dfdda8d2d27ce.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2025 21:05, Nicolas Dufresne wrote:
> Hey Mauro, Hans,
> 
> I collected the easy stuff I had in queue, so we have code clean and just one
> fix for the MT8188 MDP3 M2M driver.
> 
> cheers,
> Nicolas
> 
> ---
> 
> The following changes since commit 603957ae903e81fb80d3788297c0f58a68802dfc:
> 
>   media: rkisp1: Add support for multiple power domains (2025-08-31 11:10:07 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.18-media-codecs-2025-09-03
> 
> for you to fetch changes up to aa067d8de6e85c90a92c4281235c5cb6d7651fb5:
> 
>   media: uapi: v4l2-controls: Cleanup codec definitions (2025-09-03 13:08:23 -0400)
> 
> ----------------------------------------------------------------
> Code cleanup and MT8188 MDP3 fix
> 
> ----------------------------------------------------------------
> AngeloGioacchino Del Regno (1):
>       dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node address

This one is missing the SoB of the devicetree maintainers. I'm dropping it from this
PR, but will apply the other patches.

I also noticed that it wasn't delegated to ndufresne in patchwork, perhaps this was
mistakingly added to the PR?

Regards,

	Hans

> 
> Liao Yuanhong (1):
>       media: chips-media: wave5: Remove redundant ternary operators
> 
> Lukas Bulwahn (1):
>       MAINTAINERS: merge sections for ROCKCHIP VIDEO DECODER DRIVER
> 
> Nícolas F. R. A. Prado (1):
>       media: platform: mtk-mdp3: Add missing MT8188 compatible to comp_dt_ids
> 
> Paul Kocialkowski (3):
>       media: verisilicon: imx8m: Use the default Hantro G1 irq handler
>       media: verisilicon: Explicitly disable selection api ioctls for decoders
>       media: uapi: v4l2-controls: Cleanup codec definitions
> 
>  Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml |  2 +-
>  Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml |  2 +-
>  MAINTAINERS                                                          |  9 +--------
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c             |  2 +-
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c                 |  3 +++
>  drivers/media/platform/verisilicon/hantro_drv.c                      |  2 ++
>  drivers/media/platform/verisilicon/hantro_v4l2.c                     |  6 ++----
>  drivers/media/platform/verisilicon/imx8m_vpu_hw.c                    | 20 +-------------------
>  include/uapi/linux/v4l2-controls.h                                   | 23 +++++++++++------------
>  9 files changed, 23 insertions(+), 46 deletions(-)
> 
> 


