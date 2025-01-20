Return-Path: <linux-media+bounces-25002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441CA1732D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 20:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB8518804B6
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 19:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21161EE7B6;
	Mon, 20 Jan 2025 19:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="sWmHZRCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7F1E0E0A
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737401977; cv=none; b=WZq+YKoKrUF6J3Y/P6oJQ0cp11E7hLocZlxAvOAP3Ij4U5ZBicbdOa/Ju99rtDaMLQB23ctPZougymVyqcRovsCW8eZEXG4EZSpVm+HA2O8Jfe1XqotwqIeAtjNDITPaR+BI5IkF+qggI7WI8k6t1h0fqmej0xiOnqFOYRFjwqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737401977; c=relaxed/simple;
	bh=9ouoCpI13ZtTm6znDZT2r93l7f9CGLJs+vXYU/3rDPc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FYatcsD/ziCiHv5zE7/+Z0PDh7phOHmsyfmW0pxvH7Vz7Rhd6cmcWF6VttpgDwNYhgzxaqts3bajrCkxAGMt2geuOq2y9RvcQez46EM48zCu2Iff77hMXecHX8hMjBfpT6GBqunHVoa24+awTRm4d8sQFjRu4PG73nVB23vdI8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=sWmHZRCQ; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1737401971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UY4ocYuTApoBERvgYe3e2ISqtrqDwEARpHTsrL3mCww=;
	b=sWmHZRCQNnP6ophX7SoNxGeRmbDaPklEo2jH4A0szM6vj8uuHRvWbavjoF5iNFXgdhwB2H
	SDHZCrEr0jieSf7W12Yr2x1VjcRW/Klf928LYF1m18Qckc2Ionx7qK0YhSuoqpQ0iwSdA4
	IPxgrMtJLmwGW6ABmal4Gh9L/Aj1LDA81Vk51wItK/XKgWJAZ0d4rXATBVMc6vdBy0mNrL
	HkomL9LE7RAlGjL0kIxGAHRSa86YmcebFgwh2OfqXm8/mpUyZY6xzEsWzfz/b/8JJFkip0
	qlFFjTyADEyjikf/0VnH9IUM2A3T1Ia/rjCwNI1wijB5t1dD0F5gRnEGkkjeHQ==
Content-Type: multipart/signed;
 boundary=d700cadfe156f6574b4a38b3a3a536ccf8ed3afe0fc3c29486f0e25fd36c;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 20 Jan 2025 20:39:12 +0100
Message-Id: <D775LAB5KL3Y.1NF80DZVT3G35@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>,
 <nicolas.dufresne@collabora.com>, <p.zabel@pengutronix.de>,
 <mchehab@kernel.org>
Cc: <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] media: verisilicon: HEVC: Initialize start_bit field
References: <20250120153555.404806-1-benjamin.gaignard@collabora.com>
In-Reply-To: <20250120153555.404806-1-benjamin.gaignard@collabora.com>
X-Migadu-Flow: FLOW_OUT

--d700cadfe156f6574b4a38b3a3a536ccf8ed3afe0fc3c29486f0e25fd36c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jan 20, 2025 at 4:35 PM CET, Benjamin Gaignard wrote:
> Always set start_bit field to 0, if not it could lead to corrupted frames
> specially when decoding VP9 bitstreams at the same time since VP9 driver
> set it for its own purpose.
>
> Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/dr=
ivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index 85a44143b378..0e212198dd65 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -518,6 +518,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>  	hantro_reg_write(vpu, &g2_stream_len, src_len);
>  	hantro_reg_write(vpu, &g2_strm_buffer_len, src_buf_len);
>  	hantro_reg_write(vpu, &g2_strm_start_offset, 0);
> +	hantro_reg_write(vpu, &g2_start_bit, 0);
>  	hantro_reg_write(vpu, &g2_write_mvs_e, 1);
> =20
>  	hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma=
);


--d700cadfe156f6574b4a38b3a3a536ccf8ed3afe0fc3c29486f0e25fd36c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ46mYgAKCRDXblvOeH7b
bs2tAP0fZkLc7mvSidMGiAaaA+5EBs0onm69lzzFZVeLHYxQ3gEA30jFXRcMYMqh
frvuJrLqjpwPdoy95tQxEKUf/CFlRQc=
=p/Bh
-----END PGP SIGNATURE-----

--d700cadfe156f6574b4a38b3a3a536ccf8ed3afe0fc3c29486f0e25fd36c--

