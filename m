Return-Path: <linux-media+bounces-19914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3919A49BC
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 00:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB8D285B64
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 22:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717CA19067A;
	Fri, 18 Oct 2024 22:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTmfFDeZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C818FDB2;
	Fri, 18 Oct 2024 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729291505; cv=none; b=pYMXyzxw+B/xb9J7uSQWLjh1iPhOU6K24nR+Dhymswk4Mu388itVHqNOUYkdd66i7Vjyk8LFvLufb7PTj8EQQKH4tlJMwHXT4HISqc66vEvFSGdC8PJTutAmhOZYhdgEmUne+rDfLuIzBDkmuhq2zTsFx4YnFVADYsUZ+P2P/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729291505; c=relaxed/simple;
	bh=yucMMFbBngW7rNMpBtKpCuJNeeP2d7/ic+xFnd1C0WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hd4l9F9+c1K5ZYBD5WUg0ka1AGms+UU+ltHIa1KOVjzGofTSFkrmCXSkrlP3JkUAb5IV0CUDDcVF350ynNqOtinGDITVAHk9bgW5+6aReSkmbp3AqJoe2RR9YOoh4EQXRtZ7zpHmQ6obm3jhr4TKIcpmeIIfLcb4kjSeTKVCyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTmfFDeZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41383C4CEC3;
	Fri, 18 Oct 2024 22:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729291505;
	bh=yucMMFbBngW7rNMpBtKpCuJNeeP2d7/ic+xFnd1C0WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTmfFDeZ3bGoVHhmD9SeYLeIwNc6mET1F2a/4CpWi6yQHDZk6Fn+GGiuMwJ7lLqx0
	 g5876ZyZpALt5xlzfdXheu4DyhQ9OsnFs1RNmXufcA5q4KVUjlDRoMN2h7+AAqxtHR
	 O9LLAeKgJ3JwuSTXP+dCHqvdOHax32Hxt4X6uAqIe4t7W9FX5lUVEAffy2yjKHC0mm
	 NgpNjh5D1+gJRsKo5LtsMPb8ClZNLNmfpYAYTD94G5ebJaYAK//UMsUgqUGtuTzj7A
	 tYF2O6X4gDms7f3gc+uNUAJgXIWa4Xzcm4LLoaQk+/ogKqQDBnFxhe/pWinlJLq1GN
	 3FCW/tfpv1oeQ==
Date: Fri, 18 Oct 2024 15:45:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241018224502.GC2635543@thelio-3990X>
References: <20241018151448.3694052-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018151448.3694052-1-arnd@kernel.org>

On Fri, Oct 18, 2024 at 03:14:42PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With KASAN enabled, clang fails to optimize the inline version of
> vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
> of temporary values spilled to the stack:
> 
> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]
> 
> This seems to affect all versions of clang including the latest (clang-20),
> but the degree of stack overhead is different per release.
> 
> Marking the function as noinline_for_stack is harmless here and avoids
> the problem completely.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have not come to a conclusion on how exactly clang fails to do this
> right, but can provide the .config and/or preprocessed source files
> and command line if we think this should be fixed in clang.

I think this might be related to the issue I reported to upstream LLVM,
as a regression within the past couple of weeks:

https://github.com/llvm/llvm-project/issues/111903

If this is a reasonable workaround, it might be worth doing but I will
probably wait until after the LLVM Developers Meeting next week to ping
the thread to have a better chance of visibility. If we want to work
around this in the kernel, we should Cc stable, as this warning is
present there too.

> ---
>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index eea709d93820..47c302745c1d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
>  	return ret;
>  }
>  
> -static
> +/* clang stack usage explodes if this is inlined */
> +static noinline_for_stack
>  void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
>  					struct vdec_vp9_slice_frame_counts *counts,
>  					struct v4l2_vp9_frame_symbol_counts *counts_helper)
> -- 
> 2.39.5
> 

