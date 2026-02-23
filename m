Return-Path: <linux-media+bounces-53251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBy+ErbdnGl/LwQAu9opvQ
	(envelope-from <linux-media+bounces-53251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 00:07:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0117ED72
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 00:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E12530A5DC7
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E052C37E2EF;
	Mon, 23 Feb 2026 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="i+myjy45"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB637D133;
	Mon, 23 Feb 2026 23:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887941; cv=none; b=q8bcY5AM1IybQ+MCtx7vEGee8Jfg7prhyIDCg/tfYlL5L41xujwW6bWgJB4AsY06SlyUBWNyl07xTQGXzo8qD5yMIY/ryhJtkA+ztbfiyA+1+Z8mkt4/QIfObrDpQjZP7hLrmfb49uh0RpYE2ntKTI7budUdkkqazMGtNZ7VliQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887941; c=relaxed/simple;
	bh=M4DUt6UZzPT695Lc+ver3c0UWKVFR/V7kUX/J4AYrmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBgFwSCZubnDOlSy7mLmrd57k4IqD64QBg+elBk3fLanJJuoonRluUPgHPHr0EIo3R+cUW14w3OOLrfb64zNBRjz+D4kJP2vu7/bxvAHGNPHB13PhwtMGEBxywJ0UM6g2F/jESkGTT2QnDbERAlfqtX/FQvxNYrp/wFulA29ozY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=i+myjy45; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qpVti8+vQOV41DfAG3g3weD8DWF02pCo1W0kB+w+a5o=; b=i+myjy45ekhukDQ4eO+7yvtmiq
	HY6/bhyCpSYU5KqLbeXBzhd7WqKtHbdccRUhvswbV5ijOZp+U0sy7sL9xcskQMLt986TAW2K5VSRK
	ZnhfncxuaDDEprHps0arI2oOWpXx1iErOKBI7OwJHl8DyYtUOuj8ZK+Ta8Fn/uRwWTDp+sqeL7z38
	ygu+3xe+v6jPQiKW1e0pm3ptbAZ1ksE+uYq7c2ApepgzovPh9c11E9HL1abYCCuT29dyxHP303+vg
	TCOyUO4o+zJNcLXO8Se0YW6deWZSvmwcQR2QRu7sbfknTTrkW4wzYjpsq3xbHhifl4nskSXXlE5EO
	AZUhZJIg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
Subject:
 Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct reg-names order
 for RK35{76,88}
Date: Tue, 24 Feb 2026 00:05:19 +0100
Message-ID: <14788642.ZYm5mLc6kN@diego>
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
References:
 <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53251-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CEF0117ED72
X-Rspamd-Action: no action

Am Montag, 23. Februar 2026, 20:49:49 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Cristian Ciocaltea:
> Update 'reg-names' property to allow providing the register blocks in
> the expected address-based order for RK3576 & RK3588 video decoder and,
> consequently, fix some DTC warnings.

nit: I think this could use an additional explanation, describing that the
individual components got moved around inside the vdec io block
at least between rk3588 and rk3576.


> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.
>=20
> Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video=
 Decoder bindings")
> Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Deco=
der bindings")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 13 ++++++--=
=2D----
>  1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..2d3164a2882b 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -28,16 +28,15 @@ properties:
> =20
>    reg:
>      minItems: 1
> -    items:
> -      - description: The function configuration registers base
> -      - description: The link table configuration registers base
> -      - description: The cache configuration registers base
> +    maxItems: 3
> =20
>    reg-names:
> -    items:
> +    oneOf:
>        - const: function
> -      - const: link
> -      - const: cache
> +      - items:
> +          - const: link
> +          - const: function
> +          - const: cache
> =20
>    interrupts:
>      maxItems: 1
>=20
>=20





