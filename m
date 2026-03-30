Return-Path: <linux-media+bounces-57630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFd1CZiCymkW9gUAu9opvQ
	(envelope-from <linux-media+bounces-57630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:03:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF7B35C84D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB17A301223F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF09C3D75B9;
	Mon, 30 Mar 2026 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CM1zQoA4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07ED3A0B01;
	Mon, 30 Mar 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879354; cv=none; b=ZNuwK8eyK+k5x6elovzU2i/Hho4P3TKe24vSAFuOh+iAQI0UBkHYh3+4J5SVLJP5ahzm7MYcBV8ZMGt50dGjvxeqaJeXLSkcDrKBbILqMgBJX4VxNRcy687GqydE0UR5iZXNbTWa7W6b+rrOkhYYRuFxXvuQu/nkC/w5WzouPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879354; c=relaxed/simple;
	bh=sUz5ALC4Y2FDhT/vDLhjaZuexdUWRUwTcbLe0EGC+cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIjyFHI9/kKJXBACMdD6VV21wfmzg1cX7xD1XPd2YKduxoUapJi5FEok9M18tfgoYZKpbx0FLndD1cj8Gr2Mqc4nqfp2hm9Go80vEn2/smVIJGp9CQ8TFBzW/kGGCyLnU8wX3XK2hfOywsdVYg+e2Y+GHAbJCwV3YgzhfwTadvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CM1zQoA4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E068223B9;
	Mon, 30 Mar 2026 16:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774879270;
	bh=sUz5ALC4Y2FDhT/vDLhjaZuexdUWRUwTcbLe0EGC+cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CM1zQoA4F800Fo5BfRekFuycqmEvPDD6+4ctj/5KPefu4eoy4G7KBRfdi3RXWwOVy
	 UmLut1HsgrfpfZT4T6QOj0GXyHhLdafRtF3BV41sJHMXntdfNLFsy5jye/nephxlm0
	 RfFrm1ptVIIVGDMF2mdtyVC+7AFcRFq1bCvhWRjY=
Date: Mon, 30 Mar 2026 17:02:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju <biju.das.au@gmail.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,vsp1: Document RZ/G3L
 VSPD
Message-ID: <20260330140230.GB3376560@killaraus.ideasonboard.com>
References: <20260330105637.130189-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330105637.130189-1-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57630-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,renesas.com:email]
X-Rspamd-Queue-Id: ACF7B35C84D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

Thank you for the patch.

On Mon, Mar 30, 2026 at 11:56:29AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The VSPD block on the RZ/G3L SoC is identical to the one found on the
> RZ/G2L SoC. Document RZ/G3L VSPD.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 07a97dd87a5b..5447b9b78930 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -25,6 +25,7 @@ properties:
>            - enum:
>                - renesas,r9a07g043u-vsp2   # RZ/G2UL
>                - renesas,r9a07g054-vsp2    # RZ/V2L
> +              - renesas,r9a08g046-vsp2    # RZ/G3L
>                - renesas,r9a09g056-vsp2    # RZ/V2N
>                - renesas,r9a09g057-vsp2    # RZ/V2H(P)
>            - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback

-- 
Regards,

Laurent Pinchart

