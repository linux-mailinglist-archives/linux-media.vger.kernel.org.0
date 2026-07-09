Return-Path: <linux-media+bounces-67198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UXPRIkPhT2qrpgIAu9opvQ
	(envelope-from <linux-media+bounces-67198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 19:58:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29071734132
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 19:58:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n5I29HUi;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67198-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67198-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5544C302DF8C
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 17:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593624DB55C;
	Thu,  9 Jul 2026 17:58:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C71B39937B;
	Thu,  9 Jul 2026 17:58:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783619885; cv=none; b=W2Q02dnpdy34/ticVoEZxbcjB8UWrsSwZQTSZXkKzrzH4/+hZSkq4dv+neM7J/+Mw3oWNyNjNyIC6tRmYcIKSht+Oe86ojYq0Y0IQZWM5fDBFROBFP4KpnIePCf/qOc8eN0lnSAiP9kBCHPW9uPG8YSaxTsxstgipcFxfEqZ54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783619885; c=relaxed/simple;
	bh=u4rzu6YfPIc1q+pM0Hh0Y2/NQqGaNFdiDn+QTvU16Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt2xDN2zUoQQcgnGNbU2uFnuJgKaxw1G14+l8iGaY7btE7vTLn279c0lo+z+MbIOXEOZXpgbftWA3fePw0LHHOHVZ2KATY1OuA4J0cZFc1fphst6fMg8+k/KaugjKsVis6t70HxCqHJqDNuh0OgNqT7XvQX362AmvOSHoHJsr1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5I29HUi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AC81F000E9;
	Thu,  9 Jul 2026 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619884;
	bh=LRJ1/OPtx1Iim/kW87V48kJYVXQps8lsYFvlD6icIBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n5I29HUiseWe37yvndAIEuS+lV5BsGhqvU4NXd/jsX4v+r7Ie4rxuX3TpupyHDj9W
	 sO04Mvgsk4+I0mSKt1FUxmbhmTIVqiYF2YuAbrRVUbnkGuh318xOJ6VgGlrXBXJlKl
	 mvb3uq4IdESiEZFShCt+6VGLmPb3IHD3rDIqUPOprQ1XcjptaeQFINqAE/SXvmm57R
	 98mark9lO/9yMWXUQETpA1Ty5RNwQhLJpCoCSrgP3WqqspWlcLBXvvgY0UtzA90Sq+
	 vANLKuP/VbEPkgC2MfgJx1nx1hvaxGtUyPjN6YdNw/MKdZWZM8iJimjAsqQa7+ELU1
	 C181nltTPgCuQ==
Date: Thu, 9 Jul 2026 18:57:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v9 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260709-octane-refold-37324d9f2aad@spud>
References: <20260709032657.25730-1-jianhua.lin@mediatek.com>
 <20260709032657.25730-2-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="APjTtQgaMDz/nB9h"
Content-Disposition: inline
In-Reply-To: <20260709032657.25730-2-jianhua.lin@mediatek.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:jianhua.lin@mediatek.com,m:nicolas@ndufresne.ca,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:sirius.wang@mediatek.com,m:vince-wl.liu@mediatek.com,m:jh.hsu@mediatek.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67198-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,mediatek.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,spud:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29071734132

--APjTtQgaMDz/nB9h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 11:26:54AM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG decoder block found in the
> MediaTek MT8189 SoC.
>=20
> Compared to previous generation ICs, the MT8189 JPEG decoder requires
> 34-bit IOVA address space support and only needs a single clock
> ("jpgdec") instead of two. Therefore, it is added as a standalone
> compatible string without falling back to older SoCs.
>=20
> Update the binding schema to include the new compatible string and add
> an `allOf` block with conditional checks. This enforces the single clock
> requirement for MT8189 while preserving the two-clock requirement
> ("jpgdec-smi", "jpgdec") for older SoCs.
>=20
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 49 ++++++++++++++++---
>  1 file changed, 41 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..13fb4fb61f2b 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -15,10 +15,10 @@ description: |-
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - enum:
> -              - mediatek,mt8173-jpgdec
> -              - mediatek,mt2701-jpgdec
> +      - enum:
> +          - mediatek,mt2701-jpgdec
> +          - mediatek,mt8173-jpgdec
> +          - mediatek,mt8189-jpgdec
>        - items:
>            - enum:
>                - mediatek,mt7623-jpgdec
> @@ -32,13 +32,16 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> +    minItems: 1
>      maxItems: 2
> -    minItems: 2
> =20
>    clock-names:
> -    items:
> -      - const: jpgdec-smi
> -      - const: jpgdec
> +    oneOf:
> +      - items:
> +          - const: jpgdec
> +      - items:
> +          - const: jpgdec-smi
> +          - const: jpgdec
> =20
>    power-domains:
>      maxItems: 1
> @@ -51,6 +54,15 @@ properties:
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for de=
tails.
>        Ports are according to the HW.
> =20
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle to the local arbiter (SMI LARB) node. This explicitly
> +      describes the hardware topology where the JPEG block is connected
> +      to a dedicated SMI LARB for memory bandwidth arbitration. It is
> +      required to accurately represent the hardware connection independe=
ntly
> +      of the IOMMU.
> +
>  required:
>    - compatible
>    - reg
> @@ -60,6 +72,27 @@ required:
>    - power-domains
>    - iommus
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8189-jpgdec
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +      required:
> +        - mediatek,larb
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2

Please add a mediatek,larb: false here too.

pw-bot: changes-requested

Thanks,
Conor.

> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.45.2
>=20

--APjTtQgaMDz/nB9h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/hJgAKCRB4tDGHoIJi
0sywAP4/3MErasyHV912BqopkkvO7NXQwYknCYOiZVu8kxtNtwD+Kqr61fQW/M2k
AvZSQrEqRK2jJ144zH8+IVUJ/w6DxQc=
=STFS
-----END PGP SIGNATURE-----

--APjTtQgaMDz/nB9h--

