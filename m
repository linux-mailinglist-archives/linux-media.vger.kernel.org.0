Return-Path: <linux-media+bounces-27190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C38A4923C
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8BC03B8338
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8D21C5D78;
	Fri, 28 Feb 2025 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpADyJ06"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9070825;
	Fri, 28 Feb 2025 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727961; cv=none; b=kQgUEkS/iAIcdYOjtBf3Tqt6S38RdqZxUO4P+il5onrRkkTjM6Z/lz/jH+GREzuebzJX+j8MrXpC6oO6QOdKlndBLNNe7wg/QKdxYZTvevI9KUCG1IBhlyJdygMcVfjROhQGtW2duWUrORo89RhMYdulVkLaH1M/L2iI7lWWlAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727961; c=relaxed/simple;
	bh=I8jytzb75Qi0+A1ESLjE19SUja+fI1dYr9q0zM6HwvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXhliEXmX7Ma8bu/uBmljhMzA3Wi/y/O0hcg1DLR1xGz9DmktB82mSVsCxit+WjhHtdW6Vky/55adoSH5M+L0mo2sNcsawCgkGo3HtvcmTLgwlKGyd8VIvHNpo6o8Oz7Aehoo4XAJdEi7BjWG9mPfBfQ3CZ3azHmPInHdpmtnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpADyJ06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8165C4CED6;
	Fri, 28 Feb 2025 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740727960;
	bh=I8jytzb75Qi0+A1ESLjE19SUja+fI1dYr9q0zM6HwvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpADyJ06wWk7pKm2WvdLOHTEbJXWtJXGexO4VGh3IDaogkPAIycqHtjVJEZrOG8lQ
	 TpWn+2UwysSlLzXJhla19Glbf5QBJY0IEBJHJVWqLJmHTzRPrDd0hsfh43nPJUx7IQ
	 kFPV4UrqvjvJ8B6umNGRcCl1sqz9/xYen0V+3R0NUj19dR8HyHxjbsx3Zk2YhzbTk9
	 rwQsJ5qfcFk6tmHFrrPZUBagsu/V1hDQo+8e4kJlxQ01+4LkJCB6uhWK5vXFp+DJBG
	 ZqZGLzHz3XPbGO1HMopnoeUNTnGspMcQp++i3ayPY84AMsgwSlBgXrjfTJqhqKextR
	 oc8r/EildMMYw==
Date: Fri, 28 Feb 2025 08:32:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keke Li <keke.li@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v6 03/10] dt-bindings: media: Add
 amlogic,c3-mipi-adapter.yaml
Message-ID: <20250228-transparent-macaque-of-dew-d61ace@krzk-bin>
References: <20250227-c3isp-v6-0-f72e19084d0d@amlogic.com>
 <20250227-c3isp-v6-3-f72e19084d0d@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227-c3isp-v6-3-f72e19084d0d@amlogic.com>

On Thu, Feb 27, 2025 at 03:27:14PM +0800, Keke Li wrote:
> c3-mipi-adapter is used to organize mipi data and
> send raw data to ISP module.
> 
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 111 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 ++
>  2 files changed, 117 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


