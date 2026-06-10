Return-Path: <linux-media+bounces-64484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 38i6G36MKWroZAMAu9opvQ
	(envelope-from <linux-media+bounces-64484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:10:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0907A66B354
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:10:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=MenOPSRW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64484-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64484-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79B8E3503E2E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D34478E55;
	Wed, 10 Jun 2026 15:50:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600B43C063;
	Wed, 10 Jun 2026 15:49:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106602; cv=none; b=IbO9T2Li3RycG1AvFeDV7KI+/UTTDAtbEORkurec7hpGQq8hTL+MqDnSDawTrDxMHwVOuwdiAehCbYIC6Q9ddwZOQbntvMcq7wozgk0qRgkEDLwCxoHZCe23HOkmY2SisHznTRIoObYbQav1m84Q2WfmTqamlR1RtzqQDtDrlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106602; c=relaxed/simple;
	bh=1HLHVotbcuXMCV9qhlxe/fp4cX8c46z4aJrEatBj7JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+0er24nIJCa1kWMPgFQdV0ZfgxAMOTDDmnlB0p8GoMWXEigRkfjr1nL+CqBXXP/REx5VlVNG96U3AhgNSFVftMbfG/qVqYNKlQIFGyZBGtQdte5WrIlBkEKqwHdlawI3mFfO95KI6lXFPJ3ZSyaXTMo9oIHXXQ/JRBukVZcDOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MenOPSRW; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DB3B6DF;
	Wed, 10 Jun 2026 17:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781106567;
	bh=1HLHVotbcuXMCV9qhlxe/fp4cX8c46z4aJrEatBj7JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MenOPSRWFuX3Je9PwZ1VrE10Dt5Hw6SyfZgi70H7epYacaBQ20LgOOo3UaHpjB+x7
	 WG+ZiCK1Twbfn+Dzekt21xjOXo9dsyLkKxON01o9ChhYWv1Vdl/FybtVL8BIgVGUSM
	 5afqTePVl4BJ7weA/XYA0dNzMxJ1g3V7csbjRsUo=
Date: Wed, 10 Jun 2026 18:49:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] media: renesas: vsp1: Make reset control optional to
 support platforms without a reset line
Message-ID: <20260610154954.GC1335994@killaraus.ideasonboard.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260430100929.1088281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430100929.1088281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64484-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0907A66B354

Hi Prabhakar,

Thank you for the patch.

On Thu, Apr 30, 2026 at 11:09:29AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Switch the VSP1 driver to use devm_reset_control_get_optional_shared()
> when requesting its reset control. Some newer Renesas SoCs integrating
> VSP1 such as RZ/T2H do not provide a reset line for the VSP IP block.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 627b5046fa80..605fac57bd93 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -947,7 +947,7 @@ static int vsp1_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
> +	vsp1->rstc = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
>  	if (IS_ERR(vsp1->rstc))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
>  				     "failed to get reset control\n");

-- 
Regards,

Laurent Pinchart

