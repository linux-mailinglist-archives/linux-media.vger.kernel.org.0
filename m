Return-Path: <linux-media+bounces-61490-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Dq2C3K+BGoBNgIAu9opvQ
	(envelope-from <linux-media+bounces-61490-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:09:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 802AD538A18
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 029BF3020A57
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCDA3A6EF8;
	Wed, 13 May 2026 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIY7G4LY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC23A5453;
	Wed, 13 May 2026 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695402; cv=none; b=pZuXLv0Etj4mY4Q9VWtPuzyYRMJSCNXQOhuS/SIjqevkKAnEr3GQ6E1gwPCCZGDIQoTvSPEaZmSxO8r1B1qbI/z35OtDC0ftdPQwRRTBQRuQNTfZ2J9cUMtiCjLsNmccrJlqhjmeVkAiKzl3NCJ9lDYfMhCkzVqKuG7enoe7Qyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695402; c=relaxed/simple;
	bh=w0VBX5Pqrw6WMZ6TTwlHS14W+TYMlrmHx13BLs87qI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIAbaDnNtir2dDv/Lr4jbLzw8WRWR0vixqRKeNjGOW6fYdSuXoyhwzWDDuq+YvfiKv2Ijc9Q3rnZOCluqa+2twirXL6H7hTxYIphGjMJTJ7fFap/X+XD5Zn8siF/bZH2MmsDcn6yA/dIH4l9r1wRPq0+O63V2qyvg+Oh3iZ/6tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIY7G4LY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214D8C19425;
	Wed, 13 May 2026 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695402;
	bh=w0VBX5Pqrw6WMZ6TTwlHS14W+TYMlrmHx13BLs87qI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIY7G4LYmrN2oGQutV24t5rICtUiNBRKZWU3bXLaTCc0fK1wyL/9XrqHEV8p4e8pE
	 PIniBXCVr0vMUhSm/dggY5nKJ5gOyPecspHvsMf3nESp9xvW9eD1LUh7hLPD6afeRe
	 nkhq/955kLntwfvVb4pIE7DNMPSBJ0T13JX+T4HZGQaoxCITMU3ewWmUSTs3vtopsC
	 dGyozzWYcid3t5Y5QRxwXgDVYN9hzJCdZv13yxKmYeV5XQH7+ppgj6i2zSe18TP8JU
	 o2SvbhbjzJ2xLcW2Esk8AfeKPHneDeLwRw0bYjhpuKfUEtYVgA7smwf4LBzIJDvXOj
	 9LHZ54RX726XA==
Date: Wed, 13 May 2026 13:03:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix
 IOMMU count for H6
Message-ID: <177869539916.1493173.10825192912452085922.robh@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-2-wens@kernel.org>
X-Rspamd-Queue-Id: 802AD538A18
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61490-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 05 May 2026 21:48:05 +0800, Chen-Yu Tsai wrote:
> On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
> connections. The secondary one that is missing is likely used for
> reading reference frames. The newer H616 is the same. On the other
> hand, the D1 only has one memory port.
> 
> Add the missing IOMMU connection for the Video Engine.
> 
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


