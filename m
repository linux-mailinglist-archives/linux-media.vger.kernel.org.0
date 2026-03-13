Return-Path: <linux-media+bounces-55756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IrdJSxKtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:32:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D528823F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BE50312F4D1
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0709635E941;
	Fri, 13 Mar 2026 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dh2QU9kc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B7430F523;
	Fri, 13 Mar 2026 17:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423031; cv=none; b=Rg0pE59yB6yqUmwPr+Gf5cNaAgbCr2o8q6PmlG2Ve16J90PViwMfqjvDWBM9TnRk+5yvBYXLVJjtuOhuLxRJave+jEPRzmJ8AzIoD5r/JwNsArY1xE+ii9T7RShMwAcRBd6aHm6YHQJIz/W2WF+8oYkp+KKhvY8dGgEM2OO2RbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423031; c=relaxed/simple;
	bh=X4CpsdGFbMbI7tOvEswPlTmMEckGSY4N9ExaDjo0Rjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBwgG3khNYujU9IrSiWD6I9kTNBDhogCOQt9ExW1zbez231X+hHjQzf8XdOFbhGrbCznjpomKrfwVPemyqQmQ+93xiAQGYeJVSombJF8vMoo+dACHRE7UA1AoahDQ5PR2pO+YWrEsiOYN+ZNPmiqVcy/jWzzohCoQF464C6Wwvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dh2QU9kc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F574C19421;
	Fri, 13 Mar 2026 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773423031;
	bh=X4CpsdGFbMbI7tOvEswPlTmMEckGSY4N9ExaDjo0Rjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dh2QU9kcBFEYWzQw5hrRi6oLIX4WEV049KPRhXIRoxlCZF6whuxnErZHNqBusMPte
	 MrK3YT44m36jWAlsVswaBhbuANAtMsu+nJfgN9DF3fJSAZQ68HhzmHbZ9MtT9JuPEd
	 bvsj9s7tHhToX+ZJtTImxMXsUcRmS3XeDiZYwJUDFzeI9zImww8GIih9ZZQFJD/S5q
	 p6bLw3+sMf7LkYYCLWwcGf4tFRs+uj8wxstKHyktXa37QynpYfQlQhYfFGoAlfYkjc
	 xUg7/ksMNIx9OC7GP67dv4dErGTEkVbiFhTzhwc1tMPrRQFszTCbrbPeb9m91wFNV9
	 uEGcn3P46MW+A==
Date: Fri, 13 Mar 2026 17:30:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] dt-bindings: media: st,stm32-dcmi: add 'power-domains'
 property
Message-ID: <20260313-cheddar-wavy-c4c1deda70bc@spud>
References: <20260312-stm32-dcmi-power-domain-v1-1-07cc47216a76@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sJ8wY+4DHeSlHDaa"
Content-Disposition: inline
In-Reply-To: <20260312-stm32-dcmi-power-domain-v1-1-07cc47216a76@foss.st.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55756-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 462D528823F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--sJ8wY+4DHeSlHDaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sJ8wY+4DHeSlHDaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRJsgAKCRB4tDGHoIJi
0kleAQDXGAulLqgZbTIoSAz103uNiuY79YYvml9BDUgEgzQb3QD8CyMhxSzinwOc
XJ31tRkhVwhibWIMqMOXS8b3ULvMcA4=
=Hh2Q
-----END PGP SIGNATURE-----

--sJ8wY+4DHeSlHDaa--

