Return-Path: <linux-media+bounces-59034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP8vHhNg4mnI5QAAu9opvQ
	(envelope-from <linux-media+bounces-59034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:30:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA3A41D220
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D26131FFBE6
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3253D355F36;
	Fri, 17 Apr 2026 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAjE8slq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922EB3491C4;
	Fri, 17 Apr 2026 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776442929; cv=none; b=EEl8XalFnY08WR4FxILZJO5TYt5t0ZupldLZqt2cOqc7ns3K7jb/OMpOvRn3Dnlqbv5XayYOGwp3lR7tfoFCW426Po+e0PXAqcXrdzDs2ONH+6jmY4KJxsCM/EEZuXSp+odbjmAsCVMqjKwHuY5xsnpJPbvJYrDvztqrch/Wkq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776442929; c=relaxed/simple;
	bh=egW6uHF4eK85Hi/etR9aA8Lh7/2sOL+cwSmZ8PG8Gr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7i+YQJoyHZuMb8NnUlzdT0G8zjVl7Sjhoo1mVWXQMVdFKYDfhnohzdNbaFnLWu+fyEIVO46PLWswDXofPPWbPDdjrY3RfE8j+OdyxNULaIqoiBMWDJd6bikwXNptDVAwJuc0daveHZFDTncrhKVRMEz9ZKKflez371OaBgUCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oAjE8slq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164A1C2BCB4;
	Fri, 17 Apr 2026 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776442929;
	bh=egW6uHF4eK85Hi/etR9aA8Lh7/2sOL+cwSmZ8PG8Gr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oAjE8slqT10r02Jkq/UXK6Kdkj3JB5VRdtK1k8ORy64oM77yRDN7qbQIKATWgsBN9
	 +fFnVE+KdJzN2hV07uY06YSdkRVq9BNCLIXZnMagW1/zEM3zLHV6AIWjLqS7WJ0/GB
	 jBbbvtgOljpAv+rS/hfMJR9TdU29LnbWcUMh1Jj5579VKSwMsE5yiJyDfxn8lMF3Ce
	 LxH+hlSq9mfuiR0u91ZZ1Mxuvd4VYcRGW8Ch65vw5mgftnDUK+8YYALFEWrfScN36A
	 COqa+LZTJWJSIA7Vf+rkptt0/xKAF7ocTbGkZ5/Ng6ycUkLHFi2Z1d1/KO+r2aQkRW
	 +aMGlDsy+4ZCw==
Date: Fri, 17 Apr 2026 17:22:03 +0100
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
Subject: Re: [PATCH v7 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260417-steersman-scowling-1b8923c3d6fc@spud>
References: <20260417100519.1043-1-jianhua.lin@mediatek.com>
 <20260417100519.1043-2-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SI+6e7v0m6f8SmPK"
Content-Disposition: inline
In-Reply-To: <20260417100519.1043-2-jianhua.lin@mediatek.com>
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
	TAGGED_FROM(0.00)[bounces-59034-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,mediatek.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EEA3A41D220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--SI+6e7v0m6f8SmPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 06:05:17PM +0800, Jianhua Lin wrote:
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
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 48 +++++++++++++++----
>  1 file changed, 40 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..fd895688a038 100644
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
> @@ -32,13 +32,20 @@ properties:
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
> +
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: a phandle to the smi_larb node.

This should be restricted to only the new platform.

> =20
>    power-domains:
>      maxItems: 1
> @@ -60,6 +67,31 @@ required:
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
> +          minItems: 1
> +          maxItems: 1

Constraints that duplicate the outtermost ones don't need to
be/shouldn't be repeated here. You only need the maxItems here and the
minItems in the else.

pw-bot: changes-requested

Cheers,
COnor.

> +        clock-names:
> +          minItems: 1
> +          maxItems: 1
> +      required:
> +        - mediatek,larb
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.45.2
>=20

--SI+6e7v0m6f8SmPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJeKwAKCRB4tDGHoIJi
0kqgAP97U/dCLPVLSL5QUuwO1PDi3nC/QrG3oONPZ0qzcA0Q5gEA41YDuwB2x+5b
Kaq5lytA+wheHyQALeOAnjtKDlX3RgA=
=5MTH
-----END PGP SIGNATURE-----

--SI+6e7v0m6f8SmPK--

