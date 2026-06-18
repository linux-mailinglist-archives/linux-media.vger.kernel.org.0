Return-Path: <linux-media+bounces-65227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u4UmMdMqNGrOQQYAu9opvQ
	(envelope-from <linux-media+bounces-65227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 19:28:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 378536A1F00
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 19:28:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=Z3qmcJwz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65227-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65227-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB34930707D5
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48516348886;
	Thu, 18 Jun 2026 17:27:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D13347FEC
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 17:27:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803637; cv=none; b=mRZn33Yd8Rm01NVq+NJeUMeJ4zfLJWnF9x0ODYS9q2Sup90xfnPnLfUiVu/UzZkAF3sidxbPBF6ySLpSXbzXTo5G8S9ngag+5r8B9IK5lCXnpiD6rmmsOUz02xlWoy6OqFQA9AtSjzqadzNjH/FqYxSMvuwbOEl41tDVwp4P0Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803637; c=relaxed/simple;
	bh=FCuHxpYgxO4RG9gYkMZwslXkCzKhyiciZ7zZe4XbNiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTvNqrgJisoJbfqjwVQHxWfWtmd4nSt1rN4R3iAYK4oZCooBFGypWoF1rK2klFsvTY7SWs39khSeLQCTDWpgtcLq612x+D+F7D3g3GVY9SkmxrLYEqHJM0rMd05UFJq2mOkdl16o5++yQiUY/rWTVf8gBvZGntdoSmEzLqzAuo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z3qmcJwz; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so1045005f8f.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781803635; x=1782408435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iNDB7XgfVYghFL7aUUs3X8ozprZSoKOcYdUOwpOmztA=;
        b=Z3qmcJwzqjqcTprsHIQ/wldFaKacMjigFR3uNcmL79HfJ3dHulGT+YcD9b0IwIp0qq
         /AI4p1uu/7bpwiBSahdJteNGgnlDJwfuIYWjAdzt539rTpYZ/cXHFeSYCGzVHRgozu3Q
         cRnXwkwiky3jbQkH8f+gDIFXihvi5AjJdufdvAxWei6EE+fnTKqTAUB9BULhtCTMtYFX
         QKv+iM3WTkYnGBVBaK0HLxanyD/xpHCD7HVzp4rvDUWG9Nc5duvJSkJMeGpXUMXlb+mp
         9naATjt9NQS0TjGKMim0sOqfZRxrI2b4V9HISPucUS5vts+/C/RWluiILAfqvoYSnbx+
         9YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803635; x=1782408435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNDB7XgfVYghFL7aUUs3X8ozprZSoKOcYdUOwpOmztA=;
        b=NxiJMyOl0VPhynUfKn6uxrPZENpq/eiJjxWGzcCqAhxxaillRoH1ARPVJ2gIRr2FfQ
         52oR+iBa49m6TKs3EmFmnyGklfA9i3beeapaY9xAiBIx5olook5klsigq1b8myTtKHc6
         2tXwfBSTxJqQu2B9OW8cU2Ivdvvek0ayKHwC3nC9NQUEz3R9UacHwAGvF0q1Vopied19
         y6OfZQ7YbzeD3IzzX3qIS940C7MAfeVLkvK6yUimL4q1vcIbic7Uz9RjSE2kdlQ1VwfM
         L3TdVMr5lJiQ8BVaa6Wsyho4l64ibvuMkvw0XxAm4IQ3o5eRFbapN10h6/adD2aBS5b0
         SZUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pOsOBNnF+YbXs4zNx3cTbeVaWM730mGeQyLmeBpFdhBvBiNwxGBfCEJFzsy9RepK0Dp82NeOsIv+R4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8eXekJLA9QaIWYfijdyYtzWVaWP0h4VJ4bdiR9LBDkxr3BqA+
	XlJpRJ+Ifl9TqQe9j0QkydPqViuFHtBIr2AP3+7CBeuXtVhvqtXnEtn19UntNFC21ok=
X-Gm-Gg: AfdE7ck4DSX88EQEjwFI05uK5+Y7D5D7gszSXAQ3k/zJj2kvMND+JhZR2od+2IZLM7Z
	ZJfKwSThWIHXas7qL5zP4vbVKuHYvWsOvVpTVKSsDkB6XhwmxOBfUNFCotwkMDRJfa58YH2DACq
	6uHDHWcrbWynmXVz7BqLd9feq/JwvF/5L3nXjH//CylpTkV/dUxQ+r8v5GQcOU6N7fIocq1ZySy
	pNMl/X55VeHn5iflFHQoiJPoJJh+CJuezWXnj55hIkmU3bWRw/NtOk5wj/TjpWUYxBkwZe7tCBh
	RfGqBHhsYzRrgdihWtZV+TLvojq5fJWq7tle2+PYwCMuiddBZVVGsc4V80WJVL1HW76QCUPB6jl
	yOS1Q4K/zp/0Cwb4AzjdefhSVP6JaOCfiU+kd3i4QwfQRdrilwj9c0iSe8M9KrD0YheUZ9U64uN
	b+cCZvhOkYhcihrMJlPzDltwdIwaxMHEij9KfrAt0caK2XAWr33kvXFgrNAEqUsD3U6wNbL8hXO
	Lfp
X-Received: by 2002:a05:600d:6451:10b0:492:37b7:607a with SMTP id 5b1f17b1804b1-4923fc7760emr4758705e9.31.1781803634861;
        Thu, 18 Jun 2026 10:27:14 -0700 (PDT)
Received: from localhost (p200300f65f47db04cea0a59ab11cac9f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:cea0:a59a:b11c:ac9f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fd15535sm4699995e9.3.2026.06.18.10.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:27:13 -0700 (PDT)
Date: Thu, 18 Jun 2026 19:27:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
Message-ID: <ajQqRj4lX10M5dQj@monoceros>
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="endujef62ugl3neu"
Content-Disposition: inline
In-Reply-To: <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65227-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:from_mime,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 378536A1F00


--endujef62ugl3neu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
MIME-Version: 1.0

Hello,

On Thu, Jun 18, 2026 at 06:37:44PM +0800, Wenmeng Liu wrote:
> +static const struct i2c_device_id og0va1b_id[] = {
> +	{ "og0va1b" },

please make this:

	{ .name = "og0va1b" },

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, og0va1b_id);

Best regards
Uwe

--endujef62ugl3neu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo0Km4ACgkQj4D7WH0S
/k52EAgAgUXx6nNuRbD3KgLHPYbej+Zt7WTlvyKKhWJIP1NqEepGQdgtiabv5z6U
MvmU4mBit39O4SsAn0XGjM9Bn7FrUNb8oYbUiEGJrcIz6gkIWxHzpY0gsBb/Qb3O
Fi7JYyYPXyeNsreM8IhXc8kOGeEZiZ/1o4I3tPAAri2DN6UD47JitgGlzyuzhZij
SO9DLUriMNs0H9fGW++CTCTtOjArv44YyKW4hjUuvPqtwaH7HfXQOpkOA61weKbd
dvYsv8pDPfkNE5CaDgSHcaI6t24mQoYRxiclxyY/3cIY5Ag877Rlw33hFcnhvt1J
zqvLBw7YLGiRHcu7RSHkpboKYFwq7w==
=grwz
-----END PGP SIGNATURE-----

--endujef62ugl3neu--

