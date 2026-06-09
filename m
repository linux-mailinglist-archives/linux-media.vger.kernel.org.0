Return-Path: <linux-media+bounces-64320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1uGXO4VAKGo/BAMAu9opvQ
	(envelope-from <linux-media+bounces-64320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:34:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AE6626D4
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:34:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=IfArhZ8T;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64320-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64320-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F8C43322B1F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 16:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AE83B995D;
	Tue,  9 Jun 2026 16:18:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648BE3B6364
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 16:18:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021890; cv=none; b=bGokuyKGa3VMyYTlMilPJEYASepaPPopc20m9PKfb9vONcE5F4/6RCRefLRxRXEn26K4/GJU5dU1Z84TBGP1njwh8b9Qed1DVkHRgviNM9Rpp3NLJcPUd2r2WEDD5dImDYNvJvCCtu593Drga+ChfKpqo3yvg5GSN1AhuPgntuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021890; c=relaxed/simple;
	bh=9zFUKajN/Xs1LuyJKVx7vRFOSQqJosHa9u1rsRtHCrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+zoYcNZgHtZXgHrOUCca78YRpugMOomQm5/TijUKyim5q8FFL8xFgjv3/EpjqJNn7ivGsB3iuwbGL5HjdMgWIMZOKDFvUJfz8G37wJdJhN4TlWIPflZNM3sjOG+cF5k0M9yWC0Me5BX6T19bb9HOkxkr5y9QlLCXGku05bVE8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IfArhZ8T; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490afc47455so30303005e9.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781021886; x=1781626686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MD0uKxdBmHu6ibIagbXN10WdRYqWh5ycZ3Y5plBpZ/g=;
        b=IfArhZ8Tew9oRxSgXMLzdPDUivz3UUlgOrhJtGV1OLed8du1BYz2/WX7rw4+qnWoGn
         xgR0FaBCt4sap3VuDcBFbXA4RivTfv1WUBQjCxrFU4qCb3bXy0pelQVXbLW2LenhK1Eo
         FdlozMRVYea6Km/rRvIoyVR4rrowF0j4fM9DWyQGVIYMKIozIzHA6w2GCefYXi6lnxqO
         ihjk72MtQ5sdWDeYxu3xnfm+Kh6yz+KuaSeMtdyOWR5KgHlgNtg2PB/zDcCw7hjfOKk5
         RCJ7gEc10D9ArJs9upG9upIuqF21sdsvrHN9bxzr/7pg/By6Gk9vhLxuvkcgS7cI57fr
         Jo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021886; x=1781626686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MD0uKxdBmHu6ibIagbXN10WdRYqWh5ycZ3Y5plBpZ/g=;
        b=mR8JgLdnbTU4dngfN0UmqoBHbb8xocwc5GXE7Pv/enSHhS0iPOinI7h/7aAEMWnmeS
         TzOCb/WDeJl6UQmJuSC5mSedL8JH4Srk7pyqIeQdbqcvEZaAFKd6LGuRAY0nm3b6lxRY
         RcL/Fq0jKPnVjO2BvCzWIF5gMprBTIl1svN2GOoIV2ikYTW3q2kVNYhyflo3GPZqTM26
         1Ic/FO28mcWAp1ZdjaKNocGJCKIacDwiNJO0EnhJA2l1O7K+sb/AcRWrD0ueK0MClSUP
         EtBctxiyyajcIh8txd1e20o1TuUK8ItAIlKfWwbibN4o0KJofbkdKIY8Wts79xR9Hfvr
         g7fg==
X-Forwarded-Encrypted: i=1; AFNElJ+zVPIrNQX6HfTGuzbVsAZpW7oJZ2sFIwi00wbemkRO0djFtMyb3wksZEXtD/ajBQc0YUGP2ASBWwY+yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxm8x4Zm3nrH9Yn+GilxX+CiGnPhApxulM858Dor9E0JVX9XpX
	iZhSwfEfdIJoe21WeUQ3eE07aVzbPvCohOiG2eKJIpBNAFljlYIJLP7gR1deYn+SZAg=
X-Gm-Gg: Acq92OH34W12dfeMthIuqIXSGlJltcQtZWhT+Dys1QleV3OjXnsKztzqNXAq13kMeD/
	cBVR+P82Aw0a9GpBvM/5gPd1gHby5AxXVFd0mzXDrj3bD6t4+2i8Q8vrrgKuL3NRoBFJjSNgKXx
	neUSzDqhxqGjt8OUSSZE3haU5AIEvSI/e7ElRlPunE5RZ+I3HYcUELZp76GK5pjYXbzEszG4Wyy
	WOOMepOGmGzQAMMchZUp9b6T+KqNBYESRyu4K/+PVVmqzXBgmcheYpWnU3p376Wie9yfAmr6IPe
	XE72g2ioI0+EsAYuA3ohBbQozdAz5gTNUiIjaAhSmD7EV9gNz3jPXGE2Rcw9DoSAktIzIuYYXL/
	EwvZ+zqIyk/aFkKg9OrlAKt5pe1i+kDjpcrerPanfSpN2lHob5l0LLL/2PZRULI/dPZJ1zaRu6r
	M6cYeGYzLtoVFzpLSOX7wf6RmS0pNrL/4xUgsZIy2t0/E1GpLLRfyuUcJc4DYV3NthmrQHe5Ia8
	ot/Tvc9XmslMGl43vzN2R5Jvg==
X-Received: by 2002:a05:600c:4691:b0:490:b8c0:d471 with SMTP id 5b1f17b1804b1-490d722a310mr43612525e9.23.1781021885836;
        Tue, 09 Jun 2026 09:18:05 -0700 (PDT)
Received: from localhost (p200300f65f47db045b0dbdd314d8a71f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:5b0d:bdd3:14d8:a71f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc391aaasm568974325e9.1.2026.06.09.09.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:18:04 -0700 (PDT)
Date: Tue, 9 Jun 2026 18:18:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Andy Walls <awalls@md.metrocast.net>, Yong Zhi <yong.zhi@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Scally <dan.scally@ideasonboard.com>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, Abylay Ospan <aospan@amazon.com>, 
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Ismael Luceno <ismael@iodev.co.uk>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Corentin Labbe <clabbe@baylibre.com>, 
	Jai Luthra <jai.luthra@linux.dev>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kees Cook <kees@kernel.org>, Bradford Love <brad@nextdimension.cc>, 
	Wang Jun <1742789905@qq.com>, Atharv Dubey <atharvd440@gmail.com>, 
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Sean Young <sean@mess.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Zhaoyang Yu <2426767509@qq.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mjpeg-users@lists.sourceforge.net, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v2] media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
Message-ID: <aig79YgHwFc7c2qf@monoceros>
References: <423da5a0ba0c9371c3d30011ed245f596d70b58b.1781020630.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b7jchow5ahvbv6lw"
Content-Disposition: inline
In-Reply-To: <423da5a0ba0c9371c3d30011ed245f596d70b58b.1781020630.git.u.kleine-koenig@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@kernel.org,m:awalls@md.metrocast.net,m:yong.zhi@intel.com,m:sakari.ailus@linux.intel.com,m:dan.scally@ideasonboard.com,m:martin.tuma@digiteqautomotive.com,m:aospan@amazon.com,m:maintainers@bluecherrydvr.com,m:ismael@iodev.co.uk,m:ezequiel@vanguardiasur.com.ar,m:clabbe@baylibre.com,m:jai.luthra@linux.dev,m:laurent.pinchart+renesas@ideasonboard.com,m:kees@kernel.org,m:brad@nextdimension.cc,m:1742789905@qq.com,m:atharvd440@gmail.com,m:lihaoxiang@isrc.iscas.ac.cn,m:krzysztof.kozlowski@oss.qualcomm.com,m:sean@mess.org,m:patrice.chotard@foss.st.com,m:2426767509@qq.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mjpeg-users@lists.sourceforge.net,m:msp@baylibre.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64320-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,md.metrocast.net,intel.com,linux.intel.com,ideasonboard.com,digiteqautomotive.com,amazon.com,bluecherrydvr.com,iodev.co.uk,vanguardiasur.com.ar,baylibre.com,linux.dev,nextdimension.cc,qq.com,gmail.com,isrc.iscas.ac.cn,oss.qualcomm.com,mess.org,foss.st.com,vger.kernel.org,lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,monoceros:mid,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E9AE6626D4


--b7jchow5ahvbv6lw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
MIME-Version: 1.0

On Tue, Jun 09, 2026 at 06:01:08PM +0200, Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub) wrote:
> Some pci_device_id arrays already used the PCI_DEVICE macros, others
> used named initializers or list initializers. Unify all to use the
> PCI_DEVICE macros and (if applicable) a named initializer for
> .driver_data. Also drop all zeros that the compiler can care for and
> unify indention and spacing.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
> Hello,
>=20
> Changes since (implicit) v1, sent with
> Message-Id: 20260506174412.2606010-2-u.kleine-koenig@baylibre.com:
>=20
>  - Also adapt include/media/drv-intf/saa7146.h
>  - Fix code-styling as pointed out by the Media CI robot
>    (instead of keeping the style as it was)

Actually I failed for the code-styling fixes that I just found
uncommitted in my work tree =F0=9F=99=84. So I guess that's the template fo=
r a v3
=F0=9F=A4=A3.
(Or I fix it when I touch these files for the continuation for my quest
as I suggested in the v1 thread already. It's now in my tree so it will
be really hard for me to mess this up again no matter if you pick up
this v2 with or without fixing that up.)

Best regards
Uwe

--b7jchow5ahvbv6lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmooPLkACgkQj4D7WH0S
/k4q0Qf+MTlPS+WXNxqieNGTxKwP5Q3y8r+BxhFDIYNQzCXzvAqTFXooxi2xBqcK
TEYkdlDoaoVjFUQpOsMCc2g2M1G2VE/1upYukCQ1OH//AmvW9OLU20mAFEWOpIu/
k5pHrHLxozSjTLlBbC8qnGuDWPzpJrWvWAHyNYVaIe4ez/Fg/8yvdH9HOE6ss9hK
ifUfsWRb4R9S12n9EKEOXFXlCAxiTo/EOwQsG0Pwh522r0VYCq4AJ0tT7c8SDJSF
gyzbNJLgRN7mRiKVCqYR8oTSOX9Cyz49tzyyUhFrE2ZYXrYAf+bhZtfvx66wughu
XzDjgWy7SdlFFZHB5G1XQxzeYvzOsQ==
=Wy2O
-----END PGP SIGNATURE-----

--b7jchow5ahvbv6lw--

