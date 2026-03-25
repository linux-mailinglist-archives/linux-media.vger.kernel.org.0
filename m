Return-Path: <linux-media+bounces-57094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKS8IWVOxGljyAQAu9opvQ
	(envelope-from <linux-media+bounces-57094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 22:06:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F062E32C240
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 22:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCE9B303933E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 21:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1073632B9BB;
	Wed, 25 Mar 2026 21:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6SmtO8K"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753963264E2;
	Wed, 25 Mar 2026 21:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472796; cv=none; b=az+diwjC5vOXknStPd0W2hldDY/cSf6UerrICooMdbEOXaHeqEwQRrWyg85T8gj7wgqgXtKzExQsfylDc0ZHOIeLmSL+v8SHYyaMQJZs/E3kC597XDpy8AaxFdtUu9C7eIwy6Sh3WAp3qebqmw+2d7WE05Nwji6g6oINYS2lhBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472796; c=relaxed/simple;
	bh=EeIJxhoizL0VHrXFjuJlP/f+9rmJaR50OY4vHdMlwfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngobqz7ecoLFc9NP2WQaXedWui7FYEA70V7Y87EF4JWptU+rUp8apGdgzQlEAP3MEN1NuP/rtvmjp9ByaMYUUYsRNusG5yas4D91UyJ9NnXavF0RBrssLJDrD/7787ZOt8l1AgpoSAk+hrv0aja4I3yI8ZfUcU9iNcEV/AsTSdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6SmtO8K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D777EC4CEF7;
	Wed, 25 Mar 2026 21:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774472796;
	bh=EeIJxhoizL0VHrXFjuJlP/f+9rmJaR50OY4vHdMlwfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6SmtO8KL/h5db7q0w193Qa/XVr9Xpj0JoGt7cCKgxbkcjf5umxxhimQBcbhq2Ot9
	 c63j883PjdwCCLeUfd+Q1o5mS29QCsCYbWmOAp9lFKCNQEWs62JtUm/jrZziSkf0Eu
	 f+W/BMlTeL66FX/vtrxIUcAmQZjFUt0rcR22rU6AJW/tMiMUCaPEcpmhQ2wEtElwGa
	 /8QG9KCNoATgEYW0L0gPxL8qr/HZomFkBKHDz2v752E1yxfgLTaT5LLqoZ29S9Eyhh
	 C6/hG59ugrHWkys5FRFOLDJJLj7SejybMisJox93kt8LXfgklQXFXcRXxKi2Cfy8N7
	 2ifE6S3APHh0Q==
Date: Wed, 25 Mar 2026 16:06:34 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2:
 add rk3588 compatible
Message-ID: <20260325210634.GA3963190-robh@kernel.org>
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
 <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57094-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: F062E32C240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 11:25:34AM +0100, Michael Riesch wrote:
> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
> the RK3568.
> Introduce a list of compatible variants and add the RK3588 variant to
> it.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> index 4ac4a3b6f406..3d3b3cd78884 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> @@ -16,9 +16,13 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx93-mipi-csi2
> -      - rockchip,rk3568-mipi-csi2
> +    oneOf:
> +      - const: fsl,imx93-mipi-csi2
> +      - const: rockchip,rk3568-mipi-csi2

These 2 should be a single enum as they were before.

> +      - items:
> +          - enum:
> +              - rockchip,rk3588-mipi-csi2
> +          - const: rockchip,rk3568-mipi-csi2
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.39.5
> 

