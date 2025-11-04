Return-Path: <linux-media+bounces-46282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8CC30DB7
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 13:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B8BD4ECC5F
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 12:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EFB2EC54B;
	Tue,  4 Nov 2025 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qOTvTDuU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F31C8631;
	Tue,  4 Nov 2025 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257708; cv=none; b=JoDhd4IQ8AATR1U3oFGmQTtosNIzggg8SXT3izMgb2+xmRyr0s/gLenANPHwfK5QZ1pIHEBFZEvkDA/49YtgL259bhXpGcF7CnbAFmkY+/4twbmUvYCyo9rbAN9R8RGCjCKsOE5enc5j9wg/x86DpsLlLsvq7ZYTYTtG44WV9Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257708; c=relaxed/simple;
	bh=An0ewd46tHrHSZlqEHw7QZnRHppOPRXPwAigI3eGGdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbBPkfZVC/vfKEpd7pnItR2wau73ljpSt+ltem7E/K2UvHL2dmqqdNKY3xyojmP6Cm9mw18AqZNyr3NLeGfchL40+Tk8yQWVnnVFqumWUDFjvHp1TGlMhdUx0pOiNoj8QIb0X54noXWuJAHVuAqqutvWzfwRVatccrsDDtTEczE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qOTvTDuU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0C7B61771;
	Tue,  4 Nov 2025 12:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762257590;
	bh=An0ewd46tHrHSZlqEHw7QZnRHppOPRXPwAigI3eGGdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOTvTDuU/dMMg6zsQSX7/ptxTPdT6Es+qk54St1B7KoGxR0JxAallh3QPQgJ6v4pD
	 QnMkggEkLC8lV12Zh5C9kECPN9SHrx6JXGH/FHOIIF+DNVwwPC8EJxVJb59eMurJRy
	 /HzmqwnbSuBqDxvUdItSb0eWX9XQ+Lcv6pTM83Ik=
Date: Tue, 4 Nov 2025 14:01:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,fcp: Allow three
 clocks for RZ/V2N SoC
Message-ID: <20251104120141.GC27255@pendragon.ideasonboard.com>
References: <20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, Nov 03, 2025 at 07:45:54PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the FCP DT schema to permit three clock inputs for the RZ/V2N SoC.
> The FCP block on this SoC requires three separate clocks, unlike other
> variants which use only one.
> 
> Fixes: f42eddf44fbf ("media: dt-bindings: media: renesas,fcp: Document RZ/V2N SoC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Note, there are no current users of the RZ/V2N FCP compatible string in
> the kernel tree.
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index cf92dfe69637..b5eff6fec8a9 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -77,6 +77,7 @@ allOf:
>                - renesas,r9a07g043u-fcpvd
>                - renesas,r9a07g044-fcpvd
>                - renesas,r9a07g054-fcpvd
> +              - renesas,r9a09g056-fcpvd
>                - renesas,r9a09g057-fcpvd
>      then:
>        properties:

-- 
Regards,

Laurent Pinchart

