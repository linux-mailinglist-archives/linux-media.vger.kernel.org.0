Return-Path: <linux-media+bounces-30831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC98CA99428
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D939D9253E0
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B89284B42;
	Wed, 23 Apr 2025 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbWuiVyx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AFE262FD6;
	Wed, 23 Apr 2025 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423090; cv=none; b=OB4Ys9gScWV5Oig/jNSh+7PjHJGN3aEbS4t3zLILv1iEVlXER7uK+fOqgh+0YlGC/FUftTVwaYHgJFar2ASNrd0r0F1PetmrbL8L2vTt21C1ZSFar2r+vyKb3Huk/r/l0w+ptzo3hqDvfVgs5EwXKT+Qk0ZL+gMuRsjRV73EBeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423090; c=relaxed/simple;
	bh=mU7RaJADMtOBjxf+d4tBnzAuSnv660NigxByrWv6krg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGu3s6zddWK6kn85d9ATlupomD6rOoCbUVy2xJ+23j8g9z6QV9uwY3f3CfxMGpzN31e+j2Zb3v2bRssDkIXkFUpXqrfq05KIW6FV/PUeOC+v6dJAO1p1HJZwpPkR7Go2nnhq2HPur+3qkvJvCf6LirI7dSzmnNZwOQwA0YR2/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbWuiVyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF91C4CEE2;
	Wed, 23 Apr 2025 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423089;
	bh=mU7RaJADMtOBjxf+d4tBnzAuSnv660NigxByrWv6krg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VbWuiVyxE5gpO9GDBcvrE4Lz0Ybw8SIEaRr6+zJBzzRatwbBPsE50OXDU/X3f40L2
	 eZX2zSQTGaAb+XiO22bWQxkcmO2b/NtvzIOij98aydrlneqUSPG1Ft9X8mfZTErRVi
	 sIyFXUBvf2PcTOUmCDxQ1RHj5pfO75X4b0kNgoKpAo2MZD1kbp9yq8akQ5lYsJWdnc
	 ITc0i2XARv5KyuudviyoqVZoWnzkKt6iskEN4cfM3h4g6zfSt2dvnKdnpaytoCGJn9
	 ToivmEJT0CBKA2oXOKdfwl6Z0VrabAEdn0ttOmKGqE+sS3wFqm3CzlxQ/7D21HdLwK
	 K4KI/4PdNPiRw==
Date: Wed, 23 Apr 2025 10:44:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
Message-ID: <174542308706.575894.15505508811321272785.robh@kernel.org>
References: <20250421-b4-ad5820-dt-yaml-v4-1-cc026ce316c6@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-b4-ad5820-dt-yaml-v4-1-cc026ce316c6@ixit.cz>


On Mon, 21 Apr 2025 10:20:15 +0200, David Heidelberg wrote:
> Convert the Analog Devices ad5820 to DT schema format.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v4:
> - Drop remaining pieces of iio-channel-cells introduced in previous
>   revisions.
> - Link to v3: https://lore.kernel.org/r/20250414-b4-ad5820-dt-yaml-v3-1-39bbb5db7b2b@ixit.cz
> 
> Changes in v3:
> - Removed documentation of io-channel-cells property. Now it's 1:1 to
>   the original binding. The reference to it from the Nokia N900 dts
>   was removed in the -next.
> - Link to v2: https://lore.kernel.org/r/20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz
> 
> Changes in v2:
> - added MAINTAINERS entry for the binding
> - documented why io-channel-cells got added into the binding.
> - dropped io-channel-cells in required properties.
> - adjusted example indentation to 4 spaces.
> - Link to v1: https://lore.kernel.org/r/20250209203940.159088-1-david@ixit.cz
> ---
>  .../devicetree/bindings/media/i2c/ad5820.txt       | 28 -----------
>  .../devicetree/bindings/media/i2c/adi,ad5820.yaml  | 56 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 57 insertions(+), 28 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


