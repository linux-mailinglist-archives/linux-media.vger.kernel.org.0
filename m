Return-Path: <linux-media+bounces-38700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A51B1721F
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 15:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A20931C21051
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 13:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3CA2C3745;
	Thu, 31 Jul 2025 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n62DkWJI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA0E2C158D;
	Thu, 31 Jul 2025 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753968907; cv=none; b=pjvaPcNSB6OigSnEYUEn9UN2gpbNnXaN/CmwAAWttVjzm5bf9fqMOoQRzMzITFHTkMVRGx8I+Cx0UrUahaKkJ+ktYZqib1TDcsL+G2exjjglpkNs6GTREADYtPdUK+vAABnbaUMExHntsQnteL5J+GeLxIF1ef/7sNoor/WvsCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753968907; c=relaxed/simple;
	bh=JlgjnISOVlbMm171G0UqLCdsAqO+LwlJ2wQNnZovLEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPvP9qEPbMipOqccemhOKGYwSeeU6KEI0psdruiZ5jiYTCmG60eLN7MJ0JuJqHKjWioDUM2xgwsoeNBArd2yvsrV0p9KTQ0mh8m0ngCAZlM/rNUBUZ99rhlm2oXDkqFhT1Dl+xgW8NoXXP93Y1e5oDWIno/9KmNMP0oWgtBCA5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n62DkWJI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E516C4CEEF;
	Thu, 31 Jul 2025 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753968907;
	bh=JlgjnISOVlbMm171G0UqLCdsAqO+LwlJ2wQNnZovLEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n62DkWJI5QDzlSFj4I0ZZxFbWRpzaHmiyzX3/mXIv+bAD973YvFciv5FfgfDDdfy3
	 g8wvomrxmJ095KgSDtLbd8toTpFS6e9ZZjIHS30te5ucGfNGQ+x+oa5w3NUn5UCdEu
	 i1D5AX5tXpnVOc9/SgA4vGyGdm9wB/rkVqBUdjc9YNukoEhPQmNC3NaxO79vYFMPDS
	 S/+V15V6uMBAB0eoSFQRlSXzgG2tWk8cBgm6tBKhLuNFbKGg3I0nIgzpG19QV6bXnT
	 pkiJ0icmE5bjGGDxC47KnVLpgUdZCRtUYVV19Yk+82WJmxd0Txsa5Bay9lhYfVHut1
	 tTCGBWuAZjSiQ==
Date: Thu, 31 Jul 2025 08:35:06 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11.1 07/19] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20250731133506.GA2114146-robh@kernel.org>
References: <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>
 <20250731071151.997550-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731071151.997550-1-dan.scally@ideasonboard.com>

On Thu, Jul 31, 2025 at 08:11:51AM +0100, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Resending this patch with the change that I had forgotten to make,
> actually made.
> 
> Changes in v11.1:

Creative versioning like this and sending 1 patch of the series doesn't 
work with the tools (i.e. b4). You're going to have to send the whole 
thing as v12. But do that after rc1 is out.

Rob

