Return-Path: <linux-media+bounces-20167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A109ADDEE
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 09:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 689AC282801
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0271AB508;
	Thu, 24 Oct 2024 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGahbl+l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4572317B51A;
	Thu, 24 Oct 2024 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729755727; cv=none; b=tY8dw+5+WgvQ2pt6YWb5s60obaGlWN9DHwc40s9vaeOBXeZErj5QrkOEVaEBSk8XysT2Ks9LPZVIzqNcSglCW/GsQ9dBhYdBVKwdpOlFkT5rcVji0liE2yq96x/sgRclf6T9LMlM+3FjOS2gb2ycgKqeb/1thkKcNu6uxedoGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729755727; c=relaxed/simple;
	bh=akMjWLE8qYGttquQCblw2DikoT+w3bJja6jPMKFBvB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQM5CijTDCQ1nai/gDQsWfWpSA+2m9VkkxrdI/dSZoxsRR8zZCmtWaZ+YMmHHk9tp7YCYeLmjO//LYhTYlTKMgOj7xaDU/SFz2GvP3o6fI8ZrXPE/YSWCs1HgrrasuE1jRpVMPl+TKuBu1ylODcPw86IOfpfa1gq68d6UbkjB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGahbl+l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85180C4CEC7;
	Thu, 24 Oct 2024 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755726;
	bh=akMjWLE8qYGttquQCblw2DikoT+w3bJja6jPMKFBvB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGahbl+leH5V6GGOLqdl4wpjv9iNL1RxGUQsrdj6ydm3EERGe8QNKiE20M6flvRoY
	 +G/Emgrpj6rhR7buOAfOPoWCVwma1KzoM8jUKwAPGpGuv0QDrWUXpjvzys/oZ9t/IM
	 CC23IKZ1vpFZ+YLwXfiRY2s35yo9mcMqNNap42ghTdphQHs0Ju5+tN3uBwtPkknNXj
	 j4Lfr/VsXjGygl/BKv/FK3e3Nwa4GCcdsqqCe/borDu7S97a7DDQAPbndgE1v7Mr/D
	 uaFhSRI0iT4EdwzWZbb9SORorNy2L7Ic2Gm8C4LNZeqCBDerw9z48NOb8kBejkmlAm
	 6/1hPqX6QJ2GA==
Date: Thu, 24 Oct 2024 09:42:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, lars@metafoo.de, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/3] media: adv7180: Also check for "adi,force-bt656-4"
Message-ID: <fqrusqlrvdl3hcvm6ogxf3baksq5s6ng6xhct7v2slxjtfteuo@ipllmg3444dg>
References: <20241023144206.1099622-1-festevam@gmail.com>
 <20241023144206.1099622-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023144206.1099622-2-festevam@gmail.com>

On Wed, Oct 23, 2024 at 11:42:05AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to adv7180.yaml, the correct property name is
> "adi,force-bt656-4".
> 
> Expand the check to also test against the "adi,force-bt656-4" compatible
> string.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


