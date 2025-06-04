Return-Path: <linux-media+bounces-34035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228FDACD845
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 09:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 683657A383E
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 07:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFD023D28F;
	Wed,  4 Jun 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="I9Acfkju"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71101F4CB3;
	Wed,  4 Jun 2025 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749020985; cv=none; b=bB4GZbGNT0wu0hZJDc/4o50EUEyMy3QHWuW+5sWl8hipfSHuCpJxJ4yWXzNQa8jfcmpGll2GA0NfD/TL9Iz5ZKC52BIRJnWUX1yDm0pFEYJyNhCFYlyZQNfzqqbr7QYiU5TrN9qSoj86AZjF+ix3H8lqWf6De5wOLZcvC3DNnuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749020985; c=relaxed/simple;
	bh=7uDWG4rA8WTlDhGb+aYjPw74mKqr1db/jxjr+dQWTfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHJnbulwoUAW9c/CSuaqudvczz3e73qLxF2WyeQ7oKJiZM4+GPMPBP7g7FVfQzntJlNztUrUtKUD7R/AFVxLV90m2ul7pMNfFtdQnglwKWlwW/3dq0wWJASDiCH8EEwd9B5nHBIrM3/I+jTaJFPBtMjvI//X28BHCKOyzErtlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=I9Acfkju; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bBzGg1vDYzfNQ;
	Wed,  4 Jun 2025 07:09:31 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bBzGf53sVz2xL4;
	Wed,  4 Jun 2025 07:09:30 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=I9Acfkju;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1749020971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rVjGqA9V1/zjA+v/QKtVl39Pr2Mjw6xdVmC7444t2RY=;
	b=I9AcfkjuTdIGPm7Uh2INzVPinOjeuGGM/jYfbGWZ9dqYIFeS/3HuGSGFy3GU0wBNExTljl
	wpbslOU/JyHolPCL72BEFx+cEFtNhGwlUn4HWgptJkKjuUyF3IqPFRQOmxFIqd+okEpv31
	d1qU1lxjInGJxIXhiC322B3Q7MCixePpem0m9AMMsXLDv01P2X72hJqyHgUk86Z6xuzLwS
	SuVNsABdlzOaaKl91Y2w0n9oHqZ9IZF7UQD90LtBn+20C+uDOOHJLHQe4Evq3n7hxPdlLy
	ot+yPCPtj1JPKQJ85uxGYNxvdStWWrW81s8s+S2rmlbpqEBs8B6sr+qBzZvPUw==
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=683ff12b a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=3WJfbomfAAAA:8 a=xq3W2uTSAAAA:8 a=8nOKJSPbo8tPU-Y5OJIA:9 a=QEXdDO2ut3YA:10 a=1cNuO-ABBywtgFSQhe9S:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-CM-Envelope: MS4xfL2XF/JoajUOwiEWlf56vun8U+jjUQz+ySUWbCEJwkVMhzsC1OAb/b0to+wQZH/5MFvVD1Zo+R2/MnsXcKiNp9ioaxpiNCXd886s6AJ2mLQhd//fiWzd gUOwxlzUjL1A8j0V73DGoMmzvWHyQ4+ZqyQA47Wt8y+SrrS4rjsPG9bPw6oD9QnS4DFFPQt2JvvlYPNmQ+X4tILZEwsPl3bul/wVXAy102x1GWKuC0aciiev ce6BynyUv2oil43XzuXPbPX5oOTclMNRwXckZ3vPFrfPJyc1rv1SdFdVT8MqNZEH
Message-ID: <bb65cb39-eba4-4e0f-a83c-285ab6bae753@jjverkuil.nl>
Date: Wed, 4 Jun 2025 09:09:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: v4l2-tpg: Remove unused tpg_fillbuffer
To: linux@treblig.org, mchehab@kernel.org, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250603225121.308402-1-linux@treblig.org>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250603225121.308402-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 04/06/2025 00:51, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The last use of tpg_fillbuffer() was removed in 2015 by
> commit ddcaee9dd4c0 ("[media] vivid: add support for single buffer planar
> formats")
> 
> Remove it.

Ah, this can't be removed.

This tpg code is actually also used in git://linuxtv.org/v4l-utils.git which
copies the code from the kernel source. And there this function is in use.

This function is really a helper function. I think the best approach is to move
this out of v4l2-tpg-core.c and into v4l2-tpg.h as a static inline.

That way it doesn't add to the kernel code size, but is still available when needed.

Perhaps add a comment in front of this function noting that it is used in v4l-utils.

Regards,

	Hans

> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 17 -----------------
>  include/media/tpg/v4l2-tpg.h                  |  2 --
>  2 files changed, 19 deletions(-)
> 
> diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> index 931e5dc453b9..d51d8ba99dcb 100644
> --- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> +++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> @@ -2710,23 +2710,6 @@ void tpg_fill_plane_buffer(struct tpg_data *tpg, v4l2_std_id std,
>  }
>  EXPORT_SYMBOL_GPL(tpg_fill_plane_buffer);
>  
> -void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std, unsigned p, u8 *vbuf)
> -{
> -	unsigned offset = 0;
> -	unsigned i;
> -
> -	if (tpg->buffers > 1) {
> -		tpg_fill_plane_buffer(tpg, std, p, vbuf);
> -		return;
> -	}
> -
> -	for (i = 0; i < tpg_g_planes(tpg); i++) {
> -		tpg_fill_plane_buffer(tpg, std, i, vbuf + offset);
> -		offset += tpg_calc_plane_size(tpg, i);
> -	}
> -}
> -EXPORT_SYMBOL_GPL(tpg_fillbuffer);
> -
>  MODULE_DESCRIPTION("V4L2 Test Pattern Generator");
>  MODULE_AUTHOR("Hans Verkuil");
>  MODULE_LICENSE("GPL");
> diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
> index a55088921d1d..3e3bd0889b6d 100644
> --- a/include/media/tpg/v4l2-tpg.h
> +++ b/include/media/tpg/v4l2-tpg.h
> @@ -248,8 +248,6 @@ void tpg_calc_text_basep(struct tpg_data *tpg,
>  unsigned tpg_g_interleaved_plane(const struct tpg_data *tpg, unsigned buf_line);
>  void tpg_fill_plane_buffer(struct tpg_data *tpg, v4l2_std_id std,
>  			   unsigned p, u8 *vbuf);
> -void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std,
> -		    unsigned p, u8 *vbuf);
>  bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc);
>  void tpg_s_crop_compose(struct tpg_data *tpg, const struct v4l2_rect *crop,
>  		const struct v4l2_rect *compose);


