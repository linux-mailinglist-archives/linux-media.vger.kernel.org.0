Return-Path: <linux-media+bounces-53760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHH7JzPgoWlcwgQAu9opvQ
	(envelope-from <linux-media+bounces-53760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 19:19:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 507FE1BBE8E
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 19:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF29F3056524
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3566637419A;
	Fri, 27 Feb 2026 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEpOnVK/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742936B075;
	Fri, 27 Feb 2026 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216362; cv=none; b=ZnnYYKS7Gwn4VUROAjKnta5qmcftQcYzmSVoFoY9NZpALFfyFPHxHJCVIutfLD+LLITUzbY33xzb9L2bcsnOongqIg48UvunlSRiR+sfrWCLNKwLcdSn1UX71N9Lc/mGvKVcWLpX9OMO2maAmdVXt78PbDcw4p5WMgmtwTe7o6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216362; c=relaxed/simple;
	bh=V0bfSsuRknInB6xRH9NssiVSDGKhBRnDXYF8T1wSQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fi4+jG0YIC1SCensuDaB52GN4EQNpryAO6Y5dOctH0n3sZCKUIFrq4NgqzA1bqzSnoJb1ubTCF6vP/0KhaSPJYkprwtK0kDZA7pK7uQj1vIO1PD7PvDV0VZs3h++qKNDO4IAjDscFczyXts83PdQnSBJf/dqxcR/fqmbxeX7YKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEpOnVK/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C240FC116C6;
	Fri, 27 Feb 2026 18:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772216362;
	bh=V0bfSsuRknInB6xRH9NssiVSDGKhBRnDXYF8T1wSQi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEpOnVK/8rc6kLoqa/5aArPRS+jrh/bzXy4cqB8hVl0YDfpu3HqPkKwbOrWuFSgfN
	 Rt+uyiAsuXct2FsJCDpPdBHWjXC0nEXUdHV32zGBVFfNksxryt17SDZ1/20L7kx4Eq
	 drIjlnqOYPcQlsS4SbgPZxpGJwR3h/9ZZc4hSr21XQgfKLEuxBVEBKGoagfSvVD53Q
	 gI1M8HMrceysiN52IL/WQ2x92JoInBl+H5TZFIYtzyH+OIBxsS9BQo11hAR+Qqxrrk
	 jwSGrYxpqiK73DhhIELDK1Da+n7lGyEmuwVNpXHfINs31Y1V5xQRtBHsp7lgQXrnLO
	 tCkA4NO3IQ+kQ==
Date: Fri, 27 Feb 2026 18:19:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: media: ti,ds90ub953: Add new range
 for remote GPIO data
Message-ID: <20260227-consensus-outbreak-2bda246886e7@spud>
References: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
 <20260227-ds90ub953-v4-1-dea596205f9e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wO71g9rmMq2rMVfq"
Content-Disposition: inline
In-Reply-To: <20260227-ds90ub953-v4-1-dea596205f9e@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53760-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 507FE1BBE8E
X-Rspamd-Action: no action


--wO71g9rmMq2rMVfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 07:21:10PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>=20
> The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
> output, it can be programed to output local data or remote data coming
> from the remote compatible deserializer.
>=20
> Make a different GPIO range for remote ones.
>=20
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 ++++++=
--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yam=
l b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..0444f3739b775848d17adfebc=
4158e83b69adf9c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> @@ -20,9 +20,13 @@ properties:
> =20
>    '#gpio-cells':
>      const: 2
> -    description:
> +    description: >
>        First cell is the GPIO pin number, second cell is the flags. The G=
PIO pin
> -      number must be in range of [0, 3].
> +      number must be in range of [0, 3] when enabled as an input.
> +
> +      If enabled as an output, the GPIO pin number must be in range of
> +      [0, 7] and [0, 3] for local GPIO data, [4, 7] for GPIO data coming
> +      from remote compatible deserializer.


Actually no, I take my ack back. This doesn't make sense to me, I think
the wording needs improvement. I think it might be as little as:
	If enabled as an output, the GPIO pin number must be in range of
	[0, 7]. [0, 3] are for local GPIO data and [4, 7] for GPIO data coming
	from remote compatible deserializer.


--wO71g9rmMq2rMVfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHgJQAKCRB4tDGHoIJi
0t3zAP99ZwKieph2a6yb8bAid0TnKtimYlllwcSNHImjVr3daQD/Q6+EdJ7XnyCc
LFEaQUV9OUKHLIiECgaH5SgfHJJSUQI=
=ptI0
-----END PGP SIGNATURE-----

--wO71g9rmMq2rMVfq--

