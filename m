Return-Path: <linux-media+bounces-28112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208CA5ECB2
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 08:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6337B188BD84
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 07:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEECE1FC0FF;
	Thu, 13 Mar 2025 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rvKednmx"
X-Original-To: linux-media@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C411FC0EE
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850302; cv=none; b=PcOgerB1kAW/rWlHdr72uYt6n3ws4ebkKYRYHhbGl7bZ4Ypc4fq8MdH3YM0P5hL8KNCt7KllvDk/NeFJEfKMrOJ3gNYYDgCBBhpbNS7TaYPXrZOlBEV+ytWDsmzhczcUT1c+c/QByb+w3Li6LlPX8AeUxDkuSCKrZ6oFeGH9L3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850302; c=relaxed/simple;
	bh=/+jpPpSGX0Sf//ENsPu4llyBfi3/h0mUS8D5LVpDdSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLvBWsT+oET93ap/7fPiyrg0nUKe7UTbfRBZuEhS3XcYf6Fy5sQryup9yK9DeT2ujAkb1SJK0KrTQ0yoN4gjbDmHUQlpx2dvTg/Jiiuly03MthwHhITdkPZvkd+Uqpp9MOB5eTSXtvGA+uOog9C4qIbBEzLN3eX8v9lj10WaPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rvKednmx; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 13 Mar 2025 12:47:56 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741850286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hST4ycqRSNya1re+EE3IvtjNSlDNjjwEUlIKChXm/rE=;
	b=rvKednmx7sXxQ1RJrUviX5oJ/g3cOFcj/SndPHr63Gst5wfUrTOlcA7wBredbOaEpKAoqP
	YOOKbb3OZWqWtr/Y+ajamkxgvlya7eTQixbuxEfnSSi/tmrV42Uz1WpuyBhewGqRqPSJLK
	hNlWnqEdA7QXDAjiQwFzgT7G0+n7vZM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, s-jain1@ti.com, r-donadkar@ti.com, vigneshr@ti.com, 
	praneeth@ti.com, tomi.valkeinen@ideasonboard.com, y-abhilashchandra@ti.com
Subject: Re: [PATCH] media: ti: j721e-csi2rx: Allow passing cache hints from
 user-space
Message-ID: <sxmxk4f3o3rmbkzsy7opkcfqyqqeefebnlvje44qfjhocshwwr@vsiq4px6yxiy>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250312112140.449765-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mpt5tt5jomo6knm5"
Content-Disposition: inline
In-Reply-To: <20250312112140.449765-1-devarsht@ti.com>
X-Migadu-Flow: FLOW_OUT


--mpt5tt5jomo6knm5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: ti: j721e-csi2rx: Allow passing cache hints from
 user-space
MIME-Version: 1.0

Hi Devarsh,

Thanks for the patch.

On Wed, Mar 12, 2025 at 04:51:40PM +0530, Devarsh Thakkar wrote:
> User-space can provide cache hints to enable software managed cache=20
> operations or skip certain cache operations using memory flags and buffer=
=20
> flags. This is useful for SoCs such as AM62px which do not support hardwa=
re=20
> cache coherency.
>=20
> This is tested on AM62px with yavta capture by passing=20
> V4L2_MEMORY_FLAG_NON_COHERENT while using VIDIOC_REQBUFS and=20
> V4L2_BUF_FLAG_NO_CACHE_CLEAN while using VIDIOC_QBUF and ~5x reduction in=
=20
> memcpy time is seen for copying captured frame to DDR as shared here [1].
>=20
> [1]:
> Link: https://e2e.ti.com/support/processors-group/processors/f/processors=
-forum/1452545/am62p-the-ads6311-radar-camera-has-lost-frame-capture/558047=
2#5580472


nit: might be cleaner to drop the "[1]" reference as a single Link tag is=
=20
pretty unambiguous.

But in any case,

Acked-by: Jai Luthra <jai.luthra@linux.dev>

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6412a00be8ea..284d33b2a0ec 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -895,6 +895,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *=
csi)
>  	q->dev =3D dmaengine_get_dma_device(csi->dma.chan);
>  	q->lock =3D &csi->mutex;
>  	q->min_queued_buffers =3D 1;
> +	q->allow_cache_hints =3D 1;
> =20
>  	ret =3D vb2_queue_init(q);
>  	if (ret)
> --=20
> 2.39.1
>=20

--mpt5tt5jomo6knm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmfShqQACgkQQ96R+SSa
cUVhDhAAs203c7NIEbqg83LKsVIfRWHGyF7SH+Gx92gjLyMVH4k1VFgSYnUtN6Wu
cx7Xj1gpYa0V6FIs9DgEmE5CFAkBEp8zwCwltUluRBohK+S37NTjgmaEjFJejhXR
2M/S3v3TqAhLSwnkTj+dUBNlYsWJAYdEbxN29y7Ja6yYOr8Fju52iBQdLLcEB5It
KDH043eL4TE7a83SWyHAx3GIZ6y4UI2FQKwDkw8iVwXFjIBHrj6j/HEHAQgL1tmH
SsF+6Wi+eZ1LwZYap/Mq7CFPpVDce182OTOPSLb4KsXZID5NZp+BkJWzVLpA1225
aXrcbNt57KWtcPpr2H2f5OqO6o4y0sF3X412x5w9/667XH183ctJrLvBQVQ/8fZI
Blzmuzo6aue4GpfgJaOusjSo1b0mT5EhWx5/vjZfoKlkCJ8ap5Fkdrrd1GbvzaCB
RZ0aPHASYZVo96AZlDwK1ABommAY6xhmtaIx/ZKDWWYuMtN7fGI3BG0cmHMP/SII
xSMGWsNvb35/cL32AKNY+sntZR9jMm7+/Dgo1kgQiY1/0vx4DK0wcEmO7zeObw4b
Rl4Sxa3/rojeDvYOkD1e7Y05UvfqOYaG5Z7gWzYjSR6VE2Dy90vgHVo0j7uUFvsc
ONCInnT9fnT0l25UDHuR0RLBtpYjbNdF4VT8QzsrmxN+3tpOJ9k=
=TlV7
-----END PGP SIGNATURE-----

--mpt5tt5jomo6knm5--

