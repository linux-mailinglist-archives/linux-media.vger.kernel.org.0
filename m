Return-Path: <linux-media+bounces-32980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D1ABEA0B
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 04:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D3C3B04AC
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 02:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27E722B8D9;
	Wed, 21 May 2025 02:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4mNxSKi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127EEC133;
	Wed, 21 May 2025 02:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795732; cv=none; b=XWxjMH+2AfqJ7N3WSTIUTpVz+CoGV6Yw7lfN+sn6MU+0xj95K9wF2TZ56UJv0NJD2UVrYO/Dhl479rACjSFaOg1FSEXNFHjpumpA26kk2SbLsnoY7Me32ks8PDR0GHxAiCusIwOjVVPsQMjta8N0BkZHgZm5Jzghya0/vRzvarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795732; c=relaxed/simple;
	bh=pQWwG4FE7E75O7y9KDeZqn7/YOWBpQ604/XkiidUzBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRQ7f38C9D7BIebjyi0aHovtFDlFBlk7AjzHu4uwqno24OC0tw+T3n5InHAuVViphT+yAaAjdwRLCKNMSptYFo5/u/kxLRFh2i1mFwUpOfYeEI0Z2KjTYnfuWAZywxSm/PMihhSDWz2OJFZmpnfthGWJHs/dSTJyeD8SyoD0mok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4mNxSKi; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c46611b6so4418742b3a.1;
        Tue, 20 May 2025 19:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747795730; x=1748400530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2NbDA114bT4M3eihLnGg0sok4WOyWpUmS0wQOI9syg=;
        b=Z4mNxSKicEnBsDWJm6ldbg+dX3lCvcKdO+lYBTCwdVnUtYtJHKOP3xp8mOcWvDVSPg
         qLp7B5IBbRcGVoThnQpQg4GCghe12/9mqHgUwazErzd8NHPakd3Gw40FbMsN10zY4UwR
         BrKX//P6MAhb2BBHQ4MN/dmoo+0RekOH20GkMc3ipMbBVvPA2+UzU1hu/SbaGRvsfbEr
         7vKifYmI4ZVEiClp1gGuVz8i211aYWdoF/z8wRIMgs9MULObuJS9FwoNGVs7rSfVseRS
         MP6ukVnjDO7mQObzQBBumrXIqZztx6LrF8IJN3wq9pga6yxX74958NXdhK9Kd/Ypz4pZ
         8PuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747795730; x=1748400530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2NbDA114bT4M3eihLnGg0sok4WOyWpUmS0wQOI9syg=;
        b=HF0tHM1zGxQLs34Ztc/FwD2nrGTHoWCs90UjwfSKMd7bP4Nbq0A3F/YJf3H3qpZ2XI
         UwKRhcm2wokh0awJMtJ67Ygtw6Md7jdG1AkygyApzTtZ0mGjYLKEoMklb3MGsuqRdhOC
         +9ywreKED4ZKqF0v9jrVt5iKM8crCH3RPvfJccnVUQG4M3hUyvsjIf1m2wOqbsizZqUh
         kd018d+18n7kkwBMU/2Lylk9xhejgxXSEgLpcAQaqHmPnSXmLgwqjVUT1bwMjvtw7euD
         yWZ5QrN+TGgTI8WIgmOPqoS7oy2DpG5W/X+DZZIbLQoGCF7x1c7ayyBUoAbAEmlZnh0Q
         q/wg==
X-Forwarded-Encrypted: i=1; AJvYcCVeqDcpx68faBo9RiOEyIizCS4lYWDalA5692Sk12GI9DHsfJQlBKqRrD7U06YlepJYWKvSeaOtlF3dByI=@vger.kernel.org, AJvYcCXqSAysWoew6Uz75LUmBnoFhhzrna07dW3hh/YTkn+P36vub/woxEwTCccI36wSge11VQegFuJbVLRfyoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YytssCg5eNSbAwj4OKgZxptg7sbPPDuHnJ5hk+Y7YeIxjURKu8n
	zyjYgRxZSr2Vke8v4kDdid+06MWBEqHeoaMNJC974E1d+ly0OpffYYBz
X-Gm-Gg: ASbGnctoWkAyu+LxKmIrAoGgpHhpa4d4F9L2hO71dXGMgC5LcT5uJdgtMXTTiZK58eE
	+vqfXy8yx/Y3eruUmtzsrbqGC3KXFAxOF6rWgX1gO6V/8gGg+U5zivAdJB6X14aVxnT5f0pcxC6
	w/gb9sAbVgHfVL3Ldugt5HMWKNGu9ybES7SEstpc1cDjOqaJkrDlkDHyKIHyPpKMgjJhbsDkDML
	/by5VxVdHE1UXODDVRKyfVSRPxLOy9d17vsJ5VNaFRYllrGJEb2Ec0r+qM1226FOJjwbvsNH0eS
	6f5jhDrY3DNyuZQAw98O+nK72tUpOrXS/OF6o8J7JAODxDnAdeo=
X-Google-Smtp-Source: AGHT+IFX+g62ovxud3Kx3IZsJ/gdDGHXTo7y+fh/QB6c4bXsAVjJmkxY8O/Y1Pe1xDdgpFg9+SxQkw==
X-Received: by 2002:a05:6a21:1089:b0:1f5:6b36:f56c with SMTP id adf61e73a8af0-2170ce39a55mr25774895637.39.1747795730168;
        Tue, 20 May 2025 19:48:50 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f364fffb2sm2516031a91.33.2025.05.20.19.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 19:48:48 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F08AE42439C3; Wed, 21 May 2025 09:48:45 +0700 (WIB)
Date: Wed, 21 May 2025 09:48:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca,
	saeedm@nvidia.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
	mario.limonciello@amd.com, W_Armin@gmx.de,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/4] docs: Improve grammar in Userspace API/fwctl
Message-ID: <aC0_Dbx4rZkiwkxe@archie.me>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-3-hannelotta@gmail.com>
 <aCqKNg3p_VlGbce_@archie.me>
 <264386b3-075d-ef1d-e3b2-9a2937ca05cb@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0QQaGeC0l+16FwB6"
Content-Disposition: inline
In-Reply-To: <264386b3-075d-ef1d-e3b2-9a2937ca05cb@linux.intel.com>


--0QQaGeC0l+16FwB6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 04:01:11PM +0300, Ilpo J=C3=A4rvinen wrote:
> On Mon, 19 May 2025, Bagas Sanjaya wrote:
>=20
> > On Sat, May 17, 2025 at 04:27:10PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=
=C3=A4 wrote:
> > >   3. Write access to function & child debug information strictly comp=
atible with
> > >      the principles of kernel lockdown and kernel integrity protectio=
n. Triggers
> > > -    a kernel Taint.
> > > +    a kernel taint.
> >=20
> > Improving grammar includes s/Taint/taint/?
> >=20
> > Confused...
>=20
> To be fair, the changelog also said "Fix typos". So Bagas, do you mean=20
> "Taint" should be always capitalized? At least this doesn't support=20
> that position:
>=20
> git grep -i  taint Documentation
>=20

Nope. What I mean is the opposite - lowercasing taint word as it is not in
first word of sentence nor a proper (named) noun. And yes, I was writing in=
 sed
syntax.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--0QQaGeC0l+16FwB6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaC0/CQAKCRD2uYlJVVFO
o6esAP9/bJwCrrj/nib8pSzd6lPgroUAO4W0naZG7b26fSq4bgD8CE7syGvkZQVR
G7IhqPXv6+OnwWkVI43fqKeA+7bUqAM=
=TDrk
-----END PGP SIGNATURE-----

--0QQaGeC0l+16FwB6--

