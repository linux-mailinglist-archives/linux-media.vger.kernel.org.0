Return-Path: <linux-media+bounces-33880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1DEACABA1
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7213B3A6A51
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5471E3DDE;
	Mon,  2 Jun 2025 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qBBzFnU6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57761E25F2;
	Mon,  2 Jun 2025 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857392; cv=none; b=P49nKvviqyXfLr447cacHpnDMBBE5jZAWfQ4BKQPy2Zrqv/dKgssVtQRc7fI3JXJV0Ihsl5jCYYn1QFpbw3skId+veb65UGOWY2Bd/c/4xOMhkPSp6fziKsGjOJr2S0hNeATmLLO3OsVf4pz/ArZHE6xj+TIFga345MEXRcqGNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857392; c=relaxed/simple;
	bh=vIRe6cKd12B8t+yiWvuIHeSQLk9JJzo9vl8Uowwj+Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkMJih6NxHFDgrwqrtCWYHISQwl0xiNT+GCvkbj9E4dEDcJaU/NGuneGqnGCxa8DSd/eNOzjRyNf26C7aQWCSA/zYI2/6M31lAOHcCi7boyRRV9GR2DFuEkyzMm08Jwdx395QChpLtJj9Du14/X2v3rh56BGloJLB44kikIL5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qBBzFnU6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB80D379;
	Mon,  2 Jun 2025 11:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857388;
	bh=vIRe6cKd12B8t+yiWvuIHeSQLk9JJzo9vl8Uowwj+Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qBBzFnU6u/rfHefpoodyZXzLZvDGMPy770jkK2/Za+gRnRhB/TQh5D7Juu8Zkd4gC
	 PXzb0MOWlWgWAU+Z3UFo6o5yFle6Tq5Y4Gxn314osaKjxef6pbTsiPCcPnjES833vW
	 a/Bgn2vjaSu2yM7xSsM4glcRi+PxSt4gWY5f6mvk=
Date: Mon, 2 Jun 2025 12:43:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: renesas,fcp: Document
 RZ/V2N SoC
Message-ID: <20250602052028.GB11750@pendragon.ideasonboard.com>
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, May 30, 2025 at 04:41:47PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The FCPVD block on the RZ/V2N SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/V2N SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index 5ed9427fb757..074be99ca004 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -30,6 +30,7 @@ properties:
>                - renesas,r9a07g043u-fcpvd # RZ/G2UL
>                - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
>                - renesas,r9a07g054-fcpvd # RZ/V2L
> +              - renesas,r9a09g056-fcpvd # RZ/V2N
>                - renesas,r9a09g057-fcpvd # RZ/V2H(P)
>            - const: renesas,fcpv         # Generic FCP for VSP fallback
>  

-- 
Regards,

Laurent Pinchart

