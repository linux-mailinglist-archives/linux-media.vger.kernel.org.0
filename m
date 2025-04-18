Return-Path: <linux-media+bounces-30556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D516A939B4
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 17:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09DC21B66636
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 15:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8BB212B3E;
	Fri, 18 Apr 2025 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xH+/z9Gs"
X-Original-To: linux-media@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A54F9EC
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990618; cv=none; b=AlqeZG4iSoOEun5N+wN9lZMux2gahOd4bfoWjCDGSb5ncljdMBRyJuT/RW3ph+sav8NjVqIII61aIMkWeZSkSoFn+pa8vqt9UoETEYIAJgctrpFkDJrYBgxot4eZ/hIOpcul0bsyBMrybEDwrUWdg6DiY/O1AmYQ1JRcDovBbDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990618; c=relaxed/simple;
	bh=C5fq7l2Ahsb27LgEO4/lHCMuhJMXpnJ8WZoqeYkZ6ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9uFII4m+fwY2VcxLp2cl11bgsz4Wb+DIXfvXQZeKZaLXNQSehG3Ky6QRrxC1fopbtrSc3FdwPTtMeDZHwZrexQsvuearWmzAQLpy5f+Kxl0Hvvd50oVMXeMqIRvo73Rjtmdk/waTAx8kpj+1h/zNr0Lmc2hUrn+V1PBlDlHgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xH+/z9Gs; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 18 Apr 2025 21:05:53 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744990605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6wrOfCKY3zK3SNy182P4/7XcrrLA8TgpWNc3DXhpeIc=;
	b=xH+/z9GsJZEtYeFxQtwc/KttJRMlMezXrO8YZel9QR5V1rmv6P8jisb5twwnwlzBfl/zpY
	iWYTbBg45EN7xMq5hfdxG1geMyRIcXyOc6wlAlw/N5iiM/6+/OMwoaXCf0k2Gdir5XB9Xs
	nulXxfdQUhW4YM4oOpnv6HGHSJjSeds=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, 
	r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH v6 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
Message-ID: <see7ve2j7hxqt7c4vqlowprsptjjl5dpfuaagqzj6uk73mhzcu@lhl7qvtwjd2q>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250416121938.346435-1-y-abhilashchandra@ti.com>
 <20250416121938.346435-3-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vgb7ndcpx6r2z555"
Content-Disposition: inline
In-Reply-To: <20250416121938.346435-3-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--vgb7ndcpx6r2z555
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
MIME-Version: 1.0

Hi Abhilash,

Thanks for the patch.

On Wed, Apr 16, 2025 at 05:49:38PM +0530, Yemike Abhilash Chandra wrote:
> Enable the csi2rx_err_irq interrupt to record any errors during streaming
> and also add support for VIDIOC_LOG_STATUS ioctl. This allows users to
> retrieve detailed error information during streaming, including FIFO
> overflow, packet errors, and ECC errors.
>=20
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Tested-by: Jai Luthra <jai.luthra@linux.dev>

> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 131 +++++++++++++++++++
>  1 file changed, 131 insertions(+)
>=20
[snip]

--
Jai

--vgb7ndcpx6r2z555
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmgCcVkACgkQQ96R+SSa
cUWBsRAA0slrHvDhdrNsjQEhqpC5jjgl3FD2acCj5VLsgpp9wIq+AXSt8ZxFYdgb
W+UhPJVoI+tVt2GgdBNhLFuFGdxZXIRv+crzPKh0t8wdgXm7Go7gEHmAA+pa313m
Cxzx2vQtyoRUOrQU3fjvPVDuwjBEmxnfwyyAfxmCpxLpNOc0Khk2VzRTkWmkRy3b
32o7TLq3rrokHbIzLT/wnRICkMAwaZ8QB/2IyTzBziA9TBOh7Md2A2OgZ7K4FzIs
cBFmJskdEmw56TMwKndFjkp1AjkhxnJx3zNJ5H0rki3pVn8M54wNHKjWSz6aBUQ2
EwvjoCD8RLBWz6XbLyAWVyEQmIOI00ZirgenkDonK5Gh4RhGjpBrHiAF7V4lswfr
2sov+efU3n8+fyFW4lgskLvZkoSwUMRQYocGC4L/LtiuiEJUJw28gyAYpghN2CU2
DXOnECSPBNEyvCuaAtGP00My9EVLQthL2fbeWcd3+rKrEVbi4gXthMQCJUJemL8n
IhUvmeGk2hR/wMjzKPDI6K9XZSuH2gC6PQvvhebbYEn1ALETkL1e8Dd9a+9kcUX3
uDEeef4R5ZS+OxgANGIyYiGndLdm5Ds0edsCIYOvV50LkAoCQyghIocWCz/kKZMt
X4rhiMuAMSTTZ3GLLQqAii4Is74zUv4+DQYi9OBgLJu5b5YDx2k=
=xyFP
-----END PGP SIGNATURE-----

--vgb7ndcpx6r2z555--

