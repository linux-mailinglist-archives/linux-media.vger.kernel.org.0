Return-Path: <linux-media+bounces-17982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF88971502
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 897641C21A6F
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 10:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D9C1B3725;
	Mon,  9 Sep 2024 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u89lg+0X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C471B1AD3EF;
	Mon,  9 Sep 2024 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725876848; cv=none; b=PWrmmpGG0G78Y/snDLCRtwGj5Nk/djBC6N491RinCSkBxCtpdZfbOmRE37YtJqj/rMNcuy2hZrgpJL+00CU/0uLGiFipIFhmde3c4qxby6nXcPzyTOt67QstK7Vx3kyrkaJSMdcV2T8ENBh7m+8yXdB4ttOvP0yzYQl49Wpp4wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725876848; c=relaxed/simple;
	bh=C3FfEDeUMW2wAtWgA8vW3kCinbXQQw3brd5AvpKXXog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ie094nlvVVxYiCOrOkN8yF1RSCtdN9Auu2K/V/5H+zGzTxifdF80XxtYy5sFLVWCNNNuHA+wKp6DI+ukbM74xZJDnzb74bgqdyoN6GQ6RyHPwM/NE3Bn6965PZwB2w/V288XDlr6B7/Tv7Z9g/NFvm4gyJZoTs/dZ7oCn3JEw2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u89lg+0X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36332C4CEC5;
	Mon,  9 Sep 2024 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725876848;
	bh=C3FfEDeUMW2wAtWgA8vW3kCinbXQQw3brd5AvpKXXog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u89lg+0Xnh337Zeqh6DGljNdeOPJk1yv9IioLgH8RVx7yIBQABFPNS2xG1kInS3eZ
	 gfwVK+0djr9cJBypyBAZu362Gm3GvSAM3Yx0iN3BAbhnXeqIRH5xauod8Xfb4ovi0+
	 +Zltzzf7YV008tuZWI8cgCpt8YVAIlc+Ffjri3wZ+SmqbStfdftewICfby1WaitUZk
	 4chF/0QbHunX0sh7r1my5Kya1TYDQDenaTETcQLTjY22uUCI1koc8M64ASOqf+kG/P
	 ZdR4fsTYesFqrO7CQnrBE+qO2n6cj0VIl73K1SmvWC8cmTPFLStYmrjK8Hucn17KkJ
	 JjWX3jniphVQw==
Date: Mon, 9 Sep 2024 12:14:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keke Li <keke.li@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v2 1/9] dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
Message-ID: <df2aqentj2efmcyw4f7tsskc6jcfd3qlyntrntrycdwfjwixg3@s57cd22cd5z2>
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
 <20240909-c3isp-v2-1-3c866a1cea56@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909-c3isp-v2-1-3c866a1cea56@amlogic.com>

On Mon, Sep 09, 2024 at 03:24:11PM +0800, Keke Li wrote:
> c3-mipi-csi2 is used to receive mipi data from image sensor.
> 
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 124 +++++++++++++++++++++
>  1 file changed, 124 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


