Return-Path: <linux-media+bounces-57085-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OElINp4kxGmZwgQAu9opvQ
	(envelope-from <linux-media+bounces-57085-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:08:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3632A4B3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF84D30786D5
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 18:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A992541B362;
	Wed, 25 Mar 2026 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUU+WkdG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A81410D1F;
	Wed, 25 Mar 2026 18:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462012; cv=none; b=f69dpl5kpAxdkeVYeK6b+C1uO4stUnBQXqVmSZ8WHuWs7anlkNpE6LrblP3itBMbyTrhNpEWS0eFeWPKMd6HqhjT0x3KiBeqRbn6IadCEbtIU6scPlF8dGlhxgMMTwf7uhRiADUuerMMafnCOq+H1OFF2KZplK4QiBlj7oarQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462012; c=relaxed/simple;
	bh=NrASyDXrPTRzOdXMt+rY87vftM8wegQWKG3EcVZsavw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4/7WHSKckzjqMeQnLHAfw5FtPrhFhLJb78sCszsUoo6Qin05vaC3wZJ3E8Nq5G8SN3mDB8HHusTggfA1jzeq0MHB4q1uJo70peH1BTBZgjEoOJKYuJ2tKNIDDoBjOiALz3Po24zzyeLnhsCAyUwq9efSUwyS9RWqpYNE7P1BNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUU+WkdG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1384AC19423;
	Wed, 25 Mar 2026 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462011;
	bh=NrASyDXrPTRzOdXMt+rY87vftM8wegQWKG3EcVZsavw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUU+WkdGqhPPGBJsyxlRKgS0WHccD27F+kY9qWgUG84BLHPPtNPWCGQoCOk3YFWXX
	 V9vPXLoZ0Roax9hgRmUZ2qlbxZpoZ8vsYPe3HMkLaEB1bpKgkZIXu9syWEB/whji4C
	 fRMlKI+MnZWtlCX4H3el/NZLyHHtdF+pcdyUt2xN1n19Rocynt9flKl74H66r+EmNb
	 NrwXGDDKNgKtyrm7TID9cyxtEKTSz2xr2CmsJzm3DXwz8wOnV9Tj3LavZz5XtD/UOu
	 mIbUJ99sSOq4eLYnbdmpJw67p39qmaLom0FUhjoED+uvH6G/Tlc2VCXMH9FnV4OJN9
	 CepO2tOLvWKIg==
Date: Wed, 25 Mar 2026 18:06:45 +0000
From: Conor Dooley <conor@kernel.org>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260325-goofiness-smoky-05a9da4ab7c7@spud>
References: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
 <20250430-rk3588-vicap-v3-2-e38e428868cc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S07loI5ARDnCLB+6"
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v3-2-e38e428868cc@collabora.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57085-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 93A3632A4B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--S07loI5ARDnCLB+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--S07loI5ARDnCLB+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQkNQAKCRB4tDGHoIJi
0trSAP9NhcSN5IwjQxra/MoajEVkzUk285uvd3tnxxt6xebTeQD40Ti+GjJ8RBsz
y/CiyatNQxTRh/VP0eEHfoLlCuj6BA==
=yM+a
-----END PGP SIGNATURE-----

--S07loI5ARDnCLB+6--

