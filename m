Return-Path: <linux-media+bounces-26082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA2BA32F6B
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347013A8065
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 19:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDC226214C;
	Wed, 12 Feb 2025 19:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIPIFIIb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C52D1D5CCC;
	Wed, 12 Feb 2025 19:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387780; cv=none; b=Gqqk2zFk4bEHj9VY1qCb2HsCD3SFXPmUa5OeY+C4IZIP9cvn5jVHCWYjnK4IkhD5AxLzD6nvmEHFbEO41FJS0Ko8EJk6yPadK7vm2E7oKFcZrfLrsTloVQLiSv+V8oUv841gUmfDPIAI5w11UrQWVlUq6Nsax4glf1oaKhA+3Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387780; c=relaxed/simple;
	bh=d72x5t43kyGwC1V2Wsdsidn9uz12Ug48Aifli3l6Qxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKUyDlL/VDsLEZDvuGFqEYSH9QAl01UFUuDIIXOF1w5BAfkdkMAHwcjYRUkxDYOd1F8IuMerlAFkP+nXxsrBJm8Txw1zamye49hSsQVrUUdaDLvGGZE/g60zGkeMBgEAFE0P7vIAo66yL7XJdT3TDoDnuCWzAN2bfAxGNbDoq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIPIFIIb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06493C4CEDF;
	Wed, 12 Feb 2025 19:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739387778;
	bh=d72x5t43kyGwC1V2Wsdsidn9uz12Ug48Aifli3l6Qxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIPIFIIbVkKlWLP+8mLwq7y1l/w0B6se6jkLxWPjx2HFlu1aiZDDQAqIq2v9mjZBP
	 o2qSUoRaQ6XE1YAizF/hcS0KroCwJiC6gZ/et/MBB2FAldpdOwrr05H3ZzS1J9x5r4
	 Wu6v8rB0Xj2Dm62T1oscLn563vPKxzC6qKsapP+XY4hRAqHbNgnYqbIxGoy9B2CEyP
	 0+qF8Aj05MvOsyUIoMnjTw+HWNZHyfDs2yuh8AW+H1WBdm9hhRoxbaRXOoeAprDDwN
	 o5aebRYJ0AUDUOexkA+gqgOveeA9a2GCkNbKWBOX3CU84FobN+KFsmwICDk3s3xuO2
	 nyi5PQBz4zpCA==
Date: Wed, 12 Feb 2025 19:16:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org,
	jai.luthra@linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com,
	r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [RFC PATCH 0/3] Enable support for error detection in CSI2RX
Message-ID: <20250212-caramel-darkish-6b1bbd8f562e@spud>
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2CwtJVhBdX9uSQRj"
Content-Disposition: inline
In-Reply-To: <20250212131244.1397722-1-y-abhilashchandra@ti.com>


--2CwtJVhBdX9uSQRj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 06:42:41PM +0530, Yemike Abhilash Chandra wrote:
> This patch series enables the csi2rx_err_irq interrupt to record any erro=
rs
> that occur during streaming. It also adds support for the VIDIOC_LOG_STAT=
US
> ioctl, which outputs the current device status to the kernel log.
>=20
> The IRQ handler records any errors encountered during streaming.
> Additionally, VIDIOC_LOG_STATUS can be invoked from user space to retrieve
> the latest status.
>=20
> Logs with interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandr=
a/58ced4df0158efad6f453b4d96463723
> Logs without interrupt in DT: https://gist.github.com/Yemike-Abhilash-Cha=
ndra/d807230b2a624b7a38effed89efdd148

What is actually RFC about this patchset, rather than just being v1?

--2CwtJVhBdX9uSQRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6zzfQAKCRB4tDGHoIJi
0uTPAQDBXoqWdXhNQGZtmPI4uD4hJ5UUgFn1vvy075JW0KwtQQD/RNg6iQqRyxgJ
se2uqjGP5WWwZ5j9JthZCkIZmhWydw8=
=YJGR
-----END PGP SIGNATURE-----

--2CwtJVhBdX9uSQRj--

