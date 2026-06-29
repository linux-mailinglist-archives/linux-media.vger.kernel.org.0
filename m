Return-Path: <linux-media+bounces-66004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dJ20GhqpQmpJ/QkAu9opvQ
	(envelope-from <linux-media+bounces-66004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:19:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEAA6DDA25
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:19:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=XX0YABez;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66004-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66004-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE39B300D68C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C7F3655F1;
	Mon, 29 Jun 2026 17:19:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533C40D59F
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 17:19:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782753559; cv=none; b=D5jIXwSwH91FJj9e6SjO1C/UK67OCO+NGBBCF/3dorGskcx4Rbq5F2F7RPcQdO2wY+BrBt4cB0uUhiAaWX69wH0LhGWW/nq7cttPOJAIzcx6oGAmnoBejXbH2qsOMu3V/8HIgSoLVEIhpRuZ4iXxkd4Mml/paRBEWq71r+cfx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782753559; c=relaxed/simple;
	bh=wAGl3LDn2n7NabivivOLcyysAexn1UG3L3wu8rpmfcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktJg4+o0YKTLNrmciV6U8xApV6cIp7A10pv4qYOywAhWJnpy027/CEZfe4F5RYUjkG9L+Wp7DRxQDA7B9Iz7NI5XmhFE/r7I0O6pP3lbNcK8eN81IThjcfXUeDfv+qrP/Gi95DM+wLVZr4RG6zT2LNGCaKAf/A8/oIxT9Iznbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XX0YABez; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4924593f45dso46915595e9.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 10:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782753556; x=1783358356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2kMwCTD0Z6IkQ3kF/VWnANSSNnaxTm8PFjyixvy0e6Q=;
        b=XX0YABezXjax4BTSruBXe0ZmoB/uaL7ds7a5bgfQlw2iEqqNZyDh6cxZw+/Y1K7R79
         mA2yCsd55m3E3AsNAgeLRjNTPGdUuHNIKrwLAyb47fCDliEVSIt73BmMhp68LDxa2GPL
         +jcSN/fNXGHPDdvOC+d/eFMKW3GWfnX4dTHe+XdaV5Pdet30wm9iUM2m4NjkvasqepYT
         3ZTvicc08GJkxKw+JegPW1sX6IG6pjB+Fqf8UbVqTSvFHHXCGxF3crzBCno9s3De9nnC
         t+MY7QqXesz97jEhIBOXaN94XdQtAruBhEDjkASxsPnn6s7sQigzJkA7sFtTGU8xEWCl
         DNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782753556; x=1783358356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kMwCTD0Z6IkQ3kF/VWnANSSNnaxTm8PFjyixvy0e6Q=;
        b=siT3S5Rh93D1BiX7qFkFYr4bjrF/GCMglO8Yq9A2C8wQmmrtGRIIZ3410Uq1ZSchBE
         lronQPZ3Mkj+Jvg4YUGOBKu15QbyrNYd8f4Lo0vPXza39FakfrAhZIZRYcGssbkCVv+a
         AIxkJSv+L6X5k7Lcf+GuoKvhU2cFzathyiVE9l81Jg+dGrEeDWC6aFi6oWEAADYQcTuS
         xSOqKEl/HxZ+SPDx2mlkJvXud6RRUI4GpehwDwhdh5WqRbVhmudY+oWdvM927hb06q0r
         nN0a38uGTCDsfexSDEG4fuiIev77PJ++FZlb84ITJ9+/XExpMHUwvEYOdvO9EgbaM5Wy
         EFIA==
X-Forwarded-Encrypted: i=1; AFNElJ+0nMBsREl47qUgJPzF2vIskUtGu0pU0OJoD0qixx6NLmF6Xq6QuXYGAITaCf1/RfseNM9GQl9KopQfsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJrG0C5DTyu0ASubeTFVAgANYQZt8MvvN6ew4R/2tlDcjERPc
	wxwYl5SVbTM3566rhi94jSfZ/C12rVEslUyv7TMQ2SEG1sfaeNeuOHQeqKRYf4YE9IE=
X-Gm-Gg: AfdE7clgtBoOWNuy0U6T0bwnoparHkU4auhg7Ke35J5wLm7XXrgYAYmaaJLcHktMvQd
	iVQSh63nl3NGhNVK+4PGJgVyz895EF+ugZXYM1XTg9MBmx0B71WHfsPDFF+U8E1+AaVKiejxZ/8
	5WfvnjS8JALi0BkOVUyRcDRGCxf176GknCJEQUwxiPnAMxxBp/c2iWFhXHJe1fIaUL3oU8v9+VR
	8FrJUeiYKPmnWsSYsxgA0w5+/E1mOq2tWc90ixLSukWWZq25TN6qusyfFgt9Y+rkObYYJnaDPNO
	nV13JTc6jdbDvFhQKwzNWXPl+sEp8MERzmMEYaSgCBTHgLlM6yKYmzzrbUjHntwal98FBA6YKdu
	2R5TLCsL+fuGQY/Ky9kPzB0I4647OaufTT5SIY38kNy963kISkiQHaw7jYfROgkMli1kazs7wkt
	jJ+r+u9xnfjkW8DhYuEFyKO3zCjMjyjh8zQVUbzirKeESx5AZRHW7GPC7Z8zdYUlynnUrjZ/57F
	vNK
X-Received: by 2002:a05:600c:c492:b0:493:b03c:5650 with SMTP id 5b1f17b1804b1-493b82b0d77mr8050895e9.19.1782753555671;
        Mon, 29 Jun 2026 10:19:15 -0700 (PDT)
Received: from localhost (p200300f65f47db04294e5bd34a12a699.dip0.t-ipconnect.de. [2003:f6:5f47:db04:294e:5bd3:4a12:a699])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8c65f67sm4474505e9.3.2026.06.29.10.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 10:19:14 -0700 (PDT)
Date: Mon, 29 Jun 2026 19:19:12 +0200
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
	Sean Young <sean@mess.org>, Zhaoyang Yu <2426767509@qq.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mjpeg-users@lists.sourceforge.net, 
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
Message-ID: <akKouitA4lNoqios@monoceros>
References: <20260629171254.3470651-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sn4ibpglpe5vkcxw"
Content-Disposition: inline
In-Reply-To: <20260629171254.3470651-2-u.kleine-koenig@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@kernel.org,m:awalls@md.metrocast.net,m:yong.zhi@intel.com,m:sakari.ailus@linux.intel.com,m:dan.scally@ideasonboard.com,m:martin.tuma@digiteqautomotive.com,m:aospan@amazon.com,m:maintainers@bluecherrydvr.com,m:ismael@iodev.co.uk,m:ezequiel@vanguardiasur.com.ar,m:clabbe@baylibre.com,m:jai.luthra@linux.dev,m:laurent.pinchart+renesas@ideasonboard.com,m:kees@kernel.org,m:brad@nextdimension.cc,m:1742789905@qq.com,m:atharvd440@gmail.com,m:lihaoxiang@isrc.iscas.ac.cn,m:krzysztof.kozlowski@oss.qualcomm.com,m:sean@mess.org,m:2426767509@qq.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mjpeg-users@lists.sourceforge.net,m:msp@baylibre.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66004-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,md.metrocast.net,intel.com,linux.intel.com,ideasonboard.com,digiteqautomotive.com,amazon.com,bluecherrydvr.com,iodev.co.uk,vanguardiasur.com.ar,baylibre.com,linux.dev,nextdimension.cc,qq.com,gmail.com,isrc.iscas.ac.cn,oss.qualcomm.com,mess.org,vger.kernel.org,lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFEAA6DDA25


--sn4ibpglpe5vkcxw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
MIME-Version: 1.0

Hello,

On Mon, Jun 29, 2026 at 07:12:54PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Some pci_device_id arrays already used the PCI_DEVICE macros, others
> used named initializers or list initializers. Unify all to use the
> PCI_DEVICE macros and (if applicable) a named initializer for
> .driver_data. Also drop all zeros that the compiler can care for and
> unify indention and spacing.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> v2 can be found at https://lore.kernel.org/linux-media/423da5a0ba0c9371c3=
d30011ed245f596d70b58b.1781020630.git.u.kleine-koenig@baylibre.com
>=20
> Changes since then:
>    =20
>  - Fix code-styling as pointed out by the Media CI robot (instead of
>    keeping the style as it was) in
>    drivers/media/pci/saa7146/hexium_{gemini,orion}.c
>=20
>  - rebased to next/master
>=20
> Note I already claimed to have fixed the coding-style in v2, but I
> failed to commit that. Just mention it to prevent further confusion.

I again failed to send this out properly: I forgot to add "v3" to the
Subject and to remove the prerequisite-patch-id lines below.

Please tell me if I should resend.

Best regards
Uwe

--sn4ibpglpe5vkcxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpCqQwACgkQj4D7WH0S
/k42uQgArec+zHApNoqm7caVJsGyBH1pH+qRfZt9vPK0PULUf4cQTcW8UNSsUpBP
qE5KoME7nV8ydfaFqjoY0Y5Mj3rz3EdUZeTtdLPJVZc4J0VjrmX3Feelums8q0ih
o/2U85quGCxtaa7LSRBY/mgyJCcETLEEGlpKe8C4o1eIf8iAjw/82yA9FE/0TlIz
pQrUDCkrREnArbJvx8S/Wm5bs8JpG+jdnnLA5DJU0fE694Fdq5xR6IJ2Q4buax97
hTrh0dAEASo8VhtsRyYNNyRgkzkkxrabJkW6xtGe0iY2xDxtAxqoTMb80rRPoQEV
YwzeHbPiO7ZcDm0YcdqQwRslYea4OQ==
=BNLm
-----END PGP SIGNATURE-----

--sn4ibpglpe5vkcxw--

