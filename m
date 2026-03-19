Return-Path: <linux-media+bounces-56373-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMiRIO9WvGn6xAIAu9opvQ
	(envelope-from <linux-media+bounces-56373-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:05:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB012D1EC2
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62A7F30776BB
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0F239F16D;
	Thu, 19 Mar 2026 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GyK7utUd"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22563389E13;
	Thu, 19 Mar 2026 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950613; cv=none; b=YuvHS0pS7FrX0NWkcW9PbAwvGH0xhnGY4b53NFnewVm4QfNbzOsCcvzMReqwHwomiYVl1hVItpAmTfin5sIojI/Si/l1rIOA2SfqxcvsNMuXYXrjjYs87EkBS690N7ExHBSuWbgC3qW1t91LVQiIv5Vtv2IHrIns0BtvkYN3/0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950613; c=relaxed/simple;
	bh=Mwk77xis2n3Xi3SnteeL2ohG2orQmcxYOHvsRcbmRzo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nPgFlbU05ETVPetxWb45HY13pw2ytkBgBAmvFgxM5ZgrIOCNQgx9IZr5p+07xyAYh++BauOZUdOx/CeEi0IpR5icF+LNs2mp5RJmfwQQqjDI1VZ3DWsdQBX9T5LVttKLrliRrfoF0FRMBYl+5l1ZNS5Ccb9uw2uryMKhVTbXWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GyK7utUd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773950609;
	bh=Mwk77xis2n3Xi3SnteeL2ohG2orQmcxYOHvsRcbmRzo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GyK7utUdQY5E5LXqW5mcaITv5umgd4AWM1M+WPt8otL4ejjp4T4VXPXwc4YVUGBUZ
	 2shvNNt9XtwjqfOhKiC9g2fj+jz7wspuKHJVd3AoAeRS3p8V1/uj9xcGfBGopWjPmZ
	 eQgJE11omY1jXJeyo6t6KYy/48PfZ/kz5HHovR2WxQSdimiLphVDz01ZcSJrVxbQtP
	 CaEev16x+bU7URDp/tjZSqrrwwcdzQ5HftZWNtpfXqyyPb4MGRCVT8HU2jGJLiPozw
	 u0l0R9NMijyiEeKDmWOzmbv0pP6vEkkSWOW/MvMIAFDiibepTP5wpW8R5I1L0lbNjJ
	 Y9Rmb+US9phNw==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 758BB17E0D91;
	Thu, 19 Mar 2026 21:03:26 +0100 (CET)
Message-ID: <996341171629763ec9ecc0db6da61319ee99a970.camel@collabora.com>
Subject: Re: [PATCH v3 02/14] media: mediatek: vcodec: add decoder
 compatible to support mt8196
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=
	 <Yunfei.Dong@mediatek.com>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, "nhebert@chromium.org"
	 <nhebert@chromium.org>, "nicolas.frattaroli@collabora.com"
	 <nicolas.frattaroli@collabora.com>, "daniel.almeida@collabora.com"
	 <daniel.almeida@collabora.com>, "benjamin.gaignard@collabora.com"
	 <benjamin.gaignard@collabora.com>, "sebastian.fricke@collabora.com"
	 <sebastian.fricke@collabora.com>, "hverkuil-cisco@xs4all.nl"
	 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Nicolas Prado
	 <nfraprado@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "frkoenig@chromium.org"	 <frkoenig@chromium.org>, "stevecho@chromium.org"
 <stevecho@chromium.org>,  "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"	
 <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>,  "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 19 Mar 2026 16:03:24 -0400
In-Reply-To: <44d55b13e2e9f8bbc57240c560eb5c70750e77fa.camel@mediatek.com>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
		 <20260211054149.27249-3-yunfei.dong@mediatek.com>
		 <6176231.DvuYhMxLoT@workhorse>
		 <ce23bec1765032aad25e036b46cf45eb97764ea0.camel@collabora.com>
	 <44d55b13e2e9f8bbc57240c560eb5c70750e77fa.camel@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FrnHTvwmYEsqtrvCIYp9"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-56373-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[mediatek.com,lists.infradead.org,chromium.org,collabora.com,xs4all.nl];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: DDB012D1EC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-FrnHTvwmYEsqtrvCIYp9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 f=C3=A9vrier 2026 =C3=A0 02:13 +0000, Yunfei Dong (=E8=91=A3=
=E4=BA=91=E9=A3=9E) a =C3=A9crit=C2=A0:
> I had already confirmed with kyrie, he had changed the compatible patch
> in mt8189's patch set. So I just need to add mt8196's compatible.
>=20
>=20
> https://patchwork.linuxtv.org/project/linux-media/patch/20260127024248.18=
406-3-kyrie.wu@mediatek.com/
>=20
> mt8189's patch set is based on this patch set(8196's).

I will ask to work the other way around. Kiril patchset is very close to be
ready, and once in, you should be able to rebase on top.

Note that this patch is miss-ordered, you should implement all the VCP/firm=
ware
part before you modify the probe function.

regards,
Nicolas

--=-FrnHTvwmYEsqtrvCIYp9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxWjAAKCRDZQZRRKWBy
9ArMAQDVgqfeQ32Oxh6+LvFyWrktt20lAWSdogk1BezddOC6mgD/cGIEIBvNjbWv
b3JO84r1cAky7hZHLayboQFUjo4INg0=
=J894
-----END PGP SIGNATURE-----

--=-FrnHTvwmYEsqtrvCIYp9--

