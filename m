Return-Path: <linux-media+bounces-25003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F7A17338
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 20:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D40A164168
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 19:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A100C1EF0AA;
	Mon, 20 Jan 2025 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Nv2DeSGi"
X-Original-To: linux-media@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303D91EF0BD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 19:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737402244; cv=none; b=Q6BiGhhWGLBrhSwBvAFTqZKIl/eNFgvFCLgMGAfTPZ9tvuSwucmgx5xk/ihLEA2Jjk5s332UDhF0UIIR3Rgh21sr+mZQGyCPfGRlAFi2fquZcgJKMY7Vv1Ae4DI4OKtiTqq8BCRmz/pdMyYXehHQHBWqp+NSHcBnXUMTJpXMR6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737402244; c=relaxed/simple;
	bh=z7P+J0mI/+oPm1CcA8nyV1W2/nZnyL2Ug4ktxwTF8kw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=sHZRAW5q2GQwvCZV+2lBoc44H8K7qHN2kzgjMtLUjTixDK9DeIBWyjlnjVW4X2MM5iFGjtIgdfTuHMTYb27arvY5EEw6EWw578HG+ZvwOnvbFsbYH1aJKc5cn2cEAu6kFk3miNTeTeOJvhBARBViQjers1xv9h56yaOHW78vS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Nv2DeSGi; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1737402240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5RLve09pHXyDwibCb60WvsnrRpSp359iWUXBWVIy1PI=;
	b=Nv2DeSGiFIx4Z309t7HF/4zhQcgnLOsu0UfBrFN7wJt/JIoTB4p/3oDnyt5TeQzECeyuel
	bgJUCWLa6ljUwXaw1Lf3O7znvOcsPTZ3uRU0XWOx5ez/NyxD+0UPENKbR3xszzfc6nWdhx
	fLAktCxX4d2wzE/ZaHdTxrgiVn4lRKOWDb5EwEzsB/4xf+6hgDXsOjrALmYwehSciTdGln
	t5jfzOUqfNeuoQpRLx0YLsu4GtE5faDd2zRIZNmQCCvl3HA8YxteRXLChw4AH7TAWJhPhO
	K9Kv2TAa72/ISOjYMcRFSW+J6xJQ411uzxLnXXt7zbA2GrSXGLXh3WYPJn3eyA==
Content-Type: multipart/signed;
 boundary=ca11871e295c846aed4751d9c823cec546d395094f287aeab8421f6af7ef;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 20 Jan 2025 20:43:49 +0100
Message-Id: <D775OTRW5PI5.331IHP40POB5Z@cknow.org>
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

--ca11871e295c846aed4751d9c823cec546d395094f287aeab8421f6af7ef
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

In the mail that contained the Tested-by tag there was also a
Reviewed-by tag (from Nicolas) further down below.

(sorry about the other mail; sth went wrong)
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


--ca11871e295c846aed4751d9c823cec546d395094f287aeab8421f6af7ef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ46neAAKCRDXblvOeH7b
bpKnAQC5dzfDBEJ+T/sVxmb4LBfT8d37/MjDvpBq72uvBqaJ5gEAtnbofxNYAnzJ
Dej14FaOWZ/N+ZrZgFmVhoR6q/3G+wo=
=RCze
-----END PGP SIGNATURE-----

--ca11871e295c846aed4751d9c823cec546d395094f287aeab8421f6af7ef--

