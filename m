Return-Path: <linux-media+bounces-57629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJwbI4CFymkW9gUAu9opvQ
	(envelope-from <linux-media+bounces-57629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:15:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD035CA55
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5C98308091B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14D13D75AA;
	Mon, 30 Mar 2026 14:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B9oNryat"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD0938550C;
	Mon, 30 Mar 2026 14:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879314; cv=none; b=mDAkxzKExZjIDAY94j+VGF3tSCp6Fvt60a4b6nj7anfCuK+isI+OMJW60NnRbs9mtpJ/gVH5Fmr0aqW0cSL6fripz/34WDDAwF2f8l1kp0mO6j0FSJmPO63EjOSCDRtJg4RRxLheC8rCiYqlLFGFjXxNVSOL4iRpun1XL/PH7xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879314; c=relaxed/simple;
	bh=c9076yktHDLuzmnwIiQpfCLb5yc2uo7oV2J8oqMDJ+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zdk0TJt5obnac+4VmkLRowsX13dJI0wgba5Hhlc4Z/YKTA0/O3dNZSj/RYfJyzfBjVLzr6vpthXUPn+fOmPmcAD48/hYLmsKijE5K+Mu+uCisWuO0jW5CJKp8AOoXMH0htqHb8ym8MwlerRBuiLnrGXviS8RzgRX/V/V8+S0gLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B9oNryat; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3504023B9;
	Mon, 30 Mar 2026 16:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774879229;
	bh=c9076yktHDLuzmnwIiQpfCLb5yc2uo7oV2J8oqMDJ+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9oNryat/Yq4m7FouJqbqdERIep/BscPDW3/J954pnOl30Y4ED6+nW3RFhPYdm0jT
	 Juo57rTyD2Bx2VmfXF5qwLy/A7VddQLIepIo8BhQy+GnTNaXu7vv3DcM68nl8/lmG3
	 LZGJObW7MDwUVXc8Om93QnlzOPERfY3s0/5voCjs=
Date: Mon, 30 Mar 2026 17:01:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju <biju.das.au@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,fcp: Document RZ/G3L
 FCPVD IP
Message-ID: <20260330140149.GA3376560@killaraus.ideasonboard.com>
References: <20260330110012.131273-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330110012.131273-1-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57629-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 78CD035CA55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

Thank you for the patch.

On Mon, Mar 30, 2026 at 12:00:10PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The FCPVD block on the RZ/G3L SoC is identical to the one found on the
> RZ/G2L SoC. Document RZ/G3L FCPVD IP.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index b5eff6fec8a9..86b176a634e1 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -30,6 +30,7 @@ properties:
>                - renesas,r9a07g043u-fcpvd # RZ/G2UL
>                - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
>                - renesas,r9a07g054-fcpvd # RZ/V2L
> +              - renesas,r9a08g046-fcpvd # RZ/G3L
>                - renesas,r9a09g056-fcpvd # RZ/V2N
>                - renesas,r9a09g057-fcpvd # RZ/V2H(P)
>            - const: renesas,fcpv         # Generic FCP for VSP fallback
> @@ -77,6 +78,7 @@ allOf:
>                - renesas,r9a07g043u-fcpvd
>                - renesas,r9a07g044-fcpvd
>                - renesas,r9a07g054-fcpvd
> +              - renesas,r9a08g046-fcpvd
>                - renesas,r9a09g056-fcpvd
>                - renesas,r9a09g057-fcpvd
>      then:

-- 
Regards,

Laurent Pinchart

