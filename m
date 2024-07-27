Return-Path: <linux-media+bounces-15372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D7C93DCAC
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 02:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 033051C20B50
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 00:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C42815C9;
	Sat, 27 Jul 2024 00:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xsd3+0X5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DA1C2D;
	Sat, 27 Jul 2024 00:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722040830; cv=none; b=XXPbadNh/dWPyHWK7oUy4Vxae1YW6X6BcUwyaxc9bCNonspVQ0apSSLW12q+qlW3gCGAzb5zBUHfg0z1ih0Qd4W/Jt91muA70X0gy0QlQzV5EsS4sGnpyproDpzkqKSQG2MZP+De/X6wdhhlZwdmLiuGsovE7GFP1uyloNv/8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722040830; c=relaxed/simple;
	bh=brVzf+qYkZZXF5h5ptfdsIaDaGhldt/ow1+kTIza+jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb1H9vO5M9gQSK657KqfbSqwsv/aCu4Av0sOfF/84zO7qGlsUEjJkiGcOYqVdqj+hTlvvgrKpg9led52Y/m1fdXNK4O5jGqgr+RsDXXm4JWbufScNcQtAbhd3h2xJrw49gYoAoUbB2l0YI45n+LfVTmtLjVzs9Do61wovmDKSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xsd3+0X5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 978D5720;
	Sat, 27 Jul 2024 02:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722040782;
	bh=brVzf+qYkZZXF5h5ptfdsIaDaGhldt/ow1+kTIza+jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xsd3+0X5GriZRzRXXAGbBwFS+YgsWpR+h6lSuUjirLKn685wBxyP4hIjRhUwhn38P
	 I5qBRlP3JCGzRVTKK97IS9MRlsoLGY6UWyfjbVOOh3SzcbjuyOI33hyvKk81koS1iG
	 U3e/LOFZBPRIHmM+qgdtPKrBH+4g6z7tFE/S+xNU=
Date: Sat, 27 Jul 2024 03:40:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/9] media: dt-bindings: media: renesas,fcp: Document
 RZ/G2UL FCPVD bindings
Message-ID: <20240727004008.GE300@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709135152.185042-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:51:40PM +0100, Biju Das wrote:
> Document FCPVD found in RZ/G2UL SoC. FCPVD block is similar to FCP for
> VSP found on RZ/{G2L,G2LC,V2L} SoCs.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v1->v2:
>  * Added Ack from Conor.
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index c6abe719881b..f94dacd96278 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -27,6 +27,7 @@ properties:
>            - renesas,fcpf # FCP for FDP
>        - items:
>            - enum:
> +              - renesas,r9a07g043u-fcpvd # RZ/G2UL
>                - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
>                - renesas,r9a07g054-fcpvd # RZ/V2L
>            - const: renesas,fcpv         # Generic FCP for VSP fallback
> @@ -62,6 +63,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,r9a07g043u-fcpvd
>                - renesas,r9a07g044-fcpvd
>                - renesas,r9a07g054-fcpvd
>      then:

-- 
Regards,

Laurent Pinchart

