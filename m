Return-Path: <linux-media+bounces-58227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GRoJ1JL1ml8DQgAu9opvQ
	(envelope-from <linux-media+bounces-58227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 14:34:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD13BC27E
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 14:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7E4B30247A1
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 12:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A440A346E57;
	Wed,  8 Apr 2026 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V81FepQU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9FF3C3421;
	Wed,  8 Apr 2026 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651367; cv=none; b=FBjuifxWgcAbh3Z+QfwFYv8ceP9i9YKg1ZTwE+/fH3ezpRWCXUSWvSXdsjHhC/rd9srKO+S3VdlllhL0Syq2h558AWuBcc/CDxBq197KNhKSi/dnSS95rma9YHQNapTiNh2RIXcOGzNJhtGLYCHKXH/HBm+p55kRGbMLC0P3AYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651367; c=relaxed/simple;
	bh=JUb3Ni3nop9oeht6zab5+UGyZoXCAwns5KUDhLb9/+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRP/IfX7OYpcn9Q8XArp/uCfmttQRqNI0/m8MUlwAUPCROidfUQMutexRSQCzDxo4kY+O07hQs33sRzBPX+Vh3vV/JB1ur5UD8vfOW4QXpqHesDLhMjC6V0sDGLYV55nk0AL+g73BqAY8po3mq71YyrkVVV/lk1tiCnk1Sb3Mqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V81FepQU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D67EC19421;
	Wed,  8 Apr 2026 12:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775651366;
	bh=JUb3Ni3nop9oeht6zab5+UGyZoXCAwns5KUDhLb9/+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V81FepQU5lt58nUz9IvtHb2GjNFXMIbGR4E2HNEJepNf5nWgKB6N9Pco/kM0PeCRO
	 Gr0xF/uyReqLu9YQf7DQVYfweaK37DL75GQsIV4r8uQykiqFJb6EZIjzDuA3YLcpA1
	 ZLSxSX6bn6H/cMTzMZH6ltOVUYiGesahyUSATM70SXC0CmYCfoCiLKCoaAGBxnTpo2
	 sa/2lcNafiwDC5rr5J7CXccF6C/dey9B/H0iMsllRat5WcxatkvR+EEthGM88cboiO
	 tuiPkGt+eHYQicnKs6r1j6YSF3Fk+e18NOtJrppx8lSxhy/NenRDD6ad3g52eBd6gz
	 KbU2b17pn9I2Q==
Date: Wed, 8 Apr 2026 07:29:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,vsp1: Document RZ/G3L
 VSPD
Message-ID: <177565136444.1864152.9247562775873276263.robh@kernel.org>
References: <20260330105637.130189-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330105637.130189-1-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,glider.be,bp.renesas.com,gmail.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-58227-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FFD13BC27E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 11:56:29 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The VSPD block on the RZ/G3L SoC is identical to the one found on the
> RZ/G2L SoC. Document RZ/G3L VSPD.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


