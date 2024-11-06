Return-Path: <linux-media+bounces-21013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 435109BE78E
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 13:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07A312812BC
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 12:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9F81DF257;
	Wed,  6 Nov 2024 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ob31dCIm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B621D416E;
	Wed,  6 Nov 2024 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730895328; cv=none; b=YmRjZgXWesHl9TE8jQLbOj4xC1jrpRsHXy5IAgCwDeX60Amyyq4Xt6+u2rvqTBbSRoMWoaZoX4SHENzr3DGkCIxwYVGaKTVxn0NdOZDVc0vRZVXVUeJe4OLjefw50RhCVNwEwJVhVfAOKAH4csny5giS1uGluHMVQAWiZasg+28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730895328; c=relaxed/simple;
	bh=4X1EMH5tA+soi9e7aJenYXkBhoLeM5x1Oo1HusEqNdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHTsKdG9329xHB+d35YZsk8hLj5IJKQT22x7Jc/Ra+vb+2mnBfYRyCsY4Y7jsnATtdK7ocltbEAJ1Ez7Y7NXl86FIvhUUU9GPKHIc2fCR26Ex59YqQJpN5rUiyrPRxqeDtzzE+yDBy8w//dgolXvbpTvKyJPD2NSrhiTEQ3zjkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ob31dCIm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F62C4CED4;
	Wed,  6 Nov 2024 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730895327;
	bh=4X1EMH5tA+soi9e7aJenYXkBhoLeM5x1Oo1HusEqNdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ob31dCImiO5LUyoZ2tXR58lUtPFZlzyEZOF9idbBzHvNzVfTzMx7JvYisYtpUaqD3
	 COaP1kllGCs2OR/UhZGHSAjT70jBBpNSEqKOsnPse6c8LBPEhdncCRTJB0fJsuk2TW
	 W/AnHN8dM28yClpB2zZKJAcygInemHjXJOp8WcmpPue3Yb6Ld6dzPuGwc/6O+4NafQ
	 ej+kb/HKpzY+OwU9eONrWAj8TSmOPvRkexm5+fSPXEGrFsLmROYNoKyzANPw5aPSbr
	 Lj3b2CeZDNF7AY4BiLXxo/CQD095n/oQd2v687j2GYWDSdceVGtLrK5sMDBd511tqP
	 DNqrSAog9Gkag==
Date: Wed, 6 Nov 2024 13:15:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi
Subject: Re: [PATCH v8 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <lag7gfpuj2hdxw6i5pumaivxl5rylt2hztd57rynjestffwool@ate7u3zhrgfn>
References: <20241106100534.768400-1-dan.scally@ideasonboard.com>
 <20241106100534.768400-6-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106100534.768400-6-dan.scally@ideasonboard.com>

On Wed, Nov 06, 2024 at 10:05:22AM +0000, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v8:
> 
> 	- Added the video clock back in. Now that we have actual hardware it's
> 	  clear that it's necessary.
> 	- Added reset lines 
> 	- Dropped R-bs

These are trivial, so I wish you kept the review... but since you ask,
then comment further

I recommend using b4, so your cover letter changelog comes with nice
links to previous versions. I scrolled through entire cover letter for
this (for me that's almost the only point of cover letter) and could
not find them. Anyway, just a remark.


...

> +  resets:
> +    items:
> +      - description: vclk domain reset
> +      - description: aclk domain reset
> +      - description: hclk domain reset
> +
> +  reset-names:
> +    items:
> +      - const: vresetn

drop "reset", it's redundant and rather come here with logical name. I
wonder what "n" means as well. It's not a GPIO to be "inverted"...

I wonder about reset domains for clocks as well... is this just gate
clock misrepresented?

Best regards,
Krzysztof


