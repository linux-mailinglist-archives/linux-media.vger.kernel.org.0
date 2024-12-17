Return-Path: <linux-media+bounces-23635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A59F550A
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFE977A3EEF
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA681F9EC0;
	Tue, 17 Dec 2024 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3ePxkuP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5321F706E;
	Tue, 17 Dec 2024 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457595; cv=none; b=FjQGHGmyqoeX2iYmflFD6q7jH6CHS8hOzpwSWpnuC/2mZWLLYFrz/M6BT+KfA6dBcdBh/C/qj5pPL2etejrEZM5igPvoSX+ym5QNyHRjiuujp+h2BKzpcFbUgMORt2hQ7bVV/H2oIjaKVmWi5wLsx2h4jeGqcz7BArXnLVFMQRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457595; c=relaxed/simple;
	bh=OwGheDgt29vkvS8t2F2IuM3VUVlBDeT9j61i23O0ZJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yb71lVlBbtxDKa7w5X2icBCZ2qEdJ2++RZ6Z9ZfG23kibZGbI9a9Qy5VYz7nJBJRorUqcD3Ra4EGHFLJEK3ycoOQsYrjn3DsAI5ed3/1sK9qKeYXcWDvHPTDPjF1Ix44GxFMCAXi94b3OZuXnNrAlt8kaRbpph5my9Z9GlhRITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3ePxkuP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93A0C4CED3;
	Tue, 17 Dec 2024 17:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734457594;
	bh=OwGheDgt29vkvS8t2F2IuM3VUVlBDeT9j61i23O0ZJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3ePxkuPfo70D9lFnDwMhsaSYEGVGBUJICi+5sqC0oLHaXUqtOBToQbKP6tosj15V
	 +zzrBj9vWgDNqRIbrA5YW5va/cKmoxDs2olkmaBnQ6gNIHfja8tvtIAHePhUWK2nF6
	 xWLWSQgE7i3ktUlqFZH5yJ5HITbjgtP2dSfQNQpcY/c7QfSRMvD/fnurDON5vNIv+t
	 UvO1A3uFDeEXqeBO2oWb5n7ICD/DBbcUvnvt00AK0ekDKkB+YKtr1kcbxm8eztoFql
	 l+8Z/i0hIOzCN8hNio7y4wzf8+j+L/sEBlQigX2X3mT28CvykL+XpOztCb/VaowHi6
	 HZ8DJAocaVrbw==
Date: Tue, 17 Dec 2024 10:46:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241217174628.GA2654633@ax162>
References: <20241018151448.3694052-1-arnd@kernel.org>
 <20241118200641.GA768549@thelio-3990X>
 <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>

Hi Sebastian,

On Tue, Nov 19, 2024 at 12:02:26PM +0100, Sebastian Fricke wrote:
> Hey Nathan,
> 
> On 18.11.2024 13:06, Nathan Chancellor wrote:
> > On Fri, Oct 18, 2024 at 03:14:42PM +0000, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > With KASAN enabled, clang fails to optimize the inline version of
> > > vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
> > > of temporary values spilled to the stack:
> > > 
> > > drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]
> > > 
> > > This seems to affect all versions of clang including the latest (clang-20),
> > > but the degree of stack overhead is different per release.
> > > 
> > > Marking the function as noinline_for_stack is harmless here and avoids
> > > the problem completely.
> > > 
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > Unfortunately, I have seen no moment on my upstream report and this
> > warning is breaking allmodconfig builds because of -Werror. Can this be
> > applied as a workaround for now (preferrably with a Cc: stable on it)?
> > 
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> I'll handle it asap, it will be part of 6.13

Is there any update here? I don't see this patch applied in -next.

Cheers,
Nathan

> > > ---
> > > I have not come to a conclusion on how exactly clang fails to do this
> > > right, but can provide the .config and/or preprocessed source files
> > > and command line if we think this should be fixed in clang.
> > > ---
> > >  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > index eea709d93820..47c302745c1d 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > @@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
> > >  	return ret;
> > >  }
> > > 
> > > -static
> > > +/* clang stack usage explodes if this is inlined */
> > > +static noinline_for_stack
> > >  void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
> > >  					struct vdec_vp9_slice_frame_counts *counts,
> > >  					struct v4l2_vp9_frame_symbol_counts *counts_helper)
> > > --
> > > 2.39.5
> > > 
> > 

