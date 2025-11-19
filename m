Return-Path: <linux-media+bounces-47407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FBC70E06
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 245DC4E239D
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3993366DC4;
	Wed, 19 Nov 2025 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="doNCoX+/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1E348860
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581218; cv=none; b=gC82X1adgDGCNag8WLmRjKqfoew9q7ao7So28dzTEcmS9K9BsXK3MyCK6BMc0S32tv0EIwfWfFOELa4RG9SFPESv9z/rWu/zx9Nv6upGaM6mnwrBrQ5ONuPaNUN5uNa+LFLcnXYIM6yLde5OxBo77oQolMSgrgisAxUkLhlUpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581218; c=relaxed/simple;
	bh=jOtYG2BALSx/2EgVQx8wnWiNbewyqQUUStBXu5wk/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stiTt/75+R0blTNJlqA/zb+Ic2UWf4X5RaerzR1CAs3yxONIfKV7j1nC3Rkfmd2cLf7SlalnBrDAA8W5UeYOBmPdDh24LyJ2j0hZLCI04kLiUSu3laYfGyaQuqGdPUSu66XND7VJ6LRHHcHJdMWiH7p+yivtYK+Pfyd5sRvfl3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=doNCoX+/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jOtY
	G2BALSx/2EgVQx8wnWiNbewyqQUUStBXu5wk/Hs=; b=doNCoX+/DcnDPlh8w0dS
	l+PfvorX9vA/A7Ro61R65qPDMX6Awz/AB698xyCRpx4UjjiH3YzSr3AQNa+VcfQu
	6okWHXlFDVan5kFnmvFNVoFed/ELSYF5aeFd07hdGmndeqn30A/b1mFIH7J+ohx4
	g6R1mBPw8+gQFORB3F/uBXMbjnElgZbBnCBNIAkRMOR7z6MEKTg6+xP2CejmOFmq
	Ci9DHsDpLcHKCFZbKxqmM8zW8a4sEIe5kxt8Z632Mt+0oLwK8WDnh8+iVLEr+lR6
	gpplUrK7/udwMhlTyyap2Rmny+yN1CkW99B0irKjYti5cwM0lBCM7xM3yaxYKYc/
	fQ==
Received: (qmail 84417 invoked from network); 19 Nov 2025 20:40:04 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Nov 2025 20:40:04 +0100
X-UD-Smtp-Session: l3s3148p1@jMg6v/dDJnltKPF4
Date: Wed, 19 Nov 2025 20:40:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antoine Jacquet <royale@zerezo.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	lvc-project@linuxtesting.org,
	syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] dvb-usb: dtv5100: rewrite i2c message usb_control
 send/recv
Message-ID: <aR4dFL75cdb0ccQQ@shikoro>
References: <20251117155356.1912431-1-Sergey.Nalivayko@kaspersky.com>
 <f0c93964-2971-428f-8fb9-f72147f1ad29@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fE2iGKMxtf5u0oxZ"
Content-Disposition: inline
In-Reply-To: <f0c93964-2971-428f-8fb9-f72147f1ad29@rowland.harvard.edu>


--fE2iGKMxtf5u0oxZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Can't this problem be fixed more simply by setting the=20
> I2C_AQ_NO_ZERO_LEN_READ adapter quirk flag, as in some of Wolfram Sang's=
=20
> recent commits?

I think so. Hmm, I searched the tree for potential candidates. Seems
this slipped through :( For reference, I fixed it in another media
driver with commit b5ae5a79825b ("media: usb: hdpvr: disable zero-length
read messages").


--fE2iGKMxtf5u0oxZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkeHRAACgkQFA3kzBSg
KbYeERAApVUraYP2AY2EVBwusTFRxFk6yB76GEnh6lt0KsY6I5AWIRymNnMKihvM
R+h5wLEbKkGO2WZF49peaw4qLqzhN0iYp5V73rp6mJObL9ImDaQKLJaNEKZAfJuW
ScXjenmh6Jge67e7REfYmlQLmx2tqVJyUer4DaDhrvKCSl4UfiYjkWu56SWO4e/+
sD/vcQjW1gDTuNeyD7L2PgpQGQHLQu+qCPy114yEzR9aJgO4luyeSwkeZO85o9g9
skCYmp7ZiotF+nJR+mWshVu7re136jhFB8DWseRxKSY8sKk+uK6O9Q2XsaKGosXD
o71k1V8qCVyd9EwtHV8aqXkZFJTG0zjD7HYmfbnsL0OJ4SauEyiVse+mTP3/Qru9
gntRSxxbyiLmRU1g7vwN7ZLBYIie4cQ6s/1tnbPgpMrYkv1W2g1Wce1enV6uvkGb
zC8yiPMMeqIUtSEkyFLP3sFTI9ugmiQHe+6+wnxNRsjGzx1OF99yk3huWEEfZGYU
9UtVmjzRbdXbtGMqBk414p39tZGTBDjFI9L/o3epdu4PoaOFDyyAxr1ZrUksBUPQ
DNNs2bTHrkMHf6w4Csi18ou814tBsSDt1koXG+3xKTlfl66mC1mn+9IzMRorV2Xn
H57nX1H6Sk4iIoXhIMRSTpLJzIDnDtqXPEPoHVI7GkePhTomRC8=
=GBrx
-----END PGP SIGNATURE-----

--fE2iGKMxtf5u0oxZ--

