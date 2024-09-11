Return-Path: <linux-media+bounces-18177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED629759D1
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 013E2284487
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A860B1B531E;
	Wed, 11 Sep 2024 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C9pV6sfQ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Dea6c8bw"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-47.smtp-out.eu-west-1.amazonses.com (a7-47.smtp-out.eu-west-1.amazonses.com [54.240.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E834199FB1;
	Wed, 11 Sep 2024 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077516; cv=none; b=W9/xh9N7a7H8OxwPajxFGYYCdaqdqX+NzNZTAh0Mx63Ci2mqIHxmFhm1nvwr1kytIj5m+4xmQOOBArfrGBU5iBzLnQ/wszoIETZOt7J6xx9y3I/M0/W4QiEV/wQSRNd4A9L5qseeEcY4UhzSpEaee6lWxYHhq7jOmZPU0riXYXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077516; c=relaxed/simple;
	bh=Ff7iKYGlVbSF6DaBm7NIGdh6zqbmjk/yg4IdTPwheH4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ytuz1GzhvxFUuNLlnEOtwgwvSRdSEENB0SQljFLMjF3QQStR9D2GyOJIYalxHBw8vU2RZX8XXjHGHkYU55EUlTgGgR4ip0uOy+Y2142FOlAeUg2jkF8xW4E9Cwu0BtcCWJuMigvEUmUbhwhHQ/XAphdGgjhCO4JBlAOEbyV52/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C9pV6sfQ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Dea6c8bw; arc=none smtp.client-ip=54.240.7.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726077512;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=Ff7iKYGlVbSF6DaBm7NIGdh6zqbmjk/yg4IdTPwheH4=;
	b=C9pV6sfQVXSGatsOQqSuHHwpjU0dTUvKvV+FxPj/M7VSmvIpmSwYLjTGu8K4UyYk
	zzsaesoy7vV8ZUKoJ2HQv6NLqiKT6EHdOKNcdpkl2cZ8NYknDicb8GCyERkgTcCLjXi
	8VBAfwAQHXwT2kvNH0dkIVbEwBr2HPP5M3HOv8DllDXf/Opwh8X/ZOvlaxjzQUdfQ7+
	Ld66pbRPvHqVpH1/nnTMewbHNFyBhwMkf6b5DIsU8KkQi/UE6sKf47T7Ptdpq6MkaEJ
	50tXsU9lE3+tNga34Whl9gWC1Cj/Y7ZctqS6PhL5kbZtIt/bxa7aczkhbqrkNUFOEyr
	3Jyjnw6YkA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726077512;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=Ff7iKYGlVbSF6DaBm7NIGdh6zqbmjk/yg4IdTPwheH4=;
	b=Dea6c8bwybcfPEkvDfnN8zkAeoxP8bVAbVlGPXoD4oEt0HJXnwznYzbZIKWkTh/h
	rGEpZhd8TA9agWOX7RhALKQEzqOa+u48NW4nbqM4mapYZaloCdhvcqjBu1fP242FMwe
	cLQearfBp8Feug5ABkN/EADr03eBxGSHN6arKXgU=
Message-ID: <01020191e23cab4b-5c86e038-d835-4dca-8dcb-1936066c488e-000000@eu-west-1.amazonses.com>
Subject: Re: [PATCH 2/2] media: verisilicon: add WebP decoding support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Fritz Koenig <frkoenig@chromium.org>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 11 Sep 2024 17:58:32 +0000
In-Reply-To: <20240911135011.161217-3-hugues.fruchet@foss.st.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
	 <20240911135011.161217-3-hugues.fruchet@foss.st.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.47

Hi Hugues,

Le mercredi 11 septembre 2024 à 15:50 +0200, Hugues Fruchet a écrit :
> Add WebP picture decoding support to VP8 stateless decoder.

Unless when its obvious, the commit message should explain what is being
changed.

> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
>  drivers/media/platform/verisilicon/hantro_g1_regs.h    | 1 +
>  drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> index c623b3b0be18..e7d4db788e57 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> @@ -232,6 +232,7 @@
>  #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
>  #define G1_REG_ADDR_STR					0x030
>  #define G1_REG_ADDR_DST					0x034
> +#define G1_REG_ADDR_DST_CHROMA				0x038
>  #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
>  #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
>  #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> index 851eb67f19f5..c6a7584b716a 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> @@ -427,6 +427,11 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>  
>  	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
>  	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> +
> +	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
> +		vdpu_write_relaxed(vpu, dst_dma +
> +				   ctx->dst_fmt.height * ctx->dst_fmt.width,

I'm not really not fan of that type of formula using padded width/height. Not
sure if its supported already, but if we have foreign buffers with a bigger
bytesperline, the IP may endup overwriting the luma. Please use the per-plane
bytesperline, we have v4l2-common to help with that when needed.
> +				   G1_REG_ADDR_DST_CHROMA);

I have a strong impression this patch is incomplete (not generic enough). The
documentation I have indicates that the resolution range for WebP can be
different for different synthesis. See swreg54 (0xd8), if bit 19 is set, then it
can support 16K x 16K resolution. There is no other way around that then
signalling explicitly at the format level that this is webp, since otherwise you
can't know from userspace and can't enumerate the different resolution. I'm
curious what is the difference at bitstream level, would be nice to clarify too.

On GStreamer side, the formats are entirely seperate, image/webp vs video/x-vp8
are the mime types. Seems a lot safe to keep these two as seperate formats. They
can certainly share the same stateless frame structure, with the additional flag
imho.

Nicolas

>  }
>  
>  int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> @@ -471,6 +476,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>  		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
>  	if (hdr->lf.level == 0)
>  		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
> +	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
> +		reg |= G1_REG_DEC_CTRL0_WEBP_E;
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>  
>  	/* Frame dimensions */


