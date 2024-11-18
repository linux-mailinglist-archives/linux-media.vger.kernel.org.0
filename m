Return-Path: <linux-media+bounces-21555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA49D196D
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 21:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758CA281D15
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 20:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2BD1E5715;
	Mon, 18 Nov 2024 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8xchKHW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC014D2B7;
	Mon, 18 Nov 2024 20:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731960405; cv=none; b=rfxAnLM+u8VnptPTRX4pZ5DbxgZ0OuEpNqruIfZDzFZ3qhlPd8yjQrWI4RbwlVKk+aSZuDa6lnK9BsjM7GntuTLxRF7hQXWFe8Z8zC+ZJdtituNh8oRKh4xSBRhNx5doibEW0SLQUFSho/Cu9qtDOW1t9+v1Gd8S+lx49YffXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731960405; c=relaxed/simple;
	bh=BZLFINsMS8pPfEa2wS5Xd+1akLeYv9BQloWJ6y92+qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5XqRF/WMIW7X3o7EDEaSoV23rngDKADIi6WOSIdBKPy/3KyUKe1CENZGxgYYyp0ZJXII4mbXPlCZT+KoohMSqLPipV1YSy+890I/rMnOcm3+0CK/epi6ZW6bmBxO38El8bHu8Jznd8l1dnpCZM+FZgbqbNGUfdaaUOb0HUtuVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p8xchKHW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E787C4CECC;
	Mon, 18 Nov 2024 20:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731960404;
	bh=BZLFINsMS8pPfEa2wS5Xd+1akLeYv9BQloWJ6y92+qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8xchKHWTiB7DLpXpMZ/rokpIHqbjnduyfTKuCNXQEAf8AeSOLePjc+Vz+G2TUAL4
	 bpBKb6XqAuQNCqFX71br72A+J0DklZhUq/degpMQJQGgb2vb8XA6KKCowg04xS8aP9
	 9GTvY56pB99209v+dvdbbNjXAb79yBrula6Js7cz390kTxZLT+qxkPy1pYX0HGQq6c
	 0QVFz2Ighd7iypAIMlF7glyswIWxYg32oKez0Dq9SDXou1+K7vLbJeBLnVe1HGSK2L
	 kQArLC61iaOrvMcnTbSZeEkWLfCv6VWoAqoktmiFSkES/ka9EAobpzLoBIWgMGz1Qn
	 quba2HIWN95Sw==
Date: Mon, 18 Nov 2024 13:06:41 -0700
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
Message-ID: <20241118200641.GA768549@thelio-3990X>
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

Unfortunately, I have seen no moment on my upstream report and this
warning is breaking allmodconfig builds because of -Werror. Can this be
applied as a workaround for now (preferrably with a Cc: stable on it)?

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> I have not come to a conclusion on how exactly clang fails to do this
> right, but can provide the .config and/or preprocessed source files
> and command line if we think this should be fixed in clang.
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

