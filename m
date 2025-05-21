Return-Path: <linux-media+bounces-32999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC16ABF16D
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A09E1B67543
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABA025B668;
	Wed, 21 May 2025 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="a7Gn+EEu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CE253946
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822982; cv=none; b=TWghxTE9ucqEMsE7xjYIot1Qc7vWrFnOR5E1PyWatXF2ZP2ac2rnZs7l/eDnyUHF0dJuw7lgzK8upPYZedFVM9zCSq8LNNkJEnSlO91a2d9tZcfk/GteR1ytCc73tU/hdD7/rIDEGqE8EJlZJyKy9NDVGbPortAFlnVMwRy2JrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822982; c=relaxed/simple;
	bh=vMrbMPmnr66D9MoRLd3wHyOxUmuR8XEX65gucSkKivc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otojfxPCaXj888pQn4Ly4pmHNpV8vP0bbfQAslHmcHlb5NLsIRUTXmWIF804GjjYWlzZiPzbCWcRpJbcvBO1BAhjxSnuYwdABSIEVIZaCTvIDsI/uqF3M8nEDp1X0yK0wfAt1otiper3qypvd1/vNWWuq1LXcXxD5TVMHlhsUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=a7Gn+EEu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IiAE
	xulbZyheoKVtSlmVQX3HQ/jEp/zeXoCUKpIHZ2E=; b=a7Gn+EEu/1STHTI4mszW
	gti3C85BEwbaGL7CS6zbwEoiuqKOu3fh17VbDQYVEGEE6Jc1mHbxBx/fqGS3oFG+
	SOOujXbnRcWy33F/YMuzrexsb1h2UwhjH/Gc2oH2mkklAMgjydc9A+hGKN6MAnEi
	VCcV70+R69jpjlSnkKeA1Pi/XxfzhGEjoTYAFxJepII99KxFG4GH/d7/t3GD6fAo
	K4IZe2rcMCVh7vAXmJcJtyrnFRxlDQUOjMdmd+2dURBJVPFdYXs6tB2MFrT1OUu6
	smqt1ct0fCLCEGluitAuCrEzFmJO220FXyBDpSZmsuMMOGtWt1lGDEhAutJ059Yo
	Gg==
Received: (qmail 3220941 invoked from network); 21 May 2025 12:22:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2025 12:22:57 +0200
X-UD-Smtp-Session: l3s3148p1@dH+yv6I1pJtehhrc
Date: Wed, 21 May 2025 12:22:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com,
	lvc-project@linuxtesting.org,
	Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] media: dvb-usb-v2: disallow 0-length I2C reads
Message-ID: <aC2pgdt5IgzCWNMX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com,
	lvc-project@linuxtesting.org,
	Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org
References: <20250520135216.2509505-1-n.zhandarovich@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SlaYVM44ag2fg58z"
Content-Disposition: inline
In-Reply-To: <20250520135216.2509505-1-n.zhandarovich@fintech.ru>


--SlaYVM44ag2fg58z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +static const struct i2c_adapter_quirks i2c_usb_quirks = {
> +	.flags = I2C_AQ_NO_ZERO_LEN_READ,
> +};

Maybe it makes sense to add a comment like

/* would create an invalid usb_control_msg */

?


--SlaYVM44ag2fg58z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgtqX0ACgkQFA3kzBSg
KbYFkA//QtjXiEHB24k7NBXnmE35+1sEdGGUJqw/W7Iaz3QNZnt7saB77mtzREH+
jO7mzm92Pw5cc6cniRBK8FFJNguhexzASi6yKWJEmNKeiLUzEclX2+ZB6XVOBftx
p/8J8m0oezpnbGUmPkVL3hOsa0gLGS+84SzhLGSWITGNSvCumPlCjTUXcje4CZJ3
En+Ugla9BODJ4KiidLDQY1x3q6L5y4j3AHvYmq9L77hAKNWquEGs/MR5ERUMnY1Q
txKoZ5jIsWV/U6f80TsxBozANkHFboZoibMsxYPamkFCdA/P2xOQeDTby7t2s7Ro
E8Bbg4aMiqFISGzVvqXXb1O7MJctlrcE1b8B7xMhTGE/5AocHPGFEM0kNktTuuYX
W9YWrGcQRAWg7mzpQvPLsdFAcjzZ4L7lYfqg+8QX8v4X8Sp0+YVwqBt/+IaqE8dZ
Nidv6TeyjCdJUFwouEcZjsSU7LeZrOKurIlnjuHasF+UEnkOdnRsHvNQliON+3+z
Sby9abOZ4uVFLGpn+4Is8p5yiSNfJfO9VI/GSRzYieajl0kxjlw9p/va78pGz5da
hnlclcxc+o3H169XKy4gomTtwSYl/sgpeer0Xag4X2N3fYsJB104OoltOwLH25rx
u1eXOxdO2UN4ZGaKVKKK5VlVElGeF/AZADs0pxYZx4D+MkeYnXU=
=af27
-----END PGP SIGNATURE-----

--SlaYVM44ag2fg58z--

