Return-Path: <linux-media+bounces-63637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4te+KpZbIGpv1wAAu9opvQ
	(envelope-from <linux-media+bounces-63637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 18:51:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510B639EDE
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 18:51:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ULuDGwSS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63637-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63637-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E274A34521EC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 16:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063873E171C;
	Wed,  3 Jun 2026 16:15:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8BF3E3173;
	Wed,  3 Jun 2026 16:15:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503307; cv=none; b=iQbWjdnNNzwhmVsoc11pY4xIkiDpVvERIASFIFOldqYIN/lDe30oeSkq7i5m/Q1rfbO5zMc5ltyM3tRmDI0988B675d0/Yv3QbUG3fgD7ShwdG2KLAq/f5U45m/+DrnFrQijJBOagmJKLmyWPbiPdbavxoQgh61hddw5gWVXc7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503307; c=relaxed/simple;
	bh=gOWlk9RrsUqA0VtrQwobuwXG95wlu4l+J2QFMgkdGDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcOXru+Os9FZeM4Xns06BgV7KRKNXaMERTV2u35DefqosBUYdAgVGX54TbqPMorYedsLOK8S6wLGW6VpbC7KCc3/XHPH/iQGf3DV30PWtvgWl+j8XI7YXNYuBz+eVnxhMOOkbUDLe1Nh6pXBQF90CNspzb4IN/EkqM83ayDRMzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULuDGwSS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D574D1F00898;
	Wed,  3 Jun 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503301;
	bh=dwQAgj5+iT5nXjtC4meACtY9EVtZ0m/GsoPdDY/zB1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ULuDGwSSLIRN0w9IuEJ5JU6MC9AQGP/tI3k6TfNL25n5+MhzzAvJyNgp786DYy4qd
	 SU+2ZsMvjSEWLR06CcWK9d4SpnJ8j+YSbw+9huywRO+70nf1qBP8vzVdp0xu3wgA8r
	 R/Sd5Hl8C1MSFYa2Vs7SDPXHG5A3/nlyhk7eIewmDh+WRIfXivRE8AyEiA8ifvB3L6
	 MlQFwcIw3MftF1zdN13bQZDXQP0KzZBuxMZ+w65qe8Fd6UwM70TLAwr/jSK4kopAFx
	 AgyniZEqiZSJXMXe16mZawh39Ow3S15EGMEE4lAUd8excYWx/V3u54sxyTsvx5xo63
	 gNmSCy/Mk1NCg==
Date: Wed, 3 Jun 2026 17:14:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Fei Shao <fshao@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Irui Wang <irui.wang@mediatek.com>, Fan Wu <fanwu01@zju.edu.cn>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260603-pentagram-unleveled-8729d0003aa7@spud>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
 <20260603084045.17488-12-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t67lQ/zxp5PMEWTK"
Content-Disposition: inline
In-Reply-To: <20260603084045.17488-12-kyrie.wu@mediatek.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63637-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:kees@kernel.org,m:hverkuil+cisco@kernel.org,m:haoxiang_li2024@163.com,m:fshao@chromium.org,m:wenst@chromium.org,m:laurent.pinchart+renesas@ideasonboard.com,m:sebastian.fricke@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:rongqianfeng@vivo.com,m:jacopo.mondi@ideasonboard.com,m:irui.wang@mediatek.com,m:fanwu01@zju.edu.cn,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:sakari.ailus@linux.intel.com,m:tzungbi@kernel.org,m:tfiga@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:hverku
 il@kernel.org,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,chromium.org,163.com,ideasonboard.com,pengutronix.de,vivo.com,zju.edu.cn,vger.kernel.org,lists.infradead.org,linux.intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spud:mid,vger.kernel.org:from_smtp,mediatek.com:email,collabora.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0510B639EDE


--t67lQ/zxp5PMEWTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 04:40:41PM +0800, Kyrie Wu wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
>=20
> The MT8196 decoder differs from previous generations in several
> key aspects, most notably in its use of VCP instead of SCP.
> Additionally, the MT8196 enhances codec capabilities by supporting
> HEVC Main10 profile decoding. To accommodate these hardware changes,
> the binding constraints specify a total of 12 clock inputs,
> consisting of 9 decoder clocks and 3 VCP interface clocks,
> along with 2 power domains covering both the decoder and VCP
> subsystems.

I'm pretty pretty confused by this statement about constraints, since
there's none added?
The vcodec-dec node doesn't even seem to permit clocks at all?

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index bf8082d87ac0..74e1d88d3056 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
> =20
>    reg:
>      minItems: 1
> --=20
> 2.45.2
>=20

--t67lQ/zxp5PMEWTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBS/QAKCRB4tDGHoIJi
0oufAP9lJNwOAT7VUSW+zV4U2z3qVv4MRzJDqgtx5EAGueP/8QD/cTypdP6H/JNn
OwufpOGYDIsoQ8ZXAYdX5gTK/xBsNwI=
=W/Ot
-----END PGP SIGNATURE-----

--t67lQ/zxp5PMEWTK--

