Return-Path: <linux-media+bounces-26705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BDA410B2
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566313B778C
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E83015CD46;
	Sun, 23 Feb 2025 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V0Vqunki"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AE126BFF;
	Sun, 23 Feb 2025 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740334252; cv=none; b=fC7a3SOn5/LHrdFbcvm5pWunBExc1ZgqAx7oWAQPGRGkKU6HCn2MoC7U0gpCCs8cM7KlQO2kNCEAAFWDLZlPjFDFLs/7BN3G+APxR0C8+k8hEzEuIxWdr9v9IENSZoyuatkICIRDT+PuFcElE7E4jNt45MVj12GPkA7zre8PriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740334252; c=relaxed/simple;
	bh=oGxfqERr7ekbzcI++zuD2VKY2Yz1CdAmhM/gJCAvJiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHLCYoIP50hFTJQozpo1FYZV2s/SyI0qTaQaKDePLak4ZKL3Py0dYpelH49W2hkFF7b7ImCdxW9DOSJQ4/LGm5AMt1fKkpf1SQLXLVgoiXUoMSyClvCLIcftK9B555AxnCLfRP4MDJLyVg/tUOM6GdpK0k51whoMLvWM+eila3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V0Vqunki; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B92C4496;
	Sun, 23 Feb 2025 19:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740334163;
	bh=oGxfqERr7ekbzcI++zuD2VKY2Yz1CdAmhM/gJCAvJiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0VqunkijRXMbJMGq7f79fVYFNibdZ2eR4X7MOTB3aFk0X5YWxHobcE9xtWyFCx5k
	 g2lWK7v8dAEJqFgQgFRTBNWWvPKNdQ+u/f/8nSU2iIG2TlE2ERS682AexyHucod7ZE
	 ly3LmIDIeHwyQ/uHpJ6aVkrHN0k8lRuQ5ESnWcZY=
Date: Sun, 23 Feb 2025 20:10:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/18] media: dt-bindings: renesas,rzg2l-csi2:
 Document Renesas RZ/G3E CSI-2 block
Message-ID: <20250223181031.GE15078@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-3-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-3-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:16PM +0100, Tommaso Merciai wrote:
> Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
> SoC.
> 
> The CSI-2 block on the RZ/G3E SoC is identical to one found on the
> RZ/V2H(P) SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> index 1d7784e8af16..9b7ed86ef14b 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> @@ -24,6 +24,9 @@ properties:
>                - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
>                - renesas,r9a07g054-csi2 # RZ/V2L
>            - const: renesas,rzg2l-csi2
> +      - items:
> +          - const: renesas,r9a09g047-csi2 # RZ/G3E
> +          - const: renesas,r9a09g057-csi2

If you follow my suggestion on 01/18, the description of the second
reset entry needs to be updated.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>        - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
>  
>    reg:

-- 
Regards,

Laurent Pinchart

