Return-Path: <linux-media+bounces-56375-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NE+DlhavGlxxQIAu9opvQ
	(envelope-from <linux-media+bounces-56375-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:19:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFB2D2035
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3B5231C82C8
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A753A1685;
	Thu, 19 Mar 2026 20:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XSn1UM0i"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82DB37C936;
	Thu, 19 Mar 2026 20:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773951451; cv=none; b=fd6XHkk21vK6xzcm0E/7x9VjAUdoJ+VFbTmN9Txfm/4SHokHTUulrZGmP24C/E08uDSHAF9IZZ8okdNbsAfBYl0mX/4DEQcxrH68rhneUDbVIf/xoMZDXrkTKCfVGuZaucA30SyMg54acCjXeVqRhVvRMjQngjczq8j5l0uK1eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773951451; c=relaxed/simple;
	bh=SJc82/8eM3kVxshNmxbCcuC7mGyl2ALhI0FOpd/mDSk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u6KgLFTexqaccmpx4don16TOVHwU0c8Uoo2f0oIHcyB5IHtfSu6cmsVjPLdm9Zaxqto4OmzqKogsdd0/VegxXOjNeUYJP+mlOlRCNKITDlDKpgSIEx+fnBQ4mW/8A8t1qUI81UVhPYC6eCydB8EeZOQwA3bQpZkLWgQU1rtchR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XSn1UM0i; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773951444;
	bh=SJc82/8eM3kVxshNmxbCcuC7mGyl2ALhI0FOpd/mDSk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XSn1UM0iMvGkIMuXoM2z3x7folqKQErwqtBMI9oBsak16upaIuzzNgOl6EzCBLAfH
	 mpoPqZ7DjyK/cCE7f8F3bWTuJKhSYJ54UyhJgZaIem4fGZr/skHi72K31lXuDUQRPU
	 BlOS+PeRcSfXDHRo+IIIZzuNSBf3zjRwJ9/bj2SeHFUtER+fIncBDlHJ6spw/6UmNY
	 g6HS5JNO6R1SsSxzZcweXNy007VW/dP/GnIV6sL7NyDGnMbHl7RW3nCrtjfhlQ22/c
	 0w9//wKoZYnDqJj4KnJJWmakHNSmLo4r6nHWtfnfmYm/RsberLWKd5VuTdMF0bIk5X
	 +3hfjF+G2XJ9w==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F7A517E0CF3;
	Thu, 19 Mar 2026 21:17:20 +0100 (CET)
Message-ID: <23f0c1f7a9656562d2be6c1ef3439f484ac76f92.camel@collabora.com>
Subject: Re: [PATCH v5 5/6] media: dt-bindings: mediatek,vcodec-encoder: Add
 MT8196
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	wenst@chromium.org, angelogioacchino.delregno@collabora.com, Tiffany Lin	
 <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng	
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 19 Mar 2026 16:17:19 -0400
In-Reply-To: <20260302035244.8994-6-irui.wang@mediatek.com>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
	 <20260302035244.8994-6-irui.wang@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-bBjSb7ezX0aFK1Nuxe2Z"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56375-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[mediatek.com,xs4all.nl,kernel.org,gmail.com,chromium.org,collabora.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid,mediatek.com:email]
X-Rspamd-Queue-Id: BAAFB2D2035
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-bBjSb7ezX0aFK1Nuxe2Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 mars 2026 =C3=A0 11:52 +0800, Irui Wang a =C3=A9crit=C2=A0:
> Add support for MT8196 video encoder which uses VCP (Video Co-Processor)
> for firmware management. Unlike previous platforms that use SCP/VPU, MT81=
96
> requires VCP to load and execute the video encoding firmware, with the
> encoder communicating through VCP to perform encoding operations.
>=20
> Add the "mediatek,mt8196-vcodec-enc" compatible string and introduce
> the "mediatek,vcp" property to reference the VCP device, which is
> required for MT8196 encoder operation.
>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Please, keep the bindings early in your future patchset. I need read the bi=
nding
first to understand what is the code pulling from the DT. I'll move when
applying.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> ---
> =C2=A0.../media/mediatek,vcodec-encoder.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 22 +++++++++++++++++++
> =C2=A01 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> encoder.yaml
> index ebc615584f92..72698456374a 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> @@ -24,6 +24,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8188-vcodec-enc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8192-vcodec-enc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-vcodec-enc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8196-vcodec-enc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8186-vcodec-enc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-vcodec-enc
> @@ -58,6 +59,13 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Describes point to scp.
> =C2=A0
> +=C2=A0 mediatek,vcp:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reference to the VCP (Video Co-Processor)=
 device that loads and
> executes
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the video encoding firmware. The encoder =
communicates with the firmware
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 through VCP to perform encoding operation=
s.
> +
> =C2=A0=C2=A0 power-domains:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> =C2=A0
> @@ -76,6 +84,20 @@ required:
> =C2=A0=C2=A0 - iommus
> =C2=A0
> =C2=A0allOf:
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8196-vcodec-enc
> +
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,vcp
> +=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mediatek,vcp: false
> +
> =C2=A0=C2=A0 - if:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:

--=-bBjSb7ezX0aFK1Nuxe2Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxZzwAKCRDZQZRRKWBy
9IqXAQDF76U2cvFTsz2ZaZxdPMcC9u+fE/gNu8I5yWnHNbtYIQD/WcXLJEafGTUM
XIIWRgQEBp85aiMUpBpYHVj4Ms6qdwE=
=NuJr
-----END PGP SIGNATURE-----

--=-bBjSb7ezX0aFK1Nuxe2Z--

