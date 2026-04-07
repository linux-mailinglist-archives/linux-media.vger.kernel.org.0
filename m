Return-Path: <linux-media+bounces-58196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKqGMY9I1Wk44AcAu9opvQ
	(envelope-from <linux-media+bounces-58196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 20:10:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C586F3B2CAC
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 20:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F8D03015754
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 18:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1343D091A;
	Tue,  7 Apr 2026 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT8gTIpS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C003434751F;
	Tue,  7 Apr 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585416; cv=none; b=UNJ5XcyxulQzRDDWTXNUmEeTaflmywCISrmXn3SEa7dvnB1v2Twf2blHlNxS7WDF+EVfsH8HY+8aDmpZQGsZFWPCr8FPmGatW/Zd2GPXHm7s4MLA3/jPrb2MskuHpJEs98JlXDteFWAOVNlABXb5P3sNKlvqo6G05DPOzDQy4S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585416; c=relaxed/simple;
	bh=9fjuIFhmUoz+pTrO13nFTJUB6S3fQXknIHSx7EgxRZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=speEUZK8AYpfqt0NA3tk0+08MhclHiERW8dAbqiU0Ljw+4s9I79K9E6C6P5yfrjFtUpsan6Mmt9TOw/GGm3+YJJj5eWOjVWKmDRj87vwBJy35KnAhH4lyP2OQsxCdX7a9t8u7pOKQVJSwl7Cqxh/98XT1zllOX9kE+a7GHiB3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT8gTIpS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFCDC116C6;
	Tue,  7 Apr 2026 18:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775585416;
	bh=9fjuIFhmUoz+pTrO13nFTJUB6S3fQXknIHSx7EgxRZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dT8gTIpSJ89F+AHfiGM46qYbQ39i+NWIhwAa8WarZjcopRFBIdCHC1IzpIlk0NiPO
	 HeRXXpKvxuAFyEvqJfVGM2u6hrtFZ+BLucPGY0G8Ogdf6LJ2U41qTWY+gnAnPRt5MP
	 tw5QouUWRBTt0c/3Or3/5I4/Ju2QV5jZmHtOS0aCp4dFhlR1Yn8lsEcXsK2MQru/Nq
	 DWEfqvMe6RnBweQKFoQbOuYvoiqb7FkTvzf5HHn2BrtuDtJT2TSPi7MV8c20OczSrV
	 crugcMLxlbegmrtvSFVc3yBYgDrnsXBBN9n0J5Et3ejufmxx/ygfrWxQWX2Ulnkipb
	 gGokkkjHXJegg==
Date: Tue, 7 Apr 2026 13:10:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>, devicetree@vger.kernel.org,
	sebastian.reichel@collabora.com,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 01/27] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
Message-ID: <177558541397.3220552.1652779778691249972.robh@kernel.org>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
 <20260325-spu-rga3-v4-1-e90ec1c61354@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325-spu-rga3-v4-1-e90ec1c61354@pengutronix.de>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58196-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: C586F3B2CAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 15:50:32 +0100, Sven Püschel wrote:
> Add a new compatible for the RGA3 (Raster Graphic Acceleration 3)
> peripheral found on the RK3588 SoC. Also specify an iommu property,
> as the RGA3 contains the generic rockchip iommu. While other versions
> also have an iommu, it's usually specific to them.
> 
> The RK3588 contains one RGA2-Enhance core (also contained on the RK3399)
> and two RGA3 cores. Both feature a similar functionality of scaling,
> cropping and rotating of up to two input images into one output image.
> Key differences of the RGA3 are:
> 
> - supports 10bit YUV output formats
> - supports 8x8 tiles and FBCD as inputs and outputs
> - supports BT2020 color space conversion
> - max output resolution of (8192-64)x(8192-64)
> - MMU can map up to 32G DDR RAM
> - fully planar formats (3 planes) are not supported
> - max scale up/down factor of 8 (RGA2 allows up to 16)
> 
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> 
> ---
> 
> Changed in v3/v4:
> - Dropped Acked-by: Krzysztof Kozlowski due to the added iommus property
>   and description adjustments.
> ---
>  Documentation/devicetree/bindings/media/rockchip-rga.yaml | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


