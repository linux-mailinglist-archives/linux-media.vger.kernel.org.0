Return-Path: <linux-media+bounces-64777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XQ4OEB6gLWoGiAQAu9opvQ
	(envelope-from <linux-media+bounces-64777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:23:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E7367F49B
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:23:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=D2VRrt7n;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64777-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64777-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E27C304ED5B
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 18:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D9338D3E0;
	Sat, 13 Jun 2026 18:22:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85626324B32;
	Sat, 13 Jun 2026 18:22:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781374930; cv=none; b=ddawDwB+lFskkp1NbBV2azzP6ZK85urjUbzO50+ZPFGuEKFPVPYsZA1Zi1UgwvAIbq4Zc6YMqtxltFaCm2s1RGKWhG5GOH7gGwPmEmE9hMvTxt6QP9+vUfzO2w8AvPs2u57v72HCo6oWTchhWR4J86rQVK6MUDMXSN7lm3t43ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781374930; c=relaxed/simple;
	bh=/tR1D3Y4OcnKt+Pl/J6KzJ1fOTwDJvC0hgGxqZJ02CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCLrnk1F+mBvaLx3Zn0iBtaJEAw2HACzFqvzVohdbyAcDeowKco6DKzNWns3lgYq/BeFKWx4PE8LaYJ8hiL9/ApNI2hCz479nrOQcDCevmnVU3nS1yJJZvUubps4FIWUcPN9spbqu8YAVb7R4TmM6ghhAaA9NcBT2rkv+L1672U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2VRrt7n; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A701F000E9;
	Sat, 13 Jun 2026 18:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781374926;
	bh=QkmQTRplbsLlEClWTl73mtbbWAT8kZOj5ikRmo3uU40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D2VRrt7nt9cNV/eOCD6SFCixxhe68HLs4uNnaooCtlfcHq+uQzsaWMH5MXXBEtuh+
	 Sr8qcIG7kGThYACBkulN5Tgyr44bvXncdSBwjS7ehOjQ6QOghey6Debzld98sCa5nI
	 UlidaHCmomY6ENn4AzLYHXqSFfEajAJUaxqV4SJpawaZqskSSXfRE2VZmNmu3i3wd5
	 o+tftEjg2JIFeWICJ4ntJMRF5/b6xYaVK554aBkGqqW+Ugt0G/RJV9SSUp/PEegc0H
	 raTpvbcdTPpag2kChOE3iWajrHjcAeqd/ACzooLR1Q2Q0XXlJimaLxUm2GP61OB6zc
	 Fvn0dVTFZcB+A==
Date: Sat, 13 Jun 2026 20:22:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 4/6] dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC
 compatible entry
Message-ID: <20260613-nondescript-sociable-goat-aee13a@quoll>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-5-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613152655.212490-5-paulk@sys-base.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:paulk@sys-base.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:yong.deng@magewell.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:mripard@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64777-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,magewell.com,kernel.org,gmail.com,sholland.org,baylibre.com,redhat.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sys-base.io:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1E7367F49B

On Sat, Jun 13, 2026 at 05:26:53PM +0200, Paul Kocialkowski wrote:
> The V3s/V3/S3 comes with a rx-only D-PHY paired with the MIPI CSI-2
> controller. It is compatible with the D-PHY found on the A31.
> 
> Add an entry with a new compatible and the A31 compatible as fallback.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> index 6a4fd4929959..3ca1a1c47032 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> @@ -21,6 +21,9 @@ properties:
>        - items:
>            - const: allwinner,sun50i-a64-mipi-dphy
>            - const: allwinner,sun6i-a31-mipi-dphy
> +      - items:
> +          - const: allwinner,sun8i-v3s-mipi-dphy

So that's enum with previous first entry (50i-a64) - same fallback.

Best regards,
Krzysztof


