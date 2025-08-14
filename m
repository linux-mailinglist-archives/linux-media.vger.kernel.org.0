Return-Path: <linux-media+bounces-39942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0336BB27047
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 22:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 694951C88592
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 20:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06DC26B97E;
	Thu, 14 Aug 2025 20:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yj69CiNU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45504265CB2;
	Thu, 14 Aug 2025 20:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755204049; cv=none; b=Hlcqvk3BLIx8+iBpXtxLWDwJK2ya5yF5OvE36N/jnFzc8fTDzHx/tcr0+NLuUZKPIgk/6QRvTlYP/zAA6sqZ2YlU4RKkg7t+ZZ8J8OwAmABm2FZyDTniKABr/SIKFFT3/QF6MVn54gcQaO3EMsdz0azGZqZaNqoBKXUwwME/vao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755204049; c=relaxed/simple;
	bh=cxDUUII/D5fjYNMk7NY+f1SN37GfMoTdM5/g6ZmS308=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncWebLJGDCdVxbaWfHanMo6WpoVZPbbPtR2a50tz+IeNjJg1+F8ofgTBTN2A25JACZ0CudbkGjB54FrQ+OwpDiiS+OyZfQAbDR187wA2wHpsZySv+pin+BEbAGE94R94RdMzoiY2QwTFxuLIuyfya4REVhou5t1Jjqh+gIR3l3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yj69CiNU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAC0C4CEED;
	Thu, 14 Aug 2025 20:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755204048;
	bh=cxDUUII/D5fjYNMk7NY+f1SN37GfMoTdM5/g6ZmS308=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yj69CiNUQt4yHCui9PgKycDpXhqESeH0YuO48lNoZ2AHcyALggKmFh1jB9UM79pTH
	 ChaDcbk28jZTJ+Z52qWFuRUWHVme5n1WgHFE/fKSKKrOPNIS2GM5VL22Jl8ntbXSRH
	 EOqJxf0Mwfs3Umcrg3wGXp+cehspkRR2lmL3OObqDpF/ONbvF7IQ4scsoZJ7B5VgFb
	 Mreq+INJKQu5DTGVONM+ILLtsXLELxyGnA+FjBUkPN9o5zRf4f8xUDPP88QuS81riS
	 lXae3rk2EgGOuzdbLsUax9Kby7c0aadQER1h7SWAQBecm8qxePYneLTGideXhgZa5b
	 6UepgbiHmLqrg==
Date: Thu, 14 Aug 2025 15:40:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/72] dt-bindings: media: imx274: Make clocks
 property required
Message-ID: <175520404733.3873490.16721752829314238858.robh@kernel.org>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812214620.30425-5-laurent.pinchart@ideasonboard.com>


On Wed, 13 Aug 2025 00:45:12 +0300, Laurent Pinchart wrote:
> The sensor requires an external clock, and drivers need to access the
> clock to retrieve its frequency in order to configure the sensor. This
> makes usage of the clocks property mandatory for a system to work
> properly. Mark the clocks and clock-names properties as required, and
> update the example accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Adapt examples in bindings that reference sensors
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml  | 4 ++++
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 3 +++
>  2 files changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


