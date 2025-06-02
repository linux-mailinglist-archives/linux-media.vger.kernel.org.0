Return-Path: <linux-media+bounces-33881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A813ACABA6
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98DA3A813B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359E11E5B73;
	Mon,  2 Jun 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fksqjreQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E1A1E25F2;
	Mon,  2 Jun 2025 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857401; cv=none; b=f6To3oKRKe7tPj/y3lML+l+IV2mlLmnmjA0OsYBRGL0OnjLEhkIZL9Z5TTdIceGthGiU+lUJHfDToVAtGKz09ABMCDqJEnpafM3uC0YdY/42OamMTbYLm9dQFtB3Ub7PQBR9nP0Nb/lSfN/ec/ej3xpSTV8wpjgLXRh4vNFRQAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857401; c=relaxed/simple;
	bh=DctQFqX7HYIgbk8nO2Y1rjyqkOg+G8pkOj2K8wGruS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sqz2J6DubvNWAGnRiJN3oHy84ltGkZOUGbkPC2TxfJ2ItLxVuYqsv0nC1xwYFRtZzdaRTPm9zwVx1DHukyxsL8AjmDgvsXC4ocwgdIURiHr0VfHKBgNXb1HCCrrsRDe9q/rmG1uToqR4hYtxLg8IYxVE86EKB4a1BVhH82B4nWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fksqjreQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5FEAC80;
	Mon,  2 Jun 2025 11:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857397;
	bh=DctQFqX7HYIgbk8nO2Y1rjyqkOg+G8pkOj2K8wGruS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fksqjreQTJ2RZ1AQM1f4oLuUKm2ccVW8ssC6tpCen2R44BWP+pqvEwEVAmEuuOpqy
	 SApH6GL8Eh2mlptBXEju45qu0A5lFhtVH6AIJHKxDtPvydSep5z9eEKt1WkQbyV40b
	 NTxZ7P70HDjKSwje8eZ8cyPlAUBU/gyVx9C6GFrM=
Date: Mon, 2 Jun 2025 12:43:08 +0300
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
Subject: Re: [PATCH 2/2] media: dt-bindings: media: renesas,vsp1: Document
 RZ/V2N SoC
Message-ID: <20250602094308.GC3645@pendragon.ideasonboard.com>
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, May 30, 2025 at 04:41:48PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The VSPD block on the RZ/V2N SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/V2N SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 9d03b972f522..722ae14718e0 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -25,6 +25,7 @@ properties:
>            - enum:
>                - renesas,r9a07g043u-vsp2   # RZ/G2UL
>                - renesas,r9a07g054-vsp2    # RZ/V2L
> +              - renesas,r9a09g056-vsp2    # RZ/V2N
>                - renesas,r9a09g057-vsp2    # RZ/V2H(P)
>            - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
>  

-- 
Regards,

Laurent Pinchart

