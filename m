Return-Path: <linux-media+bounces-56227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDZVECjtuml0dAIAu9opvQ
	(envelope-from <linux-media+bounces-56227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:21:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A779F2C1263
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3985F32D6BCA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCBB35A392;
	Wed, 18 Mar 2026 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlkHo54T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF67435839D;
	Wed, 18 Mar 2026 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773856377; cv=none; b=QIk3GMg8O9F/GwivrJ1Pf9ow2W2DDwLrCp4jHD7fCD9ncgGglAS8G4ctk8PSVUCD2lNmNCoE2OXSW3DG+shXzXBnl4LvJuPjE5T7gJmlOqBFuZXe5l1YgXX29iwqrhb1dFNOztSfJny98O9Jl4ll8BKwJrD307lniXE1by1UarM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773856377; c=relaxed/simple;
	bh=7RhELfoamd+1f1X8vuupz5lvW6wqDowxnnhYEeX4noA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmJ5pLyNiWgAXPkxX6NIhYLjTMHFyZlsxe0prv5NwdPuBPGTBu3WtMiQECnOhs9UqjnTFtDGIo+8U2jnQCohlxBiQzVJV1c4LTMhnxuOizAVOQ1kYbJgXnxNsoz+5FnsV6RmHW2hSiFMNrUYnpANmYk4uP497CrVKEhVrx20WrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlkHo54T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97A2C19421;
	Wed, 18 Mar 2026 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773856376;
	bh=7RhELfoamd+1f1X8vuupz5lvW6wqDowxnnhYEeX4noA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlkHo54TQPrdvX0KKoD5mQgS7R2ornPusMzZgXsAAjpK1wR14Q25dhL3FoO+NFRne
	 Tge8FZzhYFWJqLKEYm7pBjmeYQpMCnPNJcu702ZsOxL166yonfYSPEBekK5NZ53Zwa
	 KduLdF/9llG0ap1QNfaP//L1vXJ6QSbXyJAoZOW/5rpuqFVT/XB85bAKP202tlYa/H
	 cHsVssPe7EKhKlVl7iJB7wZaGMII93Ft8lagmNbsYIExi7BWTFxsGVQ1YfIohNt9uo
	 3/9pR8anHFvNTSpZupNKdtM4QCh5zOEQa43YtZBe0/vH4JfJQkmhyby5QLIrwyj+Z/
	 DdKRUi27K2cVw==
Date: Wed, 18 Mar 2026 17:52:50 +0000
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260318-mumbo-lumber-b550932a5423@spud>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-2-77de5ee9048e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jVdB2zejn0FZqmel"
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v2-2-77de5ee9048e@collabora.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56227-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A779F2C1263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jVdB2zejn0FZqmel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 10:32:20AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
> To that end, make the existing rockchip,rk3568-vicap documentation
> more general and introduce variant specific constraints.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 191 +++++++++++++++=
+++---
>  1 file changed, 167 insertions(+), 24 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vica=
p.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> index 18cd0a5a5318..15a889ff8e52 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -15,9 +15,15 @@ description:
>    the data from camera sensors, video decoders, or other companion ICs a=
nd
>    transfers it into system main memory by AXI bus.
> =20
> +  The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
> +  counterpart, but features six MIPI CSI-2 ports and additional connecti=
ons
> +  to the image signal processor (ISP) blocks.
> +
>  properties:
>    compatible:
> -    const: rockchip,rk3568-vicap
> +    enum:
> +      - rockchip,rk3568-vicap
> +      - rockchip,rk3588-vicap
> =20
>    reg:
>      maxItems: 1
> @@ -26,37 +32,23 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    items:
> -      - description: ACLK
> -      - description: HCLK
> -      - description: DCLK
> -      - description: ICLK
> +    minItems: 4
> +    maxItems: 5
> =20
>    clock-names:
> -    items:
> -      - const: aclk
> -      - const: hclk
> -      - const: dclk
> -      - const: iclk
> +    minItems: 4
> +    maxItems: 5
> =20
>    iommus:
>      maxItems: 1
> =20
>    resets:
> -    items:
> -      - description: ARST
> -      - description: HRST
> -      - description: DRST
> -      - description: PRST
> -      - description: IRST
> +    minItems: 5
> +    maxItems: 9
> =20
>    reset-names:
> -    items:
> -      - const: arst
> -      - const: hrst
> -      - const: drst
> -      - const: prst
> -      - const: irst
> +    minItems: 5
> +    maxItems: 9

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-vicap
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4

Anything here that repeats the outermost constraint should be dropped,
so no minItems here..

> +
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: hclk
> +            - const: dclk
> +            - const: iclk
> +
> +        resets:
> +          minItems: 5
> +          maxItems: 5

=2E..or here...

> +
> +        reset-names:
> +          items:
> +            - const: arst
> +            - const: hrst
> +            - const: drst
> +            - const: prst
> +            - const: irst

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-vicap
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5

=2E..or maxItems here...

> +
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: hclk
> +            - const: dclk
> +            - const: iclk0

> +            - const: iclk1
> +
> +        resets:
> +          minItems: 9
> +          maxItems: 9

=2E..or here.

> +
> +        reset-names:
> +          items:
> +            - const: arst
> +            - const: hrst
> +            - const: drst
> +            - const: irst0

Were you willing to reuse "irst" for the 0th irst, all the repetition
wouldn't be needed. I assume it represents the reset for the port at
address 0, so it wouldn't even be a different meaning on each device.

> +            - const: irst1
> +            - const: irst2
> +            - const: irst3
> +            - const: irst4
> +            - const: irst5
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.39.5
>=20
>=20

--jVdB2zejn0FZqmel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabrmcgAKCRB4tDGHoIJi
0kE+AQCiO8R6sREJ16rGB4nk0o2txYYzKiWx5flN3eu4tYAL+gD/RBcvFZzkcWgN
cce8jKdYN4Rihg2tKuLCrikL1c2BDAw=
=sCrK
-----END PGP SIGNATURE-----

--jVdB2zejn0FZqmel--

