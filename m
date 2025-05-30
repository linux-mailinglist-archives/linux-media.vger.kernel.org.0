Return-Path: <linux-media+bounces-33705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F94AC9545
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 19:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D92F77B2EBD
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 17:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD542620C4;
	Fri, 30 May 2025 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h01FH2fZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA987275860;
	Fri, 30 May 2025 17:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627556; cv=none; b=MRXodPPXKnyRpPClcnoj5THdtc0afB/MekFvs36rQMyr/XPuX1V4YOd2+0/1ctWPGVIKWOjGjfnxOFR8oDvkoRL03kas40F6nFSyn0L+zWZKYa0+wndj8RO6A2LP+Jkd/IydEFW7XqIWu8nYiX5VfquDFwea7YxRA1v2KUwt27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627556; c=relaxed/simple;
	bh=WAD/ifSiq2fAR9i0TQSLdHv20w5bxFy9S4A+NHm69h0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Q4BOvh7z/IwWZVSxinCH+YxXWFxBueTCmMtE4vsRL+dai+Whq5idX+QtpCBMLSFDkWut4KKu+0O7BqioIa/MHwi5StB5Nfqjf1coHFEDiMhG0t3Fhd0YL2aZqRhWRsTVJ5C1TBPWhRZNpDL0pS0LpgUUlO4/cQviap572eBdmcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h01FH2fZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B6F82E;
	Fri, 30 May 2025 19:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748627519;
	bh=WAD/ifSiq2fAR9i0TQSLdHv20w5bxFy9S4A+NHm69h0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h01FH2fZbv56YI7SsWnjCdLdkXvXC+NanrNuuWz3cr/cvPyry8sxhhSwJ8STWDsIr
	 9Wg+Gsz8s8OVlsdgLYDmlKfOSQqJloIlnHGG4yrLGaTA+pDEJIMHYGXQz2qu0dfbOO
	 SRQA4jnCEjqkq0PEvFTnz9DkC/j6h82nMN55jZyY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: renesas,fcp: Document RZ/V2N SoC
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh@kernel.org>
Date: Fri, 30 May 2025 18:52:24 +0100
Message-ID: <174862754481.2225057.10634069595749699787@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Prabhakar (2025-05-30 16:41:47)
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The FCPVD block on the RZ/V2N SoC is identical to the one found on the
> RZ/G2L SoC.
>=20
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/V2N SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,fcp.yaml
> index 5ed9427fb757..074be99ca004 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -30,6 +30,7 @@ properties:
>                - renesas,r9a07g043u-fcpvd # RZ/G2UL
>                - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
>                - renesas,r9a07g054-fcpvd # RZ/V2L
> +              - renesas,r9a09g056-fcpvd # RZ/V2N

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>                - renesas,r9a09g057-fcpvd # RZ/V2H(P)
>            - const: renesas,fcpv         # Generic FCP for VSP fallback
> =20
> --=20
> 2.49.0
>

