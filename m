Return-Path: <linux-media+bounces-60848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMRQG9LX/GnxUQAAu9opvQ
	(envelope-from <linux-media+bounces-60848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 20:20:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E486C4ED573
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 20:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9660E3044B85
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 18:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776ED4534A2;
	Thu,  7 May 2026 18:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQsoGK6c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6BB372B23;
	Thu,  7 May 2026 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177940; cv=none; b=Ta0aVJj3CbI2rhsojSej5WVQzhhOtWLdCQtn1fRpRP5tny5I52rp7jxlpkYPg1Khg8xULWjJ5RMLkIrEI/Y6mfK8WZFjVC+MyVfWjOkgTvn1pDBX65WQv2ubByLisYmvK3+kkHn+/kdXYOWqfTKKWj5Gp8USJMVkF0uH/+ZR7Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177940; c=relaxed/simple;
	bh=QEvcEiZ4DMyLHBvFxsRZR994tE2Q0TBVuSxKL5PjWQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/y5E4htvaZPmh3qYw9Q21/QnlZ2SEtzDlJ4kiL+KRkuOu2gaGj+ZPJhtxp6DkKLupR9jaAeiO/XCluQxgE4G/RZlI8w2ezCQITfSfq4y7HhuAJDjfmhS2HaGxvr0l0poRPcU2Vi9+fi0DcN+Q4uoBUdfNXig2pM0Zuxh5cgGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQsoGK6c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66186C2BCB2;
	Thu,  7 May 2026 18:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778177940;
	bh=QEvcEiZ4DMyLHBvFxsRZR994tE2Q0TBVuSxKL5PjWQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQsoGK6cBX/dmD7+QmFOrj8XxR+5obBACqGcFPMaiOOqAjRc6/M+Se3A5ylQrHuP4
	 wEGN+TRf62af/saeIGYvRtGNlbrTcH7yUJmOr9XvWIn2C0Y9XTg8+Qp+x9T50q+xRD
	 R3wt70uvDeHnPXEp7Bb+m/Ua41EaNOw2mcNvusYrR/oqmUHMk7yUGO1Niy4dTEOUBV
	 nCRAUeK03XGTwgJ6bcjxRWiEbkJA5jqJvYa/FllEOVub3lYGIGjMz4IYXvqS51D+MC
	 mQaDZS9NVbgdRRr6KAQfSSgAIn7oEsgoNAjxcKN9EgNEu3GiXPBf0dEbzZoovdfuON
	 iVb+u5MC04DGw==
Date: Thu, 7 May 2026 13:18:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH 2/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/T2H and RZ/N2H SoCs
Message-ID: <177817793758.2205763.3661767367311596508.robh@kernel.org>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260430100929.1088281-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430100929.1088281-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: E486C4ED573
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60848-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,pengutronix.de,bp.renesas.com,ideasonboard.com,kernel.org,glider.be,renesas.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email]
X-Rspamd-Action: no action


On Thu, 30 Apr 2026 11:09:28 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the VSP2 blocks present on the RZ/T2H and RZ/N2H SoCs.
> 
> The VSP2 implementation on these SoCs is identical to that on the
> RZ/G2L SoC.
> 
> Update the schema to disallow the "resets" property for these SoCs to
> reflect the hardware integration.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/media/renesas,vsp1.yaml | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


