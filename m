Return-Path: <linux-media+bounces-19079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CE698FBC6
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 02:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35E45283DE6
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 00:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B776FDC;
	Fri,  4 Oct 2024 00:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqijMftG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E871849;
	Fri,  4 Oct 2024 00:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728003266; cv=none; b=Lhr+McG0QPShfcts7HtA9rtchemx2PbHadzbnEYBsVh8zn+URb7JK8ocmSPicKGzMO4m5DiJxXL5u6TlhgH0qTRjX72DP/FvN+6bgKStjiUYOHyg4eM3MoWoDBHcGqd4FmfKte0IfokQKmnZsFpALHxvX3AGssuoDJ4Z7FS5RSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728003266; c=relaxed/simple;
	bh=EBXwJ0xjvTruyIPFuJ5PaRLLcGzPCXTGfCFIFlv+Wbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouQ7wXQXvhbJvFAZ1cCkDHhwsXtvuGOm193UcE15KrsDiyX9VuvKkSOt+2pDJwZgzBvCXHTpUTT9s3xYF7bRcum/YsJpR+1wo5vm/lHUds8dbRKwqnKRY2x7ED6y4A7RVTemUmbHFsa9OQ6RP/eZUF2fu/lDQYNp9zhoQI6ALx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqijMftG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44C9C4CEC5;
	Fri,  4 Oct 2024 00:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728003265;
	bh=EBXwJ0xjvTruyIPFuJ5PaRLLcGzPCXTGfCFIFlv+Wbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqijMftGqB6sdxZEQGPTVuVtXqYq180eVLw4r5UurPeCVauecziD8y0R/0lbjlpKy
	 ieGFcFVb9e7gsY8avbEOBEpEmWCU4z9RzT+x1l7Y65Wx3nuyd3Ik5BKvxywbUsHJGY
	 Jpunjdm8iqBwCGZUBq78K5ho4msudNJmbjon+mk9VaLDl2DA8LKB05g/VQeVemy3mL
	 dIcLJYe57Yuusu8CYhCldcXmQDg36O0J+qsTS3zXkhsZ/BYMRqcZobPjZMnJx8iXrN
	 Gj8smAsX5f6Pra5W4w2JVWjM4DcGIQPjOh7xJOVGG0aTFwC7rG9ww8uC2anVEblvS2
	 +IZ/F4OyRO42w==
Date: Thu, 3 Oct 2024 19:54:25 -0500
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: renesas,isp: Add Gen4 family
 fallback
Message-ID: <20241004005425.GA1954012-robh@kernel.org>
References: <20241002103318.24289-1-niklas.soderlund+renesas@ragnatech.se>
 <20241002103318.24289-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002103318.24289-2-niklas.soderlund+renesas@ragnatech.se>

On Wed, Oct 02, 2024 at 12:33:16PM +0200, Niklas Söderlund wrote:
> The ISP Channel Selector IP is the same for all current Gen4 devices.
> This was not known when adding support for V3U and V4H and a single SoC
> specific compatible was used.
> 
> Before adding more SoC specific bindings for V4M add a family compatible
> fallback for Gen4. That way the driver only needs to be updated once for
> Gen4, and we still have the option to fix any problems in the driver if
> any testable differences between the SoCs are found.
> 
> There are already DTS files using the V3U and V4H compatibles which
> needs to be updated to not produce a warning for DTS checks. The driver
> also needs to kept the compatible values to be backward compatible , but
> for new Gen4 SoCs such as V4M we can avoid this.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Changes since v1
> - New in v2.
> ---
>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

