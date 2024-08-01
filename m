Return-Path: <linux-media+bounces-15686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA694496F
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 12:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B6D1F238E8
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 10:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AEB18452D;
	Thu,  1 Aug 2024 10:36:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138A183CC7;
	Thu,  1 Aug 2024 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722508603; cv=none; b=aQpiynYPsEtSOLI09UV5etzG4m6NeN+ebGlDklHbFNa0rQC89LgHWtjqPvgBIALgiqe2pzELiNosbzxGOuXyOkSzcMqrXbFaYLEEncMHZYUX6bgFx+fZWGzBq66rbFezNtClso5vXGmHTNx6aGO5EzWweSkUg+D5ZYixqgs20Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722508603; c=relaxed/simple;
	bh=DL+vKZw4y5x8U/Jw2V7jmbA9F+BlmJ66B3Ipe2bD0RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D20crcSyOFnXl0FTzwdRnczWgMa/Xnn5I4lgho7OpKtr+22VYcDdNPZ8LcPlPKROFXqim1BTiXKTwMtEFQzaZnB+u9Z0MV6GCqQ/KFqfClWtbE4J3FT1jO9LSx4uHQTUDGAEUuZBnrZ0aoV6lBKxmtKpYNK6QNKCyVZcVxc8lF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86192c.versanet.de ([94.134.25.44] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sZTAb-0005uf-Nz; Thu, 01 Aug 2024 12:36:29 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/3] dt-bindings: media: rockchip,vpu: Document RK3128 compatible
Date: Thu, 01 Aug 2024 12:36:28 +0200
Message-ID: <23279441.ssLaC8jLEa@diego>
In-Reply-To: <20240528083747.z55laxnmioorzaru@basti-XPS-13-9310>
References:
 <20240523185633.71355-1-knaerzche@gmail.com> <3639993.hdfAi7Kttb@diego>
 <20240528083747.z55laxnmioorzaru@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hey,

Am Dienstag, 28. Mai 2024, 10:37:47 CEST schrieb Sebastian Fricke:
> On 28.05.2024 10:19, Heiko St=FCbner wrote:
> >Am Donnerstag, 23. Mai 2024, 20:56:31 CEST schrieb Alex Bee:
> >> The integration for this SoC is similar to RK3066/RK3188.
> >>
> >> Document it's compatible.
> >>
> >> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> >
> >Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >
> >Media people, can you apply this patch alone from the series?
>=20
> Yes, will do got this on my list already :).

as I'm going through my list of "waiting for ..." patches,
is this still on the radar?

As far as I can tell, it didn't make it into 6.11-rc1, but 6.12 would be
nice :-)


Thanks a lot
Heiko



> >> ---
> >>  Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml=
 b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> >> index c57e1f488895..d1b47b14ca57 100644
> >> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> >> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> >> @@ -26,7 +26,9 @@ properties:
> >>            - rockchip,rk3568-vpu
> >>            - rockchip,rk3588-av1-vpu
> >>        - items:
> >> -          - const: rockchip,rk3188-vpu
> >> +          - enum:
> >> +              - rockchip,rk3128-vpu
> >> +              - rockchip,rk3188-vpu
> >>            - const: rockchip,rk3066-vpu
> >>        - items:
> >>            - const: rockchip,rk3228-vpu
> >>
> >
> >
> >
> >
> >
>=20





