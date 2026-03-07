Return-Path: <linux-media+bounces-54855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLLHKGtFrGlLoQEAu9opvQ
	(envelope-from <linux-media+bounces-54855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 16:34:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C94722C71A
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 16:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B005301B90D
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 15:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC68E3A1E9B;
	Sat,  7 Mar 2026 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3hKirZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959926B764;
	Sat,  7 Mar 2026 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772897629; cv=none; b=kHvzyGNNSkv60ssXGqjmFAwg/psdpz4B4uwgW5Tunyz+/i31WfloRF4pkNDVHxQvBTRFYqu7OW+Lf4BmBJ48RklBKi9h6TKqE9ruswnsSCEQyCC4MTof9td/SJTb1A+n0bEbOmrU2zUvAUBaJLS359CKxyxll2rFLA16dvigXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772897629; c=relaxed/simple;
	bh=LGGa35LUu1Cajfet/gRyfYd8q2l0CArrIN4zoHM0CyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjRy2eYknWej1mWNwr0gTGLq6Ex6dL6KsNkcwo25XBvIJuDkhC8trNxxy/YNYYtJmcIF5n4lJsfE5Y9rsnmI+PW7H+FSXFC7KKOdpfkSzEx9Mv+BOxwBT1aKXsN2ASpGmaLUr7idQEHyqB7LR86yWWg5xCeWFkrLrLNbQEP2cOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3hKirZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E05C2BCB1;
	Sat,  7 Mar 2026 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772897628;
	bh=LGGa35LUu1Cajfet/gRyfYd8q2l0CArrIN4zoHM0CyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k3hKirZ50L++Iv7ng1nmAk6Odn124V0dCq62IUqtY+htEN4qYwRrkfTYqm1V8p4OZ
	 5ts5tRfykMDwcJ2jGmShiFwTEk1z465sj2CgrgddITs6rVoMHxKUBvplkzIjaCtv4u
	 lYIh77SLIXWsVkrfZrHqQU6dJrjBB1MH9UhlEakgd8Cdq86gtMRPoSrFtU220uIgSq
	 xPWbJ04SA9vI2otDejr0A6sF4/vYVH3TIFb0tEsprOtu0nJS9pAG7RxvaF1H+Z+2Se
	 A+htZTgiPiWA+N15RMBcazWW6i3AkvQWbtG5m5V+ln78n7g4qv7hyf7zUcO1Cad0cr
	 piqfWAPSP55AQ==
Date: Sat, 7 Mar 2026 16:33:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
Message-ID: <20260307-complex-finicky-skua-bf52bd@quoll>
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
 <20260305-rk3588-csi2rx-v1-1-0cd8d2bf28c0@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v1-1-0cd8d2bf28c0@collabora.com>
X-Rspamd-Queue-Id: 0C94722C71A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54855-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:09:48PM +0100, Michael Riesch wrote:
> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
> the RK3568. However, their integration in the respective SoC may be
> different when it comes to the (currently not implemented) split

All this says they are compatible, so express it.

> DPHY feature. Therefore, add the RK3588 compatible to allow for
> future differentiation.

This I do not understand. If you just copy standard rules from
writing-bindings, then no, don't do that. It's obvious and there is
never a need to repeat any standard/common rule. If you want to say
devices are not compatible, then say that explicitly.

Best regards,
Krzysztof


