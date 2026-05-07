Return-Path: <linux-media+bounces-60847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOPYAKzX/GnxUQAAu9opvQ
	(envelope-from <linux-media+bounces-60847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 20:19:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 739634ED53D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 20:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45288302452F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 18:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4967450905;
	Thu,  7 May 2026 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW1n0g8z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D5A31E824;
	Thu,  7 May 2026 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177917; cv=none; b=HD+ZI7O4O6llyCLDpyaoiGqo9IFJ234c++Q858VIgmT9nXIl0AWZO2FKLEV/J5gh8E+6NRowAXeLm8wohSoFeDInC0FNAF1SxZYRWd3h0quSq91b2YaKpAhIGNk8QRnk85r2qb217Ow58nwvjIxFU0L5R4GYhRGjsLvbCaxjiI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177917; c=relaxed/simple;
	bh=ONpoIh5b7yPeDMI26ygxWBktfV+Z0zNWTIccFVvt6Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U56tYTcBg84DZvLIwkwuOhBFH2bteV8nUr99CHMKXFNSd8yArLhYg/g4iFHXGqPZDGjWxa2qdFAW5YdyUapS0w9IfWgyctL1WUKXeLDc9e6nUB7ekeZ6gCx1XT/qhys9HXD0BsxVgSVHzD/UalYYi8bL/VtilZ2RtRfKeCIi/50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW1n0g8z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A7DC2BCB2;
	Thu,  7 May 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778177916;
	bh=ONpoIh5b7yPeDMI26ygxWBktfV+Z0zNWTIccFVvt6Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dW1n0g8zF1Yz74tmgHh0G90o2To8GbURxTC4/sBKQClGvV1K8BXWstNgHo3DTwCVX
	 nYqOjbfhTPg0u9F/pJcq96g9CyXg6gFD1yXNfNE647oW7RrRtnfB/fcauTnkp3L3S2
	 Q2q5uO1Jb3pzuQFuq9UbsNwgt5MP5PxwhnJ6sEbq5du31c8QASGX1+CBpaezIUSRD0
	 R3XVhiEYntPw1ma3VKCuRZ0/eol0N/mQgpxFcT8q0B7zC3ZHYRZF7d7UQnZ3rjvzWf
	 PPNM0kRkgMn74f677RFEIA6UfLcYxMoByuZD5zWkw6Nxo9+zfbAycxWj+RdBVgXp2b
	 ZtLBnDE6J2Hyg==
Date: Thu, 7 May 2026 13:18:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/T2H and RZ/N2H SoCs
Message-ID: <177817791354.2205190.11201568660914418852.robh@kernel.org>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: 739634ED53D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,ideasonboard.com,vger.kernel.org,renesas.com,pengutronix.de];
	TAGGED_FROM(0.00)[bounces-60847-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Thu, 30 Apr 2026 11:09:27 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the FCPVD blocks present on the RZ/T2H and RZ/N2H SoCs.
> 
> The FCPVD implementation on these SoCs is identical to that found on the
> RZ/G2L family.
> 
> Update the schema to disallow the "resets" property for these SoCs,
> reflecting the absence of a reset control for the FCPVD instance.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


