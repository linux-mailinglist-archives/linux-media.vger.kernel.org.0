Return-Path: <linux-media+bounces-15371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8236893DCA8
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 02:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20EAC1F229F8
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 00:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984F1186A;
	Sat, 27 Jul 2024 00:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JsTMp0Bn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF215BB;
	Sat, 27 Jul 2024 00:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722040780; cv=none; b=KkNkXLepr1ZSIrbeZjvCtmtDH9wOykUfdQ4DT6DKQocuEfRkCP4kXXDkCm1RlbEisi5h4ovfQGaNkHEkP1axksSHiwfhYgjwYjVAr17JQZ/U+GtlvpoT8QMPplWd/2akW03sOWkCrFAJkh/fVeBB3HKMuMs14s0NYGtscOlxsiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722040780; c=relaxed/simple;
	bh=9ONnS8AYoRIDs7ytBNyXcFGDN5Kpi5LV9Ye+Vbyl/04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSjvcDUF3Rd+Wr7DddSqQa+BqI7Nu/HZ9WbRBXYvBqe2mDEjGhOoNN0cbi3jG+uu6NYDIZdr6ISt6PAk3xOuZNC5T8Ur8Mq0gXDiWtficPDmrfuf/BwgvNXPCaA4mcxW3NBfDXhmA38WXlEKg9kYoAh+dpZe2VcP97eW4ZGudAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JsTMp0Bn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4D7A720;
	Sat, 27 Jul 2024 02:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722040731;
	bh=9ONnS8AYoRIDs7ytBNyXcFGDN5Kpi5LV9Ye+Vbyl/04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsTMp0BnOJtfBwOuh26V6jFuoJQc8taoALLzXkwl5Z/2xuB0IzHjW0clxeNWRfNL2
	 ZyW3/rVz9W/Oi2m0mwkAa1/3MJJzwJTsJbLJHDyLzIfrz2D6DfhrM0eJ1mtoMcoXYZ
	 J92jEQ2Whq6O0IhW5uecn+aCigjZwoTYDtFXZCZU=
Date: Sat, 27 Jul 2024 03:39:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/9] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G2UL VSPD bindings
Message-ID: <20240727003917.GD300@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709135152.185042-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:51:39PM +0100, Biju Das wrote:
> Document VSPD found in RZ/G2UL SoC. The VSPD block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v1->v2:
>  * Added Ack from Conor.
> ---
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 3265e922647c..1a03e67462a4 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -23,6 +23,7 @@ properties:
>            - renesas,vsp2 # R-Car Gen3 and RZ/G2
>        - items:
>            - enum:
> +              - renesas,r9a07g043u-vsp2   # RZ/G2UL
>                - renesas,r9a07g054-vsp2    # RZ/V2L
>            - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
>  

-- 
Regards,

Laurent Pinchart

