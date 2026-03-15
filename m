Return-Path: <linux-media+bounces-55818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKZeM6OhtmnnEgEAu9opvQ
	(envelope-from <linux-media+bounces-55818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 13:10:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511429098C
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 13:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B008301F19D
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 12:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D46834D916;
	Sun, 15 Mar 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOx05BHE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3116346A1D;
	Sun, 15 Mar 2026 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773576595; cv=none; b=lV7O9oubs0dOdGu9EQngvf7wjOaYtdqd1HcYy6y4xwLGqHSqtexrFQzUztfXHWpVrB/ISa9XDFvCikbvAVvSv6CdcPTVkS5TE0HDQjHpt1JD5VhsHDXmeqqfqnTxd6iuLjXczfbPuUzyCT9FPmgEoI37Y3FvRBXojkg5B+WioJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773576595; c=relaxed/simple;
	bh=kMnAv0hAsF+sY5CDNuXvfwH6pllo4bNiD0Kc14LYaCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cY9E24siwK8mQ2ip6VleNOgDAJ0XuFJ/2AOgbeIoXrxSmPI0mb74O3wVH4jz49qcr2cbapAQ4ZZuSrUnroq5lW9iGYgNPLQijPi+caM4Iwl6UWMTxpSTuu9ot2xX2D9u9gAusDRtc4Neg527ujs8XAkAzxZraF5aOcL7BcTgM3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOx05BHE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9889FC4CEF7;
	Sun, 15 Mar 2026 12:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773576595;
	bh=kMnAv0hAsF+sY5CDNuXvfwH6pllo4bNiD0Kc14LYaCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOx05BHE5rGVd6UwfAxoIT56Wx2mQiXYYuUur3NsKrWrsfwysMjgePuFS5UCuRttH
	 sbAzoAEcF53qI4zVspG5Pbyj/7+Bi7VulyEHWpbx/obtiX7aeGCUTdnGqX8yA86bx9
	 Jr2tZAYE/bWHDL5V0/Y6scryKvcIdsU5hGYcqNPIyGZ25DV3aCRS8LbBgfj8uYWEmK
	 2XxAHjduh/LBwtm64VGBqbgkCLKGCYjG6RQOOcUtCHpBYEIG8/FjfWFpyehiUqnAau
	 hV84NBSR+V2yVGIS7Gta5FArDmSZ0Oa4lE0n1LIwA7K952bnLQeURKdhKyYdVBYPjw
	 mQP4NxBJdpQbw==
Date: Sun, 15 Mar 2026 12:09:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
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
Subject: Re: [PATCH 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260315-geologist-fringe-c6b8c653a653@spud>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
 <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
 <20260313-quickly-imperial-47638c9f0d4f@spud>
 <20260313-coyness-jab-ff0c85654555@spud>
 <e064b4f2-a138-4ea9-aee4-93ac8af38f64@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nSCb7cCQ1MbL+UzG"
Content-Disposition: inline
In-Reply-To: <e064b4f2-a138-4ea9-aee4-93ac8af38f64@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-55818-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.5:email,devicetree.org:url]
X-Rspamd-Queue-Id: 5511429098C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--nSCb7cCQ1MbL+UzG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 09:00:37PM +0100, Michael Riesch wrote:
> Hi Conor,
>=20
> On 3/13/26 17:57, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 04:56:29PM +0000, Conor Dooley wrote:
> >> On Fri, Mar 13, 2026 at 04:20:44PM +0100, Michael Riesch via B4 Relay =
wrote:
> >>> From: Michael Riesch <michael.riesch@collabora.com>
> >>>
> >>> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
> >>>
> >>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >>> ---
> >>>  .../bindings/media/rockchip,rk3588-vicap.yaml      | 256 +++++++++++=
++++++++++
> >>>  MAINTAINERS                                        |   1 +
> >>>  2 files changed, 257 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-=
vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.=
yaml
> >>> new file mode 100644
> >>> index 000000000000..7fd4214921cb
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.y=
aml
> >>> @@ -0,0 +1,256 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/rockchip,rk3588-vicap.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Rockchip RK3588 Video Capture (VICAP)
> >>> +
> >>> +maintainers:
> >>> +  - Michael Riesch <michael.riesch@collabora.com>
> >>> +
> >>> +description:
> >>> +  The Rockchip RK3588 Video Capture (VICAP) block features a digital=
 video
> >>> +  port (DVP, a parallel video interface) and six MIPI CSI-2 ports. I=
t receives
> >>> +  the data from camera sensors, video decoders, or other companion I=
Cs and
> >>> +  transfers it into system main memory by AXI bus and/or passes it t=
o the image
> >>> +  signal processing (ISP) blocks.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - rockchip,rk3588-vicap
> >>
> >> Curious why this cannot share a binding with the existing 3568-vicap.
> >> Looks pretty similar binding wise at least.
> >> If it's an entirely different architecture or whatever, please mention
> >> that in your commit message.
> >=20
> > Looking further, it's using the same driver too...
>=20
> It's not an entirely different architecture (indeed it uses the same
> driver). There are some differences to the RK3568 and the PX30 (which
> uses its own binding as well BTW): apart from different resets and
> clocks that's mostly the notion of the connections to the ISP. But to be
> fair, as it turns out this boils down to two additional ports.
> Other recent SoCs (e.g., RK3576 or RK3562) will be a good match for the
> RK3588 binding, but then again exactly resets, clocks and ports may vary
> in that variants as well.
>=20
> Personally I find this variant-specific DT binding magic hard to read,
> and thus I went for a separate binding. That said, please let me know
> what your preference is and I'll arrange it that way. Not a hill I'd
> want to die on.


If all it really comes down to is the ports, I'd rather you added these
devices to one file, rather than having one for every related SoC.
The "magic" shouldn't be that bad if it is just ports, just some sort of
thing like

if:
  compatible:
    contains:
      const: foo
then:
  properties:
    port@5: false


--nSCb7cCQ1MbL+UzG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabahjQAKCRB4tDGHoIJi
0qShAQDtAk9uQ4qLF9H8qeCQKTdrdrxdrMgULNS8CATV2vUmcwD/eTsvwJk18F9d
dxxcNA+q2mvbNpttew+v9JzatA0jvQM=
=hCaH
-----END PGP SIGNATURE-----

--nSCb7cCQ1MbL+UzG--

