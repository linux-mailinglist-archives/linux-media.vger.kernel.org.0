Return-Path: <linux-media+bounces-36052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B7AEAAE7
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A089B3B6DFA
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 23:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F3422655B;
	Thu, 26 Jun 2025 23:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUlzV2g8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C231459FA;
	Thu, 26 Jun 2025 23:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981991; cv=none; b=NEFyubvMbC4UYTQbpbi2MwEnpG6fglakdy2syvnd0umbLV/Sh2ar+SnJCHlpVd3Qi0+rzDBgSpkKOFtiVd8XrMJc59WyNOb6HDskZtn7QXN7V1CO6jitAn1r0+WgcqEV39xJRIvLf2YcC457COEy3ejHt4WIaXF09eRVF6F2Z08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981991; c=relaxed/simple;
	bh=TdxFMzkDmceycHMGUT+/GaOu22cW5VtyaQX7bh6gXws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKlDQTBc0MyXMamDzYWCLlLqZiedW5RUZAuR+HWaVHFViTCEq3569Kgxq3hdAJ1FsQ2VPiEpJAcZBgskeCOUrXM82Yc7H1EO09KxDK8wgE7t9v4UUEbIRMp1WlamydHZ58olKxg7LPH18gLde3T81qVKgbcI5D1JAVmvOMlO5XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUlzV2g8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE508C4CEEB;
	Thu, 26 Jun 2025 23:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750981990;
	bh=TdxFMzkDmceycHMGUT+/GaOu22cW5VtyaQX7bh6gXws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lUlzV2g8qduvo92J37qQ7DdcWNfFRuItddr/O9vC1RapuqkPeMIH+Qb5nt4ymPxML
	 p3xBdzA18aNV/1E8r1KAoE6oNDO0068XHVMnV8Q2/KF4YFQHrfcy+ykQp88Y2ZInWC
	 dr2vIFXXadD26xzZr1faJbQVf2v1NUOh4+TvutJOhcdTbxB1Kk2qWAlfihbSWKM8ug
	 9pedV1FRuRhmMGpMUHnXuduISjyYoKWPZ1ppeKreHT7N5DEzJywYzb9HMI7LZDcOaX
	 6LJVEPGqzg+MglNbusY1ykbV9NvfZ6tzN2YZ8iDs9vFyuN1CWRJpPHOwSyCn8aGiVV
	 TybLXZBNtyekA==
Date: Thu, 26 Jun 2025 18:53:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: media: rkisp1: Add second power domain
 on i.MX8MP
Message-ID: <175098198851.1429967.7588079065255956191.robh@kernel.org>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
 <20250616011115.19515-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616011115.19515-3-laurent.pinchart@ideasonboard.com>


On Mon, 16 Jun 2025 04:11:11 +0300, Laurent Pinchart wrote:
> In the NXP i.MX8MP, the pclk clock required by the ISP is gated by the
> MIPI CSI-2 power domain. Add it to the power-domains property, and
> require specifying power-domain-names accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/rockchip-isp1.yaml         | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


