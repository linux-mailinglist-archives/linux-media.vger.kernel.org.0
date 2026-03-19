Return-Path: <linux-media+bounces-56384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KbPIo9gvGlxxQIAu9opvQ
	(envelope-from <linux-media+bounces-56384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:46:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B752D258A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A2C13010698
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB2F3ACA4C;
	Thu, 19 Mar 2026 20:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Q3TuNzV3"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A83A63EF;
	Thu, 19 Mar 2026 20:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773953159; cv=pass; b=T2DQb6B0D0EwsYI0LqIZwNnzpV/tCnAS/sXCmEAkRtKwJsfvyR4GYhil4EvzPBQ8c54502+jyA8s3faHqhy1WZv1Vn7uHoppcaG0oXy5hPuLEgsZFLRjEkHUq8nKVmiuARqyG2RrjTdSeMSLvihZKt8AnwbAhdPkqtfuh2pLC74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773953159; c=relaxed/simple;
	bh=yP5T2EZL/QEjR3ppoC68ntYbaRRIQptAhC0TP+AObCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3KgmcKiII271pizOGd6fjhOT4X36pzUDT05+L1jKXoDoJRJx+hHxa5W7ixXksVgoqQB9/B8rGP2dtV2aURhNT6tYfXKX2J9YYwUJcTjZTHl6/iFDG3h7uijlVOnFbqpQxTi6yde/CBNVyqM3J9Al9UrkSA/r3J89T4rVCZA69I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=Q3TuNzV3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773953128; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FBLt8bbVBQoMUpQgSDuBNHSYtcR5nXxVFzmyXVhekRpKMbaCHY3CEvUJKgpLiJ42ciCQoTmiEOKumIWsDnJ+gQQeyGsGbdq4b6zNYmWePSxk6C4Xp1s00rUaSpG9drx161AItkpYrM43HfCgAJE4bGxo/TMW8Z7/FAmRHHxwhC0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773953128; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oJjF13cLrY2C8Lwe6vZDt+5t2BT+dVTzc9vqZjS5Y0Q=; 
	b=dQjB+4PvAADgdrLjYC0RefV1dwVrJFh/LKfnME5fhUrWM5mYnAZjHCEonCN3eDZ2VwqvvzmwYfEO+mcFkwazk25/lV23lqnfGtPAJAmTDlozpSrkYT53Un94uErGuIYW5yGF76cabaDbjyhLE6VrBr48isHqgpkrqvlUkRCfNwI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773953128;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=oJjF13cLrY2C8Lwe6vZDt+5t2BT+dVTzc9vqZjS5Y0Q=;
	b=Q3TuNzV3TqXL5ZAyR/K/r+sAZ8vdraZR4vLho+X5peTuTCL57wbBYAtnFTRV/Xfp
	IgCuKzog/zWImXtB3f+SPZdOxVEk+zVHU5Dhcu3RQqpaZ8ziMyV7+nKXvWVGsWo1RMj
	WcyLCMOB5vr6ykODvHjclLxEhpqY6Fli4JF6vTGs=
Received: by mx.zohomail.com with SMTPS id 1773953126223827.4198037672601;
	Thu, 19 Mar 2026 13:45:26 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 9592A1808AC; Thu, 19 Mar 2026 21:45:22 +0100 (CET)
Date: Thu, 19 Mar 2026 21:45:22 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Ross Cawston <ross@r-sc.ca>, kernel@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1] media: hdmirx: snps, rk: Fix HPD hold time
Message-ID: <abxfd7SdlaMWag_-@venus>
References: <20260318192619.3910060-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q35k3qr4wpgazbla"
Content-Disposition: inline
In-Reply-To: <20260318192619.3910060-1-dmitry.osipenko@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.2.1.5.2/273.911.55
X-ZohoMailClient: External
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,r-sc.ca,collabora.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-56384-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,r-sc.ca:email]
X-Rspamd-Queue-Id: 89B752D258A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--q35k3qr4wpgazbla
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] media: hdmirx: snps, rk: Fix HPD hold time
MIME-Version: 1.0

Hi,

On Wed, Mar 18, 2026 at 10:26:19PM +0300, Dmitry Osipenko wrote:
> Increase time of holding HPD pin low by 50ms. This fixes EDID change not
> detected by sink/display side.
>=20
> Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI inp=
ut driver")
> Reported-by: Ross Cawston <ross@r-sc.ca>
> Closes: https://lore.kernel.org/linux-rockchip/20260209061654.54757-1-ros=
s@r-sc.ca/
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

The prefix in the patch subject should probably be
'media: platform: synopsys: hdmirx:' or 'media: synopsys: hdmirx:'.

Greetings,

-- Sebastian

>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 61ad20b18b8d..4c8957505a50 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -506,9 +506,9 @@ static void hdmirx_hpd_ctrl(struct snps_hdmirx_dev *h=
dmirx_dev, bool en)
>  	hdmirx_writel(hdmirx_dev, CORE_CONFIG,
>  		      hdmirx_dev->hpd_trigger_level_high ? en : !en);
> =20
> -	/* 100ms delay as per HDMI spec */
> +	/* 100ms delay as per HDMI spec + extra 50ms to cover internal delay */
>  	if (!en)
> -		msleep(100);
> +		msleep(100 + 50);
>  }
> =20
>  static void hdmirx_write_edid_data(struct snps_hdmirx_dev *hdmirx_dev,
> --=20
> 2.52.0
>=20

--q35k3qr4wpgazbla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmm8YFsACgkQ2O7X88g7
+ppEIw/7B3PY5NAEJtHyK6Xomwg3aEXDq5+Se2cbgSJW2+JV7XSDtI7ZJw4kFo9C
/DclnUficoRHgTpGbsksaBpyRhk8iAS05rB67TGKE51O/VyYx5fAeJvzUbFA8gTD
iIpPwtsURF3INbTZbsIWpjrIV0M8ZRW8D1FhErsmRZLOJZuCEp/7WzgILftGqzy/
eMPfbr67f0b93QxoEJ0NeR2R0mV0LsGIgDkO0vF0bWogbno+mJL7PHz99nA2RTtv
CHl2CflyPml9gAc9DE3rrI2uWoBr68ewofSmtuQ18DeeeGFIErXoiCEpT10ON3J4
tG3muy7HJ32iaCjOzUm/tUw+3bOW7u5lRMWkNP6kkSoKTYsFGhX5wlMOOPkSXGwn
0M3+qQX+eY84sFYp6V/7Akwm2xg5wctS8GWKbBMJhYaH6GqHgxsZRviNhavFSNnL
GCYGisv/RAeQGBljfsm9v+xcsBWuwGiuQjcsm+FtQinmtyZ0pLbNQ02YNsco2NAk
8cN8340Bq/eOfI+efRH8JFac9F7aXisamqgJhcIBOWNQNlMvPTUQaEQ6Cr0y+dhs
LpY3X157MGhU49OHocNtwdpO5hOTk7bd+I5v+4dtUivjlo5pIHABf1HLwWw2t9vS
am5UpklWhK3RkBPROGXmxxsDEgV9aZkUKrNekWfIAyB3fxKcA78=
=orzv
-----END PGP SIGNATURE-----

--q35k3qr4wpgazbla--

