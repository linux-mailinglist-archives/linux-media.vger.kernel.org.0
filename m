Return-Path: <linux-media+bounces-32724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3CDABB2E1
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 03:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E8F018945BC
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 01:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E617F189F3B;
	Mon, 19 May 2025 01:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkUUXxsD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354B4A00;
	Mon, 19 May 2025 01:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747618365; cv=none; b=N1Hph8s2JEdGbTkKuusp/OPg7rLhbLoGP/iqlJT3i1YC0Sn94V5MhG4c4ZA3WFdP5hIw/GqHMXQHN0DO3I4JO14tsk0EA3GkGWM77mQTnWgps3n7Z6QursGZ2zjIEQyhCnFyFW+zghgqdcexNkLIBrwJ3lOOMsrpHpOb5CPqaxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747618365; c=relaxed/simple;
	bh=OCpenyVmzMNspCJ0HhYI8vdrocz2CXAY/lIG/YoiGJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+hRLvt4IX+wz+hLnA/TM1yOAKJH+SmHkVkg0WXbcj/Yfq/PWUy2wIMd2XzKubeKeRs8VmjzSXM0rrwT8zHOBqS1RqFBRp18H5Eoce7roIydyw4b8GxwU8wVn206Oi4W7PY4x5LvbwZDTpsetg06ltMx5UwvUqm6UAyBeohLBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkUUXxsD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30e57a37294so3386801a91.2;
        Sun, 18 May 2025 18:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747618363; x=1748223163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lnqrZDZzf90eu14tYTM06CJVvHruKSKjISbfnuXjTIc=;
        b=fkUUXxsDcc/sVaV2xF87sV27Y0ohDGfGCGjJkMOEphIKlXhGicTdXT76BUtqKJ4o4u
         up2BtuExcs1+V1RQk7CmcCP0IS1lvgsX36S6MI3//L9ovXbWQsVzcE1khmHywkLfwe4H
         H0eQey4cMgGWzcWy4SeZUhxLS/N53o9hAhxNIq3aqa2HG9leIxpKeBOkFCBCIgB3aFDm
         vQ0SD7zKqdbXr+iG5OTHHjPKAZxEAtx0fQq+H/LTm+vkx5q0pIgUpW+4Q+wcJaRrf60A
         UXVeBpXhN0Ijy8slwu99UzLEgLNm/PtBYn+Jyn6YNvpiZwP54ietknVr0CG9DOwNCJiw
         ZosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747618363; x=1748223163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnqrZDZzf90eu14tYTM06CJVvHruKSKjISbfnuXjTIc=;
        b=w5weWyN0AJqR5RLMAHHO7ZnK7LrYxPf7rUuyppZLCV7ajoozeoctqAxVFxgZrz9AlM
         RmewAXZJfYs/XBwTiz8u9XY8vYQAhHaDJoDWYalBGG2ZlUgE+5G3TrSKDIYDkMmAo2b7
         UFY0sr/LZK8bJYAJZlYLMBx+l5fQSsjclcj+asK0OyPMXz7NeoIDLjr94mqQO6cuz3nT
         JmTiQCsk7jpEybMuzvb1rZ8jggP/UhgkM3mO8l10rOM1JgNFJH5XuxU0Os+4hz6sV26d
         yp5/SZ8fXcKyBRc5jACpc+5SiXMEfx1aVgsRr7wOig8dwIqDl2zelDDuYImxHw5t01pk
         aUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzQ4BJjkmb0iPCBFw00vf7N3tjBdDeTieiJfVJ2oKkeV3NchOZIO3l6KtcwWYssaof2nOPK5M7IEmcXsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxehdbEYzLXRbMhNZtywJ7pHCblfMUBrAPY9yl/hjsUs++SfXqI
	oAdwVz/IKJUPwqkZurb6/iR79/OapTQWYXoB1PHcfVzEENbotWCgCDcq
X-Gm-Gg: ASbGncsoovsluKIQmnVZAooj5Y2sEbRezr84WBc84nAOoLHNysIe+SQgDc3PXjdSCOQ
	0DOVJGB25gmViZZ/H6DCElosXiD+dzhFYzAZ7u8RKK8NKmVRObtOaCpq/QNNRJZFImqUrUBJy95
	fBJNktG6lx1vHvpX1jejgNN4g8hdjdUN1Nd+lTsyVMRMIpPIgjbjHSu66jQYTpdynAYTjkq0oyG
	vBsKXxXWpoJUE5y9m52hhCTZIgL0bEX1oyIedjzopPAwng+MmRpxYhIERIwYbvoJhVHFsxD+85y
	Od4feCPn/35nA5O1oo2rLs99IOAtDejPSeqRjgYsrz9HJlgYYdU=
X-Google-Smtp-Source: AGHT+IEEor4XHs6ywQ+j/8lyLON6X6CuON/lYU1DbSsn330MrFeoRFaJLXbZsA/bE06czjb6frPRig==
X-Received: by 2002:a17:90b:264e:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-30e831b842amr14947791a91.21.1747618362926;
        Sun, 18 May 2025 18:32:42 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8e090sm5090478a12.38.2025.05.18.18.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:32:42 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8D0E94208F51; Mon, 19 May 2025 08:32:38 +0700 (WIB)
Date: Mon, 19 May 2025 08:32:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca,
	saeedm@nvidia.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/4] docs: Improve grammar in Userspace API/fwctl
Message-ID: <aCqKNg3p_VlGbce_@archie.me>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-3-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DMgdOt+z8l69n+lb"
Content-Disposition: inline
In-Reply-To: <20250517132711.117618-3-hannelotta@gmail.com>


--DMgdOt+z8l69n+lb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 04:27:10PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> Fix typos and improve grammar in the documentation for
> fwctl subsystem.
>=20
> Use the word user space consistently, instead of having
> two variants (user space vs. userspace).
>=20
> Change wording of denied behaviour to be disallowed
> behaviour when describing the interface.
>=20
> Signed-off-by: Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com>
> ---
>  Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentation/=
userspace-api/fwctl/fwctl.rst
> index fdcfe418a83f..a74eab8d14c6 100644
> --- a/Documentation/userspace-api/fwctl/fwctl.rst
> +++ b/Documentation/userspace-api/fwctl/fwctl.rst
> @@ -54,7 +54,7 @@ operated by the block layer but also comes with a set o=
f RPCs to administer the
>  construction of drives within the HW RAID.
> =20
>  In the past when devices were more single function, individual subsystem=
s would

Do you mean that devices used to be singleton in its functionality? Or havi=
ng
multiple functions?

> -grow different approaches to solving some of these common problems. For =
instance
> +grow different approaches to solving some of these common problems. For =
instance,
>  monitoring device health, manipulating its FLASH, debugging the FW,
>  provisioning, all have various unique interfaces across the kernel.
> =20
> <snipped>...
>   3. Write access to function & child debug information strictly compatib=
le with
>      the principles of kernel lockdown and kernel integrity protection. T=
riggers
> -    a kernel Taint.
> +    a kernel taint.

Improving grammar includes s/Taint/taint/?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--DMgdOt+z8l69n+lb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaCqKNgAKCRD2uYlJVVFO
o/zqAQDCULnwGc9Y+Y878eDVKxSzSu86SkQrzCEY28FujsLfYgD/YzO9FSTCuIuJ
2cwNDYHSKorB85Yxqcdpfx4Hxw2gqA4=
=Kzqn
-----END PGP SIGNATURE-----

--DMgdOt+z8l69n+lb--

