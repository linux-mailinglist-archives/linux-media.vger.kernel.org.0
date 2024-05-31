Return-Path: <linux-media+bounces-12341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8955F8D6228
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 14:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1821628A489
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 12:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31102158862;
	Fri, 31 May 2024 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rGHlnRHI"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C11586D0;
	Fri, 31 May 2024 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717159734; cv=none; b=FJwqliJXH2Kuj56QQxHONBZXLfG1l1zxW+uK5AWy1fx3kY7aG+HJH7PqfjmFwmBmjm94n5ytZbsc1KJX1h70cSGJvs8lMtErcCPpPahT1ilKiTCz9afaHim10TvbED1IuryPnqCPOMN6+wDaSvTAiNDCDzhgCHs7i2gVhWNJ054=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717159734; c=relaxed/simple;
	bh=g/oNMocg76yWK2v8EuxnpMD3Hu9NyCAtBqT+lzQxQlA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pGUf0NuvWX9RVU9jsr6D+I7y9qpufeQbxFp2zdGQTk38mfDC0/NDwlWLbmqGcze0OeNb5myIojBPRl9d+H7j/QbX7kPo9hW65Q9lhIroeVlKdFz66M8bksJBH/L5M74BZnD7zQHHjt0vIpdW1wZy42IatE5NOx3JRC/s1LtCCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=rGHlnRHI; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717159731;
	bh=g/oNMocg76yWK2v8EuxnpMD3Hu9NyCAtBqT+lzQxQlA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=rGHlnRHINbWHvFCUvanARjCe5GzAiK3y7LSzS3ZnXZUq3C1mEv27RDBUUFTmTotxv
	 WUZNuT1bwk84c3l52Yf9R3waTkPV/7DcrRgPpphQ2ltY8MFcfoSNzKTpSpbHNX2x4j
	 CC0VuXglIiSJwBfj/Mp1EnY8LNg72VUXgZUsqKBqJ+6+On29KjWPPFi2Y1FfNeK6+w
	 Lg9c/T9/KXdGd4qV+3hD52hSRFzkXsSFI49NTiqD4rVd/WK+rR5m2qS013fOzq3Mc0
	 ERmdS4JE0JJyuA9sSR3MWtNFf8U0ak7JIBhlrQZJVMRYy+xWIlL2JjRmKz2HZI3Exy
	 Z4GvZQPqsMB7Q==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1A800378148F;
	Fri, 31 May 2024 12:48:49 +0000 (UTC)
Message-ID: <d11d92e48321e8c1a429a878917e7c6a6211ea4b.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: AV1: Correct some registers fields
 size or position
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org, 
	heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Fri, 31 May 2024 08:48:44 -0400
In-Reply-To: <20240521152603.120723-1-benjamin.gaignard@collabora.com>
References: <20240521152603.120723-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 21 mai 2024 =C3=A0 17:26 +0200, Benjamin Gaignard a =C3=A9crit=C2=
=A0:
> Some fields aren't well positionned or with incorrect size inside the
> hardware registers. Fix them.
>=20
> That doesn't impact Fluster score test.

Does it impact any known streams though ? (just for a sake of documentation=
, not
really a problem with your change).

>=20
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/verisilicon/rockchip_vpu981_regs.h  | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h b/=
drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
> index 182e6c830ff6..990f8e69524a 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
> @@ -327,7 +327,7 @@
> =20
>  #define av1_apf_threshold		AV1_DEC_REG(55, 0, 0xffff)
>  #define av1_apf_single_pu_mode		AV1_DEC_REG(55, 30, 0x1)
> -#define av1_apf_disable			AV1_DEC_REG(55, 30, 0x1)
> +#define av1_apf_disable			AV1_DEC_REG(55, 31, 0x1)
> =20
>  #define av1_dec_max_burst		AV1_DEC_REG(58, 0, 0xff)
>  #define av1_dec_buswidth		AV1_DEC_REG(58, 8, 0x7)
> @@ -337,10 +337,10 @@
>  #define av1_dec_mc_polltime		AV1_DEC_REG(58, 17, 0x3ff)
>  #define av1_dec_mc_pollmode		AV1_DEC_REG(58,	27, 0x3)
> =20
> -#define av1_filt_ref_adj_3		AV1_DEC_REG(59, 0, 0x3f)
> -#define av1_filt_ref_adj_2		AV1_DEC_REG(59, 7, 0x3f)
> -#define av1_filt_ref_adj_1		AV1_DEC_REG(59, 14, 0x3f)
> -#define av1_filt_ref_adj_0		AV1_DEC_REG(59, 21, 0x3f)
> +#define av1_filt_ref_adj_3		AV1_DEC_REG(59, 0, 0x7f)
> +#define av1_filt_ref_adj_2		AV1_DEC_REG(59, 7, 0x7f)
> +#define av1_filt_ref_adj_1		AV1_DEC_REG(59, 14, 0x7f)
> +#define av1_filt_ref_adj_0		AV1_DEC_REG(59, 21, 0x7f)
>  #define av1_ref0_sign_bias		AV1_DEC_REG(59, 28, 0x1)
>  #define av1_ref1_sign_bias		AV1_DEC_REG(59, 29, 0x1)
>  #define av1_ref2_sign_bias		AV1_DEC_REG(59, 30, 0x1)


