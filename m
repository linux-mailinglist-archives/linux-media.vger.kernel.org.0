Return-Path: <linux-media+bounces-20168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCBA9ADE05
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 09:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF112829F5
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607771ABEA8;
	Thu, 24 Oct 2024 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuFMu51G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1FD17B51A;
	Thu, 24 Oct 2024 07:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729755826; cv=none; b=RXKMTFpVuWO7wUd86NiC3Yk+e6U9lECL1mLF/bj21d9xoAathduvPPBIn48x1g4e13OlroPRHceKMVrsf15YnHQaXgQnfBdHTJrKw5UHwUxtuLbsazsO+oyJhQOdgQjVTGBhTcK93vtu+6tDwRm5beeNCGvVnDSaIF04e2aaG8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729755826; c=relaxed/simple;
	bh=xGloYUIr9BnQMqcdFoaA2UZZH0AY/XssM163tcYBg7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZcNBoNbEHVDb13JBFQAuT7mIMe/L9NG3ayvf2Qb7wTXeP6RXFVkQcBq5420R4jf0D9de0f0HAV8Ei6lGM1awcjE+W3/sjNoNC13wN607L/Jue2rMDpOSxuEpObd4QLL7ODsYVX5mDAMvJ9vgrw50M4ZhmXyma4lHYiCHBEg0gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuFMu51G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF3EC4CEC7;
	Thu, 24 Oct 2024 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755826;
	bh=xGloYUIr9BnQMqcdFoaA2UZZH0AY/XssM163tcYBg7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuFMu51GRf+YOj2DUrc/ayF2QplfjPci809MRlf9K4RsquoAf8K6vjb8JBtxZMm7n
	 6pR5d6zyGm8bqV3J6uU+BTLycfmZWao+vPxjcu1Zy44CblEV1sWze0yX7bTluYyX1c
	 Oqu1vpRnbJUM6G6PxZo4UWhfB71jczq1WpTBFyzLlqBlRDQrIIcIZkdkzTolobZVvh
	 pCrD3p0ePeZAg3NqwDk6/zEr4NZFfOh3zsPXimr7CM5V1wWJjiMYToIsW40bO7aOHg
	 85I2y0LOO0Hy6tXMLFuUzyIs9mWWyyq+/eH8aj+QmF1aLTxGZnfQfNwBY7Yj8w8MWf
	 9hB0VWMJo2fKA==
Date: Thu, 24 Oct 2024 09:43:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, lars@metafoo.de, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 3/3] ARM: dts: imx6qdl-apalis: Change to
 "adi,force-bt656-4"
Message-ID: <5qukgvhiszyyqoetl7go47qen27uwnq5mhgwz4lejdgyhyupkb@i2dre4tovzqh>
References: <20241023144206.1099622-1-festevam@gmail.com>
 <20241023144206.1099622-3-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023144206.1099622-3-festevam@gmail.com>

On Wed, Oct 23, 2024 at 11:42:06AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to adv7180.yaml, the correct property name is
> "adi,force-bt656-4".
> 
> Update it accordingly to fix several dt-schema warnings:
> 
> adv7280@21: 'adv,force-bt656-4' does not match any of the regexes: ...
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

This will affect other users of this DTS, which we try to avoid. Some
sort of analysis if this is used in BSD would be useful.

Best regards,
Krzysztof


