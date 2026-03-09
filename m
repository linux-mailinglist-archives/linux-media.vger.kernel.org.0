Return-Path: <linux-media+bounces-54973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKuWKEnxrmkWKQIAu9opvQ
	(envelope-from <linux-media+bounces-54973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 17:11:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F399323C7FA
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 17:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C54431B0497
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 16:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9773E5EEA;
	Mon,  9 Mar 2026 16:04:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325AD3A4F2C;
	Mon,  9 Mar 2026 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072263; cv=none; b=nSbBqGI5ylAUkH0AWeTxc7c2bu7o4uiQlLr10lgSZSN5/uhDwSHMNA8KliLwjbbD58xkW3U9tm5TZgXEncPKMVsJap/q1bZJJQoHvAhL2eohD5Q76eln5+pSg6o5wiLKCB/W2KPUe9CJ4wiCZ8c97P8f6X6/89Az/nK8L2g2VRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072263; c=relaxed/simple;
	bh=yLkeAkni2e8PJZhqNcBedtEYdFtvlAlrwYrw4/wXd7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHGnZDtL40kwk0idkiY1W3rKWVoinsddbHIbr7PaB3DoesuairSg/MANQvvmENrQJvx31ZiwobprznYkJFueAVMSR6NqYncjOE3pihKpmqAioPQUc6u1AAvidBrMi+vzhryXLFVpHs8fG25bvZlc87dW+Un7ZFxMyhzkM/lnsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackshift.org; spf=pass smtp.mailfrom=blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackshift.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:102:af0b:fa00:dea6:32ff:feb1:177a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "bjornoya.blackshift.org", Issuer "R12" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id DFED777AAF4;
	Mon, 09 Mar 2026 15:53:57 +0000 (UTC)
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7E2F84FC771;
	Mon, 09 Mar 2026 15:53:57 +0000 (UTC)
Date: Mon, 9 Mar 2026 16:53:57 +0100
From: Marc Kleine-Budde <mkl@blackshift.org>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: mirela.rabulea@nxp.com, mchehab@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
	skhan@linuxfoundation.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: imx-jpeg: convert kzalloc_obj() to
 devm_kzalloc()
Message-ID: <20260309-excellent-lionfish-of-symmetry-5c1a77-mkl@blackshift.org>
X-AI: stop_reason: "refusal"
References: <20260308060554.1764128-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwfq522xc3dm3ibc"
Content-Disposition: inline
In-Reply-To: <20260308060554.1764128-1-sanjayembedded@gmail.com>
X-Rspamd-Queue-Id: F399323C7FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,pengutronix.de,vger.kernel.org,linuxfoundation.org,gmail.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-54973-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[blackshift.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkl@blackshift.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.141];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,blackshift.org:mid,pengutronix.de:url]
X-Rspamd-Action: no action


--rwfq522xc3dm3ibc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] media: imx-jpeg: convert kzalloc_obj() to
 devm_kzalloc()
MIME-Version: 1.0

On 08.03.2026 11:35:54, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>
> The driver allcoates memory using kzalloc_obj() and frees it in the relase
> path. since the allocated memory is tied to the lifetime of the device,
> devm_kzalloc() can be used instead.

What happens if you issue multiple open()/close() cycles per device
lifetime? Will the memory pile up, until the mxc_jpeg_remove() function
is called?

> Using device-managed allocation simplifies the error handling paths and
> remove the need for manual cleanup.
>
> No functional change intended.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--rwfq522xc3dm3ibc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaa7tEgAKCRDMOmT6rpmt
0sDRAP0WU8x/a6pZA9ver9FOcvuFQgp4w76tuUH0fxv5Q5oK7AEA2nC/ZdCd6qJ7
qPjF2o2RBxHPuXk33kjBxpUC0D7hMAA=
=ttro
-----END PGP SIGNATURE-----

--rwfq522xc3dm3ibc--

